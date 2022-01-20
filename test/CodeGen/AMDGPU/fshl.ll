; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -march=amdgcn -mcpu=tahiti -verify-machineinstrs | FileCheck %s --check-prefix=SI
; RUN: llc < %s -march=amdgcn -mcpu=tonga  -verify-machineinstrs | FileCheck %s --check-prefix=VI
; RUN: llc < %s -march=amdgcn -mcpu=gfx900 -verify-machineinstrs | FileCheck %s --check-prefix=GFX9
; RUN: llc < %s -march=r600 -mcpu=redwood  -verify-machineinstrs | FileCheck %s --check-prefix=R600
; RUN: llc < %s -march=amdgcn -mcpu=gfx1010 -verify-machineinstrs | FileCheck %s --check-prefix=GFX10

declare i32 @llvm.fshl.i32(i32, i32, i32) nounwind readnone
declare <2 x i32> @llvm.fshl.v2i32(<2 x i32>, <2 x i32>, <2 x i32>) nounwind readnone
declare <4 x i32> @llvm.fshl.v4i32(<4 x i32>, <4 x i32>, <4 x i32>) nounwind readnone

define amdgpu_kernel void @fshl_i32(i32 addrspace(1)* %in, i32 %x, i32 %y, i32 %z) {
; SI-LABEL: fshl_i32:
; SI:       ; %bb.0: ; %entry
; SI-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0xb
; SI-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x9
; SI-NEXT:    s_load_dword s0, s[0:1], 0xd
; SI-NEXT:    s_mov_b32 s7, 0xf000
; SI-NEXT:    s_mov_b32 s6, -1
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    v_mov_b32_e32 v0, s3
; SI-NEXT:    v_alignbit_b32 v0, s2, v0, 1
; SI-NEXT:    s_not_b32 s0, s0
; SI-NEXT:    s_lshr_b32 s1, s2, 1
; SI-NEXT:    v_mov_b32_e32 v1, s0
; SI-NEXT:    v_alignbit_b32 v0, s1, v0, v1
; SI-NEXT:    buffer_store_dword v0, off, s[4:7], 0
; SI-NEXT:    s_endpgm
;
; VI-LABEL: fshl_i32:
; VI:       ; %bb.0: ; %entry
; VI-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x2c
; VI-NEXT:    s_load_dword s4, s[0:1], 0x34
; VI-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0x24
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    v_mov_b32_e32 v0, s3
; VI-NEXT:    s_not_b32 s4, s4
; VI-NEXT:    s_lshr_b32 s3, s2, 1
; VI-NEXT:    v_alignbit_b32 v0, s2, v0, 1
; VI-NEXT:    v_mov_b32_e32 v1, s4
; VI-NEXT:    v_alignbit_b32 v2, s3, v0, v1
; VI-NEXT:    v_mov_b32_e32 v0, s0
; VI-NEXT:    v_mov_b32_e32 v1, s1
; VI-NEXT:    flat_store_dword v[0:1], v2
; VI-NEXT:    s_endpgm
;
; GFX9-LABEL: fshl_i32:
; GFX9:       ; %bb.0: ; %entry
; GFX9-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x2c
; GFX9-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x24
; GFX9-NEXT:    s_load_dword s6, s[0:1], 0x34
; GFX9-NEXT:    v_mov_b32_e32 v0, 0
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    v_mov_b32_e32 v1, s3
; GFX9-NEXT:    s_lshr_b32 s0, s2, 1
; GFX9-NEXT:    s_not_b32 s1, s6
; GFX9-NEXT:    v_alignbit_b32 v1, s2, v1, 1
; GFX9-NEXT:    v_mov_b32_e32 v2, s1
; GFX9-NEXT:    v_alignbit_b32 v1, s0, v1, v2
; GFX9-NEXT:    global_store_dword v0, v1, s[4:5]
; GFX9-NEXT:    s_endpgm
;
; R600-LABEL: fshl_i32:
; R600:       ; %bb.0: ; %entry
; R600-NEXT:    ALU 5, @4, KC0[CB0:0-32], KC1[]
; R600-NEXT:    MEM_RAT_CACHELESS STORE_RAW T0.X, T1.X, 1
; R600-NEXT:    CF_END
; R600-NEXT:    PAD
; R600-NEXT:    ALU clause starting at 4:
; R600-NEXT:     LSHR T0.Z, KC0[2].Z, 1,
; R600-NEXT:     BIT_ALIGN_INT T0.W, KC0[2].Z, KC0[2].W, 1,
; R600-NEXT:     NOT_INT * T1.W, KC0[3].X,
; R600-NEXT:     BIT_ALIGN_INT T0.X, PV.Z, PV.W, PS,
; R600-NEXT:     LSHR * T1.X, KC0[2].Y, literal.x,
; R600-NEXT:    2(2.802597e-45), 0(0.000000e+00)
;
; GFX10-LABEL: fshl_i32:
; GFX10:       ; %bb.0: ; %entry
; GFX10-NEXT:    s_clause 0x2
; GFX10-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x2c
; GFX10-NEXT:    s_load_dword s6, s[0:1], 0x34
; GFX10-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x24
; GFX10-NEXT:    v_mov_b32_e32 v1, 0
; GFX10-NEXT:    s_waitcnt lgkmcnt(0)
; GFX10-NEXT:    v_alignbit_b32 v0, s2, s3, 1
; GFX10-NEXT:    s_lshr_b32 s0, s2, 1
; GFX10-NEXT:    s_not_b32 s1, s6
; GFX10-NEXT:    v_alignbit_b32 v0, s0, v0, s1
; GFX10-NEXT:    global_store_dword v1, v0, s[4:5]
; GFX10-NEXT:    s_endpgm
entry:
  %0 = call i32 @llvm.fshl.i32(i32 %x, i32 %y, i32 %z)
  store i32 %0, i32 addrspace(1)* %in
  ret void
}

