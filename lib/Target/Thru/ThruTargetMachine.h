//===-- ThruTargetMachine.h - Define TargetMachine for RISCV ---*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file declares the Thru specific subclass of TargetMachine.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_RISCV_RISCVTARGETMACHINE_H
#define LLVM_LIB_TARGET_RISCV_RISCVTARGETMACHINE_H

#include "llvm/Target/TargetMachine.h"

namespace llvm {
class ThruTargetMachine : public LLVMTargetMachine {

}; // end class ThruTargetMachine
} // end namespace llvm;

#endif
