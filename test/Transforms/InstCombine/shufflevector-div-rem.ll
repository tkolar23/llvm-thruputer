; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -instcombine -S -o - | FileCheck %s

; This test case was added as a reproducer for a miscompile, where instcombine
; introduced an
;   srem <2 x i16> %1, <i16 undef, i16 2>
; instruction, which makes the whole srem undefined (even if we only end up
; extracting the second element in the vector).
define i16 @test_srem_orig(i16 %a, i1 %cmp) {
; CHECK-LABEL: @test_srem_orig(
; CHECK-NEXT:    [[SPLATINSERT:%.*]] = insertelement <2 x i16> undef, i16 [[A:%.*]], i64 0
; CHECK-NEXT:    [[TMP1:%.*]] = srem <2 x i16> [[SPLATINSERT]], <i16 2, i16 1>
; CHECK-NEXT:    [[SPLAT_OP:%.*]] = shufflevector <2 x i16> [[TMP1]], <2 x i16> poison, <2 x i32> <i32 undef, i32 0>
; CHECK-NEXT:    [[T2:%.*]] = select i1 [[CMP:%.*]], <2 x i16> <i16 poison, i16 1>, <2 x i16> [[SPLAT_OP]]
; CHECK-NEXT:    [[T3:%.*]] = extractelement <2 x i16> [[T2]], i64 1
; CHECK-NEXT:    ret i16 [[T3]]
;
  %splatinsert = insertelement <2 x i16> undef, i16 %a, i32 0
  %splat = shufflevector <2 x i16> %splatinsert, <2 x i16> undef, <2 x i32> zeroinitializer
  %t1 = select i1 %cmp, <2 x i16> <i16 1, i16 1>, <2 x i16> %splat
  %t2 = srem <2 x i16> %t1, <i16 2, i16 2>
  %t3 = extractelement <2 x i16> %t2, i32 1
  ret i16 %t3
}

; This is basically a reduced version of test_srem_orig (based on what the
; code would look like after a few iterations of instcombine, just before we
; try to transform the shufflevector by doing
; "evaluateInDifferentElementOrder".
define <2 x i16> @test_srem(i16 %a, i1 %cmp) {
; CHECK-LABEL: @test_srem(
; CHECK-NEXT:    [[SPLATINSERT:%.*]] = insertelement <2 x i16> undef, i16 [[A:%.*]], i64 0
; CHECK-NEXT:    [[T1:%.*]] = srem <2 x i16> [[SPLATINSERT]], <i16 2, i16 1>
; CHECK-NEXT:    [[SPLAT_OP:%.*]] = shufflevector <2 x i16> [[T1]], <2 x i16> undef, <2 x i32> <i32 undef, i32 0>
; CHECK-NEXT:    [[T2:%.*]] = select i1 [[CMP:%.*]], <2 x i16> <i16 77, i16 99>, <2 x i16> [[SPLAT_OP]]
; CHECK-NEXT:    ret <2 x i16> [[T2]]
;
  %splatinsert = insertelement <2 x i16> undef, i16 %a, i32 0
  %t1 = srem <2 x i16> %splatinsert, <i16 2, i16 1>
  %splat.op = shufflevector <2 x i16> %t1, <2 x i16> undef, <2 x i32> <i32 undef, i32 0>
  %t2 = select i1 %cmp, <2 x i16> <i16 77, i16 99>, <2 x i16> %splat.op
  ret <2 x i16> %t2
}

define <2 x i16> @test_urem(i16 %a, i1 %cmp) {
; CHECK-LABEL: @test_urem(
; CHECK-NEXT:    [[SPLATINSERT:%.*]] = insertelement <2 x i16> undef, i16 [[A:%.*]], i64 0
; CHECK-NEXT:    [[T1:%.*]] = urem <2 x i16> [[SPLATINSERT]], <i16 3, i16 1>
; CHECK-NEXT:    [[SPLAT_OP:%.*]] = shufflevector <2 x i16> [[T1]], <2 x i16> undef, <2 x i32> <i32 undef, i32 0>
; CHECK-NEXT:    [[T2:%.*]] = select i1 [[CMP:%.*]], <2 x i16> <i16 77, i16 99>, <2 x i16> [[SPLAT_OP]]
; CHECK-NEXT:    ret <2 x i16> [[T2]]
;
  %splatinsert = insertelement <2 x i16> undef, i16 %a, i32 0
  %t1 = urem <2 x i16> %splatinsert, <i16 3, i16 1>
  %splat.op = shufflevector <2 x i16> %t1, <2 x i16> undef, <2 x i32> <i32 undef, i32 0>
  %t2 = select i1 %cmp, <2 x i16> <i16 77, i16 99>, <2 x i16> %splat.op
  ret <2 x i16> %t2
}

define <2 x i16> @test_sdiv(i16 %a, i1 %cmp) {
; CHECK-LABEL: @test_sdiv(
; CHECK-NEXT:    [[SPLATINSERT:%.*]] = insertelement <2 x i16> undef, i16 [[A:%.*]], i64 0
; CHECK-NEXT:    [[T1:%.*]] = sdiv <2 x i16> [[SPLATINSERT]], <i16 2, i16 1>
; CHECK-NEXT:    [[SPLAT_OP:%.*]] = shufflevector <2 x i16> [[T1]], <2 x i16> undef, <2 x i32> <i32 undef, i32 0>
; CHECK-NEXT:    [[T2:%.*]] = select i1 [[CMP:%.*]], <2 x i16> <i16 77, i16 99>, <2 x i16> [[SPLAT_OP]]
; CHECK-NEXT:    ret <2 x i16> [[T2]]
;
  %splatinsert = insertelement <2 x i16> undef, i16 %a, i32 0
  %t1 = sdiv <2 x i16> %splatinsert, <i16 2, i16 1>
  %splat.op = shufflevector <2 x i16> %t1, <2 x i16> undef, <2 x i32> <i32 undef, i32 0>
  %t2 = select i1 %cmp, <2 x i16> <i16 77, i16 99>, <2 x i16> %splat.op
  ret <2 x i16> %t2
}

define <2 x i16> @test_udiv(i16 %a, i1 %cmp) {
; CHECK-LABEL: @test_udiv(
; CHECK-NEXT:    [[SPLATINSERT:%.*]] = insertelement <2 x i16> undef, i16 [[A:%.*]], i64 0
; CHECK-NEXT:    [[T1:%.*]] = udiv <2 x i16> [[SPLATINSERT]], <i16 3, i16 1>
; CHECK-NEXT:    [[SPLAT_OP:%.*]] = shufflevector <2 x i16> [[T1]], <2 x i16> undef, <2 x i32> <i32 undef, i32 0>
; CHECK-NEXT:    [[T2:%.*]] = select i1 [[CMP:%.*]], <2 x i16> <i16 77, i16 99>, <2 x i16> [[SPLAT_OP]]
; CHECK-NEXT:    ret <2 x i16> [[T2]]
;
  %splatinsert = insertelement <2 x i16> undef, i16 %a, i32 0
  %t1 = udiv <2 x i16> %splatinsert, <i16 3, i16 1>
  %splat.op = shufflevector <2 x i16> %t1, <2 x i16> undef, <2 x i32> <i32 undef, i32 0>
  %t2 = select i1 %cmp, <2 x i16> <i16 77, i16 99>, <2 x i16> %splat.op
  ret <2 x i16> %t2
}

; For fdiv we do not need to worry about div by undef. Verify that the
; shufflevector is eliminated here.
define <2 x float> @test_fdiv(float %a, float %b, i1 %cmp) {
; CHECK-LABEL: @test_fdiv(
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x float> undef, float [[A:%.*]], i64 1
; CHECK-NEXT:    [[TMP2:%.*]] = fdiv <2 x float> [[TMP1]], <float undef, float 3.000000e+00>
; CHECK-NEXT:    [[T2:%.*]] = select i1 [[CMP:%.*]], <2 x float> <float 7.700000e+01, float 9.900000e+01>, <2 x float> [[TMP2]]
; CHECK-NEXT:    ret <2 x float> [[T2]]
;
  %splatinsert = insertelement <2 x float> undef, float %a, i32 0
  %denom = insertelement <2 x float> <float 3.0, float undef>, float 1.0, i32 1
  %t1 = fdiv <2 x float> %splatinsert, %denom
  %splat.op = shufflevector <2 x float> %t1, <2 x float> undef, <2 x i32> <i32 undef, i32 0>
  %t2 = select i1 %cmp, <2 x float> <float 77.0, float 99.0>, <2 x float> %splat.op
  ret <2 x float> %t2
}

; For frem we do not need to worry about div by undef. Verify that the
; shufflevector is eliminated here.
define <2 x float> @test_frem(float %a, float %b, i1 %cmp) {
; CHECK-LABEL: @test_frem(
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x float> undef, float [[A:%.*]], i64 1
; CHECK-NEXT:    [[TMP2:%.*]] = frem <2 x float> [[TMP1]], <float undef, float 3.000000e+00>
; CHECK-NEXT:    [[T2:%.*]] = select i1 [[CMP:%.*]], <2 x float> <float 7.700000e+01, float 9.900000e+01>, <2 x float> [[TMP2]]
; CHECK-NEXT:    ret <2 x float> [[T2]]
;
  %splatinsert = insertelement <2 x float> undef, float %a, i32 0
  %denom = insertelement <2 x float> <float 3.0, float undef>, float 1.0, i32 1
  %t1 = frem <2 x float> %splatinsert, %denom
  %splat.op = shufflevector <2 x float> %t1, <2 x float> undef, <2 x i32> <i32 undef, i32 0>
  %t2 = select i1 %cmp, <2 x float> <float 77.0, float 99.0>, <2 x float> %splat.op
  ret <2 x float> %t2
}
