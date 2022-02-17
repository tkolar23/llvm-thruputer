//=== ThruMachineFunctionInfo.h - Private data used for Thru ----*- C++ -*-=//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file declares the Thru specific subclass of MachineFunctionInfo.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_THRU_THRUMACHINEFUNCTION_H
#define LLVM_LIB_TARGET_THRU_THRUMACHINEFUNCTION_H

#include "llvm/CodeGen/MachineFunction.h"

namespace llvm {

/// ThruFunctionInfo - This class is derived from MachineFunction private
/// Thru target-specific information for each MachineFunction.
class ThruFunctionInfo : public MachineFunctionInfo {
private:
  MachineFunction &MF;

public:
  ThruFunctionInfo(MachineFunction &MF) : MF(MF) {}
};

} // end of namespace llvm

#endif // end LLVM_LIB_TARGET_THRU_THRUMACHINEFUNCTION_H