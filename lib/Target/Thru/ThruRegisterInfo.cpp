//===-- ThruRegisterInfo.cpp - Thru Register Information ----------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the Thru implementation of the TargetRegisterInfo class.
//
//===----------------------------------------------------------------------===//

#include "ThruRegisterInfo.h"
#include "ThruSubtarget.h"
#include "llvm/Support/Debug.h"

#define GET_REGINFO_TARGET_DESC
#include "ThruGenRegisterInfo.inc"

#define DEBUG_TYPE "thru-reginfo"

using namespace llvm;

ThruRegisterInfo::ThruRegisterInfo(const ThruSubtarget &ST)
  : ThruGenRegisterInfo(Thru::X1, /*DwarfFlavour*/0, /*EHFlavor*/0,
                         /*PC*/0), Subtarget(ST) {}

const MCPhysReg *
ThruRegisterInfo::getCalleeSavedRegs(const MachineFunction *MF) const {
  return Thru_CalleeSavedRegs_SaveList;
}

const TargetRegisterClass *ThruRegisterInfo::intRegClass(unsigned Size) const {
  return &Thru::GPRRegClass;
}

const uint32_t *
ThruRegisterInfo::getCallPreservedMask(const MachineFunction &MF,
                                        CallingConv::ID) const {
  return Thru_CalleeSavedRegs_RegMask;
}

BitVector ThruRegisterInfo::getReservedRegs(const MachineFunction &MF) const {
  BitVector Reserved(getNumRegs());

  markSuperRegs(Reserved, Thru::X0); // zero
  markSuperRegs(Reserved, Thru::X2); // sp
  markSuperRegs(Reserved, Thru::X3); // gp
  markSuperRegs(Reserved, Thru::X4); // tp

  return Reserved;
}

void ThruRegisterInfo::eliminateFrameIndex(MachineBasicBlock::iterator II,
                                           int SPAdj,
                                           unsigned FIOperandNum,
                                           RegScavenger *RS) const {
  llvm_unreachable("Unsupported eliminateFrameIndex");
}

bool
ThruRegisterInfo::requiresRegisterScavenging(const MachineFunction &MF) const {
  return true;
}

bool
ThruRegisterInfo::requiresFrameIndexScavenging(
                                            const MachineFunction &MF) const {
  return true;
}

bool
ThruRegisterInfo::requiresFrameIndexReplacementScavenging(
                                            const MachineFunction &MF) const {
  return true;
}

bool
ThruRegisterInfo::trackLivenessAfterRegAlloc(const MachineFunction &MF) const {
  return true;
}

Register ThruRegisterInfo::getFrameRegister(const MachineFunction &MF) const {
  llvm_unreachable("Unsupported getFrameRegister");
}
