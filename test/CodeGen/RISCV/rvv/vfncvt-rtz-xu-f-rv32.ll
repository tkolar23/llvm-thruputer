; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+experimental-v,+d,+zfh -verify-machineinstrs \
; RUN:   < %s | FileCheck %s
declare <vscale x 1 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv1i8.nxv1f16(
  <vscale x 1 x half>,
  i32);

define <vscale x 1 x i8> @intrinsic_vfncvt_rtz.xu.f.w_nxv1i8_nxv1f16(<vscale x 1 x half> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_rtz.xu.f.w_nxv1i8_nxv1f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, mf8, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v9, v8
; CHECK-NEXT:    vmv1r.v v8, v9
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv1i8.nxv1f16(
    <vscale x 1 x half> %0,
    i32 %1)

  ret <vscale x 1 x i8> %a
}

declare <vscale x 1 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv1i8.nxv1f16(
  <vscale x 1 x i8>,
  <vscale x 1 x half>,
  <vscale x 1 x i1>,
  i32,
  i32);

define <vscale x 1 x i8> @intrinsic_vfncvt_mask_rtz.xu.f.w_nxv1i8_nxv1f16(<vscale x 1 x i8> %0, <vscale x 1 x half> %1, <vscale x 1 x i1> %2, i32 %3) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_mask_rtz.xu.f.w_nxv1i8_nxv1f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, mf8, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v8, v9, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv1i8.nxv1f16(
    <vscale x 1 x i8> %0,
    <vscale x 1 x half> %1,
    <vscale x 1 x i1> %2,
    i32 %3, i32 1)

  ret <vscale x 1 x i8> %a
}

declare <vscale x 2 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv2i8.nxv2f16(
  <vscale x 2 x half>,
  i32);

define <vscale x 2 x i8> @intrinsic_vfncvt_rtz.xu.f.w_nxv2i8_nxv2f16(<vscale x 2 x half> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_rtz.xu.f.w_nxv2i8_nxv2f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, mf4, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v9, v8
; CHECK-NEXT:    vmv1r.v v8, v9
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv2i8.nxv2f16(
    <vscale x 2 x half> %0,
    i32 %1)

  ret <vscale x 2 x i8> %a
}

declare <vscale x 2 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv2i8.nxv2f16(
  <vscale x 2 x i8>,
  <vscale x 2 x half>,
  <vscale x 2 x i1>,
  i32,
  i32);

define <vscale x 2 x i8> @intrinsic_vfncvt_mask_rtz.xu.f.w_nxv2i8_nxv2f16(<vscale x 2 x i8> %0, <vscale x 2 x half> %1, <vscale x 2 x i1> %2, i32 %3) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_mask_rtz.xu.f.w_nxv2i8_nxv2f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, mf4, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v8, v9, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv2i8.nxv2f16(
    <vscale x 2 x i8> %0,
    <vscale x 2 x half> %1,
    <vscale x 2 x i1> %2,
    i32 %3, i32 1)

  ret <vscale x 2 x i8> %a
}

declare <vscale x 4 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv4i8.nxv4f16(
  <vscale x 4 x half>,
  i32);

define <vscale x 4 x i8> @intrinsic_vfncvt_rtz.xu.f.w_nxv4i8_nxv4f16(<vscale x 4 x half> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_rtz.xu.f.w_nxv4i8_nxv4f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, mf2, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v9, v8
; CHECK-NEXT:    vmv1r.v v8, v9
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv4i8.nxv4f16(
    <vscale x 4 x half> %0,
    i32 %1)

  ret <vscale x 4 x i8> %a
}

declare <vscale x 4 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv4i8.nxv4f16(
  <vscale x 4 x i8>,
  <vscale x 4 x half>,
  <vscale x 4 x i1>,
  i32,
  i32);

define <vscale x 4 x i8> @intrinsic_vfncvt_mask_rtz.xu.f.w_nxv4i8_nxv4f16(<vscale x 4 x i8> %0, <vscale x 4 x half> %1, <vscale x 4 x i1> %2, i32 %3) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_mask_rtz.xu.f.w_nxv4i8_nxv4f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, mf2, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v8, v9, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv4i8.nxv4f16(
    <vscale x 4 x i8> %0,
    <vscale x 4 x half> %1,
    <vscale x 4 x i1> %2,
    i32 %3, i32 1)

  ret <vscale x 4 x i8> %a
}

