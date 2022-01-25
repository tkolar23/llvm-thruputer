//===-- ThruTargetMachine.cpp - Define TargetMachine for Thru -----------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// Implements the info about Thru target spec.
//
//===----------------------------------------------------------------------===//

#include "ThruTargetMachine.h"
// #include "MCTargetDesc/ThruBaseInfo.h"
#include "Thru.h"
// #include "ThruTargetObjectFile.h"
// #include "ThruTargetTransformInfo.h"
#include "TargetInfo/ThruTargetInfo.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/Analysis/TargetTransformInfo.h"
#include "llvm/CodeGen/GlobalISel/IRTranslator.h"
#include "llvm/CodeGen/GlobalISel/InstructionSelect.h"
#include "llvm/CodeGen/GlobalISel/Legalizer.h"
#include "llvm/CodeGen/GlobalISel/RegBankSelect.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/TargetLoweringObjectFileImpl.h"
#include "llvm/CodeGen/TargetPassConfig.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/InitializePasses.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Target/TargetOptions.h"
using namespace llvm;

// extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeThruTarget() {
//   RegisterTargetMachine<ThruTargetMachine> X(getTheThruTarget());
// }

static StringRef computeDataLayout(const Triple &TT) {
  if (TT.isArch64Bit())
    return "e-m:e-p:64:64-i64:64-i128:128-n64-S128";
  assert(TT.isArch32Bit() && "only RV32 and RV64 are currently supported");
  return "e-m:e-p:32:32-i64:64-n32-S128";
}

// static Reloc::Model getEffectiveRelocModel(const Triple &TT,
//                                            Optional<Reloc::Model> RM) {
//   if (!RM.hasValue())
//     return Reloc::Static;
//   return *RM;
// }

// ThruTargetMachine::ThruTargetMachine(const Target &T, const Triple &TT,
//                                        StringRef CPU, StringRef FS,
//                                        const TargetOptions &Options,
//                                        Optional<Reloc::Model> RM,
//                                        Optional<CodeModel::Model> CM,
//                                        CodeGenOpt::Level OL, bool JIT)
//     : LLVMTargetMachine(T, computeDataLayout(TT), TT, CPU, FS, Options,
//                         getEffectiveRelocModel(TT, RM),
//                         getEffectiveCodeModel(CM, CodeModel::Small), OL),
//       TLOF(std::make_unique<ThruELFTargetObjectFile>()) {
//   initAsmInfo();

//   // RISC-V supports the MachineOutliner.
//   setMachineOutliner(true);
// }

// const ThruSubtarget *
// ThruTargetMachine::getSubtargetImpl(const Function &F) const {
//   Attribute CPUAttr = F.getFnAttribute("target-cpu");
//   Attribute TuneAttr = F.getFnAttribute("tune-cpu");
//   Attribute FSAttr = F.getFnAttribute("target-features");

//   std::string CPU =
//       CPUAttr.isValid() ? CPUAttr.getValueAsString().str() : TargetCPU;
//   std::string TuneCPU =
//       TuneAttr.isValid() ? TuneAttr.getValueAsString().str() : CPU;
//   std::string FS =
//       FSAttr.isValid() ? FSAttr.getValueAsString().str() : TargetFS;
//   std::string Key = CPU + TuneCPU + FS;
//   auto &I = SubtargetMap[Key];
//   if (!I) {
//     // This needs to be done before we create a new subtarget since any
//     // creation will depend on the TM and the code generation flags on the
//     // function that reside in TargetOptions.
//     resetTargetOptions(F);
//     auto ABIName = Options.MCOptions.getABIName();
//     if (const MDString *ModuleTargetABI = dyn_cast_or_null<MDString>(
//             F.getParent()->getModuleFlag("target-abi"))) {
//       auto TargetABI = ThruABI::getTargetABI(ABIName);
//       if (TargetABI != ThruABI::ABI_Unknown &&
//           ModuleTargetABI->getString() != ABIName) {
//         report_fatal_error("-target-abi option != target-abi module flag");
//       }
//       ABIName = ModuleTargetABI->getString();
//     }
//     I = std::make_unique<ThruSubtarget>(TargetTriple, CPU, TuneCPU, FS, ABIName, *this);
//   }
//   return I.get();
// }

// TargetTransformInfo
// ThruTargetMachine::getTargetTransformInfo(const Function &F) {
//   return TargetTransformInfo(ThruTTIImpl(this, F));
// }

// A RISC-V hart has a single byte-addressable address space of 2^XLEN bytes
// for all memory accesses, so it is reasonable to assume that an
// implementation has no-op address space casts. If an implementation makes a
// change to this, they can override it here.
// bool ThruTargetMachine::isNoopAddrSpaceCast(unsigned SrcAS,
//                                              unsigned DstAS) const {
//   return true;
// }