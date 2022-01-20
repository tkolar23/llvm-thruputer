; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+d -verify-machineinstrs < %s \
; RUN:   -target-abi=ilp32d | FileCheck -check-prefix=RV32IFD %s
; RUN: llc -mtriple=riscv64 -mattr=+d -verify-machineinstrs < %s \
; RUN:   -target-abi=lp64d | FileCheck -check-prefix=RV64IFD %s

declare void @abort()
declare void @exit(i32)

define void @br_fcmp_false(double %a, double %b) nounwind {
; RV32IFD-LABEL: br_fcmp_false:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    li a0, 1
; RV32IFD-NEXT:    bnez a0, .LBB0_2
; RV32IFD-NEXT:  # %bb.1: # %if.then
; RV32IFD-NEXT:    ret
; RV32IFD-NEXT:  .LBB0_2: # %if.else
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    call abort@plt
;
; RV64IFD-LABEL: br_fcmp_false:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    li a0, 1
; RV64IFD-NEXT:    bnez a0, .LBB0_2
; RV64IFD-NEXT:  # %bb.1: # %if.then
; RV64IFD-NEXT:    ret
; RV64IFD-NEXT:  .LBB0_2: # %if.else
; RV64IFD-NEXT:    addi sp, sp, -16
; RV64IFD-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IFD-NEXT:    call abort@plt
  %1 = fcmp false double %a, %b
  br i1 %1, label %if.then, label %if.else
if.then:
  ret void
if.else:
  tail call void @abort()
  unreachable
}

define void @br_fcmp_oeq(double %a, double %b) nounwind {
; RV32IFD-LABEL: br_fcmp_oeq:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    feq.d a0, fa0, fa1
; RV32IFD-NEXT:    bnez a0, .LBB1_2
; RV32IFD-NEXT:  # %bb.1: # %if.else
; RV32IFD-NEXT:    ret
; RV32IFD-NEXT:  .LBB1_2: # %if.then
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    call abort@plt
;
; RV64IFD-LABEL: br_fcmp_oeq:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    feq.d a0, fa0, fa1
; RV64IFD-NEXT:    bnez a0, .LBB1_2
; RV64IFD-NEXT:  # %bb.1: # %if.else
; RV64IFD-NEXT:    ret
; RV64IFD-NEXT:  .LBB1_2: # %if.then
; RV64IFD-NEXT:    addi sp, sp, -16
; RV64IFD-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IFD-NEXT:    call abort@plt
  %1 = fcmp oeq double %a, %b
  br i1 %1, label %if.then, label %if.else
if.else:
  ret void
if.then:
  tail call void @abort()
  unreachable
}

; TODO: generated code quality for this is very poor due to
; DAGCombiner::visitXOR converting the legal setoeq to setune, which requires
; expansion.
define void @br_fcmp_oeq_alt(double %a, double %b) nounwind {
; RV32IFD-LABEL: br_fcmp_oeq_alt:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    feq.d a0, fa0, fa1
; RV32IFD-NEXT:    bnez a0, .LBB2_2
; RV32IFD-NEXT:  # %bb.1: # %if.else
; RV32IFD-NEXT:    ret
; RV32IFD-NEXT:  .LBB2_2: # %if.then
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    call abort@plt
;
; RV64IFD-LABEL: br_fcmp_oeq_alt:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    feq.d a0, fa0, fa1
; RV64IFD-NEXT:    bnez a0, .LBB2_2
; RV64IFD-NEXT:  # %bb.1: # %if.else
; RV64IFD-NEXT:    ret
; RV64IFD-NEXT:  .LBB2_2: # %if.then
; RV64IFD-NEXT:    addi sp, sp, -16
; RV64IFD-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IFD-NEXT:    call abort@plt
  %1 = fcmp oeq double %a, %b
  br i1 %1, label %if.then, label %if.else
if.then:
  tail call void @abort()
  unreachable
if.else:
  ret void
}

