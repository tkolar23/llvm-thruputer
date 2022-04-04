//=== Thru.td - Describe the Thru Target Machine ---------*- tablegen -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Top tablegen file that pulls in code from the LLVM framework along with
// code specific to this target.
//
//===----------------------------------------------------------------------===//

include "llvm/Target/Target.td"

//===----------------------------------------------------------------------===//
// Calling Conv, Instruction Descriptions, Register information, etc
//===----------------------------------------------------------------------===//

include "ThruSchedule.td"
include "ThruRegisterInfo.td"
include "ThruCallingConv.td"
include "ThruInstrInfo.td"

def ThruInstrInfo : InstrInfo;

//===----------------------------------------------------------------------===//
// Thru processors supported
//===----------------------------------------------------------------------===//

def : ProcessorModel<"generic",  ThruModel, []>;

def ThruInstPrinter : AsmWriter {
  string AsmWriterClassName  = "InstPrinter";
  bit isMCAsmWriter = 1;
}

//===----------------------------------------------------------------------===//
// Thru Target declaration
//===----------------------------------------------------------------------===//

def Thru : Target {
  let InstructionSet = ThruInstrInfo;
  let AssemblyWriters = [ThruInstPrinter];
}