declare <vscale x 8 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv8i8.nxv8f16(
  <vscale x 8 x half>,
  i32);

define <vscale x 8 x i8> @intrinsic_vfncvt_rtz.xu.f.w_nxv8i8_nxv8f16(<vscale x 8 x half> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_rtz.xu.f.w_nxv8i8_nxv8f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, m1, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v10, v8
; CHECK-NEXT:    vmv.v.v v8, v10
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv8i8.nxv8f16(
    <vscale x 8 x half> %0,
    i32 %1)

  ret <vscale x 8 x i8> %a
}

declare <vscale x 8 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv8i8.nxv8f16(
  <vscale x 8 x i8>,
  <vscale x 8 x half>,
  <vscale x 8 x i1>,
  i32,
  i32);

define <vscale x 8 x i8> @intrinsic_vfncvt_mask_rtz.xu.f.w_nxv8i8_nxv8f16(<vscale x 8 x i8> %0, <vscale x 8 x half> %1, <vscale x 8 x i1> %2, i32 %3) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_mask_rtz.xu.f.w_nxv8i8_nxv8f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, m1, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v8, v10, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv8i8.nxv8f16(
    <vscale x 8 x i8> %0,
    <vscale x 8 x half> %1,
    <vscale x 8 x i1> %2,
    i32 %3, i32 1)

  ret <vscale x 8 x i8> %a
}

declare <vscale x 16 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv16i8.nxv16f16(
  <vscale x 16 x half>,
  i32);

define <vscale x 16 x i8> @intrinsic_vfncvt_rtz.xu.f.w_nxv16i8_nxv16f16(<vscale x 16 x half> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_rtz.xu.f.w_nxv16i8_nxv16f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, m2, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v12, v8
; CHECK-NEXT:    vmv.v.v v8, v12
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 16 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv16i8.nxv16f16(
    <vscale x 16 x half> %0,
    i32 %1)

  ret <vscale x 16 x i8> %a
}

declare <vscale x 16 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv16i8.nxv16f16(
  <vscale x 16 x i8>,
  <vscale x 16 x half>,
  <vscale x 16 x i1>,
  i32,
  i32);

define <vscale x 16 x i8> @intrinsic_vfncvt_mask_rtz.xu.f.w_nxv16i8_nxv16f16(<vscale x 16 x i8> %0, <vscale x 16 x half> %1, <vscale x 16 x i1> %2, i32 %3) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_mask_rtz.xu.f.w_nxv16i8_nxv16f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, m2, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v8, v12, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 16 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv16i8.nxv16f16(
    <vscale x 16 x i8> %0,
    <vscale x 16 x half> %1,
    <vscale x 16 x i1> %2,
    i32 %3, i32 1)

  ret <vscale x 16 x i8> %a
}

declare <vscale x 32 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv32i8.nxv32f16(
  <vscale x 32 x half>,
  i32);

define <vscale x 32 x i8> @intrinsic_vfncvt_rtz.xu.f.w_nxv32i8_nxv32f16(<vscale x 32 x half> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_rtz.xu.f.w_nxv32i8_nxv32f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, m4, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v16, v8
; CHECK-NEXT:    vmv.v.v v8, v16
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 32 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv32i8.nxv32f16(
    <vscale x 32 x half> %0,
    i32 %1)

  ret <vscale x 32 x i8> %a
}

declare <vscale x 32 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv32i8.nxv32f16(
  <vscale x 32 x i8>,
  <vscale x 32 x half>,
  <vscale x 32 x i1>,
  i32,
  i32);

define <vscale x 32 x i8> @intrinsic_vfncvt_mask_rtz.xu.f.w_nxv32i8_nxv32f16(<vscale x 32 x i8> %0, <vscale x 32 x half> %1, <vscale x 32 x i1> %2, i32 %3) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_mask_rtz.xu.f.w_nxv32i8_nxv32f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, m4, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v8, v16, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 32 x i8> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv32i8.nxv32f16(
    <vscale x 32 x i8> %0,
    <vscale x 32 x half> %1,
    <vscale x 32 x i1> %2,
    i32 %3, i32 1)

  ret <vscale x 32 x i8> %a
}

