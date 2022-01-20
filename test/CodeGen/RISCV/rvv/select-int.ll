; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+experimental-v -verify-machineinstrs < %s \
; RUN:   | FileCheck %s --check-prefixes=CHECK,RV32
; RUN: llc -mtriple=riscv64 -mattr=+experimental-v -verify-machineinstrs < %s \
; RUN:   | FileCheck %s --check-prefixes=CHECK,RV64

define <vscale x 1 x i1> @select_nxv1i1(i1 zeroext %c, <vscale x 1 x i1> %a, <vscale x 1 x i1> %b) {
; CHECK-LABEL: select_nxv1i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, mf8, ta, mu
; CHECK-NEXT:    vmv.v.x v9, a0
; CHECK-NEXT:    vmsne.vi v9, v9, 0
; CHECK-NEXT:    vmandn.mm v8, v8, v9
; CHECK-NEXT:    vmand.mm v9, v0, v9
; CHECK-NEXT:    vmor.mm v0, v9, v8
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 1 x i1> %a, <vscale x 1 x i1> %b
  ret <vscale x 1 x i1> %v
}

define <vscale x 1 x i1> @selectcc_nxv1i1(i1 signext %a, i1 signext %b, <vscale x 1 x i1> %c, <vscale x 1 x i1> %d) {
; CHECK-LABEL: selectcc_nxv1i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    andi a0, a0, 1
; CHECK-NEXT:    vsetvli a1, zero, e8, mf8, ta, mu
; CHECK-NEXT:    vmv.v.x v9, a0
; CHECK-NEXT:    vmsne.vi v9, v9, 0
; CHECK-NEXT:    vmandn.mm v8, v8, v9
; CHECK-NEXT:    vmand.mm v9, v0, v9
; CHECK-NEXT:    vmor.mm v0, v9, v8
; CHECK-NEXT:    ret
  %cmp = icmp ne i1 %a, %b
  %v = select i1 %cmp, <vscale x 1 x i1> %c, <vscale x 1 x i1> %d
  ret <vscale x 1 x i1> %v
}

define <vscale x 2 x i1> @select_nxv2i1(i1 zeroext %c, <vscale x 2 x i1> %a, <vscale x 2 x i1> %b) {
; CHECK-LABEL: select_nxv2i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, mf4, ta, mu
; CHECK-NEXT:    vmv.v.x v9, a0
; CHECK-NEXT:    vmsne.vi v9, v9, 0
; CHECK-NEXT:    vmandn.mm v8, v8, v9
; CHECK-NEXT:    vmand.mm v9, v0, v9
; CHECK-NEXT:    vmor.mm v0, v9, v8
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 2 x i1> %a, <vscale x 2 x i1> %b
  ret <vscale x 2 x i1> %v
}

define <vscale x 2 x i1> @selectcc_nxv2i1(i1 signext %a, i1 signext %b, <vscale x 2 x i1> %c, <vscale x 2 x i1> %d) {
; CHECK-LABEL: selectcc_nxv2i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    andi a0, a0, 1
; CHECK-NEXT:    vsetvli a1, zero, e8, mf4, ta, mu
; CHECK-NEXT:    vmv.v.x v9, a0
; CHECK-NEXT:    vmsne.vi v9, v9, 0
; CHECK-NEXT:    vmandn.mm v8, v8, v9
; CHECK-NEXT:    vmand.mm v9, v0, v9
; CHECK-NEXT:    vmor.mm v0, v9, v8
; CHECK-NEXT:    ret
  %cmp = icmp ne i1 %a, %b
  %v = select i1 %cmp, <vscale x 2 x i1> %c, <vscale x 2 x i1> %d
  ret <vscale x 2 x i1> %v
}

define <vscale x 4 x i1> @select_nxv4i1(i1 zeroext %c, <vscale x 4 x i1> %a, <vscale x 4 x i1> %b) {
; CHECK-LABEL: select_nxv4i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, mf2, ta, mu
; CHECK-NEXT:    vmv.v.x v9, a0
; CHECK-NEXT:    vmsne.vi v9, v9, 0
; CHECK-NEXT:    vmandn.mm v8, v8, v9
; CHECK-NEXT:    vmand.mm v9, v0, v9
; CHECK-NEXT:    vmor.mm v0, v9, v8
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 4 x i1> %a, <vscale x 4 x i1> %b
  ret <vscale x 4 x i1> %v
}

define <vscale x 4 x i1> @selectcc_nxv4i1(i1 signext %a, i1 signext %b, <vscale x 4 x i1> %c, <vscale x 4 x i1> %d) {
; CHECK-LABEL: selectcc_nxv4i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    andi a0, a0, 1
; CHECK-NEXT:    vsetvli a1, zero, e8, mf2, ta, mu
; CHECK-NEXT:    vmv.v.x v9, a0
; CHECK-NEXT:    vmsne.vi v9, v9, 0
; CHECK-NEXT:    vmandn.mm v8, v8, v9
; CHECK-NEXT:    vmand.mm v9, v0, v9
; CHECK-NEXT:    vmor.mm v0, v9, v8
; CHECK-NEXT:    ret
  %cmp = icmp ne i1 %a, %b
  %v = select i1 %cmp, <vscale x 4 x i1> %c, <vscale x 4 x i1> %d
  ret <vscale x 4 x i1> %v
}

