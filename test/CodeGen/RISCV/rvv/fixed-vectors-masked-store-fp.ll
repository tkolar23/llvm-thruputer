; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+m,+experimental-v,+f,+d,+zfh -riscv-v-vector-bits-min=128 -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK,RV32
; RUN: llc -mtriple=riscv64 -mattr=+m,+experimental-v,+f,+d,+zfh -riscv-v-vector-bits-min=128 -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK,RV64

define void @masked_store_v1f16(<1 x half>* %val_ptr, <1 x half>* %a, <1 x half>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v1f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 1, e16, mf4, ta, mu
; CHECK-NEXT:    vle16.v v8, (a2)
; CHECK-NEXT:    vle16.v v9, (a0)
; CHECK-NEXT:    fmv.h.x ft0, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, ft0
; CHECK-NEXT:    vse16.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <1 x half>, <1 x half>* %m_ptr
  %mask = fcmp oeq <1 x half> %m, zeroinitializer
  %val = load <1 x half>, <1 x half>* %val_ptr
  call void @llvm.masked.store.v1f16.p0v1f16(<1 x half> %val, <1 x half>* %a, i32 8, <1 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v1f16.p0v1f16(<1 x half>, <1 x half>*, i32, <1 x i1>)

define void @masked_store_v1f32(<1 x float>* %val_ptr, <1 x float>* %a, <1 x float>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v1f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 1, e32, mf2, ta, mu
; CHECK-NEXT:    vle32.v v8, (a2)
; CHECK-NEXT:    vle32.v v9, (a0)
; CHECK-NEXT:    fmv.w.x ft0, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, ft0
; CHECK-NEXT:    vse32.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <1 x float>, <1 x float>* %m_ptr
  %mask = fcmp oeq <1 x float> %m, zeroinitializer
  %val = load <1 x float>, <1 x float>* %val_ptr
  call void @llvm.masked.store.v1f32.p0v1f32(<1 x float> %val, <1 x float>* %a, i32 8, <1 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v1f32.p0v1f32(<1 x float>, <1 x float>*, i32, <1 x i1>)

define void @masked_store_v1f64(<1 x double>* %val_ptr, <1 x double>* %a, <1 x double>* %m_ptr) nounwind {
; RV32-LABEL: masked_store_v1f64:
; RV32:       # %bb.0:
; RV32-NEXT:    vsetivli zero, 1, e64, m1, ta, mu
; RV32-NEXT:    vle64.v v8, (a2)
; RV32-NEXT:    vle64.v v9, (a0)
; RV32-NEXT:    fcvt.d.w ft0, zero
; RV32-NEXT:    vmfeq.vf v0, v8, ft0
; RV32-NEXT:    vse64.v v9, (a1), v0.t
; RV32-NEXT:    ret
;
; RV64-LABEL: masked_store_v1f64:
; RV64:       # %bb.0:
; RV64-NEXT:    vsetivli zero, 1, e64, m1, ta, mu
; RV64-NEXT:    vle64.v v8, (a2)
; RV64-NEXT:    vle64.v v9, (a0)
; RV64-NEXT:    fmv.d.x ft0, zero
; RV64-NEXT:    vmfeq.vf v0, v8, ft0
; RV64-NEXT:    vse64.v v9, (a1), v0.t
; RV64-NEXT:    ret
  %m = load <1 x double>, <1 x double>* %m_ptr
  %mask = fcmp oeq <1 x double> %m, zeroinitializer
  %val = load <1 x double>, <1 x double>* %val_ptr
  call void @llvm.masked.store.v1f64.p0v1f64(<1 x double> %val, <1 x double>* %a, i32 8, <1 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v1f64.p0v1f64(<1 x double>, <1 x double>*, i32, <1 x i1>)

define void @masked_store_v2f16(<2 x half>* %val_ptr, <2 x half>* %a, <2 x half>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v2f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e16, mf4, ta, mu
; CHECK-NEXT:    vle16.v v8, (a2)
; CHECK-NEXT:    vle16.v v9, (a0)
; CHECK-NEXT:    fmv.h.x ft0, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, ft0
; CHECK-NEXT:    vse16.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <2 x half>, <2 x half>* %m_ptr
  %mask = fcmp oeq <2 x half> %m, zeroinitializer
  %val = load <2 x half>, <2 x half>* %val_ptr
  call void @llvm.masked.store.v2f16.p0v2f16(<2 x half> %val, <2 x half>* %a, i32 8, <2 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v2f16.p0v2f16(<2 x half>, <2 x half>*, i32, <2 x i1>)

define void @masked_store_v2f32(<2 x float>* %val_ptr, <2 x float>* %a, <2 x float>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v2f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; CHECK-NEXT:    vle32.v v8, (a2)
; CHECK-NEXT:    vle32.v v9, (a0)
; CHECK-NEXT:    fmv.w.x ft0, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, ft0
; CHECK-NEXT:    vse32.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <2 x float>, <2 x float>* %m_ptr
  %mask = fcmp oeq <2 x float> %m, zeroinitializer
  %val = load <2 x float>, <2 x float>* %val_ptr
  call void @llvm.masked.store.v2f32.p0v2f32(<2 x float> %val, <2 x float>* %a, i32 8, <2 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v2f32.p0v2f32(<2 x float>, <2 x float>*, i32, <2 x i1>)

define void @masked_store_v2f64(<2 x double>* %val_ptr, <2 x double>* %a, <2 x double>* %m_ptr) nounwind {
; RV32-LABEL: masked_store_v2f64:
; RV32:       # %bb.0:
; RV32-NEXT:    vsetivli zero, 2, e64, m1, ta, mu
; RV32-NEXT:    vle64.v v8, (a2)
; RV32-NEXT:    vle64.v v9, (a0)
; RV32-NEXT:    fcvt.d.w ft0, zero
; RV32-NEXT:    vmfeq.vf v0, v8, ft0
; RV32-NEXT:    vse64.v v9, (a1), v0.t
; RV32-NEXT:    ret
;
; RV64-LABEL: masked_store_v2f64:
; RV64:       # %bb.0:
; RV64-NEXT:    vsetivli zero, 2, e64, m1, ta, mu
; RV64-NEXT:    vle64.v v8, (a2)
; RV64-NEXT:    vle64.v v9, (a0)
; RV64-NEXT:    fmv.d.x ft0, zero
; RV64-NEXT:    vmfeq.vf v0, v8, ft0
; RV64-NEXT:    vse64.v v9, (a1), v0.t
; RV64-NEXT:    ret
  %m = load <2 x double>, <2 x double>* %m_ptr
  %mask = fcmp oeq <2 x double> %m, zeroinitializer
  %val = load <2 x double>, <2 x double>* %val_ptr
  call void @llvm.masked.store.v2f64.p0v2f64(<2 x double> %val, <2 x double>* %a, i32 8, <2 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v2f64.p0v2f64(<2 x double>, <2 x double>*, i32, <2 x i1>)

define void @masked_store_v4f16(<4 x half>* %val_ptr, <4 x half>* %a, <4 x half>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v4f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e16, mf2, ta, mu
; CHECK-NEXT:    vle16.v v8, (a2)
; CHECK-NEXT:    vle16.v v9, (a0)
; CHECK-NEXT:    fmv.h.x ft0, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, ft0
; CHECK-NEXT:    vse16.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <4 x half>, <4 x half>* %m_ptr
  %mask = fcmp oeq <4 x half> %m, zeroinitializer
  %val = load <4 x half>, <4 x half>* %val_ptr
  call void @llvm.masked.store.v4f16.p0v4f16(<4 x half> %val, <4 x half>* %a, i32 8, <4 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v4f16.p0v4f16(<4 x half>, <4 x half>*, i32, <4 x i1>)

define void @masked_store_v4f32(<4 x float>* %val_ptr, <4 x float>* %a, <4 x float>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v4f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, mu
; CHECK-NEXT:    vle32.v v8, (a2)
; CHECK-NEXT:    vle32.v v9, (a0)
; CHECK-NEXT:    fmv.w.x ft0, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, ft0
; CHECK-NEXT:    vse32.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <4 x float>, <4 x float>* %m_ptr
  %mask = fcmp oeq <4 x float> %m, zeroinitializer
  %val = load <4 x float>, <4 x float>* %val_ptr
  call void @llvm.masked.store.v4f32.p0v4f32(<4 x float> %val, <4 x float>* %a, i32 8, <4 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v4f32.p0v4f32(<4 x float>, <4 x float>*, i32, <4 x i1>)

define void @masked_store_v4f64(<4 x double>* %val_ptr, <4 x double>* %a, <4 x double>* %m_ptr) nounwind {
; RV32-LABEL: masked_store_v4f64:
; RV32:       # %bb.0:
; RV32-NEXT:    vsetivli zero, 4, e64, m2, ta, mu
; RV32-NEXT:    vle64.v v8, (a2)
; RV32-NEXT:    vle64.v v10, (a0)
; RV32-NEXT:    fcvt.d.w ft0, zero
; RV32-NEXT:    vmfeq.vf v0, v8, ft0
; RV32-NEXT:    vse64.v v10, (a1), v0.t
; RV32-NEXT:    ret
;
; RV64-LABEL: masked_store_v4f64:
; RV64:       # %bb.0:
; RV64-NEXT:    vsetivli zero, 4, e64, m2, ta, mu
; RV64-NEXT:    vle64.v v8, (a2)
; RV64-NEXT:    vle64.v v10, (a0)
; RV64-NEXT:    fmv.d.x ft0, zero
; RV64-NEXT:    vmfeq.vf v0, v8, ft0
; RV64-NEXT:    vse64.v v10, (a1), v0.t
; RV64-NEXT:    ret
  %m = load <4 x double>, <4 x double>* %m_ptr
  %mask = fcmp oeq <4 x double> %m, zeroinitializer
  %val = load <4 x double>, <4 x double>* %val_ptr
  call void @llvm.masked.store.v4f64.p0v4f64(<4 x double> %val, <4 x double>* %a, i32 8, <4 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v4f64.p0v4f64(<4 x double>, <4 x double>*, i32, <4 x i1>)

define void @masked_store_v8f16(<8 x half>* %val_ptr, <8 x half>* %a, <8 x half>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v8f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e16, m1, ta, mu
; CHECK-NEXT:    vle16.v v8, (a2)
; CHECK-NEXT:    vle16.v v9, (a0)
; CHECK-NEXT:    fmv.h.x ft0, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, ft0
; CHECK-NEXT:    vse16.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <8 x half>, <8 x half>* %m_ptr
  %mask = fcmp oeq <8 x half> %m, zeroinitializer
  %val = load <8 x half>, <8 x half>* %val_ptr
  call void @llvm.masked.store.v8f16.p0v8f16(<8 x half> %val, <8 x half>* %a, i32 8, <8 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v8f16.p0v8f16(<8 x half>, <8 x half>*, i32, <8 x i1>)

define void @masked_store_v8f32(<8 x float>* %val_ptr, <8 x float>* %a, <8 x float>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v8f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e32, m2, ta, mu
; CHECK-NEXT:    vle32.v v8, (a2)
; CHECK-NEXT:    vle32.v v10, (a0)
; CHECK-NEXT:    fmv.w.x ft0, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, ft0
; CHECK-NEXT:    vse32.v v10, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <8 x float>, <8 x float>* %m_ptr
  %mask = fcmp oeq <8 x float> %m, zeroinitializer
  %val = load <8 x float>, <8 x float>* %val_ptr
  call void @llvm.masked.store.v8f32.p0v8f32(<8 x float> %val, <8 x float>* %a, i32 8, <8 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v8f32.p0v8f32(<8 x float>, <8 x float>*, i32, <8 x i1>)

define void @masked_store_v8f64(<8 x double>* %val_ptr, <8 x double>* %a, <8 x double>* %m_ptr) nounwind {
; RV32-LABEL: masked_store_v8f64:
; RV32:       # %bb.0:
; RV32-NEXT:    vsetivli zero, 8, e64, m4, ta, mu
; RV32-NEXT:    vle64.v v8, (a2)
; RV32-NEXT:    vle64.v v12, (a0)
; RV32-NEXT:    fcvt.d.w ft0, zero
; RV32-NEXT:    vmfeq.vf v0, v8, ft0
; RV32-NEXT:    vse64.v v12, (a1), v0.t
; RV32-NEXT:    ret
;
; RV64-LABEL: masked_store_v8f64:
; RV64:       # %bb.0:
; RV64-NEXT:    vsetivli zero, 8, e64, m4, ta, mu
; RV64-NEXT:    vle64.v v8, (a2)
; RV64-NEXT:    vle64.v v12, (a0)
; RV64-NEXT:    fmv.d.x ft0, zero
; RV64-NEXT:    vmfeq.vf v0, v8, ft0
; RV64-NEXT:    vse64.v v12, (a1), v0.t
; RV64-NEXT:    ret
  %m = load <8 x double>, <8 x double>* %m_ptr
  %mask = fcmp oeq <8 x double> %m, zeroinitializer
  %val = load <8 x double>, <8 x double>* %val_ptr
  call void @llvm.masked.store.v8f64.p0v8f64(<8 x double> %val, <8 x double>* %a, i32 8, <8 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v8f64.p0v8f64(<8 x double>, <8 x double>*, i32, <8 x i1>)

define void @masked_store_v16f16(<16 x half>* %val_ptr, <16 x half>* %a, <16 x half>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v16f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e16, m2, ta, mu
; CHECK-NEXT:    vle16.v v8, (a2)
; CHECK-NEXT:    vle16.v v10, (a0)
; CHECK-NEXT:    fmv.h.x ft0, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, ft0
; CHECK-NEXT:    vse16.v v10, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <16 x half>, <16 x half>* %m_ptr
  %mask = fcmp oeq <16 x half> %m, zeroinitializer
  %val = load <16 x half>, <16 x half>* %val_ptr
  call void @llvm.masked.store.v16f16.p0v16f16(<16 x half> %val, <16 x half>* %a, i32 8, <16 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v16f16.p0v16f16(<16 x half>, <16 x half>*, i32, <16 x i1>)

define void @masked_store_v16f32(<16 x float>* %val_ptr, <16 x float>* %a, <16 x float>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v16f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e32, m4, ta, mu
; CHECK-NEXT:    vle32.v v8, (a2)
; CHECK-NEXT:    vle32.v v12, (a0)
; CHECK-NEXT:    fmv.w.x ft0, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, ft0
; CHECK-NEXT:    vse32.v v12, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <16 x float>, <16 x float>* %m_ptr
  %mask = fcmp oeq <16 x float> %m, zeroinitializer
  %val = load <16 x float>, <16 x float>* %val_ptr
  call void @llvm.masked.store.v16f32.p0v16f32(<16 x float> %val, <16 x float>* %a, i32 8, <16 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v16f32.p0v16f32(<16 x float>, <16 x float>*, i32, <16 x i1>)

define void @masked_store_v16f64(<16 x double>* %val_ptr, <16 x double>* %a, <16 x double>* %m_ptr) nounwind {
; RV32-LABEL: masked_store_v16f64:
; RV32:       # %bb.0:
; RV32-NEXT:    vsetivli zero, 16, e64, m8, ta, mu
; RV32-NEXT:    vle64.v v8, (a2)
; RV32-NEXT:    vle64.v v16, (a0)
; RV32-NEXT:    fcvt.d.w ft0, zero
; RV32-NEXT:    vmfeq.vf v0, v8, ft0
; RV32-NEXT:    vse64.v v16, (a1), v0.t
; RV32-NEXT:    ret
;
; RV64-LABEL: masked_store_v16f64:
; RV64:       # %bb.0:
; RV64-NEXT:    vsetivli zero, 16, e64, m8, ta, mu
; RV64-NEXT:    vle64.v v8, (a2)
; RV64-NEXT:    vle64.v v16, (a0)
; RV64-NEXT:    fmv.d.x ft0, zero
; RV64-NEXT:    vmfeq.vf v0, v8, ft0
; RV64-NEXT:    vse64.v v16, (a1), v0.t
; RV64-NEXT:    ret
  %m = load <16 x double>, <16 x double>* %m_ptr
  %mask = fcmp oeq <16 x double> %m, zeroinitializer
  %val = load <16 x double>, <16 x double>* %val_ptr
  call void @llvm.masked.store.v16f64.p0v16f64(<16 x double> %val, <16 x double>* %a, i32 8, <16 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v16f64.p0v16f64(<16 x double>, <16 x double>*, i32, <16 x i1>)

define void @masked_store_v32f16(<32 x half>* %val_ptr, <32 x half>* %a, <32 x half>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v32f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a3, 32
; CHECK-NEXT:    vsetvli zero, a3, e16, m4, ta, mu
; CHECK-NEXT:    vle16.v v8, (a2)
; CHECK-NEXT:    vle16.v v12, (a0)
; CHECK-NEXT:    fmv.h.x ft0, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, ft0
; CHECK-NEXT:    vse16.v v12, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <32 x half>, <32 x half>* %m_ptr
  %mask = fcmp oeq <32 x half> %m, zeroinitializer
  %val = load <32 x half>, <32 x half>* %val_ptr
  call void @llvm.masked.store.v32f16.p0v32f16(<32 x half> %val, <32 x half>* %a, i32 8, <32 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v32f16.p0v32f16(<32 x half>, <32 x half>*, i32, <32 x i1>)

define void @masked_store_v32f32(<32 x float>* %val_ptr, <32 x float>* %a, <32 x float>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v32f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a3, 32
; CHECK-NEXT:    vsetvli zero, a3, e32, m8, ta, mu
; CHECK-NEXT:    vle32.v v8, (a2)
; CHECK-NEXT:    vle32.v v16, (a0)
; CHECK-NEXT:    fmv.w.x ft0, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, ft0
; CHECK-NEXT:    vse32.v v16, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <32 x float>, <32 x float>* %m_ptr
  %mask = fcmp oeq <32 x float> %m, zeroinitializer
  %val = load <32 x float>, <32 x float>* %val_ptr
  call void @llvm.masked.store.v32f32.p0v32f32(<32 x float> %val, <32 x float>* %a, i32 8, <32 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v32f32.p0v32f32(<32 x float>, <32 x float>*, i32, <32 x i1>)

define void @masked_store_v32f64(<32 x double>* %val_ptr, <32 x double>* %a, <32 x double>* %m_ptr) nounwind {
; RV32-LABEL: masked_store_v32f64:
; RV32:       # %bb.0:
; RV32-NEXT:    addi sp, sp, -16
; RV32-NEXT:    csrr a3, vlenb
; RV32-NEXT:    slli a3, a3, 4
; RV32-NEXT:    sub sp, sp, a3
; RV32-NEXT:    vsetivli zero, 16, e64, m8, ta, mu
; RV32-NEXT:    vle64.v v8, (a2)
; RV32-NEXT:    addi a2, a2, 128
; RV32-NEXT:    vle64.v v16, (a2)
; RV32-NEXT:    csrr a2, vlenb
; RV32-NEXT:    slli a2, a2, 3
; RV32-NEXT:    add a2, sp, a2
; RV32-NEXT:    addi a2, a2, 16
; RV32-NEXT:    vs8r.v v16, (a2) # Unknown-size Folded Spill
; RV32-NEXT:    fcvt.d.w ft0, zero
; RV32-NEXT:    vmfeq.vf v0, v8, ft0
; RV32-NEXT:    vle64.v v24, (a0)
; RV32-NEXT:    addi a0, a0, 128
; RV32-NEXT:    vle64.v v8, (a0)
; RV32-NEXT:    addi a0, sp, 16
; RV32-NEXT:    vs8r.v v8, (a0) # Unknown-size Folded Spill
; RV32-NEXT:    csrr a0, vlenb
; RV32-NEXT:    slli a0, a0, 3
; RV32-NEXT:    add a0, sp, a0
; RV32-NEXT:    addi a0, a0, 16
; RV32-NEXT:    vl8re8.v v16, (a0) # Unknown-size Folded Reload
; RV32-NEXT:    vmfeq.vf v8, v16, ft0
; RV32-NEXT:    vse64.v v24, (a1), v0.t
; RV32-NEXT:    addi a0, a1, 128
; RV32-NEXT:    vmv1r.v v0, v8
; RV32-NEXT:    addi a1, sp, 16
; RV32-NEXT:    vl8re8.v v8, (a1) # Unknown-size Folded Reload
; RV32-NEXT:    vse64.v v8, (a0), v0.t
; RV32-NEXT:    csrr a0, vlenb
; RV32-NEXT:    slli a0, a0, 4
; RV32-NEXT:    add sp, sp, a0
; RV32-NEXT:    addi sp, sp, 16
; RV32-NEXT:    ret
;
; RV64-LABEL: masked_store_v32f64:
; RV64:       # %bb.0:
; RV64-NEXT:    addi sp, sp, -16
; RV64-NEXT:    csrr a3, vlenb
; RV64-NEXT:    slli a3, a3, 4
; RV64-NEXT:    sub sp, sp, a3
; RV64-NEXT:    vsetivli zero, 16, e64, m8, ta, mu
; RV64-NEXT:    vle64.v v8, (a2)
; RV64-NEXT:    addi a2, a2, 128
; RV64-NEXT:    vle64.v v16, (a2)
; RV64-NEXT:    csrr a2, vlenb
; RV64-NEXT:    slli a2, a2, 3
; RV64-NEXT:    add a2, sp, a2
; RV64-NEXT:    addi a2, a2, 16
; RV64-NEXT:    vs8r.v v16, (a2) # Unknown-size Folded Spill
; RV64-NEXT:    fmv.d.x ft0, zero
; RV64-NEXT:    vmfeq.vf v0, v8, ft0
; RV64-NEXT:    vle64.v v24, (a0)
; RV64-NEXT:    addi a0, a0, 128
; RV64-NEXT:    vle64.v v8, (a0)
; RV64-NEXT:    addi a0, sp, 16
; RV64-NEXT:    vs8r.v v8, (a0) # Unknown-size Folded Spill
; RV64-NEXT:    csrr a0, vlenb
; RV64-NEXT:    slli a0, a0, 3
; RV64-NEXT:    add a0, sp, a0
; RV64-NEXT:    addi a0, a0, 16
; RV64-NEXT:    vl8re8.v v16, (a0) # Unknown-size Folded Reload
; RV64-NEXT:    vmfeq.vf v8, v16, ft0
; RV64-NEXT:    vse64.v v24, (a1), v0.t
; RV64-NEXT:    addi a0, a1, 128
; RV64-NEXT:    vmv1r.v v0, v8
; RV64-NEXT:    addi a1, sp, 16
; RV64-NEXT:    vl8re8.v v8, (a1) # Unknown-size Folded Reload
; RV64-NEXT:    vse64.v v8, (a0), v0.t
; RV64-NEXT:    csrr a0, vlenb
; RV64-NEXT:    slli a0, a0, 4
; RV64-NEXT:    add sp, sp, a0
; RV64-NEXT:    addi sp, sp, 16
; RV64-NEXT:    ret
  %m = load <32 x double>, <32 x double>* %m_ptr
  %mask = fcmp oeq <32 x double> %m, zeroinitializer
  %val = load <32 x double>, <32 x double>* %val_ptr
  call void @llvm.masked.store.v32f32.p0v32f64(<32 x double> %val, <32 x double>* %a, i32 8, <32 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v32f32.p0v32f64(<32 x double>, <32 x double>*, i32, <32 x i1>)

define void @masked_store_v64f16(<64 x half>* %val_ptr, <64 x half>* %a, <64 x half>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v64f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a3, 64
; CHECK-NEXT:    vsetvli zero, a3, e16, m8, ta, mu
; CHECK-NEXT:    vle16.v v8, (a2)
; CHECK-NEXT:    vle16.v v16, (a0)
; CHECK-NEXT:    fmv.h.x ft0, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, ft0
; CHECK-NEXT:    vse16.v v16, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <64 x half>, <64 x half>* %m_ptr
  %mask = fcmp oeq <64 x half> %m, zeroinitializer
  %val = load <64 x half>, <64 x half>* %val_ptr
  call void @llvm.masked.store.v64f16.p0v64f16(<64 x half> %val, <64 x half>* %a, i32 8, <64 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v64f16.p0v64f16(<64 x half>, <64 x half>*, i32, <64 x i1>)

define void @masked_store_v64f32(<64 x float>* %val_ptr, <64 x float>* %a, <64 x float>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v64f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi sp, sp, -16
; CHECK-NEXT:    csrr a3, vlenb
; CHECK-NEXT:    slli a3, a3, 4
; CHECK-NEXT:    sub sp, sp, a3
; CHECK-NEXT:    li a3, 32
; CHECK-NEXT:    vsetvli zero, a3, e32, m8, ta, mu
; CHECK-NEXT:    vle32.v v8, (a2)
; CHECK-NEXT:    addi a2, a2, 128
; CHECK-NEXT:    vle32.v v16, (a2)
; CHECK-NEXT:    csrr a2, vlenb
; CHECK-NEXT:    slli a2, a2, 3
; CHECK-NEXT:    add a2, sp, a2
; CHECK-NEXT:    addi a2, a2, 16
; CHECK-NEXT:    vs8r.v v16, (a2) # Unknown-size Folded Spill
; CHECK-NEXT:    fmv.w.x ft0, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, ft0
; CHECK-NEXT:    vle32.v v24, (a0)
; CHECK-NEXT:    addi a0, a0, 128
; CHECK-NEXT:    vle32.v v8, (a0)
; CHECK-NEXT:    addi a0, sp, 16
; CHECK-NEXT:    vs8r.v v8, (a0) # Unknown-size Folded Spill
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 3
; CHECK-NEXT:    add a0, sp, a0
; CHECK-NEXT:    addi a0, a0, 16
; CHECK-NEXT:    vl8re8.v v16, (a0) # Unknown-size Folded Reload
; CHECK-NEXT:    vmfeq.vf v8, v16, ft0
; CHECK-NEXT:    vse32.v v24, (a1), v0.t
; CHECK-NEXT:    addi a0, a1, 128
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    addi a1, sp, 16
; CHECK-NEXT:    vl8re8.v v8, (a1) # Unknown-size Folded Reload
; CHECK-NEXT:    vse32.v v8, (a0), v0.t
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 4
; CHECK-NEXT:    add sp, sp, a0
; CHECK-NEXT:    addi sp, sp, 16
; CHECK-NEXT:    ret
  %m = load <64 x float>, <64 x float>* %m_ptr
  %mask = fcmp oeq <64 x float> %m, zeroinitializer
  %val = load <64 x float>, <64 x float>* %val_ptr
  call void @llvm.masked.store.v64f16.p0v64f32(<64 x float> %val, <64 x float>* %a, i32 8, <64 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v64f16.p0v64f32(<64 x float>, <64 x float>*, i32, <64 x i1>)

define void @masked_store_v128f16(<128 x half>* %val_ptr, <128 x half>* %a, <128 x half>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v128f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi sp, sp, -16
; CHECK-NEXT:    csrr a3, vlenb
; CHECK-NEXT:    slli a3, a3, 4
; CHECK-NEXT:    sub sp, sp, a3
; CHECK-NEXT:    li a3, 64
; CHECK-NEXT:    vsetvli zero, a3, e16, m8, ta, mu
; CHECK-NEXT:    vle16.v v8, (a2)
; CHECK-NEXT:    addi a2, a2, 128
; CHECK-NEXT:    vle16.v v16, (a2)
; CHECK-NEXT:    csrr a2, vlenb
; CHECK-NEXT:    slli a2, a2, 3
; CHECK-NEXT:    add a2, sp, a2
; CHECK-NEXT:    addi a2, a2, 16
; CHECK-NEXT:    vs8r.v v16, (a2) # Unknown-size Folded Spill
; CHECK-NEXT:    fmv.h.x ft0, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, ft0
; CHECK-NEXT:    vle16.v v24, (a0)
; CHECK-NEXT:    addi a0, a0, 128
; CHECK-NEXT:    vle16.v v8, (a0)
; CHECK-NEXT:    addi a0, sp, 16
; CHECK-NEXT:    vs8r.v v8, (a0) # Unknown-size Folded Spill
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 3
; CHECK-NEXT:    add a0, sp, a0
; CHECK-NEXT:    addi a0, a0, 16
; CHECK-NEXT:    vl8re8.v v16, (a0) # Unknown-size Folded Reload
; CHECK-NEXT:    vmfeq.vf v8, v16, ft0
; CHECK-NEXT:    vse16.v v24, (a1), v0.t
; CHECK-NEXT:    addi a0, a1, 128
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    addi a1, sp, 16
; CHECK-NEXT:    vl8re8.v v8, (a1) # Unknown-size Folded Reload
; CHECK-NEXT:    vse16.v v8, (a0), v0.t
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 4
; CHECK-NEXT:    add sp, sp, a0
; CHECK-NEXT:    addi sp, sp, 16
; CHECK-NEXT:    ret
  %m = load <128 x half>, <128 x half>* %m_ptr
  %mask = fcmp oeq <128 x half> %m, zeroinitializer
  %val = load <128 x half>, <128 x half>* %val_ptr
  call void @llvm.masked.store.v128f16.p0v128f16(<128 x half> %val, <128 x half>* %a, i32 8, <128 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v128f16.p0v128f16(<128 x half>, <128 x half>*, i32, <128 x i1>)