declare <vscale x 1 x i16> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv1i16.nxv1f32(
  <vscale x 1 x float>,
  i32);

define <vscale x 1 x i16> @intrinsic_vfncvt_rtz.xu.f.w_nxv1i16_nxv1f32(<vscale x 1 x float> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_rtz.xu.f.w_nxv1i16_nxv1f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, mf4, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v9, v8
; CHECK-NEXT:    vmv1r.v v8, v9
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x i16> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv1i16.nxv1f32(
    <vscale x 1 x float> %0,
    i32 %1)

  ret <vscale x 1 x i16> %a
}

declare <vscale x 1 x i16> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv1i16.nxv1f32(
  <vscale x 1 x i16>,
  <vscale x 1 x float>,
  <vscale x 1 x i1>,
  i32,
  i32);

define <vscale x 1 x i16> @intrinsic_vfncvt_mask_rtz.xu.f.w_nxv1i16_nxv1f32(<vscale x 1 x i16> %0, <vscale x 1 x float> %1, <vscale x 1 x i1> %2, i32 %3) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_mask_rtz.xu.f.w_nxv1i16_nxv1f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, mf4, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v8, v9, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x i16> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv1i16.nxv1f32(
    <vscale x 1 x i16> %0,
    <vscale x 1 x float> %1,
    <vscale x 1 x i1> %2,
    i32 %3, i32 1)

  ret <vscale x 1 x i16> %a
}

declare <vscale x 2 x i16> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv2i16.nxv2f32(
  <vscale x 2 x float>,
  i32);

define <vscale x 2 x i16> @intrinsic_vfncvt_rtz.xu.f.w_nxv2i16_nxv2f32(<vscale x 2 x float> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_rtz.xu.f.w_nxv2i16_nxv2f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, mf2, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v9, v8
; CHECK-NEXT:    vmv1r.v v8, v9
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x i16> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv2i16.nxv2f32(
    <vscale x 2 x float> %0,
    i32 %1)

  ret <vscale x 2 x i16> %a
}

declare <vscale x 2 x i16> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv2i16.nxv2f32(
  <vscale x 2 x i16>,
  <vscale x 2 x float>,
  <vscale x 2 x i1>,
  i32,
  i32);

define <vscale x 2 x i16> @intrinsic_vfncvt_mask_rtz.xu.f.w_nxv2i16_nxv2f32(<vscale x 2 x i16> %0, <vscale x 2 x float> %1, <vscale x 2 x i1> %2, i32 %3) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_mask_rtz.xu.f.w_nxv2i16_nxv2f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, mf2, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v8, v9, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x i16> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv2i16.nxv2f32(
    <vscale x 2 x i16> %0,
    <vscale x 2 x float> %1,
    <vscale x 2 x i1> %2,
    i32 %3, i32 1)

  ret <vscale x 2 x i16> %a
}

declare <vscale x 4 x i16> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv4i16.nxv4f32(
  <vscale x 4 x float>,
  i32);

define <vscale x 4 x i16> @intrinsic_vfncvt_rtz.xu.f.w_nxv4i16_nxv4f32(<vscale x 4 x float> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_rtz.xu.f.w_nxv4i16_nxv4f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m1, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v10, v8
; CHECK-NEXT:    vmv.v.v v8, v10
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x i16> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv4i16.nxv4f32(
    <vscale x 4 x float> %0,
    i32 %1)

  ret <vscale x 4 x i16> %a
}

declare <vscale x 4 x i16> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv4i16.nxv4f32(
  <vscale x 4 x i16>,
  <vscale x 4 x float>,
  <vscale x 4 x i1>,
  i32,
  i32);

define <vscale x 4 x i16> @intrinsic_vfncvt_mask_rtz.xu.f.w_nxv4i16_nxv4f32(<vscale x 4 x i16> %0, <vscale x 4 x float> %1, <vscale x 4 x i1> %2, i32 %3) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_mask_rtz.xu.f.w_nxv4i16_nxv4f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m1, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v8, v10, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x i16> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv4i16.nxv4f32(
    <vscale x 4 x i16> %0,
    <vscale x 4 x float> %1,
    <vscale x 4 x i1> %2,
    i32 %3, i32 1)

  ret <vscale x 4 x i16> %a
}

declare <vscale x 8 x i16> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv8i16.nxv8f32(
  <vscale x 8 x float>,
  i32);

