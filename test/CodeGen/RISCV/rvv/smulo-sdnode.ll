; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv64 -mattr=+experimental-v -verify-machineinstrs < %s | FileCheck %s

declare { <vscale x 1 x i8>, <vscale x 1 x i1> } @llvm.smul.with.overflow.nxv1i8(<vscale x 1 x i8>, <vscale x 1 x i8>)

define <vscale x 1 x i8> @smulo_nxv1i8(<vscale x 1 x i8> %x, <vscale x 1 x i8> %y) {
; CHECK-LABEL: smulo_nxv1i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e8, mf8, ta, mu
; CHECK-NEXT:    vmulh.vv v10, v8, v9
; CHECK-NEXT:    vmul.vv v8, v8, v9
; CHECK-NEXT:    vsra.vi v9, v8, 7
; CHECK-NEXT:    vmsne.vv v0, v10, v9
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 1 x i8>, <vscale x 1 x i1> } @llvm.smul.with.overflow.nxv1i8(<vscale x 1 x i8> %x, <vscale x 1 x i8> %y)
  %b = extractvalue { <vscale x 1 x i8>, <vscale x 1 x i1> } %a, 0
  %c = extractvalue { <vscale x 1 x i8>, <vscale x 1 x i1> } %a, 1
  %d = select <vscale x 1 x i1> %c, <vscale x 1 x i8> zeroinitializer, <vscale x 1 x i8> %b
  ret <vscale x 1 x i8> %d
}

declare { <vscale x 2 x i8>, <vscale x 2 x i1> } @llvm.smul.with.overflow.nxv2i8(<vscale x 2 x i8>, <vscale x 2 x i8>)

define <vscale x 2 x i8> @smulo_nxv2i8(<vscale x 2 x i8> %x, <vscale x 2 x i8> %y) {
; CHECK-LABEL: smulo_nxv2i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e8, mf4, ta, mu
; CHECK-NEXT:    vmulh.vv v10, v8, v9
; CHECK-NEXT:    vmul.vv v8, v8, v9
; CHECK-NEXT:    vsra.vi v9, v8, 7
; CHECK-NEXT:    vmsne.vv v0, v10, v9
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 2 x i8>, <vscale x 2 x i1> } @llvm.smul.with.overflow.nxv2i8(<vscale x 2 x i8> %x, <vscale x 2 x i8> %y)
  %b = extractvalue { <vscale x 2 x i8>, <vscale x 2 x i1> } %a, 0
  %c = extractvalue { <vscale x 2 x i8>, <vscale x 2 x i1> } %a, 1
  %d = select <vscale x 2 x i1> %c, <vscale x 2 x i8> zeroinitializer, <vscale x 2 x i8> %b
  ret <vscale x 2 x i8> %d
}

declare { <vscale x 4 x i8>, <vscale x 4 x i1> } @llvm.smul.with.overflow.nxv4i8(<vscale x 4 x i8>, <vscale x 4 x i8>)

define <vscale x 4 x i8> @smulo_nxv4i8(<vscale x 4 x i8> %x, <vscale x 4 x i8> %y) {
; CHECK-LABEL: smulo_nxv4i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e8, mf2, ta, mu
; CHECK-NEXT:    vmulh.vv v10, v8, v9
; CHECK-NEXT:    vmul.vv v8, v8, v9
; CHECK-NEXT:    vsra.vi v9, v8, 7
; CHECK-NEXT:    vmsne.vv v0, v10, v9
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 4 x i8>, <vscale x 4 x i1> } @llvm.smul.with.overflow.nxv4i8(<vscale x 4 x i8> %x, <vscale x 4 x i8> %y)
  %b = extractvalue { <vscale x 4 x i8>, <vscale x 4 x i1> } %a, 0
  %c = extractvalue { <vscale x 4 x i8>, <vscale x 4 x i1> } %a, 1
  %d = select <vscale x 4 x i1> %c, <vscale x 4 x i8> zeroinitializer, <vscale x 4 x i8> %b
  ret <vscale x 4 x i8> %d
}

