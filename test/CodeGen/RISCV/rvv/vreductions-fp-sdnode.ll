; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+d,+zfh,+experimental-v -target-abi=ilp32d \
; RUN:     -verify-machineinstrs < %s | FileCheck %s
; RUN: llc -mtriple=riscv64 -mattr=+d,+zfh,+experimental-v -target-abi=lp64d \
; RUN:     -verify-machineinstrs < %s | FileCheck %s

declare half @llvm.vector.reduce.fadd.nxv1f16(half, <vscale x 1 x half>)

define half @vreduce_fadd_nxv1f16(<vscale x 1 x half> %v, half %s) {
; CHECK-LABEL: vreduce_fadd_nxv1f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI0_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI0_0)
; CHECK-NEXT:    vsetivli zero, 1, e16, m1, ta, mu
; CHECK-NEXT:    vlse16.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e16, mf4, ta, mu
; CHECK-NEXT:    vfredusum.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s ft0, v8
; CHECK-NEXT:    fadd.h fa0, fa0, ft0
; CHECK-NEXT:    ret
  %red = call reassoc half @llvm.vector.reduce.fadd.nxv1f16(half %s, <vscale x 1 x half> %v)
  ret half %red
}

define half @vreduce_ord_fadd_nxv1f16(<vscale x 1 x half> %v, half %s) {
; CHECK-LABEL: vreduce_ord_fadd_nxv1f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 1, e16, m1, ta, mu
; CHECK-NEXT:    vfmv.s.f v9, fa0
; CHECK-NEXT:    vsetvli a0, zero, e16, mf4, ta, mu
; CHECK-NEXT:    vfredosum.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call half @llvm.vector.reduce.fadd.nxv1f16(half %s, <vscale x 1 x half> %v)
  ret half %red
}

declare half @llvm.vector.reduce.fadd.nxv2f16(half, <vscale x 2 x half>)

define half @vreduce_fadd_nxv2f16(<vscale x 2 x half> %v, half %s) {
; CHECK-LABEL: vreduce_fadd_nxv2f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI2_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI2_0)
; CHECK-NEXT:    vsetivli zero, 1, e16, m1, ta, mu
; CHECK-NEXT:    vlse16.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e16, mf2, ta, mu
; CHECK-NEXT:    vfredusum.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s ft0, v8
; CHECK-NEXT:    fadd.h fa0, fa0, ft0
; CHECK-NEXT:    ret
  %red = call reassoc half @llvm.vector.reduce.fadd.nxv2f16(half %s, <vscale x 2 x half> %v)
  ret half %red
}

define half @vreduce_ord_fadd_nxv2f16(<vscale x 2 x half> %v, half %s) {
; CHECK-LABEL: vreduce_ord_fadd_nxv2f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 1, e16, m1, ta, mu
; CHECK-NEXT:    vfmv.s.f v9, fa0
; CHECK-NEXT:    vsetvli a0, zero, e16, mf2, ta, mu
; CHECK-NEXT:    vfredosum.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call half @llvm.vector.reduce.fadd.nxv2f16(half %s, <vscale x 2 x half> %v)
  ret half %red
}

declare half @llvm.vector.reduce.fadd.nxv4f16(half, <vscale x 4 x half>)

define half @vreduce_fadd_nxv4f16(<vscale x 4 x half> %v, half %s) {
; CHECK-LABEL: vreduce_fadd_nxv4f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI4_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI4_0)
; CHECK-NEXT:    vsetivli zero, 1, e16, m1, ta, mu
; CHECK-NEXT:    vlse16.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e16, m1, ta, mu
; CHECK-NEXT:    vfredusum.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s ft0, v8
; CHECK-NEXT:    fadd.h fa0, fa0, ft0
; CHECK-NEXT:    ret
  %red = call reassoc half @llvm.vector.reduce.fadd.nxv4f16(half %s, <vscale x 4 x half> %v)
  ret half %red
}

define half @vreduce_ord_fadd_nxv4f16(<vscale x 4 x half> %v, half %s) {
; CHECK-LABEL: vreduce_ord_fadd_nxv4f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 1, e16, m1, ta, mu
; CHECK-NEXT:    vfmv.s.f v9, fa0
; CHECK-NEXT:    vsetvli a0, zero, e16, m1, ta, mu
; CHECK-NEXT:    vfredosum.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call half @llvm.vector.reduce.fadd.nxv4f16(half %s, <vscale x 4 x half> %v)
  ret half %red
}

declare float @llvm.vector.reduce.fadd.nxv1f32(float, <vscale x 1 x float>)

