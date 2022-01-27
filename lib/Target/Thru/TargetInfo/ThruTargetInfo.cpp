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

// Global target instance getter
Target &llvm::getTheThruTarget() {
  static Target TheThruTarget;
  return TheThruTarget;
}

extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeThruTargetInfo() {
  // Helper template for registering a target
  RegisterTarget<Triple::thru> X(getTheThruTarget(), "thru", "ThruPuter machine", "Thru");
}
