//===----------------------------------------------------------------------===//
// Instruction Formats
//===----------------------------------------------------------------------===//

include "ThruInstrFormats.td"
// include "ThruRegisterInfo.td"

//===----------------------------------------------------------------------===//
// Instruction Class Templates
//===----------------------------------------------------------------------===//

let hasSideEffects = 0, mayLoad = 0, mayStore = 0 in
class X_acc<SimpleOD SOD> : ThruInst0_2<BOD_ADD, SOD, (outs IntRegs:$xo), (ins IntRegs:$srcA, IntRegs:$xr)>;

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
let isMoveReg = 1, hasSideEffects = 0, mayLoad = 0, mayStore = 0 in
def MOV : ThruInst0_2<BOD_ADD, SOD_ADD, (outs IntRegs:$MDt), (ins IntRegs:$MDs)>;

//Load and Store instructions
//remember ld will put result in ld register and str will place contents of str register in instance memory
