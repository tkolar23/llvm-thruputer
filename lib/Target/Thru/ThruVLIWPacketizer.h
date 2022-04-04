//===-- ThruVLIWPacketizer.h - Define VLIW Packetizer for the Thru -------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file declares the Thru VLIW Packetizer pass
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_THRU_THRUVLIWPACKETIZER_H
#define LLVM_LIB_TARGET_THRU_THRUVLIWPACKETIZER_H

#include "llvm/CodeGen/DFAPacketizer.h"
#include "llvm/CodeGen/MachineBasicBlock.h"
#include "llvm/CodeGen/ScheduleDAG.h"
#include <vector>

namespace llvm {

class ThruInstrInfo;
class ThruRegisterInfo;
class MachineBranchProbabilityInfo;
class MachineFunction;
class MachineInstr;
class MachineLoopInfo;
class TargetRegisterClass;

class ThruPacketizerList : public VLIWPacketizerList {
protected:
    /// A handle to the branch probability pass.
    //const MachineBranchProbabilityInfo *MBPI;
    const MachineLoopInfo *MLI;

private:
    const ThruInstrInfo *TII;
    const ThruRegisterInfo *TRI;

public:
    ThruPacketizerList(MachineFunction &MF, MachineLoopInfo &MLI, AAResults *AA);

    // isSoloInstruction - return true if instruction MI can not be packetized
    // with any other instruction, which means that MI itself is a packet.
    bool isSoloInstruction(const MachineInstr &MI) override;

    // isLegalToPacketizeTogether - Is it legal to packetize SUI and SUJ
    // together.
    bool isLegalToPacketizeTogether(SUnit *SUI, SUnit *SUJ) override;

    //MachineBasicBlock::iterator addToPacket(MachineInstr &MI) override;

    //void endPacket(MachineBasicBlock *MBB, MachineBasicBlock::iterator endMI) override;
};
    
} //end namespace llvm

#endif // LLVM_LIB_TARGET_THRU_THRUVLIWPACKETIZER_H