define amdgpu_kernel void @fshl_i32_imm(i32 addrspace(1)* %in, i32 %x, i32 %y) {
; SI-LABEL: fshl_i32_imm:
; SI:       ; %bb.0: ; %entry
; SI-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0xb
; SI-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0x9
; SI-NEXT:    s_mov_b32 s3, 0xf000
; SI-NEXT:    s_mov_b32 s2, -1
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    v_mov_b32_e32 v0, s5
; SI-NEXT:    v_alignbit_b32 v0, s4, v0, 25
; SI-NEXT:    buffer_store_dword v0, off, s[0:3], 0
; SI-NEXT:    s_endpgm
;
; VI-LABEL: fshl_i32_imm:
; VI:       ; %bb.0: ; %entry
; VI-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x2c
; VI-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0x24
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    v_mov_b32_e32 v0, s3
; VI-NEXT:    v_alignbit_b32 v2, s2, v0, 25
; VI-NEXT:    v_mov_b32_e32 v0, s0
; VI-NEXT:    v_mov_b32_e32 v1, s1
; VI-NEXT:    flat_store_dword v[0:1], v2
; VI-NEXT:    s_endpgm
;
; GFX9-LABEL: fshl_i32_imm:
; GFX9:       ; %bb.0: ; %entry
; GFX9-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x2c
; GFX9-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x24
; GFX9-NEXT:    v_mov_b32_e32 v0, 0
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    v_mov_b32_e32 v1, s3
; GFX9-NEXT:    v_alignbit_b32 v1, s2, v1, 25
; GFX9-NEXT:    global_store_dword v0, v1, s[4:5]
; GFX9-NEXT:    s_endpgm
;
; R600-LABEL: fshl_i32_imm:
; R600:       ; %bb.0: ; %entry
; R600-NEXT:    ALU 3, @4, KC0[CB0:0-32], KC1[]
; R600-NEXT:    MEM_RAT_CACHELESS STORE_RAW T1.X, T0.X, 1
; R600-NEXT:    CF_END
; R600-NEXT:    PAD
; R600-NEXT:    ALU clause starting at 4:
; R600-NEXT:     LSHR * T0.X, KC0[2].Y, literal.x,
; R600-NEXT:    2(2.802597e-45), 0(0.000000e+00)
; R600-NEXT:     BIT_ALIGN_INT * T1.X, KC0[2].Z, KC0[2].W, literal.x,
; R600-NEXT:    25(3.503246e-44), 0(0.000000e+00)
;
; GFX10-LABEL: fshl_i32_imm:
; GFX10:       ; %bb.0: ; %entry
; GFX10-NEXT:    s_clause 0x1
; GFX10-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x2c
; GFX10-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x24
; GFX10-NEXT:    v_mov_b32_e32 v0, 0
; GFX10-NEXT:    s_waitcnt lgkmcnt(0)
; GFX10-NEXT:    v_alignbit_b32 v1, s2, s3, 25
; GFX10-NEXT:    global_store_dword v0, v1, s[4:5]
; GFX10-NEXT:    s_endpgm
entry:
  %0 = call i32 @llvm.fshl.i32(i32 %x, i32 %y, i32 7)
  store i32 %0, i32 addrspace(1)* %in
  ret void
}

