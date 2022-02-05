add_llvm_component_group(Thru)

set(LLVM_TARGET_DEFINITIONS Thru.td)

# tablegen(LLVM ThruGenAsmMatcher.inc -gen-asm-matcher)
# tablegen(LLVM ThruGenAsmWriter.inc -gen-asm-writer)
# tablegen(LLVM ThruGenCompressInstEmitter.inc -gen-compress-inst-emitter)
# tablegen(LLVM ThruGenDAGISel.inc -gen-dag-isel)
# tablegen(LLVM ThruGenDisassemblerTables.inc -gen-disassembler)
# tablegen(LLVM ThruGenGlobalISel.inc -gen-global-isel)
# tablegen(LLVM ThruGenInstrInfo.inc -gen-instr-info)
# tablegen(LLVM ThruGenMCCodeEmitter.inc -gen-emitter)
# tablegen(LLVM ThruGenMCPseudoLowering.inc -gen-pseudo-lowering)
# tablegen(LLVM ThruGenRegisterBank.inc -gen-register-bank)
tablegen(LLVM ThruGenRegisterInfo.inc -gen-register-info)
# tablegen(LLVM ThruGenSearchableTables.inc -gen-searchable-tables)
# tablegen(LLVM ThruGenSubtargetInfo.inc -gen-subtarget)

add_public_tablegen_target(ThruCommonTableGen)

add_llvm_target(ThruCodeGen
  # ThruAsmPrinter.cpp
  # ThruCallLowering.cpp
  # ThruExpandAtomicPseudoInsts.cpp
  # ThruExpandPseudoInsts.cpp
  # ThruFrameLowering.cpp
  # ThruGatherScatterLowering.cpp
  # ThruInsertVSETVLI.cpp
  # ThruInstrInfo.cpp
  # ThruInstructionSelector.cpp
  # ThruISelDAGToDAG.cpp
  # ThruISelLowering.cpp
  # ThruLegalizerInfo.cpp
  # ThruMCInstLower.cpp
  # ThruMergeBaseOffset.cpp
  # ThruRegisterBankInfo.cpp
  # ThruRegisterInfo.cpp
  # ThruSExtWRemoval.cpp
  # ThruSubtarget.cpp
  ThruTargetMachine.cpp
  # ThruTargetObjectFile.cpp
  # ThruTargetTransformInfo.cpp

  LINK_COMPONENTS
  Analysis
  AsmPrinter
  Core
  CodeGen
  MC
  ThruDesc
  ThruInfo
  SelectionDAG
  Support
  Target
  TransformUtils
  GlobalISel

  ADD_TO_COMPONENT
  Thru
  )

# add_subdirectory(AsmParser)
# add_subdirectory(Disassembler)
add_subdirectory(MCTargetDesc)
add_subdirectory(TargetInfo)
