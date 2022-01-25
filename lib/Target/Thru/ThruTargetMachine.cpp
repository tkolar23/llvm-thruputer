//===-- ThruTargetMachine.cpp - Define TargetMachine for Thru -----------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// Implements the info about Thru target spec.
//
//===----------------------------------------------------------------------===//

#include "ThruTargetMachine.h"
#include "llvm/MC/TargetRegistry.h"
using namespace llvm;

extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeRISCVTarget() {
  RegisterTargetMachine<ThruTargetMachine> X(getTheThruTarget());
}
