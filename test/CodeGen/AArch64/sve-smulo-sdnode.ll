; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64-linux-gnu -mattr=+sve -verify-machineinstrs < %s | FileCheck %s

declare { <vscale x 2 x i8>, <vscale x 2 x i1> } @llvm.smul.with.overflow.nxv2i8(<vscale x 2 x i8>, <vscale x 2 x i8>)

define <vscale x 2 x i8> @smulo_nxv2i8(<vscale x 2 x i8> %x, <vscale x 2 x i8> %y) {
; CHECK-LABEL: smulo_nxv2i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    sxtb z1.d, p0/m, z1.d
; CHECK-NEXT:    sxtb z0.d, p0/m, z0.d
; CHECK-NEXT:    movprfx z2, z0
; CHECK-NEXT:    smulh z2.d, p0/m, z2.d, z1.d
; CHECK-NEXT:    mul z0.d, p0/m, z0.d, z1.d
; CHECK-NEXT:    asr z1.d, z0.d, #63
; CHECK-NEXT:    movprfx z3, z0
; CHECK-NEXT:    sxtb z3.d, p0/m, z0.d
; CHECK-NEXT:    cmpne p1.d, p0/z, z2.d, z1.d
; CHECK-NEXT:    cmpne p2.d, p0/z, z3.d, z0.d
; CHECK-NEXT:    orr p0.b, p0/z, p2.b, p1.b
; CHECK-NEXT:    mov z0.d, p0/m, #0 // =0x0
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
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    sxtb z1.s, p0/m, z1.s
; CHECK-NEXT:    sxtb z0.s, p0/m, z0.s
; CHECK-NEXT:    movprfx z2, z0
; CHECK-NEXT:    smulh z2.s, p0/m, z2.s, z1.s
; CHECK-NEXT:    mul z0.s, p0/m, z0.s, z1.s
; CHECK-NEXT:    asr z1.s, z0.s, #31
; CHECK-NEXT:    movprfx z3, z0
; CHECK-NEXT:    sxtb z3.s, p0/m, z0.s
; CHECK-NEXT:    cmpne p1.s, p0/z, z2.s, z1.s
; CHECK-NEXT:    cmpne p2.s, p0/z, z3.s, z0.s
; CHECK-NEXT:    orr p0.b, p0/z, p2.b, p1.b
; CHECK-NEXT:    mov z0.s, p0/m, #0 // =0x0
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
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    sxtb z1.h, p0/m, z1.h
; CHECK-NEXT:    sxtb z0.h, p0/m, z0.h
; CHECK-NEXT:    movprfx z2, z0
; CHECK-NEXT:    smulh z2.h, p0/m, z2.h, z1.h
; CHECK-NEXT:    mul z0.h, p0/m, z0.h, z1.h
; CHECK-NEXT:    asr z1.h, z0.h, #15
; CHECK-NEXT:    movprfx z3, z0
; CHECK-NEXT:    sxtb z3.h, p0/m, z0.h
; CHECK-NEXT:    cmpne p1.h, p0/z, z2.h, z1.h
; CHECK-NEXT:    cmpne p2.h, p0/z, z3.h, z0.h
; CHECK-NEXT:    orr p0.b, p0/z, p2.b, p1.b
; CHECK-NEXT:    mov z0.h, p0/m, #0 // =0x0
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
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.b
; CHECK-NEXT:    movprfx z2, z0
; CHECK-NEXT:    mul z2.b, p0/m, z2.b, z1.b
; CHECK-NEXT:    smulh z0.b, p0/m, z0.b, z1.b
; CHECK-NEXT:    asr z1.b, z2.b, #7
; CHECK-NEXT:    cmpne p0.b, p0/z, z0.b, z1.b
; CHECK-NEXT:    mov z2.b, p0/m, #0 // =0x0
; CHECK-NEXT:    mov z0.d, z2.d
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
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.b
; CHECK-NEXT:    movprfx z4, z1
; CHECK-NEXT:    smulh z4.b, p0/m, z4.b, z3.b
; CHECK-NEXT:    mul z1.b, p0/m, z1.b, z3.b
; CHECK-NEXT:    movprfx z3, z0
; CHECK-NEXT:    mul z3.b, p0/m, z3.b, z2.b
; CHECK-NEXT:    asr z5.b, z1.b, #7
; CHECK-NEXT:    smulh z0.b, p0/m, z0.b, z2.b
; CHECK-NEXT:    asr z2.b, z3.b, #7
; CHECK-NEXT:    cmpne p1.b, p0/z, z4.b, z5.b
; CHECK-NEXT:    cmpne p0.b, p0/z, z0.b, z2.b
; CHECK-NEXT:    mov z1.b, p1/m, #0 // =0x0
; CHECK-NEXT:    mov z3.b, p0/m, #0 // =0x0
; CHECK-NEXT:    mov z0.d, z3.d
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
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.b
; CHECK-NEXT:    movprfx z24, z3
; CHECK-NEXT:    smulh z24.b, p0/m, z24.b, z7.b
; CHECK-NEXT:    mul z3.b, p0/m, z3.b, z7.b
; CHECK-NEXT:    movprfx z7, z2
; CHECK-NEXT:    mul z7.b, p0/m, z7.b, z6.b
; CHECK-NEXT:    smulh z2.b, p0/m, z2.b, z6.b
; CHECK-NEXT:    asr z6.b, z7.b, #7
; CHECK-NEXT:    cmpne p2.b, p0/z, z2.b, z6.b
; CHECK-NEXT:    movprfx z6, z1
; CHECK-NEXT:    smulh z6.b, p0/m, z6.b, z5.b
; CHECK-NEXT:    mul z1.b, p0/m, z1.b, z5.b
; CHECK-NEXT:    asr z25.b, z3.b, #7
; CHECK-NEXT:    asr z5.b, z1.b, #7
; CHECK-NEXT:    movprfx z2, z0
; CHECK-NEXT:    mul z2.b, p0/m, z2.b, z4.b
; CHECK-NEXT:    smulh z0.b, p0/m, z0.b, z4.b
; CHECK-NEXT:    asr z4.b, z2.b, #7
; CHECK-NEXT:    cmpne p1.b, p0/z, z24.b, z25.b
; CHECK-NEXT:    cmpne p3.b, p0/z, z6.b, z5.b
; CHECK-NEXT:    cmpne p0.b, p0/z, z0.b, z4.b
; CHECK-NEXT:    mov z7.b, p2/m, #0 // =0x0
; CHECK-NEXT:    mov z2.b, p0/m, #0 // =0x0
; CHECK-NEXT:    mov z1.b, p3/m, #0 // =0x0
; CHECK-NEXT:    mov z3.b, p1/m, #0 // =0x0
; CHECK-NEXT:    mov z0.d, z2.d
; CHECK-NEXT:    mov z2.d, z7.d
; CHECK-NEXT:    ret
  %a = call { <vscale x 64 x i8>, <vscale x 64 x i1> } @llvm.smul.with.overflow.nxv64i8(<vscale x 64 x i8> %x, <vscale x 64 x i8> %y)
  %b = extractvalue { <vscale x 64 x i8>, <vscale x 64 x i1> } %a, 0
  %c = extractvalue { <vscale x 64 x i8>, <vscale x 64 x i1> } %a, 1
  %d = select <vscale x 64 x i1> %c, <vscale x 64 x i8> zeroinitializer, <vscale x 64 x i8> %b
  ret <vscale x 64 x i8> %d
}