define float @vreduce_fadd_nxv1f32(<vscale x 1 x float> %v, float %s) {
; CHECK-LABEL: vreduce_fadd_nxv1f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI6_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI6_0)
; CHECK-NEXT:    vsetivli zero, 1, e32, m1, ta, mu
; CHECK-NEXT:    vlse32.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e32, mf2, ta, mu
; CHECK-NEXT:    vfredusum.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s ft0, v8
; CHECK-NEXT:    fadd.s fa0, fa0, ft0
; CHECK-NEXT:    ret
  %red = call reassoc float @llvm.vector.reduce.fadd.nxv1f32(float %s, <vscale x 1 x float> %v)
  ret float %red
}

define float @vreduce_ord_fadd_nxv1f32(<vscale x 1 x float> %v, float %s) {
; CHECK-LABEL: vreduce_ord_fadd_nxv1f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 1, e32, m1, ta, mu
; CHECK-NEXT:    vfmv.s.f v9, fa0
; CHECK-NEXT:    vsetvli a0, zero, e32, mf2, ta, mu
; CHECK-NEXT:    vfredosum.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call float @llvm.vector.reduce.fadd.nxv1f32(float %s, <vscale x 1 x float> %v)
  ret float %red
}

declare float @llvm.vector.reduce.fadd.nxv2f32(float, <vscale x 2 x float>)

define float @vreduce_fadd_nxv2f32(<vscale x 2 x float> %v, float %s) {
; CHECK-LABEL: vreduce_fadd_nxv2f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI8_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI8_0)
; CHECK-NEXT:    vsetivli zero, 1, e32, m1, ta, mu
; CHECK-NEXT:    vlse32.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e32, m1, ta, mu
; CHECK-NEXT:    vfredusum.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s ft0, v8
; CHECK-NEXT:    fadd.s fa0, fa0, ft0
; CHECK-NEXT:    ret
  %red = call reassoc float @llvm.vector.reduce.fadd.nxv2f32(float %s, <vscale x 2 x float> %v)
  ret float %red
}

define float @vreduce_ord_fadd_nxv2f32(<vscale x 2 x float> %v, float %s) {
; CHECK-LABEL: vreduce_ord_fadd_nxv2f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 1, e32, m1, ta, mu
; CHECK-NEXT:    vfmv.s.f v9, fa0
; CHECK-NEXT:    vsetvli a0, zero, e32, m1, ta, mu
; CHECK-NEXT:    vfredosum.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call float @llvm.vector.reduce.fadd.nxv2f32(float %s, <vscale x 2 x float> %v)
  ret float %red
}

declare float @llvm.vector.reduce.fadd.nxv4f32(float, <vscale x 4 x float>)

define float @vreduce_fadd_nxv4f32(<vscale x 4 x float> %v, float %s) {
; CHECK-LABEL: vreduce_fadd_nxv4f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI10_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI10_0)
; CHECK-NEXT:    vsetivli zero, 1, e32, m1, ta, mu
; CHECK-NEXT:    vlse32.v v10, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e32, m2, ta, mu
; CHECK-NEXT:    vfredusum.vs v8, v8, v10
; CHECK-NEXT:    vfmv.f.s ft0, v8
; CHECK-NEXT:    fadd.s fa0, fa0, ft0
; CHECK-NEXT:    ret
  %red = call reassoc float @llvm.vector.reduce.fadd.nxv4f32(float %s, <vscale x 4 x float> %v)
  ret float %red
}

define float @vreduce_ord_fadd_nxv4f32(<vscale x 4 x float> %v, float %s) {
; CHECK-LABEL: vreduce_ord_fadd_nxv4f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 1, e32, m1, ta, mu
; CHECK-NEXT:    vfmv.s.f v10, fa0
; CHECK-NEXT:    vsetvli a0, zero, e32, m2, ta, mu
; CHECK-NEXT:    vfredosum.vs v8, v8, v10
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call float @llvm.vector.reduce.fadd.nxv4f32(float %s, <vscale x 4 x float> %v)
  ret float %red
}

declare double @llvm.vector.reduce.fadd.nxv1f64(double, <vscale x 1 x double>)

define double @vreduce_fadd_nxv1f64(<vscale x 1 x double> %v, double %s) {
; CHECK-LABEL: vreduce_fadd_nxv1f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI12_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI12_0)
; CHECK-NEXT:    vsetivli zero, 1, e64, m1, ta, mu
; CHECK-NEXT:    vlse64.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e64, m1, ta, mu
; CHECK-NEXT:    vfredusum.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s ft0, v8
; CHECK-NEXT:    fadd.d fa0, fa0, ft0
; CHECK-NEXT:    ret
  %red = call reassoc double @llvm.vector.reduce.fadd.nxv1f64(double %s, <vscale x 1 x double> %v)
  ret double %red
}