define <vscale x 8 x i1> @select_nxv8i1(i1 zeroext %c, <vscale x 8 x i1> %a, <vscale x 8 x i1> %b) {
; CHECK-LABEL: select_nxv8i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, m1, ta, mu
; CHECK-NEXT:    vmv.v.x v9, a0
; CHECK-NEXT:    vmsne.vi v9, v9, 0
; CHECK-NEXT:    vmandn.mm v8, v8, v9
; CHECK-NEXT:    vmand.mm v9, v0, v9
; CHECK-NEXT:    vmor.mm v0, v9, v8
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 8 x i1> %a, <vscale x 8 x i1> %b
  ret <vscale x 8 x i1> %v
}

define <vscale x 8 x i1> @selectcc_nxv8i1(i1 signext %a, i1 signext %b, <vscale x 8 x i1> %c, <vscale x 8 x i1> %d) {
; CHECK-LABEL: selectcc_nxv8i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    andi a0, a0, 1
; CHECK-NEXT:    vsetvli a1, zero, e8, m1, ta, mu
; CHECK-NEXT:    vmv.v.x v9, a0
; CHECK-NEXT:    vmsne.vi v9, v9, 0
; CHECK-NEXT:    vmandn.mm v8, v8, v9
; CHECK-NEXT:    vmand.mm v9, v0, v9
; CHECK-NEXT:    vmor.mm v0, v9, v8
; CHECK-NEXT:    ret
  %cmp = icmp ne i1 %a, %b
  %v = select i1 %cmp, <vscale x 8 x i1> %c, <vscale x 8 x i1> %d
  ret <vscale x 8 x i1> %v
}

define <vscale x 16 x i1> @select_nxv16i1(i1 zeroext %c, <vscale x 16 x i1> %a, <vscale x 16 x i1> %b) {
; CHECK-LABEL: select_nxv16i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, m2, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v9, v10, 0
; CHECK-NEXT:    vmandn.mm v8, v8, v9
; CHECK-NEXT:    vmand.mm v9, v0, v9
; CHECK-NEXT:    vmor.mm v0, v9, v8
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 16 x i1> %a, <vscale x 16 x i1> %b
  ret <vscale x 16 x i1> %v
}

define <vscale x 16 x i1> @selectcc_nxv16i1(i1 signext %a, i1 signext %b, <vscale x 16 x i1> %c, <vscale x 16 x i1> %d) {
; CHECK-LABEL: selectcc_nxv16i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    andi a0, a0, 1
; CHECK-NEXT:    vsetvli a1, zero, e8, m2, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v9, v10, 0
; CHECK-NEXT:    vmandn.mm v8, v8, v9
; CHECK-NEXT:    vmand.mm v9, v0, v9
; CHECK-NEXT:    vmor.mm v0, v9, v8
; CHECK-NEXT:    ret
  %cmp = icmp ne i1 %a, %b
  %v = select i1 %cmp, <vscale x 16 x i1> %c, <vscale x 16 x i1> %d
  ret <vscale x 16 x i1> %v
}

define <vscale x 32 x i1> @select_nxv32i1(i1 zeroext %c, <vscale x 32 x i1> %a, <vscale x 32 x i1> %b) {
; CHECK-LABEL: select_nxv32i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, m4, ta, mu
; CHECK-NEXT:    vmv.v.x v12, a0
; CHECK-NEXT:    vmsne.vi v9, v12, 0
; CHECK-NEXT:    vmandn.mm v8, v8, v9
; CHECK-NEXT:    vmand.mm v9, v0, v9
; CHECK-NEXT:    vmor.mm v0, v9, v8
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 32 x i1> %a, <vscale x 32 x i1> %b
  ret <vscale x 32 x i1> %v
}

define <vscale x 32 x i1> @selectcc_nxv32i1(i1 signext %a, i1 signext %b, <vscale x 32 x i1> %c, <vscale x 32 x i1> %d) {
; CHECK-LABEL: selectcc_nxv32i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    andi a0, a0, 1
; CHECK-NEXT:    vsetvli a1, zero, e8, m4, ta, mu
; CHECK-NEXT:    vmv.v.x v12, a0
; CHECK-NEXT:    vmsne.vi v9, v12, 0
; CHECK-NEXT:    vmandn.mm v8, v8, v9
; CHECK-NEXT:    vmand.mm v9, v0, v9
; CHECK-NEXT:    vmor.mm v0, v9, v8
; CHECK-NEXT:    ret
  %cmp = icmp ne i1 %a, %b
  %v = select i1 %cmp, <vscale x 32 x i1> %c, <vscale x 32 x i1> %d
  ret <vscale x 32 x i1> %v
}

define <vscale x 64 x i1> @select_nxv64i1(i1 zeroext %c, <vscale x 64 x i1> %a, <vscale x 64 x i1> %b) {
; CHECK-LABEL: select_nxv64i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, m8, ta, mu
; CHECK-NEXT:    vmv.v.x v16, a0
; CHECK-NEXT:    vmsne.vi v9, v16, 0
; CHECK-NEXT:    vmandn.mm v8, v8, v9
; CHECK-NEXT:    vmand.mm v9, v0, v9
; CHECK-NEXT:    vmor.mm v0, v9, v8
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 64 x i1> %a, <vscale x 64 x i1> %b
  ret <vscale x 64 x i1> %v
}

