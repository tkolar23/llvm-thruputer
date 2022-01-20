; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -global-isel -mtriple=amdgcn-unknown-amdhsa < %s | FileCheck %s

declare i32 @llvm.umin.i32(i32, i32)
declare i32 @llvm.umax.i32(i32, i32)
declare i32 @llvm.smin.i32(i32, i32)
declare i32 @llvm.smax.i32(i32, i32)

declare <4 x i32> @llvm.umin.v4i32(<4 x i32>, <4 x i32>)
declare <4 x i32> @llvm.umax.v4i32(<4 x i32>, <4 x i32>)
declare <4 x i32> @llvm.smin.v4i32(<4 x i32>, <4 x i32>)
declare <4 x i32> @llvm.smax.v4i32(<4 x i32>, <4 x i32>)

define i32 @test_umin_i32(i32 %a, i32 %b) {
; CHECK-LABEL: test_umin_i32:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_min_u32_e32 v0, v0, v1
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %r = call i32 @llvm.umin.i32(i32 %a, i32 %b)
  ret i32 %r
}

define i32 @test_umax_i32(i32 %a, i32 %b) {
; CHECK-LABEL: test_umax_i32:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_max_u32_e32 v0, v0, v1
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %r = call i32 @llvm.umax.i32(i32 %a, i32 %b)
  ret i32 %r
}

define i32 @test_smin_i32(i32 %a, i32 %b) {
; CHECK-LABEL: test_smin_i32:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_min_i32_e32 v0, v0, v1
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %r = call i32 @llvm.smin.i32(i32 %a, i32 %b)
  ret i32 %r
}

define i32 @test_smax_i32(i32 %a, i32 %b) {
; CHECK-LABEL: test_smax_i32:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_max_i32_e32 v0, v0, v1
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %r = call i32 @llvm.smax.i32(i32 %a, i32 %b)
  ret i32 %r
}

define <4 x i32> @test_umin_v4i32(<4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: test_umin_v4i32:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_min_u32_e32 v0, v0, v4
; CHECK-NEXT:    v_min_u32_e32 v1, v1, v5
; CHECK-NEXT:    v_min_u32_e32 v2, v2, v6
; CHECK-NEXT:    v_min_u32_e32 v3, v3, v7
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %r = call <4 x i32> @llvm.umin.v4i32(<4 x i32> %a, <4 x i32> %b)
  ret <4 x i32> %r
}

define <4 x i32> @test_umax_v4i32(<4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: test_umax_v4i32:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_max_u32_e32 v0, v0, v4
; CHECK-NEXT:    v_max_u32_e32 v1, v1, v5
; CHECK-NEXT:    v_max_u32_e32 v2, v2, v6
; CHECK-NEXT:    v_max_u32_e32 v3, v3, v7
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %r = call <4 x i32> @llvm.umax.v4i32(<4 x i32> %a, <4 x i32> %b)
  ret <4 x i32> %r
}

define <4 x i32> @test_smin_v4i32(<4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: test_smin_v4i32:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_min_i32_e32 v0, v0, v4
; CHECK-NEXT:    v_min_i32_e32 v1, v1, v5
; CHECK-NEXT:    v_min_i32_e32 v2, v2, v6
; CHECK-NEXT:    v_min_i32_e32 v3, v3, v7
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %r = call <4 x i32> @llvm.smin.v4i32(<4 x i32> %a, <4 x i32> %b)
  ret <4 x i32> %r
}

define <4 x i32> @test_smax_v4i32(<4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: test_smax_v4i32:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; CHECK-NEXT:    v_max_i32_e32 v0, v0, v4
; CHECK-NEXT:    v_max_i32_e32 v1, v1, v5
; CHECK-NEXT:    v_max_i32_e32 v2, v2, v6
; CHECK-NEXT:    v_max_i32_e32 v3, v3, v7
; CHECK-NEXT:    s_setpc_b64 s[30:31]
  %r = call <4 x i32> @llvm.smax.v4i32(<4 x i32> %a, <4 x i32> %b)
  ret <4 x i32> %r
}
