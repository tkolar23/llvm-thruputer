set(LLVM_TARGET_DEFINITIONS Thru.td)

add_public_tablegen_target(ThruCommonTableGen)

add_llvm_target(ThruCodeGen

  LINK_COMPONENTS
  Target

  ADD_TO_COMPONENT
  Thru
  )

add_subdirectory(MCTargetDesc)
add_subdirectory(TargetInfo)