define <vscale x 64 x i1> @selectcc_nxv64i1(i1 signext %a, i1 signext %b, <vscale x 64 x i1> %c, <vscale x 64 x i1> %d) {
; CHECK-LABEL: selectcc_nxv64i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    andi a0, a0, 1
; CHECK-NEXT:    vsetvli a1, zero, e8, m8, ta, mu
; CHECK-NEXT:    vmv.v.x v16, a0
; CHECK-NEXT:    vmsne.vi v9, v16, 0
; CHECK-NEXT:    vmandn.mm v8, v8, v9
; CHECK-NEXT:    vmand.mm v9, v0, v9
; CHECK-NEXT:    vmor.mm v0, v9, v8
; CHECK-NEXT:    ret
  %cmp = icmp ne i1 %a, %b
  %v = select i1 %cmp, <vscale x 64 x i1> %c, <vscale x 64 x i1> %d
  ret <vscale x 64 x i1> %v
}

define <vscale x 1 x i8> @select_nxv1i8(i1 zeroext %c, <vscale x 1 x i8> %a, <vscale x 1 x i8> %b) {
; CHECK-LABEL: select_nxv1i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, mf8, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v0, v10, 0
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 1 x i8> %a, <vscale x 1 x i8> %b
  ret <vscale x 1 x i8> %v
}

define <vscale x 1 x i8> @selectcc_nxv1i8(i8 signext %a, i8 signext %b, <vscale x 1 x i8> %c, <vscale x 1 x i8> %d) {
; CHECK-LABEL: selectcc_nxv1i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    snez a0, a0
; CHECK-NEXT:    vsetvli a1, zero, e8, mf8, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v0, v10, 0
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %cmp = icmp ne i8 %a, %b
  %v = select i1 %cmp, <vscale x 1 x i8> %c, <vscale x 1 x i8> %d
  ret <vscale x 1 x i8> %v
}

define <vscale x 2 x i8> @select_nxv2i8(i1 zeroext %c, <vscale x 2 x i8> %a, <vscale x 2 x i8> %b) {
; CHECK-LABEL: select_nxv2i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, mf4, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v0, v10, 0
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 2 x i8> %a, <vscale x 2 x i8> %b
  ret <vscale x 2 x i8> %v
}

define <vscale x 2 x i8> @selectcc_nxv2i8(i8 signext %a, i8 signext %b, <vscale x 2 x i8> %c, <vscale x 2 x i8> %d) {
; CHECK-LABEL: selectcc_nxv2i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    snez a0, a0
; CHECK-NEXT:    vsetvli a1, zero, e8, mf4, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v0, v10, 0
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %cmp = icmp ne i8 %a, %b
  %v = select i1 %cmp, <vscale x 2 x i8> %c, <vscale x 2 x i8> %d
  ret <vscale x 2 x i8> %v
}

define <vscale x 4 x i8> @select_nxv4i8(i1 zeroext %c, <vscale x 4 x i8> %a, <vscale x 4 x i8> %b) {
; CHECK-LABEL: select_nxv4i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, mf2, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v0, v10, 0
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 4 x i8> %a, <vscale x 4 x i8> %b
  ret <vscale x 4 x i8> %v
}

define <vscale x 4 x i8> @selectcc_nxv4i8(i8 signext %a, i8 signext %b, <vscale x 4 x i8> %c, <vscale x 4 x i8> %d) {
; CHECK-LABEL: selectcc_nxv4i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    snez a0, a0
; CHECK-NEXT:    vsetvli a1, zero, e8, mf2, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v0, v10, 0
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %cmp = icmp ne i8 %a, %b
  %v = select i1 %cmp, <vscale x 4 x i8> %c, <vscale x 4 x i8> %d
  ret <vscale x 4 x i8> %v
}

define <vscale x 8 x i8> @select_nxv8i8(i1 zeroext %c, <vscale x 8 x i8> %a, <vscale x 8 x i8> %b) {
; CHECK-LABEL: select_nxv8i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, m1, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v0, v10, 0
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 8 x i8> %a, <vscale x 8 x i8> %b
  ret <vscale x 8 x i8> %v
}

define <vscale x 8 x i8> @selectcc_nxv8i8(i8 signext %a, i8 signext %b, <vscale x 8 x i8> %c, <vscale x 8 x i8> %d) {
; CHECK-LABEL: selectcc_nxv8i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    snez a0, a0
; CHECK-NEXT:    vsetvli a1, zero, e8, m1, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v0, v10, 0
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %cmp = icmp ne i8 %a, %b
  %v = select i1 %cmp, <vscale x 8 x i8> %c, <vscale x 8 x i8> %d
  ret <vscale x 8 x i8> %v
}

define <vscale x 16 x i8> @select_nxv16i8(i1 zeroext %c, <vscale x 16 x i8> %a, <vscale x 16 x i8> %b) {
; CHECK-LABEL: select_nxv16i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, m2, ta, mu
; CHECK-NEXT:    vmv.v.x v12, a0
; CHECK-NEXT:    vmsne.vi v0, v12, 0
; CHECK-NEXT:    vmerge.vvm v8, v10, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 16 x i8> %a, <vscale x 16 x i8> %b
  ret <vscale x 16 x i8> %v
}

