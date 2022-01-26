//===-- ThruMCTargetDesc.cpp - Thru Target Descriptions -----------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// This file provides Thru-specific target descriptions.
///
//===----------------------------------------------------------------------===//

#include "ThruMCTargetDesc.h"
// #include "ThruBaseInfo.h"
// #include "ThruELFStreamer.h"
// #include "ThruInstPrinter.h"
// #include "ThruMCAsmInfo.h"
// #include "ThruMCObjectFileInfo.h"
// #include "ThruTargetStreamer.h"
#include "TargetInfo/ThruTargetInfo.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/MC/MCAsmBackend.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCCodeEmitter.h"
#include "llvm/MC/MCInstrAnalysis.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCObjectFileInfo.h"
#include "llvm/MC/MCObjectWriter.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Support/ErrorHandling.h"

// #define GET_INSTRINFO_MC_DESC
// #include "ThruGenInstrInfo.inc"

// #define GET_REGINFO_MC_DESC
// #include "ThruGenRegisterInfo.inc"

// #define GET_SUBTARGETINFO_MC_DESC
// #include "ThruGenSubtargetInfo.inc"

using namespace llvm;

// static MCInstrInfo *createThruMCInstrInfo() {
//   MCInstrInfo *X = new MCInstrInfo();
//   InitThruMCInstrInfo(X);
//   return X;
// }

// static MCRegisterInfo *createThruMCRegisterInfo(const Triple &TT) {
//   MCRegisterInfo *X = new MCRegisterInfo();
//   InitThruMCRegisterInfo(X, Thru::X1);
//   return X;
// }

// static MCAsmInfo *createThruMCAsmInfo(const MCRegisterInfo &MRI,
//                                        const Triple &TT,
//                                        const MCTargetOptions &Options) {
//   MCAsmInfo *MAI = new ThruMCAsmInfo(TT);

//   MCRegister SP = MRI.getDwarfRegNum(Thru::X2, true);
//   MCCFIInstruction Inst = MCCFIInstruction::cfiDefCfa(nullptr, SP, 0);
//   MAI->addInitialFrameState(Inst);

//   return MAI;
// }

// static MCObjectFileInfo *
// createThruMCObjectFileInfo(MCContext &Ctx, bool PIC,
//                             bool LargeCodeModel = false) {
//   MCObjectFileInfo *MOFI = new ThruMCObjectFileInfo();
//   MOFI->initMCObjectFileInfo(Ctx, PIC, LargeCodeModel);
//   return MOFI;
// }

// static MCSubtargetInfo *createThruMCSubtargetInfo(const Triple &TT,
//                                                    StringRef CPU, StringRef FS) {
//   if (CPU.empty())
//     CPU = TT.isArch64Bit() ? "generic-rv64" : "generic-rv32";
//   if (CPU == "generic")
//     report_fatal_error(Twine("CPU 'generic' is not supported. Use ") +
//                        (TT.isArch64Bit() ? "generic-rv64" : "generic-rv32"));
//   return createThruMCSubtargetInfoImpl(TT, CPU, /*TuneCPU*/ CPU, FS);
// }

// static MCInstPrinter *createThruMCInstPrinter(const Triple &T,
//                                                unsigned SyntaxVariant,
//                                                const MCAsmInfo &MAI,
//                                                const MCInstrInfo &MII,
//                                                const MCRegisterInfo &MRI) {
//   return new ThruInstPrinter(MAI, MII, MRI);
// }

// static MCTargetStreamer *
// createThruObjectTargetStreamer(MCStreamer &S, const MCSubtargetInfo &STI) {
//   const Triple &TT = STI.getTargetTriple();
//   if (TT.isOSBinFormatELF())
//     return new ThruTargetELFStreamer(S, STI);
//   return nullptr;
// }

// static MCTargetStreamer *createThruAsmTargetStreamer(MCStreamer &S,
//                                                       formatted_raw_ostream &OS,
//                                                       MCInstPrinter *InstPrint,
//                                                       bool isVerboseAsm) {
//   return new ThruTargetAsmStreamer(S, OS);
// }

// static MCTargetStreamer *createThruNullTargetStreamer(MCStreamer &S) {
//   return new ThruTargetStreamer(S);
// }

// namespace {

// class ThruMCInstrAnalysis : public MCInstrAnalysis {
// public:
//   explicit ThruMCInstrAnalysis(const MCInstrInfo *Info)
//       : MCInstrAnalysis(Info) {}

//   bool evaluateBranch(const MCInst &Inst, uint64_t Addr, uint64_t Size,
//                       uint64_t &Target) const override {
//     if (isConditionalBranch(Inst)) {
//       int64_t Imm;
//       if (Size == 2)
//         Imm = Inst.getOperand(1).getImm();
//       else
//         Imm = Inst.getOperand(2).getImm();
//       Target = Addr + Imm;
//       return true;
//     }

//     if (Inst.getOpcode() == Thru::C_JAL || Inst.getOpcode() == Thru::C_J) {
//       Target = Addr + Inst.getOperand(0).getImm();
//       return true;
//     }

//     if (Inst.getOpcode() == Thru::JAL) {
//       Target = Addr + Inst.getOperand(1).getImm();
//       return true;
//     }

//     return false;
//   }
// };

// } // end anonymous namespace

// static MCInstrAnalysis *createThruInstrAnalysis(const MCInstrInfo *Info) {
//   return new ThruMCInstrAnalysis(Info);
// }

// namespace {
// MCStreamer *createThruELFStreamer(const Triple &T, MCContext &Context,
//                                    std::unique_ptr<MCAsmBackend> &&MAB,
//                                    std::unique_ptr<MCObjectWriter> &&MOW,
//                                    std::unique_ptr<MCCodeEmitter> &&MCE,
//                                    bool RelaxAll) {
//   return createThruELFStreamer(Context, std::move(MAB), std::move(MOW),
//                                 std::move(MCE), RelaxAll);
// }
// } // end anonymous namespace

extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeThruTargetMC() {
  for (Target *T : {&getTheThruTarget()}) {
  }
}