define double @vreduce_ord_fadd_nxv1f64(<vscale x 1 x double> %v, double %s) {
; CHECK-LABEL: vreduce_ord_fadd_nxv1f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 1, e64, m1, ta, mu
; CHECK-NEXT:    vfmv.s.f v9, fa0
; CHECK-NEXT:    vsetvli a0, zero, e64, m1, ta, mu
; CHECK-NEXT:    vfredosum.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call double @llvm.vector.reduce.fadd.nxv1f64(double %s, <vscale x 1 x double> %v)
  ret double %red
}

declare double @llvm.vector.reduce.fadd.nxv2f64(double, <vscale x 2 x double>)

define double @vreduce_fadd_nxv2f64(<vscale x 2 x double> %v, double %s) {
; CHECK-LABEL: vreduce_fadd_nxv2f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI14_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI14_0)
; CHECK-NEXT:    vsetivli zero, 1, e64, m1, ta, mu
; CHECK-NEXT:    vlse64.v v10, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e64, m2, ta, mu
; CHECK-NEXT:    vfredusum.vs v8, v8, v10
; CHECK-NEXT:    vfmv.f.s ft0, v8
; CHECK-NEXT:    fadd.d fa0, fa0, ft0
; CHECK-NEXT:    ret
  %red = call reassoc double @llvm.vector.reduce.fadd.nxv2f64(double %s, <vscale x 2 x double> %v)
  ret double %red
}

define double @vreduce_ord_fadd_nxv2f64(<vscale x 2 x double> %v, double %s) {
; CHECK-LABEL: vreduce_ord_fadd_nxv2f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 1, e64, m1, ta, mu
; CHECK-NEXT:    vfmv.s.f v10, fa0
; CHECK-NEXT:    vsetvli a0, zero, e64, m2, ta, mu
; CHECK-NEXT:    vfredosum.vs v8, v8, v10
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call double @llvm.vector.reduce.fadd.nxv2f64(double %s, <vscale x 2 x double> %v)
  ret double %red
}

declare double @llvm.vector.reduce.fadd.nxv4f64(double, <vscale x 4 x double>)

define double @vreduce_fadd_nxv4f64(<vscale x 4 x double> %v, double %s) {
; CHECK-LABEL: vreduce_fadd_nxv4f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI16_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI16_0)
; CHECK-NEXT:    vsetivli zero, 1, e64, m1, ta, mu
; CHECK-NEXT:    vlse64.v v12, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e64, m4, ta, mu
; CHECK-NEXT:    vfredusum.vs v8, v8, v12
; CHECK-NEXT:    vfmv.f.s ft0, v8
; CHECK-NEXT:    fadd.d fa0, fa0, ft0
; CHECK-NEXT:    ret
  %red = call reassoc double @llvm.vector.reduce.fadd.nxv4f64(double %s, <vscale x 4 x double> %v)
  ret double %red
}

define double @vreduce_ord_fadd_nxv4f64(<vscale x 4 x double> %v, double %s) {
; CHECK-LABEL: vreduce_ord_fadd_nxv4f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 1, e64, m1, ta, mu
; CHECK-NEXT:    vfmv.s.f v12, fa0
; CHECK-NEXT:    vsetvli a0, zero, e64, m4, ta, mu
; CHECK-NEXT:    vfredosum.vs v8, v8, v12
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call double @llvm.vector.reduce.fadd.nxv4f64(double %s, <vscale x 4 x double> %v)
  ret double %red
}

declare half @llvm.vector.reduce.fmin.nxv1f16(<vscale x 1 x half>)

define half @vreduce_fmin_nxv1f16(<vscale x 1 x half> %v) {
; CHECK-LABEL: vreduce_fmin_nxv1f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI18_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI18_0)
; CHECK-NEXT:    vsetivli zero, 1, e16, m1, ta, mu
; CHECK-NEXT:    vlse16.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e16, mf4, ta, mu
; CHECK-NEXT:    vfredmin.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call half @llvm.vector.reduce.fmin.nxv1f16(<vscale x 1 x half> %v)
  ret half %red
}

define half @vreduce_fmin_nxv1f16_nonans(<vscale x 1 x half> %v) #0 {
; CHECK-LABEL: vreduce_fmin_nxv1f16_nonans:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI19_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI19_0)
; CHECK-NEXT:    vsetivli zero, 1, e16, m1, ta, mu
; CHECK-NEXT:    vlse16.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e16, mf4, ta, mu
; CHECK-NEXT:    vfredmin.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call nnan half @llvm.vector.reduce.fmin.nxv1f16(<vscale x 1 x half> %v)
  ret half %red
}

