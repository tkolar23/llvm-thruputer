//===---- ThruISelDAGToDAG.h - A Dag to Dag Inst Selector for Thru ------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file defines an instruction selector for the Thru target.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_THRU_THRUISELDAGTODAG_H
#define LLVM_LIB_TARGET_THRU_THRUISELDAGTODAG_H

#include "ThruSubtarget.h"
#include "ThruTargetMachine.h"
#include "llvm/CodeGen/MachineFunction.h"

namespace llvm {
class ThruDAGToDAGISel : public SelectionDAGISel {
public:
  explicit ThruDAGToDAGISel(ThruTargetMachine &TM, CodeGenOpt::Level OL)
      : SelectionDAGISel(TM, OL), Subtarget(nullptr) {}

  // Pass Name
  StringRef getPassName() const override {
    return "CPU0 DAG->DAG Pattern Instruction Selection";
  }

  bool runOnMachineFunction(MachineFunction &MF) override;

  void Select(SDNode *Node) override;

#include "ThruGenDAGISel.inc"

private:
  const ThruSubtarget *Subtarget;
};
}

#endif // end LLVM_LIB_TARGET_THRU_THRUISELDAGTODAG_H