define <vscale x 16 x i8> @selectcc_nxv16i8(i8 signext %a, i8 signext %b, <vscale x 16 x i8> %c, <vscale x 16 x i8> %d) {
; CHECK-LABEL: selectcc_nxv16i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    snez a0, a0
; CHECK-NEXT:    vsetvli a1, zero, e8, m2, ta, mu
; CHECK-NEXT:    vmv.v.x v12, a0
; CHECK-NEXT:    vmsne.vi v0, v12, 0
; CHECK-NEXT:    vmerge.vvm v8, v10, v8, v0
; CHECK-NEXT:    ret
  %cmp = icmp ne i8 %a, %b
  %v = select i1 %cmp, <vscale x 16 x i8> %c, <vscale x 16 x i8> %d
  ret <vscale x 16 x i8> %v
}

define <vscale x 32 x i8> @select_nxv32i8(i1 zeroext %c, <vscale x 32 x i8> %a, <vscale x 32 x i8> %b) {
; CHECK-LABEL: select_nxv32i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, m4, ta, mu
; CHECK-NEXT:    vmv.v.x v16, a0
; CHECK-NEXT:    vmsne.vi v0, v16, 0
; CHECK-NEXT:    vmerge.vvm v8, v12, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 32 x i8> %a, <vscale x 32 x i8> %b
  ret <vscale x 32 x i8> %v
}

define <vscale x 32 x i8> @selectcc_nxv32i8(i8 signext %a, i8 signext %b, <vscale x 32 x i8> %c, <vscale x 32 x i8> %d) {
; CHECK-LABEL: selectcc_nxv32i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    snez a0, a0
; CHECK-NEXT:    vsetvli a1, zero, e8, m4, ta, mu
; CHECK-NEXT:    vmv.v.x v16, a0
; CHECK-NEXT:    vmsne.vi v0, v16, 0
; CHECK-NEXT:    vmerge.vvm v8, v12, v8, v0
; CHECK-NEXT:    ret
  %cmp = icmp ne i8 %a, %b
  %v = select i1 %cmp, <vscale x 32 x i8> %c, <vscale x 32 x i8> %d
  ret <vscale x 32 x i8> %v
}

define <vscale x 64 x i8> @select_nxv64i8(i1 zeroext %c, <vscale x 64 x i8> %a, <vscale x 64 x i8> %b) {
; CHECK-LABEL: select_nxv64i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, m8, ta, mu
; CHECK-NEXT:    vmv.v.x v24, a0
; CHECK-NEXT:    vmsne.vi v0, v24, 0
; CHECK-NEXT:    vmerge.vvm v8, v16, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 64 x i8> %a, <vscale x 64 x i8> %b
  ret <vscale x 64 x i8> %v
}

define <vscale x 64 x i8> @selectcc_nxv64i8(i8 signext %a, i8 signext %b, <vscale x 64 x i8> %c, <vscale x 64 x i8> %d) {
; CHECK-LABEL: selectcc_nxv64i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    snez a0, a0
; CHECK-NEXT:    vsetvli a1, zero, e8, m8, ta, mu
; CHECK-NEXT:    vmv.v.x v24, a0
; CHECK-NEXT:    vmsne.vi v0, v24, 0
; CHECK-NEXT:    vmerge.vvm v8, v16, v8, v0
; CHECK-NEXT:    ret
  %cmp = icmp ne i8 %a, %b
  %v = select i1 %cmp, <vscale x 64 x i8> %c, <vscale x 64 x i8> %d
  ret <vscale x 64 x i8> %v
}

define <vscale x 1 x i16> @select_nxv1i16(i1 zeroext %c, <vscale x 1 x i16> %a, <vscale x 1 x i16> %b) {
; CHECK-LABEL: select_nxv1i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, mf8, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v0, v10, 0
; CHECK-NEXT:    vsetvli zero, zero, e16, mf4, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 1 x i16> %a, <vscale x 1 x i16> %b
  ret <vscale x 1 x i16> %v
}

define <vscale x 1 x i16> @selectcc_nxv1i16(i16 signext %a, i16 signext %b, <vscale x 1 x i16> %c, <vscale x 1 x i16> %d) {
; CHECK-LABEL: selectcc_nxv1i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    snez a0, a0
; CHECK-NEXT:    vsetvli a1, zero, e8, mf8, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v0, v10, 0
; CHECK-NEXT:    vsetvli zero, zero, e16, mf4, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %cmp = icmp ne i16 %a, %b
  %v = select i1 %cmp, <vscale x 1 x i16> %c, <vscale x 1 x i16> %d
  ret <vscale x 1 x i16> %v
}

define <vscale x 2 x i16> @select_nxv2i16(i1 zeroext %c, <vscale x 2 x i16> %a, <vscale x 2 x i16> %b) {
; CHECK-LABEL: select_nxv2i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, mf4, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v0, v10, 0
; CHECK-NEXT:    vsetvli zero, zero, e16, mf2, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 2 x i16> %a, <vscale x 2 x i16> %b
  ret <vscale x 2 x i16> %v
}

