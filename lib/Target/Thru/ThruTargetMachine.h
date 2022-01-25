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
#include "llvm/CodeGen/SelectionDAGTargetInfo.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/Target/TargetMachine.h"

namespace llvm {
class ThruTargetMachine : public LLVMTargetMachine {
  std::unique_ptr<TargetLoweringObjectFile> TLOF;
  // mutable StringMap<std::unique_ptr<ThruSubtarget>> SubtargetMap;

public:
  // ThruTargetMachine(const Target &T, const Triple &TT, StringRef CPU,
  //                    StringRef FS, const TargetOptions &Options,
  //                    Optional<Reloc::Model> RM, Optional<CodeModel::Model> CM,
  //                    CodeGenOpt::Level OL, bool JIT);

  // const ThruSubtarget *getSubtargetImpl(const Function &F) const override;
  // // DO NOT IMPLEMENT: There is no such thing as a valid default subtarget,
  // // subtargets are per-function entities based on the target-specific
  // // attributes of each function.
  // const ThruSubtarget *getSubtargetImpl() const = delete;

  // TargetPassConfig *createPassConfig(PassManagerBase &PM) override;

  // TargetLoweringObjectFile *getObjFileLowering() const override {
  //   return TLOF.get();
  // }

  // TargetTransformInfo getTargetTransformInfo(const Function &F) override;

  // virtual bool isNoopAddrSpaceCast(unsigned SrcAS,
  //                                  unsigned DstAS) const override;
};
} // namespace llvm

#endif
