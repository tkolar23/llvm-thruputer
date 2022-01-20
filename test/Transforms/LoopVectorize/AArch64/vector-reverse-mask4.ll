; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; This is the loop in c++ being vectorize in this file with
; shuffle reverse

;#pragma clang loop vectorize_width(4, fixed)
;  for (long int i = N - 1; i >= 0; i--)
;  {
;    if (cond[i])
;      a[i] += 1;
;  }

; The test checks if the mask is being correctly created, reverted  and used

; RUN: opt -loop-vectorize -dce -instcombine -mtriple aarch64-linux-gnu -S < %s | FileCheck %s

target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

define void @vector_reverse_mask_v4i1(double* %a, double* %cond, i64 %N) #0 {
; CHECK-LABEL: @vector_reverse_mask_v4i1(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP7:%.*]] = icmp sgt i64 [[N:%.*]], 0
; CHECK-NEXT:    br i1 [[CMP7]], label [[FOR_BODY_PREHEADER:%.*]], label [[FOR_COND_CLEANUP:%.*]]
; CHECK:       for.body.preheader:
; CHECK-NEXT:    [[MIN_ITERS_CHECK:%.*]] = icmp ult i64 [[N]], 8
; CHECK-NEXT:    br i1 [[MIN_ITERS_CHECK]], label [[SCALAR_PH:%.*]], label [[VECTOR_MEMCHECK:%.*]]
; CHECK:       vector.memcheck:
; CHECK-NEXT:    [[SCEVGEP:%.*]] = getelementptr double, double* [[A:%.*]], i64 [[N]]
; CHECK-NEXT:    [[SCEVGEP4:%.*]] = getelementptr double, double* [[COND:%.*]], i64 [[N]]
; CHECK-NEXT:    [[BOUND0:%.*]] = icmp ugt double* [[SCEVGEP4]], [[A]]
; CHECK-NEXT:    [[BOUND1:%.*]] = icmp ugt double* [[SCEVGEP]], [[COND]]
; CHECK-NEXT:    [[FOUND_CONFLICT:%.*]] = and i1 [[BOUND0]], [[BOUND1]]
; CHECK-NEXT:    br i1 [[FOUND_CONFLICT]], label [[SCALAR_PH]], label [[VECTOR_PH:%.*]]
; CHECK:       vector.ph:
; CHECK-NEXT:    [[N_VEC:%.*]] = and i64 [[N]], -8
; CHECK-NEXT:    [[IND_END:%.*]] = and i64 [[N]], 7
; CHECK-NEXT:    br label [[VECTOR_BODY:%.*]]
; CHECK:       vector.body:
; CHECK-NEXT:    [[INDEX:%.*]] = phi i64 [ 0, [[VECTOR_PH]] ], [ [[INDEX_NEXT:%.*]], [[VECTOR_BODY]] ]
; CHECK-NEXT:    [[TMP0:%.*]] = xor i64 [[INDEX]], -1
; CHECK-NEXT:    [[TMP1:%.*]] = add i64 [[TMP0]], [[N]]
; CHECK-NEXT:    [[TMP2:%.*]] = getelementptr inbounds double, double* [[COND]], i64 [[TMP1]]
; CHECK-NEXT:    [[TMP3:%.*]] = getelementptr inbounds double, double* [[TMP2]], i64 -3
; CHECK-NEXT:    [[TMP4:%.*]] = bitcast double* [[TMP3]] to <4 x double>*
; CHECK-NEXT:    [[WIDE_LOAD:%.*]] = load <4 x double>, <4 x double>* [[TMP4]], align 8, !alias.scope !0
; CHECK-NEXT:    [[REVERSE:%.*]] = shufflevector <4 x double> [[WIDE_LOAD]], <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
; CHECK-NEXT:    [[TMP5:%.*]] = getelementptr inbounds double, double* [[TMP2]], i64 -4
; CHECK-NEXT:    [[TMP6:%.*]] = getelementptr inbounds double, double* [[TMP5]], i64 -3
; CHECK-NEXT:    [[TMP7:%.*]] = bitcast double* [[TMP6]] to <4 x double>*
; CHECK-NEXT:    [[WIDE_LOAD6:%.*]] = load <4 x double>, <4 x double>* [[TMP7]], align 8, !alias.scope !0
; CHECK-NEXT:    [[REVERSE7:%.*]] = shufflevector <4 x double> [[WIDE_LOAD6]], <4 x double> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
; CHECK-NEXT:    [[TMP8:%.*]] = fcmp une <4 x double> [[REVERSE]], zeroinitializer
; CHECK-NEXT:    [[TMP9:%.*]] = fcmp une <4 x double> [[REVERSE7]], zeroinitializer
; CHECK-NEXT:    [[TMP10:%.*]] = getelementptr double, double* [[A]], i64 [[TMP1]]
; CHECK-NEXT:    [[TMP11:%.*]] = getelementptr double, double* [[TMP10]], i64 -3
; CHECK-NEXT:    [[REVERSE8:%.*]] = shufflevector <4 x i1> [[TMP8]], <4 x i1> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
; CHECK-NEXT:    [[TMP12:%.*]] = bitcast double* [[TMP11]] to <4 x double>*
; CHECK-NEXT:    [[WIDE_MASKED_LOAD:%.*]] = call <4 x double> @llvm.masked.load.v4f64.p0v4f64(<4 x double>* [[TMP12]], i32 8, <4 x i1> [[REVERSE8]], <4 x double> poison), !alias.scope !3, !noalias !0
; CHECK-NEXT:    [[TMP13:%.*]] = getelementptr double, double* [[TMP10]], i64 -4
; CHECK-NEXT:    [[TMP14:%.*]] = getelementptr double, double* [[TMP13]], i64 -3
; CHECK-NEXT:    [[REVERSE10:%.*]] = shufflevector <4 x i1> [[TMP9]], <4 x i1> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
; CHECK-NEXT:    [[TMP15:%.*]] = bitcast double* [[TMP14]] to <4 x double>*
; CHECK-NEXT:    [[WIDE_MASKED_LOAD11:%.*]] = call <4 x double> @llvm.masked.load.v4f64.p0v4f64(<4 x double>* [[TMP15]], i32 8, <4 x i1> [[REVERSE10]], <4 x double> poison), !alias.scope !3, !noalias !0
; CHECK-NEXT:    [[TMP16:%.*]] = fadd <4 x double> [[WIDE_MASKED_LOAD]], <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>
; CHECK-NEXT:    [[TMP17:%.*]] = fadd <4 x double> [[WIDE_MASKED_LOAD11]], <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>
; CHECK-NEXT:    [[TMP18:%.*]] = bitcast double* [[TMP11]] to <4 x double>*
; CHECK-NEXT:    call void @llvm.masked.store.v4f64.p0v4f64(<4 x double> [[TMP16]], <4 x double>* [[TMP18]], i32 8, <4 x i1> [[REVERSE8]]), !alias.scope !3, !noalias !0
; CHECK-NEXT:    [[TMP19:%.*]] = bitcast double* [[TMP14]] to <4 x double>*
; CHECK-NEXT:    call void @llvm.masked.store.v4f64.p0v4f64(<4 x double> [[TMP17]], <4 x double>* [[TMP19]], i32 8, <4 x i1> [[REVERSE10]]), !alias.scope !3, !noalias !0
; CHECK-NEXT:    [[INDEX_NEXT]] = add nuw i64 [[INDEX]], 8
; CHECK-NEXT:    [[TMP20:%.*]] = icmp eq i64 [[INDEX_NEXT]], [[N_VEC]]
; CHECK-NEXT:    br i1 [[TMP20]], label [[MIDDLE_BLOCK:%.*]], label [[VECTOR_BODY]], !llvm.loop [[LOOP5:![0-9]+]]
; CHECK:       middle.block:
; CHECK-NEXT:    [[CMP_N:%.*]] = icmp eq i64 [[N_VEC]], [[N]]
; CHECK-NEXT:    br i1 [[CMP_N]], label [[FOR_COND_CLEANUP_LOOPEXIT:%.*]], label [[SCALAR_PH]]
; CHECK:       scalar.ph:
; CHECK-NEXT:    [[BC_RESUME_VAL:%.*]] = phi i64 [ [[IND_END]], [[MIDDLE_BLOCK]] ], [ [[N]], [[FOR_BODY_PREHEADER]] ], [ [[N]], [[VECTOR_MEMCHECK]] ]
; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
; CHECK:       for.cond.cleanup.loopexit:
; CHECK-NEXT:    br label [[FOR_COND_CLEANUP]]
; CHECK:       for.cond.cleanup:
; CHECK-NEXT:    ret void
; CHECK:       for.body:
; CHECK-NEXT:    [[I_08_IN:%.*]] = phi i64 [ [[I_08:%.*]], [[FOR_INC:%.*]] ], [ [[BC_RESUME_VAL]], [[SCALAR_PH]] ]
; CHECK-NEXT:    [[I_08]] = add nsw i64 [[I_08_IN]], -1
; CHECK-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds double, double* [[COND]], i64 [[I_08]]
; CHECK-NEXT:    [[TMP21:%.*]] = load double, double* [[ARRAYIDX]], align 8
; CHECK-NEXT:    [[TOBOOL:%.*]] = fcmp une double [[TMP21]], 0.000000e+00
; CHECK-NEXT:    br i1 [[TOBOOL]], label [[IF_THEN:%.*]], label [[FOR_INC]]
; CHECK:       if.then:
; CHECK-NEXT:    [[ARRAYIDX1:%.*]] = getelementptr inbounds double, double* [[A]], i64 [[I_08]]
; CHECK-NEXT:    [[TMP22:%.*]] = load double, double* [[ARRAYIDX1]], align 8
; CHECK-NEXT:    [[ADD:%.*]] = fadd double [[TMP22]], 1.000000e+00
; CHECK-NEXT:    store double [[ADD]], double* [[ARRAYIDX1]], align 8
; CHECK-NEXT:    br label [[FOR_INC]]
; CHECK:       for.inc:
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i64 [[I_08_IN]], 1
; CHECK-NEXT:    br i1 [[CMP]], label [[FOR_BODY]], label [[FOR_COND_CLEANUP_LOOPEXIT]], !llvm.loop [[LOOP8:![0-9]+]]
;

