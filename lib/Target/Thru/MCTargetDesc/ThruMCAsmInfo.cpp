//===-- ThruMCAsmInfo.cpp - Thru Asm Properties -------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the declarations of the ThruMCAsmInfo properties.
//
//===----------------------------------------------------------------------===//

#include "ThruMCAsmInfo.h"

#include "llvm/ADT/Triple.h"

using namespace llvm;

void ThruMCAsmInfo::anchor() { }

ThruMCAsmInfo::ThruMCAsmInfo(const Triple &TargetTriple) {
  AlignmentIsInBytes          = false;
  SupportsDebugInformation    = true;
  ExceptionsType              = ExceptionHandling::DwarfCFI;
  DwarfRegNumForCFI           = true;
  Data16bitsDirective         = "\t.hword\t";
  Data32bitsDirective         = "\t.word\t";
  Data64bitsDirective         = "\t.dword\t";
}