define <vscale x 2 x i16> @selectcc_nxv2i16(i16 signext %a, i16 signext %b, <vscale x 2 x i16> %c, <vscale x 2 x i16> %d) {
; CHECK-LABEL: selectcc_nxv2i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    snez a0, a0
; CHECK-NEXT:    vsetvli a1, zero, e8, mf4, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v0, v10, 0
; CHECK-NEXT:    vsetvli zero, zero, e16, mf2, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %cmp = icmp ne i16 %a, %b
  %v = select i1 %cmp, <vscale x 2 x i16> %c, <vscale x 2 x i16> %d
  ret <vscale x 2 x i16> %v
}

define <vscale x 4 x i16> @select_nxv4i16(i1 zeroext %c, <vscale x 4 x i16> %a, <vscale x 4 x i16> %b) {
; CHECK-LABEL: select_nxv4i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, mf2, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v0, v10, 0
; CHECK-NEXT:    vsetvli zero, zero, e16, m1, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 4 x i16> %a, <vscale x 4 x i16> %b
  ret <vscale x 4 x i16> %v
}

define <vscale x 4 x i16> @selectcc_nxv4i16(i16 signext %a, i16 signext %b, <vscale x 4 x i16> %c, <vscale x 4 x i16> %d) {
; CHECK-LABEL: selectcc_nxv4i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    snez a0, a0
; CHECK-NEXT:    vsetvli a1, zero, e8, mf2, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v0, v10, 0
; CHECK-NEXT:    vsetvli zero, zero, e16, m1, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %cmp = icmp ne i16 %a, %b
  %v = select i1 %cmp, <vscale x 4 x i16> %c, <vscale x 4 x i16> %d
  ret <vscale x 4 x i16> %v
}

define <vscale x 8 x i16> @select_nxv8i16(i1 zeroext %c, <vscale x 8 x i16> %a, <vscale x 8 x i16> %b) {
; CHECK-LABEL: select_nxv8i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, m1, ta, mu
; CHECK-NEXT:    vmv.v.x v12, a0
; CHECK-NEXT:    vmsne.vi v0, v12, 0
; CHECK-NEXT:    vsetvli zero, zero, e16, m2, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v10, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 8 x i16> %a, <vscale x 8 x i16> %b
  ret <vscale x 8 x i16> %v
}

define <vscale x 8 x i16> @selectcc_nxv8i16(i16 signext %a, i16 signext %b, <vscale x 8 x i16> %c, <vscale x 8 x i16> %d) {
; CHECK-LABEL: selectcc_nxv8i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    snez a0, a0
; CHECK-NEXT:    vsetvli a1, zero, e8, m1, ta, mu
; CHECK-NEXT:    vmv.v.x v12, a0
; CHECK-NEXT:    vmsne.vi v0, v12, 0
; CHECK-NEXT:    vsetvli zero, zero, e16, m2, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v10, v8, v0
; CHECK-NEXT:    ret
  %cmp = icmp ne i16 %a, %b
  %v = select i1 %cmp, <vscale x 8 x i16> %c, <vscale x 8 x i16> %d
  ret <vscale x 8 x i16> %v
}

define <vscale x 16 x i16> @select_nxv16i16(i1 zeroext %c, <vscale x 16 x i16> %a, <vscale x 16 x i16> %b) {
; CHECK-LABEL: select_nxv16i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, m2, ta, mu
; CHECK-NEXT:    vmv.v.x v16, a0
; CHECK-NEXT:    vmsne.vi v0, v16, 0
; CHECK-NEXT:    vsetvli zero, zero, e16, m4, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v12, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 16 x i16> %a, <vscale x 16 x i16> %b
  ret <vscale x 16 x i16> %v
}

define <vscale x 16 x i16> @selectcc_nxv16i16(i16 signext %a, i16 signext %b, <vscale x 16 x i16> %c, <vscale x 16 x i16> %d) {
; CHECK-LABEL: selectcc_nxv16i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    snez a0, a0
; CHECK-NEXT:    vsetvli a1, zero, e8, m2, ta, mu
; CHECK-NEXT:    vmv.v.x v16, a0
; CHECK-NEXT:    vmsne.vi v0, v16, 0
; CHECK-NEXT:    vsetvli zero, zero, e16, m4, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v12, v8, v0
; CHECK-NEXT:    ret
  %cmp = icmp ne i16 %a, %b
  %v = select i1 %cmp, <vscale x 16 x i16> %c, <vscale x 16 x i16> %d
  ret <vscale x 16 x i16> %v
}

define <vscale x 32 x i16> @select_nxv32i16(i1 zeroext %c, <vscale x 32 x i16> %a, <vscale x 32 x i16> %b) {
; CHECK-LABEL: select_nxv32i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, m4, ta, mu
; CHECK-NEXT:    vmv.v.x v24, a0
; CHECK-NEXT:    vmsne.vi v0, v24, 0
; CHECK-NEXT:    vsetvli zero, zero, e16, m8, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v16, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 32 x i16> %a, <vscale x 32 x i16> %b
  ret <vscale x 32 x i16> %v
}

