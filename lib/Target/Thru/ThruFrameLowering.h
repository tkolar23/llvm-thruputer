//===-- ThruFrameLowering.h - Define frame lowering for Thru --*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
//
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_THRU_THRUFRAMELOWERING_H
#define LLVM_LIB_TARGET_THRU_THRUFRAMELOWERING_H

#include "Thru.h"
#include "llvm/CodeGen/TargetFrameLowering.h"
#include "llvm/Support/TypeSize.h"

namespace llvm {

class ThruSubtarget;
class ThruFrameLowering : public TargetFrameLowering {
public:
  explicit ThruFrameLowering(const ThruSubtarget &ST);
};

} // End llvm namespace

#endif