declare { <vscale x 8 x i8>, <vscale x 8 x i1> } @llvm.smul.with.overflow.nxv8i8(<vscale x 8 x i8>, <vscale x 8 x i8>)

define <vscale x 8 x i8> @smulo_nxv8i8(<vscale x 8 x i8> %x, <vscale x 8 x i8> %y) {
; CHECK-LABEL: smulo_nxv8i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e8, m1, ta, mu
; CHECK-NEXT:    vmulh.vv v10, v8, v9
; CHECK-NEXT:    vmul.vv v8, v8, v9
; CHECK-NEXT:    vsra.vi v9, v8, 7
; CHECK-NEXT:    vmsne.vv v0, v10, v9
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 8 x i8>, <vscale x 8 x i1> } @llvm.smul.with.overflow.nxv8i8(<vscale x 8 x i8> %x, <vscale x 8 x i8> %y)
  %b = extractvalue { <vscale x 8 x i8>, <vscale x 8 x i1> } %a, 0
  %c = extractvalue { <vscale x 8 x i8>, <vscale x 8 x i1> } %a, 1
  %d = select <vscale x 8 x i1> %c, <vscale x 8 x i8> zeroinitializer, <vscale x 8 x i8> %b
  ret <vscale x 8 x i8> %d
}

declare { <vscale x 16 x i8>, <vscale x 16 x i1> } @llvm.smul.with.overflow.nxv16i8(<vscale x 16 x i8>, <vscale x 16 x i8>)

define <vscale x 16 x i8> @smulo_nxv16i8(<vscale x 16 x i8> %x, <vscale x 16 x i8> %y) {
; CHECK-LABEL: smulo_nxv16i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e8, m2, ta, mu
; CHECK-NEXT:    vmulh.vv v12, v8, v10
; CHECK-NEXT:    vmul.vv v8, v8, v10
; CHECK-NEXT:    vsra.vi v10, v8, 7
; CHECK-NEXT:    vmsne.vv v0, v12, v10
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 16 x i8>, <vscale x 16 x i1> } @llvm.smul.with.overflow.nxv16i8(<vscale x 16 x i8> %x, <vscale x 16 x i8> %y)
  %b = extractvalue { <vscale x 16 x i8>, <vscale x 16 x i1> } %a, 0
  %c = extractvalue { <vscale x 16 x i8>, <vscale x 16 x i1> } %a, 1
  %d = select <vscale x 16 x i1> %c, <vscale x 16 x i8> zeroinitializer, <vscale x 16 x i8> %b
  ret <vscale x 16 x i8> %d
}

declare { <vscale x 32 x i8>, <vscale x 32 x i1> } @llvm.smul.with.overflow.nxv32i8(<vscale x 32 x i8>, <vscale x 32 x i8>)

define <vscale x 32 x i8> @smulo_nxv32i8(<vscale x 32 x i8> %x, <vscale x 32 x i8> %y) {
; CHECK-LABEL: smulo_nxv32i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e8, m4, ta, mu
; CHECK-NEXT:    vmulh.vv v16, v8, v12
; CHECK-NEXT:    vmul.vv v8, v8, v12
; CHECK-NEXT:    vsra.vi v12, v8, 7
; CHECK-NEXT:    vmsne.vv v0, v16, v12
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 32 x i8>, <vscale x 32 x i1> } @llvm.smul.with.overflow.nxv32i8(<vscale x 32 x i8> %x, <vscale x 32 x i8> %y)
  %b = extractvalue { <vscale x 32 x i8>, <vscale x 32 x i1> } %a, 0
  %c = extractvalue { <vscale x 32 x i8>, <vscale x 32 x i1> } %a, 1
  %d = select <vscale x 32 x i1> %c, <vscale x 32 x i8> zeroinitializer, <vscale x 32 x i8> %b
  ret <vscale x 32 x i8> %d
}

declare { <vscale x 64 x i8>, <vscale x 64 x i1> } @llvm.smul.with.overflow.nxv64i8(<vscale x 64 x i8>, <vscale x 64 x i8>)

