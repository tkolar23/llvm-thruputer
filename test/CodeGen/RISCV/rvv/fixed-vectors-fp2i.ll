; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -target-abi=ilp32d -mattr=+experimental-v,+zfh,+f,+d -riscv-v-vector-bits-min=128 -riscv-v-fixed-length-vector-lmul-max=8 -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK,LMULMAX8
; RUN: llc -mtriple=riscv64 -target-abi=lp64d -mattr=+experimental-v,+zfh,+f,+d -riscv-v-vector-bits-min=128 -riscv-v-fixed-length-vector-lmul-max=8 -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK,LMULMAX8
; RUN: llc -mtriple=riscv32 -target-abi=ilp32d -mattr=+experimental-v,+zfh,+f,+d -riscv-v-vector-bits-min=128 -riscv-v-fixed-length-vector-lmul-max=1 -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK,LMULMAX1
; RUN: llc -mtriple=riscv64 -target-abi=lp64d -mattr=+experimental-v,+zfh,+f,+d -riscv-v-vector-bits-min=128 -riscv-v-fixed-length-vector-lmul-max=1 -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK,LMULMAX1

define void @fp2si_v2f32_v2i32(<2 x float>* %x, <2 x i32>* %y) {
; CHECK-LABEL: fp2si_v2f32_v2i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; CHECK-NEXT:    vle32.v v8, (a0)
; CHECK-NEXT:    vfcvt.rtz.x.f.v v8, v8
; CHECK-NEXT:    vse32.v v8, (a1)
; CHECK-NEXT:    ret
  %a = load <2 x float>, <2 x float>* %x
  %d = fptosi <2 x float> %a to <2 x i32>
  store <2 x i32> %d, <2 x i32>* %y
  ret void
}

define void @fp2ui_v2f32_v2i32(<2 x float>* %x, <2 x i32>* %y) {
; CHECK-LABEL: fp2ui_v2f32_v2i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; CHECK-NEXT:    vle32.v v8, (a0)
; CHECK-NEXT:    vfcvt.rtz.xu.f.v v8, v8
; CHECK-NEXT:    vse32.v v8, (a1)
; CHECK-NEXT:    ret
  %a = load <2 x float>, <2 x float>* %x
  %d = fptoui <2 x float> %a to <2 x i32>
  store <2 x i32> %d, <2 x i32>* %y
  ret void
}

define <2 x i1> @fp2si_v2f32_v2i1(<2 x float> %x) {
; CHECK-LABEL: fp2si_v2f32_v2i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e16, mf4, ta, mu
; CHECK-NEXT:    vfncvt.rtz.x.f.w v9, v8
; CHECK-NEXT:    vand.vi v8, v9, 1
; CHECK-NEXT:    vmsne.vi v0, v8, 0
; CHECK-NEXT:    ret
  %z = fptosi <2 x float> %x to <2 x i1>
  ret <2 x i1> %z
}

define <2 x i1> @fp2ui_v2f32_v2i1(<2 x float> %x) {
; CHECK-LABEL: fp2ui_v2f32_v2i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e16, mf4, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v9, v8
; CHECK-NEXT:    vand.vi v8, v9, 1
; CHECK-NEXT:    vmsne.vi v0, v8, 0
; CHECK-NEXT:    ret
  %z = fptoui <2 x float> %x to <2 x i1>
  ret <2 x i1> %z
}

define void @fp2si_v8f32_v8i32(<8 x float>* %x, <8 x i32>* %y) {
; LMULMAX8-LABEL: fp2si_v8f32_v8i32:
; LMULMAX8:       # %bb.0:
; LMULMAX8-NEXT:    vsetivli zero, 8, e32, m2, ta, mu
; LMULMAX8-NEXT:    vle32.v v8, (a0)
; LMULMAX8-NEXT:    vfcvt.rtz.x.f.v v8, v8
; LMULMAX8-NEXT:    vse32.v v8, (a1)
; LMULMAX8-NEXT:    ret
;
; LMULMAX1-LABEL: fp2si_v8f32_v8i32:
; LMULMAX1:       # %bb.0:
; LMULMAX1-NEXT:    vsetivli zero, 4, e32, m1, ta, mu
; LMULMAX1-NEXT:    addi a2, a0, 16
; LMULMAX1-NEXT:    vle32.v v8, (a2)
; LMULMAX1-NEXT:    vle32.v v9, (a0)
; LMULMAX1-NEXT:    vfcvt.rtz.x.f.v v8, v8
; LMULMAX1-NEXT:    vfcvt.rtz.x.f.v v9, v9
; LMULMAX1-NEXT:    vse32.v v9, (a1)
; LMULMAX1-NEXT:    addi a0, a1, 16
; LMULMAX1-NEXT:    vse32.v v8, (a0)
; LMULMAX1-NEXT:    ret
  %a = load <8 x float>, <8 x float>* %x
  %d = fptosi <8 x float> %a to <8 x i32>
  store <8 x i32> %d, <8 x i32>* %y
  ret void
}