define amdgpu_kernel void @fshl_v2i32(<2 x i32> addrspace(1)* %in, <2 x i32> %x, <2 x i32> %y, <2 x i32> %z) {
; SI-LABEL: fshl_v2i32:
; SI:       ; %bb.0: ; %entry
; SI-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0xd
; SI-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x9
; SI-NEXT:    s_load_dwordx2 s[8:9], s[0:1], 0xb
; SI-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0xf
; SI-NEXT:    s_mov_b32 s7, 0xf000
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    v_mov_b32_e32 v0, s3
; SI-NEXT:    s_mov_b32 s6, -1
; SI-NEXT:    v_alignbit_b32 v0, s9, v0, 1
; SI-NEXT:    s_not_b32 s1, s1
; SI-NEXT:    s_lshr_b32 s3, s9, 1
; SI-NEXT:    v_mov_b32_e32 v1, s1
; SI-NEXT:    v_alignbit_b32 v1, s3, v0, v1
; SI-NEXT:    v_mov_b32_e32 v0, s2
; SI-NEXT:    s_not_b32 s0, s0
; SI-NEXT:    v_alignbit_b32 v0, s8, v0, 1
; SI-NEXT:    s_lshr_b32 s1, s8, 1
; SI-NEXT:    v_mov_b32_e32 v2, s0
; SI-NEXT:    v_alignbit_b32 v0, s1, v0, v2
; SI-NEXT:    buffer_store_dwordx2 v[0:1], off, s[4:7], 0
; SI-NEXT:    s_endpgm
;
; VI-LABEL: fshl_v2i32:
; VI:       ; %bb.0: ; %entry
; VI-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x34
; VI-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x2c
; VI-NEXT:    s_load_dwordx2 s[6:7], s[0:1], 0x3c
; VI-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0x24
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    v_mov_b32_e32 v0, s3
; VI-NEXT:    s_lshr_b32 s3, s5, 1
; VI-NEXT:    v_alignbit_b32 v0, s5, v0, 1
; VI-NEXT:    s_not_b32 s5, s7
; VI-NEXT:    v_mov_b32_e32 v1, s5
; VI-NEXT:    v_alignbit_b32 v1, s3, v0, v1
; VI-NEXT:    v_mov_b32_e32 v0, s2
; VI-NEXT:    s_not_b32 s3, s6
; VI-NEXT:    v_alignbit_b32 v0, s4, v0, 1
; VI-NEXT:    s_lshr_b32 s2, s4, 1
; VI-NEXT:    v_mov_b32_e32 v2, s3
; VI-NEXT:    v_alignbit_b32 v0, s2, v0, v2
; VI-NEXT:    v_mov_b32_e32 v3, s1
; VI-NEXT:    v_mov_b32_e32 v2, s0
; VI-NEXT:    flat_store_dwordx2 v[2:3], v[0:1]
; VI-NEXT:    s_endpgm
;
; GFX9-LABEL: fshl_v2i32:
; GFX9:       ; %bb.0: ; %entry
; GFX9-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x34
; GFX9-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x2c
; GFX9-NEXT:    s_load_dwordx2 s[6:7], s[0:1], 0x24
; GFX9-NEXT:    s_load_dwordx2 s[8:9], s[0:1], 0x3c
; GFX9-NEXT:    v_mov_b32_e32 v2, 0
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    v_mov_b32_e32 v0, s3
; GFX9-NEXT:    v_alignbit_b32 v0, s5, v0, 1
; GFX9-NEXT:    s_lshr_b32 s0, s5, 1
; GFX9-NEXT:    s_not_b32 s1, s9
; GFX9-NEXT:    v_mov_b32_e32 v1, s1
; GFX9-NEXT:    v_alignbit_b32 v1, s0, v0, v1
; GFX9-NEXT:    v_mov_b32_e32 v0, s2
; GFX9-NEXT:    s_not_b32 s1, s8
; GFX9-NEXT:    v_alignbit_b32 v0, s4, v0, 1
; GFX9-NEXT:    s_lshr_b32 s0, s4, 1
; GFX9-NEXT:    v_mov_b32_e32 v3, s1
; GFX9-NEXT:    v_alignbit_b32 v0, s0, v0, v3
; GFX9-NEXT:    global_store_dwordx2 v2, v[0:1], s[6:7]
; GFX9-NEXT:    s_endpgm
;
; R600-LABEL: fshl_v2i32:
; R600:       ; %bb.0: ; %entry
; R600-NEXT:    ALU 9, @4, KC0[CB0:0-32], KC1[]
; R600-NEXT:    MEM_RAT_CACHELESS STORE_RAW T0.XY, T1.X, 1
; R600-NEXT:    CF_END
; R600-NEXT:    PAD
; R600-NEXT:    ALU clause starting at 4:
; R600-NEXT:     LSHR T0.Z, KC0[3].X, 1,
; R600-NEXT:     BIT_ALIGN_INT * T0.W, KC0[3].X, KC0[3].Z, 1,
; R600-NEXT:     NOT_INT * T1.W, KC0[4].X,
; R600-NEXT:     BIT_ALIGN_INT T0.Y, T0.Z, T0.W, PV.W,
; R600-NEXT:     LSHR T0.Z, KC0[2].W, 1,
; R600-NEXT:     BIT_ALIGN_INT * T0.W, KC0[2].W, KC0[3].Y, 1,
; R600-NEXT:     NOT_INT * T1.W, KC0[3].W,
; R600-NEXT:     BIT_ALIGN_INT T0.X, T0.Z, T0.W, PV.W,
; R600-NEXT:     LSHR * T1.X, KC0[2].Y, literal.x,
; R600-NEXT:    2(2.802597e-45), 0(0.000000e+00)
;
; GFX10-LABEL: fshl_v2i32:
; GFX10:       ; %bb.0: ; %entry
; GFX10-NEXT:    s_clause 0x3
; GFX10-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x2c
; GFX10-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x34
; GFX10-NEXT:    s_load_dwordx2 s[6:7], s[0:1], 0x3c
; GFX10-NEXT:    s_load_dwordx2 s[8:9], s[0:1], 0x24
; GFX10-NEXT:    v_mov_b32_e32 v2, 0
; GFX10-NEXT:    s_waitcnt lgkmcnt(0)
; GFX10-NEXT:    s_lshr_b32 s0, s3, 1
; GFX10-NEXT:    v_alignbit_b32 v0, s3, s5, 1
; GFX10-NEXT:    v_alignbit_b32 v3, s2, s4, 1
; GFX10-NEXT:    s_not_b32 s1, s7
; GFX10-NEXT:    s_lshr_b32 s2, s2, 1
; GFX10-NEXT:    s_not_b32 s3, s6
; GFX10-NEXT:    v_alignbit_b32 v1, s0, v0, s1
; GFX10-NEXT:    v_alignbit_b32 v0, s2, v3, s3
; GFX10-NEXT:    global_store_dwordx2 v2, v[0:1], s[8:9]
; GFX10-NEXT:    s_endpgm
entry:
  %0 = call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %x, <2 x i32> %y, <2 x i32> %z)
  store <2 x i32> %0, <2 x i32> addrspace(1)* %in
  ret void
}

