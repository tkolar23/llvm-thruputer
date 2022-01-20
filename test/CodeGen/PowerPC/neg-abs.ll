; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -ppc-asm-full-reg-names -verify-machineinstrs \
; RUN:   -mtriple=powerpc64le-linux-gnu < %s | FileCheck \
; RUN:   -check-prefix=CHECK-LE %s

declare i64 @llvm.abs.i64(i64, i1 immarg)
declare <2 x i64> @llvm.abs.v2i64(<2 x i64>, i1)
declare <4 x i32> @llvm.abs.v4i32(<4 x i32>, i1)
declare <8 x i16> @llvm.abs.v8i16(<8 x i16>, i1)
declare <16 x i8> @llvm.abs.v16i8(<16 x i8>, i1)

define i64@neg_abs(i64 %x) {
; CHECK-LE-LABEL: neg_abs:
; CHECK-LE:       # %bb.0:
; CHECK-LE-NEXT:    sradi r4, r3, 63
; CHECK-LE-NEXT:    xor r3, r3, r4
; CHECK-LE-NEXT:    sub r3, r4, r3
; CHECK-LE-NEXT:    blr
  %abs = tail call i64 @llvm.abs.i64(i64 %x, i1 true)
  %neg = sub nsw i64 0, %abs
  ret i64 %neg
}

define <2 x i64> @neg_abs_v2i64(<2 x i64> %0) {
; CHECK-LE-LABEL: neg_abs_v2i64:
; CHECK-LE:       # %bb.0:
; CHECK-LE-NEXT:    xxlxor vs35, vs35, vs35
; CHECK-LE-NEXT:    vsubudm v3, v3, v2
; CHECK-LE-NEXT:    vminsd v2, v2, v3
; CHECK-LE-NEXT:    blr
  %abs = call <2 x i64> @llvm.abs.v2i64(<2 x i64> %0, i1 true)
  %neg.abs = sub <2 x i64> zeroinitializer, %abs
  ret <2 x i64> %neg.abs
}

define <4 x i32> @neg_abs_v4i32(<4 x i32> %0) {
; CHECK-LE-LABEL: neg_abs_v4i32:
; CHECK-LE:       # %bb.0:
; CHECK-LE-NEXT:    xxlxor vs35, vs35, vs35
; CHECK-LE-NEXT:    vsubuwm v3, v3, v2
; CHECK-LE-NEXT:    vminsw v2, v2, v3
; CHECK-LE-NEXT:    blr
  %abs = call <4 x i32> @llvm.abs.v4i32(<4 x i32> %0, i1 true)
  %neg.abs = sub <4 x i32> zeroinitializer, %abs
  ret <4 x i32> %neg.abs
}

define <8 x i16> @neg_abs_v8i16(<8 x i16> %0) {
; CHECK-LE-LABEL: neg_abs_v8i16:
; CHECK-LE:       # %bb.0:
; CHECK-LE-NEXT:    xxlxor vs35, vs35, vs35
; CHECK-LE-NEXT:    vsubuhm v3, v3, v2
; CHECK-LE-NEXT:    vminsh v2, v2, v3
; CHECK-LE-NEXT:    blr
  %abs = call <8 x i16> @llvm.abs.v8i16(<8 x i16> %0, i1 true)
  %neg.abs = sub <8 x i16> zeroinitializer, %abs
  ret <8 x i16> %neg.abs
}

define <16 x i8> @neg_abs_v16i8(<16 x i8> %0) {
; CHECK-LE-LABEL: neg_abs_v16i8:
; CHECK-LE:       # %bb.0:
; CHECK-LE-NEXT:    xxlxor vs35, vs35, vs35
; CHECK-LE-NEXT:    vsububm v3, v3, v2
; CHECK-LE-NEXT:    vminsb v2, v2, v3
; CHECK-LE-NEXT:    blr
  %abs = call <16 x i8> @llvm.abs.v16i8(<16 x i8> %0, i1 true)
  %neg.abs = sub <16 x i8> zeroinitializer, %abs
  ret <16 x i8> %neg.abs
}