define void @fp2ui_v8f32_v8i32(<8 x float>* %x, <8 x i32>* %y) {
; LMULMAX8-LABEL: fp2ui_v8f32_v8i32:
; LMULMAX8:       # %bb.0:
; LMULMAX8-NEXT:    vsetivli zero, 8, e32, m2, ta, mu
; LMULMAX8-NEXT:    vle32.v v8, (a0)
; LMULMAX8-NEXT:    vfcvt.rtz.xu.f.v v8, v8
; LMULMAX8-NEXT:    vse32.v v8, (a1)
; LMULMAX8-NEXT:    ret
;
; LMULMAX1-LABEL: fp2ui_v8f32_v8i32:
; LMULMAX1:       # %bb.0:
; LMULMAX1-NEXT:    vsetivli zero, 4, e32, m1, ta, mu
; LMULMAX1-NEXT:    addi a2, a0, 16
; LMULMAX1-NEXT:    vle32.v v8, (a2)
; LMULMAX1-NEXT:    vle32.v v9, (a0)
; LMULMAX1-NEXT:    vfcvt.rtz.xu.f.v v8, v8
; LMULMAX1-NEXT:    vfcvt.rtz.xu.f.v v9, v9
; LMULMAX1-NEXT:    vse32.v v9, (a1)
; LMULMAX1-NEXT:    addi a0, a1, 16
; LMULMAX1-NEXT:    vse32.v v8, (a0)
; LMULMAX1-NEXT:    ret
  %a = load <8 x float>, <8 x float>* %x
  %d = fptoui <8 x float> %a to <8 x i32>
  store <8 x i32> %d, <8 x i32>* %y
  ret void
}

define <8 x i1> @fp2si_v8f32_v8i1(<8 x float> %x) {
; LMULMAX8-LABEL: fp2si_v8f32_v8i1:
; LMULMAX8:       # %bb.0:
; LMULMAX8-NEXT:    vsetivli zero, 8, e16, m1, ta, mu
; LMULMAX8-NEXT:    vfncvt.rtz.x.f.w v10, v8
; LMULMAX8-NEXT:    vand.vi v8, v10, 1
; LMULMAX8-NEXT:    vmsne.vi v0, v8, 0
; LMULMAX8-NEXT:    ret
;
; LMULMAX1-LABEL: fp2si_v8f32_v8i1:
; LMULMAX1:       # %bb.0:
; LMULMAX1-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; LMULMAX1-NEXT:    vmclr.m v0
; LMULMAX1-NEXT:    vmv.v.i v10, 0
; LMULMAX1-NEXT:    vmerge.vim v11, v10, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 4, e16, mf2, ta, mu
; LMULMAX1-NEXT:    vfncvt.rtz.x.f.w v12, v8
; LMULMAX1-NEXT:    vand.vi v8, v12, 1
; LMULMAX1-NEXT:    vmsne.vi v0, v8, 0
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf4, ta, mu
; LMULMAX1-NEXT:    vmv.v.i v8, 0
; LMULMAX1-NEXT:    vmerge.vim v12, v8, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 4, e8, mf2, tu, mu
; LMULMAX1-NEXT:    vslideup.vi v11, v12, 0
; LMULMAX1-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; LMULMAX1-NEXT:    vmsne.vi v0, v11, 0
; LMULMAX1-NEXT:    vmerge.vim v10, v10, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 4, e16, mf2, ta, mu
; LMULMAX1-NEXT:    vfncvt.rtz.x.f.w v11, v9
; LMULMAX1-NEXT:    vand.vi v9, v11, 1
; LMULMAX1-NEXT:    vmsne.vi v0, v9, 0
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf4, ta, mu
; LMULMAX1-NEXT:    vmerge.vim v8, v8, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 8, e8, mf2, tu, mu
; LMULMAX1-NEXT:    vslideup.vi v10, v8, 4
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf2, ta, mu
; LMULMAX1-NEXT:    vmsne.vi v0, v10, 0
; LMULMAX1-NEXT:    ret
  %z = fptosi <8 x float> %x to <8 x i1>
  ret <8 x i1> %z
}