define <vscale x 64 x i8> @smulo_nxv64i8(<vscale x 64 x i8> %x, <vscale x 64 x i8> %y) {
; CHECK-LABEL: smulo_nxv64i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e8, m8, ta, mu
; CHECK-NEXT:    vmulh.vv v24, v8, v16
; CHECK-NEXT:    vmul.vv v8, v8, v16
; CHECK-NEXT:    vsra.vi v16, v8, 7
; CHECK-NEXT:    vmsne.vv v0, v24, v16
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 64 x i8>, <vscale x 64 x i1> } @llvm.smul.with.overflow.nxv64i8(<vscale x 64 x i8> %x, <vscale x 64 x i8> %y)
  %b = extractvalue { <vscale x 64 x i8>, <vscale x 64 x i1> } %a, 0
  %c = extractvalue { <vscale x 64 x i8>, <vscale x 64 x i1> } %a, 1
  %d = select <vscale x 64 x i1> %c, <vscale x 64 x i8> zeroinitializer, <vscale x 64 x i8> %b
  ret <vscale x 64 x i8> %d
}

declare { <vscale x 1 x i16>, <vscale x 1 x i1> } @llvm.smul.with.overflow.nxv1i16(<vscale x 1 x i16>, <vscale x 1 x i16>)

define <vscale x 1 x i16> @smulo_nxv1i16(<vscale x 1 x i16> %x, <vscale x 1 x i16> %y) {
; CHECK-LABEL: smulo_nxv1i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e16, mf4, ta, mu
; CHECK-NEXT:    vmulh.vv v10, v8, v9
; CHECK-NEXT:    vmul.vv v8, v8, v9
; CHECK-NEXT:    vsra.vi v9, v8, 15
; CHECK-NEXT:    vmsne.vv v0, v10, v9
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 1 x i16>, <vscale x 1 x i1> } @llvm.smul.with.overflow.nxv1i16(<vscale x 1 x i16> %x, <vscale x 1 x i16> %y)
  %b = extractvalue { <vscale x 1 x i16>, <vscale x 1 x i1> } %a, 0
  %c = extractvalue { <vscale x 1 x i16>, <vscale x 1 x i1> } %a, 1
  %d = select <vscale x 1 x i1> %c, <vscale x 1 x i16> zeroinitializer, <vscale x 1 x i16> %b
  ret <vscale x 1 x i16> %d
}

declare { <vscale x 2 x i16>, <vscale x 2 x i1> } @llvm.smul.with.overflow.nxv2i16(<vscale x 2 x i16>, <vscale x 2 x i16>)

define <vscale x 2 x i16> @smulo_nxv2i16(<vscale x 2 x i16> %x, <vscale x 2 x i16> %y) {
; CHECK-LABEL: smulo_nxv2i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e16, mf2, ta, mu
; CHECK-NEXT:    vmulh.vv v10, v8, v9
; CHECK-NEXT:    vmul.vv v8, v8, v9
; CHECK-NEXT:    vsra.vi v9, v8, 15
; CHECK-NEXT:    vmsne.vv v0, v10, v9
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 2 x i16>, <vscale x 2 x i1> } @llvm.smul.with.overflow.nxv2i16(<vscale x 2 x i16> %x, <vscale x 2 x i16> %y)
  %b = extractvalue { <vscale x 2 x i16>, <vscale x 2 x i1> } %a, 0
  %c = extractvalue { <vscale x 2 x i16>, <vscale x 2 x i1> } %a, 1
  %d = select <vscale x 2 x i1> %c, <vscale x 2 x i16> zeroinitializer, <vscale x 2 x i16> %b
  ret <vscale x 2 x i16> %d
}

declare { <vscale x 4 x i16>, <vscale x 4 x i1> } @llvm.smul.with.overflow.nxv4i16(<vscale x 4 x i16>, <vscale x 4 x i16>)