define <vscale x 8 x i16> @intrinsic_vfncvt_rtz.xu.f.w_nxv8i16_nxv8f32(<vscale x 8 x float> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_rtz.xu.f.w_nxv8i16_nxv8f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m2, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v12, v8
; CHECK-NEXT:    vmv.v.v v8, v12
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x i16> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv8i16.nxv8f32(
    <vscale x 8 x float> %0,
    i32 %1)

  ret <vscale x 8 x i16> %a
}

declare <vscale x 8 x i16> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv8i16.nxv8f32(
  <vscale x 8 x i16>,
  <vscale x 8 x float>,
  <vscale x 8 x i1>,
  i32,
  i32);

define <vscale x 8 x i16> @intrinsic_vfncvt_mask_rtz.xu.f.w_nxv8i16_nxv8f32(<vscale x 8 x i16> %0, <vscale x 8 x float> %1, <vscale x 8 x i1> %2, i32 %3) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_mask_rtz.xu.f.w_nxv8i16_nxv8f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m2, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v8, v12, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x i16> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv8i16.nxv8f32(
    <vscale x 8 x i16> %0,
    <vscale x 8 x float> %1,
    <vscale x 8 x i1> %2,
    i32 %3, i32 1)

  ret <vscale x 8 x i16> %a
}

declare <vscale x 16 x i16> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv16i16.nxv16f32(
  <vscale x 16 x float>,
  i32);

define <vscale x 16 x i16> @intrinsic_vfncvt_rtz.xu.f.w_nxv16i16_nxv16f32(<vscale x 16 x float> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_rtz.xu.f.w_nxv16i16_nxv16f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m4, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v16, v8
; CHECK-NEXT:    vmv.v.v v8, v16
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 16 x i16> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv16i16.nxv16f32(
    <vscale x 16 x float> %0,
    i32 %1)

  ret <vscale x 16 x i16> %a
}

declare <vscale x 16 x i16> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv16i16.nxv16f32(
  <vscale x 16 x i16>,
  <vscale x 16 x float>,
  <vscale x 16 x i1>,
  i32,
  i32);

define <vscale x 16 x i16> @intrinsic_vfncvt_mask_rtz.xu.f.w_nxv16i16_nxv16f32(<vscale x 16 x i16> %0, <vscale x 16 x float> %1, <vscale x 16 x i1> %2, i32 %3) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_mask_rtz.xu.f.w_nxv16i16_nxv16f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m4, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v8, v16, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 16 x i16> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv16i16.nxv16f32(
    <vscale x 16 x i16> %0,
    <vscale x 16 x float> %1,
    <vscale x 16 x i1> %2,
    i32 %3, i32 1)

  ret <vscale x 16 x i16> %a
}

declare <vscale x 1 x i32> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv1i32.nxv1f64(
  <vscale x 1 x double>,
  i32);

define <vscale x 1 x i32> @intrinsic_vfncvt_rtz.xu.f.w_nxv1i32_nxv1f64(<vscale x 1 x double> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_rtz.xu.f.w_nxv1i32_nxv1f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, mf2, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v9, v8
; CHECK-NEXT:    vmv1r.v v8, v9
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x i32> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv1i32.nxv1f64(
    <vscale x 1 x double> %0,
    i32 %1)

  ret <vscale x 1 x i32> %a
}

declare <vscale x 1 x i32> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv1i32.nxv1f64(
  <vscale x 1 x i32>,
  <vscale x 1 x double>,
  <vscale x 1 x i1>,
  i32,
  i32);

define <vscale x 1 x i32> @intrinsic_vfncvt_mask_rtz.xu.f.w_nxv1i32_nxv1f64(<vscale x 1 x i32> %0, <vscale x 1 x double> %1, <vscale x 1 x i1> %2, i32 %3) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_mask_rtz.xu.f.w_nxv1i32_nxv1f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, mf2, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v8, v9, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x i32> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv1i32.nxv1f64(
    <vscale x 1 x i32> %0,
    <vscale x 1 x double> %1,
    <vscale x 1 x i1> %2,
    i32 %3, i32 1)

  ret <vscale x 1 x i32> %a
}

declare <vscale x 2 x i32> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv2i32.nxv2f64(
  <vscale x 2 x double>,
  i32);