define <8 x i1> @fp2ui_v8f32_v8i1(<8 x float> %x) {
; LMULMAX8-LABEL: fp2ui_v8f32_v8i1:
; LMULMAX8:       # %bb.0:
; LMULMAX8-NEXT:    vsetivli zero, 8, e16, m1, ta, mu
; LMULMAX8-NEXT:    vfncvt.rtz.xu.f.w v10, v8
; LMULMAX8-NEXT:    vand.vi v8, v10, 1
; LMULMAX8-NEXT:    vmsne.vi v0, v8, 0
; LMULMAX8-NEXT:    ret
;
; LMULMAX1-LABEL: fp2ui_v8f32_v8i1:
; LMULMAX1:       # %bb.0:
; LMULMAX1-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; LMULMAX1-NEXT:    vmclr.m v0
; LMULMAX1-NEXT:    vmv.v.i v10, 0
; LMULMAX1-NEXT:    vmerge.vim v11, v10, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 4, e16, mf2, ta, mu
; LMULMAX1-NEXT:    vfncvt.rtz.xu.f.w v12, v8
; LMULMAX1-NEXT:    vand.vi v8, v12, 1
; LMULMAX1-NEXT:    vmsne.vi v0, v8, 0
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf4, ta, mu
; LMULMAX1-NEXT:    vmv.v.i v8, 0
; LMULMAX1-NEXT:    vmerge.vim v12, v8, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 4, e8, mf2, tu, mu
; LMULMAX1-NEXT:    vslideup.vi v11, v12, 0
; LMULMAX1-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; LMULMAX1-NEXT:    vmsne.vi v0, v11, 0
; LMULMAX1-NEXT:    vmerge.vim v10, v10, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 4, e16, mf2, ta, mu
; LMULMAX1-NEXT:    vfncvt.rtz.xu.f.w v11, v9
; LMULMAX1-NEXT:    vand.vi v9, v11, 1
; LMULMAX1-NEXT:    vmsne.vi v0, v9, 0
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf4, ta, mu
; LMULMAX1-NEXT:    vmerge.vim v8, v8, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 8, e8, mf2, tu, mu
; LMULMAX1-NEXT:    vslideup.vi v10, v8, 4
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf2, ta, mu
; LMULMAX1-NEXT:    vmsne.vi v0, v10, 0
; LMULMAX1-NEXT:    ret
  %z = fptoui <8 x float> %x to <8 x i1>
  ret <8 x i1> %z
}

define void @fp2si_v2f32_v2i64(<2 x float>* %x, <2 x i64>* %y) {
; CHECK-LABEL: fp2si_v2f32_v2i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; CHECK-NEXT:    vle32.v v8, (a0)
; CHECK-NEXT:    vfwcvt.rtz.x.f.v v9, v8
; CHECK-NEXT:    vse64.v v9, (a1)
; CHECK-NEXT:    ret
  %a = load <2 x float>, <2 x float>* %x
  %d = fptosi <2 x float> %a to <2 x i64>
  store <2 x i64> %d, <2 x i64>* %y
  ret void
}

define void @fp2ui_v2f32_v2i64(<2 x float>* %x, <2 x i64>* %y) {
; CHECK-LABEL: fp2ui_v2f32_v2i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; CHECK-NEXT:    vle32.v v8, (a0)
; CHECK-NEXT:    vfwcvt.rtz.xu.f.v v9, v8
; CHECK-NEXT:    vse64.v v9, (a1)
; CHECK-NEXT:    ret
  %a = load <2 x float>, <2 x float>* %x
  %d = fptoui <2 x float> %a to <2 x i64>
  store <2 x i64> %d, <2 x i64>* %y
  ret void
}

define void @fp2si_v8f32_v8i64(<8 x float>* %x, <8 x i64>* %y) {
; LMULMAX8-LABEL: fp2si_v8f32_v8i64:
; LMULMAX8:       # %bb.0:
; LMULMAX8-NEXT:    vsetivli zero, 8, e32, m2, ta, mu
; LMULMAX8-NEXT:    vle32.v v8, (a0)
; LMULMAX8-NEXT:    vfwcvt.rtz.x.f.v v12, v8
; LMULMAX8-NEXT:    vse64.v v12, (a1)
; LMULMAX8-NEXT:    ret
;
; LMULMAX1-LABEL: fp2si_v8f32_v8i64:
; LMULMAX1:       # %bb.0:
; LMULMAX1-NEXT:    vsetivli zero, 4, e32, m1, ta, mu
; LMULMAX1-NEXT:    addi a2, a0, 16
; LMULMAX1-NEXT:    vle32.v v8, (a2)
; LMULMAX1-NEXT:    vle32.v v9, (a0)
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, m1, ta, mu
; LMULMAX1-NEXT:    vslidedown.vi v10, v8, 2
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; LMULMAX1-NEXT:    vfwcvt.rtz.x.f.v v11, v10
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, m1, ta, mu
; LMULMAX1-NEXT:    vslidedown.vi v10, v9, 2
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; LMULMAX1-NEXT:    vfwcvt.rtz.x.f.v v12, v10
; LMULMAX1-NEXT:    vfwcvt.rtz.x.f.v v10, v8
; LMULMAX1-NEXT:    vfwcvt.rtz.x.f.v v8, v9
; LMULMAX1-NEXT:    addi a0, a1, 16
; LMULMAX1-NEXT:    vse64.v v12, (a0)
; LMULMAX1-NEXT:    vse64.v v8, (a1)
; LMULMAX1-NEXT:    addi a0, a1, 48
; LMULMAX1-NEXT:    vse64.v v11, (a0)
; LMULMAX1-NEXT:    addi a0, a1, 32
; LMULMAX1-NEXT:    vse64.v v10, (a0)
; LMULMAX1-NEXT:    ret
  %a = load <8 x float>, <8 x float>* %x
  %d = fptosi <8 x float> %a to <8 x i64>
  store <8 x i64> %d, <8 x i64>* %y
  ret void
}

