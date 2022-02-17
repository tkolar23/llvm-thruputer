//===-- ThruSubtarget.cpp - Thru Subtarget Information --------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements the Thru specific subclass of TargetSubtargetInfo.
//
//===----------------------------------------------------------------------===//

#include "Thru.h"
#include "ThruSubtarget.h"
#include "ThruMachineFunction.h"
#include "ThruRegisterInfo.h"
#include "ThruTargetMachine.h"
#include "llvm/IR/Attributes.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/MC/TargetRegistry.h"

using namespace llvm;

#define DEBUG_TYPE "thru-subtarget"

#define GET_SUBTARGETINFO_TARGET_DESC
#define GET_SUBTARGETINFO_CTOR
#include "ThruGenSubtargetInfo.inc"

ThruSubtarget::ThruSubtarget(const Triple &TT, StringRef CPU,
                               StringRef TuneCPU, StringRef FS,
                               StringRef ABIName, const TargetMachine &TM)
    : ThruGenSubtargetInfo(TT, CPU, CPU, FS),
      TSInfo(),
      InstrInfo(initializeSubtargetDependencies(TT, CPU, FS, TM)),
      FrameLowering(*this),
      TLInfo(TM, *this),
      RegInfo(*this) { }


ThruSubtarget &
ThruSubtarget::initializeSubtargetDependencies(const Triple &TT, StringRef CPU,
                                                StringRef FS,
                                                const TargetMachine &TM) {
  if (CPU.empty())
    CPU = "generic";

  // Parse features string.
  ParseSubtargetFeatures(CPU, CPU, FS);

  return *this;
}