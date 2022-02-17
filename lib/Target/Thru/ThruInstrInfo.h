//===-- ThruInstrInfo.h - Thru Instruction Information ----------*- C++ -*-===//
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

#ifndef LLVM_LIB_TARGET_THRU_THRUINSTRINFO_H
#define LLVM_LIB_TARGET_THRU_THRUINSTRINFO_H

#include "Thru.h"
#include "ThruRegisterInfo.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/TargetInstrInfo.h"

#define GET_INSTRINFO_HEADER
#include "ThruGenInstrInfo.inc"

namespace llvm {

class ThruInstrInfo : public ThruGenInstrInfo {
public:
  explicit ThruInstrInfo(const ThruSubtarget &STI);

protected:
  const ThruSubtarget &Subtarget;
};
}

#endif // end LLVM_LIB_TARGET_THRU_THRUINSTRINFO_H