define void @fp2ui_v8f32_v8i64(<8 x float>* %x, <8 x i64>* %y) {
; LMULMAX8-LABEL: fp2ui_v8f32_v8i64:
; LMULMAX8:       # %bb.0:
; LMULMAX8-NEXT:    vsetivli zero, 8, e32, m2, ta, mu
; LMULMAX8-NEXT:    vle32.v v8, (a0)
; LMULMAX8-NEXT:    vfwcvt.rtz.xu.f.v v12, v8
; LMULMAX8-NEXT:    vse64.v v12, (a1)
; LMULMAX8-NEXT:    ret
;
; LMULMAX1-LABEL: fp2ui_v8f32_v8i64:
; LMULMAX1:       # %bb.0:
; LMULMAX1-NEXT:    vsetivli zero, 4, e32, m1, ta, mu
; LMULMAX1-NEXT:    addi a2, a0, 16
; LMULMAX1-NEXT:    vle32.v v8, (a2)
; LMULMAX1-NEXT:    vle32.v v9, (a0)
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, m1, ta, mu
; LMULMAX1-NEXT:    vslidedown.vi v10, v8, 2
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; LMULMAX1-NEXT:    vfwcvt.rtz.xu.f.v v11, v10
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, m1, ta, mu
; LMULMAX1-NEXT:    vslidedown.vi v10, v9, 2
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; LMULMAX1-NEXT:    vfwcvt.rtz.xu.f.v v12, v10
; LMULMAX1-NEXT:    vfwcvt.rtz.xu.f.v v10, v8
; LMULMAX1-NEXT:    vfwcvt.rtz.xu.f.v v8, v9
; LMULMAX1-NEXT:    addi a0, a1, 16
; LMULMAX1-NEXT:    vse64.v v12, (a0)
; LMULMAX1-NEXT:    vse64.v v8, (a1)
; LMULMAX1-NEXT:    addi a0, a1, 48
; LMULMAX1-NEXT:    vse64.v v11, (a0)
; LMULMAX1-NEXT:    addi a0, a1, 32
; LMULMAX1-NEXT:    vse64.v v10, (a0)
; LMULMAX1-NEXT:    ret
  %a = load <8 x float>, <8 x float>* %x
  %d = fptoui <8 x float> %a to <8 x i64>
  store <8 x i64> %d, <8 x i64>* %y
  ret void
}

define void @fp2si_v2f16_v2i64(<2 x half>* %x, <2 x i64>* %y) {
; CHECK-LABEL: fp2si_v2f16_v2i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e16, mf4, ta, mu
; CHECK-NEXT:    vle16.v v8, (a0)
; CHECK-NEXT:    vfwcvt.f.f.v v9, v8
; CHECK-NEXT:    vsetvli zero, zero, e32, mf2, ta, mu
; CHECK-NEXT:    vfwcvt.rtz.x.f.v v8, v9
; CHECK-NEXT:    vse64.v v8, (a1)
; CHECK-NEXT:    ret
  %a = load <2 x half>, <2 x half>* %x
  %d = fptosi <2 x half> %a to <2 x i64>
  store <2 x i64> %d, <2 x i64>* %y
  ret void
}

define void @fp2ui_v2f16_v2i64(<2 x half>* %x, <2 x i64>* %y) {
; CHECK-LABEL: fp2ui_v2f16_v2i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e16, mf4, ta, mu
; CHECK-NEXT:    vle16.v v8, (a0)
; CHECK-NEXT:    vfwcvt.f.f.v v9, v8
; CHECK-NEXT:    vsetvli zero, zero, e32, mf2, ta, mu
; CHECK-NEXT:    vfwcvt.rtz.xu.f.v v8, v9
; CHECK-NEXT:    vse64.v v8, (a1)
; CHECK-NEXT:    ret
  %a = load <2 x half>, <2 x half>* %x
  %d = fptoui <2 x half> %a to <2 x i64>
  store <2 x i64> %d, <2 x i64>* %y
  ret void
}

define <2 x i1> @fp2si_v2f16_v2i1(<2 x half> %x) {
; CHECK-LABEL: fp2si_v2f16_v2i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e8, mf8, ta, mu
; CHECK-NEXT:    vfncvt.rtz.x.f.w v9, v8
; CHECK-NEXT:    vand.vi v8, v9, 1
; CHECK-NEXT:    vmsne.vi v0, v8, 0
; CHECK-NEXT:    ret
  %z = fptosi <2 x half> %x to <2 x i1>
  ret <2 x i1> %z
}