define half @vreduce_fmin_nxv1f16_nonans_noinfs(<vscale x 1 x half> %v) #1 {
; CHECK-LABEL: vreduce_fmin_nxv1f16_nonans_noinfs:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI20_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI20_0)
; CHECK-NEXT:    vsetivli zero, 1, e16, m1, ta, mu
; CHECK-NEXT:    vlse16.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e16, mf4, ta, mu
; CHECK-NEXT:    vfredmin.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call nnan ninf half @llvm.vector.reduce.fmin.nxv1f16(<vscale x 1 x half> %v)
  ret half %red
}

declare half @llvm.vector.reduce.fmin.nxv2f16(<vscale x 2 x half>)

define half @vreduce_fmin_nxv2f16(<vscale x 2 x half> %v) {
; CHECK-LABEL: vreduce_fmin_nxv2f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI21_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI21_0)
; CHECK-NEXT:    vsetivli zero, 1, e16, m1, ta, mu
; CHECK-NEXT:    vlse16.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e16, mf2, ta, mu
; CHECK-NEXT:    vfredmin.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call half @llvm.vector.reduce.fmin.nxv2f16(<vscale x 2 x half> %v)
  ret half %red
}

declare half @llvm.vector.reduce.fmin.nxv4f16(<vscale x 4 x half>)

define half @vreduce_fmin_nxv4f16(<vscale x 4 x half> %v) {
; CHECK-LABEL: vreduce_fmin_nxv4f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI22_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI22_0)
; CHECK-NEXT:    vsetivli zero, 1, e16, m1, ta, mu
; CHECK-NEXT:    vlse16.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e16, m1, ta, mu
; CHECK-NEXT:    vfredmin.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call half @llvm.vector.reduce.fmin.nxv4f16(<vscale x 4 x half> %v)
  ret half %red
}

declare half @llvm.vector.reduce.fmin.nxv64f16(<vscale x 64 x half>)

define half @vreduce_fmin_nxv64f16(<vscale x 64 x half> %v) {
; CHECK-LABEL: vreduce_fmin_nxv64f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e16, m8, ta, mu
; CHECK-NEXT:    vfmin.vv v8, v8, v16
; CHECK-NEXT:    lui a0, %hi(.LCPI23_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI23_0)
; CHECK-NEXT:    vsetivli zero, 1, e16, m1, ta, mu
; CHECK-NEXT:    vlse16.v v16, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e16, m8, ta, mu
; CHECK-NEXT:    vfredmin.vs v8, v8, v16
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call half @llvm.vector.reduce.fmin.nxv64f16(<vscale x 64 x half> %v)
  ret half %red
}

declare float @llvm.vector.reduce.fmin.nxv1f32(<vscale x 1 x float>)

define float @vreduce_fmin_nxv1f32(<vscale x 1 x float> %v) {
; CHECK-LABEL: vreduce_fmin_nxv1f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI24_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI24_0)
; CHECK-NEXT:    vsetivli zero, 1, e32, m1, ta, mu
; CHECK-NEXT:    vlse32.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e32, mf2, ta, mu
; CHECK-NEXT:    vfredmin.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call float @llvm.vector.reduce.fmin.nxv1f32(<vscale x 1 x float> %v)
  ret float %red
}

define float @vreduce_fmin_nxv1f32_nonans(<vscale x 1 x float> %v) {
; CHECK-LABEL: vreduce_fmin_nxv1f32_nonans:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI25_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI25_0)
; CHECK-NEXT:    vsetivli zero, 1, e32, m1, ta, mu
; CHECK-NEXT:    vlse32.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e32, mf2, ta, mu
; CHECK-NEXT:    vfredmin.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call nnan float @llvm.vector.reduce.fmin.nxv1f32(<vscale x 1 x float> %v)
  ret float %red
}

define float @vreduce_fmin_nxv1f32_nonans_noinfs(<vscale x 1 x float> %v) {
; CHECK-LABEL: vreduce_fmin_nxv1f32_nonans_noinfs:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI26_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI26_0)
; CHECK-NEXT:    vsetivli zero, 1, e32, m1, ta, mu
; CHECK-NEXT:    vlse32.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e32, mf2, ta, mu
; CHECK-NEXT:    vfredmin.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call nnan ninf float @llvm.vector.reduce.fmin.nxv1f32(<vscale x 1 x float> %v)
  ret float %red
}

