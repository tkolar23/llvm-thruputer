//=== ThruCallingConv.td - Calling Conventions for Thru --*- tablegen -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
// This describes the calling conventions for Thru architecture.
//===----------------------------------------------------------------------===//

def Thru_CCallingConv : CallingConv<[
  // Handles byval parameters. Tell LLVM what the size and alignment
  // requirements of each stack slot are
  CCIfByVal<CCPassByVal<4, 4>>,

  // Promote i8/i16 to i32
  // CCIfType<[i1, i8, i16], CCPromoteToType<i32>>,
  CCIfType<[i1, i8, i16, i32], CCPromoteToType<i64>>,

  // The first 4 arguments are passed in X0, X1, X2, X3
  // CCIfType<[i32], CCAssignToReg<[X0, X1, X2, X3]>>,
  CCIfType<[i64], CCAssignToReg<[X0, X1, X2, X3]>>,

  // Integer values get stored in stack slots that are 4 bytes in size and
  // 4-byte aligned
  // CCIfType<[i32], CCAssignToStack<4, 4>>
  CCIfType<[i64], CCAssignToStack<4, 4>>
]>;

// BeyondRISC C Return Convention
def Thru_CRetConv : CallingConv<[
  // CCIfType<[i1, i8, i16], CCPromoteToType<i32>>,
  CCIfType<[i1, i8, i16, i32], CCPromoteToType<i64>>,

  // i32 are returned in registers X0, X1
  // CCIfType<[i32], CCAssignToReg<[X0, X1, X2, X3]>>,
  CCIfType<[i64], CCAssignToReg<[X0, X1, X2, X3]>>,

  // Integer values get stored in stack slots that are 4 bytes in size and
  // 4-byte aligned
  // CCIfType<[i32], CCAssignToStack<4, 4>>
  CCIfType<[i64], CCAssignToStack<4, 4>>
]>;

def Thru_CalleeSavedRegs : CalleeSavedRegs<(add X8, X9)>;