define amdgpu_kernel void @fshl_v2i32_imm(<2 x i32> addrspace(1)* %in, <2 x i32> %x, <2 x i32> %y) {
; SI-LABEL: fshl_v2i32_imm:
; SI:       ; %bb.0: ; %entry
; SI-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0xd
; SI-NEXT:    s_load_dwordx2 s[6:7], s[0:1], 0xb
; SI-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0x9
; SI-NEXT:    s_mov_b32 s3, 0xf000
; SI-NEXT:    s_mov_b32 s2, -1
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    v_mov_b32_e32 v0, s5
; SI-NEXT:    v_alignbit_b32 v1, s7, v0, 23
; SI-NEXT:    v_mov_b32_e32 v0, s4
; SI-NEXT:    v_alignbit_b32 v0, s6, v0, 25
; SI-NEXT:    buffer_store_dwordx2 v[0:1], off, s[0:3], 0
; SI-NEXT:    s_endpgm
;
; VI-LABEL: fshl_v2i32_imm:
; VI:       ; %bb.0: ; %entry
; VI-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x34
; VI-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x2c
; VI-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0x24
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    v_mov_b32_e32 v0, s3
; VI-NEXT:    v_mov_b32_e32 v2, s2
; VI-NEXT:    v_alignbit_b32 v1, s5, v0, 23
; VI-NEXT:    v_alignbit_b32 v0, s4, v2, 25
; VI-NEXT:    v_mov_b32_e32 v3, s1
; VI-NEXT:    v_mov_b32_e32 v2, s0
; VI-NEXT:    flat_store_dwordx2 v[2:3], v[0:1]
; VI-NEXT:    s_endpgm
;
; GFX9-LABEL: fshl_v2i32_imm:
; GFX9:       ; %bb.0: ; %entry
; GFX9-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x34
; GFX9-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x2c
; GFX9-NEXT:    s_load_dwordx2 s[6:7], s[0:1], 0x24
; GFX9-NEXT:    v_mov_b32_e32 v2, 0
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    v_mov_b32_e32 v0, s3
; GFX9-NEXT:    v_mov_b32_e32 v3, s2
; GFX9-NEXT:    v_alignbit_b32 v1, s5, v0, 23
; GFX9-NEXT:    v_alignbit_b32 v0, s4, v3, 25
; GFX9-NEXT:    global_store_dwordx2 v2, v[0:1], s[6:7]
; GFX9-NEXT:    s_endpgm
;
; R600-LABEL: fshl_v2i32_imm:
; R600:       ; %bb.0: ; %entry
; R600-NEXT:    ALU 5, @4, KC0[CB0:0-32], KC1[]
; R600-NEXT:    MEM_RAT_CACHELESS STORE_RAW T0.XY, T1.X, 1
; R600-NEXT:    CF_END
; R600-NEXT:    PAD
; R600-NEXT:    ALU clause starting at 4:
; R600-NEXT:     BIT_ALIGN_INT * T0.Y, KC0[3].X, KC0[3].Z, literal.x,
; R600-NEXT:    23(3.222986e-44), 0(0.000000e+00)
; R600-NEXT:     BIT_ALIGN_INT * T0.X, KC0[2].W, KC0[3].Y, literal.x,
; R600-NEXT:    25(3.503246e-44), 0(0.000000e+00)
; R600-NEXT:     LSHR * T1.X, KC0[2].Y, literal.x,
; R600-NEXT:    2(2.802597e-45), 0(0.000000e+00)
;
; GFX10-LABEL: fshl_v2i32_imm:
; GFX10:       ; %bb.0: ; %entry
; GFX10-NEXT:    s_clause 0x2
; GFX10-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x2c
; GFX10-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x34
; GFX10-NEXT:    s_load_dwordx2 s[6:7], s[0:1], 0x24
; GFX10-NEXT:    v_mov_b32_e32 v2, 0
; GFX10-NEXT:    s_waitcnt lgkmcnt(0)
; GFX10-NEXT:    v_alignbit_b32 v1, s3, s5, 23
; GFX10-NEXT:    v_alignbit_b32 v0, s2, s4, 25
; GFX10-NEXT:    global_store_dwordx2 v2, v[0:1], s[6:7]
; GFX10-NEXT:    s_endpgm
entry:
  %0 = call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %x, <2 x i32> %y, <2 x i32> <i32 7, i32 9>)
  store <2 x i32> %0, <2 x i32> addrspace(1)* %in
  ret void
}

