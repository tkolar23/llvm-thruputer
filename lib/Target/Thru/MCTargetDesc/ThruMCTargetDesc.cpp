//===-- ThruMCTargetDesc.cpp - Thru Target Descriptions -----------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file provides Thru specific target descriptions.
//
//===----------------------------------------------------------------------===//

#include "ThruMCTargetDesc.h"
#include "ThruInstPrinter.h"
#include "ThruMCAsmInfo.h"
#include "TargetInfo/ThruTargetInfo.h"
#include "llvm/MC/MCELFStreamer.h"
#include "llvm/MC/MCInstrAnalysis.h"
#include "llvm/MC/MCInstPrinter.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/MC/TargetRegistry.h"

using namespace llvm;

#define GET_INSTRINFO_MC_DESC
#include "ThruGenInstrInfo.inc"

#define GET_SUBTARGETINFO_MC_DESC
#include "ThruGenSubtargetInfo.inc"

#define GET_REGINFO_MC_DESC
#include "ThruGenRegisterInfo.inc"

static MCInstrInfo *createThruMCInstrInfo() {
  MCInstrInfo *X = new MCInstrInfo();
  InitThruMCInstrInfo(X);
  return X;
}

static MCRegisterInfo *createThruMCRegisterInfo(const Triple &TT) {
  MCRegisterInfo *X = new MCRegisterInfo();
  InitThruMCRegisterInfo(X, Thru::X1);
  return X;
}

static MCAsmInfo *createThruMCAsmInfo(const MCRegisterInfo &MRI,
                                       const Triple &TT,
                                       const MCTargetOptions &Options) {
  MCAsmInfo *MAI = new ThruMCAsmInfo(TT);

  MCRegister SP = MRI.getDwarfRegNum(Thru::X2, true);
  MCCFIInstruction Inst = MCCFIInstruction::cfiDefCfa(nullptr, SP, 0);
  MAI->addInitialFrameState(Inst);

  return MAI;
}

static MCSubtargetInfo *
createThruMCSubtargetInfo(const Triple &TT, StringRef CPU, StringRef FS) {
  if (CPU.empty())
    CPU = "generic";
  return createThruMCSubtargetInfoImpl(TT, CPU, /*TuneCPU*/ CPU, FS);
}

static MCInstPrinter *createThruMCInstPrinter(const Triple &T,
                                               unsigned SyntaxVariant,
                                               const MCAsmInfo &MAI,
                                               const MCInstrInfo &MII,
                                               const MCRegisterInfo &MRI) {
  return new ThruInstPrinter(MAI, MII, MRI);
}

extern "C" void LLVMInitializeThruTargetMC() {
  for (Target *T : {&getTheThruTarget()}) {
    // Register the MC instruction info.
    TargetRegistry::RegisterMCInstrInfo(*T, createThruMCInstrInfo);
    // Register the MC register info.
    TargetRegistry::RegisterMCRegInfo(*T, createThruMCRegisterInfo);
    // Register the MC asm info.
    TargetRegistry::RegisterMCAsmInfo(*T, createThruMCAsmInfo);
    // Register the MC subtarget info.
    TargetRegistry::RegisterMCSubtargetInfo(*T, createThruMCSubtargetInfo);
    // Register the MCInstPrinter.
    TargetRegistry::RegisterMCInstPrinter(*T, createThruMCInstPrinter);
  }
}
