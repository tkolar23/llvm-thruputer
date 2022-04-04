//===-- ThruVLIWPacketizer.cpp - Thru Subtarget Information --------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This implements a simple VLIW packetizer using DFA. The packetizer works on
// machine basic blocks. For each instruction I in BB, the packetizer consults
// the DFA to see if machine resources are available to execute I. If so, the
// packetizer checks if I depends on any instruction J in the current packet.
// If no dependency is found, I is added to current packet and machine resource
// is marked as taken. If any dependency is found, a target API call is made to
// prune the dependence.
//
//
//===----------------------------------------------------------------------===//

#include "ThruVLIWPacketizer.h"
#include "Thru.h"
#include "ThruInstrInfo.h"
#include "ThruRegisterInfo.h"
#include "ThruSubtarget.h"
#include "llvm/ADT/BitVector.h"
#include "llvm/ADT/DenseSet.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/CodeGen/MachineBasicBlock.h"
#include "llvm/CodeGen/MachineBranchProbabilityInfo.h"
#include "llvm/CodeGen/MachineDominators.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineInstrBundle.h"
#include "llvm/CodeGen/MachineLoopInfo.h"
#include "llvm/CodeGen/MachineOperand.h"
#include "llvm/CodeGen/ScheduleDAG.h"
#include "llvm/CodeGen/TargetRegisterInfo.h"
#include "llvm/CodeGen/TargetSubtargetInfo.h"
#include "llvm/IR/DebugLoc.h"
#include "llvm/InitializePasses.h"
#include "llvm/MC/MCInstrDesc.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"
#include <cassert>
#include <cstdint>
#include <iterator>

using namespace llvm;

#define DEBUG_TYPE "packetizer"

namespace llvm {

    FunctionPass *createThruPacketizer();
    void initializeThruPacketizerPass(PassRegistry&);

} // end namespace llvm

//anonymous namespace, only viewable within file
namespace {
    class ThruPacketizer : public MachineFunctionPass {
    public:
        static char ID;

        ThruPacketizer() : MachineFunctionPass(ID) {}

        void getAnalysisUsage(AnalysisUsage &AU) const override {
            AU.setPreservesCFG();
            AU.addRequired<AAResultsWrapperPass>();
            //AU.addRequired<MachineBranchProbabilityInfo>();
            AU.addRequired<MachineDominatorTree>();
            AU.addRequired<MachineLoopInfo>();
            AU.addPreserved<MachineDominatorTree>();
            AU.addPreserved<MachineLoopInfo>();
            MachineFunctionPass::getAnalysisUsage(AU);
        }

        StringRef getPassName() const override { return "ThruPuter Packetizer"; }

        bool runOnMachineFunction(MachineFunction &MF) override;

    private:
        const ThruInstrInfo *TII = nullptr;
        const ThruRegisterInfo *TRI = nullptr;
    };
} // end anonymous namespace

char ThruPacketizer::ID = 0;

INITIALIZE_PASS_BEGIN(ThruPacketizer, "thru-packetizer", "ThruPuter Packetizer", false, false)
INITIALIZE_PASS_DEPENDENCY(MachineDominatorTree)
//INITIALIZE_PASS_DEPENDENCY(MachineBranchProbabilityInfo)
INITIALIZE_PASS_DEPENDENCY(MachineLoopInfo)
INITIALIZE_PASS_DEPENDENCY(AAResultsWrapperPass)
INITIALIZE_PASS_END(ThruPacketizer, "thru-packetizer", "ThruPuter Packetizer", false, false)

ThruPacketizerList::ThruPacketizerList(MachineFunction &MF, MachineLoopInfo &MLI, AAResults *AA)
        : VLIWPacketizerList(MF, MLI, AA), MLI(&MLI) {
    TII = MF.getSubtarget<ThruSubtarget>().getInstrInfo();
    TRI = MF.getSubtarget<ThruSubtarget>().getRegisterInfo();

    //addMutation(std::make_unique<HexagonSubtarget::UsrOverflowMutation>());
    //addMutation(std::make_unique<HexagonSubtarget::HVXMemLatencyMutation>());
    //addMutation(std::make_unique<HexagonSubtarget::BankConflictMutation>());
}

bool ThruPacketizer::runOnMachineFunction(MachineFunction &MF) {

    auto &TST = MF.getSubtarget<ThruSubtarget>();
    TII = TST.getInstrInfo();
    TRI = TST.getRegisterInfo();
    auto &MLI = getAnalysis<MachineLoopInfo>();
    auto *AA = &getAnalysis<AAResultsWrapperPass>().getAAResults();

    ThruPacketizerList Packetizer(MF, MLI, AA);

    //loop through all BBs and packetize MIs within
    for (auto &MB : MF) {
        //print contents of MBB and BB before any kind of packetization
        LLVM_DEBUG({
               outs() << "Contents of MachineBB:\n";
               outs() << MB << "\n";

               const BasicBlock *BB = MB.getBasicBlock();
               outs() << "Contents of BB corresponding to MBB:\n";
               outs() << *BB << "\n";
       });

        auto Begin = MB.begin(), End = MB.end();
        while (Begin != End) {
            // Find the first non-boundary starting from the end of the last scheduling region.
            MachineBasicBlock::iterator RB = Begin;
            while (RB != End && TII->isSchedulingBoundary(*RB, &MB, MF))
                ++RB;
            // Find the first boundary starting from the beginning of the new region.
            MachineBasicBlock::iterator RE = RB;
            while (RE != End && !TII->isSchedulingBoundary(*RE, &MB, MF))
                ++RE;
            // Add the scheduling boundary if it's not the end of the MBB
            if (RE != End)
                ++RE;
            // If RB == End, then RE == End.
            if (RB != End)
                Packetizer.PacketizeMIs(&MB, RB, RE);

            Begin = RE;
        }
        
        LLVM_DEBUG({
               outs() << "MachineBB after Packetization:\n";
               outs() << MB << "\n";
       });
    }

    return true; //function was modified so return true
}

//check if instruction is of a type that cannot be packetized
bool ThruPacketizerList::isSoloInstruction(const MachineInstr &MI) {
    if (MI.isBundle())
        return true;

    return false;
}

// SUI is the current instruction that is out side of the current packet.
// SUJ is the current instruction inside the current packet against which that
// SUI will be packetized.
bool ThruPacketizerList::isLegalToPacketizeTogether(SUnit *SUI, SUnit *SUJ) {
    //Check for Data dependencies between SUJ and SUI
    return true;
}

//===----------------------------------------------------------------------===//
//                         Public Constructor Functions
//===----------------------------------------------------------------------===//
FunctionPass *llvm::createThruPacketizer() {
    return new ThruPacketizer();
}



