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
#include "TargetInfo/ThruTargetInfo.h"
#include "llvm/MC/TargetRegistry.h"
// #include "MCTargetDesc/ThruBaseInfo.h"
#include "Thru.h"
// #include "ThruTargetObjectFile.h"
// #include "ThruTargetTransformInfo.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/Analysis/TargetTransformInfo.h"
#include "llvm/CodeGen/GlobalISel/IRTranslator.h"
#include "llvm/CodeGen/GlobalISel/InstructionSelect.h"
#include "llvm/CodeGen/GlobalISel/Legalizer.h"
#include "llvm/CodeGen/GlobalISel/RegBankSelect.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/TargetLoweringObjectFileImpl.h"
#include "llvm/CodeGen/TargetPassConfig.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/InitializePasses.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Target/TargetOptions.h"
using namespace llvm;

extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeThruTarget() {
  extern Target TheThruTarget;
  // Helper template for registering a target machine implementation
  RegisterTargetMachine<ThruTargetMachine> X(getTheThruTarget());
}

static StringRef computeDataLayout(const Triple &TT) {
  return "e-m:e-p:32:32-i64:64-n32-S128";
}
