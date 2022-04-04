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
def SDT_CallSeqStart : SDCallSeqStart<[SDTCisVT<0, i32>, SDTCisVT<1, i32>]>;
def SDT_CallSeqEnd   : SDCallSeqEnd<[SDTCisVT<0, i32>, SDTCisVT<1, i32>]>;

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

multiclass Acc <string opdirstr, bits<4> bodVal, SDNode OpNode> {
    def rr : ThruDirA_0<(outs GPR:$yo), (ins GPR:$yl, GPR:$yr), 
                         opdirstr, "$yo, $yl, $yr", bodVal,
                         [(set i32:$yo, (OpNode i32:$yl, i32:$yr))], Itin_Acc_X_Y>;

    def rl : ThruDirA_1<(outs GPR:$yo), (ins i32imm:$lit, GPR:$yr),
                         opdirstr, "$yo, $lit, $yr", bodVal,
                         [(set i32:$yo, (OpNode imm:$lit, i32:$yr))], Itin_Acc_X_Y>;

    /*
    def lr : ThruDirA_2<(outs GPR:$yo), (ins GPR:$yl, i32imm:$lit),
                         opdirstr, "$yo, $yl, $lit", bodVal,
                         [(set i32:$yo, (OpNode i32:$yl, imm:$lit))]>;

    def ll : ThruDirA_3<(outs GPR:$yo), (ins i32imm:$lit1, i32imm:$lit0),
                         opdirstr, "$yo, $lit1, $lit0", bodVal,
                         [(set i32:$yo, (OpNode imm:$lit1, imm:$lit0))]>;
    */
}

// Flow-Control Directive
let hasSideEffects = 0, mayLoad = 0, mayStore = 0 in {
let isCall = 1 in
def FCD : ThruDirFC<(outs), (ins i32imm:$cond, i32imm:$targ), "", "">, Sched<[WriteJalr, ReadJalr]>
    {
        let AsmString = "FCD\t$cond, $targ";
    }
}

//===----------------------------------------------------------------------===//
// Directives
//===----------------------------------------------------------------------===//

// Arithmetic Directives
defm ADD : Acc<"add", 0b0000, add>, Sched<[WriteIALU, ReadIALU, ReadIALU]>;

//===----------------------------------------------------------------------===//
// Pseudo-Directives and codegen patterns
//
// Naming convention: For 'generic' pattern classes, we use the naming
// convention PatTy1Ty2. For pattern classes which offer a more complex
// expansion, prefix the class name, e.g. BccPat.
//===----------------------------------------------------------------------===//

class PatGprGpr<SDPatternOperator OpNode, ThruDir Dir>
    : Pat<(OpNode GPR:$rs1, GPR:$rs2), (Dir GPR:$rs1, GPR:$rs2)>;

// include/llvm/Target/TargetSelectionDAG.td
// def : PatGprGpr<add, ADDrr>;
// def : PatGprGpr<add, ADDlr>;
// def : PatGprGpr<add, ADDrl>;
// def : PatGprGpr<add, ADDll>;


let Defs = [X20], Uses = [X20] in {
def ADJCALLSTACKDOWN : Pseudo<(outs), (ins i32imm:$amt1, i32imm:$amt2), [(callseq_start timm:$amt1, timm:$amt2)]>;
def ADJCALLSTACKUP   : Pseudo<(outs), (ins i32imm:$amt1, i32imm:$amt2), [(callseq_end timm:$amt1, timm:$amt2)]>;
} // end Defs = [X20], Uses = [X20]


let isReturn = 1, isBarrier = 1, isTerminator = 1 in
def PseudoRET : Pseudo<(outs), (ins), [(thru_ret)]>, PseudoInstExpansion<(FCD   0x000, 0b11100010001)>;

// def : InstAlias<"ret", (JALR X0, X1, 0), 4>;