define <2 x i1> @fp2ui_v2f16_v2i1(<2 x half> %x) {
; CHECK-LABEL: fp2ui_v2f16_v2i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e8, mf8, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v9, v8
; CHECK-NEXT:    vand.vi v8, v9, 1
; CHECK-NEXT:    vmsne.vi v0, v8, 0
; CHECK-NEXT:    ret
  %z = fptoui <2 x half> %x to <2 x i1>
  ret <2 x i1> %z
}

define void @fp2si_v2f64_v2i8(<2 x double>* %x, <2 x i8>* %y) {
; CHECK-LABEL: fp2si_v2f64_v2i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e64, m1, ta, mu
; CHECK-NEXT:    vle64.v v8, (a0)
; CHECK-NEXT:    vsetvli zero, zero, e32, mf2, ta, mu
; CHECK-NEXT:    vfncvt.rtz.x.f.w v9, v8
; CHECK-NEXT:    vsetvli zero, zero, e16, mf4, ta, mu
; CHECK-NEXT:    vnsrl.wi v8, v9, 0
; CHECK-NEXT:    vsetvli zero, zero, e8, mf8, ta, mu
; CHECK-NEXT:    vnsrl.wi v8, v8, 0
; CHECK-NEXT:    vse8.v v8, (a1)
; CHECK-NEXT:    ret
  %a = load <2 x double>, <2 x double>* %x
  %d = fptosi <2 x double> %a to <2 x i8>
  store <2 x i8> %d, <2 x i8>* %y
  ret void
}

define void @fp2ui_v2f64_v2i8(<2 x double>* %x, <2 x i8>* %y) {
; CHECK-LABEL: fp2ui_v2f64_v2i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e64, m1, ta, mu
; CHECK-NEXT:    vle64.v v8, (a0)
; CHECK-NEXT:    vsetvli zero, zero, e32, mf2, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v9, v8
; CHECK-NEXT:    vsetvli zero, zero, e16, mf4, ta, mu
; CHECK-NEXT:    vnsrl.wi v8, v9, 0
; CHECK-NEXT:    vsetvli zero, zero, e8, mf8, ta, mu
; CHECK-NEXT:    vnsrl.wi v8, v8, 0
; CHECK-NEXT:    vse8.v v8, (a1)
; CHECK-NEXT:    ret
  %a = load <2 x double>, <2 x double>* %x
  %d = fptoui <2 x double> %a to <2 x i8>
  store <2 x i8> %d, <2 x i8>* %y
  ret void
}

define <2 x i1> @fp2si_v2f64_v2i1(<2 x double> %x) {
; CHECK-LABEL: fp2si_v2f64_v2i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; CHECK-NEXT:    vfncvt.rtz.x.f.w v9, v8
; CHECK-NEXT:    vand.vi v8, v9, 1
; CHECK-NEXT:    vmsne.vi v0, v8, 0
; CHECK-NEXT:    ret
  %z = fptosi <2 x double> %x to <2 x i1>
  ret <2 x i1> %z
}

define <2 x i1> @fp2ui_v2f64_v2i1(<2 x double> %x) {
; CHECK-LABEL: fp2ui_v2f64_v2i1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; CHECK-NEXT:    vfncvt.rtz.xu.f.w v9, v8
; CHECK-NEXT:    vand.vi v8, v9, 1
; CHECK-NEXT:    vmsne.vi v0, v8, 0
; CHECK-NEXT:    ret
  %z = fptoui <2 x double> %x to <2 x i1>
  ret <2 x i1> %z
}

