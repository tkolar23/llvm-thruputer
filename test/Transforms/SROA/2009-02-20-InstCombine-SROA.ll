; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -sroa -S | FileCheck %s

; rdar://6417724

target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:128:128"
target triple = "i386-apple-darwin9.6"

%"struct.std::vector<int,std::allocator<int> >" = type { %"struct.std::_Vector_base<int,std::allocator<int> >" }
%"struct.std::_Vector_base<int,std::allocator<int> >" = type { %"struct.std::_Vector_base<int,std::allocator<int> >::_Vector_impl" }
%"struct.std::_Vector_base<int,std::allocator<int> >::_Vector_impl" = type { i32*, i32*, i32* }

define i32* @_Z3fooRSt6vectorIiSaIiEE(%"struct.std::vector<int,std::allocator<int> >"* %X) {
; CHECK-LABEL: @_Z3fooRSt6vectorIiSaIiEE(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[__FIRST_ADDR_I_I_SROA_0:%.*]] = alloca i32*, align 8
; CHECK-NEXT:    [[__LAST_ADDR_I_I_SROA_0:%.*]] = alloca i32*, align 8
; CHECK-NEXT:    [[TMP0:%.*]] = getelementptr %"struct.std::vector<int,std::allocator<int> >", %"struct.std::vector<int,std::allocator<int> >"* [[X:%.*]], i32 0, i32 0, i32 0, i32 1
; CHECK-NEXT:    [[TMP1:%.*]] = load i32*, i32** [[TMP0]], align 4
; CHECK-NEXT:    [[TMP2:%.*]] = getelementptr %"struct.std::vector<int,std::allocator<int> >", %"struct.std::vector<int,std::allocator<int> >"* [[X]], i32 0, i32 0, i32 0, i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = load i32*, i32** [[TMP2]], align 4
; CHECK-NEXT:    store i32* [[TMP3]], i32** [[__FIRST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    store i32* [[TMP1]], i32** [[__LAST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    [[TMP4:%.*]] = ptrtoint i32* [[TMP1]] to i32
; CHECK-NEXT:    [[TMP5:%.*]] = ptrtoint i32* [[TMP3]] to i32
; CHECK-NEXT:    [[TMP6:%.*]] = sub i32 [[TMP4]], [[TMP5]]
; CHECK-NEXT:    [[TMP7:%.*]] = ashr i32 [[TMP6]], 4
; CHECK-NEXT:    br label [[BB12_I_I:%.*]]
; CHECK:       bb.i.i:
; CHECK-NEXT:    [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_13:%.*]] = load i32*, i32** [[__FIRST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    [[TMP8:%.*]] = load i32, i32* [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_13]], align 4
; CHECK-NEXT:    [[TMP9:%.*]] = icmp eq i32 [[TMP8]], 42
; CHECK-NEXT:    br i1 [[TMP9]], label [[BB1_I_I:%.*]], label [[BB2_I_I:%.*]]
; CHECK:       bb1.i.i:
; CHECK-NEXT:    br label [[_ZST4FINDIN9__GNU_CXX17__NORMAL_ITERATORIPIST6VECTORIISAIIEEEEIET_S7_S7_RKT0__EXIT:%.*]]
; CHECK:       bb2.i.i:
; CHECK-NEXT:    [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_14:%.*]] = load i32*, i32** [[__FIRST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    [[TMP10:%.*]] = getelementptr i32, i32* [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_14]], i32 1
; CHECK-NEXT:    store i32* [[TMP10]], i32** [[__FIRST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    [[TMP11:%.*]] = load i32, i32* [[TMP10]], align 4
; CHECK-NEXT:    [[TMP12:%.*]] = icmp eq i32 [[TMP11]], 42
; CHECK-NEXT:    br i1 [[TMP12]], label [[BB4_I_I:%.*]], label [[BB5_I_I:%.*]]
; CHECK:       bb4.i.i:
; CHECK-NEXT:    br label [[_ZST4FINDIN9__GNU_CXX17__NORMAL_ITERATORIPIST6VECTORIISAIIEEEEIET_S7_S7_RKT0__EXIT]]
; CHECK:       bb5.i.i:
; CHECK-NEXT:    [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_15:%.*]] = load i32*, i32** [[__FIRST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    [[TMP13:%.*]] = getelementptr i32, i32* [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_15]], i32 1
; CHECK-NEXT:    store i32* [[TMP13]], i32** [[__FIRST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    [[TMP14:%.*]] = load i32, i32* [[TMP13]], align 4
; CHECK-NEXT:    [[TMP15:%.*]] = icmp eq i32 [[TMP14]], 42
; CHECK-NEXT:    br i1 [[TMP15]], label [[BB7_I_I:%.*]], label [[BB8_I_I:%.*]]
; CHECK:       bb7.i.i:
; CHECK-NEXT:    br label [[_ZST4FINDIN9__GNU_CXX17__NORMAL_ITERATORIPIST6VECTORIISAIIEEEEIET_S7_S7_RKT0__EXIT]]
; CHECK:       bb8.i.i:
; CHECK-NEXT:    [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_16:%.*]] = load i32*, i32** [[__FIRST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    [[TMP16:%.*]] = getelementptr i32, i32* [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_16]], i32 1
; CHECK-NEXT:    store i32* [[TMP16]], i32** [[__FIRST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    [[TMP17:%.*]] = load i32, i32* [[TMP16]], align 4
; CHECK-NEXT:    [[TMP18:%.*]] = icmp eq i32 [[TMP17]], 42
; CHECK-NEXT:    br i1 [[TMP18]], label [[BB10_I_I:%.*]], label [[BB11_I_I:%.*]]
; CHECK:       bb10.i.i:
; CHECK-NEXT:    br label [[_ZST4FINDIN9__GNU_CXX17__NORMAL_ITERATORIPIST6VECTORIISAIIEEEEIET_S7_S7_RKT0__EXIT]]
; CHECK:       bb11.i.i:
; CHECK-NEXT:    [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_17:%.*]] = load i32*, i32** [[__FIRST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    [[TMP19:%.*]] = getelementptr i32, i32* [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_17]], i32 1
; CHECK-NEXT:    store i32* [[TMP19]], i32** [[__FIRST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    [[TMP20:%.*]] = add i32 [[__TRIP_COUNT_0_I_I:%.*]], -1
; CHECK-NEXT:    br label [[BB12_I_I]]
; CHECK:       bb12.i.i:
; CHECK-NEXT:    [[__TRIP_COUNT_0_I_I]] = phi i32 [ [[TMP7]], [[ENTRY:%.*]] ], [ [[TMP20]], [[BB11_I_I]] ]
; CHECK-NEXT:    [[TMP21:%.*]] = icmp sgt i32 [[__TRIP_COUNT_0_I_I]], 0
; CHECK-NEXT:    br i1 [[TMP21]], label [[BB_I_I:%.*]], label [[BB13_I_I:%.*]]
; CHECK:       bb13.i.i:
; CHECK-NEXT:    [[__LAST_ADDR_I_I_SROA_0_0___LAST_ADDR_I_I_SROA_0_0___LAST_ADDR_I_I_SROA_0_0___LAST_ADDR_I_I_SROA_0_0_:%.*]] = load i32*, i32** [[__LAST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    [[TMP22:%.*]] = ptrtoint i32* [[__LAST_ADDR_I_I_SROA_0_0___LAST_ADDR_I_I_SROA_0_0___LAST_ADDR_I_I_SROA_0_0___LAST_ADDR_I_I_SROA_0_0_]] to i32
; CHECK-NEXT:    [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_:%.*]] = load i32*, i32** [[__FIRST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    [[TMP23:%.*]] = ptrtoint i32* [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_]] to i32
; CHECK-NEXT:    [[TMP24:%.*]] = sub i32 [[TMP22]], [[TMP23]]
; CHECK-NEXT:    [[TMP25:%.*]] = ashr i32 [[TMP24]], 2
; CHECK-NEXT:    switch i32 [[TMP25]], label [[BB26_I_I:%.*]] [
; CHECK-NEXT:    i32 1, label [[BB22_I_I:%.*]]
; CHECK-NEXT:    i32 2, label [[BB18_I_I:%.*]]
; CHECK-NEXT:    i32 3, label [[BB14_I_I:%.*]]
; CHECK-NEXT:    ]
; CHECK:       bb14.i.i:
; CHECK-NEXT:    [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_7:%.*]] = load i32*, i32** [[__FIRST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    [[TMP26:%.*]] = load i32, i32* [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_7]], align 4
; CHECK-NEXT:    [[TMP27:%.*]] = icmp eq i32 [[TMP26]], 42
; CHECK-NEXT:    br i1 [[TMP27]], label [[BB16_I_I:%.*]], label [[BB17_I_I:%.*]]
; CHECK:       bb16.i.i:
; CHECK-NEXT:    br label [[_ZST4FINDIN9__GNU_CXX17__NORMAL_ITERATORIPIST6VECTORIISAIIEEEEIET_S7_S7_RKT0__EXIT]]
; CHECK:       bb17.i.i:
; CHECK-NEXT:    [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_8:%.*]] = load i32*, i32** [[__FIRST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    [[TMP28:%.*]] = getelementptr i32, i32* [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_8]], i32 1
; CHECK-NEXT:    store i32* [[TMP28]], i32** [[__FIRST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    br label [[BB18_I_I]]
; CHECK:       bb18.i.i:
; CHECK-NEXT:    [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_9:%.*]] = load i32*, i32** [[__FIRST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    [[TMP29:%.*]] = load i32, i32* [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_9]], align 4
; CHECK-NEXT:    [[TMP30:%.*]] = icmp eq i32 [[TMP29]], 42
; CHECK-NEXT:    br i1 [[TMP30]], label [[BB20_I_I:%.*]], label [[BB21_I_I:%.*]]
; CHECK:       bb20.i.i:
; CHECK-NEXT:    br label [[_ZST4FINDIN9__GNU_CXX17__NORMAL_ITERATORIPIST6VECTORIISAIIEEEEIET_S7_S7_RKT0__EXIT]]
; CHECK:       bb21.i.i:
; CHECK-NEXT:    [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_10:%.*]] = load i32*, i32** [[__FIRST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    [[TMP31:%.*]] = getelementptr i32, i32* [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_10]], i32 1
; CHECK-NEXT:    store i32* [[TMP31]], i32** [[__FIRST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    br label [[BB22_I_I]]
; CHECK:       bb22.i.i:
; CHECK-NEXT:    [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_11:%.*]] = load i32*, i32** [[__FIRST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    [[TMP32:%.*]] = load i32, i32* [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_11]], align 4
; CHECK-NEXT:    [[TMP33:%.*]] = icmp eq i32 [[TMP32]], 42
; CHECK-NEXT:    br i1 [[TMP33]], label [[BB24_I_I:%.*]], label [[BB25_I_I:%.*]]
; CHECK:       bb24.i.i:
; CHECK-NEXT:    br label [[_ZST4FINDIN9__GNU_CXX17__NORMAL_ITERATORIPIST6VECTORIISAIIEEEEIET_S7_S7_RKT0__EXIT]]
; CHECK:       bb25.i.i:
; CHECK-NEXT:    [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_12:%.*]] = load i32*, i32** [[__FIRST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    [[TMP34:%.*]] = getelementptr i32, i32* [[__FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0___FIRST_ADDR_I_I_SROA_0_0_12]], i32 1
; CHECK-NEXT:    store i32* [[TMP34]], i32** [[__FIRST_ADDR_I_I_SROA_0]], align 8
; CHECK-NEXT:    br label [[BB26_I_I]]
; CHECK:       bb26.i.i:
; CHECK-NEXT:    br label [[_ZST4FINDIN9__GNU_CXX17__NORMAL_ITERATORIPIST6VECTORIISAIIEEEEIET_S7_S7_RKT0__EXIT]]
; CHECK:       _ZSt4findIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEEiET_S7_S7_RKT0_.exit:
; CHECK-NEXT:    [[DOTIN_IN:%.*]] = phi i32** [ [[__LAST_ADDR_I_I_SROA_0]], [[BB26_I_I]] ], [ [[__FIRST_ADDR_I_I_SROA_0]], [[BB24_I_I]] ], [ [[__FIRST_ADDR_I_I_SROA_0]], [[BB20_I_I]] ], [ [[__FIRST_ADDR_I_I_SROA_0]], [[BB16_I_I]] ], [ [[__FIRST_ADDR_I_I_SROA_0]], [[BB10_I_I]] ], [ [[__FIRST_ADDR_I_I_SROA_0]], [[BB7_I_I]] ], [ [[__FIRST_ADDR_I_I_SROA_0]], [[BB4_I_I]] ], [ [[__FIRST_ADDR_I_I_SROA_0]], [[BB1_I_I]] ]
; CHECK-NEXT:    br label [[RETURN:%.*]]
; CHECK:       return:
; CHECK-NEXT:    [[TMP35:%.*]] = load i32*, i32** [[DOTIN_IN]], align 4
; CHECK-NEXT:    ret i32* [[TMP35]]
;
entry:
  %__first_addr.i.i.sroa.0 = alloca i32*, align 8
  %__last_addr.i.i.sroa.0 = alloca i32*, align 8
  %0 = getelementptr %"struct.std::vector<int,std::allocator<int> >", %"struct.std::vector<int,std::allocator<int> >"* %X, i32 0, i32 0, i32 0, i32 1
  %1 = load i32*, i32** %0, align 4
  %2 = getelementptr %"struct.std::vector<int,std::allocator<int> >", %"struct.std::vector<int,std::allocator<int> >"* %X, i32 0, i32 0, i32 0, i32 0
  %3 = load i32*, i32** %2, align 4
  store i32* %3, i32** %__first_addr.i.i.sroa.0, align 8
  store i32* %1, i32** %__last_addr.i.i.sroa.0, align 8
  %4 = ptrtoint i32* %1 to i32
  %5 = ptrtoint i32* %3 to i32
  %6 = sub i32 %4, %5
  %7 = ashr i32 %6, 4
  br label %bb12.i.i

bb.i.i:                                           ; preds = %bb12.i.i
  %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.13 = load i32*, i32** %__first_addr.i.i.sroa.0, align 8
  %8 = load i32, i32* %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.13, align 4
  %9 = icmp eq i32 %8, 42
  br i1 %9, label %bb1.i.i, label %bb2.i.i

bb1.i.i:                                          ; preds = %bb.i.i
  br label %_ZSt4findIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEEiET_S7_S7_RKT0_.exit

bb2.i.i:                                          ; preds = %bb.i.i
  %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.14 = load i32*, i32** %__first_addr.i.i.sroa.0, align 8
  %10 = getelementptr i32, i32* %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.14, i32 1
  store i32* %10, i32** %__first_addr.i.i.sroa.0, align 8
  %11 = load i32, i32* %10, align 4
  %12 = icmp eq i32 %11, 42
  br i1 %12, label %bb4.i.i, label %bb5.i.i

bb4.i.i:                                          ; preds = %bb2.i.i
  br label %_ZSt4findIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEEiET_S7_S7_RKT0_.exit

bb5.i.i:                                          ; preds = %bb2.i.i
  %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.15 = load i32*, i32** %__first_addr.i.i.sroa.0, align 8
  %13 = getelementptr i32, i32* %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.15, i32 1
  store i32* %13, i32** %__first_addr.i.i.sroa.0, align 8
  %14 = load i32, i32* %13, align 4
  %15 = icmp eq i32 %14, 42
  br i1 %15, label %bb7.i.i, label %bb8.i.i

bb7.i.i:                                          ; preds = %bb5.i.i
  br label %_ZSt4findIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEEiET_S7_S7_RKT0_.exit

bb8.i.i:                                          ; preds = %bb5.i.i
  %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.16 = load i32*, i32** %__first_addr.i.i.sroa.0, align 8
  %16 = getelementptr i32, i32* %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.16, i32 1
  store i32* %16, i32** %__first_addr.i.i.sroa.0, align 8
  %17 = load i32, i32* %16, align 4
  %18 = icmp eq i32 %17, 42
  br i1 %18, label %bb10.i.i, label %bb11.i.i

bb10.i.i:                                         ; preds = %bb8.i.i
  br label %_ZSt4findIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEEiET_S7_S7_RKT0_.exit

bb11.i.i:                                         ; preds = %bb8.i.i
  %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.17 = load i32*, i32** %__first_addr.i.i.sroa.0, align 8
  %19 = getelementptr i32, i32* %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.17, i32 1
  store i32* %19, i32** %__first_addr.i.i.sroa.0, align 8
  %20 = add i32 %__trip_count.0.i.i, -1
  br label %bb12.i.i

bb12.i.i:                                         ; preds = %bb11.i.i, %entry
  %__trip_count.0.i.i = phi i32 [ %7, %entry ], [ %20, %bb11.i.i ]
  %21 = icmp sgt i32 %__trip_count.0.i.i, 0
  br i1 %21, label %bb.i.i, label %bb13.i.i

bb13.i.i:                                         ; preds = %bb12.i.i
  %__last_addr.i.i.sroa.0.0.__last_addr.i.i.sroa.0.0.__last_addr.i.i.sroa.0.0. = load i32*, i32** %__last_addr.i.i.sroa.0, align 8
  %22 = ptrtoint i32* %__last_addr.i.i.sroa.0.0.__last_addr.i.i.sroa.0.0.__last_addr.i.i.sroa.0.0. to i32
  %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0. = load i32*, i32** %__first_addr.i.i.sroa.0, align 8
  %23 = ptrtoint i32* %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0. to i32
  %24 = sub i32 %22, %23
  %25 = ashr i32 %24, 2
  switch i32 %25, label %bb26.i.i [
  i32 1, label %bb22.i.i
  i32 2, label %bb18.i.i
  i32 3, label %bb14.i.i
  ]

bb14.i.i:                                         ; preds = %bb13.i.i
  %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.7 = load i32*, i32** %__first_addr.i.i.sroa.0, align 8
  %26 = load i32, i32* %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.7, align 4
  %27 = icmp eq i32 %26, 42
  br i1 %27, label %bb16.i.i, label %bb17.i.i

bb16.i.i:                                         ; preds = %bb14.i.i
  br label %_ZSt4findIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEEiET_S7_S7_RKT0_.exit

bb17.i.i:                                         ; preds = %bb14.i.i
  %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.8 = load i32*, i32** %__first_addr.i.i.sroa.0, align 8
  %28 = getelementptr i32, i32* %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.8, i32 1
  store i32* %28, i32** %__first_addr.i.i.sroa.0, align 8
  br label %bb18.i.i

bb18.i.i:                                         ; preds = %bb17.i.i, %bb13.i.i
  %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.9 = load i32*, i32** %__first_addr.i.i.sroa.0, align 8
  %29 = load i32, i32* %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.9, align 4
  %30 = icmp eq i32 %29, 42
  br i1 %30, label %bb20.i.i, label %bb21.i.i

bb20.i.i:                                         ; preds = %bb18.i.i
  br label %_ZSt4findIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEEiET_S7_S7_RKT0_.exit

bb21.i.i:                                         ; preds = %bb18.i.i
  %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.10 = load i32*, i32** %__first_addr.i.i.sroa.0, align 8
  %31 = getelementptr i32, i32* %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.10, i32 1
  store i32* %31, i32** %__first_addr.i.i.sroa.0, align 8
  br label %bb22.i.i

bb22.i.i:                                         ; preds = %bb21.i.i, %bb13.i.i
  %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.11 = load i32*, i32** %__first_addr.i.i.sroa.0, align 8
  %32 = load i32, i32* %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.11, align 4
  %33 = icmp eq i32 %32, 42
  br i1 %33, label %bb24.i.i, label %bb25.i.i

bb24.i.i:                                         ; preds = %bb22.i.i
  br label %_ZSt4findIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEEiET_S7_S7_RKT0_.exit

bb25.i.i:                                         ; preds = %bb22.i.i
  %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.12 = load i32*, i32** %__first_addr.i.i.sroa.0, align 8
  %34 = getelementptr i32, i32* %__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.__first_addr.i.i.sroa.0.0.12, i32 1
  store i32* %34, i32** %__first_addr.i.i.sroa.0, align 8
  br label %bb26.i.i

bb26.i.i:                                         ; preds = %bb25.i.i, %bb13.i.i
  br label %_ZSt4findIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEEiET_S7_S7_RKT0_.exit

_ZSt4findIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEEiET_S7_S7_RKT0_.exit: ; preds = %bb26.i.i, %bb24.i.i, %bb20.i.i, %bb16.i.i, %bb10.i.i, %bb7.i.i, %bb4.i.i, %bb1.i.i
  %.in.in = phi i32** [ %__last_addr.i.i.sroa.0, %bb26.i.i ], [ %__first_addr.i.i.sroa.0, %bb24.i.i ], [ %__first_addr.i.i.sroa.0, %bb20.i.i ], [ %__first_addr.i.i.sroa.0, %bb16.i.i ], [ %__first_addr.i.i.sroa.0, %bb10.i.i ], [ %__first_addr.i.i.sroa.0, %bb7.i.i ], [ %__first_addr.i.i.sroa.0, %bb4.i.i ], [ %__first_addr.i.i.sroa.0, %bb1.i.i ]
  br label %return

return:                                           ; preds = %_ZSt4findIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEEiET_S7_S7_RKT0_.exit
  %35 = load i32*, i32** %.in.in, align 4
  ret i32* %35
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #0

attributes #0 = { argmemonly nofree nosync nounwind willreturn }
