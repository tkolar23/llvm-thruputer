; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+experimental-v,+f -verify-machineinstrs \
; RUN:   < %s | FileCheck %s
declare i32 @llvm.riscv.vcpop.i32.nxv1i1(
  <vscale x 1 x i1>,
  i32);

define i32 @intrinsic_vcpop_m_i32_nxv1i1(<vscale x 1 x i1> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vcpop_m_i32_nxv1i1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, mf8, ta, mu
; CHECK-NEXT:    vcpop.m a0, v0
; CHECK-NEXT:    ret
entry:
  %a = call i32 @llvm.riscv.vcpop.i32.nxv1i1(
    <vscale x 1 x i1> %0,
    i32 %1)

  ret i32 %a
}

declare i32 @llvm.riscv.vcpop.mask.i32.nxv1i1(
  <vscale x 1 x i1>,
  <vscale x 1 x i1>,
  i32);

define i32 @intrinsic_vcpop_mask_m_i32_nxv1i1(<vscale x 1 x i1> %0, <vscale x 1 x i1> %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vcpop_mask_m_i32_nxv1i1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vmv1r.v v9, v0
; CHECK-NEXT:    vsetvli zero, a0, e8, mf8, ta, mu
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    vcpop.m a0, v9, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call i32 @llvm.riscv.vcpop.mask.i32.nxv1i1(
    <vscale x 1 x i1> %0,
    <vscale x 1 x i1> %1,
    i32 %2)

  ret i32 %a
}

declare i32 @llvm.riscv.vcpop.i32.nxv2i1(
  <vscale x 2 x i1>,
  i32);

define i32 @intrinsic_vcpop_m_i32_nxv2i1(<vscale x 2 x i1> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vcpop_m_i32_nxv2i1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, mf4, ta, mu
; CHECK-NEXT:    vcpop.m a0, v0
; CHECK-NEXT:    ret
entry:
  %a = call i32 @llvm.riscv.vcpop.i32.nxv2i1(
    <vscale x 2 x i1> %0,
    i32 %1)

  ret i32 %a
}

declare i32 @llvm.riscv.vcpop.mask.i32.nxv2i1(
  <vscale x 2 x i1>,
  <vscale x 2 x i1>,
  i32);

define i32 @intrinsic_vcpop_mask_m_i32_nxv2i1(<vscale x 2 x i1> %0, <vscale x 2 x i1> %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vcpop_mask_m_i32_nxv2i1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vmv1r.v v9, v0
; CHECK-NEXT:    vsetvli zero, a0, e8, mf4, ta, mu
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    vcpop.m a0, v9, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call i32 @llvm.riscv.vcpop.mask.i32.nxv2i1(
    <vscale x 2 x i1> %0,
    <vscale x 2 x i1> %1,
    i32 %2)

  ret i32 %a
}

declare i32 @llvm.riscv.vcpop.i32.nxv4i1(
  <vscale x 4 x i1>,
  i32);

define i32 @intrinsic_vcpop_m_i32_nxv4i1(<vscale x 4 x i1> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vcpop_m_i32_nxv4i1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, mf2, ta, mu
; CHECK-NEXT:    vcpop.m a0, v0
; CHECK-NEXT:    ret
entry:
  %a = call i32 @llvm.riscv.vcpop.i32.nxv4i1(
    <vscale x 4 x i1> %0,
    i32 %1)

  ret i32 %a
}

declare i32 @llvm.riscv.vcpop.mask.i32.nxv4i1(
  <vscale x 4 x i1>,
  <vscale x 4 x i1>,
  i32);

define i32 @intrinsic_vcpop_mask_m_i32_nxv4i1(<vscale x 4 x i1> %0, <vscale x 4 x i1> %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vcpop_mask_m_i32_nxv4i1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vmv1r.v v9, v0
; CHECK-NEXT:    vsetvli zero, a0, e8, mf2, ta, mu
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    vcpop.m a0, v9, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call i32 @llvm.riscv.vcpop.mask.i32.nxv4i1(
    <vscale x 4 x i1> %0,
    <vscale x 4 x i1> %1,
    i32 %2)

  ret i32 %a
}

declare i32 @llvm.riscv.vcpop.i32.nxv8i1(
  <vscale x 8 x i1>,
  i32);

define i32 @intrinsic_vcpop_m_i32_nxv8i1(<vscale x 8 x i1> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vcpop_m_i32_nxv8i1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, m1, ta, mu
; CHECK-NEXT:    vcpop.m a0, v0
; CHECK-NEXT:    ret
entry:
  %a = call i32 @llvm.riscv.vcpop.i32.nxv8i1(
    <vscale x 8 x i1> %0,
    i32 %1)

  ret i32 %a
}

