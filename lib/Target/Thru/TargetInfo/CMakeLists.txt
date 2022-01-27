add_llvm_component_library(LLVMThruInfo
  ThruTargetInfo.cpp

  LINK_COMPONENTS
  MC
  Support

  ADD_TO_COMPONENT
  Thru
  )
