//=== ThruInstrFormats.td - Thru Instruction Formats -----*- tablegen -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

// Format specifies the encoding used by the instruction. This is used by
// ThruMCCodeEmitter to determine which form of fixup to use. These
// definitions must be kept in-sync with ThruBaseInfo.h.
class DirFormat<bits<5> val> {
  bits<5> Value = val;
}
def DirFormatPseudo : DirFormat<0>;
def DirFormatA      : DirFormat<1>;
def DirFormatFC      : DirFormat<2>;

// The following opcode names match those given in Table 19.1 in the
// RISC-V User-level ISA specification ("RISC-V base opcode map").
class ThruOpcode<bits<7> val> {
  bits<7> Value = val;
}
def OPC_OP        : ThruOpcode<0b0110011>;
def OPC_JALR      : ThruOpcode<0b1100111>;

class ThruDir<dag outs, dag ins, list<dag> pattern, DirFormat format>
    : Instruction {
  let Namespace = "Thru";
  field bits<32> Inst;
  // SoftFail is a field the disassembler can use to provide a way for
  // instructions to not match without killing the whole decode process. It is
  // mainly used for ARM, but Tablegen expects this field to exist or it fails
  // to build the decode table.
  field bits<32> SoftFail = 0;
  let Size = 4;
  dag OutOperandList = outs;
  dag InOperandList = ins;
  let Pattern = pattern;
  let TSFlags{4-0} = format.Value;
}

// Pseudo instructions
class Pseudo<dag outs, dag ins, list<dag> pattern>
    : ThruDir<outs, ins, pattern, DirFormatPseudo>,
      Sched<[]> {
  let isPseudo = 1;
  let isCodeGenOnly = 1;
}

class ThruDirA<dag outs, dag ins> : ThruDir<outs, ins, [], DirFormatA>;

class ThruDirFC<dag outs, dag ins> : ThruDir<outs, ins, [], DirFormatFC>;