declare i32 @llvm.riscv.vcpop.mask.i32.nxv8i1(
  <vscale x 8 x i1>,
  <vscale x 8 x i1>,
  i32);

define i32 @intrinsic_vcpop_mask_m_i32_nxv8i1(<vscale x 8 x i1> %0, <vscale x 8 x i1> %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vcpop_mask_m_i32_nxv8i1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vmv1r.v v9, v0
; CHECK-NEXT:    vsetvli zero, a0, e8, m1, ta, mu
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    vcpop.m a0, v9, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call i32 @llvm.riscv.vcpop.mask.i32.nxv8i1(
    <vscale x 8 x i1> %0,
    <vscale x 8 x i1> %1,
    i32 %2)

  ret i32 %a
}

declare i32 @llvm.riscv.vcpop.i32.nxv16i1(
  <vscale x 16 x i1>,
  i32);

define i32 @intrinsic_vcpop_m_i32_nxv16i1(<vscale x 16 x i1> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vcpop_m_i32_nxv16i1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, m2, ta, mu
; CHECK-NEXT:    vcpop.m a0, v0
; CHECK-NEXT:    ret
entry:
  %a = call i32 @llvm.riscv.vcpop.i32.nxv16i1(
    <vscale x 16 x i1> %0,
    i32 %1)

  ret i32 %a
}

declare i32 @llvm.riscv.vcpop.mask.i32.nxv16i1(
  <vscale x 16 x i1>,
  <vscale x 16 x i1>,
  i32);

define i32 @intrinsic_vcpop_mask_m_i32_nxv16i1(<vscale x 16 x i1> %0, <vscale x 16 x i1> %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vcpop_mask_m_i32_nxv16i1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vmv1r.v v9, v0
; CHECK-NEXT:    vsetvli zero, a0, e8, m2, ta, mu
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    vcpop.m a0, v9, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call i32 @llvm.riscv.vcpop.mask.i32.nxv16i1(
    <vscale x 16 x i1> %0,
    <vscale x 16 x i1> %1,
    i32 %2)

  ret i32 %a
}

declare i32 @llvm.riscv.vcpop.i32.nxv32i1(
  <vscale x 32 x i1>,
  i32);

define i32 @intrinsic_vcpop_m_i32_nxv32i1(<vscale x 32 x i1> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vcpop_m_i32_nxv32i1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, m4, ta, mu
; CHECK-NEXT:    vcpop.m a0, v0
; CHECK-NEXT:    ret
entry:
  %a = call i32 @llvm.riscv.vcpop.i32.nxv32i1(
    <vscale x 32 x i1> %0,
    i32 %1)

  ret i32 %a
}

declare i32 @llvm.riscv.vcpop.mask.i32.nxv32i1(
  <vscale x 32 x i1>,
  <vscale x 32 x i1>,
  i32);

define i32 @intrinsic_vcpop_mask_m_i32_nxv32i1(<vscale x 32 x i1> %0, <vscale x 32 x i1> %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vcpop_mask_m_i32_nxv32i1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vmv1r.v v9, v0
; CHECK-NEXT:    vsetvli zero, a0, e8, m4, ta, mu
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    vcpop.m a0, v9, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call i32 @llvm.riscv.vcpop.mask.i32.nxv32i1(
    <vscale x 32 x i1> %0,
    <vscale x 32 x i1> %1,
    i32 %2)

  ret i32 %a
}

declare i32 @llvm.riscv.vcpop.i32.nxv64i1(
  <vscale x 64 x i1>,
  i32);

define i32 @intrinsic_vcpop_m_i32_nxv64i1(<vscale x 64 x i1> %0, i32 %1) nounwind {
; CHECK-LABEL: intrinsic_vcpop_m_i32_nxv64i1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, m8, ta, mu
; CHECK-NEXT:    vcpop.m a0, v0
; CHECK-NEXT:    ret
entry:
  %a = call i32 @llvm.riscv.vcpop.i32.nxv64i1(
    <vscale x 64 x i1> %0,
    i32 %1)

  ret i32 %a
}

declare i32 @llvm.riscv.vcpop.mask.i32.nxv64i1(
  <vscale x 64 x i1>,
  <vscale x 64 x i1>,
  i32);

define i32 @intrinsic_vcpop_mask_m_i32_nxv64i1(<vscale x 64 x i1> %0, <vscale x 64 x i1> %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vcpop_mask_m_i32_nxv64i1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vmv1r.v v9, v0
; CHECK-NEXT:    vsetvli zero, a0, e8, m8, ta, mu
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    vcpop.m a0, v9, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call i32 @llvm.riscv.vcpop.mask.i32.nxv64i1(
    <vscale x 64 x i1> %0,
    <vscale x 64 x i1> %1,
    i32 %2)

  ret i32 %a
}
