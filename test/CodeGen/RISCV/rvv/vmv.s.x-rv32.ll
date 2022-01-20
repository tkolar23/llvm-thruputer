; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+experimental-v -verify-machineinstrs < %s | FileCheck %s

declare <vscale x 1 x i8> @llvm.riscv.vmv.s.x.nxv1i8(<vscale x 1 x i8>, i8, i32)

define <vscale x 1 x i8> @intrinsic_vmv.s.x_x_nxv1i8(<vscale x 1 x i8> %0, i8 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv1i8:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e8, mf8, tu, mu
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x i8> @llvm.riscv.vmv.s.x.nxv1i8(<vscale x 1 x i8> %0, i8 %1, i32 %2)
  ret <vscale x 1 x i8> %a
}

declare <vscale x 2 x i8> @llvm.riscv.vmv.s.x.nxv2i8(<vscale x 2 x i8>, i8, i32)

define <vscale x 2 x i8> @intrinsic_vmv.s.x_x_nxv2i8(<vscale x 2 x i8> %0, i8 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv2i8:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e8, mf4, tu, mu
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x i8> @llvm.riscv.vmv.s.x.nxv2i8(<vscale x 2 x i8> %0, i8 %1, i32 %2)
  ret <vscale x 2 x i8> %a
}

declare <vscale x 4 x i8> @llvm.riscv.vmv.s.x.nxv4i8(<vscale x 4 x i8>, i8, i32)

define <vscale x 4 x i8> @intrinsic_vmv.s.x_x_nxv4i8(<vscale x 4 x i8> %0, i8 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv4i8:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e8, mf2, tu, mu
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x i8> @llvm.riscv.vmv.s.x.nxv4i8(<vscale x 4 x i8> %0, i8 %1, i32 %2)
  ret <vscale x 4 x i8> %a
}

declare <vscale x 8 x i8> @llvm.riscv.vmv.s.x.nxv8i8(<vscale x 8 x i8>, i8, i32)

define <vscale x 8 x i8> @intrinsic_vmv.s.x_x_nxv8i8(<vscale x 8 x i8> %0, i8 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv8i8:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e8, m1, tu, mu
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x i8> @llvm.riscv.vmv.s.x.nxv8i8(<vscale x 8 x i8> %0, i8 %1, i32 %2)
  ret <vscale x 8 x i8> %a
}

declare <vscale x 16 x i8> @llvm.riscv.vmv.s.x.nxv16i8(<vscale x 16 x i8>, i8, i32)

define <vscale x 16 x i8> @intrinsic_vmv.s.x_x_nxv16i8(<vscale x 16 x i8> %0, i8 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv16i8:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e8, m2, tu, mu
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 16 x i8> @llvm.riscv.vmv.s.x.nxv16i8(<vscale x 16 x i8> %0, i8 %1, i32 %2)
  ret <vscale x 16 x i8> %a
}

declare <vscale x 32 x i8> @llvm.riscv.vmv.s.x.nxv32i8(<vscale x 32 x i8>, i8, i32)

define <vscale x 32 x i8> @intrinsic_vmv.s.x_x_nxv32i8(<vscale x 32 x i8> %0, i8 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv32i8:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e8, m4, tu, mu
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 32 x i8> @llvm.riscv.vmv.s.x.nxv32i8(<vscale x 32 x i8> %0, i8 %1, i32 %2)
  ret <vscale x 32 x i8> %a
}

declare <vscale x 64 x i8> @llvm.riscv.vmv.s.x.nxv64i8(<vscale x 64 x i8>, i8, i32)

define <vscale x 64 x i8> @intrinsic_vmv.s.x_x_nxv64i8(<vscale x 64 x i8> %0, i8 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv64i8:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e8, m8, tu, mu
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 64 x i8> @llvm.riscv.vmv.s.x.nxv64i8(<vscale x 64 x i8> %0, i8 %1, i32 %2)
  ret <vscale x 64 x i8> %a
}

declare <vscale x 1 x i16> @llvm.riscv.vmv.s.x.nxv1i16(<vscale x 1 x i16>, i16, i32)

define <vscale x 1 x i16> @intrinsic_vmv.s.x_x_nxv1i16(<vscale x 1 x i16> %0, i16 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv1i16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, mf4, tu, mu
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x i16> @llvm.riscv.vmv.s.x.nxv1i16(<vscale x 1 x i16> %0, i16 %1, i32 %2)
  ret <vscale x 1 x i16> %a
}

declare <vscale x 2 x i16> @llvm.riscv.vmv.s.x.nxv2i16(<vscale x 2 x i16>, i16, i32)

