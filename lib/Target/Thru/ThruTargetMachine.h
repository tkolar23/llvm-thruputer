//===-- ThruTargetMachine.h - Define TargetMachine for Thru ---*- C++ -*-===//
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

#ifndef LLVM_LIB_TARGET_THRU_THRUTARGETMACHINE_H
#define LLVM_LIB_TARGET_THRU_THRUTARGETMACHINE_H

// #include "MCTargetDesc/ThruMCTargetDesc.h"
// #include "ThruSubtarget.h"
// #include "llvm/CodeGen/SelectionDAGTargetInfo.h"
// #include "llvm/IR/DataLayout.h"
#include "llvm/Target/TargetMachine.h"

namespace llvm {
class ThruTargetMachine : public LLVMTargetMachine {

public:
  ThruTargetMachine(const Target &T, const Triple &TT,
                    StringRef CPU, StringRef FS,
                    const TargetOptions &Options,
                    Optional<Reloc::Model> RM,
                    Optional<CodeModel::Model> CM,
                    CodeGenOpt::Level OL, bool JIT);
  ~ThruTargetMachine() override;
};
} // end namespace llvm

#endif