declare float @llvm.vector.reduce.fmin.nxv2f32(<vscale x 2 x float>)

define float @vreduce_fmin_nxv2f32(<vscale x 2 x float> %v) {
; CHECK-LABEL: vreduce_fmin_nxv2f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI27_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI27_0)
; CHECK-NEXT:    vsetivli zero, 1, e32, m1, ta, mu
; CHECK-NEXT:    vlse32.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e32, m1, ta, mu
; CHECK-NEXT:    vfredmin.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call float @llvm.vector.reduce.fmin.nxv2f32(<vscale x 2 x float> %v)
  ret float %red
}

declare float @llvm.vector.reduce.fmin.nxv4f32(<vscale x 4 x float>)

define float @vreduce_fmin_nxv4f32(<vscale x 4 x float> %v) {
; CHECK-LABEL: vreduce_fmin_nxv4f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI28_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI28_0)
; CHECK-NEXT:    vsetivli zero, 1, e32, m1, ta, mu
; CHECK-NEXT:    vlse32.v v10, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e32, m2, ta, mu
; CHECK-NEXT:    vfredmin.vs v8, v8, v10
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call float @llvm.vector.reduce.fmin.nxv4f32(<vscale x 4 x float> %v)
  ret float %red
}

declare float @llvm.vector.reduce.fmin.nxv32f32(<vscale x 32 x float>)

define float @vreduce_fmin_nxv32f32(<vscale x 32 x float> %v) {
; CHECK-LABEL: vreduce_fmin_nxv32f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e32, m8, ta, mu
; CHECK-NEXT:    vfmin.vv v8, v8, v16
; CHECK-NEXT:    lui a0, %hi(.LCPI29_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI29_0)
; CHECK-NEXT:    vsetivli zero, 1, e32, m1, ta, mu
; CHECK-NEXT:    vlse32.v v16, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e32, m8, ta, mu
; CHECK-NEXT:    vfredmin.vs v8, v8, v16
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call float @llvm.vector.reduce.fmin.nxv32f32(<vscale x 32 x float> %v)
  ret float %red
}

declare double @llvm.vector.reduce.fmin.nxv1f64(<vscale x 1 x double>)

define double @vreduce_fmin_nxv1f64(<vscale x 1 x double> %v) {
; CHECK-LABEL: vreduce_fmin_nxv1f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI30_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI30_0)
; CHECK-NEXT:    vsetivli zero, 1, e64, m1, ta, mu
; CHECK-NEXT:    vlse64.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e64, m1, ta, mu
; CHECK-NEXT:    vfredmin.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call double @llvm.vector.reduce.fmin.nxv1f64(<vscale x 1 x double> %v)
  ret double %red
}

define double @vreduce_fmin_nxv1f64_nonans(<vscale x 1 x double> %v) {
; CHECK-LABEL: vreduce_fmin_nxv1f64_nonans:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI31_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI31_0)
; CHECK-NEXT:    vsetivli zero, 1, e64, m1, ta, mu
; CHECK-NEXT:    vlse64.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e64, m1, ta, mu
; CHECK-NEXT:    vfredmin.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call nnan double @llvm.vector.reduce.fmin.nxv1f64(<vscale x 1 x double> %v)
  ret double %red
}

define double @vreduce_fmin_nxv1f64_nonans_noinfs(<vscale x 1 x double> %v) {
; CHECK-LABEL: vreduce_fmin_nxv1f64_nonans_noinfs:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI32_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI32_0)
; CHECK-NEXT:    vsetivli zero, 1, e64, m1, ta, mu
; CHECK-NEXT:    vlse64.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e64, m1, ta, mu
; CHECK-NEXT:    vfredmin.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call nnan ninf double @llvm.vector.reduce.fmin.nxv1f64(<vscale x 1 x double> %v)
  ret double %red
}

declare double @llvm.vector.reduce.fmin.nxv2f64(<vscale x 2 x double>)

define double @vreduce_fmin_nxv2f64(<vscale x 2 x double> %v) {
; CHECK-LABEL: vreduce_fmin_nxv2f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI33_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI33_0)
; CHECK-NEXT:    vsetivli zero, 1, e64, m1, ta, mu
; CHECK-NEXT:    vlse64.v v10, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e64, m2, ta, mu
; CHECK-NEXT:    vfredmin.vs v8, v8, v10
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call double @llvm.vector.reduce.fmin.nxv2f64(<vscale x 2 x double> %v)
  ret double %red
}

declare double @llvm.vector.reduce.fmin.nxv4f64(<vscale x 4 x double>)

