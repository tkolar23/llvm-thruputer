; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -global-isel -mtriple=amdgcn-amd-amdpal -mcpu=fiji -o - < %s | FileCheck --check-prefixes=GCN,GFX89 %s
; RUN: llc -global-isel -mtriple=amdgcn-amd-amdpal -mcpu=gfx900 -o - < %s | FileCheck --check-prefixes=GCN,GFX89 %s
; RUN: llc -global-isel -mtriple=amdgcn-amd-amdpal -mcpu=gfx1010 -o - < %s | FileCheck --check-prefixes=GCN,GFX10 %s

; Test vector bitfield extract.
define i32 @v_srl_mask_i32(i32 %value) {
; GFX89-LABEL: v_srl_mask_i32:
; GFX89:       ; %bb.0:
; GFX89-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX89-NEXT:    v_bfe_u32 v0, v0, 8, 5
; GFX89-NEXT:    s_setpc_b64 s[30:31]
;
; GFX10-LABEL: v_srl_mask_i32:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    v_bfe_u32 v0, v0, 8, 5
; GFX10-NEXT:    s_setpc_b64 s[30:31]
 %1 = lshr i32 %value, 8
 %2 = and i32 %1, 31
 ret i32 %2
}

; Test scalar bitfield extract.
define amdgpu_ps i32 @s_srl_mask_i32(i32 inreg %value) {
; GCN-LABEL: s_srl_mask_i32:
; GCN:       ; %bb.0:
; GCN-NEXT:    s_bfe_u32 s0, s0, 0x50008
; GCN-NEXT:    ; return to shader part epilog
 %1 = lshr i32 %value, 8
 %2 = and i32 %1, 31
 ret i32 %2
}

; Don't generate G_UBFX if the offset + width is too big.
define amdgpu_ps i32 @s_srl_big_mask_i32(i32 inreg %value) {
; GCN-LABEL: s_srl_big_mask_i32:
; GCN:       ; %bb.0:
; GCN-NEXT:    s_lshr_b32 s0, s0, 30
; GCN-NEXT:    ; return to shader part epilog
 %1 = lshr i32 %value, 30
 %2 = and i32 %1, 31
 ret i32 %2
}

; Test vector bitfield extract.
define i32 @v_mask_srl_i32(i32 %value) {
; GFX89-LABEL: v_mask_srl_i32:
; GFX89:       ; %bb.0:
; GFX89-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX89-NEXT:    v_bfe_u32 v0, v0, 8, 5
; GFX89-NEXT:    s_setpc_b64 s[30:31]
;
; GFX10-LABEL: v_mask_srl_i32:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    v_bfe_u32 v0, v0, 8, 5
; GFX10-NEXT:    s_setpc_b64 s[30:31]
 %1 = and i32 %value, 7936 ; 31 << 8
 %2 = lshr i32 %1, 8
 ret i32 %2
}

; Test scalar bitfield extract.
define amdgpu_ps i32 @s_mask_srl_i32(i32 inreg %value) {
; GCN-LABEL: s_mask_srl_i32:
; GCN:       ; %bb.0:
; GCN-NEXT:    s_bfe_u32 s0, s0, 0x50008
; GCN-NEXT:    ; return to shader part epilog
 %1 = and i32 %value, 7936 ; 31 << 8
 %2 = lshr i32 %1, 8
 ret i32 %2
}

; Test vector bitfield extract for 64-bits.
define i64 @v_srl_mask_i64(i64 %value) {
; GFX89-LABEL: v_srl_mask_i64:
; GFX89:       ; %bb.0:
; GFX89-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX89-NEXT:    v_lshrrev_b64 v[0:1], 25, v[0:1]
; GFX89-NEXT:    v_mov_b32_e32 v1, 0
; GFX89-NEXT:    v_bfe_u32 v0, v0, 0, 10
; GFX89-NEXT:    s_setpc_b64 s[30:31]
;
; GFX10-LABEL: v_srl_mask_i64:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    v_lshrrev_b64 v[0:1], 25, v[0:1]
; GFX10-NEXT:    v_mov_b32_e32 v1, 0
; GFX10-NEXT:    v_bfe_u32 v0, v0, 0, 10
; GFX10-NEXT:    s_setpc_b64 s[30:31]
 %1 = lshr i64 %value, 25
 %2 = and i64 %1, 1023
 ret i64 %2
}

; Test scalar bitfield extract for 64-bits.
define amdgpu_ps i64 @s_srl_mask_i64(i64 inreg %value) {
; GCN-LABEL: s_srl_mask_i64:
; GCN:       ; %bb.0:
; GCN-NEXT:    s_bfe_u64 s[0:1], s[0:1], 0xa0019
; GCN-NEXT:    ; return to shader part epilog
 %1 = lshr i64 %value, 25
 %2 = and i64 %1, 1023
 ret i64 %2
}

; Don't generate G_UBFX if the offset + width is too big.
define amdgpu_ps i64 @s_srl_big_mask_i64(i64 inreg %value) {
; GCN-LABEL: s_srl_big_mask_i64:
; GCN:       ; %bb.0:
; GCN-NEXT:    s_lshr_b32 s0, s1, 28
; GCN-NEXT:    s_mov_b32 s1, 0
; GCN-NEXT:    ; return to shader part epilog
 %1 = lshr i64 %value, 60
 %2 = and i64 %1, 63
 ret i64 %2
}

; Test vector bitfield extract for 64-bits.
; TODO: No need for a 64-bit shift instruction when the extracted value is
; entirely contained within the upper or lower half.
define i64 @v_mask_srl_i64(i64 %value) {
; GFX89-LABEL: v_mask_srl_i64:
; GFX89:       ; %bb.0:
; GFX89-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX89-NEXT:    v_lshrrev_b64 v[0:1], 25, v[0:1]
; GFX89-NEXT:    v_mov_b32_e32 v1, 0
; GFX89-NEXT:    v_bfe_u32 v0, v0, 0, 10
; GFX89-NEXT:    s_setpc_b64 s[30:31]
;
; GFX10-LABEL: v_mask_srl_i64:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    v_lshrrev_b64 v[0:1], 25, v[0:1]
; GFX10-NEXT:    v_mov_b32_e32 v1, 0
; GFX10-NEXT:    v_bfe_u32 v0, v0, 0, 10
; GFX10-NEXT:    s_setpc_b64 s[30:31]
 %1 = and i64 %value, 34326183936 ; 1023 << 25
 %2 = lshr i64 %1, 25
 ret i64 %2
}

; Test scalar bitfield extract for 64-bits.
define amdgpu_ps i64 @s_mask_srl_i64(i64 inreg %value) {
; GCN-LABEL: s_mask_srl_i64:
; GCN:       ; %bb.0:
; GCN-NEXT:    s_bfe_u64 s[0:1], s[0:1], 0xa0019
; GCN-NEXT:    ; return to shader part epilog
 %1 = and i64 %value, 34326183936 ; 1023 << 25
 %2 = lshr i64 %1, 25
 ret i64 %2
}
