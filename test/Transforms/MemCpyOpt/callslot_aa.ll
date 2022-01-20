; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -S -basic-aa -memcpyopt -verify-memoryssa | FileCheck %s
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

%T = type { i64, i64 }

define void @test(i8* %src) {
; CHECK-LABEL: @test(
; CHECK-NEXT:    [[TMP:%.*]] = alloca i8, align 1
; CHECK-NEXT:    [[DST:%.*]] = alloca i8, align 1
; CHECK-NEXT:    call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 [[DST]], i8* align 8 [[SRC:%.*]], i64 1, i1 false)
; CHECK-NEXT:    ret void
;
  %tmp = alloca i8
  %dst = alloca i8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %tmp, i8* align 8 %src, i64 1, i1 false), !noalias !2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %dst, i8* align 8 %tmp, i64 1, i1 false)

  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8*, i8*, i64, i1)

; Check that the noalias for "dst" was removed by checking that the metadata is gone
; CHECK-NOT: "dst"
!0 = !{!0}
!1 = distinct !{!1, !0, !"dst"}
!2 = distinct !{!1}