define <vscale x 32 x i16> @selectcc_nxv32i16(i16 signext %a, i16 signext %b, <vscale x 32 x i16> %c, <vscale x 32 x i16> %d) {
; CHECK-LABEL: selectcc_nxv32i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    snez a0, a0
; CHECK-NEXT:    vsetvli a1, zero, e8, m4, ta, mu
; CHECK-NEXT:    vmv.v.x v24, a0
; CHECK-NEXT:    vmsne.vi v0, v24, 0
; CHECK-NEXT:    vsetvli zero, zero, e16, m8, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v16, v8, v0
; CHECK-NEXT:    ret
  %cmp = icmp ne i16 %a, %b
  %v = select i1 %cmp, <vscale x 32 x i16> %c, <vscale x 32 x i16> %d
  ret <vscale x 32 x i16> %v
}

define <vscale x 1 x i32> @select_nxv1i32(i1 zeroext %c, <vscale x 1 x i32> %a, <vscale x 1 x i32> %b) {
; CHECK-LABEL: select_nxv1i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, mf8, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v0, v10, 0
; CHECK-NEXT:    vsetvli zero, zero, e32, mf2, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 1 x i32> %a, <vscale x 1 x i32> %b
  ret <vscale x 1 x i32> %v
}

define <vscale x 1 x i32> @selectcc_nxv1i32(i32 signext %a, i32 signext %b, <vscale x 1 x i32> %c, <vscale x 1 x i32> %d) {
; CHECK-LABEL: selectcc_nxv1i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    snez a0, a0
; CHECK-NEXT:    vsetvli a1, zero, e8, mf8, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v0, v10, 0
; CHECK-NEXT:    vsetvli zero, zero, e32, mf2, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %cmp = icmp ne i32 %a, %b
  %v = select i1 %cmp, <vscale x 1 x i32> %c, <vscale x 1 x i32> %d
  ret <vscale x 1 x i32> %v
}

define <vscale x 2 x i32> @select_nxv2i32(i1 zeroext %c, <vscale x 2 x i32> %a, <vscale x 2 x i32> %b) {
; CHECK-LABEL: select_nxv2i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, mf4, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v0, v10, 0
; CHECK-NEXT:    vsetvli zero, zero, e32, m1, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 2 x i32> %a, <vscale x 2 x i32> %b
  ret <vscale x 2 x i32> %v
}

define <vscale x 2 x i32> @selectcc_nxv2i32(i32 signext %a, i32 signext %b, <vscale x 2 x i32> %c, <vscale x 2 x i32> %d) {
; CHECK-LABEL: selectcc_nxv2i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    snez a0, a0
; CHECK-NEXT:    vsetvli a1, zero, e8, mf4, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v0, v10, 0
; CHECK-NEXT:    vsetvli zero, zero, e32, m1, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %cmp = icmp ne i32 %a, %b
  %v = select i1 %cmp, <vscale x 2 x i32> %c, <vscale x 2 x i32> %d
  ret <vscale x 2 x i32> %v
}

define <vscale x 4 x i32> @select_nxv4i32(i1 zeroext %c, <vscale x 4 x i32> %a, <vscale x 4 x i32> %b) {
; CHECK-LABEL: select_nxv4i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, mf2, ta, mu
; CHECK-NEXT:    vmv.v.x v12, a0
; CHECK-NEXT:    vmsne.vi v0, v12, 0
; CHECK-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v10, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 4 x i32> %a, <vscale x 4 x i32> %b
  ret <vscale x 4 x i32> %v
}

define <vscale x 4 x i32> @selectcc_nxv4i32(i32 signext %a, i32 signext %b, <vscale x 4 x i32> %c, <vscale x 4 x i32> %d) {
; CHECK-LABEL: selectcc_nxv4i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    snez a0, a0
; CHECK-NEXT:    vsetvli a1, zero, e8, mf2, ta, mu
; CHECK-NEXT:    vmv.v.x v12, a0
; CHECK-NEXT:    vmsne.vi v0, v12, 0
; CHECK-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v10, v8, v0
; CHECK-NEXT:    ret
  %cmp = icmp ne i32 %a, %b
  %v = select i1 %cmp, <vscale x 4 x i32> %c, <vscale x 4 x i32> %d
  ret <vscale x 4 x i32> %v
}

define <vscale x 8 x i32> @select_nxv8i32(i1 zeroext %c, <vscale x 8 x i32> %a, <vscale x 8 x i32> %b) {
; CHECK-LABEL: select_nxv8i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, m1, ta, mu
; CHECK-NEXT:    vmv.v.x v16, a0
; CHECK-NEXT:    vmsne.vi v0, v16, 0
; CHECK-NEXT:    vsetvli zero, zero, e32, m4, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v12, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 8 x i32> %a, <vscale x 8 x i32> %b
  ret <vscale x 8 x i32> %v
}

define <vscale x 8 x i32> @selectcc_nxv8i32(i32 signext %a, i32 signext %b, <vscale x 8 x i32> %c, <vscale x 8 x i32> %d) {
; CHECK-LABEL: selectcc_nxv8i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    snez a0, a0
; CHECK-NEXT:    vsetvli a1, zero, e8, m1, ta, mu
; CHECK-NEXT:    vmv.v.x v16, a0
; CHECK-NEXT:    vmsne.vi v0, v16, 0
; CHECK-NEXT:    vsetvli zero, zero, e32, m4, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v12, v8, v0
; CHECK-NEXT:    ret
  %cmp = icmp ne i32 %a, %b
  %v = select i1 %cmp, <vscale x 8 x i32> %c, <vscale x 8 x i32> %d
  ret <vscale x 8 x i32> %v
}

