; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=x86_64-linux-gnu %s -o - | FileCheck %s

%struct.S = type <{ i16, i24, [5 x i8], i8, i16, [2 x i8] }>

@z = dso_local global { i16, i8, i8, i8, i8, i8, i8, i8, i8, i8, [5 x i8] } { i16 -724, i8 94, i8 -18, i8 5, i8 undef, i8 96, i8 104, i8 -24, i8 10, i8 0, [5 x i8] undef }, align 8
@tf_3_var_136 = dso_local global i64 0, align 8
@.str = private unnamed_addr constant [6 x i8] c"%llu\0A\00", align 1

define dso_local void @PR35763() {
; CHECK-LABEL: PR35763:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    movzwl z(%rip), %eax
; CHECK-NEXT:    movzwl z+2(%rip), %ecx
; CHECK-NEXT:    orl %eax, %ecx
; CHECK-NEXT:    movq %rcx, tf_3_var_136(%rip)
; CHECK-NEXT:    movl z+6(%rip), %eax
; CHECK-NEXT:    movzbl z+10(%rip), %ecx
; CHECK-NEXT:    shlq $32, %rcx
; CHECK-NEXT:    orq %rax, %rcx
; CHECK-NEXT:    movabsq $1090921758719, %rax # imm = 0xFE0000FFFF
; CHECK-NEXT:    andq %rcx, %rax
; CHECK-NEXT:    movl %eax, z+6(%rip)
; CHECK-NEXT:    shrq $32, %rax
; CHECK-NEXT:    movb %al, z+10(%rip)
; CHECK-NEXT:    retq
entry:
  %0 = load i16, i16* getelementptr inbounds (%struct.S, %struct.S* bitcast ({ i16, i8, i8, i8, i8, i8, i8, i8, i8, i8, [5 x i8] }* @z to %struct.S*), i32 0, i32 0), align 8
  %conv = sext i16 %0 to i32
  %bf.load = load i32, i32* bitcast (i24* getelementptr inbounds (%struct.S, %struct.S* bitcast ({ i16, i8, i8, i8, i8, i8, i8, i8, i8, i8, [5 x i8] }* @z to %struct.S*), i32 0, i32 1) to i32*), align 2
  %bf.clear = and i32 %bf.load, 2097151
  %bf.cast = zext i32 %bf.clear to i64
  %conv1 = trunc i64 %bf.cast to i32
  %or = or i32 %conv, %conv1
  %conv2 = trunc i32 %or to i16
  %conv3 = zext i16 %conv2 to i64
  store i64 %conv3, i64* @tf_3_var_136, align 8
  %bf.load4 = load i40, i40* bitcast ([5 x i8]* getelementptr inbounds (%struct.S, %struct.S* bitcast ({ i16, i8, i8, i8, i8, i8, i8, i8, i8, i8, [5 x i8] }* @z to %struct.S*), i32 0, i32 2) to i40*), align 2
  %bf.clear5 = and i40 %bf.load4, -8589869057
  store i40 %bf.clear5, i40* bitcast ([5 x i8]* getelementptr inbounds (%struct.S, %struct.S* bitcast ({ i16, i8, i8, i8, i8, i8, i8, i8, i8, i8, [5 x i8] }* @z to %struct.S*), i32 0, i32 2) to i40*), align 2
  ret void
}