define void @br_fcmp_ogt(double %a, double %b) nounwind {
; RV32IFD-LABEL: br_fcmp_ogt:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    flt.d a0, fa1, fa0
; RV32IFD-NEXT:    bnez a0, .LBB3_2
; RV32IFD-NEXT:  # %bb.1: # %if.else
; RV32IFD-NEXT:    ret
; RV32IFD-NEXT:  .LBB3_2: # %if.then
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    call abort@plt
;
; RV64IFD-LABEL: br_fcmp_ogt:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    flt.d a0, fa1, fa0
; RV64IFD-NEXT:    bnez a0, .LBB3_2
; RV64IFD-NEXT:  # %bb.1: # %if.else
; RV64IFD-NEXT:    ret
; RV64IFD-NEXT:  .LBB3_2: # %if.then
; RV64IFD-NEXT:    addi sp, sp, -16
; RV64IFD-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IFD-NEXT:    call abort@plt
  %1 = fcmp ogt double %a, %b
  br i1 %1, label %if.then, label %if.else
if.else:
  ret void
if.then:
  tail call void @abort()
  unreachable
}

define void @br_fcmp_oge(double %a, double %b) nounwind {
; RV32IFD-LABEL: br_fcmp_oge:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    fle.d a0, fa1, fa0
; RV32IFD-NEXT:    bnez a0, .LBB4_2
; RV32IFD-NEXT:  # %bb.1: # %if.else
; RV32IFD-NEXT:    ret
; RV32IFD-NEXT:  .LBB4_2: # %if.then
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    call abort@plt
;
; RV64IFD-LABEL: br_fcmp_oge:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    fle.d a0, fa1, fa0
; RV64IFD-NEXT:    bnez a0, .LBB4_2
; RV64IFD-NEXT:  # %bb.1: # %if.else
; RV64IFD-NEXT:    ret
; RV64IFD-NEXT:  .LBB4_2: # %if.then
; RV64IFD-NEXT:    addi sp, sp, -16
; RV64IFD-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IFD-NEXT:    call abort@plt
  %1 = fcmp oge double %a, %b
  br i1 %1, label %if.then, label %if.else
if.else:
  ret void
if.then:
  tail call void @abort()
  unreachable
}

define void @br_fcmp_olt(double %a, double %b) nounwind {
; RV32IFD-LABEL: br_fcmp_olt:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    flt.d a0, fa0, fa1
; RV32IFD-NEXT:    bnez a0, .LBB5_2
; RV32IFD-NEXT:  # %bb.1: # %if.else
; RV32IFD-NEXT:    ret
; RV32IFD-NEXT:  .LBB5_2: # %if.then
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    call abort@plt
;
; RV64IFD-LABEL: br_fcmp_olt:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    flt.d a0, fa0, fa1
; RV64IFD-NEXT:    bnez a0, .LBB5_2
; RV64IFD-NEXT:  # %bb.1: # %if.else
; RV64IFD-NEXT:    ret
; RV64IFD-NEXT:  .LBB5_2: # %if.then
; RV64IFD-NEXT:    addi sp, sp, -16
; RV64IFD-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IFD-NEXT:    call abort@plt
  %1 = fcmp olt double %a, %b
  br i1 %1, label %if.then, label %if.else
if.else:
  ret void
if.then:
  tail call void @abort()
  unreachable
}

define void @br_fcmp_ole(double %a, double %b) nounwind {
; RV32IFD-LABEL: br_fcmp_ole:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    fle.d a0, fa0, fa1
; RV32IFD-NEXT:    bnez a0, .LBB6_2
; RV32IFD-NEXT:  # %bb.1: # %if.else
; RV32IFD-NEXT:    ret
; RV32IFD-NEXT:  .LBB6_2: # %if.then
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    call abort@plt
;
; RV64IFD-LABEL: br_fcmp_ole:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    fle.d a0, fa0, fa1
; RV64IFD-NEXT:    bnez a0, .LBB6_2
; RV64IFD-NEXT:  # %bb.1: # %if.else
; RV64IFD-NEXT:    ret
; RV64IFD-NEXT:  .LBB6_2: # %if.then
; RV64IFD-NEXT:    addi sp, sp, -16
; RV64IFD-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IFD-NEXT:    call abort@plt
  %1 = fcmp ole double %a, %b
  br i1 %1, label %if.then, label %if.else
if.else:
  ret void
if.then:
  tail call void @abort()
  unreachable
}