declare { <vscale x 2 x i16>, <vscale x 2 x i1> } @llvm.smul.with.overflow.nxv2i16(<vscale x 2 x i16>, <vscale x 2 x i16>)

define <vscale x 2 x i16> @smulo_nxv2i16(<vscale x 2 x i16> %x, <vscale x 2 x i16> %y) {
; CHECK-LABEL: smulo_nxv2i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    sxth z1.d, p0/m, z1.d
; CHECK-NEXT:    sxth z0.d, p0/m, z0.d
; CHECK-NEXT:    movprfx z2, z0
; CHECK-NEXT:    smulh z2.d, p0/m, z2.d, z1.d
; CHECK-NEXT:    mul z0.d, p0/m, z0.d, z1.d
; CHECK-NEXT:    asr z1.d, z0.d, #63
; CHECK-NEXT:    movprfx z3, z0
; CHECK-NEXT:    sxth z3.d, p0/m, z0.d
; CHECK-NEXT:    cmpne p1.d, p0/z, z2.d, z1.d
; CHECK-NEXT:    cmpne p2.d, p0/z, z3.d, z0.d
; CHECK-NEXT:    orr p0.b, p0/z, p2.b, p1.b
; CHECK-NEXT:    mov z0.d, p0/m, #0 // =0x0
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
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    sxth z1.s, p0/m, z1.s
; CHECK-NEXT:    sxth z0.s, p0/m, z0.s
; CHECK-NEXT:    movprfx z2, z0
; CHECK-NEXT:    smulh z2.s, p0/m, z2.s, z1.s
; CHECK-NEXT:    mul z0.s, p0/m, z0.s, z1.s
; CHECK-NEXT:    asr z1.s, z0.s, #31
; CHECK-NEXT:    movprfx z3, z0
; CHECK-NEXT:    sxth z3.s, p0/m, z0.s
; CHECK-NEXT:    cmpne p1.s, p0/z, z2.s, z1.s
; CHECK-NEXT:    cmpne p2.s, p0/z, z3.s, z0.s
; CHECK-NEXT:    orr p0.b, p0/z, p2.b, p1.b
; CHECK-NEXT:    mov z0.s, p0/m, #0 // =0x0
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
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    movprfx z2, z0
; CHECK-NEXT:    mul z2.h, p0/m, z2.h, z1.h
; CHECK-NEXT:    smulh z0.h, p0/m, z0.h, z1.h
; CHECK-NEXT:    asr z1.h, z2.h, #15
; CHECK-NEXT:    cmpne p0.h, p0/z, z0.h, z1.h
; CHECK-NEXT:    mov z2.h, p0/m, #0 // =0x0
; CHECK-NEXT:    mov z0.d, z2.d
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
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    movprfx z4, z1
; CHECK-NEXT:    smulh z4.h, p0/m, z4.h, z3.h
; CHECK-NEXT:    mul z1.h, p0/m, z1.h, z3.h
; CHECK-NEXT:    movprfx z3, z0
; CHECK-NEXT:    mul z3.h, p0/m, z3.h, z2.h
; CHECK-NEXT:    asr z5.h, z1.h, #15
; CHECK-NEXT:    smulh z0.h, p0/m, z0.h, z2.h
; CHECK-NEXT:    asr z2.h, z3.h, #15
; CHECK-NEXT:    cmpne p1.h, p0/z, z4.h, z5.h
; CHECK-NEXT:    cmpne p0.h, p0/z, z0.h, z2.h
; CHECK-NEXT:    mov z1.h, p1/m, #0 // =0x0
; CHECK-NEXT:    mov z3.h, p0/m, #0 // =0x0
; CHECK-NEXT:    mov z0.d, z3.d
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
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    movprfx z24, z3
; CHECK-NEXT:    smulh z24.h, p0/m, z24.h, z7.h
; CHECK-NEXT:    mul z3.h, p0/m, z3.h, z7.h
; CHECK-NEXT:    movprfx z7, z2
; CHECK-NEXT:    mul z7.h, p0/m, z7.h, z6.h
; CHECK-NEXT:    smulh z2.h, p0/m, z2.h, z6.h
; CHECK-NEXT:    asr z6.h, z7.h, #15
; CHECK-NEXT:    cmpne p2.h, p0/z, z2.h, z6.h
; CHECK-NEXT:    movprfx z6, z1
; CHECK-NEXT:    smulh z6.h, p0/m, z6.h, z5.h
; CHECK-NEXT:    mul z1.h, p0/m, z1.h, z5.h
; CHECK-NEXT:    asr z25.h, z3.h, #15
; CHECK-NEXT:    asr z5.h, z1.h, #15
; CHECK-NEXT:    movprfx z2, z0
; CHECK-NEXT:    mul z2.h, p0/m, z2.h, z4.h
; CHECK-NEXT:    smulh z0.h, p0/m, z0.h, z4.h
; CHECK-NEXT:    asr z4.h, z2.h, #15
; CHECK-NEXT:    cmpne p1.h, p0/z, z24.h, z25.h
; CHECK-NEXT:    cmpne p3.h, p0/z, z6.h, z5.h
; CHECK-NEXT:    cmpne p0.h, p0/z, z0.h, z4.h
; CHECK-NEXT:    mov z7.h, p2/m, #0 // =0x0
; CHECK-NEXT:    mov z2.h, p0/m, #0 // =0x0
; CHECK-NEXT:    mov z1.h, p3/m, #0 // =0x0
; CHECK-NEXT:    mov z3.h, p1/m, #0 // =0x0
; CHECK-NEXT:    mov z0.d, z2.d
; CHECK-NEXT:    mov z2.d, z7.d
; CHECK-NEXT:    ret
  %a = call { <vscale x 32 x i16>, <vscale x 32 x i1> } @llvm.smul.with.overflow.nxv32i16(<vscale x 32 x i16> %x, <vscale x 32 x i16> %y)
  %b = extractvalue { <vscale x 32 x i16>, <vscale x 32 x i1> } %a, 0
  %c = extractvalue { <vscale x 32 x i16>, <vscale x 32 x i1> } %a, 1
  %d = select <vscale x 32 x i1> %c, <vscale x 32 x i16> zeroinitializer, <vscale x 32 x i16> %b
  ret <vscale x 32 x i16> %d
}

