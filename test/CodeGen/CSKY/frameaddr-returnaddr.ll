; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=csky -verify-machineinstrs -csky-no-aliases -mattr=+2e3 < %s \
; RUN:   | FileCheck %s

declare void @notdead(i8*)
declare i8* @llvm.frameaddress(i32)
declare i8* @llvm.returnaddress(i32)

define i8* @test_frameaddress_0() nounwind {
; CHECK-LABEL: test_frameaddress_0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    subi16 sp, sp, 4
; CHECK-NEXT:    st32.w l4, (sp, 0) # 4-byte Folded Spill
; CHECK-NEXT:    mov16 l4, sp
; CHECK-NEXT:    mov16 a0, l4
; CHECK-NEXT:    mov16 sp, l4
; CHECK-NEXT:    ld32.w l4, (sp, 0) # 4-byte Folded Reload
; CHECK-NEXT:    addi16 sp, sp, 4
; CHECK-NEXT:    rts16
  %1 = call i8* @llvm.frameaddress(i32 0)
  ret i8* %1
}

define i8* @test_frameaddress_2() nounwind {
; CHECK-LABEL: test_frameaddress_2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    subi16 sp, sp, 4
; CHECK-NEXT:    st32.w l4, (sp, 0) # 4-byte Folded Spill
; CHECK-NEXT:    mov16 l4, sp
; CHECK-NEXT:    ld32.w a0, (l4, 0)
; CHECK-NEXT:    ld16.w a0, (a0, 0)
; CHECK-NEXT:    mov16 sp, l4
; CHECK-NEXT:    ld32.w l4, (sp, 0) # 4-byte Folded Reload
; CHECK-NEXT:    addi16 sp, sp, 4
; CHECK-NEXT:    rts16
  %1 = call i8* @llvm.frameaddress(i32 2)
  ret i8* %1
}

define i8* @test_frameaddress_3_alloca() nounwind {
; CHECK-LABEL: test_frameaddress_3_alloca:
; CHECK:       # %bb.0:
; CHECK-NEXT:    subi16 sp, sp, 8
; CHECK-NEXT:    st32.w lr, (sp, 4) # 4-byte Folded Spill
; CHECK-NEXT:    st32.w l4, (sp, 0) # 4-byte Folded Spill
; CHECK-NEXT:    mov16 l4, sp
; CHECK-NEXT:    subi16 sp, sp, 100
; CHECK-NEXT:    movi16 a0, 0
; CHECK-NEXT:    addu16 a0, sp
; CHECK-NEXT:    jsri32 [.LCPI2_0]
; CHECK-NEXT:    ld32.w a0, (l4, 0)
; CHECK-NEXT:    ld16.w a0, (a0, 0)
; CHECK-NEXT:    ld16.w a0, (a0, 0)
; CHECK-NEXT:    mov16 sp, l4
; CHECK-NEXT:    ld32.w l4, (sp, 0) # 4-byte Folded Reload
; CHECK-NEXT:    ld32.w lr, (sp, 4) # 4-byte Folded Reload
; CHECK-NEXT:    addi16 sp, sp, 8
; CHECK-NEXT:    rts16
  %1 = alloca [100 x i8]
  %2 = bitcast [100 x i8]* %1 to i8*
  call void @notdead(i8* %2)
  %3 = call i8* @llvm.frameaddress(i32 3)
  ret i8* %3
}

define i8* @test_returnaddress_0() nounwind {
; CHECK-LABEL: test_returnaddress_0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    mov16 a0, lr
; CHECK-NEXT:    rts16
  %1 = call i8* @llvm.returnaddress(i32 0)
  ret i8* %1
}

define i8* @test_returnaddress_2() nounwind {
; CHECK-LABEL: test_returnaddress_2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    subi16 sp, sp, 4
; CHECK-NEXT:    st32.w l4, (sp, 0) # 4-byte Folded Spill
; CHECK-NEXT:    mov16 l4, sp
; CHECK-NEXT:    ld32.w a0, (l4, 0)
; CHECK-NEXT:    ld16.w a0, (a0, 0)
; CHECK-NEXT:    ld16.w a0, (a0, 4)
; CHECK-NEXT:    mov16 sp, l4
; CHECK-NEXT:    ld32.w l4, (sp, 0) # 4-byte Folded Reload
; CHECK-NEXT:    addi16 sp, sp, 4
; CHECK-NEXT:    rts16
  %1 = call i8* @llvm.returnaddress(i32 2)
  ret i8* %1
}
