; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -enable-coroutines -passes='default<O2>' -S | FileCheck %s
target datalayout = "E-p:32:32"

define i8* @f(i8* %buffer, i32 %n, i8** swifterror %errorslot) {
; CHECK-LABEL: @f(
; CHECK-NEXT:  coro.return:
; CHECK-NEXT:    [[N_VAL_SPILL_ADDR:%.*]] = bitcast i8* [[BUFFER:%.*]] to i32*
; CHECK-NEXT:    store i32 [[N:%.*]], i32* [[N_VAL_SPILL_ADDR]], align 4
; CHECK-NEXT:    tail call void @print(i32 [[N]])
; CHECK-NEXT:    store i8* null, i8** [[ERRORSLOT:%.*]], align 4
; CHECK-NEXT:    tail call void @maybeThrow(i8** nonnull swifterror [[ERRORSLOT]])
; CHECK-NEXT:    [[TMP0:%.*]] = load i8*, i8** [[ERRORSLOT]], align 4
; CHECK-NEXT:    tail call void @logError(i8* [[TMP0]])
; CHECK-NEXT:    store i8* [[TMP0]], i8** [[ERRORSLOT]], align 4
; CHECK-NEXT:    ret i8* bitcast (i8* (i8*, i1, i8**)* @f.resume.0 to i8*)
;
entry:
  %id = call token @llvm.coro.id.retcon(i32 8, i32 4, i8* %buffer, i8* bitcast (i8* (i8*, i1, i8**)* @f_prototype to i8*), i8* bitcast (i8* (i32)* @allocate to i8*), i8* bitcast (void (i8*)* @deallocate to i8*))
  %hdl = call i8* @llvm.coro.begin(token %id, i8* null)
  br label %loop

loop:
  %n.val = phi i32 [ %n, %entry ], [ %inc, %resume ]
  call void @print(i32 %n.val)
  call void @maybeThrow(i8** swifterror %errorslot)
  %errorload1 = load i8*, i8** %errorslot
  call void @logError(i8* %errorload1)
  %suspend_result = call { i1, i8** } (...) @llvm.coro.suspend.retcon.i1p0p0i8()
  %unwind0 = extractvalue { i1, i8** } %suspend_result, 0
  br i1 %unwind0, label %cleanup, label %resume

resume:
  %inc = add i32 %n.val, 1
  br label %loop

cleanup:
  call i1 @llvm.coro.end(i8* %hdl, i1 0)
  unreachable
}

;   TODO: figure out a way to eliminate this


define i8* @g(i8* %buffer, i32 %n) {
; CHECK-LABEL: @g(
; CHECK-NEXT:  coro.return:
; CHECK-NEXT:    [[TMP0:%.*]] = alloca swifterror i8*, align 4
; CHECK-NEXT:    [[N_VAL_SPILL_ADDR:%.*]] = bitcast i8* [[BUFFER:%.*]] to i32*
; CHECK-NEXT:    store i32 [[N:%.*]], i32* [[N_VAL_SPILL_ADDR]], align 4
; CHECK-NEXT:    tail call void @print(i32 [[N]])
; CHECK-NEXT:    store i8* null, i8** [[TMP0]], align 4
; CHECK-NEXT:    call void @maybeThrow(i8** nonnull swifterror [[TMP0]])
; CHECK-NEXT:    [[TMP1:%.*]] = load i8*, i8** [[TMP0]], align 4
; CHECK-NEXT:    [[DOTSPILL_ADDR:%.*]] = getelementptr inbounds i8, i8* [[BUFFER]], i32 4
; CHECK-NEXT:    [[TMP2:%.*]] = bitcast i8* [[DOTSPILL_ADDR]] to i8**
; CHECK-NEXT:    store i8* [[TMP1]], i8** [[TMP2]], align 4
; CHECK-NEXT:    call void @logError(i8* [[TMP1]])
; CHECK-NEXT:    ret i8* bitcast (i8* (i8*, i1)* @g.resume.0 to i8*)
;
entry:
  %errorslot = alloca swifterror i8*, align 4
  store i8* null, i8** %errorslot
  %id = call token @llvm.coro.id.retcon(i32 8, i32 4, i8* %buffer, i8* bitcast (i8* (i8*, i1)* @g_prototype to i8*), i8* bitcast (i8* (i32)* @allocate to i8*), i8* bitcast (void (i8*)* @deallocate to i8*))
  %hdl = call i8* @llvm.coro.begin(token %id, i8* null)
  br label %loop

loop:
  %n.val = phi i32 [ %n, %entry ], [ %inc, %resume ]
  call void @print(i32 %n.val)
  call void @maybeThrow(i8** swifterror %errorslot)
  %errorload1 = load i8*, i8** %errorslot
  call void @logError(i8* %errorload1)
  %unwind0 = call i1 (...) @llvm.coro.suspend.retcon.i1()
  br i1 %unwind0, label %cleanup, label %resume

resume:
  %inc = add i32 %n.val, 1
  br label %loop

cleanup:
  call i1 @llvm.coro.end(i8* %hdl, i1 0)
  unreachable
}



declare token @llvm.coro.id.retcon(i32, i32, i8*, i8*, i8*, i8*)
declare i8* @llvm.coro.begin(token, i8*)
declare { i1, i8** } @llvm.coro.suspend.retcon.i1p0p0i8(...)
declare i1 @llvm.coro.suspend.retcon.i1(...)
declare i1 @llvm.coro.end(i8*, i1)
declare i8* @llvm.coro.prepare.retcon(i8*)

declare i8* @f_prototype(i8*, i1 zeroext, i8** swifterror)
declare i8* @g_prototype(i8*, i1 zeroext)

declare noalias i8* @allocate(i32 %size)
declare void @deallocate(i8* %ptr)

declare void @print(i32)
declare void @maybeThrow(i8** swifterror)
declare void @logError(i8*)
