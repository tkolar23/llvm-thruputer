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
// #include "ThruAsmBackend.h"
// #include "ThruBaseInfo.h"
// #include "ThruELFStreamer.h"
// #include "ThruInstPrinter.h"
// #include "ThruMCAsmInfo.h"
// #include "ThruMCNaCl.h"
// #include "ThruTargetStreamer.h"
#include "TargetInfo/ThruTargetInfo.h"
#include "llvm/ADT/Triple.h"
#include "llvm/MC/MCCodeEmitter.h"
#include "llvm/MC/MCELFStreamer.h"
#include "llvm/MC/MCInstrAnalysis.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCObjectWriter.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/MC/MachineLocation.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/FormattedStream.h"

#define GET_INSTRINFO_MC_DESC
#include "ThruGenInstrInfo.inc"

using namespace llvm;

extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeThruTargetMC() {
  for (Target *T : {&getTheThruTarget()}) { }
}