define <vscale x 4 x i16> @smulo_nxv4i16(<vscale x 4 x i16> %x, <vscale x 4 x i16> %y) {
; CHECK-LABEL: smulo_nxv4i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e16, m1, ta, mu
; CHECK-NEXT:    vmulh.vv v10, v8, v9
; CHECK-NEXT:    vmul.vv v8, v8, v9
; CHECK-NEXT:    vsra.vi v9, v8, 15
; CHECK-NEXT:    vmsne.vv v0, v10, v9
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 4 x i16>, <vscale x 4 x i1> } @llvm.smul.with.overflow.nxv4i16(<vscale x 4 x i16> %x, <vscale x 4 x i16> %y)
  %b = extractvalue { <vscale x 4 x i16>, <vscale x 4 x i1> } %a, 0
  %c = extractvalue { <vscale x 4 x i16>, <vscale x 4 x i1> } %a, 1
  %d = select <vscale x 4 x i1> %c, <vscale x 4 x i16> zeroinitializer, <vscale x 4 x i16> %b
  ret <vscale x 4 x i16> %d
}

declare { <vscale x 8 x i16>, <vscale x 8 x i1> } @llvm.smul.with.overflow.nxv8i16(<vscale x 8 x i16>, <vscale x 8 x i16>)

define <vscale x 8 x i16> @smulo_nxv8i16(<vscale x 8 x i16> %x, <vscale x 8 x i16> %y) {
; CHECK-LABEL: smulo_nxv8i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e16, m2, ta, mu
; CHECK-NEXT:    vmulh.vv v12, v8, v10
; CHECK-NEXT:    vmul.vv v8, v8, v10
; CHECK-NEXT:    vsra.vi v10, v8, 15
; CHECK-NEXT:    vmsne.vv v0, v12, v10
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 8 x i16>, <vscale x 8 x i1> } @llvm.smul.with.overflow.nxv8i16(<vscale x 8 x i16> %x, <vscale x 8 x i16> %y)
  %b = extractvalue { <vscale x 8 x i16>, <vscale x 8 x i1> } %a, 0
  %c = extractvalue { <vscale x 8 x i16>, <vscale x 8 x i1> } %a, 1
  %d = select <vscale x 8 x i1> %c, <vscale x 8 x i16> zeroinitializer, <vscale x 8 x i16> %b
  ret <vscale x 8 x i16> %d
}

declare { <vscale x 16 x i16>, <vscale x 16 x i1> } @llvm.smul.with.overflow.nxv16i16(<vscale x 16 x i16>, <vscale x 16 x i16>)

define <vscale x 16 x i16> @smulo_nxv16i16(<vscale x 16 x i16> %x, <vscale x 16 x i16> %y) {
; CHECK-LABEL: smulo_nxv16i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e16, m4, ta, mu
; CHECK-NEXT:    vmulh.vv v16, v8, v12
; CHECK-NEXT:    vmul.vv v8, v8, v12
; CHECK-NEXT:    vsra.vi v12, v8, 15
; CHECK-NEXT:    vmsne.vv v0, v16, v12
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 16 x i16>, <vscale x 16 x i1> } @llvm.smul.with.overflow.nxv16i16(<vscale x 16 x i16> %x, <vscale x 16 x i16> %y)
  %b = extractvalue { <vscale x 16 x i16>, <vscale x 16 x i1> } %a, 0
  %c = extractvalue { <vscale x 16 x i16>, <vscale x 16 x i1> } %a, 1
  %d = select <vscale x 16 x i1> %c, <vscale x 16 x i16> zeroinitializer, <vscale x 16 x i16> %b
  ret <vscale x 16 x i16> %d
}

declare { <vscale x 32 x i16>, <vscale x 32 x i1> } @llvm.smul.with.overflow.nxv32i16(<vscale x 32 x i16>, <vscale x 32 x i16>)

define <vscale x 32 x i16> @smulo_nxv32i16(<vscale x 32 x i16> %x, <vscale x 32 x i16> %y) {
; CHECK-LABEL: smulo_nxv32i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e16, m8, ta, mu
; CHECK-NEXT:    vmulh.vv v24, v8, v16
; CHECK-NEXT:    vmul.vv v8, v8, v16
; CHECK-NEXT:    vsra.vi v16, v8, 15
; CHECK-NEXT:    vmsne.vv v0, v24, v16
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 32 x i16>, <vscale x 32 x i1> } @llvm.smul.with.overflow.nxv32i16(<vscale x 32 x i16> %x, <vscale x 32 x i16> %y)
  %b = extractvalue { <vscale x 32 x i16>, <vscale x 32 x i1> } %a, 0
  %c = extractvalue { <vscale x 32 x i16>, <vscale x 32 x i1> } %a, 1
  %d = select <vscale x 32 x i1> %c, <vscale x 32 x i16> zeroinitializer, <vscale x 32 x i16> %b
  ret <vscale x 32 x i16> %d
}