define void @fp2si_v8f64_v8i8(<8 x double>* %x, <8 x i8>* %y) {
; LMULMAX8-LABEL: fp2si_v8f64_v8i8:
; LMULMAX8:       # %bb.0:
; LMULMAX8-NEXT:    vsetivli zero, 8, e64, m4, ta, mu
; LMULMAX8-NEXT:    vle64.v v8, (a0)
; LMULMAX8-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; LMULMAX8-NEXT:    vfncvt.rtz.x.f.w v12, v8
; LMULMAX8-NEXT:    vsetvli zero, zero, e16, m1, ta, mu
; LMULMAX8-NEXT:    vnsrl.wi v8, v12, 0
; LMULMAX8-NEXT:    vsetvli zero, zero, e8, mf2, ta, mu
; LMULMAX8-NEXT:    vnsrl.wi v8, v8, 0
; LMULMAX8-NEXT:    vse8.v v8, (a1)
; LMULMAX8-NEXT:    ret
;
; LMULMAX1-LABEL: fp2si_v8f64_v8i8:
; LMULMAX1:       # %bb.0:
; LMULMAX1-NEXT:    addi a2, a0, 48
; LMULMAX1-NEXT:    vsetivli zero, 2, e64, m1, ta, mu
; LMULMAX1-NEXT:    vle64.v v8, (a2)
; LMULMAX1-NEXT:    addi a2, a0, 32
; LMULMAX1-NEXT:    vle64.v v9, (a2)
; LMULMAX1-NEXT:    vle64.v v10, (a0)
; LMULMAX1-NEXT:    addi a0, a0, 16
; LMULMAX1-NEXT:    vle64.v v11, (a0)
; LMULMAX1-NEXT:    vsetvli zero, zero, e32, mf2, ta, mu
; LMULMAX1-NEXT:    vfncvt.rtz.x.f.w v12, v10
; LMULMAX1-NEXT:    vsetvli zero, zero, e16, mf4, ta, mu
; LMULMAX1-NEXT:    vnsrl.wi v10, v12, 0
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf8, ta, mu
; LMULMAX1-NEXT:    vnsrl.wi v10, v10, 0
; LMULMAX1-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; LMULMAX1-NEXT:    vmv.v.i v12, 0
; LMULMAX1-NEXT:    vsetivli zero, 2, e8, mf2, tu, mu
; LMULMAX1-NEXT:    vslideup.vi v12, v10, 0
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; LMULMAX1-NEXT:    vfncvt.rtz.x.f.w v10, v11
; LMULMAX1-NEXT:    vsetvli zero, zero, e16, mf4, ta, mu
; LMULMAX1-NEXT:    vnsrl.wi v10, v10, 0
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf8, ta, mu
; LMULMAX1-NEXT:    vnsrl.wi v10, v10, 0
; LMULMAX1-NEXT:    vsetivli zero, 4, e8, mf2, tu, mu
; LMULMAX1-NEXT:    vslideup.vi v12, v10, 2
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; LMULMAX1-NEXT:    vfncvt.rtz.x.f.w v10, v9
; LMULMAX1-NEXT:    vsetvli zero, zero, e16, mf4, ta, mu
; LMULMAX1-NEXT:    vnsrl.wi v9, v10, 0
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf8, ta, mu
; LMULMAX1-NEXT:    vnsrl.wi v9, v9, 0
; LMULMAX1-NEXT:    vsetivli zero, 6, e8, mf2, tu, mu
; LMULMAX1-NEXT:    vslideup.vi v12, v9, 4
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; LMULMAX1-NEXT:    vfncvt.rtz.x.f.w v9, v8
; LMULMAX1-NEXT:    vsetvli zero, zero, e16, mf4, ta, mu
; LMULMAX1-NEXT:    vnsrl.wi v8, v9, 0
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf8, ta, mu
; LMULMAX1-NEXT:    vnsrl.wi v8, v8, 0
; LMULMAX1-NEXT:    vsetivli zero, 8, e8, mf2, tu, mu
; LMULMAX1-NEXT:    vslideup.vi v12, v8, 6
; LMULMAX1-NEXT:    vse8.v v12, (a1)
; LMULMAX1-NEXT:    ret
  %a = load <8 x double>, <8 x double>* %x
  %d = fptosi <8 x double> %a to <8 x i8>
  store <8 x i8> %d, <8 x i8>* %y
  ret void
}