define <vscale x 16 x i32> @select_nxv16i32(i1 zeroext %c, <vscale x 16 x i32> %a, <vscale x 16 x i32> %b) {
; CHECK-LABEL: select_nxv16i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, m2, ta, mu
; CHECK-NEXT:    vmv.v.x v24, a0
; CHECK-NEXT:    vmsne.vi v0, v24, 0
; CHECK-NEXT:    vsetvli zero, zero, e32, m8, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v16, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 16 x i32> %a, <vscale x 16 x i32> %b
  ret <vscale x 16 x i32> %v
}

define <vscale x 16 x i32> @selectcc_nxv16i32(i32 signext %a, i32 signext %b, <vscale x 16 x i32> %c, <vscale x 16 x i32> %d) {
; CHECK-LABEL: selectcc_nxv16i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xor a0, a0, a1
; CHECK-NEXT:    snez a0, a0
; CHECK-NEXT:    vsetvli a1, zero, e8, m2, ta, mu
; CHECK-NEXT:    vmv.v.x v24, a0
; CHECK-NEXT:    vmsne.vi v0, v24, 0
; CHECK-NEXT:    vsetvli zero, zero, e32, m8, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v16, v8, v0
; CHECK-NEXT:    ret
  %cmp = icmp ne i32 %a, %b
  %v = select i1 %cmp, <vscale x 16 x i32> %c, <vscale x 16 x i32> %d
  ret <vscale x 16 x i32> %v
}

define <vscale x 1 x i64> @select_nxv1i64(i1 zeroext %c, <vscale x 1 x i64> %a, <vscale x 1 x i64> %b) {
; CHECK-LABEL: select_nxv1i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, mf8, ta, mu
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    vmsne.vi v0, v10, 0
; CHECK-NEXT:    vsetvli zero, zero, e64, m1, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 1 x i64> %a, <vscale x 1 x i64> %b
  ret <vscale x 1 x i64> %v
}

define <vscale x 1 x i64> @selectcc_nxv1i64(i64 signext %a, i64 signext %b, <vscale x 1 x i64> %c, <vscale x 1 x i64> %d) {
; RV32-LABEL: selectcc_nxv1i64:
; RV32:       # %bb.0:
; RV32-NEXT:    xor a1, a1, a3
; RV32-NEXT:    xor a0, a0, a2
; RV32-NEXT:    or a0, a0, a1
; RV32-NEXT:    snez a0, a0
; RV32-NEXT:    vsetvli a1, zero, e8, mf8, ta, mu
; RV32-NEXT:    vmv.v.x v10, a0
; RV32-NEXT:    vmsne.vi v0, v10, 0
; RV32-NEXT:    vsetvli zero, zero, e64, m1, ta, mu
; RV32-NEXT:    vmerge.vvm v8, v9, v8, v0
; RV32-NEXT:    ret
;
; RV64-LABEL: selectcc_nxv1i64:
; RV64:       # %bb.0:
; RV64-NEXT:    xor a0, a0, a1
; RV64-NEXT:    snez a0, a0
; RV64-NEXT:    vsetvli a1, zero, e8, mf8, ta, mu
; RV64-NEXT:    vmv.v.x v10, a0
; RV64-NEXT:    vmsne.vi v0, v10, 0
; RV64-NEXT:    vsetvli zero, zero, e64, m1, ta, mu
; RV64-NEXT:    vmerge.vvm v8, v9, v8, v0
; RV64-NEXT:    ret
  %cmp = icmp ne i64 %a, %b
  %v = select i1 %cmp, <vscale x 1 x i64> %c, <vscale x 1 x i64> %d
  ret <vscale x 1 x i64> %v
}

define <vscale x 2 x i64> @select_nxv2i64(i1 zeroext %c, <vscale x 2 x i64> %a, <vscale x 2 x i64> %b) {
; CHECK-LABEL: select_nxv2i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, mf4, ta, mu
; CHECK-NEXT:    vmv.v.x v12, a0
; CHECK-NEXT:    vmsne.vi v0, v12, 0
; CHECK-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v10, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 2 x i64> %a, <vscale x 2 x i64> %b
  ret <vscale x 2 x i64> %v
}

define <vscale x 2 x i64> @selectcc_nxv2i64(i64 signext %a, i64 signext %b, <vscale x 2 x i64> %c, <vscale x 2 x i64> %d) {
; RV32-LABEL: selectcc_nxv2i64:
; RV32:       # %bb.0:
; RV32-NEXT:    xor a1, a1, a3
; RV32-NEXT:    xor a0, a0, a2
; RV32-NEXT:    or a0, a0, a1
; RV32-NEXT:    snez a0, a0
; RV32-NEXT:    vsetvli a1, zero, e8, mf4, ta, mu
; RV32-NEXT:    vmv.v.x v12, a0
; RV32-NEXT:    vmsne.vi v0, v12, 0
; RV32-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; RV32-NEXT:    vmerge.vvm v8, v10, v8, v0
; RV32-NEXT:    ret
;
; RV64-LABEL: selectcc_nxv2i64:
; RV64:       # %bb.0:
; RV64-NEXT:    xor a0, a0, a1
; RV64-NEXT:    snez a0, a0
; RV64-NEXT:    vsetvli a1, zero, e8, mf4, ta, mu
; RV64-NEXT:    vmv.v.x v12, a0
; RV64-NEXT:    vmsne.vi v0, v12, 0
; RV64-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; RV64-NEXT:    vmerge.vvm v8, v10, v8, v0
; RV64-NEXT:    ret
  %cmp = icmp ne i64 %a, %b
  %v = select i1 %cmp, <vscale x 2 x i64> %c, <vscale x 2 x i64> %d
  ret <vscale x 2 x i64> %v
}

