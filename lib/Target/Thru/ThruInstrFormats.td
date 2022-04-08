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
def DirFormatFC     : DirFormat<2>;

// Binary Operational Directives (BOD)
class BinaryOD<bits<4> val> {
    bits<4> value = val;
}

def BOD_ADD   : BinaryOD<0>; //add
def BOD_SUB   : BinaryOD<1>; //subtract
def BOD_MUL   : BinaryOD<2>; //multiply
def BOD_DIV   : BinaryOD<3>; //divide
def BOD_MIN   : BinaryOD<4>; //minimum
def BOD_MAX   : BinaryOD<5>; //maxmimum
def BOD_CAST  : BinaryOD<6>; //cast
def BOD_REIN  : BinaryOD<7>; //reinterpret
def BOD_SHL   : BinaryOD<8>; //shift left
def BOD_SHR   : BinaryOD<9>; //shift right
def BOD_SHLF  : BinaryOD<10>; //shift left with fill
def BOD_SHRE  : BinaryOD<11>; //shift right with extend
def BOD_AND   : BinaryOD<12>; //and
def BOD_OR    : BinaryOD<13>; //or
def BOD_XOR   : BinaryOD<14>; //xor
def BOD_PACK  : BinaryOD<15>; //pack

// Flow Control Targets
class FCTarg<bits<3> targ> {
  bits<3> target = targ;
}

def FCT_YIELD   : FCTarg<0>;
def FCT_CALL0   : FCTarg<1>;
def FCT_THROW   : FCTarg<2>;
def FCT_JUMP0   : FCTarg<3>;
def FCT_CALL1   : FCTarg<4>;
def FCT_JUMP1   : FCTarg<5>;
def FCT_RETURN  : FCTarg<6>;
def FCT_EXEC    : FCTarg<7>;

// Flow Control Conditions
class FCCond<bits<4> cond> {
  bits<4> condition = cond;
}

def FCC0 : FCCond<0>; // ++rX < lim[Z]
def FCC1 : FCCond<1>; // --rx
def FCC2 : FCCond<2>; // x.state
def FCC3 : FCCond<3>; // y.state
def FCC4 : FCCond<4>; // SrcA (r6) M
def FCC5 : FCCond<5>; // SrcA (r6) I
def FCC6 : FCCond<6>; // SrcA (r4) SrcB
def FCC7 : FCCond<7>; // ?
def FCC8 : FCCond<8>; // History
def FCC9 : FCCond<9>; // Unconditional
def FCC10 : FCCond<10>; // SrcA & 16
def FCC11 : FCCond<11>; // SrcA & (1 << X)

// Condition Code Relationship 6 Encodings
class CCR6<bits<2> cc> {
  bits<2> CondCode = cc;
}

def R6_GT : CCR6<0>;
def R6_NE : CCR6<1>;
def R6_LT : CCR6<2>;

// Condition Code Relationship 4 Encodings
class CCR4<bits<1> cc> {
  bits<1> CondCode = cc;
}

def R4_GT : CCR6<0>;
def R4_NE : CCR6<1>;


class ThruDir<dag outs, dag ins, string opdirstr, string argstr,
              list<dag> pattern, InstrItinClass itin, DirFormat format>
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
  let AsmString = !strconcat(opdirstr, "\t", argstr);
  let Pattern = pattern;

  let TSFlags{4-0} = format.Value;

  let Itinerary = itin;

}

// Pseudo instructions
class Pseudo<dag outs, dag ins, list<dag> pattern>
    : ThruDir<outs, ins, "", "", pattern, Itin_Pseudo, DirFormatPseudo>,
      Sched<[]> {
  let isPseudo = 1;
  let isCodeGenOnly = 1;
}

class ThruDirA<dag outs, dag ins, string opdirstr, string argstr,
               BinaryOD bodval, list<dag> pattern, InstrItinClass itin>
  : ThruDir<outs, ins, opdirstr, argstr, pattern, itin, DirFormatA>
{
  bits<4> yl;
  bits<3> yr;
  bits<3> yo;
  bits<4> bod;

  let bod = bodval.value;

  let Inst{31-28} = yl;
  let Inst{14-12} = yr;
  let Inst{17-15} = yo;
  let Inst{21-18} = bod;
}

class ThruDirA_0<dag outs, dag ins, string opdirstr, string argstr,
                 BinaryOD bodval, list<dag> pattern, InstrItinClass itin>
  : ThruDirA<outs, ins, opdirstr, argstr, bodVal, pattern, itin>;

// Right-side LV
class ThruDirA_1<dag outs, dag ins, string opdirstr, string argstr,
                 bits<4> bodval, list<dag> pattern, InstrItinClass itin>
  : ThruDirA<outs, ins, opdirstr, argstr, bodval, pattern, itin>
{
  bits<64> lit;
  let yr = 0b111;
}

// Left-side LV
class ThruDirA_2<dag outs, dag ins, string opdirstr, string argstr,
                 BinaryOD bodval, list<dag> pattern>
  : ThruDirA<outs, ins, opdirstr, argstr, bodval, pattern>
{
  bits<64> lit;
  let yl = 0b1111;
}

// Right-side LV, Left-side LV
class ThruDirA_3<dag outs, dag ins, string opdirstr, string argstr,
                 BinaryOD bodval, list<dag> pattern>
  : ThruDirA<outs, ins, opdirstr, argstr, bodval, pattern>
{
  bits<64> lit0;
  bits<64> lit1;
  let yr = 0b111;
  let yl = 0b1111;
}

class ThruDirFC<dag targ_outs, dag cond_outs, dag targ_ins, dag cond_ins, string targstr, string condstr>
  : ThruDir<!con(targ_outs, cond_outs), !con(targ_ins, cond_ins), "FCD", !strconcat(targstr,", ",condstr), [], DirFormatFC>
{
  bits<12> cond;
  bits<11> targ;

  let Inst{31-20} = cond;
  let Inst{19-9} = targ;

}

class ThruDirFC_T3<dag targ_outs, dag cond_outs, dag targ_ins, dag cond_ins, string condstr>
  : ThruDirFC<targ_outs, cond_outs, targ_ins, cond_ins, "Jump", condstr>
{

  bits<8> transaction;

  let targ{10-8} = 0b110;
  let targ{7-0} = transaction;
}

class ThruDirFC_T6<dag targ_outs, dag cond_outs, dag targ_ins, dag cond_ins, string condstr>
  : ThruDirFC<targ_outs, cond_outs, targ_ins, cond_ins, "Return", condstr>
{
  bits<8> n;

  let targ{10-7} = 0b1110;
  let targ{6-4} = n{2-0};
  let targ{3} = 0;
  let targ{2-0} = n{2-0};
}
