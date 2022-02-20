//===-- ThruRegisterInfo.td - Thru Register defs ---------*- tablegen -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
//  Declarations that describe the Thru register file
//===----------------------------------------------------------------------===//

let Namespace = "Thru" in {
class ThruReg<bits<5> Enc, string n, list<string> alt = []> : Register<n> {
  let HWEncoding{4-0} = Enc;
  let AltNames = alt;
}
} // end Namespace

def X0  : ThruReg<0, "x0", []>, DwarfRegNum<[0]>;
def X1  : ThruReg<1, "x1", []>, DwarfRegNum<[1]>;
def X2  : ThruReg<2, "x2", []>, DwarfRegNum<[2]>;
def X3  : ThruReg<3, "x3", []>, DwarfRegNum<[3]>;
def X4  : ThruReg<4, "x4", []>, DwarfRegNum<[4]>;
def X5  : ThruReg<5, "x5", []>, DwarfRegNum<[5]>;
def X6  : ThruReg<6, "x6", []>, DwarfRegNum<[6]>;
def X7  : ThruReg<7, "x7", []>, DwarfRegNum<[7]>;

def X8  : ThruReg<8, "x8", ["s0", "fp"]>, DwarfRegNum<[8]>;
def X9  : ThruReg<9, "x9", ["s1"]>, DwarfRegNum<[9]>;
def X10 : ThruReg<10,"x10", ["a0"]>, DwarfRegNum<[10]>;
def X11 : ThruReg<11,"x11", ["a1"]>, DwarfRegNum<[11]>;
def X12 : ThruReg<12,"x12", ["a2"]>, DwarfRegNum<[12]>;
def X13 : ThruReg<13,"x13", ["a3"]>, DwarfRegNum<[13]>;
def X14 : ThruReg<14,"x14", ["a4"]>, DwarfRegNum<[14]>;
def X15 : ThruReg<15,"x15", ["a5"]>, DwarfRegNum<[15]>;
def X16 : ThruReg<16,"x16", ["a6"]>, DwarfRegNum<[16]>;
def X17 : ThruReg<17,"x17", ["a7"]>, DwarfRegNum<[17]>;
def X18 : ThruReg<18,"x18", ["s2"]>, DwarfRegNum<[18]>;
def X19 : ThruReg<19,"x19", ["s3"]>, DwarfRegNum<[19]>;
def X20 : ThruReg<20,"x20", ["s4"]>, DwarfRegNum<[20]>;
def X21 : ThruReg<21,"x21", ["s5"]>, DwarfRegNum<[21]>;
def X22 : ThruReg<22,"x22", ["s6"]>, DwarfRegNum<[22]>;
def X23 : ThruReg<23,"x23", ["s7"]>, DwarfRegNum<[23]>;
def X24 : ThruReg<24,"x24", ["s8"]>, DwarfRegNum<[24]>;
def X25 : ThruReg<25,"x25", ["s9"]>, DwarfRegNum<[25]>;
def X26 : ThruReg<26,"x26", ["s10"]>, DwarfRegNum<[26]>;
def X27 : ThruReg<27,"x27", ["s11"]>, DwarfRegNum<[27]>;
def X28 : ThruReg<28,"x28", ["t3"]>, DwarfRegNum<[28]>;
def X29 : ThruReg<29,"x29", ["t4"]>, DwarfRegNum<[29]>;
def X30 : ThruReg<30,"x30", ["t5"]>, DwarfRegNum<[30]>;
def X31 : ThruReg<31,"x31", ["t6"]>, DwarfRegNum<[31]>;

// The order of registers represents the preferred allocation sequence.
// Registers are listed in the order caller-save, callee-save, specials.
def GPR : RegisterClass<"Thru", [i32], 32, (add
    (sequence "X%u", 10, 17),
    (sequence "X%u", 5, 7),
    (sequence "X%u", 28, 31),
    (sequence "X%u", 8, 9),
    (sequence "X%u", 18, 27),
    (sequence "X%u", 0, 4)
  )>;

def SP : RegisterClass<"Thru", [i32], 32, (add X2)>;
