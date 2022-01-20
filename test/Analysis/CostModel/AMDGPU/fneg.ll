; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
; RUN: opt -cost-model -analyze -mtriple=amdgcn-unknown-amdhsa < %s | FileCheck %s
; RUN: opt -cost-model -cost-kind=code-size -analyze -mtriple=amdgcn-unknown-amdhsa < %s | FileCheck -check-prefixes=SIZE %s
; END.

define amdgpu_kernel void @fneg_f32() {
; CHECK-LABEL: 'fneg_f32'
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %f32 = fneg float undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2f32 = fneg <2 x float> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3f32 = fneg <3 x float> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4f32 = fneg <4 x float> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v5f32 = fneg <5 x float> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v8f32 = fneg <8 x float> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v9f32 = fneg <9 x float> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; SIZE-LABEL: 'fneg_f32'
; SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %f32 = fneg float undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2f32 = fneg <2 x float> undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3f32 = fneg <3 x float> undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4f32 = fneg <4 x float> undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v5f32 = fneg <5 x float> undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v8f32 = fneg <8 x float> undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v9f32 = fneg <9 x float> undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %f32 = fneg float undef
  %v2f32 = fneg <2 x float> undef
  %v3f32 = fneg <3 x float> undef
  %v4f32 = fneg <4 x float> undef
  %v5f32 = fneg <5 x float> undef
  %v8f32 = fneg <8 x float> undef
  %v9f32 = fneg <9 x float> undef
  ret void
}

define amdgpu_kernel void @fneg_f64() {
; CHECK-LABEL: 'fneg_f64'
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %f64 = fneg double undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2f64 = fneg <2 x double> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3f64 = fneg <3 x double> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4f64 = fneg <4 x double> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v5f64 = fneg <5 x double> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; SIZE-LABEL: 'fneg_f64'
; SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %f64 = fneg double undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2f64 = fneg <2 x double> undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3f64 = fneg <3 x double> undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4f64 = fneg <4 x double> undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v5f64 = fneg <5 x double> undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %f64 = fneg double undef
  %v2f64 = fneg <2 x double> undef
  %v3f64 = fneg <3 x double> undef
  %v4f64 = fneg <4 x double> undef
  %v5f64 = fneg <5 x double> undef
  ret void
}

define amdgpu_kernel void @fneg_f16() {
; CHECK-LABEL: 'fneg_f16'
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %f16 = fneg half undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2f16 = fneg <2 x half> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3f16 = fneg <3 x half> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4f16 = fneg <4 x half> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v5f16 = fneg <5 x half> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v16f16 = fneg <16 x half> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v17f16 = fneg <17 x half> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; SIZE-LABEL: 'fneg_f16'
; SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %f16 = fneg half undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v2f16 = fneg <2 x half> undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v3f16 = fneg <3 x half> undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v4f16 = fneg <4 x half> undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v5f16 = fneg <5 x half> undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v16f16 = fneg <16 x half> undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %v17f16 = fneg <17 x half> undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %f16 = fneg half undef
  %v2f16 = fneg <2 x half> undef
  %v3f16 = fneg <3 x half> undef
  %v4f16 = fneg <4 x half> undef
  %v5f16 = fneg <5 x half> undef
  %v16f16 = fneg <16 x half> undef
  %v17f16 = fneg <17 x half> undef
  ret void
}

define i32 @fneg_idiom(i32 %arg) {
; CHECK-LABEL: 'fneg_idiom'
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %F32 = fsub float -0.000000e+00, undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V4F32 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V8F32 = fsub <8 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 48 for instruction: %V16F32 = fsub <16 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %F64 = fsub double -0.000000e+00, undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V2F64 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V4F64 = fsub <4 x double> <double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00>, undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 96 for instruction: %V8F64 = fsub <8 x double> <double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00>, undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret i32 undef
;
; SIZE-LABEL: 'fneg_idiom'
; SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %F32 = fsub float -0.000000e+00, undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V4F32 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V8F32 = fsub <8 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 48 for instruction: %V16F32 = fsub <16 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %F64 = fsub double -0.000000e+00, undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V2F64 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V4F64 = fsub <4 x double> <double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00>, undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 48 for instruction: %V8F64 = fsub <8 x double> <double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00>, undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret i32 undef
;
  %F32 = fsub float -0.0, undef
  %V4F32 = fsub <4 x float> <float -0.0, float -0.0, float -0.0, float -0.0>, undef
  %V8F32 = fsub <8 x float> <float -0.0, float -0.0, float -0.0, float -0.0, float -0.0, float -0.0, float -0.0, float -0.0>, undef
  %V16F32 = fsub <16 x float> <float -0.0, float -0.0, float -0.0, float -0.0, float -0.0, float -0.0, float -0.0, float -0.0, float -0.0, float -0.0, float -0.0, float -0.0, float -0.0, float -0.0, float -0.0, float -0.0>, undef

  %F64 = fsub double -0.0, undef
  %V2F64 = fsub <2 x double> <double -0.0, double -0.0>, undef
  %V4F64 = fsub <4 x double> <double -0.0, double -0.0, double -0.0, double -0.0>, undef
  %V8F64 = fsub <8 x double> <double -0.0, double -0.0, double -0.0, double -0.0, double -0.0, double -0.0, double -0.0, double -0.0>, undef

  ret i32 undef
}