declare { <vscale x 2 x i32>, <vscale x 2 x i1> } @llvm.smul.with.overflow.nxv2i32(<vscale x 2 x i32>, <vscale x 2 x i32>)

define <vscale x 2 x i32> @smulo_nxv2i32(<vscale x 2 x i32> %x, <vscale x 2 x i32> %y) {
; CHECK-LABEL: smulo_nxv2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    sxtw z1.d, p0/m, z1.d
; CHECK-NEXT:    sxtw z0.d, p0/m, z0.d
; CHECK-NEXT:    movprfx z2, z0
; CHECK-NEXT:    smulh z2.d, p0/m, z2.d, z1.d
; CHECK-NEXT:    mul z0.d, p0/m, z0.d, z1.d
; CHECK-NEXT:    asr z1.d, z0.d, #63
; CHECK-NEXT:    movprfx z3, z0
; CHECK-NEXT:    sxtw z3.d, p0/m, z0.d
; CHECK-NEXT:    cmpne p1.d, p0/z, z2.d, z1.d
; CHECK-NEXT:    cmpne p2.d, p0/z, z3.d, z0.d
; CHECK-NEXT:    orr p0.b, p0/z, p2.b, p1.b
; CHECK-NEXT:    mov z0.d, p0/m, #0 // =0x0
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
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    movprfx z2, z0
; CHECK-NEXT:    mul z2.s, p0/m, z2.s, z1.s
; CHECK-NEXT:    smulh z0.s, p0/m, z0.s, z1.s
; CHECK-NEXT:    asr z1.s, z2.s, #31
; CHECK-NEXT:    cmpne p0.s, p0/z, z0.s, z1.s
; CHECK-NEXT:    mov z2.s, p0/m, #0 // =0x0
; CHECK-NEXT:    mov z0.d, z2.d
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
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    movprfx z4, z1
; CHECK-NEXT:    smulh z4.s, p0/m, z4.s, z3.s
; CHECK-NEXT:    mul z1.s, p0/m, z1.s, z3.s
; CHECK-NEXT:    movprfx z3, z0
; CHECK-NEXT:    mul z3.s, p0/m, z3.s, z2.s
; CHECK-NEXT:    asr z5.s, z1.s, #31
; CHECK-NEXT:    smulh z0.s, p0/m, z0.s, z2.s
; CHECK-NEXT:    asr z2.s, z3.s, #31
; CHECK-NEXT:    cmpne p1.s, p0/z, z4.s, z5.s
; CHECK-NEXT:    cmpne p0.s, p0/z, z0.s, z2.s
; CHECK-NEXT:    mov z1.s, p1/m, #0 // =0x0
; CHECK-NEXT:    mov z3.s, p0/m, #0 // =0x0
; CHECK-NEXT:    mov z0.d, z3.d
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
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    movprfx z24, z3
; CHECK-NEXT:    smulh z24.s, p0/m, z24.s, z7.s
; CHECK-NEXT:    mul z3.s, p0/m, z3.s, z7.s
; CHECK-NEXT:    movprfx z7, z2
; CHECK-NEXT:    mul z7.s, p0/m, z7.s, z6.s
; CHECK-NEXT:    smulh z2.s, p0/m, z2.s, z6.s
; CHECK-NEXT:    asr z6.s, z7.s, #31
; CHECK-NEXT:    cmpne p2.s, p0/z, z2.s, z6.s
; CHECK-NEXT:    movprfx z6, z1
; CHECK-NEXT:    smulh z6.s, p0/m, z6.s, z5.s
; CHECK-NEXT:    mul z1.s, p0/m, z1.s, z5.s
; CHECK-NEXT:    asr z25.s, z3.s, #31
; CHECK-NEXT:    asr z5.s, z1.s, #31
; CHECK-NEXT:    movprfx z2, z0
; CHECK-NEXT:    mul z2.s, p0/m, z2.s, z4.s
; CHECK-NEXT:    smulh z0.s, p0/m, z0.s, z4.s
; CHECK-NEXT:    asr z4.s, z2.s, #31
; CHECK-NEXT:    cmpne p1.s, p0/z, z24.s, z25.s
; CHECK-NEXT:    cmpne p3.s, p0/z, z6.s, z5.s
; CHECK-NEXT:    cmpne p0.s, p0/z, z0.s, z4.s
; CHECK-NEXT:    mov z7.s, p2/m, #0 // =0x0
; CHECK-NEXT:    mov z2.s, p0/m, #0 // =0x0
; CHECK-NEXT:    mov z1.s, p3/m, #0 // =0x0
; CHECK-NEXT:    mov z3.s, p1/m, #0 // =0x0
; CHECK-NEXT:    mov z0.d, z2.d
; CHECK-NEXT:    mov z2.d, z7.d
; CHECK-NEXT:    ret
  %a = call { <vscale x 16 x i32>, <vscale x 16 x i1> } @llvm.smul.with.overflow.nxv16i32(<vscale x 16 x i32> %x, <vscale x 16 x i32> %y)
  %b = extractvalue { <vscale x 16 x i32>, <vscale x 16 x i1> } %a, 0
  %c = extractvalue { <vscale x 16 x i32>, <vscale x 16 x i1> } %a, 1
  %d = select <vscale x 16 x i1> %c, <vscale x 16 x i32> zeroinitializer, <vscale x 16 x i32> %b
  ret <vscale x 16 x i32> %d
}

