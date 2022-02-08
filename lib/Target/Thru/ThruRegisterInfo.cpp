//===-- ThruRegisterInfo.cpp - Thru Register Information ----------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the Thru implementation of the TargetRegisterInfo class.
//
//===----------------------------------------------------------------------===//

#include "ThruRegisterInfo.h"
#include "Thru.h"
// #include "ThruMachineFunctionInfo.h"
// #include "ThruSubtarget.h"
#include "llvm/ADT/BitVector.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/TargetInstrInfo.h"
#include "llvm/IR/Type.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ErrorHandling.h"

using namespace llvm;

#define GET_REGINFO_ENUM
#define GET_REGINFO_MC_DESC
#define GET_REGINFO_TARGET_DESC
#include "ThruGenRegisterInfo.inc"

ThruRegisterInfo::ThruRegisterInfo() : ThruGenRegisterInfo(TP::R0) {}