define <vscale x 2 x i16> @intrinsic_vmv.s.x_x_nxv2i16(<vscale x 2 x i16> %0, i16 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv2i16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, mf2, tu, mu
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x i16> @llvm.riscv.vmv.s.x.nxv2i16(<vscale x 2 x i16> %0, i16 %1, i32 %2)
  ret <vscale x 2 x i16> %a
}

declare <vscale x 4 x i16> @llvm.riscv.vmv.s.x.nxv4i16(<vscale x 4 x i16>, i16, i32)

define <vscale x 4 x i16> @intrinsic_vmv.s.x_x_nxv4i16(<vscale x 4 x i16> %0, i16 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv4i16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, m1, tu, mu
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x i16> @llvm.riscv.vmv.s.x.nxv4i16(<vscale x 4 x i16> %0, i16 %1, i32 %2)
  ret <vscale x 4 x i16> %a
}

declare <vscale x 8 x i16> @llvm.riscv.vmv.s.x.nxv8i16(<vscale x 8 x i16>, i16, i32)

define <vscale x 8 x i16> @intrinsic_vmv.s.x_x_nxv8i16(<vscale x 8 x i16> %0, i16 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv8i16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, m2, tu, mu
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x i16> @llvm.riscv.vmv.s.x.nxv8i16(<vscale x 8 x i16> %0, i16 %1, i32 %2)
  ret <vscale x 8 x i16> %a
}

declare <vscale x 16 x i16> @llvm.riscv.vmv.s.x.nxv16i16(<vscale x 16 x i16>, i16, i32)

define <vscale x 16 x i16> @intrinsic_vmv.s.x_x_nxv16i16(<vscale x 16 x i16> %0, i16 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv16i16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, m4, tu, mu
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 16 x i16> @llvm.riscv.vmv.s.x.nxv16i16(<vscale x 16 x i16> %0, i16 %1, i32 %2)
  ret <vscale x 16 x i16> %a
}

declare <vscale x 32 x i16> @llvm.riscv.vmv.s.x.nxv32i16(<vscale x 32 x i16>, i16, i32)

define <vscale x 32 x i16> @intrinsic_vmv.s.x_x_nxv32i16(<vscale x 32 x i16> %0, i16 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv32i16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, m8, tu, mu
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 32 x i16> @llvm.riscv.vmv.s.x.nxv32i16(<vscale x 32 x i16> %0, i16 %1, i32 %2)
  ret <vscale x 32 x i16> %a
}

declare <vscale x 1 x i32> @llvm.riscv.vmv.s.x.nxv1i32(<vscale x 1 x i32>, i32, i32)

define <vscale x 1 x i32> @intrinsic_vmv.s.x_x_nxv1i32(<vscale x 1 x i32> %0, i32 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv1i32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, mf2, tu, mu
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x i32> @llvm.riscv.vmv.s.x.nxv1i32(<vscale x 1 x i32> %0, i32 %1, i32 %2)
  ret <vscale x 1 x i32> %a
}

declare <vscale x 2 x i32> @llvm.riscv.vmv.s.x.nxv2i32(<vscale x 2 x i32>, i32, i32)

define <vscale x 2 x i32> @intrinsic_vmv.s.x_x_nxv2i32(<vscale x 2 x i32> %0, i32 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv2i32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, m1, tu, mu
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x i32> @llvm.riscv.vmv.s.x.nxv2i32(<vscale x 2 x i32> %0, i32 %1, i32 %2)
  ret <vscale x 2 x i32> %a
}

declare <vscale x 4 x i32> @llvm.riscv.vmv.s.x.nxv4i32(<vscale x 4 x i32>, i32, i32)

define <vscale x 4 x i32> @intrinsic_vmv.s.x_x_nxv4i32(<vscale x 4 x i32> %0, i32 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv4i32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, m2, tu, mu
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x i32> @llvm.riscv.vmv.s.x.nxv4i32(<vscale x 4 x i32> %0, i32 %1, i32 %2)
  ret <vscale x 4 x i32> %a
}

declare <vscale x 8 x i32> @llvm.riscv.vmv.s.x.nxv8i32(<vscale x 8 x i32>, i32, i32)

define <vscale x 8 x i32> @intrinsic_vmv.s.x_x_nxv8i32(<vscale x 8 x i32> %0, i32 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv8i32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, m4, tu, mu
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x i32> @llvm.riscv.vmv.s.x.nxv8i32(<vscale x 8 x i32> %0, i32 %1, i32 %2)
  ret <vscale x 8 x i32> %a
}

declare <vscale x 16 x i32> @llvm.riscv.vmv.s.x.nxv16i32(<vscale x 16 x i32>, i32, i32)