define void @br_fcmp_one(double %a, double %b) nounwind {
; RV32IFD-LABEL: br_fcmp_one:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    flt.d a0, fa0, fa1
; RV32IFD-NEXT:    flt.d a1, fa1, fa0
; RV32IFD-NEXT:    or a0, a1, a0
; RV32IFD-NEXT:    bnez a0, .LBB7_2
; RV32IFD-NEXT:  # %bb.1: # %if.else
; RV32IFD-NEXT:    ret
; RV32IFD-NEXT:  .LBB7_2: # %if.then
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    call abort@plt
;
; RV64IFD-LABEL: br_fcmp_one:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    flt.d a0, fa0, fa1
; RV64IFD-NEXT:    flt.d a1, fa1, fa0
; RV64IFD-NEXT:    or a0, a1, a0
; RV64IFD-NEXT:    bnez a0, .LBB7_2
; RV64IFD-NEXT:  # %bb.1: # %if.else
; RV64IFD-NEXT:    ret
; RV64IFD-NEXT:  .LBB7_2: # %if.then
; RV64IFD-NEXT:    addi sp, sp, -16
; RV64IFD-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IFD-NEXT:    call abort@plt
  %1 = fcmp one double %a, %b
  br i1 %1, label %if.then, label %if.else
if.else:
  ret void
if.then:
  tail call void @abort()
  unreachable
}

define void @br_fcmp_ord(double %a, double %b) nounwind {
; RV32IFD-LABEL: br_fcmp_ord:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    feq.d a0, fa1, fa1
; RV32IFD-NEXT:    feq.d a1, fa0, fa0
; RV32IFD-NEXT:    and a0, a1, a0
; RV32IFD-NEXT:    bnez a0, .LBB8_2
; RV32IFD-NEXT:  # %bb.1: # %if.else
; RV32IFD-NEXT:    ret
; RV32IFD-NEXT:  .LBB8_2: # %if.then
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    call abort@plt
;
; RV64IFD-LABEL: br_fcmp_ord:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    feq.d a0, fa1, fa1
; RV64IFD-NEXT:    feq.d a1, fa0, fa0
; RV64IFD-NEXT:    and a0, a1, a0
; RV64IFD-NEXT:    bnez a0, .LBB8_2
; RV64IFD-NEXT:  # %bb.1: # %if.else
; RV64IFD-NEXT:    ret
; RV64IFD-NEXT:  .LBB8_2: # %if.then
; RV64IFD-NEXT:    addi sp, sp, -16
; RV64IFD-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IFD-NEXT:    call abort@plt
  %1 = fcmp ord double %a, %b
  br i1 %1, label %if.then, label %if.else
if.else:
  ret void
if.then:
  tail call void @abort()
  unreachable
}

define void @br_fcmp_ueq(double %a, double %b) nounwind {
; RV32IFD-LABEL: br_fcmp_ueq:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    flt.d a0, fa0, fa1
; RV32IFD-NEXT:    flt.d a1, fa1, fa0
; RV32IFD-NEXT:    or a0, a1, a0
; RV32IFD-NEXT:    beqz a0, .LBB9_2
; RV32IFD-NEXT:  # %bb.1: # %if.else
; RV32IFD-NEXT:    ret
; RV32IFD-NEXT:  .LBB9_2: # %if.then
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    call abort@plt
;
; RV64IFD-LABEL: br_fcmp_ueq:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    flt.d a0, fa0, fa1
; RV64IFD-NEXT:    flt.d a1, fa1, fa0
; RV64IFD-NEXT:    or a0, a1, a0
; RV64IFD-NEXT:    beqz a0, .LBB9_2
; RV64IFD-NEXT:  # %bb.1: # %if.else
; RV64IFD-NEXT:    ret
; RV64IFD-NEXT:  .LBB9_2: # %if.then
; RV64IFD-NEXT:    addi sp, sp, -16
; RV64IFD-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IFD-NEXT:    call abort@plt
  %1 = fcmp ueq double %a, %b
  br i1 %1, label %if.then, label %if.else
if.else:
  ret void
if.then:
  tail call void @abort()
  unreachable
}