define double @vreduce_fmin_nxv4f64(<vscale x 4 x double> %v) {
; CHECK-LABEL: vreduce_fmin_nxv4f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI34_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI34_0)
; CHECK-NEXT:    vsetivli zero, 1, e64, m1, ta, mu
; CHECK-NEXT:    vlse64.v v12, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e64, m4, ta, mu
; CHECK-NEXT:    vfredmin.vs v8, v8, v12
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call double @llvm.vector.reduce.fmin.nxv4f64(<vscale x 4 x double> %v)
  ret double %red
}

declare double @llvm.vector.reduce.fmin.nxv16f64(<vscale x 16 x double>)

define double @vreduce_fmin_nxv16f64(<vscale x 16 x double> %v) {
; CHECK-LABEL: vreduce_fmin_nxv16f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e64, m8, ta, mu
; CHECK-NEXT:    vfmin.vv v8, v8, v16
; CHECK-NEXT:    lui a0, %hi(.LCPI35_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI35_0)
; CHECK-NEXT:    vsetivli zero, 1, e64, m1, ta, mu
; CHECK-NEXT:    vlse64.v v16, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e64, m8, ta, mu
; CHECK-NEXT:    vfredmin.vs v8, v8, v16
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call double @llvm.vector.reduce.fmin.nxv16f64(<vscale x 16 x double> %v)
  ret double %red
}

declare half @llvm.vector.reduce.fmax.nxv1f16(<vscale x 1 x half>)

define half @vreduce_fmax_nxv1f16(<vscale x 1 x half> %v) {
; CHECK-LABEL: vreduce_fmax_nxv1f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI36_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI36_0)
; CHECK-NEXT:    vsetivli zero, 1, e16, m1, ta, mu
; CHECK-NEXT:    vlse16.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e16, mf4, ta, mu
; CHECK-NEXT:    vfredmax.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call half @llvm.vector.reduce.fmax.nxv1f16(<vscale x 1 x half> %v)
  ret half %red
}

define half @vreduce_fmax_nxv1f16_nonans(<vscale x 1 x half> %v) #0 {
; CHECK-LABEL: vreduce_fmax_nxv1f16_nonans:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI37_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI37_0)
; CHECK-NEXT:    vsetivli zero, 1, e16, m1, ta, mu
; CHECK-NEXT:    vlse16.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e16, mf4, ta, mu
; CHECK-NEXT:    vfredmax.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call nnan half @llvm.vector.reduce.fmax.nxv1f16(<vscale x 1 x half> %v)
  ret half %red
}

define half @vreduce_fmax_nxv1f16_nonans_noinfs(<vscale x 1 x half> %v) #1 {
; CHECK-LABEL: vreduce_fmax_nxv1f16_nonans_noinfs:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI38_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI38_0)
; CHECK-NEXT:    vsetivli zero, 1, e16, m1, ta, mu
; CHECK-NEXT:    vlse16.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e16, mf4, ta, mu
; CHECK-NEXT:    vfredmax.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call nnan ninf half @llvm.vector.reduce.fmax.nxv1f16(<vscale x 1 x half> %v)
  ret half %red
}

declare half @llvm.vector.reduce.fmax.nxv2f16(<vscale x 2 x half>)

define half @vreduce_fmax_nxv2f16(<vscale x 2 x half> %v) {
; CHECK-LABEL: vreduce_fmax_nxv2f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI39_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI39_0)
; CHECK-NEXT:    vsetivli zero, 1, e16, m1, ta, mu
; CHECK-NEXT:    vlse16.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e16, mf2, ta, mu
; CHECK-NEXT:    vfredmax.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call half @llvm.vector.reduce.fmax.nxv2f16(<vscale x 2 x half> %v)
  ret half %red
}

declare half @llvm.vector.reduce.fmax.nxv4f16(<vscale x 4 x half>)

define half @vreduce_fmax_nxv4f16(<vscale x 4 x half> %v) {
; CHECK-LABEL: vreduce_fmax_nxv4f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI40_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI40_0)
; CHECK-NEXT:    vsetivli zero, 1, e16, m1, ta, mu
; CHECK-NEXT:    vlse16.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e16, m1, ta, mu
; CHECK-NEXT:    vfredmax.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call half @llvm.vector.reduce.fmax.nxv4f16(<vscale x 4 x half> %v)
  ret half %red
}

declare half @llvm.vector.reduce.fmax.nxv64f16(<vscale x 64 x half>)

