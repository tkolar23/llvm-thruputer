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

class ThruDir<dag outs, dag ins, string opdirstr, string argstr,
              list<dag> pattern, DirFormat format>
    : Instruction {
  field bits<32> Inst;
  
  // SoftFail is a field the disassembler can use to provide a way for
  // instructions to not match without killing the whole decode process. It is
  // mainly used for ARM, but Tablegen expects this field to exist or it fails
  // to build the decode table.
  field bits<32> SoftFail = 0;
  let Size = 4;
  
  let Namespace = "Thru";

  dag OutOperandList = outs;
  dag InOperandList = ins;
  let AsmString = opdirstr # "\t" # argstr;
  let Pattern = pattern;

  let TSFlags{4-0} = format.Value;
}

// Pseudo instructions
class Pseudo<dag outs, dag ins, list<dag> pattern>
    : ThruDir<outs, ins, "", "", pattern, DirFormatPseudo>,
      Sched<[]> {
  let isPseudo = 1;
  let isCodeGenOnly = 1;
}

class ThruDirA<dag outs, dag ins, string opdirstr, string argstr,
               bits<4> bodVal, list<dag> pattern>
  : ThruDir<outs, ins, opdirstr, argstr, pattern, DirFormatA>
{
  bits<4> yl;
  bits<3> yr;
  bits<3> yo;
  bits<4> bod;

  let bod = bodVal;

  let Inst{31-28} = yl;
  let Inst{14-12} = yr;
  let Inst{17-15} = yo;
  let Inst{21-18} = bod;
}

class ThruDirA_0<dag outs, dag ins, string opdirstr, string argstr,
                 bits<4> bodVal, list<dag> pattern>
  : ThruDirA<outs, ins, opdirstr, argstr, bodVal, pattern>;

// Right-side LV
class ThruDirA_1<dag outs, dag ins, string opdirstr, string argstr,
                 bits<4> bodVal, list<dag> pattern>
  : ThruDirA<outs, ins, opdirstr, argstr, bodVal, pattern>
{
  bits<32> lit;
  let yr = 0b111;
}

/*
// Left-side LV
class ThruDirA_2<dag outs, dag ins, string opdirstr, string argstr,
                 bits<4> bodVal, list<dag> pattern>
  : ThruDirA<outs, ins, opdirstr, argstr, bodVal, pattern>
{
  bits<32> lit;
  let yl = 0b1111;
}

// Right-side LV, Left-side LV
class ThruDirA_3<dag outs, dag ins, string opdirstr, string argstr,
                 bits<4> bodVal, list<dag> pattern>
  : ThruDirA<outs, ins, opdirstr, argstr, bodVal, pattern>
{
  bits<32> lit0;
  bits<32> lit1;
  let yr = 0b111;
  let yl = 0b1111;
}
*/

class ThruDirFC<dag outs, dag ins, string opdirstr, string argstr>
  : ThruDir<outs, ins, opdirstr, argstr, [], DirFormatFC>;