define void @br_fcmp_ugt(double %a, double %b) nounwind {
; RV32IFD-LABEL: br_fcmp_ugt:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    fle.d a0, fa0, fa1
; RV32IFD-NEXT:    beqz a0, .LBB10_2
; RV32IFD-NEXT:  # %bb.1: # %if.else
; RV32IFD-NEXT:    ret
; RV32IFD-NEXT:  .LBB10_2: # %if.then
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    call abort@plt
;
; RV64IFD-LABEL: br_fcmp_ugt:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    fle.d a0, fa0, fa1
; RV64IFD-NEXT:    beqz a0, .LBB10_2
; RV64IFD-NEXT:  # %bb.1: # %if.else
; RV64IFD-NEXT:    ret
; RV64IFD-NEXT:  .LBB10_2: # %if.then
; RV64IFD-NEXT:    addi sp, sp, -16
; RV64IFD-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IFD-NEXT:    call abort@plt
  %1 = fcmp ugt double %a, %b
  br i1 %1, label %if.then, label %if.else
if.else:
  ret void
if.then:
  tail call void @abort()
  unreachable
}

define void @br_fcmp_uge(double %a, double %b) nounwind {
; RV32IFD-LABEL: br_fcmp_uge:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    flt.d a0, fa0, fa1
; RV32IFD-NEXT:    beqz a0, .LBB11_2
; RV32IFD-NEXT:  # %bb.1: # %if.else
; RV32IFD-NEXT:    ret
; RV32IFD-NEXT:  .LBB11_2: # %if.then
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    call abort@plt
;
; RV64IFD-LABEL: br_fcmp_uge:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    flt.d a0, fa0, fa1
; RV64IFD-NEXT:    beqz a0, .LBB11_2
; RV64IFD-NEXT:  # %bb.1: # %if.else
; RV64IFD-NEXT:    ret
; RV64IFD-NEXT:  .LBB11_2: # %if.then
; RV64IFD-NEXT:    addi sp, sp, -16
; RV64IFD-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IFD-NEXT:    call abort@plt
  %1 = fcmp uge double %a, %b
  br i1 %1, label %if.then, label %if.else
if.else:
  ret void
if.then:
  tail call void @abort()
  unreachable
}

define void @br_fcmp_ult(double %a, double %b) nounwind {
; RV32IFD-LABEL: br_fcmp_ult:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    fle.d a0, fa1, fa0
; RV32IFD-NEXT:    beqz a0, .LBB12_2
; RV32IFD-NEXT:  # %bb.1: # %if.else
; RV32IFD-NEXT:    ret
; RV32IFD-NEXT:  .LBB12_2: # %if.then
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    call abort@plt
;
; RV64IFD-LABEL: br_fcmp_ult:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    fle.d a0, fa1, fa0
; RV64IFD-NEXT:    beqz a0, .LBB12_2
; RV64IFD-NEXT:  # %bb.1: # %if.else
; RV64IFD-NEXT:    ret
; RV64IFD-NEXT:  .LBB12_2: # %if.then
; RV64IFD-NEXT:    addi sp, sp, -16
; RV64IFD-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IFD-NEXT:    call abort@plt
  %1 = fcmp ult double %a, %b
  br i1 %1, label %if.then, label %if.else
if.else:
  ret void
if.then:
  tail call void @abort()
  unreachable
}

define void @br_fcmp_ule(double %a, double %b) nounwind {
; RV32IFD-LABEL: br_fcmp_ule:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    flt.d a0, fa1, fa0
; RV32IFD-NEXT:    beqz a0, .LBB13_2
; RV32IFD-NEXT:  # %bb.1: # %if.else
; RV32IFD-NEXT:    ret
; RV32IFD-NEXT:  .LBB13_2: # %if.then
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    call abort@plt
;
; RV64IFD-LABEL: br_fcmp_ule:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    flt.d a0, fa1, fa0
; RV64IFD-NEXT:    beqz a0, .LBB13_2
; RV64IFD-NEXT:  # %bb.1: # %if.else
; RV64IFD-NEXT:    ret
; RV64IFD-NEXT:  .LBB13_2: # %if.then
; RV64IFD-NEXT:    addi sp, sp, -16
; RV64IFD-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IFD-NEXT:    call abort@plt
  %1 = fcmp ule double %a, %b
  br i1 %1, label %if.then, label %if.else
if.else:
  ret void
if.then:
  tail call void @abort()
  unreachable
}