define half @vreduce_fmax_nxv64f16(<vscale x 64 x half> %v) {
; CHECK-LABEL: vreduce_fmax_nxv64f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e16, m8, ta, mu
; CHECK-NEXT:    vfmax.vv v8, v8, v16
; CHECK-NEXT:    lui a0, %hi(.LCPI41_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI41_0)
; CHECK-NEXT:    vsetivli zero, 1, e16, m1, ta, mu
; CHECK-NEXT:    vlse16.v v16, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e16, m8, ta, mu
; CHECK-NEXT:    vfredmax.vs v8, v8, v16
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call half @llvm.vector.reduce.fmax.nxv64f16(<vscale x 64 x half> %v)
  ret half %red
}

declare float @llvm.vector.reduce.fmax.nxv1f32(<vscale x 1 x float>)

define float @vreduce_fmax_nxv1f32(<vscale x 1 x float> %v) {
; CHECK-LABEL: vreduce_fmax_nxv1f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI42_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI42_0)
; CHECK-NEXT:    vsetivli zero, 1, e32, m1, ta, mu
; CHECK-NEXT:    vlse32.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e32, mf2, ta, mu
; CHECK-NEXT:    vfredmax.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call float @llvm.vector.reduce.fmax.nxv1f32(<vscale x 1 x float> %v)
  ret float %red
}

define float @vreduce_fmax_nxv1f32_nonans(<vscale x 1 x float> %v) {
; CHECK-LABEL: vreduce_fmax_nxv1f32_nonans:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI43_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI43_0)
; CHECK-NEXT:    vsetivli zero, 1, e32, m1, ta, mu
; CHECK-NEXT:    vlse32.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e32, mf2, ta, mu
; CHECK-NEXT:    vfredmax.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call nnan float @llvm.vector.reduce.fmax.nxv1f32(<vscale x 1 x float> %v)
  ret float %red
}

define float @vreduce_fmax_nxv1f32_nonans_noinfs(<vscale x 1 x float> %v) {
; CHECK-LABEL: vreduce_fmax_nxv1f32_nonans_noinfs:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI44_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI44_0)
; CHECK-NEXT:    vsetivli zero, 1, e32, m1, ta, mu
; CHECK-NEXT:    vlse32.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e32, mf2, ta, mu
; CHECK-NEXT:    vfredmax.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call nnan ninf float @llvm.vector.reduce.fmax.nxv1f32(<vscale x 1 x float> %v)
  ret float %red
}

declare float @llvm.vector.reduce.fmax.nxv2f32(<vscale x 2 x float>)

define float @vreduce_fmax_nxv2f32(<vscale x 2 x float> %v) {
; CHECK-LABEL: vreduce_fmax_nxv2f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI45_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI45_0)
; CHECK-NEXT:    vsetivli zero, 1, e32, m1, ta, mu
; CHECK-NEXT:    vlse32.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e32, m1, ta, mu
; CHECK-NEXT:    vfredmax.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call float @llvm.vector.reduce.fmax.nxv2f32(<vscale x 2 x float> %v)
  ret float %red
}

declare float @llvm.vector.reduce.fmax.nxv4f32(<vscale x 4 x float>)

define float @vreduce_fmax_nxv4f32(<vscale x 4 x float> %v) {
; CHECK-LABEL: vreduce_fmax_nxv4f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI46_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI46_0)
; CHECK-NEXT:    vsetivli zero, 1, e32, m1, ta, mu
; CHECK-NEXT:    vlse32.v v10, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e32, m2, ta, mu
; CHECK-NEXT:    vfredmax.vs v8, v8, v10
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call float @llvm.vector.reduce.fmax.nxv4f32(<vscale x 4 x float> %v)
  ret float %red
}

declare float @llvm.vector.reduce.fmax.nxv32f32(<vscale x 32 x float>)

define float @vreduce_fmax_nxv32f32(<vscale x 32 x float> %v) {
; CHECK-LABEL: vreduce_fmax_nxv32f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e32, m8, ta, mu
; CHECK-NEXT:    vfmax.vv v8, v8, v16
; CHECK-NEXT:    lui a0, %hi(.LCPI47_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI47_0)
; CHECK-NEXT:    vsetivli zero, 1, e32, m1, ta, mu
; CHECK-NEXT:    vlse32.v v16, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e32, m8, ta, mu
; CHECK-NEXT:    vfredmax.vs v8, v8, v16
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call float @llvm.vector.reduce.fmax.nxv32f32(<vscale x 32 x float> %v)
  ret float %red
}

declare double @llvm.vector.reduce.fmax.nxv1f64(<vscale x 1 x double>)

