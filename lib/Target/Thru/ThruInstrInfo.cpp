//===-- ThruInstrInfo.cpp - Thru Instruction Information ----------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the Thru implementation of the TargetInstrInfo class.
//
//===----------------------------------------------------------------------===//

#include "ThruInstrInfo.h"

#include "ThruTargetMachine.h"
#include "ThruMachineFunction.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Support/Debug.h"

using namespace llvm;

#define DEBUG_TYPE "thru-instrinfo"

#define GET_INSTRINFO_CTOR_DTOR
#include "ThruGenInstrInfo.inc"

ThruInstrInfo::ThruInstrInfo(const ThruSubtarget &STI)
    : ThruGenInstrInfo(Thru::ADJCALLSTACKDOWN, Thru::ADJCALLSTACKUP),
      Subtarget(STI)
{
}