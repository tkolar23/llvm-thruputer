; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64--linux-gnu -mattr=+sve2 %s -o - | FileCheck %s

;
; MATCH
;

define i32 @match_nxv16i8(<vscale x 16 x i1> %pg, <vscale x 16 x i8> %a, <vscale x 16 x i8> %b) {
; CHECK-LABEL: match_nxv16i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    match p0.b, p0/z, z0.b, z1.b
; CHECK-NEXT:    cset w0, ne
; CHECK-NEXT:    ret
  %1 = tail call <vscale x 16 x i1> @llvm.aarch64.sve.match.nxv16i8(<vscale x 16 x i1> %pg, <vscale x 16 x i8> %a, <vscale x 16 x i8> %b)
  %2 = tail call i1 @llvm.aarch64.sve.ptest.any(<vscale x 16 x i1> %pg, <vscale x 16 x i1> %1)
  %conv = zext i1 %2 to i32
  ret i32 %conv
}

;
; NMATCH
;

define i32 @nmatch_nxv16i8(<vscale x 16 x i1> %pg, <vscale x 16 x i8> %a, <vscale x 16 x i8> %b) {
; CHECK-LABEL: nmatch_nxv16i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    nmatch p0.b, p0/z, z0.b, z1.b
; CHECK-NEXT:    cset w0, ne
; CHECK-NEXT:    ret
  %1 = tail call <vscale x 16 x i1> @llvm.aarch64.sve.nmatch.nxv16i8(<vscale x 16 x i1> %pg, <vscale x 16 x i8> %a, <vscale x 16 x i8> %b)
  %2 = tail call i1 @llvm.aarch64.sve.ptest.any(<vscale x 16 x i1> %pg, <vscale x 16 x i1> %1)
  %conv = zext i1 %2 to i32
  ret i32 %conv
}

declare <vscale x 16 x i1> @llvm.aarch64.sve.match.nxv16i8(<vscale x 16 x i1>, <vscale x 16 x i8>, <vscale x 16 x i8>)
declare <vscale x 16 x i1> @llvm.aarch64.sve.nmatch.nxv16i8(<vscale x 16 x i1>, <vscale x 16 x i8>, <vscale x 16 x i8>)
declare i1 @llvm.aarch64.sve.ptest.any(<vscale x 16 x i1>, <vscale x 16 x i1>)