declare { <vscale x 1 x i32>, <vscale x 1 x i1> } @llvm.smul.with.overflow.nxv1i32(<vscale x 1 x i32>, <vscale x 1 x i32>)

define <vscale x 1 x i32> @smulo_nxv1i32(<vscale x 1 x i32> %x, <vscale x 1 x i32> %y) {
; CHECK-LABEL: smulo_nxv1i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e32, mf2, ta, mu
; CHECK-NEXT:    vmulh.vv v10, v8, v9
; CHECK-NEXT:    vmul.vv v8, v8, v9
; CHECK-NEXT:    vsra.vi v9, v8, 31
; CHECK-NEXT:    vmsne.vv v0, v10, v9
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 1 x i32>, <vscale x 1 x i1> } @llvm.smul.with.overflow.nxv1i32(<vscale x 1 x i32> %x, <vscale x 1 x i32> %y)
  %b = extractvalue { <vscale x 1 x i32>, <vscale x 1 x i1> } %a, 0
  %c = extractvalue { <vscale x 1 x i32>, <vscale x 1 x i1> } %a, 1
  %d = select <vscale x 1 x i1> %c, <vscale x 1 x i32> zeroinitializer, <vscale x 1 x i32> %b
  ret <vscale x 1 x i32> %d
}

declare { <vscale x 2 x i32>, <vscale x 2 x i1> } @llvm.smul.with.overflow.nxv2i32(<vscale x 2 x i32>, <vscale x 2 x i32>)

define <vscale x 2 x i32> @smulo_nxv2i32(<vscale x 2 x i32> %x, <vscale x 2 x i32> %y) {
; CHECK-LABEL: smulo_nxv2i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e32, m1, ta, mu
; CHECK-NEXT:    vmulh.vv v10, v8, v9
; CHECK-NEXT:    vmul.vv v8, v8, v9
; CHECK-NEXT:    vsra.vi v9, v8, 31
; CHECK-NEXT:    vmsne.vv v0, v10, v9
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 2 x i32>, <vscale x 2 x i1> } @llvm.smul.with.overflow.nxv2i32(<vscale x 2 x i32> %x, <vscale x 2 x i32> %y)
  %b = extractvalue { <vscale x 2 x i32>, <vscale x 2 x i1> } %a, 0
  %c = extractvalue { <vscale x 2 x i32>, <vscale x 2 x i1> } %a, 1
  %d = select <vscale x 2 x i1> %c, <vscale x 2 x i32> zeroinitializer, <vscale x 2 x i32> %b
  ret <vscale x 2 x i32> %d
}

declare { <vscale x 4 x i32>, <vscale x 4 x i1> } @llvm.smul.with.overflow.nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>)

define <vscale x 4 x i32> @smulo_nxv4i32(<vscale x 4 x i32> %x, <vscale x 4 x i32> %y) {
; CHECK-LABEL: smulo_nxv4i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e32, m2, ta, mu
; CHECK-NEXT:    vmulh.vv v12, v8, v10
; CHECK-NEXT:    vmul.vv v8, v8, v10
; CHECK-NEXT:    vsra.vi v10, v8, 31
; CHECK-NEXT:    vmsne.vv v0, v12, v10
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 4 x i32>, <vscale x 4 x i1> } @llvm.smul.with.overflow.nxv4i32(<vscale x 4 x i32> %x, <vscale x 4 x i32> %y)
  %b = extractvalue { <vscale x 4 x i32>, <vscale x 4 x i1> } %a, 0
  %c = extractvalue { <vscale x 4 x i32>, <vscale x 4 x i1> } %a, 1
  %d = select <vscale x 4 x i1> %c, <vscale x 4 x i32> zeroinitializer, <vscale x 4 x i32> %b
  ret <vscale x 4 x i32> %d
}

