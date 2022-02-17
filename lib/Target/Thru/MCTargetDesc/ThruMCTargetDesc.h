//===-- ThruMCTargetDesc.h - Thru Target Descriptions ---------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file provides Thru specific target descriptions.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_THRU_MCTARGETDESC_THRUMCTARGETDESC_H
#define LLVM_LIB_TARGET_THRU_MCTARGETDESC_THRUMCTARGETDESC_H

#include "llvm/Config/config.h"
#include "llvm/MC/MCTargetOptions.h"
#include "llvm/Support/DataTypes.h"
#include <memory>

namespace llvm {
class MCAsmBackend;
class MCCodeEmitter;
class MCContext;
class MCInstrInfo;
class MCObjectTargetWriter;
class MCRegisterInfo;
class MCSubtargetInfo;
class Target;

MCCodeEmitter *createThruMCCodeEmitter(const MCInstrInfo &MCII,
                                        const MCRegisterInfo &MRI,
                                        MCContext &Ctx);

MCAsmBackend *createThruAsmBackend(const Target &T, const MCSubtargetInfo &STI,
                                    const MCRegisterInfo &MRI,
                                    const MCTargetOptions &Options);

// Header file MUST have createThruELFObjectWriter (why?)
std::unique_ptr<MCObjectTargetWriter> createThruELFObjectWriter(uint8_t OSABI,
                                                                 bool Is64Bit);
}

// Defines symbolic names for Thru registers.
#define GET_REGINFO_ENUM
#include "ThruGenRegisterInfo.inc"

// Defines symbolic names for Thru instructions.
#define GET_INSTRINFO_ENUM
#include "ThruGenInstrInfo.inc"

#define GET_SUBTARGETINFO_ENUM
#include "ThruGenSubtargetInfo.inc"

#endif
