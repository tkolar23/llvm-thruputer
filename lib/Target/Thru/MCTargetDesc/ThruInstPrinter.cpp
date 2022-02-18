//===-- ThruInstPrinter.cpp - Convert Thru MCInst to assembly syntax ----===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This class prints an Thru MCInst to a .s file.
//
//===----------------------------------------------------------------------===//

#include "ThruInstPrinter.h"

#include "ThruInstrInfo.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"
using namespace llvm;

#define DEBUG_TYPE "thru-isel"

#define PRINT_ALIAS_INSTR
#include "ThruGenAsmWriter.inc"

static cl::opt<bool>
    NoAliases("thru-no-aliases",
              cl::desc("Disable the emission of assembler pseudo instructions"),
              cl::init(false), cl::Hidden);

void ThruInstPrinter::printInst(const MCInst *MI, uint64_t Address,
                                 StringRef Annot, const MCSubtargetInfo &STI,
                                 raw_ostream &O) {
  const MCInst *NewMI = MI;
  // If this is uncommented, the instructions won't print
  // if (!PrintAliases || NoAliases)
  printInstruction(NewMI, Address, O);
  printAnnotation(O, Annot);
}

void ThruInstPrinter::printRegName(raw_ostream &O, unsigned RegNo) const {
  O << StringRef(getRegisterName(RegNo)).lower();
}

void ThruInstPrinter::printOperand(const MCInst *MI, unsigned OpNo, 
                                   raw_ostream &O, const char *Modifier) {
  assert((Modifier == nullptr || Modifier[0] == 0) && "No modifiers supported");
  const MCOperand &MO = MI->getOperand(OpNo);

  if (MO.isReg()) {
    printRegName(O, MO.getReg());
    return;
  }

  if (MO.isImm()) {
    O << MO.getImm();
    return;
  }

  assert(MO.isExpr() && "Unknown operand kind in printOperand");
  MO.getExpr()->print(O, &MAI, true);
}