declare { <vscale x 8 x i32>, <vscale x 8 x i1> } @llvm.smul.with.overflow.nxv8i32(<vscale x 8 x i32>, <vscale x 8 x i32>)

define <vscale x 8 x i32> @smulo_nxv8i32(<vscale x 8 x i32> %x, <vscale x 8 x i32> %y) {
; CHECK-LABEL: smulo_nxv8i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e32, m4, ta, mu
; CHECK-NEXT:    vmulh.vv v16, v8, v12
; CHECK-NEXT:    vmul.vv v8, v8, v12
; CHECK-NEXT:    vsra.vi v12, v8, 31
; CHECK-NEXT:    vmsne.vv v0, v16, v12
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 8 x i32>, <vscale x 8 x i1> } @llvm.smul.with.overflow.nxv8i32(<vscale x 8 x i32> %x, <vscale x 8 x i32> %y)
  %b = extractvalue { <vscale x 8 x i32>, <vscale x 8 x i1> } %a, 0
  %c = extractvalue { <vscale x 8 x i32>, <vscale x 8 x i1> } %a, 1
  %d = select <vscale x 8 x i1> %c, <vscale x 8 x i32> zeroinitializer, <vscale x 8 x i32> %b
  ret <vscale x 8 x i32> %d
}

declare { <vscale x 16 x i32>, <vscale x 16 x i1> } @llvm.smul.with.overflow.nxv16i32(<vscale x 16 x i32>, <vscale x 16 x i32>)

define <vscale x 16 x i32> @smulo_nxv16i32(<vscale x 16 x i32> %x, <vscale x 16 x i32> %y) {
; CHECK-LABEL: smulo_nxv16i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e32, m8, ta, mu
; CHECK-NEXT:    vmulh.vv v24, v8, v16
; CHECK-NEXT:    vmul.vv v8, v8, v16
; CHECK-NEXT:    vsra.vi v16, v8, 31
; CHECK-NEXT:    vmsne.vv v0, v24, v16
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 16 x i32>, <vscale x 16 x i1> } @llvm.smul.with.overflow.nxv16i32(<vscale x 16 x i32> %x, <vscale x 16 x i32> %y)
  %b = extractvalue { <vscale x 16 x i32>, <vscale x 16 x i1> } %a, 0
  %c = extractvalue { <vscale x 16 x i32>, <vscale x 16 x i1> } %a, 1
  %d = select <vscale x 16 x i1> %c, <vscale x 16 x i32> zeroinitializer, <vscale x 16 x i32> %b
  ret <vscale x 16 x i32> %d
}

declare { <vscale x 1 x i64>, <vscale x 1 x i1> } @llvm.smul.with.overflow.nxv1i64(<vscale x 1 x i64>, <vscale x 1 x i64>)

define <vscale x 1 x i64> @smulo_nxv1i64(<vscale x 1 x i64> %x, <vscale x 1 x i64> %y) {
; CHECK-LABEL: smulo_nxv1i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e64, m1, ta, mu
; CHECK-NEXT:    vmulh.vv v10, v8, v9
; CHECK-NEXT:    vmul.vv v8, v8, v9
; CHECK-NEXT:    li a0, 63
; CHECK-NEXT:    vsra.vx v9, v8, a0
; CHECK-NEXT:    vmsne.vv v0, v10, v9
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 1 x i64>, <vscale x 1 x i1> } @llvm.smul.with.overflow.nxv1i64(<vscale x 1 x i64> %x, <vscale x 1 x i64> %y)
  %b = extractvalue { <vscale x 1 x i64>, <vscale x 1 x i1> } %a, 0
  %c = extractvalue { <vscale x 1 x i64>, <vscale x 1 x i1> } %a, 1
  %d = select <vscale x 1 x i1> %c, <vscale x 1 x i64> zeroinitializer, <vscale x 1 x i64> %b
  ret <vscale x 1 x i64> %d
}

