//== ThruDirAInfo.td - Target Description for Thru Target -*- tablegen -*-=//
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

//===----------------------------------------------------------------------===//
// ThruPuter specific DAG Nodes.
//===----------------------------------------------------------------------===//

// Target-independent type requirements, but with target-specific formats.
def SDT_CallSeqStart : SDCallSeqStart<[SDTCisVT<0, i64>, SDTCisVT<1, i64>]>;
def SDT_CallSeqEnd   : SDCallSeqEnd<[SDTCisVT<0, i64>, SDTCisVT<1, i64>]>;

// Target-dependent type requirements.


// Target-independent nodes, but with target-specific formats.
def callseq_start : SDNode<"ISD::CALLSEQ_START", SDT_CallSeqStart, [SDNPHasChain, SDNPOutGlue]>;
def callseq_end   : SDNode<"ISD::CALLSEQ_END", SDT_CallSeqEnd, [SDNPHasChain, SDNPOptInGlue, SDNPOutGlue]>;

// Target-dependent nodes.
def thru_ret : SDNode<"ThruISD::Ret", SDTNone, [SDNPHasChain, SDNPOptInGlue, SDNPVariadic]>;

//===----------------------------------------------------------------------===//
// Operand and SDNode transformation definitions.
//===----------------------------------------------------------------------===//


//===----------------------------------------------------------------------===//
// Directive Formats
//===----------------------------------------------------------------------===//

include "ThruInstrFormats.td"

//===----------------------------------------------------------------------===//
// Directive Class Templates
//===----------------------------------------------------------------------===//

// Commutative
multiclass Acc <string opdirstr, BinaryOD bodval, SDNode OpNode> {
    def rr : ThruDirA_0<(outs GPR:$yo), (ins GPR:$yl, GPR:$yr), 
                         opdirstr, "$yo, $yl, $yr", bodval,
                         [(set i64:$yo, (OpNode i64:$yl, i64:$yr))], Itin_Acc_X_Y>;

    def rl : ThruDirA_1<(outs GPR:$yo), (ins GPR:$yl, i64imm:$lit),
                         opdirstr, "$yo, $yl, $lit", bodval,
                         [(set i64:$yo, (OpNode i64:$yl, imm:$lit))], Itin_Acc_X_Y>;

    def ll : ThruDirA_3<(outs GPR:$yo), (ins i64imm:$lit1, i64imm:$lit0),
                         opdirstr, "$yo, $lit1, $lit0", bodval,
                         [(set i64:$yo, (OpNode imm:$lit1, imm:$lit0))], Itin_Acc_X_Y>;
}

// Non Commutative
multiclass Acc_nc <string opdirstr, BinaryOD bodval, SDNode OpNode> {
    def rr : ThruDirA_0<(outs GPR:$yo), (ins GPR:$yl, GPR:$yr), 
                         opdirstr, "$yo, $yl, $yr", bodval,
                         [(set i64:$yo, (OpNode i64:$yl, i64:$yr))], Itin_Acc_X_Y>;

    def rl : ThruDirA_1<(outs GPR:$yo), (ins GPR:$yl, i64imm:$lit),
                         opdirstr, "$yo, $yl, $lit", bodval,
                         [(set i64:$yo, (OpNode i64:$yl, imm:$lit))], Itin_Acc_X_Y>;

    
    def lr : ThruDirA_2<(outs GPR:$yo), (ins i64imm:$lit, GPR:$yr),
                         opdirstr, "$yo, $lit, $yr", bodval,
                         [(set i64:$yo, (OpNode imm:$lit, i64:$yr))], Itin_Acc_X_Y>;

    def ll : ThruDirA_3<(outs GPR:$yo), (ins i64imm:$lit1, i64imm:$lit0),
                         opdirstr, "$yo, $lit1, $lit0", bodval,
                         [(set i64:$yo, (OpNode imm:$lit1, imm:$lit0))], Itin_Acc_X_Y>;
}

// Flow-Control Directive
// Target Format, 1 Input
multiclass TFormat1 <dag cond_outs, dag cond_ins, string condstr> {
    // Jump
    // def _t3 : ThruDirFC_T3<(outs), cond_outs, (ins), cond_ins, condstr>;
    // Return
    def _t6 : ThruDirFC_T6<(outs), cond_outs, (ins i8imm:$n), cond_ins, condstr>;
}