define amdgpu_kernel void @fshl_v4i32(<4 x i32> addrspace(1)* %in, <4 x i32> %x, <4 x i32> %y, <4 x i32> %z) {
; SI-LABEL: fshl_v4i32:
; SI:       ; %bb.0: ; %entry
; SI-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x11
; SI-NEXT:    s_load_dwordx2 s[8:9], s[0:1], 0x9
; SI-NEXT:    s_load_dwordx4 s[12:15], s[0:1], 0xd
; SI-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x15
; SI-NEXT:    s_mov_b32 s11, 0xf000
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    v_mov_b32_e32 v0, s7
; SI-NEXT:    s_mov_b32 s10, -1
; SI-NEXT:    v_alignbit_b32 v0, s15, v0, 1
; SI-NEXT:    s_not_b32 s3, s3
; SI-NEXT:    s_lshr_b32 s7, s15, 1
; SI-NEXT:    v_mov_b32_e32 v1, s3
; SI-NEXT:    v_alignbit_b32 v3, s7, v0, v1
; SI-NEXT:    v_mov_b32_e32 v0, s6
; SI-NEXT:    s_not_b32 s2, s2
; SI-NEXT:    v_alignbit_b32 v0, s14, v0, 1
; SI-NEXT:    s_lshr_b32 s3, s14, 1
; SI-NEXT:    v_mov_b32_e32 v1, s2
; SI-NEXT:    v_alignbit_b32 v2, s3, v0, v1
; SI-NEXT:    v_mov_b32_e32 v0, s5
; SI-NEXT:    s_not_b32 s1, s1
; SI-NEXT:    v_alignbit_b32 v0, s13, v0, 1
; SI-NEXT:    s_lshr_b32 s2, s13, 1
; SI-NEXT:    v_mov_b32_e32 v1, s1
; SI-NEXT:    v_alignbit_b32 v1, s2, v0, v1
; SI-NEXT:    v_mov_b32_e32 v0, s4
; SI-NEXT:    s_not_b32 s0, s0
; SI-NEXT:    v_alignbit_b32 v0, s12, v0, 1
; SI-NEXT:    s_lshr_b32 s1, s12, 1
; SI-NEXT:    v_mov_b32_e32 v4, s0
; SI-NEXT:    v_alignbit_b32 v0, s1, v0, v4
; SI-NEXT:    buffer_store_dwordx4 v[0:3], off, s[8:11], 0
; SI-NEXT:    s_endpgm
;
; VI-LABEL: fshl_v4i32:
; VI:       ; %bb.0: ; %entry
; VI-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x44
; VI-NEXT:    s_load_dwordx4 s[8:11], s[0:1], 0x34
; VI-NEXT:    s_load_dwordx4 s[12:15], s[0:1], 0x54
; VI-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0x24
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    v_mov_b32_e32 v0, s7
; VI-NEXT:    s_lshr_b32 s2, s11, 1
; VI-NEXT:    s_not_b32 s3, s15
; VI-NEXT:    v_alignbit_b32 v0, s11, v0, 1
; VI-NEXT:    v_mov_b32_e32 v1, s3
; VI-NEXT:    v_alignbit_b32 v3, s2, v0, v1
; VI-NEXT:    v_mov_b32_e32 v0, s6
; VI-NEXT:    s_not_b32 s3, s14
; VI-NEXT:    v_alignbit_b32 v0, s10, v0, 1
; VI-NEXT:    s_lshr_b32 s2, s10, 1
; VI-NEXT:    v_mov_b32_e32 v1, s3
; VI-NEXT:    v_alignbit_b32 v2, s2, v0, v1
; VI-NEXT:    v_mov_b32_e32 v0, s5
; VI-NEXT:    s_not_b32 s3, s13
; VI-NEXT:    v_alignbit_b32 v0, s9, v0, 1
; VI-NEXT:    s_lshr_b32 s2, s9, 1
; VI-NEXT:    v_mov_b32_e32 v1, s3
; VI-NEXT:    v_alignbit_b32 v1, s2, v0, v1
; VI-NEXT:    v_mov_b32_e32 v0, s4
; VI-NEXT:    s_not_b32 s3, s12
; VI-NEXT:    v_alignbit_b32 v0, s8, v0, 1
; VI-NEXT:    s_lshr_b32 s2, s8, 1
; VI-NEXT:    v_mov_b32_e32 v4, s3
; VI-NEXT:    v_alignbit_b32 v0, s2, v0, v4
; VI-NEXT:    v_mov_b32_e32 v5, s1
; VI-NEXT:    v_mov_b32_e32 v4, s0
; VI-NEXT:    flat_store_dwordx4 v[4:5], v[0:3]
; VI-NEXT:    s_endpgm
;
; GFX9-LABEL: fshl_v4i32:
; GFX9:       ; %bb.0: ; %entry
; GFX9-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x44
; GFX9-NEXT:    s_load_dwordx4 s[8:11], s[0:1], 0x34
; GFX9-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x24
; GFX9-NEXT:    s_load_dwordx4 s[12:15], s[0:1], 0x54
; GFX9-NEXT:    v_mov_b32_e32 v4, 0
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    v_mov_b32_e32 v0, s7
; GFX9-NEXT:    v_alignbit_b32 v0, s11, v0, 1
; GFX9-NEXT:    s_lshr_b32 s0, s11, 1
; GFX9-NEXT:    s_not_b32 s1, s15
; GFX9-NEXT:    v_mov_b32_e32 v1, s1
; GFX9-NEXT:    v_alignbit_b32 v3, s0, v0, v1
; GFX9-NEXT:    v_mov_b32_e32 v0, s6
; GFX9-NEXT:    s_not_b32 s1, s14
; GFX9-NEXT:    v_alignbit_b32 v0, s10, v0, 1
; GFX9-NEXT:    s_lshr_b32 s0, s10, 1
; GFX9-NEXT:    v_mov_b32_e32 v1, s1
; GFX9-NEXT:    v_alignbit_b32 v2, s0, v0, v1
; GFX9-NEXT:    v_mov_b32_e32 v0, s5
; GFX9-NEXT:    s_not_b32 s1, s13
; GFX9-NEXT:    v_alignbit_b32 v0, s9, v0, 1
; GFX9-NEXT:    s_lshr_b32 s0, s9, 1
; GFX9-NEXT:    v_mov_b32_e32 v1, s1
; GFX9-NEXT:    v_alignbit_b32 v1, s0, v0, v1
; GFX9-NEXT:    v_mov_b32_e32 v0, s4
; GFX9-NEXT:    s_not_b32 s1, s12
; GFX9-NEXT:    v_alignbit_b32 v0, s8, v0, 1
; GFX9-NEXT:    s_lshr_b32 s0, s8, 1
; GFX9-NEXT:    v_mov_b32_e32 v5, s1
; GFX9-NEXT:    v_alignbit_b32 v0, s0, v0, v5
; GFX9-NEXT:    global_store_dwordx4 v4, v[0:3], s[2:3]
; GFX9-NEXT:    s_endpgm
;
; R600-LABEL: fshl_v4i32:
; R600:       ; %bb.0: ; %entry
; R600-NEXT:    ALU 17, @4, KC0[CB0:0-32], KC1[]
; R600-NEXT:    MEM_RAT_CACHELESS STORE_RAW T0.XYZW, T1.X, 1
; R600-NEXT:    CF_END
; R600-NEXT:    PAD
; R600-NEXT:    ALU clause starting at 4:
; R600-NEXT:     LSHR T0.Z, KC0[4].X, 1,
; R600-NEXT:     BIT_ALIGN_INT * T0.W, KC0[4].X, KC0[5].X, 1,
; R600-NEXT:     NOT_INT * T1.W, KC0[6].X,
; R600-NEXT:     LSHR T0.Y, KC0[3].W, 1,
; R600-NEXT:     BIT_ALIGN_INT T1.Z, KC0[3].W, KC0[4].W, 1,
; R600-NEXT:     BIT_ALIGN_INT * T0.W, T0.Z, T0.W, PV.W,
; R600-NEXT:     NOT_INT * T1.W, KC0[5].W,
; R600-NEXT:     LSHR T1.Y, KC0[3].Z, 1,
; R600-NEXT:     BIT_ALIGN_INT T0.Z, T0.Y, T1.Z, PV.W,
; R600-NEXT:     BIT_ALIGN_INT * T1.W, KC0[3].Z, KC0[4].Z, 1,
; R600-NEXT:     NOT_INT * T2.W, KC0[5].Z,
; R600-NEXT:     BIT_ALIGN_INT T0.Y, T1.Y, T1.W, PV.W,
; R600-NEXT:     LSHR T1.Z, KC0[3].Y, 1,
; R600-NEXT:     BIT_ALIGN_INT * T1.W, KC0[3].Y, KC0[4].Y, 1,
; R600-NEXT:     NOT_INT * T2.W, KC0[5].Y,
; R600-NEXT:     BIT_ALIGN_INT T0.X, T1.Z, T1.W, PV.W,
; R600-NEXT:     LSHR * T1.X, KC0[2].Y, literal.x,
; R600-NEXT:    2(2.802597e-45), 0(0.000000e+00)
;
; GFX10-LABEL: fshl_v4i32:
; GFX10:       ; %bb.0: ; %entry
; GFX10-NEXT:    s_clause 0x3
; GFX10-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x34
; GFX10-NEXT:    s_load_dwordx4 s[8:11], s[0:1], 0x44
; GFX10-NEXT:    s_load_dwordx4 s[12:15], s[0:1], 0x54
; GFX10-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x24
; GFX10-NEXT:    v_mov_b32_e32 v4, 0
; GFX10-NEXT:    s_waitcnt lgkmcnt(0)
; GFX10-NEXT:    s_lshr_b32 s0, s7, 1
; GFX10-NEXT:    v_alignbit_b32 v0, s7, s11, 1
; GFX10-NEXT:    v_alignbit_b32 v1, s6, s10, 1
; GFX10-NEXT:    v_alignbit_b32 v5, s5, s9, 1
; GFX10-NEXT:    v_alignbit_b32 v6, s4, s8, 1
; GFX10-NEXT:    s_not_b32 s1, s15
; GFX10-NEXT:    s_lshr_b32 s6, s6, 1
; GFX10-NEXT:    s_not_b32 s7, s14
; GFX10-NEXT:    s_lshr_b32 s5, s5, 1
; GFX10-NEXT:    s_not_b32 s9, s13
; GFX10-NEXT:    s_lshr_b32 s4, s4, 1
; GFX10-NEXT:    s_not_b32 s8, s12
; GFX10-NEXT:    v_alignbit_b32 v3, s0, v0, s1
; GFX10-NEXT:    v_alignbit_b32 v2, s6, v1, s7
; GFX10-NEXT:    v_alignbit_b32 v1, s5, v5, s9
; GFX10-NEXT:    v_alignbit_b32 v0, s4, v6, s8
; GFX10-NEXT:    global_store_dwordx4 v4, v[0:3], s[2:3]
; GFX10-NEXT:    s_endpgm
entry:
  %0 = call <4 x i32> @llvm.fshl.v4i32(<4 x i32> %x, <4 x i32> %y, <4 x i32> %z)
  store <4 x i32> %0, <4 x i32> addrspace(1)* %in
  ret void
}

