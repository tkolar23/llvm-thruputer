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
// Instruction format superclass
//===----------------------------------------------------------------------===//

// Procedure return
def thru_ret : SDNode<"ThruISD::Ret", SDTNone, [SDNPHasChain, SDNPOptInGlue, SDNPVariadic]>;

// Procedure calling
def SDT_CallSeqStart : SDCallSeqStart<[SDTCisVT<0, i32>, SDTCisVT<1, i32>]>;
def SDT_CallSeqEnd   : SDCallSeqEnd<[SDTCisVT<0, i32>, SDTCisVT<1, i32>]>;

// These are target-independent nodes, but have target-specific formats.
def callseq_start : SDNode<"ISD::CALLSEQ_START", SDT_CallSeqStart, [SDNPHasChain, SDNPOutGlue]>;
def callseq_end   : SDNode<"ISD::CALLSEQ_END", SDT_CallSeqEnd, [SDNPHasChain, SDNPOptInGlue, SDNPOutGlue]>;

include "ThruInstrFormats.td"

let Defs = [X2], Uses = [X2] in {
def ADJCALLSTACKDOWN : Pseudo<(outs), (ins i32imm:$amt1, i32imm:$amt2), [(callseq_start timm:$amt1, timm:$amt2)]>;
def ADJCALLSTACKUP   : Pseudo<(outs), (ins i32imm:$amt1, i32imm:$amt2), [(callseq_end timm:$amt1, timm:$amt2)]>;
} // end Defs = [X2], Uses = [X2]

/* Arithmetic and logic */

// Register inputs
class Acc_rr <dag outs, dag ins> : ThruDirA <outs, ins>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0 in
{
// TODO: 
// Cast, Reinterpret, Shift Left, Shift Right,
// Shift Left Fill, Shift Right Extend, Pack
def ADD :   Acc_rr<(outs GPR:$yo), (ins GPR:$yl, GPR:$yr)>,
            Sched<[WriteIALU, ReadIALU, ReadIALU]>
            { let AsmString = "$yo\t=\t$yl + $yr"; }
def SUB :   Acc_rr<(outs GPR:$yo), (ins GPR:$yl, GPR:$yr)>,
            Sched<[WriteIALU, ReadIALU, ReadIALU]>
            { let AsmString = "$yo\t=\t$yl - $yr"; }
def MUL :   Acc_rr<(outs GPR:$yo), (ins GPR:$yl, GPR:$yr)>,
            Sched<[WriteIALU, ReadIALU, ReadIALU]>
            { let AsmString = "$yo\t=\t$yl * $yr"; }
def DIV :   Acc_rr<(outs GPR:$yo), (ins GPR:$yl, GPR:$yr)>,
            Sched<[WriteIALU, ReadIALU, ReadIALU]>
            { let AsmString = "$yo\t=\t$yl / $yr"; }
def MIN :   Acc_rr<(outs GPR:$yo), (ins GPR:$yl, GPR:$yr)>,
            Sched<[WriteIALU, ReadIALU, ReadIALU]>
            { let AsmString = "$yo\t=\tmin($yl, $yr)"; }
def MAX :   Acc_rr<(outs GPR:$yo), (ins GPR:$yl, GPR:$yr)>,
            Sched<[WriteIALU, ReadIALU, ReadIALU]>
            { let AsmString = "$yo\t=\tmax($yl, $yr)"; }
def AND :   Acc_rr<(outs GPR:$yo), (ins GPR:$yl, GPR:$yr)>,
            Sched<[WriteIALU, ReadIALU, ReadIALU]>
            { let AsmString = "$yo\t=\t$yl & $yr"; }
def OR :   Acc_rr<(outs GPR:$yo), (ins GPR:$yl, GPR:$yr)>,
            Sched<[WriteIALU, ReadIALU, ReadIALU]>
            { let AsmString = "$yo\t=\t$yl | $yr"; }
def XOR :   Acc_rr<(outs GPR:$yo), (ins GPR:$yl, GPR:$yr)>,
            Sched<[WriteIALU, ReadIALU, ReadIALU]>
            { let AsmString = "$yo\t=\t$yl ^ $yr"; }
}


class PatGprGpr<SDPatternOperator OpNode, ThruDir Dir>
    : Pat<(OpNode GPR:$rs1, GPR:$rs2), (Dir GPR:$rs1, GPR:$rs2)>;

// include/llvm/Target/TargetSelectionDAG.td
def : PatGprGpr<add, ADD>;
def : PatGprGpr<sub, SUB>;
def : PatGprGpr<mul, MUL>;
def : PatGprGpr<sdiv, DIV>;
def : PatGprGpr<smin, MIN>;
def : PatGprGpr<smax, MAX>;
// Cast
// Reinterpret
// Shift Left
// Shift Right
// Shift Left Fill
// Shift Right Extend
def : PatGprGpr<and, AND>;
def : PatGprGpr<or, OR>;
def : PatGprGpr<xor, XOR>;
// Pack


/* Procedure calling instructions */
let hasSideEffects = 0, mayLoad = 0, mayStore = 0 in {
let isCall = 1 in
def FCD : ThruDirFC<(outs), (ins i32imm:$cond, i32imm:$targ)>, Sched<[WriteJalr, ReadJalr]>
    {
        let AsmString = "FCD\t$cond, $targ";
    }
}

let isReturn = 1, isBarrier = 1, isTerminator = 1 in
def PseudoRET : Pseudo<(outs), (ins), [(thru_ret)]>, PseudoInstExpansion<(FCD   0x000, 0b11100010001)>;

// def : InstAlias<"ret", (JALR X0, X1, 0), 4>;
