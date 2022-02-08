//===-- ThruRegisterInfo.h - Thru Register Information Impl ---*- C++ -*-===//
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

#ifndef LLVM_LIB_TARGET_THRU_THRUREGISTERINFO_H
#define LLVM_LIB_TARGET_THRU_THRUREGISTERINFO_H

#include "llvm/CodeGen/TargetRegisterInfo.h"

#define GET_REGINFO_HEADER
#include "ThruGenRegisterInfo.inc"

namespace llvm {
struct ThruRegisterInfo : public ThruGenRegisterInfo {
  ThruRegisterInfo();

};

} // end namespace llvm

#endif
