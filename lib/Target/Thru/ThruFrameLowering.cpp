//===-- ThruFrameLowering.cpp - Thru Frame Information ------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the Thru implementation of TargetFrameLowering class.
//
//===----------------------------------------------------------------------===//

#include "ThruFrameLowering.h"
// #include "ThruInstrInfo.h"
// #include "ThruMachineFunctionInfo.h"
#include "ThruSubtarget.h"
// #include "llvm/CodeGen/MachineFrameInfo.h"
// #include "llvm/CodeGen/MachineFunction.h"
// #include "llvm/CodeGen/MachineInstrBuilder.h"
// #include "llvm/CodeGen/MachineModuleInfo.h"
// #include "llvm/CodeGen/MachineRegisterInfo.h"
// #include "llvm/IR/DataLayout.h"
// #include "llvm/IR/Function.h"
// #include "llvm/Support/CommandLine.h"
// #include "llvm/Target/TargetOptions.h"

using namespace llvm;

ThruFrameLowering::ThruFrameLowering(const ThruSubtarget &ST)
    : TargetFrameLowering(TargetFrameLowering::StackGrowsDown,
                          Align(8), 0,
                          Align(8)) {}
