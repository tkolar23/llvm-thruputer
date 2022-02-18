//===-- ThruRegisterInfo.td - Thru Register defs ---------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
//  Declarations that describe the Thru register file
//===----------------------------------------------------------------------===//

class ThruReg<bits<16> Enc, string n> : Register<n> {
  let HWEncoding = Enc;
  let Namespace = "Thru";
}

// ThruPuter CPU Registers
class ThruGPRReg<bits<16> Enc, string n> : ThruReg<Enc, n>;

let Namespace = "Thru" in {
  // General Purpose Registers
  def R0 : ThruGPRReg< 0, "0" >, DwarfRegNum<[0]>;
  def R1 : ThruGPRReg< 1, "1" >, DwarfRegNum<[1]>;
  def R2 : ThruGPRReg< 2, "2" >, DwarfRegNum<[2]>;
  def R3 : ThruGPRReg< 3, "3" >, DwarfRegNum<[3]>;
  def R4 : ThruGPRReg< 4, "4" >, DwarfRegNum<[4]>;
  def R5 : ThruGPRReg< 5, "5" >, DwarfRegNum<[5]>;
  def R6 : ThruGPRReg< 6, "6" >, DwarfRegNum<[6]>;
  def R7 : ThruGPRReg< 7, "7" >, DwarfRegNum<[7]>;
}

//===----------------------------------------------------------------------===//
// Register Classes
//===----------------------------------------------------------------------===//

def IntRegs : RegisterClass<"TP", [i64], 64, (add (sequence "R%u", 0, 7))>;