define <vscale x 4 x i64> @select_nxv4i64(i1 zeroext %c, <vscale x 4 x i64> %a, <vscale x 4 x i64> %b) {
; CHECK-LABEL: select_nxv4i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, mf2, ta, mu
; CHECK-NEXT:    vmv.v.x v16, a0
; CHECK-NEXT:    vmsne.vi v0, v16, 0
; CHECK-NEXT:    vsetvli zero, zero, e64, m4, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v12, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 4 x i64> %a, <vscale x 4 x i64> %b
  ret <vscale x 4 x i64> %v
}

define <vscale x 4 x i64> @selectcc_nxv4i64(i64 signext %a, i64 signext %b, <vscale x 4 x i64> %c, <vscale x 4 x i64> %d) {
; RV32-LABEL: selectcc_nxv4i64:
; RV32:       # %bb.0:
; RV32-NEXT:    xor a1, a1, a3
; RV32-NEXT:    xor a0, a0, a2
; RV32-NEXT:    or a0, a0, a1
; RV32-NEXT:    snez a0, a0
; RV32-NEXT:    vsetvli a1, zero, e8, mf2, ta, mu
; RV32-NEXT:    vmv.v.x v16, a0
; RV32-NEXT:    vmsne.vi v0, v16, 0
; RV32-NEXT:    vsetvli zero, zero, e64, m4, ta, mu
; RV32-NEXT:    vmerge.vvm v8, v12, v8, v0
; RV32-NEXT:    ret
;
; RV64-LABEL: selectcc_nxv4i64:
; RV64:       # %bb.0:
; RV64-NEXT:    xor a0, a0, a1
; RV64-NEXT:    snez a0, a0
; RV64-NEXT:    vsetvli a1, zero, e8, mf2, ta, mu
; RV64-NEXT:    vmv.v.x v16, a0
; RV64-NEXT:    vmsne.vi v0, v16, 0
; RV64-NEXT:    vsetvli zero, zero, e64, m4, ta, mu
; RV64-NEXT:    vmerge.vvm v8, v12, v8, v0
; RV64-NEXT:    ret
  %cmp = icmp ne i64 %a, %b
  %v = select i1 %cmp, <vscale x 4 x i64> %c, <vscale x 4 x i64> %d
  ret <vscale x 4 x i64> %v
}

define <vscale x 8 x i64> @select_nxv8i64(i1 zeroext %c, <vscale x 8 x i64> %a, <vscale x 8 x i64> %b) {
; CHECK-LABEL: select_nxv8i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, m1, ta, mu
; CHECK-NEXT:    vmv.v.x v24, a0
; CHECK-NEXT:    vmsne.vi v0, v24, 0
; CHECK-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v16, v8, v0
; CHECK-NEXT:    ret
  %v = select i1 %c, <vscale x 8 x i64> %a, <vscale x 8 x i64> %b
  ret <vscale x 8 x i64> %v
}

define <vscale x 8 x i64> @selectcc_nxv8i64(i64 signext %a, i64 signext %b, <vscale x 8 x i64> %c, <vscale x 8 x i64> %d) {
; RV32-LABEL: selectcc_nxv8i64:
; RV32:       # %bb.0:
; RV32-NEXT:    xor a1, a1, a3
; RV32-NEXT:    xor a0, a0, a2
; RV32-NEXT:    or a0, a0, a1
; RV32-NEXT:    snez a0, a0
; RV32-NEXT:    vsetvli a1, zero, e8, m1, ta, mu
; RV32-NEXT:    vmv.v.x v24, a0
; RV32-NEXT:    vmsne.vi v0, v24, 0
; RV32-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; RV32-NEXT:    vmerge.vvm v8, v16, v8, v0
; RV32-NEXT:    ret
;
; RV64-LABEL: selectcc_nxv8i64:
; RV64:       # %bb.0:
; RV64-NEXT:    xor a0, a0, a1
; RV64-NEXT:    snez a0, a0
; RV64-NEXT:    vsetvli a1, zero, e8, m1, ta, mu
; RV64-NEXT:    vmv.v.x v24, a0
; RV64-NEXT:    vmsne.vi v0, v24, 0
; RV64-NEXT:    vsetvli zero, zero, e64, m8, ta, mu
; RV64-NEXT:    vmerge.vvm v8, v16, v8, v0
; RV64-NEXT:    ret
  %cmp = icmp ne i64 %a, %b
  %v = select i1 %cmp, <vscale x 8 x i64> %c, <vscale x 8 x i64> %d
  ret <vscale x 8 x i64> %v
}
