//===-- ThruSubtarget.cpp - Thru Subtarget Information ------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements the Thru specific subclass of TargetSubtargetInfo.
//
//===----------------------------------------------------------------------===//

#include "ThruSubtarget.h"
#include "Thru.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Support/MathExtras.h"

using namespace llvm;

#define DEBUG_TYPE "thru-subtarget"

#define GET_SUBTARGETINFO_TARGET_DESC
#define GET_SUBTARGETINFO_CTOR
#include "ThruGenSubtargetInfo.inc"

void ThruSubtarget::anchor() { }

ThruSubtarget::ThruSubtarget(const Triple &TT, const std::string &CPU,
                               const std::string &FS, const TargetMachine &TM)
    : ThruGenSubtargetInfo(TT, CPU, /*TuneCPU*/ CPU, FS) {}
