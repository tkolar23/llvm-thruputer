add_llvm_component_library(LLVMThruDesc
  ThruMCAsmInfo.cpp
  ThruMCTargetDesc.cpp
  ThruInstPrinter.cpp

  LINK_COMPONENTS
  MC
  ThruInfo
  Support

  ADD_TO_COMPONENT
  Thru
)
