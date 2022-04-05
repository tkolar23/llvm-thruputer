//===-- ThruAsmPrinter.cpp - Thru LLVM Assembly Printer -----------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains a printer that converts from our internal representation
// of machine-dependent LLVM code to ThruPuter assembly language.
//
//===----------------------------------------------------------------------===//

#include "ThruInstrInfo.h"
#include "ThruTargetMachine.h"
#include "MCTargetDesc/ThruInstPrinter.h"
#include "TargetInfo/ThruTargetInfo.h"
#include "llvm/CodeGen/AsmPrinter.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineOperand.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/TargetRegistry.h"

using namespace llvm;

#define DEBUG_TYPE "thru-asm-printer"

namespace llvm {
class ThruAsmPrinter : public AsmPrinter {
public:
  explicit ThruAsmPrinter(TargetMachine &TM,
                           std::unique_ptr<MCStreamer> Streamer)
    : AsmPrinter(TM, std::move(Streamer)) {}

  virtual StringRef getPassName() const override {
    return "Thru Assembly Printer";
  }

  void emitInstruction(const MachineInstr *MI) override;

  // This function must be present as it is internally used by the
  // auto-generated function emitPseudoExpansionLowering to expand pseudo
  // instruction
  void EmitToStreamer(MCStreamer &S, const MCInst &Inst);
  // Auto-generated function in ThruGenMCPseudoLowering.inc
  bool emitPseudoExpansionLowering(MCStreamer &OutStreamer,
                                   const MachineInstr *MI);

private:
  void LowerInstruction(const MachineInstr *MI, MCInst &OutMI) const;
  MCOperand LowerOperand(const MachineOperand& MO) const;
  MCOperand LowerSymbolOperand(const MachineOperand &MO, MCSymbol *Sym) const;
};
}

// Simple pseudo-instructions have their lowering (with expansion to real
// instructions) auto-generated.
#include "ThruGenMCPseudoLowering.inc"
void ThruAsmPrinter::EmitToStreamer(MCStreamer &S, const MCInst &Inst) {
  AsmPrinter::EmitToStreamer(*OutStreamer, Inst);
}

// MI instructions will be dispatched one at a time to this function
// Transforms MI instruction into an MCInst instance (MCInstLowering interface)
void ThruAsmPrinter::emitInstruction(const MachineInstr *MI) {
    // Do any auto-generated pseudo lowerings.
    if (emitPseudoExpansionLowering(*OutStreamer, MI))
    return;

    MCInst MCB;
    MCB.setOpcode(Thru::BUNDLE);
    MCB.addOperand(MCOperand::createImm(0));

    const MachineBasicBlock* MBB = MI->getParent();
    MachineBasicBlock::const_instr_iterator MII = MI->getIterator();

    for (++MII; MII != MBB->instr_end() && MII->isInsideBundle(); ++MII) {
        LowerInstruction(&*MII, MCB);
    }

    EmitToStreamer(*OutStreamer, MCB);
}

void ThruAsmPrinter::LowerInstruction(const MachineInstr *MI,
                                       MCInst &MCB) const {

    MCInst *MCI = this->OutContext.createMCInst();
    MCI->setOpcode(MI->getOpcode());
    assert(MCI->getOpcode() == static_cast<unsigned>(MI->getOpcode()) &&
           "MCI opcode should have been set on construction");

    for (const MachineOperand &MO : MI->operands()) {
        MCOperand MCOp = LowerOperand(MO);
        if (MCOp.isValid())
            MCI->addOperand(MCOp);
    }
    MCB.addOperand(MCOperand::createInst(MCI));
}

MCOperand ThruAsmPrinter::LowerOperand(const MachineOperand& MO) const {
  switch (MO.getType()) {
  case MachineOperand::MO_Register:
    // Ignore all implicit register operands.
    if (MO.isImplicit()) {
      break;
    }
    return MCOperand::createReg(MO.getReg());

  case MachineOperand::MO_Immediate:
    return MCOperand::createImm(MO.getImm());

  case MachineOperand::MO_MachineBasicBlock:
    return LowerSymbolOperand(MO, MO.getMBB()->getSymbol());

  case MachineOperand::MO_GlobalAddress:
    return LowerSymbolOperand(MO, getSymbol(MO.getGlobal()));

  case MachineOperand::MO_BlockAddress:
    return LowerSymbolOperand(MO, GetBlockAddressSymbol(MO.getBlockAddress()));

  case MachineOperand::MO_ExternalSymbol:
    return LowerSymbolOperand(MO, GetExternalSymbolSymbol(MO.getSymbolName()));

  case MachineOperand::MO_ConstantPoolIndex:
    return LowerSymbolOperand(MO, GetCPISymbol(MO.getIndex()));

  case MachineOperand::MO_RegisterMask:
    break;

  default:
    report_fatal_error("unknown operand type");
 }

  return MCOperand();
}

MCOperand ThruAsmPrinter::LowerSymbolOperand(const MachineOperand &MO,
                                              MCSymbol *Sym) const {
  MCContext &Ctx = OutContext;

  const MCExpr *Expr =
    MCSymbolRefExpr::create(Sym, MCSymbolRefExpr::VK_None, Ctx);

  if (!MO.isJTI() && !MO.isMBB() && MO.getOffset())
    Expr = MCBinaryExpr::createAdd(
        Expr, MCConstantExpr::create(MO.getOffset(), Ctx), Ctx);

  return MCOperand::createExpr(Expr);
}

// Force static initialization.
extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeThruAsmPrinter() {
  RegisterAsmPrinter<ThruAsmPrinter> X(getTheThruTarget());
}