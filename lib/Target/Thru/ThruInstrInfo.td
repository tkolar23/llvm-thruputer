//===----------------------------------------------------------------------===//
// Instruction Formats
//===----------------------------------------------------------------------===//

include "ThruInstrFormats.td"

//===----------------------------------------------------------------------===//
// Instruction Class Templates
//===----------------------------------------------------------------------===//

let hasSideEffects = 0, mayLoad = 0, mayStore = 0 in
class X_acc<SimpleOD SOD> : ThruInst0_2<0b0, SOD, (outs GPR:$xo), (ins GPR:$srcA, GPR:$xr)>;

//===----------------------------------------------------------------------===//
// Instructions
//===----------------------------------------------------------------------===//

//Instructions that use simple accumulator 
//for now will use "format 3" - utilize only DirX and use SrcA as xl
def ADD : X_acc<SOD_ADD>;
def SUB : X_acc<SOD_SUB>;
def SHL : X_acc<SOD_SHL>;
def SHR : X_acc<SOD_SHR>;
def AND : X_acc<SOD_AND>;
def OR  : X_acc<SOD_OR>;
def XOR : X_acc<SOD_XOR>;

//Move instruction
//only register-register move (no immediates/literals)
let isMoveReg in
def MOV : ThruInst0_2<0b0, 0b0, (outs GPR:$MDt), ins GPR:$MDs)>;

//Load and Store instructions
//remember ld will put result in ld register and str will place contents of str register in instance memory
