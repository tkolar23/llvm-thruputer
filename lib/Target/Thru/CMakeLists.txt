set(LLVM_TARGET_DEFINITIONS Thru.td)

tablegen(LLVM ThruGenAsmMatcher.inc -gen-asm-matcher)
tablegen(LLVM ThruGenAsmWriter.inc -gen-asm-writer)
tablegen(LLVM ThruGenCallingConv.inc -gen-callingconv)
tablegen(LLVM ThruGenDAGISel.inc -gen-dag-isel)
tablegen(LLVM ThruGenDisassemblerTables.inc -gen-disassembler)
tablegen(LLVM ThruGenFastISel.inc -gen-fast-isel)
tablegen(LLVM ThruGenGlobalISel.inc -gen-global-isel)
tablegen(LLVM ThruGenInstrInfo.inc -gen-instr-info)
tablegen(LLVM ThruGenMCCodeEmitter.inc -gen-emitter)
tablegen(LLVM ThruGenMCPseudoLowering.inc -gen-pseudo-lowering)
tablegen(LLVM ThruGenRegisterBank.inc -gen-register-bank)
tablegen(LLVM ThruGenRegisterInfo.inc -gen-register-info)
tablegen(LLVM ThruGenSubtargetInfo.inc -gen-subtarget)
tablegen(LLVM ThruGenExegesis.inc -gen-exegesis)

add_public_tablegen_target(ThruCommonTableGen)

add_llvm_target(ThruCodeGen

  LINK_COMPONENTS
  Analysis
  AsmPrinter
  CodeGen
  Core
  MC
  ThruDesc
  ThruInfo
  SelectionDAG
  Support
  Target
  GlobalISel

  ADD_TO_COMPONENT
  Thru
  )

add_subdirectory(AsmParser)
add_subdirectory(Disassembler)
add_subdirectory(MCTargetDesc)
add_subdirectory(TargetInfo)