define double @vreduce_fmax_nxv1f64(<vscale x 1 x double> %v) {
; CHECK-LABEL: vreduce_fmax_nxv1f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI48_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI48_0)
; CHECK-NEXT:    vsetivli zero, 1, e64, m1, ta, mu
; CHECK-NEXT:    vlse64.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e64, m1, ta, mu
; CHECK-NEXT:    vfredmax.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call double @llvm.vector.reduce.fmax.nxv1f64(<vscale x 1 x double> %v)
  ret double %red
}

define double @vreduce_fmax_nxv1f64_nonans(<vscale x 1 x double> %v) {
; CHECK-LABEL: vreduce_fmax_nxv1f64_nonans:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI49_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI49_0)
; CHECK-NEXT:    vsetivli zero, 1, e64, m1, ta, mu
; CHECK-NEXT:    vlse64.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e64, m1, ta, mu
; CHECK-NEXT:    vfredmax.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call nnan double @llvm.vector.reduce.fmax.nxv1f64(<vscale x 1 x double> %v)
  ret double %red
}

define double @vreduce_fmax_nxv1f64_nonans_noinfs(<vscale x 1 x double> %v) {
; CHECK-LABEL: vreduce_fmax_nxv1f64_nonans_noinfs:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI50_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI50_0)
; CHECK-NEXT:    vsetivli zero, 1, e64, m1, ta, mu
; CHECK-NEXT:    vlse64.v v9, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e64, m1, ta, mu
; CHECK-NEXT:    vfredmax.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call nnan ninf double @llvm.vector.reduce.fmax.nxv1f64(<vscale x 1 x double> %v)
  ret double %red
}

declare double @llvm.vector.reduce.fmax.nxv2f64(<vscale x 2 x double>)

define double @vreduce_fmax_nxv2f64(<vscale x 2 x double> %v) {
; CHECK-LABEL: vreduce_fmax_nxv2f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI51_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI51_0)
; CHECK-NEXT:    vsetivli zero, 1, e64, m1, ta, mu
; CHECK-NEXT:    vlse64.v v10, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e64, m2, ta, mu
; CHECK-NEXT:    vfredmax.vs v8, v8, v10
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call double @llvm.vector.reduce.fmax.nxv2f64(<vscale x 2 x double> %v)
  ret double %red
}

declare double @llvm.vector.reduce.fmax.nxv4f64(<vscale x 4 x double>)

define double @vreduce_fmax_nxv4f64(<vscale x 4 x double> %v) {
; CHECK-LABEL: vreduce_fmax_nxv4f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI52_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI52_0)
; CHECK-NEXT:    vsetivli zero, 1, e64, m1, ta, mu
; CHECK-NEXT:    vlse64.v v12, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e64, m4, ta, mu
; CHECK-NEXT:    vfredmax.vs v8, v8, v12
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call double @llvm.vector.reduce.fmax.nxv4f64(<vscale x 4 x double> %v)
  ret double %red
}

declare double @llvm.vector.reduce.fmax.nxv16f64(<vscale x 16 x double>)

define double @vreduce_fmax_nxv16f64(<vscale x 16 x double> %v) {
; CHECK-LABEL: vreduce_fmax_nxv16f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e64, m8, ta, mu
; CHECK-NEXT:    vfmax.vv v8, v8, v16
; CHECK-NEXT:    lui a0, %hi(.LCPI53_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI53_0)
; CHECK-NEXT:    vsetivli zero, 1, e64, m1, ta, mu
; CHECK-NEXT:    vlse64.v v16, (a0), zero
; CHECK-NEXT:    vsetvli a0, zero, e64, m8, ta, mu
; CHECK-NEXT:    vfredmax.vs v8, v8, v16
; CHECK-NEXT:    vfmv.f.s fa0, v8
; CHECK-NEXT:    ret
  %red = call double @llvm.vector.reduce.fmax.nxv16f64(<vscale x 16 x double> %v)
  ret double %red
}

define float @vreduce_nsz_fadd_nxv1f32(<vscale x 1 x float> %v, float %s) {
; CHECK-LABEL: vreduce_nsz_fadd_nxv1f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 1, e32, m1, ta, mu
; CHECK-NEXT:    vmv.s.x v9, zero
; CHECK-NEXT:    vsetvli a0, zero, e32, mf2, ta, mu
; CHECK-NEXT:    vfredusum.vs v8, v8, v9
; CHECK-NEXT:    vfmv.f.s ft0, v8
; CHECK-NEXT:    fadd.s fa0, fa0, ft0
; CHECK-NEXT:    ret
  %red = call reassoc nsz float @llvm.vector.reduce.fadd.nxv1f32(float %s, <vscale x 1 x float> %v)
  ret float %red
}
