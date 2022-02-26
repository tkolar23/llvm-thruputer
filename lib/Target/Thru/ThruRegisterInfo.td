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

// General Purpose Registers
def X0  : ThruReg<0, "x0", ["r0"]>, DwarfRegNum<[0]>;
def X1  : ThruReg<1, "x1", ["r1"]>, DwarfRegNum<[1]>;
def X2  : ThruReg<2, "x2", ["r2"]>, DwarfRegNum<[2]>;
def X3  : ThruReg<3, "x3", ["r3"]>, DwarfRegNum<[3]>;
def X4  : ThruReg<4, "x4", ["r4"]>, DwarfRegNum<[4]>;
def X5  : ThruReg<5, "x5", ["r5"]>, DwarfRegNum<[5]>;
def X6  : ThruReg<6, "x6", ["r6"]>, DwarfRegNum<[6]>;
def X7  : ThruReg<7, "x7", ["r7"]>, DwarfRegNum<[7]>;

// Input Ports
def X8  : ThruReg<8, "x8", ["g0"]>, DwarfRegNum<[8]>;
def X9  : ThruReg<9, "x9", ["g1"]>, DwarfRegNum<[9]>;
def X10 : ThruReg<10,"x10", ["g2"]>, DwarfRegNum<[10]>;
def X11 : ThruReg<11,"x11", ["g3"]>, DwarfRegNum<[11]>;

// Output Ports
def X12 : ThruReg<12,"x12", ["p0"]>, DwarfRegNum<[12]>;
def X13 : ThruReg<13,"x13", ["p1"]>, DwarfRegNum<[13]>;
def X14 : ThruReg<14,"x14", ["p2"]>, DwarfRegNum<[14]>;
def X15 : ThruReg<15,"x15", ["p3"]>, DwarfRegNum<[15]>;

// Input Queue
def X16 : ThruReg<16,"x16", ["iq"]>, DwarfRegNum<[16]>;

// Output Queue
def X17 : ThruReg<17,"x17", ["oq"]>, DwarfRegNum<[17]>;

// Loaded Memory
def X18 : ThruReg<18,"x18", ["ld"]>, DwarfRegNum<[18]>;

// Stored Memory
def X19 : ThruReg<19,"x19", ["st"]>, DwarfRegNum<[19]>;

// Stack Pointer
def X20 : ThruReg<20,"x20", ["sp"]>, DwarfRegNum<[20]>;

// Frame Pointer
def X21 : ThruReg<21,"x21", ["fp"]>, DwarfRegNum<[21]>;

// Literal Vector
def X22 : ThruReg<22,"x22", ["lv"]>, DwarfRegNum<[22]>;

// Extra registers for later
// State Register
// Configuration Registers
/*
def X23 : ThruReg<23,"x23", [""]>, DwarfRegNum<[23]>;
def X24 : ThruReg<24,"x24", [""]>, DwarfRegNum<[24]>;
def X25 : ThruReg<25,"x25", [""]>, DwarfRegNum<[25]>;
def X26 : ThruReg<26,"x26", [""]>, DwarfRegNum<[26]>;
def X27 : ThruReg<27,"x27", [""]>, DwarfRegNum<[27]>;
def X28 : ThruReg<28,"x28", [""]>, DwarfRegNum<[28]>;
def X29 : ThruReg<29,"x29", [""]>, DwarfRegNum<[29]>;
def X30 : ThruReg<30,"x30", [""]>, DwarfRegNum<[30]>;
def X31 : ThruReg<31,"x31", [""]>, DwarfRegNum<[31]>;
*/

// The order of registers represents the preferred allocation sequence.
def GPR : RegisterClass<"Thru", [i32], 32, (add(sequence "X%u", 0, 7))>;
def IP  : RegisterClass<"Thru", [i32], 32, (add(sequence "X%u", 8, 11))>;
def OP  : RegisterClass<"Thru", [i32], 32, (add(sequence "X%u", 12, 15))>;
def IQ  : RegisterClass<"Thru", [i32], 32, (add X16)>;
def OQ  : RegisterClass<"Thru", [i32], 32, (add X17)>;
def LD  : RegisterClass<"Thru", [i32], 32, (add X18)>;
def ST  : RegisterClass<"Thru", [i32], 32, (add X19)>;
def SP  : RegisterClass<"Thru", [i32], 32, (add X20)>;
def FP  : RegisterClass<"Thru", [i32], 32, (add X21)>;
def LV  : RegisterClass<"Thru", [i32], 32, (add X22)>;
