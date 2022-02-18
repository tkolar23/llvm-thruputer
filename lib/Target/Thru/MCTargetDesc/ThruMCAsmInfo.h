//===-- ThruMCAsmInfo.h - Thru Asm Info ------------------------*- C++ -*--===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the declaration of the ThruMCAsmInfo class.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_THRU_MCTARGETDESC_THRUMCASMINFO_H
#define LLVM_LIB_TARGET_THRU_MCTARGETDESC_THRUMCASMINFO_H

#include "llvm/MC/MCAsmInfoELF.h"

namespace llvm {
  class Triple;

class ThruMCAsmInfo : public MCAsmInfoELF {
  void anchor() override;

public:
  explicit ThruMCAsmInfo(const Triple &TargetTriple);
};

} // namespace llvm

#endif // end LLVM_LIB_TARGET_THRU_MCTARGETDESC_THRUMCASMINFO_H
