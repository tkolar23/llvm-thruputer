; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -march=amdgcn -mcpu=bonaire -loop-reduce -S < %s | FileCheck %s

; Test various conditions where OptimizeLoopTermCond doesn't look at a
; memory instruction use and fails to find the address space.

target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5"

define amdgpu_kernel void @local_cmp_user(i32 %arg0) nounwind {
; CHECK-LABEL: @local_cmp_user(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = add i32 [[ARG0:%.*]], 1
; CHECK-NEXT:    br label [[BB11:%.*]]
; CHECK:       bb11:
; CHECK-NEXT:    [[LSR_IV1:%.*]] = phi i32 [ [[LSR_IV_NEXT2:%.*]], [[BB:%.*]] ], [ -2, [[ENTRY:%.*]] ]
; CHECK-NEXT:    [[LSR_IV:%.*]] = phi i32 [ [[LSR_IV_NEXT:%.*]], [[BB]] ], [ [[TMP0]], [[ENTRY]] ]
; CHECK-NEXT:    [[LSR_IV_NEXT]] = add i32 [[LSR_IV]], -1
; CHECK-NEXT:    [[LSR_IV_NEXT2]] = add i32 [[LSR_IV1]], 2
; CHECK-NEXT:    [[C0:%.*]] = icmp eq i32 [[LSR_IV_NEXT]], 0
; CHECK-NEXT:    br i1 [[C0]], label [[BB13:%.*]], label [[BB]]
; CHECK:       bb:
; CHECK-NEXT:    [[T:%.*]] = load i8 addrspace(3)*, i8 addrspace(3)* addrspace(3)* undef, align 4
; CHECK-NEXT:    [[SCEVGEP:%.*]] = getelementptr i8, i8 addrspace(3)* [[T]], i32 [[LSR_IV_NEXT2]]
; CHECK-NEXT:    [[C1:%.*]] = icmp ne i8 addrspace(3)* [[SCEVGEP]], null
; CHECK-NEXT:    br i1 [[C1]], label [[BB11]], label [[BB13]]
; CHECK:       bb13:
; CHECK-NEXT:    unreachable
;
entry:
  br label %bb11

bb11:                                             ; preds = %bb, %entry
  %i = phi i32 [ 0, %entry ], [ %i.next, %bb ]
  %ii = shl i32 %i, 1
  %c0 = icmp eq i32 %i, %arg0
  br i1 %c0, label %bb13, label %bb

bb:                                               ; preds = %bb11
  %t = load i8 addrspace(3)*, i8 addrspace(3)* addrspace(3)* undef, align 4
  %p = getelementptr i8, i8 addrspace(3)* %t, i32 %ii
  %c1 = icmp ne i8 addrspace(3)* %p, null
  %i.next = add i32 %i, 1
  br i1 %c1, label %bb11, label %bb13

bb13:                                             ; preds = %bb, %bb11
  unreachable
}

define amdgpu_kernel void @global_cmp_user(i64 %arg0) nounwind {
; CHECK-LABEL: @global_cmp_user(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = add i64 [[ARG0:%.*]], 1
; CHECK-NEXT:    br label [[BB11:%.*]]
; CHECK:       bb11:
; CHECK-NEXT:    [[LSR_IV1:%.*]] = phi i64 [ [[LSR_IV_NEXT2:%.*]], [[BB:%.*]] ], [ -2, [[ENTRY:%.*]] ]
; CHECK-NEXT:    [[LSR_IV:%.*]] = phi i64 [ [[LSR_IV_NEXT:%.*]], [[BB]] ], [ [[TMP0]], [[ENTRY]] ]
; CHECK-NEXT:    [[LSR_IV_NEXT]] = add i64 [[LSR_IV]], -1
; CHECK-NEXT:    [[LSR_IV_NEXT2]] = add i64 [[LSR_IV1]], 2
; CHECK-NEXT:    [[C0:%.*]] = icmp eq i64 [[LSR_IV_NEXT]], 0
; CHECK-NEXT:    br i1 [[C0]], label [[BB13:%.*]], label [[BB]]
; CHECK:       bb:
; CHECK-NEXT:    [[T:%.*]] = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* undef, align 8
; CHECK-NEXT:    [[SCEVGEP:%.*]] = getelementptr i8, i8 addrspace(1)* [[T]], i64 [[LSR_IV_NEXT2]]
; CHECK-NEXT:    [[C1:%.*]] = icmp ne i8 addrspace(1)* [[SCEVGEP]], null
; CHECK-NEXT:    br i1 [[C1]], label [[BB11]], label [[BB13]]
; CHECK:       bb13:
; CHECK-NEXT:    unreachable
;
entry:
  br label %bb11

bb11:                                             ; preds = %bb, %entry
  %i = phi i64 [ 0, %entry ], [ %i.next, %bb ]
  %ii = shl i64 %i, 1
  %c0 = icmp eq i64 %i, %arg0
  br i1 %c0, label %bb13, label %bb

bb:                                               ; preds = %bb11
  %t = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* undef, align 8
  %p = getelementptr i8, i8 addrspace(1)* %t, i64 %ii
  %c1 = icmp ne i8 addrspace(1)* %p, null
  %i.next = add i64 %i, 1
  br i1 %c1, label %bb11, label %bb13

bb13:                                             ; preds = %bb, %bb11
  unreachable
}

define amdgpu_kernel void @global_gep_user(i32 %arg0) nounwind {
; CHECK-LABEL: @global_gep_user(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = add i32 [[ARG0:%.*]], 1
; CHECK-NEXT:    br label [[BB11:%.*]]
; CHECK:       bb11:
; CHECK-NEXT:    [[LSR_IV1:%.*]] = phi i32 [ [[LSR_IV_NEXT2:%.*]], [[BB:%.*]] ], [ 0, [[ENTRY:%.*]] ]
; CHECK-NEXT:    [[LSR_IV:%.*]] = phi i32 [ [[LSR_IV_NEXT:%.*]], [[BB]] ], [ [[TMP0]], [[ENTRY]] ]
; CHECK-NEXT:    [[LSR_IV_NEXT]] = add i32 [[LSR_IV]], -1
; CHECK-NEXT:    [[LSR_IV_NEXT2]] = add i32 [[LSR_IV1]], 2
; CHECK-NEXT:    [[C0:%.*]] = icmp eq i32 [[LSR_IV_NEXT]], 0
; CHECK-NEXT:    br i1 [[C0]], label [[BB13:%.*]], label [[BB]]
; CHECK:       bb:
; CHECK-NEXT:    [[T:%.*]] = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* undef, align 8
; CHECK-NEXT:    [[IDXPROM:%.*]] = sext i32 [[LSR_IV1]] to i64
; CHECK-NEXT:    [[P:%.*]] = getelementptr i8, i8 addrspace(1)* [[T]], i64 [[IDXPROM]]
; CHECK-NEXT:    [[C1:%.*]] = icmp ne i8 addrspace(1)* [[P]], null
; CHECK-NEXT:    br i1 [[C1]], label [[BB11]], label [[BB13]]
; CHECK:       bb13:
; CHECK-NEXT:    unreachable
;
entry:
  br label %bb11

bb11:                                             ; preds = %bb, %entry
  %i = phi i32 [ 0, %entry ], [ %i.next, %bb ]
  %ii = shl i32 %i, 1
  %c0 = icmp eq i32 %i, %arg0
  br i1 %c0, label %bb13, label %bb

bb:                                               ; preds = %bb11
  %t = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* undef, align 8
  %idxprom = sext i32 %ii to i64
  %p = getelementptr i8, i8 addrspace(1)* %t, i64 %idxprom
  %c1 = icmp ne i8 addrspace(1)* %p, null
  %i.next = add i32 %i, 1
  br i1 %c1, label %bb11, label %bb13

bb13:                                             ; preds = %bb, %bb11
  unreachable
}

define amdgpu_kernel void @global_sext_scale_user(i32 %arg0) nounwind {
; CHECK-LABEL: @global_sext_scale_user(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = add i32 [[ARG0:%.*]], 1
; CHECK-NEXT:    br label [[BB11:%.*]]
; CHECK:       bb11:
; CHECK-NEXT:    [[LSR_IV1:%.*]] = phi i32 [ [[LSR_IV_NEXT2:%.*]], [[BB:%.*]] ], [ 0, [[ENTRY:%.*]] ]
; CHECK-NEXT:    [[LSR_IV:%.*]] = phi i32 [ [[LSR_IV_NEXT:%.*]], [[BB]] ], [ [[TMP0]], [[ENTRY]] ]
; CHECK-NEXT:    [[II_EXT:%.*]] = sext i32 [[LSR_IV1]] to i64
; CHECK-NEXT:    [[LSR_IV_NEXT]] = add i32 [[LSR_IV]], -1
; CHECK-NEXT:    [[LSR_IV_NEXT2]] = add i32 [[LSR_IV1]], 2
; CHECK-NEXT:    [[C0:%.*]] = icmp eq i32 [[LSR_IV_NEXT]], 0
; CHECK-NEXT:    br i1 [[C0]], label [[BB13:%.*]], label [[BB]]
; CHECK:       bb:
; CHECK-NEXT:    [[T:%.*]] = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* undef, align 8
; CHECK-NEXT:    [[P:%.*]] = getelementptr i8, i8 addrspace(1)* [[T]], i64 [[II_EXT]]
; CHECK-NEXT:    [[C1:%.*]] = icmp ne i8 addrspace(1)* [[P]], null
; CHECK-NEXT:    br i1 [[C1]], label [[BB11]], label [[BB13]]
; CHECK:       bb13:
; CHECK-NEXT:    unreachable
;
entry:
  br label %bb11

bb11:                                             ; preds = %bb, %entry
  %i = phi i32 [ 0, %entry ], [ %i.next, %bb ]
  %ii = shl i32 %i, 1
  %ii.ext = sext i32 %ii to i64
  %c0 = icmp eq i32 %i, %arg0
  br i1 %c0, label %bb13, label %bb

bb:                                               ; preds = %bb11
  %t = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* undef, align 8
  %p = getelementptr i8, i8 addrspace(1)* %t, i64 %ii.ext
  %c1 = icmp ne i8 addrspace(1)* %p, null
  %i.next = add i32 %i, 1
  br i1 %c1, label %bb11, label %bb13

bb13:                                             ; preds = %bb, %bb11
  unreachable
}
