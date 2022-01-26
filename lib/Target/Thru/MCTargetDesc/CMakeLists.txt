add_llvm_component_library(LLVMThruDesc
  ThruMCTargetDesc.cpp

  LINK_COMPONENTS
  MC
  ThruInfo
  Support

  ADD_TO_COMPONENT
  Thru
)