define <vscale x 2 x i32> @intrinsic_vfncvt_rtz.xu.f.w_nxv2i32_nxv2f64(<vscale x 2 x double> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_rtz.xu.f.w_nxv2i32_nxv2f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m1, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v10, v8
; CHECK-NEXT:    vmv.v.v v8, v10
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x i32> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv2i32.nxv2f64(
    <vscale x 2 x double> %0,
    i32 %1)

  ret <vscale x 2 x i32> %a
}

declare <vscale x 2 x i32> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv2i32.nxv2f64(
  <vscale x 2 x i32>,
  <vscale x 2 x double>,
  <vscale x 2 x i1>,
  i32,
  i32);

define <vscale x 2 x i32> @intrinsic_vfncvt_mask_rtz.xu.f.w_nxv2i32_nxv2f64(<vscale x 2 x i32> %0, <vscale x 2 x double> %1, <vscale x 2 x i1> %2, i32 %3) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_mask_rtz.xu.f.w_nxv2i32_nxv2f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m1, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v8, v10, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x i32> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv2i32.nxv2f64(
    <vscale x 2 x i32> %0,
    <vscale x 2 x double> %1,
    <vscale x 2 x i1> %2,
    i32 %3, i32 1)

  ret <vscale x 2 x i32> %a
}

declare <vscale x 4 x i32> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv4i32.nxv4f64(
  <vscale x 4 x double>,
  i32);

define <vscale x 4 x i32> @intrinsic_vfncvt_rtz.xu.f.w_nxv4i32_nxv4f64(<vscale x 4 x double> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_rtz.xu.f.w_nxv4i32_nxv4f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m2, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v12, v8
; CHECK-NEXT:    vmv.v.v v8, v12
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x i32> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv4i32.nxv4f64(
    <vscale x 4 x double> %0,
    i32 %1)

  ret <vscale x 4 x i32> %a
}

declare <vscale x 4 x i32> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv4i32.nxv4f64(
  <vscale x 4 x i32>,
  <vscale x 4 x double>,
  <vscale x 4 x i1>,
  i32,
  i32);

define <vscale x 4 x i32> @intrinsic_vfncvt_mask_rtz.xu.f.w_nxv4i32_nxv4f64(<vscale x 4 x i32> %0, <vscale x 4 x double> %1, <vscale x 4 x i1> %2, i32 %3) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_mask_rtz.xu.f.w_nxv4i32_nxv4f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m2, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v8, v12, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x i32> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv4i32.nxv4f64(
    <vscale x 4 x i32> %0,
    <vscale x 4 x double> %1,
    <vscale x 4 x i1> %2,
    i32 %3, i32 1)

  ret <vscale x 4 x i32> %a
}

declare <vscale x 8 x i32> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv8i32.nxv8f64(
  <vscale x 8 x double>,
  i32);

define <vscale x 8 x i32> @intrinsic_vfncvt_rtz.xu.f.w_nxv8i32_nxv8f64(<vscale x 8 x double> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_rtz.xu.f.w_nxv8i32_nxv8f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m4, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v16, v8
; CHECK-NEXT:    vmv.v.v v8, v16
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x i32> @llvm.riscv.vfncvt.rtz.xu.f.w.nxv8i32.nxv8f64(
    <vscale x 8 x double> %0,
    i32 %1)

  ret <vscale x 8 x i32> %a
}

declare <vscale x 8 x i32> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv8i32.nxv8f64(
  <vscale x 8 x i32>,
  <vscale x 8 x double>,
  <vscale x 8 x i1>,
  i32,
  i32);

define <vscale x 8 x i32> @intrinsic_vfncvt_mask_rtz.xu.f.w_nxv8i32_nxv8f64(<vscale x 8 x i32> %0, <vscale x 8 x double> %1, <vscale x 8 x i1> %2, i32 %3) nounwind {
; CHECK-LABEL: intrinsic_vfncvt_mask_rtz.xu.f.w_nxv8i32_nxv8f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m4, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v8, v16, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x i32> @llvm.riscv.vfncvt.rtz.xu.f.w.mask.nxv8i32.nxv8f64(
    <vscale x 8 x i32> %0,
    <vscale x 8 x double> %1,
    <vscale x 8 x i1> %2,
    i32 %3, i32 1)

  ret <vscale x 8 x i32> %a
}