define void @br_fcmp_une(double %a, double %b) nounwind {
; RV32IFD-LABEL: br_fcmp_une:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    feq.d a0, fa0, fa1
; RV32IFD-NEXT:    beqz a0, .LBB14_2
; RV32IFD-NEXT:  # %bb.1: # %if.else
; RV32IFD-NEXT:    ret
; RV32IFD-NEXT:  .LBB14_2: # %if.then
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    call abort@plt
;
; RV64IFD-LABEL: br_fcmp_une:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    feq.d a0, fa0, fa1
; RV64IFD-NEXT:    beqz a0, .LBB14_2
; RV64IFD-NEXT:  # %bb.1: # %if.else
; RV64IFD-NEXT:    ret
; RV64IFD-NEXT:  .LBB14_2: # %if.then
; RV64IFD-NEXT:    addi sp, sp, -16
; RV64IFD-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IFD-NEXT:    call abort@plt
  %1 = fcmp une double %a, %b
  br i1 %1, label %if.then, label %if.else
if.else:
  ret void
if.then:
  tail call void @abort()
  unreachable
}

define void @br_fcmp_uno(double %a, double %b) nounwind {
; TODO: sltiu+bne -> beq
; RV32IFD-LABEL: br_fcmp_uno:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    feq.d a0, fa1, fa1
; RV32IFD-NEXT:    feq.d a1, fa0, fa0
; RV32IFD-NEXT:    and a0, a1, a0
; RV32IFD-NEXT:    beqz a0, .LBB15_2
; RV32IFD-NEXT:  # %bb.1: # %if.else
; RV32IFD-NEXT:    ret
; RV32IFD-NEXT:  .LBB15_2: # %if.then
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    call abort@plt
;
; RV64IFD-LABEL: br_fcmp_uno:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    feq.d a0, fa1, fa1
; RV64IFD-NEXT:    feq.d a1, fa0, fa0
; RV64IFD-NEXT:    and a0, a1, a0
; RV64IFD-NEXT:    beqz a0, .LBB15_2
; RV64IFD-NEXT:  # %bb.1: # %if.else
; RV64IFD-NEXT:    ret
; RV64IFD-NEXT:  .LBB15_2: # %if.then
; RV64IFD-NEXT:    addi sp, sp, -16
; RV64IFD-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IFD-NEXT:    call abort@plt
  %1 = fcmp uno double %a, %b
  br i1 %1, label %if.then, label %if.else
if.else:
  ret void
if.then:
  tail call void @abort()
  unreachable
}

define void @br_fcmp_true(double %a, double %b) nounwind {
; RV32IFD-LABEL: br_fcmp_true:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    li a0, 1
; RV32IFD-NEXT:    bnez a0, .LBB16_2
; RV32IFD-NEXT:  # %bb.1: # %if.else
; RV32IFD-NEXT:    ret
; RV32IFD-NEXT:  .LBB16_2: # %if.then
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32IFD-NEXT:    call abort@plt
;
; RV64IFD-LABEL: br_fcmp_true:
; RV64IFD:       # %bb.0:
; RV64IFD-NEXT:    li a0, 1
; RV64IFD-NEXT:    bnez a0, .LBB16_2
; RV64IFD-NEXT:  # %bb.1: # %if.else
; RV64IFD-NEXT:    ret
; RV64IFD-NEXT:  .LBB16_2: # %if.then
; RV64IFD-NEXT:    addi sp, sp, -16
; RV64IFD-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64IFD-NEXT:    call abort@plt
  %1 = fcmp true double %a, %b
  br i1 %1, label %if.then, label %if.else
if.else:
  ret void
if.then:
  tail call void @abort()
  unreachable
}