// Condition Format, 0 Inputs
multiclass CFormat0 {
    // Unconditional
    defm _c9 : TFormat1<(outs), (ins), "Unconditional">;
}

// Condition Format, 3 Inputs
// multiclass CFormat3 {
//     // SrcA (r6) M
//     defm _c4 : TFormat1;
//     // SrcA (r6) I
//     defm _c5 : TFormat1;
//     // SrcA (r4) SrcB
//     defm _c6 : TFormat1;

// }

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCall = 1 in {
    defm FCD : CFormat0;
}

//===----------------------------------------------------------------------===//
// Directives
//===----------------------------------------------------------------------===//

// Accumulator Directives
defm ADD : Acc<"add", BOD_ADD, add>, Sched<[WriteIALU, ReadIALU, ReadIALU]>;
defm SUB : Acc_nc<"sub", BOD_SUB, sub>, Sched<[WriteIALU, ReadIALU, ReadIALU]>;
defm MUL : Acc<"mul", BOD_MUL, mul>, Sched<[WriteIALU, ReadIALU, ReadIALU]>;
defm SDIV : Acc_nc<"div", BOD_DIV, sdiv>, Sched<[WriteIALU, ReadIALU, ReadIALU]>;
defm UDIV : Acc_nc<"div", BOD_DIV, udiv>, Sched<[WriteIALU, ReadIALU, ReadIALU]>;
defm SMIN : Acc<"min", BOD_MIN, smin>, Sched<[WriteIALU, ReadIALU, ReadIALU]>;
defm UMIN : Acc<"min", BOD_MIN, umin>, Sched<[WriteIALU, ReadIALU, ReadIALU]>;
defm SMAX : Acc<"max", BOD_MAX, smax>, Sched<[WriteIALU, ReadIALU, ReadIALU]>;
defm UMAX : Acc<"max", BOD_MAX, umax>, Sched<[WriteIALU, ReadIALU, ReadIALU]>;
// defm CAST : Acc<"cast", BOD_MAX, bitcast>, Sched<[WriteIALU, ReadIALU, ReadIALU]>;
// defm SHL : Acc_nc<"shl", BOD_SHL, shl>, Sched<[WriteIALU, ReadIALU, ReadIALU]>;
// defm SHR : Acc_nc<"shr", BOD_SHR, srl>, Sched<[WriteIALU, ReadIALU, ReadIALU]>;
defm AND : Acc<"and", BOD_AND, and>, Sched<[WriteIALU, ReadIALU, ReadIALU]>;
defm OR : Acc<"or", BOD_OR, or>, Sched<[WriteIALU, ReadIALU, ReadIALU]>;
defm XOR : Acc<"xor", BOD_XOR, xor>, Sched<[WriteIALU, ReadIALU, ReadIALU]>;

//===----------------------------------------------------------------------===//
// Pseudo-Directives and codegen patterns
//===----------------------------------------------------------------------===//

let Defs = [X2], Uses = [X2] in {
def ADJCALLSTACKDOWN : Pseudo<(outs), (ins i64imm:$amt1, i64imm:$amt2), [(callseq_start timm:$amt1, timm:$amt2)]>;
def ADJCALLSTACKUP   : Pseudo<(outs), (ins i64imm:$amt1, i64imm:$amt2), [(callseq_end timm:$amt1, timm:$amt2)]>;
} // end Defs = [X2], Uses = [X2]

let isReturn = 1, isBarrier = 1, isTerminator = 1 in
def PseudoRET : Pseudo<(outs), (ins), [(thru_ret)]>,
                PseudoInstExpansion<(FCD_c9_t6 0b0001)>;

// TODO: Fill this in
// let isBarrier = 1, isBranch = 1, isTerminator = 1 in
// def PseudoBR : Pseudo<(outs), (ins i8imm:$targ), [(br bb:$targ)]>, PseudoInstExpansion<(FCD  i8imm:$targ)>;

def : InstAlias<"Return(1)", (FCD_c9_t6 0b0001), 4>;
