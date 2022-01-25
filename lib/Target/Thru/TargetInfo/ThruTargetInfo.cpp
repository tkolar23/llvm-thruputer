//===-- ThruTargetInfo.cpp - Thru Target Implementation -----------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "TargetInfo/ThruTargetInfo.h"
#include "llvm/MC/TargetRegistry.h"
using namespace llvm;

Target &llvm::getTheThruTarget() {
  static Target TheThruTarget;
  return TheThruTarget;
}

extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeRISCVTargetInfo() {
  RegisterTarget<Triple::thru> X(getTheThruTarget(), "thru",
                                    "ThruPuter", "Thru");
}
