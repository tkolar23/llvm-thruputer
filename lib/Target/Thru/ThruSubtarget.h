//===-- ThruSubtarget.h - Define Subtarget for the Thru -------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file declares the Thru specific subclass of TargetSubtargetInfo.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_THRU_THRUSUBTARGET_H
#define LLVM_LIB_TARGET_THRU_THRUSUBTARGET_H

#include "ThruFrameLowering.h"
// #include "ThruISelLowering.h"
// #include "ThruInstrInfo.h"
#include "llvm/ADT/Triple.h"
#include "llvm/CodeGen/SelectionDAGTargetInfo.h"
#include "llvm/CodeGen/TargetSubtargetInfo.h"
#include "llvm/IR/DataLayout.h"
#include <string>

#define GET_SUBTARGETINFO_HEADER
#include "ThruGenSubtargetInfo.inc"

namespace llvm {
class StringRef;

class ThruSubtarget : public ThruGenSubtargetInfo {
  virtual void anchor();
  Triple TargetTriple;
  // ThruFrameLowering FrameLowering;

public:
  ThruSubtarget(const Triple &TT, const std::string &CPU,
                const std::string &FS, const TargetMachine &TM, bool is64bit);

  const TargetFrameLowering *getFrameLowering() const override {
    return nullptr;
  }

};

} // end namespace llvm

#endif
