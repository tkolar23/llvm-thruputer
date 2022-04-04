//===-- ThruInstrInfo.cpp - Thru Instruction Information ----------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the Thru implementation of the TargetInstrInfo class.
//
//===----------------------------------------------------------------------===//

#include "ThruInstrInfo.h"

#include "ThruTargetMachine.h"
#include "ThruMachineFunction.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Support/Debug.h"
#include "llvm/CodeGen/DFAPacketizer.h"

using namespace llvm;

#define DEBUG_TYPE "thru-instrinfo"

#define GET_INSTRINFO_CTOR_DTOR
#include "ThruGenInstrInfo.inc"
#include "ThruGenDFAPacketizer.inc"

ThruInstrInfo::ThruInstrInfo(const ThruSubtarget &STI)
    : ThruGenInstrInfo(Thru::ADJCALLSTACKDOWN, Thru::ADJCALLSTACKUP), Subtarget(STI) {}

//checks if MachineInstr in MBB in MF is at a scheduling boundary
//mostly if MI is a label or end of MBB
bool ThruInstrInfo::isSchedulingBoundary(const MachineInstr &MI, const MachineBasicBlock *MBB,
                                         const MachineFunction &MF) const {
    // Debug info is never a scheduling boundary
    if (MI.isDebugInstr())
        return false;

    // Terminators and labels can't be scheduled around.
    if (MI.getDesc().isTerminator() || MI.isPosition())
        return true;

    return false;
}

DFAPacketizer *ThruInstrInfo::CreateTargetScheduleState(const TargetSubtargetInfo &STI) const {
    const InstrItineraryData *II = STI.getInstrItineraryData();
    return static_cast<const ThruSubtarget&>(STI).createDFAPacketizer(II);
}