define amdgpu_kernel void @fshl_v4i32_imm(<4 x i32> addrspace(1)* %in, <4 x i32> %x, <4 x i32> %y) {
; SI-LABEL: fshl_v4i32_imm:
; SI:       ; %bb.0: ; %entry
; SI-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x11
; SI-NEXT:    s_load_dwordx4 s[8:11], s[0:1], 0xd
; SI-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0x9
; SI-NEXT:    s_mov_b32 s3, 0xf000
; SI-NEXT:    s_mov_b32 s2, -1
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    v_mov_b32_e32 v0, s7
; SI-NEXT:    v_alignbit_b32 v3, s11, v0, 31
; SI-NEXT:    v_mov_b32_e32 v0, s6
; SI-NEXT:    v_alignbit_b32 v2, s10, v0, 23
; SI-NEXT:    v_mov_b32_e32 v0, s5
; SI-NEXT:    v_alignbit_b32 v1, s9, v0, 25
; SI-NEXT:    v_mov_b32_e32 v0, s4
; SI-NEXT:    v_alignbit_b32 v0, s8, v0, 31
; SI-NEXT:    buffer_store_dwordx4 v[0:3], off, s[0:3], 0
; SI-NEXT:    s_endpgm
;
; VI-LABEL: fshl_v4i32_imm:
; VI:       ; %bb.0: ; %entry
; VI-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x44
; VI-NEXT:    s_load_dwordx4 s[8:11], s[0:1], 0x34
; VI-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0x24
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    v_mov_b32_e32 v0, s7
; VI-NEXT:    v_mov_b32_e32 v1, s6
; VI-NEXT:    v_alignbit_b32 v3, s11, v0, 31
; VI-NEXT:    v_mov_b32_e32 v0, s5
; VI-NEXT:    v_alignbit_b32 v2, s10, v1, 23
; VI-NEXT:    v_alignbit_b32 v1, s9, v0, 25
; VI-NEXT:    v_mov_b32_e32 v0, s4
; VI-NEXT:    v_mov_b32_e32 v5, s1
; VI-NEXT:    v_alignbit_b32 v0, s8, v0, 31
; VI-NEXT:    v_mov_b32_e32 v4, s0
; VI-NEXT:    flat_store_dwordx4 v[4:5], v[0:3]
; VI-NEXT:    s_endpgm
;
; GFX9-LABEL: fshl_v4i32_imm:
; GFX9:       ; %bb.0: ; %entry
; GFX9-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x44
; GFX9-NEXT:    s_load_dwordx4 s[8:11], s[0:1], 0x34
; GFX9-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x24
; GFX9-NEXT:    v_mov_b32_e32 v4, 0
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    v_mov_b32_e32 v0, s7
; GFX9-NEXT:    v_mov_b32_e32 v1, s6
; GFX9-NEXT:    v_alignbit_b32 v3, s11, v0, 31
; GFX9-NEXT:    v_mov_b32_e32 v0, s5
; GFX9-NEXT:    v_alignbit_b32 v2, s10, v1, 23
; GFX9-NEXT:    v_alignbit_b32 v1, s9, v0, 25
; GFX9-NEXT:    v_mov_b32_e32 v0, s4
; GFX9-NEXT:    v_alignbit_b32 v0, s8, v0, 31
; GFX9-NEXT:    global_store_dwordx4 v4, v[0:3], s[2:3]
; GFX9-NEXT:    s_endpgm
;
; R600-LABEL: fshl_v4i32_imm:
; R600:       ; %bb.0: ; %entry
; R600-NEXT:    ALU 9, @4, KC0[CB0:0-32], KC1[]
; R600-NEXT:    MEM_RAT_CACHELESS STORE_RAW T0.XYZW, T1.X, 1
; R600-NEXT:    CF_END
; R600-NEXT:    PAD
; R600-NEXT:    ALU clause starting at 4:
; R600-NEXT:     BIT_ALIGN_INT * T0.W, KC0[4].X, KC0[5].X, literal.x,
; R600-NEXT:    31(4.344025e-44), 0(0.000000e+00)
; R600-NEXT:     BIT_ALIGN_INT * T0.Z, KC0[3].W, KC0[4].W, literal.x,
; R600-NEXT:    23(3.222986e-44), 0(0.000000e+00)
; R600-NEXT:     BIT_ALIGN_INT * T0.Y, KC0[3].Z, KC0[4].Z, literal.x,
; R600-NEXT:    25(3.503246e-44), 0(0.000000e+00)
; R600-NEXT:     BIT_ALIGN_INT * T0.X, KC0[3].Y, KC0[4].Y, literal.x,
; R600-NEXT:    31(4.344025e-44), 0(0.000000e+00)
; R600-NEXT:     LSHR * T1.X, KC0[2].Y, literal.x,
; R600-NEXT:    2(2.802597e-45), 0(0.000000e+00)
;
; GFX10-LABEL: fshl_v4i32_imm:
; GFX10:       ; %bb.0: ; %entry
; GFX10-NEXT:    s_clause 0x2
; GFX10-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x34
; GFX10-NEXT:    s_load_dwordx4 s[8:11], s[0:1], 0x44
; GFX10-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x24
; GFX10-NEXT:    v_mov_b32_e32 v4, 0
; GFX10-NEXT:    s_waitcnt lgkmcnt(0)
; GFX10-NEXT:    v_alignbit_b32 v3, s7, s11, 31
; GFX10-NEXT:    v_alignbit_b32 v2, s6, s10, 23
; GFX10-NEXT:    v_alignbit_b32 v1, s5, s9, 25
; GFX10-NEXT:    v_alignbit_b32 v0, s4, s8, 31
; GFX10-NEXT:    global_store_dwordx4 v4, v[0:3], s[2:3]
; GFX10-NEXT:    s_endpgm
entry:
  %0 = call <4 x i32> @llvm.fshl.v4i32(<4 x i32> %x, <4 x i32> %y, <4 x i32> <i32 1, i32 7, i32 9, i32 33>)
  store <4 x i32> %0, <4 x i32> addrspace(1)* %in
  ret void
}