define <vscale x 16 x i32> @intrinsic_vmv.s.x_x_nxv16i32(<vscale x 16 x i32> %0, i32 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv16i32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, m8, tu, mu
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 16 x i32> @llvm.riscv.vmv.s.x.nxv16i32(<vscale x 16 x i32> %0, i32 %1, i32 %2)
  ret <vscale x 16 x i32> %a
}

declare <vscale x 1 x i64> @llvm.riscv.vmv.s.x.nxv1i64(<vscale x 1 x i64>, i64, i32);

define <vscale x 1 x i64> @intrinsic_vmv.s.x_x_nxv1i64(<vscale x 1 x i64> %0, i64 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv1i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addi sp, sp, -16
; CHECK-NEXT:    sw a1, 12(sp)
; CHECK-NEXT:    sw a0, 8(sp)
; CHECK-NEXT:    vsetvli zero, a2, e64, m1, ta, mu
; CHECK-NEXT:    addi a0, sp, 8
; CHECK-NEXT:    vlse64.v v9, (a0), zero
; CHECK-NEXT:    vid.v v10
; CHECK-NEXT:    vmseq.vi v0, v10, 0
; CHECK-NEXT:    vmerge.vvm v8, v8, v9, v0
; CHECK-NEXT:    addi sp, sp, 16
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x i64> @llvm.riscv.vmv.s.x.nxv1i64(<vscale x 1 x i64> %0, i64 %1, i32 %2)
  ret <vscale x 1 x i64> %a
}

declare <vscale x 2 x i64> @llvm.riscv.vmv.s.x.nxv2i64(<vscale x 2 x i64>, i64, i32);

define <vscale x 2 x i64> @intrinsic_vmv.s.x_x_nxv2i64(<vscale x 2 x i64> %0, i64 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv2i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addi sp, sp, -16
; CHECK-NEXT:    sw a1, 12(sp)
; CHECK-NEXT:    sw a0, 8(sp)
; CHECK-NEXT:    vsetvli zero, a2, e64, m2, ta, mu
; CHECK-NEXT:    addi a0, sp, 8
; CHECK-NEXT:    vlse64.v v10, (a0), zero
; CHECK-NEXT:    vid.v v12
; CHECK-NEXT:    vmseq.vi v0, v12, 0
; CHECK-NEXT:    vmerge.vvm v8, v8, v10, v0
; CHECK-NEXT:    addi sp, sp, 16
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x i64> @llvm.riscv.vmv.s.x.nxv2i64(<vscale x 2 x i64> %0, i64 %1, i32 %2)
  ret <vscale x 2 x i64> %a
}

declare <vscale x 4 x i64> @llvm.riscv.vmv.s.x.nxv4i64(<vscale x 4 x i64>, i64, i32);

define <vscale x 4 x i64> @intrinsic_vmv.s.x_x_nxv4i64(<vscale x 4 x i64> %0, i64 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv4i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addi sp, sp, -16
; CHECK-NEXT:    sw a1, 12(sp)
; CHECK-NEXT:    sw a0, 8(sp)
; CHECK-NEXT:    vsetvli zero, a2, e64, m4, ta, mu
; CHECK-NEXT:    addi a0, sp, 8
; CHECK-NEXT:    vlse64.v v12, (a0), zero
; CHECK-NEXT:    vid.v v16
; CHECK-NEXT:    vmseq.vi v0, v16, 0
; CHECK-NEXT:    vmerge.vvm v8, v8, v12, v0
; CHECK-NEXT:    addi sp, sp, 16
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x i64> @llvm.riscv.vmv.s.x.nxv4i64(<vscale x 4 x i64> %0, i64 %1, i32 %2)
  ret <vscale x 4 x i64> %a
}

declare <vscale x 8 x i64> @llvm.riscv.vmv.s.x.nxv8i64(<vscale x 8 x i64>, i64, i32);

define <vscale x 8 x i64> @intrinsic_vmv.s.x_x_nxv8i64(<vscale x 8 x i64> %0, i64 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vmv.s.x_x_nxv8i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addi sp, sp, -16
; CHECK-NEXT:    sw a1, 12(sp)
; CHECK-NEXT:    sw a0, 8(sp)
; CHECK-NEXT:    vsetvli zero, a2, e64, m8, ta, mu
; CHECK-NEXT:    addi a0, sp, 8
; CHECK-NEXT:    vlse64.v v16, (a0), zero
; CHECK-NEXT:    vid.v v24
; CHECK-NEXT:    vmseq.vi v0, v24, 0
; CHECK-NEXT:    vmerge.vvm v8, v8, v16, v0
; CHECK-NEXT:    addi sp, sp, 16
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x i64> @llvm.riscv.vmv.s.x.nxv8i64(<vscale x 8 x i64> %0, i64 %1, i32 %2)
  ret <vscale x 8 x i64> %a
}