declare { <vscale x 2 x i64>, <vscale x 2 x i1> } @llvm.smul.with.overflow.nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>)

define <vscale x 2 x i64> @smulo_nxv2i64(<vscale x 2 x i64> %x, <vscale x 2 x i64> %y) {
; CHECK-LABEL: smulo_nxv2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    movprfx z2, z0
; CHECK-NEXT:    mul z2.d, p0/m, z2.d, z1.d
; CHECK-NEXT:    smulh z0.d, p0/m, z0.d, z1.d
; CHECK-NEXT:    asr z1.d, z2.d, #63
; CHECK-NEXT:    cmpne p0.d, p0/z, z0.d, z1.d
; CHECK-NEXT:    mov z2.d, p0/m, #0 // =0x0
; CHECK-NEXT:    mov z0.d, z2.d
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
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    movprfx z4, z1
; CHECK-NEXT:    smulh z4.d, p0/m, z4.d, z3.d
; CHECK-NEXT:    mul z1.d, p0/m, z1.d, z3.d
; CHECK-NEXT:    movprfx z3, z0
; CHECK-NEXT:    mul z3.d, p0/m, z3.d, z2.d
; CHECK-NEXT:    asr z5.d, z1.d, #63
; CHECK-NEXT:    smulh z0.d, p0/m, z0.d, z2.d
; CHECK-NEXT:    asr z2.d, z3.d, #63
; CHECK-NEXT:    cmpne p1.d, p0/z, z4.d, z5.d
; CHECK-NEXT:    cmpne p0.d, p0/z, z0.d, z2.d
; CHECK-NEXT:    mov z1.d, p1/m, #0 // =0x0
; CHECK-NEXT:    mov z3.d, p0/m, #0 // =0x0
; CHECK-NEXT:    mov z0.d, z3.d
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
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    movprfx z24, z3
; CHECK-NEXT:    smulh z24.d, p0/m, z24.d, z7.d
; CHECK-NEXT:    mul z3.d, p0/m, z3.d, z7.d
; CHECK-NEXT:    movprfx z7, z2
; CHECK-NEXT:    mul z7.d, p0/m, z7.d, z6.d
; CHECK-NEXT:    smulh z2.d, p0/m, z2.d, z6.d
; CHECK-NEXT:    asr z6.d, z7.d, #63
; CHECK-NEXT:    cmpne p2.d, p0/z, z2.d, z6.d
; CHECK-NEXT:    movprfx z6, z1
; CHECK-NEXT:    smulh z6.d, p0/m, z6.d, z5.d
; CHECK-NEXT:    mul z1.d, p0/m, z1.d, z5.d
; CHECK-NEXT:    asr z25.d, z3.d, #63
; CHECK-NEXT:    asr z5.d, z1.d, #63
; CHECK-NEXT:    movprfx z2, z0
; CHECK-NEXT:    mul z2.d, p0/m, z2.d, z4.d
; CHECK-NEXT:    smulh z0.d, p0/m, z0.d, z4.d
; CHECK-NEXT:    asr z4.d, z2.d, #63
; CHECK-NEXT:    cmpne p1.d, p0/z, z24.d, z25.d
; CHECK-NEXT:    cmpne p3.d, p0/z, z6.d, z5.d
; CHECK-NEXT:    cmpne p0.d, p0/z, z0.d, z4.d
; CHECK-NEXT:    mov z7.d, p2/m, #0 // =0x0
; CHECK-NEXT:    mov z2.d, p0/m, #0 // =0x0
; CHECK-NEXT:    mov z1.d, p3/m, #0 // =0x0
; CHECK-NEXT:    mov z3.d, p1/m, #0 // =0x0
; CHECK-NEXT:    mov z0.d, z2.d
; CHECK-NEXT:    mov z2.d, z7.d
; CHECK-NEXT:    ret
  %a = call { <vscale x 8 x i64>, <vscale x 8 x i1> } @llvm.smul.with.overflow.nxv8i64(<vscale x 8 x i64> %x, <vscale x 8 x i64> %y)
  %b = extractvalue { <vscale x 8 x i64>, <vscale x 8 x i1> } %a, 0
  %c = extractvalue { <vscale x 8 x i64>, <vscale x 8 x i1> } %a, 1
  %d = select <vscale x 8 x i1> %c, <vscale x 8 x i64> zeroinitializer, <vscale x 8 x i64> %b
  ret <vscale x 8 x i64> %d
}