declare { <vscale x 2 x i64>, <vscale x 2 x i1> } @llvm.smul.with.overflow.nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>)

define <vscale x 2 x i64> @smulo_nxv2i64(<vscale x 2 x i64> %x, <vscale x 2 x i64> %y) {
; CHECK-LABEL: smulo_nxv2i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e64, m2, ta, mu
; CHECK-NEXT:    vmulh.vv v12, v8, v10
; CHECK-NEXT:    vmul.vv v8, v8, v10
; CHECK-NEXT:    li a0, 63
; CHECK-NEXT:    vsra.vx v10, v8, a0
; CHECK-NEXT:    vmsne.vv v0, v12, v10
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 2 x i64>, <vscale x 2 x i1> } @llvm.smul.with.overflow.nxv2i64(<vscale x 2 x i64> %x, <vscale x 2 x i64> %y)
  %b = extractvalue { <vscale x 2 x i64>, <vscale x 2 x i1> } %a, 0
  %c = extractvalue { <vscale x 2 x i64>, <vscale x 2 x i1> } %a, 1
  %d = select <vscale x 2 x i1> %c, <vscale x 2 x i64> zeroinitializer, <vscale x 2 x i64> %b
  ret <vscale x 2 x i64> %d
}

declare { <vscale x 4 x i64>, <vscale x 4 x i1> } @llvm.smul.with.overflow.nxv4i64(<vscale x 4 x i64>, <vscale x 4 x i64>)

define <vscale x 4 x i64> @smulo_nxv4i64(<vscale x 4 x i64> %x, <vscale x 4 x i64> %y) {
; CHECK-LABEL: smulo_nxv4i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e64, m4, ta, mu
; CHECK-NEXT:    vmulh.vv v16, v8, v12
; CHECK-NEXT:    vmul.vv v8, v8, v12
; CHECK-NEXT:    li a0, 63
; CHECK-NEXT:    vsra.vx v12, v8, a0
; CHECK-NEXT:    vmsne.vv v0, v16, v12
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 4 x i64>, <vscale x 4 x i1> } @llvm.smul.with.overflow.nxv4i64(<vscale x 4 x i64> %x, <vscale x 4 x i64> %y)
  %b = extractvalue { <vscale x 4 x i64>, <vscale x 4 x i1> } %a, 0
  %c = extractvalue { <vscale x 4 x i64>, <vscale x 4 x i1> } %a, 1
  %d = select <vscale x 4 x i1> %c, <vscale x 4 x i64> zeroinitializer, <vscale x 4 x i64> %b
  ret <vscale x 4 x i64> %d
}

declare { <vscale x 8 x i64>, <vscale x 8 x i1> } @llvm.smul.with.overflow.nxv8i64(<vscale x 8 x i64>, <vscale x 8 x i64>)

define <vscale x 8 x i64> @smulo_nxv8i64(<vscale x 8 x i64> %x, <vscale x 8 x i64> %y) {
; CHECK-LABEL: smulo_nxv8i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e64, m8, ta, mu
; CHECK-NEXT:    vmulh.vv v24, v8, v16
; CHECK-NEXT:    vmul.vv v8, v8, v16
; CHECK-NEXT:    li a0, 63
; CHECK-NEXT:    vsra.vx v16, v8, a0
; CHECK-NEXT:    vmsne.vv v0, v24, v16
; CHECK-NEXT:    vmerge.vim v8, v8, 0, v0
; CHECK-NEXT:    ret
  %a = call { <vscale x 8 x i64>, <vscale x 8 x i1> } @llvm.smul.with.overflow.nxv8i64(<vscale x 8 x i64> %x, <vscale x 8 x i64> %y)
  %b = extractvalue { <vscale x 8 x i64>, <vscale x 8 x i1> } %a, 0
  %c = extractvalue { <vscale x 8 x i64>, <vscale x 8 x i1> } %a, 1
  %d = select <vscale x 8 x i1> %c, <vscale x 8 x i64> zeroinitializer, <vscale x 8 x i64> %b
  ret <vscale x 8 x i64> %d
}
