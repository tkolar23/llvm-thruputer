; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
; RUN: opt -cost-model -analyze -mtriple=thumbv8m.main < %s | FileCheck %s --check-prefix=V8M
; RUN: opt -cost-model -analyze -mtriple=armv8a-linux-gnueabihf < %s | FileCheck %s --check-prefix=NEON
; RUN: opt -cost-model -analyze -mtriple=armv8.1m.main -mattr=+mve < %s | FileCheck %s --check-prefix=MVE

target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"

define i32 @reduce_i64(i32 %arg) {
; V8M-LABEL: 'reduce_i64'
; V8M-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V1 = call i64 @llvm.vector.reduce.umin.v1i64(<1 x i64> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 13 for instruction: %V2 = call i64 @llvm.vector.reduce.umin.v2i64(<2 x i64> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 35 for instruction: %V4 = call i64 @llvm.vector.reduce.umin.v4i64(<4 x i64> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 79 for instruction: %V8 = call i64 @llvm.vector.reduce.umin.v8i64(<8 x i64> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 167 for instruction: %V16 = call i64 @llvm.vector.reduce.umin.v16i64(<16 x i64> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret i32 undef
;
; NEON-LABEL: 'reduce_i64'
; NEON-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %V1 = call i64 @llvm.vector.reduce.umin.v1i64(<1 x i64> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 17 for instruction: %V2 = call i64 @llvm.vector.reduce.umin.v2i64(<2 x i64> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 31 for instruction: %V4 = call i64 @llvm.vector.reduce.umin.v4i64(<4 x i64> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 76 for instruction: %V8 = call i64 @llvm.vector.reduce.umin.v8i64(<8 x i64> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 178 for instruction: %V16 = call i64 @llvm.vector.reduce.umin.v16i64(<16 x i64> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; MVE-LABEL: 'reduce_i64'
; MVE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V1 = call i64 @llvm.vector.reduce.umin.v1i64(<1 x i64> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 110 for instruction: %V2 = call i64 @llvm.vector.reduce.umin.v2i64(<2 x i64> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 212 for instruction: %V4 = call i64 @llvm.vector.reduce.umin.v4i64(<4 x i64> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 416 for instruction: %V8 = call i64 @llvm.vector.reduce.umin.v8i64(<8 x i64> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 824 for instruction: %V16 = call i64 @llvm.vector.reduce.umin.v16i64(<16 x i64> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
  %V1  = call i64 @llvm.vector.reduce.umin.v1i64(<1 x i64> undef)
  %V2  = call i64 @llvm.vector.reduce.umin.v2i64(<2 x i64> undef)
  %V4  = call i64 @llvm.vector.reduce.umin.v4i64(<4 x i64> undef)
  %V8  = call i64 @llvm.vector.reduce.umin.v8i64(<8 x i64> undef)
  %V16 = call i64 @llvm.vector.reduce.umin.v16i64(<16 x i64> undef)
  ret i32 undef
}

define i32 @reduce_i32(i32 %arg) {
; V8M-LABEL: 'reduce_i32'
; V8M-NEXT:  Cost Model: Found an estimated cost of 7 for instruction: %V2 = call i32 @llvm.vector.reduce.umin.v2i32(<2 x i32> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 19 for instruction: %V4 = call i32 @llvm.vector.reduce.umin.v4i32(<4 x i32> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 43 for instruction: %V8 = call i32 @llvm.vector.reduce.umin.v8i32(<8 x i32> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 91 for instruction: %V16 = call i32 @llvm.vector.reduce.umin.v16i32(<16 x i32> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 187 for instruction: %V32 = call i32 @llvm.vector.reduce.umin.v32i32(<32 x i32> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret i32 undef
;
; NEON-LABEL: 'reduce_i32'
; NEON-NEXT:  Cost Model: Found an estimated cost of 17 for instruction: %V2 = call i32 @llvm.vector.reduce.umin.v2i32(<2 x i32> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 55 for instruction: %V4 = call i32 @llvm.vector.reduce.umin.v4i32(<4 x i32> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 81 for instruction: %V8 = call i32 @llvm.vector.reduce.umin.v8i32(<8 x i32> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 133 for instruction: %V16 = call i32 @llvm.vector.reduce.umin.v16i32(<16 x i32> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 237 for instruction: %V32 = call i32 @llvm.vector.reduce.umin.v32i32(<32 x i32> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; MVE-LABEL: 'reduce_i32'
; MVE-NEXT:  Cost Model: Found an estimated cost of 58 for instruction: %V2 = call i32 @llvm.vector.reduce.umin.v2i32(<2 x i32> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 140 for instruction: %V4 = call i32 @llvm.vector.reduce.umin.v4i32(<4 x i32> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 208 for instruction: %V8 = call i32 @llvm.vector.reduce.umin.v8i32(<8 x i32> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 376 for instruction: %V16 = call i32 @llvm.vector.reduce.umin.v16i32(<16 x i32> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 712 for instruction: %V32 = call i32 @llvm.vector.reduce.umin.v32i32(<32 x i32> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
  %V2  = call i32 @llvm.vector.reduce.umin.v2i32(<2 x i32> undef)
  %V4  = call i32 @llvm.vector.reduce.umin.v4i32(<4 x i32> undef)
  %V8  = call i32 @llvm.vector.reduce.umin.v8i32(<8 x i32> undef)
  %V16 = call i32 @llvm.vector.reduce.umin.v16i32(<16 x i32> undef)
  %V32 = call i32 @llvm.vector.reduce.umin.v32i32(<32 x i32> undef)
  ret i32 undef
}

define i32 @reduce_i16(i32 %arg) {
; V8M-LABEL: 'reduce_i16'
; V8M-NEXT:  Cost Model: Found an estimated cost of 7 for instruction: %V2 = call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 19 for instruction: %V4 = call i16 @llvm.vector.reduce.umin.v4i16(<4 x i16> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 43 for instruction: %V8 = call i16 @llvm.vector.reduce.umin.v8i16(<8 x i16> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 91 for instruction: %V16 = call i16 @llvm.vector.reduce.umin.v16i16(<16 x i16> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 187 for instruction: %V32 = call i16 @llvm.vector.reduce.umin.v32i16(<32 x i16> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 379 for instruction: %V64 = call i16 @llvm.vector.reduce.umin.v64i16(<64 x i16> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret i32 undef
;
; NEON-LABEL: 'reduce_i16'
; NEON-NEXT:  Cost Model: Found an estimated cost of 17 for instruction: %V2 = call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 55 for instruction: %V4 = call i16 @llvm.vector.reduce.umin.v4i16(<4 x i16> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 153 for instruction: %V8 = call i16 @llvm.vector.reduce.umin.v8i16(<8 x i16> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 203 for instruction: %V16 = call i16 @llvm.vector.reduce.umin.v16i16(<16 x i16> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 303 for instruction: %V32 = call i16 @llvm.vector.reduce.umin.v32i16(<32 x i16> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 503 for instruction: %V64 = call i16 @llvm.vector.reduce.umin.v64i16(<64 x i16> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; MVE-LABEL: 'reduce_i16'
; MVE-NEXT:  Cost Model: Found an estimated cost of 58 for instruction: %V2 = call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 140 for instruction: %V4 = call i16 @llvm.vector.reduce.umin.v4i16(<4 x i16> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 400 for instruction: %V8 = call i16 @llvm.vector.reduce.umin.v8i16(<8 x i16> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 532 for instruction: %V16 = call i16 @llvm.vector.reduce.umin.v16i16(<16 x i16> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 860 for instruction: %V32 = call i16 @llvm.vector.reduce.umin.v32i16(<32 x i16> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 1516 for instruction: %V64 = call i16 @llvm.vector.reduce.umin.v64i16(<64 x i16> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
  %V2  = call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> undef)
  %V4  = call i16 @llvm.vector.reduce.umin.v4i16(<4 x i16> undef)
  %V8  = call i16 @llvm.vector.reduce.umin.v8i16(<8 x i16> undef)
  %V16 = call i16 @llvm.vector.reduce.umin.v16i16(<16 x i16> undef)
  %V32 = call i16 @llvm.vector.reduce.umin.v32i16(<32 x i16> undef)
  %V64 = call i16 @llvm.vector.reduce.umin.v64i16(<64 x i16> undef)
  ret i32 undef
}

define i32 @reduce_i8(i32 %arg) {
; V8M-LABEL: 'reduce_i8'
; V8M-NEXT:  Cost Model: Found an estimated cost of 7 for instruction: %V2 = call i8 @llvm.vector.reduce.umin.v2i8(<2 x i8> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 19 for instruction: %V4 = call i8 @llvm.vector.reduce.umin.v4i8(<4 x i8> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 43 for instruction: %V8 = call i8 @llvm.vector.reduce.umin.v8i8(<8 x i8> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 91 for instruction: %V16 = call i8 @llvm.vector.reduce.umin.v16i8(<16 x i8> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 187 for instruction: %V32 = call i8 @llvm.vector.reduce.umin.v32i8(<32 x i8> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 379 for instruction: %V64 = call i8 @llvm.vector.reduce.umin.v64i8(<64 x i8> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 763 for instruction: %V128 = call i8 @llvm.vector.reduce.umin.v128i8(<128 x i8> undef)
; V8M-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret i32 undef
;
; NEON-LABEL: 'reduce_i8'
; NEON-NEXT:  Cost Model: Found an estimated cost of 17 for instruction: %V2 = call i8 @llvm.vector.reduce.umin.v2i8(<2 x i8> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 55 for instruction: %V4 = call i8 @llvm.vector.reduce.umin.v4i8(<4 x i8> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 153 for instruction: %V8 = call i8 @llvm.vector.reduce.umin.v8i8(<8 x i8> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 395 for instruction: %V16 = call i8 @llvm.vector.reduce.umin.v16i8(<16 x i8> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 493 for instruction: %V32 = call i8 @llvm.vector.reduce.umin.v32i8(<32 x i8> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 689 for instruction: %V64 = call i8 @llvm.vector.reduce.umin.v64i8(<64 x i8> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 1081 for instruction: %V128 = call i8 @llvm.vector.reduce.umin.v128i8(<128 x i8> undef)
; NEON-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; MVE-LABEL: 'reduce_i8'
; MVE-NEXT:  Cost Model: Found an estimated cost of 58 for instruction: %V2 = call i8 @llvm.vector.reduce.umin.v2i8(<2 x i8> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 140 for instruction: %V4 = call i8 @llvm.vector.reduce.umin.v4i8(<4 x i8> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 400 for instruction: %V8 = call i8 @llvm.vector.reduce.umin.v8i8(<8 x i8> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 1044 for instruction: %V16 = call i8 @llvm.vector.reduce.umin.v16i8(<16 x i8> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 1304 for instruction: %V32 = call i8 @llvm.vector.reduce.umin.v32i8(<32 x i8> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 1952 for instruction: %V64 = call i8 @llvm.vector.reduce.umin.v64i8(<64 x i8> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 3248 for instruction: %V128 = call i8 @llvm.vector.reduce.umin.v128i8(<128 x i8> undef)
; MVE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
  %V2   = call i8 @llvm.vector.reduce.umin.v2i8(<2 x i8> undef)
  %V4   = call i8 @llvm.vector.reduce.umin.v4i8(<4 x i8> undef)
  %V8   = call i8 @llvm.vector.reduce.umin.v8i8(<8 x i8> undef)
  %V16  = call i8 @llvm.vector.reduce.umin.v16i8(<16 x i8> undef)
  %V32  = call i8 @llvm.vector.reduce.umin.v32i8(<32 x i8> undef)
  %V64  = call i8 @llvm.vector.reduce.umin.v64i8(<64 x i8> undef)
  %V128 = call i8 @llvm.vector.reduce.umin.v128i8(<128 x i8> undef)
  ret i32 undef
}

declare i64 @llvm.vector.reduce.umin.v1i64(<1 x i64>)
declare i64 @llvm.vector.reduce.umin.v2i64(<2 x i64>)
declare i64 @llvm.vector.reduce.umin.v4i64(<4 x i64>)
declare i64 @llvm.vector.reduce.umin.v8i64(<8 x i64>)
declare i64 @llvm.vector.reduce.umin.v16i64(<16 x i64>)

declare i32 @llvm.vector.reduce.umin.v2i32(<2 x i32>)
declare i32 @llvm.vector.reduce.umin.v4i32(<4 x i32>)
declare i32 @llvm.vector.reduce.umin.v8i32(<8 x i32>)
declare i32 @llvm.vector.reduce.umin.v16i32(<16 x i32>)
declare i32 @llvm.vector.reduce.umin.v32i32(<32 x i32>)

declare i16 @llvm.vector.reduce.umin.v2i16(<2 x i16>)
declare i16 @llvm.vector.reduce.umin.v4i16(<4 x i16>)
declare i16 @llvm.vector.reduce.umin.v8i16(<8 x i16>)
declare i16 @llvm.vector.reduce.umin.v16i16(<16 x i16>)
declare i16 @llvm.vector.reduce.umin.v32i16(<32 x i16>)
declare i16 @llvm.vector.reduce.umin.v64i16(<64 x i16>)

declare i8 @llvm.vector.reduce.umin.v2i8(<2 x i8>)
declare i8 @llvm.vector.reduce.umin.v4i8(<4 x i8>)
declare i8 @llvm.vector.reduce.umin.v8i8(<8 x i8>)
declare i8 @llvm.vector.reduce.umin.v16i8(<16 x i8>)
declare i8 @llvm.vector.reduce.umin.v32i8(<32 x i8>)
declare i8 @llvm.vector.reduce.umin.v64i8(<64 x i8>)
declare i8 @llvm.vector.reduce.umin.v128i8(<128 x i8>)