define void @fp2ui_v8f64_v8i8(<8 x double>* %x, <8 x i8>* %y) {
; LMULMAX8-LABEL: fp2ui_v8f64_v8i8:
; LMULMAX8:       # %bb.0:
; LMULMAX8-NEXT:    vsetivli zero, 8, e64, m4, ta, mu
; LMULMAX8-NEXT:    vle64.v v8, (a0)
; LMULMAX8-NEXT:    vsetvli zero, zero, e32, m2, ta, mu
; LMULMAX8-NEXT:    vfncvt.rtz.xu.f.w v12, v8
; LMULMAX8-NEXT:    vsetvli zero, zero, e16, m1, ta, mu
; LMULMAX8-NEXT:    vnsrl.wi v8, v12, 0
; LMULMAX8-NEXT:    vsetvli zero, zero, e8, mf2, ta, mu
; LMULMAX8-NEXT:    vnsrl.wi v8, v8, 0
; LMULMAX8-NEXT:    vse8.v v8, (a1)
; LMULMAX8-NEXT:    ret
;
; LMULMAX1-LABEL: fp2ui_v8f64_v8i8:
; LMULMAX1:       # %bb.0:
; LMULMAX1-NEXT:    addi a2, a0, 48
; LMULMAX1-NEXT:    vsetivli zero, 2, e64, m1, ta, mu
; LMULMAX1-NEXT:    vle64.v v8, (a2)
; LMULMAX1-NEXT:    addi a2, a0, 32
; LMULMAX1-NEXT:    vle64.v v9, (a2)
; LMULMAX1-NEXT:    vle64.v v10, (a0)
; LMULMAX1-NEXT:    addi a0, a0, 16
; LMULMAX1-NEXT:    vle64.v v11, (a0)
; LMULMAX1-NEXT:    vsetvli zero, zero, e32, mf2, ta, mu
; LMULMAX1-NEXT:    vfncvt.rtz.xu.f.w v12, v10
; LMULMAX1-NEXT:    vsetvli zero, zero, e16, mf4, ta, mu
; LMULMAX1-NEXT:    vnsrl.wi v10, v12, 0
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf8, ta, mu
; LMULMAX1-NEXT:    vnsrl.wi v10, v10, 0
; LMULMAX1-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; LMULMAX1-NEXT:    vmv.v.i v12, 0
; LMULMAX1-NEXT:    vsetivli zero, 2, e8, mf2, tu, mu
; LMULMAX1-NEXT:    vslideup.vi v12, v10, 0
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; LMULMAX1-NEXT:    vfncvt.rtz.xu.f.w v10, v11
; LMULMAX1-NEXT:    vsetvli zero, zero, e16, mf4, ta, mu
; LMULMAX1-NEXT:    vnsrl.wi v10, v10, 0
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf8, ta, mu
; LMULMAX1-NEXT:    vnsrl.wi v10, v10, 0
; LMULMAX1-NEXT:    vsetivli zero, 4, e8, mf2, tu, mu
; LMULMAX1-NEXT:    vslideup.vi v12, v10, 2
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; LMULMAX1-NEXT:    vfncvt.rtz.xu.f.w v10, v9
; LMULMAX1-NEXT:    vsetvli zero, zero, e16, mf4, ta, mu
; LMULMAX1-NEXT:    vnsrl.wi v9, v10, 0
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf8, ta, mu
; LMULMAX1-NEXT:    vnsrl.wi v9, v9, 0
; LMULMAX1-NEXT:    vsetivli zero, 6, e8, mf2, tu, mu
; LMULMAX1-NEXT:    vslideup.vi v12, v9, 4
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; LMULMAX1-NEXT:    vfncvt.rtz.xu.f.w v9, v8
; LMULMAX1-NEXT:    vsetvli zero, zero, e16, mf4, ta, mu
; LMULMAX1-NEXT:    vnsrl.wi v8, v9, 0
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf8, ta, mu
; LMULMAX1-NEXT:    vnsrl.wi v8, v8, 0
; LMULMAX1-NEXT:    vsetivli zero, 8, e8, mf2, tu, mu
; LMULMAX1-NEXT:    vslideup.vi v12, v8, 6
; LMULMAX1-NEXT:    vse8.v v12, (a1)
; LMULMAX1-NEXT:    ret
  %a = load <8 x double>, <8 x double>* %x
  %d = fptoui <8 x double> %a to <8 x i8>
  store <8 x i8> %d, <8 x i8>* %y
  ret void
}

define <8 x i1> @fp2si_v8f64_v8i1(<8 x double> %x) {
; LMULMAX8-LABEL: fp2si_v8f64_v8i1:
; LMULMAX8:       # %bb.0:
; LMULMAX8-NEXT:    vsetivli zero, 8, e32, m2, ta, mu
; LMULMAX8-NEXT:    vfncvt.rtz.x.f.w v12, v8
; LMULMAX8-NEXT:    vand.vi v8, v12, 1
; LMULMAX8-NEXT:    vmsne.vi v0, v8, 0
; LMULMAX8-NEXT:    ret
;
; LMULMAX1-LABEL: fp2si_v8f64_v8i1:
; LMULMAX1:       # %bb.0:
; LMULMAX1-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; LMULMAX1-NEXT:    vmclr.m v0
; LMULMAX1-NEXT:    vmv.v.i v12, 0
; LMULMAX1-NEXT:    vmerge.vim v13, v12, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; LMULMAX1-NEXT:    vfncvt.rtz.x.f.w v14, v8
; LMULMAX1-NEXT:    vand.vi v8, v14, 1
; LMULMAX1-NEXT:    vmsne.vi v0, v8, 0
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf8, ta, mu
; LMULMAX1-NEXT:    vmv.v.i v8, 0
; LMULMAX1-NEXT:    vmerge.vim v14, v8, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 2, e8, mf2, tu, mu
; LMULMAX1-NEXT:    vslideup.vi v13, v14, 0
; LMULMAX1-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; LMULMAX1-NEXT:    vmsne.vi v0, v13, 0
; LMULMAX1-NEXT:    vmerge.vim v13, v12, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; LMULMAX1-NEXT:    vfncvt.rtz.x.f.w v14, v9
; LMULMAX1-NEXT:    vand.vi v9, v14, 1
; LMULMAX1-NEXT:    vmsne.vi v0, v9, 0
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf8, ta, mu
; LMULMAX1-NEXT:    vmerge.vim v9, v8, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 4, e8, mf2, tu, mu
; LMULMAX1-NEXT:    vslideup.vi v13, v9, 2
; LMULMAX1-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; LMULMAX1-NEXT:    vmsne.vi v0, v13, 0
; LMULMAX1-NEXT:    vmerge.vim v9, v12, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; LMULMAX1-NEXT:    vfncvt.rtz.x.f.w v13, v10
; LMULMAX1-NEXT:    vand.vi v10, v13, 1
; LMULMAX1-NEXT:    vmsne.vi v0, v10, 0
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf8, ta, mu
; LMULMAX1-NEXT:    vmerge.vim v10, v8, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 6, e8, mf2, tu, mu
; LMULMAX1-NEXT:    vslideup.vi v9, v10, 4
; LMULMAX1-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; LMULMAX1-NEXT:    vmsne.vi v0, v9, 0
; LMULMAX1-NEXT:    vmerge.vim v9, v12, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; LMULMAX1-NEXT:    vfncvt.rtz.x.f.w v10, v11
; LMULMAX1-NEXT:    vand.vi v10, v10, 1
; LMULMAX1-NEXT:    vmsne.vi v0, v10, 0
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf8, ta, mu
; LMULMAX1-NEXT:    vmerge.vim v8, v8, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 8, e8, mf2, tu, mu
; LMULMAX1-NEXT:    vslideup.vi v9, v8, 6
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf2, ta, mu
; LMULMAX1-NEXT:    vmsne.vi v0, v9, 0
; LMULMAX1-NEXT:    ret
  %z = fptosi <8 x double> %x to <8 x i1>
  ret <8 x i1> %z
}

