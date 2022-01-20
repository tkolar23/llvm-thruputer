; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -slp-vectorizer -S -mtriple=x86_64-unknown-linux-gnu -mcpu=skylake-avx512 | FileCheck %s

%struct.S = type { [8 x i32], [8 x i32], [16 x i32] }

define dso_local void @_Z4testP1S(%struct.S* %p) local_unnamed_addr {
; CHECK-LABEL: @_Z4testP1S(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds [[STRUCT_S:%.*]], %struct.S* [[P:%.*]], i64 0, i32 1, i64 0
; CHECK-NEXT:    [[ARRAYIDX1:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 2, i64 15
; CHECK-NEXT:    [[ARRAYIDX2:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 0
; CHECK-NEXT:    [[ARRAYIDX4:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 1, i64 1
; CHECK-NEXT:    [[ARRAYIDX6:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 2, i64 7
; CHECK-NEXT:    [[ARRAYIDX9:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 1
; CHECK-NEXT:    [[ARRAYIDX11:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 1, i64 2
; CHECK-NEXT:    [[ARRAYIDX13:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 2, i64 6
; CHECK-NEXT:    [[ARRAYIDX16:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 2
; CHECK-NEXT:    [[ARRAYIDX18:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 1, i64 3
; CHECK-NEXT:    [[ARRAYIDX20:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 2, i64 4
; CHECK-NEXT:    [[ARRAYIDX23:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 3
; CHECK-NEXT:    [[ARRAYIDX25:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 1, i64 4
; CHECK-NEXT:    [[ARRAYIDX27:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 2, i64 12
; CHECK-NEXT:    [[ARRAYIDX30:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 4
; CHECK-NEXT:    [[ARRAYIDX32:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 1, i64 5
; CHECK-NEXT:    [[ARRAYIDX34:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 2, i64 13
; CHECK-NEXT:    [[ARRAYIDX37:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 5
; CHECK-NEXT:    [[ARRAYIDX39:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 1, i64 6
; CHECK-NEXT:    [[ARRAYIDX41:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 2, i64 14
; CHECK-NEXT:    [[ARRAYIDX44:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 6
; CHECK-NEXT:    [[ARRAYIDX46:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 1, i64 7
; CHECK-NEXT:    [[TMP0:%.*]] = bitcast i32* [[ARRAYIDX]] to <8 x i32>*
; CHECK-NEXT:    [[TMP1:%.*]] = load <8 x i32>, <8 x i32>* [[TMP0]], align 4
; CHECK-NEXT:    [[ARRAYIDX48:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 2, i64 5
; CHECK-NEXT:    [[TMP2:%.*]] = insertelement <8 x i32*> poison, i32* [[ARRAYIDX1]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = insertelement <8 x i32*> [[TMP2]], i32* [[ARRAYIDX6]], i32 1
; CHECK-NEXT:    [[TMP4:%.*]] = insertelement <8 x i32*> [[TMP3]], i32* [[ARRAYIDX13]], i32 2
; CHECK-NEXT:    [[TMP5:%.*]] = insertelement <8 x i32*> [[TMP4]], i32* [[ARRAYIDX20]], i32 3
; CHECK-NEXT:    [[TMP6:%.*]] = insertelement <8 x i32*> [[TMP5]], i32* [[ARRAYIDX27]], i32 4
; CHECK-NEXT:    [[TMP7:%.*]] = insertelement <8 x i32*> [[TMP6]], i32* [[ARRAYIDX34]], i32 5
; CHECK-NEXT:    [[TMP8:%.*]] = insertelement <8 x i32*> [[TMP7]], i32* [[ARRAYIDX41]], i32 6
; CHECK-NEXT:    [[TMP9:%.*]] = insertelement <8 x i32*> [[TMP8]], i32* [[ARRAYIDX48]], i32 7
; CHECK-NEXT:    [[TMP10:%.*]] = call <8 x i32> @llvm.masked.gather.v8i32.v8p0i32(<8 x i32*> [[TMP9]], i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <8 x i32> undef)
; CHECK-NEXT:    [[TMP11:%.*]] = add nsw <8 x i32> [[TMP10]], [[TMP1]]
; CHECK-NEXT:    [[ARRAYIDX51:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 7
; CHECK-NEXT:    [[TMP12:%.*]] = bitcast i32* [[ARRAYIDX2]] to <8 x i32>*
; CHECK-NEXT:    store <8 x i32> [[TMP11]], <8 x i32>* [[TMP12]], align 4
; CHECK-NEXT:    ret void
;
entry:
  %arrayidx = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 1, i64 0
  %i = load i32, i32* %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 2, i64 15
  %i1 = load i32, i32* %arrayidx1, align 4
  %add = add nsw i32 %i1, %i
  %arrayidx2 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 0
  store i32 %add, i32* %arrayidx2, align 4
  %arrayidx4 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 1, i64 1
  %i2 = load i32, i32* %arrayidx4, align 4
  %arrayidx6 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 2, i64 7
  %i3 = load i32, i32* %arrayidx6, align 4
  %add7 = add nsw i32 %i3, %i2
  %arrayidx9 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 1
  store i32 %add7, i32* %arrayidx9, align 4
  %arrayidx11 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 1, i64 2
  %i4 = load i32, i32* %arrayidx11, align 4
  %arrayidx13 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 2, i64 6
  %i5 = load i32, i32* %arrayidx13, align 4
  %add14 = add nsw i32 %i5, %i4
  %arrayidx16 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 2
  store i32 %add14, i32* %arrayidx16, align 4
  %arrayidx18 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 1, i64 3
  %i6 = load i32, i32* %arrayidx18, align 4
  %arrayidx20 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 2, i64 4
  %i7 = load i32, i32* %arrayidx20, align 4
  %add21 = add nsw i32 %i7, %i6
  %arrayidx23 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 3
  store i32 %add21, i32* %arrayidx23, align 4
  %arrayidx25 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 1, i64 4
  %i8 = load i32, i32* %arrayidx25, align 4
  %arrayidx27 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 2, i64 12
  %i9 = load i32, i32* %arrayidx27, align 4
  %add28 = add nsw i32 %i9, %i8
  %arrayidx30 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 4
  store i32 %add28, i32* %arrayidx30, align 4
  %arrayidx32 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 1, i64 5
  %i10 = load i32, i32* %arrayidx32, align 4
  %arrayidx34 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 2, i64 13
  %i11 = load i32, i32* %arrayidx34, align 4
  %add35 = add nsw i32 %i11, %i10
  %arrayidx37 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 5
  store i32 %add35, i32* %arrayidx37, align 4
  %arrayidx39 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 1, i64 6
  %i12 = load i32, i32* %arrayidx39, align 4
  %arrayidx41 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 2, i64 14
  %i13 = load i32, i32* %arrayidx41, align 4
  %add42 = add nsw i32 %i13, %i12
  %arrayidx44 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 6
  store i32 %add42, i32* %arrayidx44, align 4
  %arrayidx46 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 1, i64 7
  %i14 = load i32, i32* %arrayidx46, align 4
  %arrayidx48 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 2, i64 5
  %i15 = load i32, i32* %arrayidx48, align 4
  %add49 = add nsw i32 %i15, %i14
  %arrayidx51 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 7
  store i32 %add49, i32* %arrayidx51, align 4
  ret void
}

; Test for 2 load groups 4 elements each against different base pointers.
; Both loaded groups are not ordered thus here are few specific points:
; (1) these groups are detected, (2) reordereing shuffles generated and
; (3) these loads vectorized as a part of tree that is seeded by stores
; and with VF=8.

define dso_local void @test_unordered_splits(%struct.S* nocapture %p) local_unnamed_addr {
; CHECK-LABEL: @test_unordered_splits(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[P1:%.*]] = alloca [16 x i32], align 16
; CHECK-NEXT:    [[P2:%.*]] = alloca [16 x i32], align 16
; CHECK-NEXT:    [[G10:%.*]] = getelementptr inbounds [16 x i32], [16 x i32]* [[P1]], i32 0, i64 4
; CHECK-NEXT:    [[G11:%.*]] = getelementptr inbounds [16 x i32], [16 x i32]* [[P1]], i32 0, i64 5
; CHECK-NEXT:    [[G12:%.*]] = getelementptr inbounds [16 x i32], [16 x i32]* [[P1]], i32 0, i64 6
; CHECK-NEXT:    [[G13:%.*]] = getelementptr inbounds [16 x i32], [16 x i32]* [[P1]], i32 0, i64 7
; CHECK-NEXT:    [[G20:%.*]] = getelementptr inbounds [16 x i32], [16 x i32]* [[P2]], i32 0, i64 12
; CHECK-NEXT:    [[G21:%.*]] = getelementptr inbounds [16 x i32], [16 x i32]* [[P2]], i32 0, i64 13
; CHECK-NEXT:    [[G22:%.*]] = getelementptr inbounds [16 x i32], [16 x i32]* [[P2]], i32 0, i64 14
; CHECK-NEXT:    [[G23:%.*]] = getelementptr inbounds [16 x i32], [16 x i32]* [[P2]], i32 0, i64 15
; CHECK-NEXT:    [[ARRAYIDX2:%.*]] = getelementptr inbounds [[STRUCT_S:%.*]], %struct.S* [[P:%.*]], i64 0, i32 0, i64 0
; CHECK-NEXT:    [[ARRAYIDX9:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 1
; CHECK-NEXT:    [[ARRAYIDX16:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 2
; CHECK-NEXT:    [[TMP0:%.*]] = bitcast i32* [[G10]] to <4 x i32>*
; CHECK-NEXT:    [[TMP1:%.*]] = load <4 x i32>, <4 x i32>* [[TMP0]], align 4
; CHECK-NEXT:    [[ARRAYIDX23:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 3
; CHECK-NEXT:    [[ARRAYIDX30:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 4
; CHECK-NEXT:    [[ARRAYIDX37:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 5
; CHECK-NEXT:    [[ARRAYIDX44:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 6
; CHECK-NEXT:    [[TMP2:%.*]] = bitcast i32* [[G20]] to <4 x i32>*
; CHECK-NEXT:    [[TMP3:%.*]] = load <4 x i32>, <4 x i32>* [[TMP2]], align 4
; CHECK-NEXT:    [[ARRAYIDX51:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 7
; CHECK-NEXT:    [[TMP4:%.*]] = shufflevector <4 x i32> [[TMP1]], <4 x i32> poison, <8 x i32> <i32 1, i32 0, i32 2, i32 3, i32 undef, i32 undef, i32 undef, i32 undef>
; CHECK-NEXT:    [[TMP5:%.*]] = shufflevector <8 x i32> poison, <8 x i32> [[TMP4]], <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:    [[TMP6:%.*]] = shufflevector <4 x i32> [[TMP3]], <4 x i32> poison, <8 x i32> <i32 3, i32 1, i32 2, i32 0, i32 undef, i32 undef, i32 undef, i32 undef>
; CHECK-NEXT:    [[TMP7:%.*]] = shufflevector <8 x i32> [[TMP5]], <8 x i32> [[TMP6]], <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 10, i32 11>
; CHECK-NEXT:    [[TMP8:%.*]] = bitcast i32* [[ARRAYIDX2]] to <8 x i32>*
; CHECK-NEXT:    store <8 x i32> [[TMP7]], <8 x i32>* [[TMP8]], align 4
; CHECK-NEXT:    ret void
;
entry:
  %p1 = alloca [16 x i32], align 16
  %p2 = alloca [16 x i32], align 16
  %g10 = getelementptr inbounds [16 x i32], [16 x i32]* %p1, i32 0, i64 4
  %g11 = getelementptr inbounds [16 x i32], [16 x i32]* %p1, i32 0, i64 5
  %g12 = getelementptr inbounds [16 x i32], [16 x i32]* %p1, i32 0, i64 6
  %g13 = getelementptr inbounds [16 x i32], [16 x i32]* %p1, i32 0, i64 7
  %g20 = getelementptr inbounds [16 x i32], [16 x i32]* %p2, i32 0, i64 12
  %g21 = getelementptr inbounds [16 x i32], [16 x i32]* %p2, i32 0, i64 13
  %g22 = getelementptr inbounds [16 x i32], [16 x i32]* %p2, i32 0, i64 14
  %g23 = getelementptr inbounds [16 x i32], [16 x i32]* %p2, i32 0, i64 15
  %i1 = load i32, i32* %g11, align 4
  %arrayidx2 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 0
  store i32 %i1, i32* %arrayidx2, align 4
  %i3 = load i32, i32* %g10, align 4
  %arrayidx9 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 1
  store i32 %i3, i32* %arrayidx9, align 4
  %i5 = load i32, i32* %g12, align 4
  %arrayidx16 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 2
  store i32 %i5, i32* %arrayidx16, align 4
  %i7 = load i32, i32* %g13, align 4
  %arrayidx23 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 3
  store i32 %i7, i32* %arrayidx23, align 4
  %i9 = load i32, i32* %g23, align 4
  %arrayidx30 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 4
  store i32 %i9, i32* %arrayidx30, align 4
  %i11 = load i32, i32* %g21, align 4
  %arrayidx37 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 5
  store i32 %i11, i32* %arrayidx37, align 4
  %i13 = load i32, i32* %g22, align 4
  %arrayidx44 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 6
  store i32 %i13, i32* %arrayidx44, align 4
  %i15 = load i32, i32* %g20, align 4
  %arrayidx51 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 7
  store i32 %i15, i32* %arrayidx51, align 4
  ret void
}

define dso_local void @test_cost_splits(%struct.S* nocapture %p) local_unnamed_addr {
; CHECK-LABEL: @test_cost_splits(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[P1:%.*]] = alloca [16 x i32], align 16
; CHECK-NEXT:    [[P2:%.*]] = alloca [16 x i32], align 16
; CHECK-NEXT:    [[P3:%.*]] = alloca [16 x i32], align 16
; CHECK-NEXT:    [[P4:%.*]] = alloca [16 x i32], align 16
; CHECK-NEXT:    [[G10:%.*]] = getelementptr inbounds [16 x i32], [16 x i32]* [[P1]], i32 0, i64 4
; CHECK-NEXT:    [[G11:%.*]] = getelementptr inbounds [16 x i32], [16 x i32]* [[P1]], i32 0, i64 5
; CHECK-NEXT:    [[G12:%.*]] = getelementptr inbounds [16 x i32], [16 x i32]* [[P2]], i32 0, i64 6
; CHECK-NEXT:    [[G13:%.*]] = getelementptr inbounds [16 x i32], [16 x i32]* [[P2]], i32 0, i64 7
; CHECK-NEXT:    [[G20:%.*]] = getelementptr inbounds [16 x i32], [16 x i32]* [[P3]], i32 0, i64 12
; CHECK-NEXT:    [[G21:%.*]] = getelementptr inbounds [16 x i32], [16 x i32]* [[P3]], i32 0, i64 13
; CHECK-NEXT:    [[G22:%.*]] = getelementptr inbounds [16 x i32], [16 x i32]* [[P4]], i32 0, i64 14
; CHECK-NEXT:    [[G23:%.*]] = getelementptr inbounds [16 x i32], [16 x i32]* [[P4]], i32 0, i64 15
; CHECK-NEXT:    [[ARRAYIDX2:%.*]] = getelementptr inbounds [[STRUCT_S:%.*]], %struct.S* [[P:%.*]], i64 0, i32 0, i64 0
; CHECK-NEXT:    [[TMP0:%.*]] = bitcast i32* [[G10]] to <2 x i32>*
; CHECK-NEXT:    [[TMP1:%.*]] = load <2 x i32>, <2 x i32>* [[TMP0]], align 4
; CHECK-NEXT:    [[ARRAYIDX9:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 1
; CHECK-NEXT:    [[ARRAYIDX16:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 2
; CHECK-NEXT:    [[TMP2:%.*]] = bitcast i32* [[G12]] to <2 x i32>*
; CHECK-NEXT:    [[TMP3:%.*]] = load <2 x i32>, <2 x i32>* [[TMP2]], align 4
; CHECK-NEXT:    [[ARRAYIDX23:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 3
; CHECK-NEXT:    [[ARRAYIDX30:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 4
; CHECK-NEXT:    [[TMP4:%.*]] = bitcast i32* [[G20]] to <2 x i32>*
; CHECK-NEXT:    [[TMP5:%.*]] = load <2 x i32>, <2 x i32>* [[TMP4]], align 4
; CHECK-NEXT:    [[ARRAYIDX37:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 5
; CHECK-NEXT:    [[ARRAYIDX44:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 6
; CHECK-NEXT:    [[TMP6:%.*]] = bitcast i32* [[G22]] to <2 x i32>*
; CHECK-NEXT:    [[TMP7:%.*]] = load <2 x i32>, <2 x i32>* [[TMP6]], align 4
; CHECK-NEXT:    [[ARRAYIDX51:%.*]] = getelementptr inbounds [[STRUCT_S]], %struct.S* [[P]], i64 0, i32 0, i64 7
; CHECK-NEXT:    [[TMP8:%.*]] = shufflevector <2 x i32> [[TMP1]], <2 x i32> poison, <8 x i32> <i32 0, i32 1, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
; CHECK-NEXT:    [[TMP9:%.*]] = shufflevector <2 x i32> [[TMP3]], <2 x i32> poison, <8 x i32> <i32 0, i32 1, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
; CHECK-NEXT:    [[TMP10:%.*]] = shufflevector <8 x i32> [[TMP8]], <8 x i32> [[TMP9]], <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:    [[TMP11:%.*]] = shufflevector <2 x i32> [[TMP5]], <2 x i32> poison, <8 x i32> <i32 0, i32 1, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
; CHECK-NEXT:    [[TMP12:%.*]] = shufflevector <8 x i32> [[TMP10]], <8 x i32> [[TMP11]], <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 6, i32 7>
; CHECK-NEXT:    [[TMP13:%.*]] = shufflevector <2 x i32> [[TMP7]], <2 x i32> poison, <8 x i32> <i32 0, i32 1, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
; CHECK-NEXT:    [[TMP14:%.*]] = shufflevector <8 x i32> [[TMP12]], <8 x i32> [[TMP13]], <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
; CHECK-NEXT:    [[TMP15:%.*]] = bitcast i32* [[ARRAYIDX2]] to <8 x i32>*
; CHECK-NEXT:    store <8 x i32> [[TMP14]], <8 x i32>* [[TMP15]], align 4
; CHECK-NEXT:    ret void
;
entry:
  %p1 = alloca [16 x i32], align 16
  %p2 = alloca [16 x i32], align 16
  %p3 = alloca [16 x i32], align 16
  %p4 = alloca [16 x i32], align 16
  %g10 = getelementptr inbounds [16 x i32], [16 x i32]* %p1, i32 0, i64 4
  %g11 = getelementptr inbounds [16 x i32], [16 x i32]* %p1, i32 0, i64 5
  %g12 = getelementptr inbounds [16 x i32], [16 x i32]* %p2, i32 0, i64 6
  %g13 = getelementptr inbounds [16 x i32], [16 x i32]* %p2, i32 0, i64 7
  %g20 = getelementptr inbounds [16 x i32], [16 x i32]* %p3, i32 0, i64 12
  %g21 = getelementptr inbounds [16 x i32], [16 x i32]* %p3, i32 0, i64 13
  %g22 = getelementptr inbounds [16 x i32], [16 x i32]* %p4, i32 0, i64 14
  %g23 = getelementptr inbounds [16 x i32], [16 x i32]* %p4, i32 0, i64 15
  %i1 = load i32, i32* %g10, align 4
  %arrayidx2 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 0
  store i32 %i1, i32* %arrayidx2, align 4
  %i3 = load i32, i32* %g11, align 4
  %arrayidx9 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 1
  store i32 %i3, i32* %arrayidx9, align 4
  %i5 = load i32, i32* %g12, align 4
  %arrayidx16 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 2
  store i32 %i5, i32* %arrayidx16, align 4
  %i7 = load i32, i32* %g13, align 4
  %arrayidx23 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 3
  store i32 %i7, i32* %arrayidx23, align 4
  %i9 = load i32, i32* %g20, align 4
  %arrayidx30 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 4
  store i32 %i9, i32* %arrayidx30, align 4
  %i11 = load i32, i32* %g21, align 4
  %arrayidx37 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 5
  store i32 %i11, i32* %arrayidx37, align 4
  %i13 = load i32, i32* %g22, align 4
  %arrayidx44 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 6
  store i32 %i13, i32* %arrayidx44, align 4
  %i15 = load i32, i32* %g23, align 4
  %arrayidx51 = getelementptr inbounds %struct.S, %struct.S* %p, i64 0, i32 0, i64 7
  store i32 %i15, i32* %arrayidx51, align 4
  ret void
}
