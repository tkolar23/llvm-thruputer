//gives unique identifier to each possible instruction format
//In this case each InstFormat describes a range of instruction formats with the same fields
//although those fields may describe different things (but are still the same length)
//maybe in future give these better names
class InstFormat<bits<5> val> {
  bits<5> Value = val;
}
def InstFormat0_2   : InstFormat<0>;
def InstFormat3_5   : InstFormat<1>;
def InstFormat6     : InstFormat<2>;
def InstFormat7_8   : InstFormat<3>;
def InstFormat9     : InstFormat<4>;
def InstFormat10    : InstFormat<5>;
def InstFormat11_13 : InstFormat<6>;
def InstFormat14_16 : InstFormat<7>;
def InstFormat17    : InstFormat<8>;
def InstFormat18_19 : InstFormat<9>;
def InstFormat20    : InstFormat<10>;
def InstFormat21    : InstFormat<11>;

//Simple Operational Directives (SOD)
class SimpleOD<bits<3> val> {
    bits<3> value = val;
}
def SOD_ADD : SimpleOD<0>; //add
def SOD_SUB : SimpleOD<1>; //subtract
def SOD_SHL : SimpleOD<2>: //shift left
def SOD_SHR : SimpleOD<3>; //shift right
def SOD_AND : SimpleOD<4>; //and
def SOD_OR  : SimpleOD<5>; //or
def SOD_XOR : SimpleOD<6>; //xor
//SOD value 111 turns the Directive X into a meta-move (MMD) instead of using SOD
//so maybe it shouldn't belong here? who knows
def SOD_MMD : SimpleOD<7>;

//Binary Operational Directives (BOD)
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

//TODO: Unary ODs, maybe certain Ld/Str/MMD encodings 

//Top-level class for all Thruputer Instructions
//Look at llvm/include/lvvm/Target/Target.td for Instruction superclass
class ThruInst<dag outs, dag ins, list<dag> pattern, InstFormat format>
    : Instruction {
    field bits<32> Inst;
    // SoftFail is a field the disassembler can use to provide a way for
    // instructions to not match without killing the whole decode process. It is
    // mainly used for ARM, but Tablegen expects this field to exist or it fails
    // to build the decode table.
    field bits<32> SoftFail = 0;
    let Size = 4;

    //Overall fields shared by all formats
    bits<2>  Ctrl = 0;
    let Inst{23-22} = Ctrl;

    let Namespace = "Thru";

    //defines operands (imms, registers, stack locs, global address, etc.) produced and consumed by instr
    //Used in MI stage for scheduling I think
    dag OutOperandList = outs;
    dag InOperandList = ins;

    //no need to define asm code for intruction
    //maybe add later for debugging?
    //let AsmString = opcodestr # "\t" # argstr;

    //superclass says set this to DAG pattern for instruction
    //presumably code generator will do this or 
    let Pattern = pattern;

    // Target-specific flags. This becomes the TSFlags field in TargetInstrDesc.
    //Not really sure what this does yet (looks like it just gives the value 0-21 of the instruction's format?)
    let TSFlags{4-0} = format.Value;
}

//Define classes for each format
//For now only instruction formats 0,1,2
class ThruInst0_2<BinaryOD BOD, SimpleOD SOD, dag outs, dag ins>
    : ThruInst<outs, ins, [], InstFormat0_2> {
    //Dir Z (MD)
    bits<4> MDt; //target
    bits<4> MDs; //source
    let Inst{31-28} = MDt;
    let Inst{27-24} = MDs;
    
    //Dir Y (BOD)
    bits<3> yo;
    bits<3> yr;
    let Inst{21-18} = BOD;
    let Inst{17-15} = yo;
    let Inst{14-12} = yr;

    //Dir X (SOD)
    bits<3> srcA; //in this case yl
    bits<3> xr;
    bits<3> xo;
    let Inst{11-9} = srcA;
    let Inst{8-6}  = xr;
    let Inst{5-3}  = xo;
    let Inst{2-0}  = SOD;

    let Ctrl = 0;
}