define <8 x i1> @fp2ui_v8f64_v8i1(<8 x double> %x) {
; LMULMAX8-LABEL: fp2ui_v8f64_v8i1:
; LMULMAX8:       # %bb.0:
; LMULMAX8-NEXT:    vsetivli zero, 8, e32, m2, ta, mu
; LMULMAX8-NEXT:    vfncvt.rtz.xu.f.w v12, v8
; LMULMAX8-NEXT:    vand.vi v8, v12, 1
; LMULMAX8-NEXT:    vmsne.vi v0, v8, 0
; LMULMAX8-NEXT:    ret
;
; LMULMAX1-LABEL: fp2ui_v8f64_v8i1:
; LMULMAX1:       # %bb.0:
; LMULMAX1-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; LMULMAX1-NEXT:    vmclr.m v0
; LMULMAX1-NEXT:    vmv.v.i v12, 0
; LMULMAX1-NEXT:    vmerge.vim v13, v12, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; LMULMAX1-NEXT:    vfncvt.rtz.xu.f.w v14, v8
; LMULMAX1-NEXT:    vand.vi v8, v14, 1
; LMULMAX1-NEXT:    vmsne.vi v0, v8, 0
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf8, ta, mu
; LMULMAX1-NEXT:    vmv.v.i v8, 0
; LMULMAX1-NEXT:    vmerge.vim v14, v8, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 2, e8, mf2, tu, mu
; LMULMAX1-NEXT:    vslideup.vi v13, v14, 0
; LMULMAX1-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; LMULMAX1-NEXT:    vmsne.vi v0, v13, 0
; LMULMAX1-NEXT:    vmerge.vim v13, v12, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; LMULMAX1-NEXT:    vfncvt.rtz.xu.f.w v14, v9
; LMULMAX1-NEXT:    vand.vi v9, v14, 1
; LMULMAX1-NEXT:    vmsne.vi v0, v9, 0
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf8, ta, mu
; LMULMAX1-NEXT:    vmerge.vim v9, v8, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 4, e8, mf2, tu, mu
; LMULMAX1-NEXT:    vslideup.vi v13, v9, 2
; LMULMAX1-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; LMULMAX1-NEXT:    vmsne.vi v0, v13, 0
; LMULMAX1-NEXT:    vmerge.vim v9, v12, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; LMULMAX1-NEXT:    vfncvt.rtz.xu.f.w v13, v10
; LMULMAX1-NEXT:    vand.vi v10, v13, 1
; LMULMAX1-NEXT:    vmsne.vi v0, v10, 0
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf8, ta, mu
; LMULMAX1-NEXT:    vmerge.vim v10, v8, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 6, e8, mf2, tu, mu
; LMULMAX1-NEXT:    vslideup.vi v9, v10, 4
; LMULMAX1-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; LMULMAX1-NEXT:    vmsne.vi v0, v9, 0
; LMULMAX1-NEXT:    vmerge.vim v9, v12, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; LMULMAX1-NEXT:    vfncvt.rtz.xu.f.w v10, v11
; LMULMAX1-NEXT:    vand.vi v10, v10, 1
; LMULMAX1-NEXT:    vmsne.vi v0, v10, 0
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf8, ta, mu
; LMULMAX1-NEXT:    vmerge.vim v8, v8, 1, v0
; LMULMAX1-NEXT:    vsetivli zero, 8, e8, mf2, tu, mu
; LMULMAX1-NEXT:    vslideup.vi v9, v8, 6
; LMULMAX1-NEXT:    vsetvli zero, zero, e8, mf2, ta, mu
; LMULMAX1-NEXT:    vmsne.vi v0, v9, 0
; LMULMAX1-NEXT:    ret
  %z = fptoui <8 x double> %x to <8 x i1>
  ret <8 x i1> %z
}
