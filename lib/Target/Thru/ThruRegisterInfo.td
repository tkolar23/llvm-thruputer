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

class ThruReg<bits<4> Enc, string n> : Register<n> {
  let HWEncoding = Enc;
  let Namespace = "TP";
}
