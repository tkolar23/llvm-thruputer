//===-- Thru.td - Describe the Thru Target Machine -------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

include "llvm/Target/Target.td"

//===----------------------------------------------------------------------===//
// RISC-V subtarget features and instruction predicates.
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Named operands for CSR instructions.
//===----------------------------------------------------------------------===//

// include "ThruSystemOperands.td"

//===----------------------------------------------------------------------===//
// Registers, calling conventions, instruction descriptions.
//===----------------------------------------------------------------------===//

// include "ThruSchedule.td"
include "ThruRegisterInfo.td"
// include "ThruCallingConv.td"
// include "ThruInstrInfo.td"
// include "ThruRegisterBanks.td"
// include "ThruSchedRocket.td"
// include "ThruSchedSiFive7.td"

//===----------------------------------------------------------------------===//
// RISC-V processors supported.
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Define the RISC-V target.
//===----------------------------------------------------------------------===//

// def ThruInstrInfo : InstrInfo {
//   let guessInstructionProperties = 0;
// }

// def ThruAsmParser : AsmParser {
//   let ShouldEmitMatchRegisterAltName = 1;
//   let AllowDuplicateRegisterNames = 1;
// }

// def ThruAsmWriter : AsmWriter {
//   int PassSubtarget = 1;
// }

def Thru : Target {
//   let InstructionSet = ThruInstrInfo;
//   let AssemblyParsers = [ThruAsmParser];
//   let AssemblyWriters = [ThruAsmWriter];
//   let AllowRegisterRenaming = 1;
}
