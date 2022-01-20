; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --function-signature --check-globals
; RUN: opt -S -passes=openmp-opt < %s | FileCheck %s
target triple = "nvptx64"

%struct.ident_t = type { i32, i32, i32, i32, i8* }

@kernel0_exec_mode = weak constant i8 1

@G = external global i32
;.
; CHECK: @[[KERNEL0_EXEC_MODE:[a-zA-Z0-9_$"\\.-]+]] = weak constant i8 3
; CHECK: @[[G:[a-zA-Z0-9_$"\\.-]+]] = external global i32
; CHECK: @[[KERNEL1_EXEC_MODE:[a-zA-Z0-9_$"\\.-]+]] = weak constant i8 3
; CHECK: @[[KERNEL2_EXEC_MODE:[a-zA-Z0-9_$"\\.-]+]] = weak constant i8 3
; CHECK: @[[GLOB0:[0-9]+]] = private unnamed_addr constant [23 x i8] c"
; CHECK: @[[GLOB1:[0-9]+]] = private unnamed_addr constant [[STRUCT_IDENT_T:%.*]] { i32 0, i32 2, i32 0, i32 22, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @[[GLOB0]], i32 0, i32 0) }, align 8
;.
define weak void @kernel0() #0 {
; CHECK-LABEL: define {{[^@]+}}@kernel0
; CHECK-SAME: () #[[ATTR0:[0-9]+]] {
; CHECK-NEXT:    [[I:%.*]] = call i32 @__kmpc_target_init(%struct.ident_t* null, i8 2, i1 false, i1 false)
; CHECK-NEXT:    call void @helper0() #[[ATTR1:[0-9]+]]
; CHECK-NEXT:    call void @helper1() #[[ATTR1]]
; CHECK-NEXT:    call void @helper2() #[[ATTR1]]
; CHECK-NEXT:    call void @__kmpc_target_deinit(%struct.ident_t* null, i8 2, i1 false)
; CHECK-NEXT:    ret void
;
  %i = call i32 @__kmpc_target_init(%struct.ident_t* null, i8 1, i1 false, i1 false)
  call void @helper0()
  call void @helper1()
  call void @helper2()
  call void @__kmpc_target_deinit(%struct.ident_t* null, i8 1, i1 false)
  ret void
}

@kernel1_exec_mode = weak constant i8 1

define weak void @kernel1() #0 {
; CHECK-LABEL: define {{[^@]+}}@kernel1
; CHECK-SAME: () #[[ATTR0]] {
; CHECK-NEXT:    [[I:%.*]] = call i32 @__kmpc_target_init(%struct.ident_t* null, i8 2, i1 false, i1 false)
; CHECK-NEXT:    call void @helper1() #[[ATTR1]]
; CHECK-NEXT:    call void @__kmpc_target_deinit(%struct.ident_t* null, i8 2, i1 false)
; CHECK-NEXT:    ret void
;
  %i = call i32 @__kmpc_target_init(%struct.ident_t* null, i8 1, i1 false, i1 false)
  call void @helper1()
  call void @__kmpc_target_deinit(%struct.ident_t* null, i8 1, i1 false)
  ret void
}

@kernel2_exec_mode = weak constant i8 1

define weak void @kernel2() #0 {
; CHECK-LABEL: define {{[^@]+}}@kernel2
; CHECK-SAME: () #[[ATTR0]] {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CAPTURED_VARS_ADDRS:%.*]] = alloca [0 x i8*], align 8
; CHECK-NEXT:    [[I:%.*]] = call i32 @__kmpc_target_init(%struct.ident_t* null, i8 2, i1 false, i1 false)
; CHECK-NEXT:    [[EXEC_USER_CODE:%.*]] = icmp eq i32 [[I]], -1
; CHECK-NEXT:    br i1 [[EXEC_USER_CODE]], label [[USER_CODE_ENTRY:%.*]], label [[COMMON_RET:%.*]]
; CHECK:       common.ret:
; CHECK-NEXT:    ret void
; CHECK:       user_code.entry:
; CHECK-NEXT:    [[TMP0:%.*]] = call i32 @__kmpc_global_thread_num(%struct.ident_t* null) #[[ATTR1]]
; CHECK-NEXT:    [[TMP1:%.*]] = bitcast [0 x i8*]* [[CAPTURED_VARS_ADDRS]] to i8**
; CHECK-NEXT:    call void @helper0() #[[ATTR1]]
; CHECK-NEXT:    call void @helper1() #[[ATTR1]]
; CHECK-NEXT:    call void @helper2() #[[ATTR1]]
; CHECK-NEXT:    call void @__kmpc_parallel_51(%struct.ident_t* null, i32 [[TMP0]], i32 1, i32 -1, i32 -1, i8* bitcast (void (i32*, i32*)* @__omp_outlined__ to i8*), i8* bitcast (void (i16, i32)* @__omp_outlined___wrapper to i8*), i8** [[TMP1]], i64 0)
; CHECK-NEXT:    call void @__kmpc_target_deinit(%struct.ident_t* null, i8 2, i1 false)
; CHECK-NEXT:    ret void
;
entry:
  %captured_vars_addrs = alloca [0 x i8*], align 8
  %i = call i32 @__kmpc_target_init(%struct.ident_t* null, i8 1, i1 true, i1 true)
  %exec_user_code = icmp eq i32 %i, -1
  br i1 %exec_user_code, label %user_code.entry, label %common.ret

common.ret:
  ret void

user_code.entry:
  %0 = call i32 @__kmpc_global_thread_num(%struct.ident_t* null)
  %1 = bitcast [0 x i8*]* %captured_vars_addrs to i8**
  call void @helper0()
  call void @helper1()
  call void @helper2()
  call void @__kmpc_parallel_51(%struct.ident_t* null, i32 %0, i32 1, i32 -1, i32 -1, i8* bitcast (void (i32*, i32*)* @__omp_outlined__ to i8*), i8* bitcast (void (i16, i32)* @__omp_outlined___wrapper to i8*), i8** %1, i64 0)
  call void @__kmpc_target_deinit(%struct.ident_t* null, i8 1, i1 true)
  ret void
}

define internal void @helper0() {
; CHECK-LABEL: define {{[^@]+}}@helper0
; CHECK-SAME: () #[[ATTR1]] {
; CHECK-NEXT:    br label [[REGION_CHECK_TID:%.*]]
; CHECK:       region.check.tid:
; CHECK-NEXT:    [[TMP1:%.*]] = call i32 @__kmpc_get_hardware_thread_id_in_block()
; CHECK-NEXT:    [[TMP2:%.*]] = icmp eq i32 [[TMP1]], 0
; CHECK-NEXT:    br i1 [[TMP2]], label [[REGION_GUARDED:%.*]], label [[REGION_BARRIER:%.*]]
; CHECK:       region.guarded:
; CHECK-NEXT:    store i32 666, i32* @G, align 4
; CHECK-NEXT:    br label [[REGION_GUARDED_END:%.*]]
; CHECK:       region.guarded.end:
; CHECK-NEXT:    br label [[REGION_BARRIER]]
; CHECK:       region.barrier:
; CHECK-NEXT:    call void @__kmpc_barrier_simple_spmd(%struct.ident_t* @[[GLOB1]], i32 [[TMP1]])
; CHECK-NEXT:    br label [[REGION_EXIT:%.*]]
; CHECK:       region.exit:
; CHECK-NEXT:    ret void
;
  %threadLimit = call i32 @__kmpc_get_hardware_num_threads_in_block()
  store i32 %threadLimit, i32* @G
  ret void
}

define internal void @helper1() {
; CHECK-LABEL: define {{[^@]+}}@helper1
; CHECK-SAME: () #[[ATTR1]] {
; CHECK-NEXT:    br label [[F:%.*]]
; CHECK:       t:
; CHECK-NEXT:    unreachable
; CHECK:       f:
; CHECK-NEXT:    ret void
;
  %threadLimit = call i32 @__kmpc_get_hardware_num_threads_in_block()
  %c = icmp eq i32 %threadLimit, 666
  br i1 %c, label %f, label %t
t:
  call void @helper0()
  ret void
f:
  ret void
}

define internal void @helper2() {
; CHECK-LABEL: define {{[^@]+}}@helper2
; CHECK-SAME: () #[[ATTR1]] {
; CHECK-NEXT:    br label [[REGION_CHECK_TID:%.*]]
; CHECK:       region.check.tid:
; CHECK-NEXT:    [[TMP1:%.*]] = call i32 @__kmpc_get_hardware_thread_id_in_block()
; CHECK-NEXT:    [[TMP2:%.*]] = icmp eq i32 [[TMP1]], 0
; CHECK-NEXT:    br i1 [[TMP2]], label [[REGION_GUARDED:%.*]], label [[REGION_BARRIER:%.*]]
; CHECK:       region.guarded:
; CHECK-NEXT:    store i32 666, i32* @G, align 4
; CHECK-NEXT:    br label [[REGION_GUARDED_END:%.*]]
; CHECK:       region.guarded.end:
; CHECK-NEXT:    br label [[REGION_BARRIER]]
; CHECK:       region.barrier:
; CHECK-NEXT:    call void @__kmpc_barrier_simple_spmd(%struct.ident_t* @[[GLOB1]], i32 [[TMP1]])
; CHECK-NEXT:    br label [[REGION_EXIT:%.*]]
; CHECK:       region.exit:
; CHECK-NEXT:    ret void
;
  %threadLimit = call i32 @__kmpc_get_hardware_num_threads_in_block()
  store i32 %threadLimit, i32* @G
  ret void
}

define internal void @__omp_outlined__(i32* noalias %.global_tid., i32* noalias %.bound_tid.) {
; CHECK-LABEL: define {{[^@]+}}@__omp_outlined__
; CHECK-SAME: (i32* noalias [[DOTGLOBAL_TID_:%.*]], i32* noalias [[DOTBOUND_TID_:%.*]]) {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    ret void
;
entry:
  ret void
}

define internal void @__omp_outlined___wrapper(i16 zeroext %0, i32 %1) {
; CHECK-LABEL: define {{[^@]+}}@__omp_outlined___wrapper
; CHECK-SAME: (i16 zeroext [[TMP0:%.*]], i32 [[TMP1:%.*]]) {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    ret void
;
entry:
  ret void
}

declare i32 @__kmpc_get_hardware_num_threads_in_block()
declare i32 @__kmpc_target_init(%struct.ident_t*, i8, i1 zeroext, i1 zeroext) #1
declare void @__kmpc_target_deinit(%struct.ident_t* nocapture readnone, i8, i1 zeroext) #1
declare void @__kmpc_parallel_51(%struct.ident_t*, i32, i32, i32, i32, i8*, i8*, i8**, i64)
declare i32 @__kmpc_global_thread_num(%struct.ident_t*)


!llvm.module.flags = !{!0, !1}
!nvvm.annotations = !{!2, !3, !4}

attributes #0 = { "omp_target_thread_limit"="666" "omp_target_num_teams"="777"}

!0 = !{i32 7, !"openmp", i32 50}
!1 = !{i32 7, !"openmp-device", i32 50}
!2 = !{void ()* @kernel0, !"kernel", i32 1}
!3 = !{void ()* @kernel1, !"kernel", i32 1}
!4 = !{void ()* @kernel2, !"kernel", i32 1}
;
;.
; CHECK: attributes #[[ATTR0]] = { "omp_target_num_teams"="777" "omp_target_thread_limit"="666" }
; CHECK: attributes #[[ATTR1]] = { nounwind }
; CHECK: attributes #[[ATTR2:[0-9]+]] = { alwaysinline }
; CHECK: attributes #[[ATTR3:[0-9]+]] = { convergent nounwind }
;.
; CHECK: [[META0:![0-9]+]] = !{i32 7, !"openmp", i32 50}
; CHECK: [[META1:![0-9]+]] = !{i32 7, !"openmp-device", i32 50}
; CHECK: [[META2:![0-9]+]] = !{void ()* @kernel0, !"kernel", i32 1}
; CHECK: [[META3:![0-9]+]] = !{void ()* @kernel1, !"kernel", i32 1}
; CHECK: [[META4:![0-9]+]] = !{void ()* @kernel2, !"kernel", i32 1}
;.
