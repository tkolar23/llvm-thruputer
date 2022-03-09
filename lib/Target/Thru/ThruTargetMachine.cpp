//===-- ThruTargetMachine.cpp - Define TargetMachine for Thru -------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Implements the info about Thru target spec.
//
//===----------------------------------------------------------------------===//

#include "ThruTargetMachine.h"
#include "ThruISelDAGToDAG.h"
#include "ThruSubtarget.h"
#include "ThruTargetObjectFile.h"
#include "TargetInfo/ThruTargetInfo.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/TargetPassConfig.h"
#include "llvm/MC/TargetRegistry.h"

using namespace llvm;

extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeThruTarget() {
  // Register the target.
  //- Little endian Target Machine
  RegisterTargetMachine<ThruTargetMachine> X(getTheThruTarget());
}

static std::string computeDataLayout() {
  std::string Ret = "";

  // Little endian
  Ret += "e";
  
  // 64-bit natural stack alignment
  Ret += "-S64";
  
  // 64-bit pointers, 64-bit aligned
  Ret += "-p:64:64";
  
  // 64-bit integers, 64 bit aligned
  Ret += "-i64:64";

  // ELF name mangling
  Ret += "-m:e";

  // 64-bit native integer width i.e register are 64-bit
  Ret += "-n64";

  return Ret;
}

static Reloc::Model getEffectiveRelocModel(Optional<CodeModel::Model> CM,
                                           Optional<Reloc::Model> RM) {
  if (!RM.hasValue())
    return Reloc::Static;
  return *RM;
}

ThruTargetMachine::ThruTargetMachine(const Target &T, const Triple &TT,
                                       StringRef CPU, StringRef FS,
                                       const TargetOptions &Options,
                                       Optional<Reloc::Model> RM,
                                       Optional<CodeModel::Model> CM,
                                       CodeGenOpt::Level OL,
                                       bool JIT)
    : LLVMTargetMachine(T, computeDataLayout(), TT, CPU, FS, Options,
                        getEffectiveRelocModel(CM, RM),
                        getEffectiveCodeModel(CM, CodeModel::Medium), OL),
      TLOF(std::make_unique<ThruTargetObjectFile>()) {
  // initAsmInfo will display features by llc -march=thru on 3.7
  initAsmInfo();
}

const ThruSubtarget *
ThruTargetMachine::getSubtargetImpl(const Function &F) const {
  Attribute CPUAttr = F.getFnAttribute("target-cpu");
  Attribute TuneAttr = F.getFnAttribute("tune-cpu");
  Attribute FSAttr = F.getFnAttribute("target-features");

  std::string CPU =
      CPUAttr.isValid() ? CPUAttr.getValueAsString().str() : TargetCPU;
  std::string TuneCPU =
      TuneAttr.isValid() ? TuneAttr.getValueAsString().str() : CPU;
  std::string FS =
      FSAttr.isValid() ? FSAttr.getValueAsString().str() : TargetFS;
  std::string Key = CPU + TuneCPU + FS;
  auto &I = SubtargetMap[Key];
  if (!I) {
    // This needs to be done before we create a new subtarget since any
    // creation will depend on the TM and the code generation flags on the
    // function that reside in TargetOptions.
    resetTargetOptions(F);
    auto ABIName = Options.MCOptions.getABIName();
    I = std::make_unique<ThruSubtarget>(TargetTriple, CPU, TuneCPU, FS, ABIName, *this);
  }
  return I.get();
}

namespace {
class ThruPassConfig : public TargetPassConfig {
public:
  ThruPassConfig(ThruTargetMachine &TM, PassManagerBase &PM)
    : TargetPassConfig(TM, PM) {}

  ThruTargetMachine &getThruTargetMachine() const {
    return getTM<ThruTargetMachine>();
  }

  bool addInstSelector() override;
  void addPreEmitPass() override;
};
}

TargetPassConfig *ThruTargetMachine::createPassConfig(PassManagerBase &PM) {
  return new ThruPassConfig(*this, PM);
}

// Install an instruction selector pass using
// the ISelDag to gen Thru code.
bool ThruPassConfig::addInstSelector() {
  addPass(new ThruDAGToDAGISel(getThruTargetMachine(), getOptLevel()));
  return false;
}

// Implemented by targets that want to run passes immediately before
// machine code is emitted. return true if -print-machineinstrs should
// print out the code after the passes.
void ThruPassConfig::addPreEmitPass() {
}