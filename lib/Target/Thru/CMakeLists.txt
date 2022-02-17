add_llvm_component_group(Thru)

set(LLVM_TARGET_DEFINITIONS Thru.td)

tablegen(LLVM ThruGenRegisterInfo.inc -gen-register-info)
tablegen(LLVM ThruGenInstrInfo.inc -gen-instr-info)
tablegen(LLVM ThruGenCodeEmitter.inc -gen-emitter)
tablegen(LLVM ThruGenMCCodeEmitter.inc -gen-emitter)
tablegen(LLVM ThruGenAsmWriter.inc -gen-asm-writer)
tablegen(LLVM ThruGenDAGISel.inc -gen-dag-isel)
tablegen(LLVM ThruGenCallingConv.inc -gen-callingconv)
tablegen(LLVM ThruGenSubtargetInfo.inc -gen-subtarget)
tablegen(LLVM ThruGenMCPseudoLowering.inc -gen-pseudo-lowering)


# ThruCommonTableGen must be defined
add_public_tablegen_target(ThruCommonTableGen)

add_llvm_target(ThruCodeGen
  ThruAsmPrinter.cpp
  ThruFrameLowering.cpp
  ThruInstrInfo.cpp
  ThruISelLowering.cpp
  ThruRegisterInfo.cpp
  ThruSubtarget.cpp
  ThruTargetObjectFile.cpp
  ThruISelDAGToDAG.cpp
  ThruTargetMachine.cpp

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