entry:
  %cmp7 = icmp sgt i64 %N, 0
  br i1 %cmp7, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup, %entry
  ret void

for.body:                                         ; preds = %for.body, %entry
  %i.08.in = phi i64 [ %i.08, %for.inc ], [ %N, %entry ]
  %i.08 = add nsw i64 %i.08.in, -1
  %arrayidx = getelementptr inbounds double, double* %cond, i64 %i.08
  %0 = load double, double* %arrayidx, align 8
  %tobool = fcmp une double %0, 0.000000e+00
  br i1 %tobool, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %arrayidx1 = getelementptr inbounds double, double* %a, i64 %i.08
  %1 = load double, double* %arrayidx1, align 8
  %add = fadd double %1, 1.000000e+00
  store double %add, double* %arrayidx1, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %cmp = icmp sgt i64 %i.08.in, 1
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !llvm.loop !0
}

attributes #0 = {"target-cpu"="generic" "target-features"="+neon,+sve" vscale_range(2,0) }


!0 = distinct !{!0, !1, !2, !3, !4, !5}
!1 = !{!"llvm.loop.mustprogress"}
!2 = !{!"llvm.loop.vectorize.width", i32 4}
!3 = !{!"llvm.loop.vectorize.scalable.enable", i1 false}
!4 = !{!"llvm.loop.vectorize.enable", i1 true}
!5 = !{!"llvm.loop.interleave.count", i32 2}
