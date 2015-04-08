; ModuleID = 'test-z3.o'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-f128:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { void (i32)* }
%1 = type { %2, [20 x i32] }
%2 = type { i32, i32, i32, i64, i64 }
%struct.Elf64_auxv_t = type { i64, %union.anon }
%struct.FILE = type { i16, [2 x i8], i32, i8*, i8*, i8*, i8*, i8*, i8*, %struct.FILE*, [2 x i32], %struct.__mbstate_t }
%struct.__kernel_termios = type { i32, i32, i32, i32, i8, [19 x i8] }
%struct.__mbstate_t = type { i32, i32 }
%struct.__sigset_t = type { [16 x i64] }
%struct.anon = type { i32, i32 }
%struct.kernel_sigaction = type { void (i32)*, i64, void ()*, %struct.__sigset_t }
%struct.sigaction = type { %0, %struct.__sigset_t, i32, void ()* }
%struct.siginfo_t = type { i32, i32, i32, %1 }
%struct.sigset_t = type { [16 x i64] }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, [3 x i64] }
%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }
%union.anon = type { i64 }
%union.sigval_t = type { i8* }

@.str = private unnamed_addr constant [8 x i8] c"visitor\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"new\00", align 1
@.str2 = private unnamed_addr constant [6 x i8] c"admin\00", align 1
@.str3 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str4 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@.str5 = private unnamed_addr constant [8 x i8] c"session\00", align 1
@.str6 = private unnamed_addr constant [6 x i8] c"total\00", align 1
@__libc_stack_end = global i8* null
@__uclibc_progname = hidden global i8* getelementptr inbounds ([1 x i8]* @.str7, i64 0, i64 0)
@.str7 = private constant [1 x i8] zeroinitializer, align 1
@__environ = global i8** null
@__pagesize = global i64 0
@.str18 = private constant [10 x i8] c"/dev/null\00", align 1
@been_there_done_that.2848 = internal global i32 0
@__app_fini = hidden global void ()* null
@__rtld_fini = hidden global void ()* null
@_stdio_streams = internal global [3 x %struct.FILE] [%struct.FILE { i16 544, [2 x i8] zeroinitializer, i32 0, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i
@stdin = global %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 0)
@stdout = global %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 1)
@stderr = global %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 2)
@__stdin = global %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 0)
@__stdout = global %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 1)
@_stdio_openlist = global %struct.FILE* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 0)
@been_there_done_that = internal global i32 0
@__exit_cleanup = hidden global void (i32)* null
@errno = global i32 0
@h_errno = global i32 0
@.str29 = private constant [22 x i8] c"klee_div_zero_check.c\00", align 1
@.str130 = private constant [15 x i8] c"divide by zero\00", align 1
@.str231 = private constant [8 x i8] c"div.err\00", align 1
@.str332 = private constant [8 x i8] c"IGNORED\00", align 1
@.str14 = private constant [16 x i8] c"overshift error\00", align 1
@.str25 = private constant [14 x i8] c"overshift.err\00", align 1
@.str633 = private constant [13 x i8] c"klee_range.c\00", align 1
@.str17 = private constant [14 x i8] c"invalid range\00", align 1
@.str28 = private constant [5 x i8] c"user\00", align 1

@environ = alias weak i8*** @__environ
@strcoll = alias i32 (i8*, i8*)* @strcmp
@raise = alias weak i32 (i32)* @__raise
@sigaction = alias weak i32 (i32, %struct.sigaction*, %struct.sigaction*)* @__libc_sigaction

define i32 @branching_function(i32 %session, i32 %total) nounwind {
entry:
  %session_addr = alloca i32, align 4
  %total_addr = alloca i32, align 4
  %retval = alloca i32
  %0 = alloca i32
  %role = alloca i8*
  %substr = alloca i8*
  %"alloca point" = bitcast i32 0 to i32
  store i32 %session, i32* %session_addr
  store i32 %total, i32* %total_addr
  %1 = load i32* %session_addr, align 4, !dbg !536
  %2 = icmp sle i32 %1, 2, !dbg !536
  %3 = load i32* %session_addr, align 4, !dbg !538
  br i1 %2, label %bb, label %bb4, !dbg !536

bb:                                               ; preds = %entry
  %4 = icmp eq i32 %3, 0, !dbg !538
  br i1 %4, label %bb1, label %bb2, !dbg !538

bb1:                                              ; preds = %bb
  store i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i8** %role, align 8, !dbg !539
  br label %bb7, !dbg !539

bb2:                                              ; preds = %bb
  store i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i8** %role, align 8, !dbg !540
  br label %bb7, !dbg !540

bb4:                                              ; preds = %entry
  %5 = icmp eq i32 %3, 9, !dbg !541
  br i1 %5, label %bb5, label %bb6, !dbg !541

bb5:                                              ; preds = %bb4
  store i8* getelementptr inbounds ([6 x i8]* @.str2, i64 0, i64 0), i8** %role, align 8, !dbg !542
  br label %bb7, !dbg !542

bb6:                                              ; preds = %bb4
  store i8* getelementptr inbounds ([2 x i8]* @.str3, i64 0, i64 0), i8** %role, align 8, !dbg !543
  br label %bb7, !dbg !543

bb7:                                              ; preds = %bb1, %bb2, %bb6, %bb5
  %6 = load i32* %total_addr, align 4, !dbg !544
  %7 = icmp sgt i32 %6, 2, !dbg !544
  br i1 %7, label %bb8, label %bb11, !dbg !544

bb8:                                              ; preds = %bb7
  %8 = call noalias i8* @malloc(i64 1) nounwind, !dbg !545
  store i8* %8, i8** %substr, align 8, !dbg !545
  %9 = load i8** %substr, align 8, !dbg !547
  %10 = load i8** %role, align 8, !dbg !547
  %11 = call i8* @strncpy(i8* noalias %9, i8* noalias %10, i64 1) nounwind, !dbg !547
  %12 = load i8** %substr, align 8, !dbg !548
  %13 = call i32 @strcmp(i8* %12, i8* getelementptr inbounds ([2 x i8]* @.str4, i64 0, i64 0)) nounwind readonly, !dbg !548
  %14 = icmp eq i32 %13, 0, !dbg !548
  br i1 %14, label %bb9, label %bb10, !dbg !548

bb9:                                              ; preds = %bb8
  store i32 1, i32* %0, align 4, !dbg !549
  br label %bb12, !dbg !549

bb10:                                             ; preds = %bb8
  store i32 0, i32* %0, align 4, !dbg !550
  br label %bb12, !dbg !550

bb11:                                             ; preds = %bb7
  store i32 -1, i32* %0, align 4, !dbg !551
  br label %bb12, !dbg !551

bb12:                                             ; preds = %bb11, %bb10, %bb9
  %15 = load i32* %0, align 4, !dbg !549
  store i32 %15, i32* %retval, align 4, !dbg !549
  %retval13 = load i32* %retval, !dbg !549
  ret i32 %retval13, !dbg !549
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare noalias i8* @malloc(i64) nounwind

define i32 @__user_main() nounwind {
entry:
  %retval = alloca i32
  %0 = alloca i32
  %session = alloca i32
  %total = alloca i32
  %ret = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  %session1 = bitcast i32* %session to i8*, !dbg !552
  call void @klee_make_symbolic(i8* %session1, i64 4, i8* getelementptr inbounds ([8 x i8]* @.str5, i64 0, i64 0)) nounwind, !dbg !552
  %total2 = bitcast i32* %total to i8*, !dbg !554
  call void @klee_make_symbolic(i8* %total2, i64 4, i8* getelementptr inbounds ([6 x i8]* @.str6, i64 0, i64 0)) nounwind, !dbg !554
  %1 = load i32* %total, align 4, !dbg !555
  %2 = load i32* %session, align 4, !dbg !555
  %3 = call i32 @branching_function(i32 %2, i32 %1) nounwind, !dbg !555
  store i32 %3, i32* %ret, align 4, !dbg !555
  %4 = load i32* %ret, align 4, !dbg !556
  store i32 %4, i32* %0, align 4, !dbg !556
  %5 = load i32* %0, align 4, !dbg !556
  store i32 %5, i32* %retval, align 4, !dbg !556
  %retval3 = load i32* %retval, !dbg !556
  ret i32 %retval3, !dbg !556
}

declare void @klee_make_symbolic(i8*, i64, i8*)

define internal void @__check_one_fd(i32 %fd, i32 %mode) nounwind {
entry:
  %fd_addr = alloca i32, align 4
  %mode_addr = alloca i32, align 4
  %iftmp.0 = alloca i32
  %st = alloca %struct.stat
  %nullfd = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i32 %fd, i32* %fd_addr
  store i32 %mode, i32* %mode_addr
  %0 = load i32* %fd_addr, align 4, !dbg !557
  %1 = call i32 (i32, i32, ...)* @fcntl(i32 %0, i32 1) nounwind, !dbg !557
  %2 = icmp ne i32 %1, -1, !dbg !557
  br i1 %2, label %bb2, label %bb, !dbg !557

bb:                                               ; preds = %entry
  %3 = call i32* @__errno_location() nounwind readnone, !dbg !557
  %4 = load i32* %3, align 4, !dbg !557
  %5 = icmp ne i32 %4, 9, !dbg !557
  br i1 %5, label %bb2, label %bb1, !dbg !557

bb1:                                              ; preds = %bb
  store i32 1, i32* %iftmp.0, align 4, !dbg !557
  br label %bb3, !dbg !557

bb2:                                              ; preds = %bb, %entry
  store i32 0, i32* %iftmp.0, align 4, !dbg !557
  br label %bb3, !dbg !557

bb3:                                              ; preds = %bb2, %bb1
  %6 = load i32* %iftmp.0, align 4, !dbg !557
  %7 = sext i32 %6 to i64, !dbg !557
  %8 = icmp ne i64 %7, 0, !dbg !557
  br i1 %8, label %bb4, label %return, !dbg !557

bb4:                                              ; preds = %bb3
  %9 = load i32* %mode_addr, align 4, !dbg !559
  %10 = call i32 (i8*, i32, ...)* @open(i8* getelementptr inbounds ([10 x i8]* @.str18, i64 0, i64 0), i32 %9) nounwind, !dbg !559
  store i32 %10, i32* %nullfd, align 4, !dbg !559
  %11 = load i32* %nullfd, align 4, !dbg !561
  %12 = load i32* %fd_addr, align 4, !dbg !561
  %13 = icmp ne i32 %11, %12, !dbg !561
  br i1 %13, label %bb8, label %bb5, !dbg !561

bb5:                                              ; preds = %bb4
  %14 = load i32* %fd_addr, align 4, !dbg !561
  %15 = call i32 @fstat(i32 %14, %struct.stat* %st) nounwind, !dbg !561
  %16 = icmp ne i32 %15, 0, !dbg !561
  br i1 %16, label %bb8, label %bb6, !dbg !561

bb6:                                              ; preds = %bb5
  %17 = getelementptr inbounds %struct.stat* %st, i32 0, i32 3, !dbg !561
  %18 = load i32* %17, align 8, !dbg !561
  %19 = and i32 %18, 61440, !dbg !561
  %20 = icmp ne i32 %19, 8192, !dbg !561
  br i1 %20, label %bb8, label %bb7, !dbg !561

bb7:                                              ; preds = %bb6
  %21 = getelementptr inbounds %struct.stat* %st, i32 0, i32 7, !dbg !561
  %22 = load i64* %21, align 8, !dbg !561
  %23 = call i64 @gnu_dev_makedev(i32 1, i32 3) nounwind, !dbg !561
  %24 = icmp ne i64 %22, %23, !dbg !561
  br i1 %24, label %bb8, label %return, !dbg !561

bb8:                                              ; preds = %bb7, %bb6, %bb5, %bb4
  call void @abort() noreturn nounwind, !dbg !562
  unreachable, !dbg !562

return:                                           ; preds = %bb3, %bb7
  ret void, !dbg !563
}

declare i32 @fcntl(i32, i32, ...)

declare i32 @open(i8*, i32, ...)

declare i32 @fstat(i32, %struct.stat*) nounwind

define internal i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind inlinehint {
entry:
  %__major_addr = alloca i32, align 4
  %__minor_addr = alloca i32, align 4
  %retval = alloca i64
  %0 = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store i32 %__major, i32* %__major_addr
  store i32 %__minor, i32* %__minor_addr
  %1 = load i32* %__minor_addr, align 4, !dbg !564
  %2 = and i32 %1, 255, !dbg !564
  %3 = load i32* %__major_addr, align 4, !dbg !564
  %4 = and i32 %3, 4095, !dbg !564
  %int_cast_to_i64 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !564
  %5 = shl i32 %4, 8, !dbg !564
  %6 = or i32 %2, %5, !dbg !564
  %7 = zext i32 %6 to i64, !dbg !564
  %8 = load i32* %__minor_addr, align 4, !dbg !564
  %9 = zext i32 %8 to i64, !dbg !564
  %10 = and i64 %9, 4294967040, !dbg !564
  %int_cast_to_i641 = bitcast i64 12 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i641), !dbg !564
  %11 = shl i64 %10, 12, !dbg !564
  %12 = or i64 %7, %11, !dbg !564
  %13 = load i32* %__major_addr, align 4, !dbg !564
  %14 = zext i32 %13 to i64, !dbg !564
  %15 = and i64 %14, 4294963200, !dbg !564
  %int_cast_to_i642 = bitcast i64 32 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i642), !dbg !564
  %16 = shl i64 %15, 32, !dbg !564
  %17 = or i64 %12, %16, !dbg !564
  store i64 %17, i64* %0, align 8, !dbg !564
  %18 = load i64* %0, align 8, !dbg !564
  store i64 %18, i64* %retval, align 8, !dbg !564
  %retval1 = load i64* %retval, !dbg !564
  ret i64 %retval1, !dbg !564
}

define internal i32 @__check_suid() nounwind {
entry:
  %retval = alloca i32
  %0 = alloca i32
  %uid = alloca i32
  %euid = alloca i32
  %gid = alloca i32
  %egid = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  %1 = call i32 @getuid() nounwind, !dbg !566
  store i32 %1, i32* %uid, align 4, !dbg !566
  %2 = call i32 @geteuid() nounwind, !dbg !568
  store i32 %2, i32* %euid, align 4, !dbg !568
  %3 = call i32 @getgid() nounwind, !dbg !569
  store i32 %3, i32* %gid, align 4, !dbg !569
  %4 = call i32 @getegid() nounwind, !dbg !570
  store i32 %4, i32* %egid, align 4, !dbg !570
  %5 = load i32* %uid, align 4, !dbg !571
  %6 = load i32* %euid, align 4, !dbg !571
  %7 = icmp eq i32 %5, %6, !dbg !571
  br i1 %7, label %bb, label %bb2, !dbg !571

bb:                                               ; preds = %entry
  %8 = load i32* %gid, align 4, !dbg !571
  %9 = load i32* %egid, align 4, !dbg !571
  %10 = icmp eq i32 %8, %9, !dbg !571
  br i1 %10, label %bb1, label %bb2, !dbg !571

bb1:                                              ; preds = %bb
  store i32 0, i32* %0, align 4, !dbg !572
  br label %bb3, !dbg !572

bb2:                                              ; preds = %bb, %entry
  store i32 1, i32* %0, align 4, !dbg !573
  br label %bb3, !dbg !573

bb3:                                              ; preds = %bb2, %bb1
  %11 = load i32* %0, align 4, !dbg !572
  store i32 %11, i32* %retval, align 4, !dbg !572
  %retval4 = load i32* %retval, !dbg !572
  ret i32 %retval4, !dbg !572
}

declare i32 @getuid() nounwind

declare i32 @geteuid() nounwind

declare i32 @getgid() nounwind

declare i32 @getegid() nounwind

define void @__uClibc_init() nounwind {
entry:
  %0 = load i32* @been_there_done_that.2848, align 4, !dbg !574
  %1 = icmp ne i32 %0, 0, !dbg !574
  br i1 %1, label %return, label %bb, !dbg !574

bb:                                               ; preds = %entry
  %2 = load i32* @been_there_done_that.2848, align 4, !dbg !576
  %3 = add nsw i32 %2, 1, !dbg !576
  store i32 %3, i32* @been_there_done_that.2848, align 4, !dbg !576
  store i64 4096, i64* @__pagesize, align 8, !dbg !577
  call void @_stdio_init() nounwind, !dbg !578
  br label %return, !dbg !578

return:                                           ; preds = %entry, %bb
  ret void, !dbg !579
}

define void @__uClibc_fini() nounwind {
entry:
  %0 = load void ()** @__app_fini, align 8, !dbg !580
  %1 = icmp ne void ()* %0, null, !dbg !580
  br i1 %1, label %bb, label %bb1, !dbg !580

bb:                                               ; preds = %entry
  %2 = load void ()** @__app_fini, align 8, !dbg !582
  call void %2() nounwind, !dbg !582
  br label %bb1, !dbg !582

bb1:                                              ; preds = %bb, %entry
  %3 = load void ()** @__rtld_fini, align 8, !dbg !583
  %4 = icmp ne void ()* %3, null, !dbg !583
  br i1 %4, label %bb2, label %return, !dbg !583

bb2:                                              ; preds = %bb1
  %5 = load void ()** @__rtld_fini, align 8, !dbg !584
  call void %5() nounwind, !dbg !584
  br label %return, !dbg !584

return:                                           ; preds = %bb1, %bb2
  ret void, !dbg !585
}

define void @__uClibc_main(i32 (i32, i8**, i8**)* %main, i32 %argc, i8** %argv, void ()* %app_init, void ()* %app_fini, void ()* %rtld_fini, i8* %stack_end) noreturn nounwind {
entry:
  %main_addr = alloca i32 (i32, i8**, i8**)*, align 8
  %argc_addr = alloca i32, align 4
  %argv_addr = alloca i8**, align 8
  %app_init_addr = alloca void ()*, align 8
  %app_fini_addr = alloca void ()*, align 8
  %rtld_fini_addr = alloca void ()*, align 8
  %stack_end_addr = alloca i8*, align 8
  %iftmp.10 = alloca i64
  %aux_dat = alloca i64*
  %auxvt = alloca [15 x %struct.Elf64_auxv_t]
  %auxv_entry = alloca %struct.Elf64_auxv_t*
  %"alloca point" = bitcast i32 0 to i32
  store i32 (i32, i8**, i8**)* %main, i32 (i32, i8**, i8**)** %main_addr
  store i32 %argc, i32* %argc_addr
  store i8** %argv, i8*** %argv_addr
  store void ()* %app_init, void ()** %app_init_addr
  store void ()* %app_fini, void ()** %app_fini_addr
  store void ()* %rtld_fini, void ()** %rtld_fini_addr
  store i8* %stack_end, i8** %stack_end_addr
  %0 = load i8** %stack_end_addr, align 8, !dbg !586
  store i8* %0, i8** @__libc_stack_end, align 8, !dbg !586
  %1 = load void ()** %rtld_fini_addr, align 8, !dbg !588
  store void ()* %1, void ()** @__rtld_fini, align 8, !dbg !588
  %2 = load i32* %argc_addr, align 4, !dbg !589
  %3 = add nsw i32 %2, 1, !dbg !589
  %4 = load i8*** %argv_addr, align 8, !dbg !589
  %5 = sext i32 %3 to i64, !dbg !589
  %6 = getelementptr inbounds i8** %4, i64 %5, !dbg !589
  store i8** %6, i8*** @__environ, align 8, !dbg !589
  %7 = load i8*** %argv_addr, align 8, !dbg !590
  %8 = load i8** %7, align 8, !dbg !590
  %9 = load i8*** @__environ, align 8, !dbg !590
  %10 = bitcast i8** %9 to i8*, !dbg !590
  %11 = icmp eq i8* %8, %10, !dbg !590
  br i1 %11, label %bb, label %bb1, !dbg !590

bb:                                               ; preds = %entry
  %12 = load i8*** %argv_addr, align 8, !dbg !591
  %13 = load i32* %argc_addr, align 4, !dbg !591
  %14 = sext i32 %13 to i64, !dbg !591
  %15 = getelementptr inbounds i8** %12, i64 %14, !dbg !591
  store i8** %15, i8*** @__environ, align 8, !dbg !591
  br label %bb1, !dbg !591

bb1:                                              ; preds = %bb, %entry
  %auxvt2 = bitcast [15 x %struct.Elf64_auxv_t]* %auxvt to %struct.Elf64_auxv_t*, !dbg !592
  %auxvt23 = bitcast %struct.Elf64_auxv_t* %auxvt2 to i8*, !dbg !592
  %16 = call i8* @memset(i8* %auxvt23, i32 0, i64 240) nounwind, !dbg !592
  %17 = load i8*** @__environ, align 8, !dbg !593
  %18 = bitcast i8** %17 to i64*, !dbg !593
  store i64* %18, i64** %aux_dat, align 8, !dbg !593
  br label %bb5, !dbg !593

bb5:                                              ; preds = %bb5, %bb1
  %19 = load i64** %aux_dat, align 8, !dbg !594
  %20 = load i64* %19, align 8, !dbg !594
  %21 = icmp ne i64 %20, 0, !dbg !594
  %22 = load i64** %aux_dat, align 8, !dbg !595
  %23 = getelementptr inbounds i64* %22, i64 1, !dbg !595
  store i64* %23, i64** %aux_dat, align 8, !dbg !595
  br i1 %21, label %bb5, label %bb10, !dbg !594

bb7:                                              ; preds = %bb10
  %24 = load i64** %aux_dat, align 8, !dbg !596
  %25 = bitcast i64* %24 to %struct.Elf64_auxv_t*, !dbg !596
  store %struct.Elf64_auxv_t* %25, %struct.Elf64_auxv_t** %auxv_entry, align 8, !dbg !596
  %26 = load %struct.Elf64_auxv_t** %auxv_entry, align 8, !dbg !598
  %27 = getelementptr inbounds %struct.Elf64_auxv_t* %26, i32 0, i32 0, !dbg !598
  %28 = load i64* %27, align 8, !dbg !598
  %29 = icmp ule i64 %28, 14, !dbg !598
  br i1 %29, label %bb8, label %bb9, !dbg !598

bb8:                                              ; preds = %bb7
  %30 = load %struct.Elf64_auxv_t** %auxv_entry, align 8, !dbg !599
  %31 = getelementptr inbounds %struct.Elf64_auxv_t* %30, i32 0, i32 0, !dbg !599
  %32 = load i64* %31, align 8, !dbg !599
  %33 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 %32, !dbg !599
  %34 = bitcast %struct.Elf64_auxv_t* %33 to i8*, !dbg !599
  %35 = load %struct.Elf64_auxv_t** %auxv_entry, align 8, !dbg !599
  %36 = bitcast %struct.Elf64_auxv_t* %35 to i8*, !dbg !599
  %37 = call i8* @memcpy(i8* noalias %34, i8* noalias %36, i64 16) nounwind, !dbg !599
  br label %bb9, !dbg !599

bb9:                                              ; preds = %bb8, %bb7
  %38 = load i64** %aux_dat, align 8, !dbg !600
  %39 = getelementptr inbounds i64* %38, i64 2, !dbg !600
  store i64* %39, i64** %aux_dat, align 8, !dbg !600
  br label %bb10, !dbg !600

bb10:                                             ; preds = %bb5, %bb9
  %40 = load i64** %aux_dat, align 8, !dbg !601
  %41 = load i64* %40, align 8, !dbg !601
  %42 = icmp ne i64 %41, 0, !dbg !601
  br i1 %42, label %bb7, label %bb11, !dbg !601

bb11:                                             ; preds = %bb10
  call void @__uClibc_init() nounwind, !dbg !602
  %43 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 6, !dbg !603
  %44 = getelementptr inbounds %struct.Elf64_auxv_t* %43, i32 0, i32 1, !dbg !603
  %45 = getelementptr inbounds %union.anon* %44, i32 0, i32 0, !dbg !603
  %46 = load i64* %45, align 8, !dbg !603
  %47 = icmp ne i64 %46, 0, !dbg !603
  br i1 %47, label %bb12, label %bb13, !dbg !603

bb12:                                             ; preds = %bb11
  %48 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 6, !dbg !603
  %49 = getelementptr inbounds %struct.Elf64_auxv_t* %48, i32 0, i32 1, !dbg !603
  %50 = getelementptr inbounds %union.anon* %49, i32 0, i32 0, !dbg !603
  %51 = load i64* %50, align 8, !dbg !603
  store i64 %51, i64* %iftmp.10, align 8, !dbg !603
  br label %bb14, !dbg !603

bb13:                                             ; preds = %bb11
  store i64 4096, i64* %iftmp.10, align 8, !dbg !603
  br label %bb14, !dbg !603

bb14:                                             ; preds = %bb13, %bb12
  %52 = load i64* %iftmp.10, align 8, !dbg !603
  store i64 %52, i64* @__pagesize, align 8, !dbg !603
  %53 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 11, !dbg !604
  %54 = getelementptr inbounds %struct.Elf64_auxv_t* %53, i32 0, i32 1, !dbg !604
  %55 = getelementptr inbounds %union.anon* %54, i32 0, i32 0, !dbg !604
  %56 = load i64* %55, align 8, !dbg !604
  %57 = icmp ne i64 %56, -1, !dbg !604
  br i1 %57, label %bb16, label %bb15, !dbg !604

bb15:                                             ; preds = %bb14
  %58 = call i32 @__check_suid() nounwind, !dbg !604
  %59 = icmp ne i32 %58, 0, !dbg !604
  br i1 %59, label %bb19, label %bb16, !dbg !604

bb16:                                             ; preds = %bb15, %bb14
  %60 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 11, !dbg !604
  %61 = getelementptr inbounds %struct.Elf64_auxv_t* %60, i32 0, i32 1, !dbg !604
  %62 = getelementptr inbounds %union.anon* %61, i32 0, i32 0, !dbg !604
  %63 = load i64* %62, align 8, !dbg !604
  %64 = icmp eq i64 %63, -1, !dbg !604
  br i1 %64, label %bb20, label %bb17, !dbg !604

bb17:                                             ; preds = %bb16
  %65 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 11, !dbg !604
  %66 = getelementptr inbounds %struct.Elf64_auxv_t* %65, i32 0, i32 1, !dbg !604
  %67 = getelementptr inbounds %union.anon* %66, i32 0, i32 0, !dbg !604
  %68 = load i64* %67, align 8, !dbg !604
  %69 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 12, !dbg !604
  %70 = getelementptr inbounds %struct.Elf64_auxv_t* %69, i32 0, i32 1, !dbg !604
  %71 = getelementptr inbounds %union.anon* %70, i32 0, i32 0, !dbg !604
  %72 = load i64* %71, align 8, !dbg !604
  %73 = icmp ne i64 %68, %72, !dbg !604
  br i1 %73, label %bb19, label %bb18, !dbg !604

bb18:                                             ; preds = %bb17
  %74 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 13, !dbg !604
  %75 = getelementptr inbounds %struct.Elf64_auxv_t* %74, i32 0, i32 1, !dbg !604
  %76 = getelementptr inbounds %union.anon* %75, i32 0, i32 0, !dbg !604
  %77 = load i64* %76, align 8, !dbg !604
  %78 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 14, !dbg !604
  %79 = getelementptr inbounds %struct.Elf64_auxv_t* %78, i32 0, i32 1, !dbg !604
  %80 = getelementptr inbounds %union.anon* %79, i32 0, i32 0, !dbg !604
  %81 = load i64* %80, align 8, !dbg !604
  %82 = icmp ne i64 %77, %81, !dbg !604
  br i1 %82, label %bb19, label %bb20, !dbg !604

bb19:                                             ; preds = %bb18, %bb17, %bb15
  call void @__check_one_fd(i32 0, i32 131072) nounwind, !dbg !605
  call void @__check_one_fd(i32 1, i32 131074) nounwind, !dbg !606
  call void @__check_one_fd(i32 2, i32 131074) nounwind, !dbg !607
  br label %bb20, !dbg !607

bb20:                                             ; preds = %bb19, %bb18, %bb16
  %83 = load i8*** %argv_addr, align 8, !dbg !608
  %84 = load i8** %83, align 8, !dbg !608
  store i8* %84, i8** @__uclibc_progname, align 8, !dbg !608
  %85 = load void ()** %app_fini_addr, align 8, !dbg !609
  store void ()* %85, void ()** @__app_fini, align 8, !dbg !609
  %86 = load void ()** %app_init_addr, align 8, !dbg !610
  %87 = icmp ne void ()* %86, null, !dbg !610
  br i1 %87, label %bb21, label %bb22, !dbg !610

bb21:                                             ; preds = %bb20
  %88 = load void ()** %app_init_addr, align 8, !dbg !611
  call void %88() nounwind, !dbg !611
  br label %bb22, !dbg !611

bb22:                                             ; preds = %bb21, %bb20
  %89 = icmp ne i8* bitcast (i32* ()* @__errno_location to i8*), null, !dbg !612
  br i1 %89, label %bb23, label %bb24, !dbg !612

bb23:                                             ; preds = %bb22
  %90 = call i32* @__errno_location() nounwind readnone, !dbg !613
  store i32 0, i32* %90, align 4, !dbg !613
  br label %bb24, !dbg !613

bb24:                                             ; preds = %bb23, %bb22
  %91 = icmp ne i8* bitcast (i32* ()* @__h_errno_location to i8*), null, !dbg !614
  br i1 %91, label %bb25, label %bb26, !dbg !614

bb25:                                             ; preds = %bb24
  %92 = call i32* @__h_errno_location() nounwind readnone, !dbg !615
  store i32 0, i32* %92, align 4, !dbg !615
  br label %bb26, !dbg !615

bb26:                                             ; preds = %bb25, %bb24
  %93 = load i8*** @__environ, align 8, !dbg !616
  %94 = load i32 (i32, i8**, i8**)** %main_addr, align 8, !dbg !616
  %95 = load i32* %argc_addr, align 4, !dbg !616
  %96 = load i8*** %argv_addr, align 8, !dbg !616
  %97 = call i32 %94(i32 %95, i8** %96, i8** %93) nounwind, !dbg !616
  call void @exit(i32 %97) noreturn nounwind, !dbg !616
  unreachable, !dbg !616
}

define i32 @strcmp(i8* %s1, i8* %s2) nounwind readonly {
entry:
  %s1_addr = alloca i8*, align 8
  %s2_addr = alloca i8*, align 8
  %retval = alloca i32
  %0 = alloca i32
  %r = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i8* %s1, i8** %s1_addr
  store i8* %s2, i8** %s2_addr
  br label %bb, !dbg !617

bb:                                               ; preds = %bb4, %entry
  %1 = load i8** %s1_addr, align 8, !dbg !618
  %2 = load i8* %1, align 1, !dbg !618
  %3 = zext i8 %2 to i32, !dbg !618
  %4 = load i8** %s2_addr, align 8, !dbg !618
  %5 = load i8* %4, align 1, !dbg !618
  %6 = zext i8 %5 to i32, !dbg !618
  %7 = sub nsw i32 %3, %6, !dbg !618
  store i32 %7, i32* %r, align 4, !dbg !618
  %8 = load i32* %r, align 4, !dbg !618
  %9 = icmp eq i32 %8, 0, !dbg !618
  %10 = zext i1 %9 to i8, !dbg !618
  %11 = load i8** %s2_addr, align 8, !dbg !618
  %12 = getelementptr inbounds i8* %11, i64 1, !dbg !618
  store i8* %12, i8** %s2_addr, align 8, !dbg !618
  %toBool = icmp ne i8 %10, 0, !dbg !618
  %toBoolnot = xor i1 %toBool, true, !dbg !618
  %toBoolnot1 = zext i1 %toBoolnot to i8, !dbg !618
  %toBool3 = icmp ne i8 %toBoolnot1, 0, !dbg !618
  br i1 %toBool3, label %bb6, label %bb4, !dbg !618

bb4:                                              ; preds = %bb
  %13 = load i8** %s1_addr, align 8, !dbg !618
  %14 = load i8* %13, align 1, !dbg !618
  %15 = icmp ne i8 %14, 0, !dbg !618
  %16 = zext i1 %15 to i8, !dbg !618
  %17 = load i8** %s1_addr, align 8, !dbg !618
  %18 = getelementptr inbounds i8* %17, i64 1, !dbg !618
  store i8* %18, i8** %s1_addr, align 8, !dbg !618
  %toBool5 = icmp ne i8 %16, 0, !dbg !618
  br i1 %toBool5, label %bb, label %bb6, !dbg !618

bb6:                                              ; preds = %bb4, %bb
  %19 = load i32* %r, align 4, !dbg !620
  store i32 %19, i32* %0, align 4, !dbg !620
  %20 = load i32* %0, align 4, !dbg !620
  store i32 %20, i32* %retval, align 4, !dbg !620
  %retval7 = load i32* %retval, !dbg !620
  ret i32 %retval7, !dbg !620
}

define i8* @strncpy(i8* noalias %s1, i8* noalias %s2, i64 %n) nounwind {
entry:
  %s1_addr = alloca i8*, align 8
  %s2_addr = alloca i8*, align 8
  %n_addr = alloca i64, align 8
  %retval = alloca i8*
  %0 = alloca i8*
  %s = alloca i8*
  %"alloca point" = bitcast i32 0 to i32
  store i8* %s1, i8** %s1_addr
  store i8* %s2, i8** %s2_addr
  store i64 %n, i64* %n_addr
  %1 = load i8** %s1_addr, align 8, !dbg !621
  store i8* %1, i8** %s, align 8, !dbg !621
  br label %bb3, !dbg !621

bb:                                               ; preds = %bb3
  %2 = load i8** %s2_addr, align 8, !dbg !623
  %3 = load i8* %2, align 1, !dbg !623
  %4 = load i8** %s, align 8, !dbg !623
  store i8 %3, i8* %4, align 1, !dbg !623
  %5 = load i8** %s, align 8, !dbg !623
  %6 = load i8* %5, align 1, !dbg !623
  %7 = icmp ne i8 %6, 0, !dbg !623
  br i1 %7, label %bb1, label %bb2, !dbg !623

bb1:                                              ; preds = %bb
  %8 = load i8** %s2_addr, align 8, !dbg !623
  %9 = getelementptr inbounds i8* %8, i64 1, !dbg !623
  store i8* %9, i8** %s2_addr, align 8, !dbg !623
  br label %bb2, !dbg !623

bb2:                                              ; preds = %bb1, %bb
  %10 = load i8** %s, align 8, !dbg !624
  %11 = getelementptr inbounds i8* %10, i64 1, !dbg !624
  store i8* %11, i8** %s, align 8, !dbg !624
  %12 = load i64* %n_addr, align 8, !dbg !625
  %13 = sub i64 %12, 1, !dbg !625
  store i64 %13, i64* %n_addr, align 8, !dbg !625
  br label %bb3, !dbg !625

bb3:                                              ; preds = %bb2, %entry
  %14 = load i64* %n_addr, align 8, !dbg !626
  %15 = icmp ne i64 %14, 0, !dbg !626
  br i1 %15, label %bb, label %bb4, !dbg !626

bb4:                                              ; preds = %bb3
  %16 = load i8** %s1_addr, align 8, !dbg !627
  store i8* %16, i8** %0, align 8, !dbg !627
  %17 = load i8** %0, align 8, !dbg !627
  store i8* %17, i8** %retval, align 8, !dbg !627
  %retval5 = load i8** %retval, !dbg !627
  ret i8* %retval5, !dbg !627
}

define weak i32* @__errno_location() nounwind readnone {
entry:
  %retval = alloca i32*
  %0 = alloca i32*
  %"alloca point" = bitcast i32 0 to i32
  store i32* @errno, i32** %0, align 8, !dbg !628
  %1 = load i32** %0, align 8, !dbg !628
  store i32* %1, i32** %retval, align 8, !dbg !628
  %retval1 = load i32** %retval, !dbg !628
  ret i32* %retval1, !dbg !628
}

define weak i32* @__h_errno_location() nounwind readnone {
entry:
  %retval = alloca i32*
  %0 = alloca i32*
  %"alloca point" = bitcast i32 0 to i32
  store i32* @h_errno, i32** %0, align 8, !dbg !630
  %1 = load i32** %0, align 8, !dbg !630
  store i32* %1, i32** %retval, align 8, !dbg !630
  %retval1 = load i32** %retval, !dbg !630
  ret i32* %retval1, !dbg !630
}

define hidden void @_stdio_term() nounwind {
entry:
  %ptr = alloca %struct.FILE*
  %"alloca point" = bitcast i32 0 to i32
  %0 = load %struct.FILE** @_stdio_openlist, align 8, !dbg !632
  store %struct.FILE* %0, %struct.FILE** %ptr, align 8, !dbg !632
  br label %bb3, !dbg !632

bb:                                               ; preds = %bb3
  %1 = load %struct.FILE** %ptr, align 8, !dbg !634
  %2 = getelementptr inbounds %struct.FILE* %1, i32 0, i32 0, !dbg !634
  %3 = load i16* %2, align 8, !dbg !634
  %4 = zext i16 %3 to i32, !dbg !634
  %5 = and i32 %4, 64, !dbg !634
  %6 = icmp ne i32 %5, 0, !dbg !634
  br i1 %6, label %bb1, label %bb2, !dbg !634

bb1:                                              ; preds = %bb
  %7 = load %struct.FILE** %ptr, align 8, !dbg !635
  %8 = call i64 @__stdio_wcommit(%struct.FILE* noalias %7) nounwind, !dbg !635
  br label %bb2, !dbg !635

bb2:                                              ; preds = %bb1, %bb
  %9 = load %struct.FILE** %ptr, align 8, !dbg !632
  %10 = getelementptr inbounds %struct.FILE* %9, i32 0, i32 9, !dbg !632
  %11 = load %struct.FILE** %10, align 8, !dbg !632
  store %struct.FILE* %11, %struct.FILE** %ptr, align 8, !dbg !632
  br label %bb3, !dbg !632

bb3:                                              ; preds = %bb2, %entry
  %12 = load %struct.FILE** %ptr, align 8, !dbg !632
  %13 = icmp ne %struct.FILE* %12, null, !dbg !632
  br i1 %13, label %bb, label %return, !dbg !632

return:                                           ; preds = %bb3
  ret void, !dbg !636
}

define hidden void @_stdio_init() nounwind {
entry:
  %old_errno = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  %0 = load i32* @errno, align 4, !dbg !637
  store i32 %0, i32* %old_errno, align 4, !dbg !637
  %1 = load i16* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 0, i32 0), align 8, !dbg !639
  %2 = call i32 @isatty(i32 0) nounwind, !dbg !639
  %3 = sub nsw i32 1, %2, !dbg !639
  %4 = mul i32 %3, 256, !dbg !639
  %5 = trunc i32 %4 to i16, !dbg !639
  %6 = xor i16 %1, %5, !dbg !639
  store i16 %6, i16* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 0, i32 0), align 8, !dbg !639
  %7 = load i16* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 1, i32 0), align 8, !dbg !640
  %8 = call i32 @isatty(i32 1) nounwind, !dbg !640
  %9 = sub nsw i32 1, %8, !dbg !640
  %10 = mul i32 %9, 256, !dbg !640
  %11 = trunc i32 %10 to i16, !dbg !640
  %12 = xor i16 %7, %11, !dbg !640
  store i16 %12, i16* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 1, i32 0), align 8, !dbg !640
  %13 = load i32* %old_errno, align 4, !dbg !641
  store i32 %13, i32* @errno, align 4, !dbg !641
  ret void, !dbg !642
}

declare void @abort() noreturn nounwind

declare i32 @sigprocmask(i32, %struct.__sigset_t* noalias, %struct.__sigset_t* noalias) nounwind

declare void @_exit(i32) noreturn

define void @exit(i32 %rv) noreturn nounwind {
entry:
  %rv_addr = alloca i32, align 4
  %"alloca point" = bitcast i32 0 to i32
  store i32 %rv, i32* %rv_addr
  %0 = load void (i32)** @__exit_cleanup, align 8, !dbg !643
  %1 = icmp ne void (i32)* %0, null, !dbg !643
  br i1 %1, label %bb, label %bb1, !dbg !643

bb:                                               ; preds = %entry
  %2 = load void (i32)** @__exit_cleanup, align 8, !dbg !645
  %3 = load i32* %rv_addr, align 4, !dbg !645
  call void %2(i32 %3) nounwind, !dbg !645
  br label %bb1, !dbg !645

bb1:                                              ; preds = %bb, %entry
  call void @__uClibc_fini() nounwind, !dbg !646
  call void @_stdio_term() nounwind, !dbg !647
  %4 = load i32* %rv_addr, align 4, !dbg !648
  call void @_exit(i32 %4) noreturn nounwind, !dbg !648
  unreachable, !dbg !648
}

define i8* @memcpy(i8* noalias %s1, i8* noalias %s2, i64 %n) nounwind {
entry:
  %s1_addr = alloca i8*, align 8
  %s2_addr = alloca i8*, align 8
  %n_addr = alloca i64, align 8
  %retval = alloca i8*
  %0 = alloca i8*
  %r1 = alloca i8*
  %r2 = alloca i8*
  %"alloca point" = bitcast i32 0 to i32
  store i8* %s1, i8** %s1_addr
  store i8* %s2, i8** %s2_addr
  store i64 %n, i64* %n_addr
  %1 = load i8** %s1_addr, align 8, !dbg !649
  store i8* %1, i8** %r1, align 8, !dbg !649
  %2 = load i8** %s2_addr, align 8, !dbg !651
  store i8* %2, i8** %r2, align 8, !dbg !651
  br label %bb1, !dbg !651

bb:                                               ; preds = %bb1
  %3 = load i8** %r2, align 8, !dbg !652
  %4 = load i8* %3, align 1, !dbg !652
  %5 = load i8** %r1, align 8, !dbg !652
  store i8 %4, i8* %5, align 1, !dbg !652
  %6 = load i8** %r1, align 8, !dbg !652
  %7 = getelementptr inbounds i8* %6, i64 1, !dbg !652
  store i8* %7, i8** %r1, align 8, !dbg !652
  %8 = load i8** %r2, align 8, !dbg !652
  %9 = getelementptr inbounds i8* %8, i64 1, !dbg !652
  store i8* %9, i8** %r2, align 8, !dbg !652
  %10 = load i64* %n_addr, align 8, !dbg !653
  %11 = sub i64 %10, 1, !dbg !653
  store i64 %11, i64* %n_addr, align 8, !dbg !653
  br label %bb1, !dbg !653

bb1:                                              ; preds = %bb, %entry
  %12 = load i64* %n_addr, align 8, !dbg !654
  %13 = icmp ne i64 %12, 0, !dbg !654
  br i1 %13, label %bb, label %bb2, !dbg !654

bb2:                                              ; preds = %bb1
  %14 = load i8** %s1_addr, align 8, !dbg !655
  store i8* %14, i8** %0, align 8, !dbg !655
  %15 = load i8** %0, align 8, !dbg !655
  store i8* %15, i8** %retval, align 8, !dbg !655
  %retval3 = load i8** %retval, !dbg !655
  ret i8* %retval3, !dbg !655
}

define i8* @memset(i8* %s, i32 %c, i64 %n) nounwind {
entry:
  %s_addr = alloca i8*, align 8
  %c_addr = alloca i32, align 4
  %n_addr = alloca i64, align 8
  %retval = alloca i8*
  %0 = alloca i8*
  %p = alloca i8*
  %"alloca point" = bitcast i32 0 to i32
  store i8* %s, i8** %s_addr
  store i32 %c, i32* %c_addr
  store i64 %n, i64* %n_addr
  %1 = load i8** %s_addr, align 8, !dbg !656
  store i8* %1, i8** %p, align 8, !dbg !656
  br label %bb1, !dbg !656

bb:                                               ; preds = %bb1
  %2 = load i32* %c_addr, align 4, !dbg !658
  %3 = trunc i32 %2 to i8, !dbg !658
  %4 = load i8** %p, align 8, !dbg !658
  store i8 %3, i8* %4, align 1, !dbg !658
  %5 = load i8** %p, align 8, !dbg !658
  %6 = getelementptr inbounds i8* %5, i64 1, !dbg !658
  store i8* %6, i8** %p, align 8, !dbg !658
  %7 = load i64* %n_addr, align 8, !dbg !659
  %8 = sub i64 %7, 1, !dbg !659
  store i64 %8, i64* %n_addr, align 8, !dbg !659
  br label %bb1, !dbg !659

bb1:                                              ; preds = %bb, %entry
  %9 = load i64* %n_addr, align 8, !dbg !660
  %10 = icmp ne i64 %9, 0, !dbg !660
  br i1 %10, label %bb, label %bb2, !dbg !660

bb2:                                              ; preds = %bb1
  %11 = load i8** %s_addr, align 8, !dbg !661
  store i8* %11, i8** %0, align 8, !dbg !661
  %12 = load i8** %0, align 8, !dbg !661
  store i8* %12, i8** %retval, align 8, !dbg !661
  %retval3 = load i8** %retval, !dbg !661
  ret i8* %retval3, !dbg !661
}

define i32 @__sigismember(%struct.__sigset_t* %__set, i32 %__sig) nounwind {
entry:
  %__set_addr = alloca %struct.__sigset_t*, align 8
  %__sig_addr = alloca i32, align 4
  %retval = alloca i32
  %0 = alloca i32
  %__mask = alloca i64
  %__word = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store %struct.__sigset_t* %__set, %struct.__sigset_t** %__set_addr
  store i32 %__sig, i32* %__sig_addr
  %1 = load i32* %__sig_addr, align 4, !dbg !662
  %2 = sub nsw i32 %1, 1, !dbg !662
  %3 = and i32 %2, 63, !dbg !662
  %.cast = zext i32 %3 to i64, !dbg !662
  %int_cast_to_i641 = bitcast i64 %.cast to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i641), !dbg !662
  %4 = shl i64 1, %.cast, !dbg !662
  store i64 %4, i64* %__mask, align 8, !dbg !662
  %5 = load i32* %__sig_addr, align 4, !dbg !662
  %6 = sub nsw i32 %5, 1, !dbg !662
  %7 = sext i32 %6 to i64, !dbg !662
  %int_cast_to_i64 = bitcast i64 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !662
  %8 = udiv i64 %7, 64, !dbg !662
  store i64 %8, i64* %__word, align 8, !dbg !662
  %9 = load i64* %__word, align 8, !dbg !662
  %10 = load %struct.__sigset_t** %__set_addr, align 8, !dbg !662
  %11 = getelementptr inbounds %struct.__sigset_t* %10, i32 0, i32 0, !dbg !662
  %12 = getelementptr inbounds [16 x i64]* %11, i64 0, i64 %9, !dbg !662
  %13 = load i64* %12, align 8, !dbg !662
  %14 = load i64* %__mask, align 8, !dbg !662
  %15 = and i64 %13, %14, !dbg !662
  %16 = icmp ne i64 %15, 0, !dbg !662
  %17 = zext i1 %16 to i32, !dbg !662
  store i32 %17, i32* %0, align 4, !dbg !662
  %18 = load i32* %0, align 4, !dbg !662
  store i32 %18, i32* %retval, align 4, !dbg !662
  %retval1 = load i32* %retval, !dbg !662
  ret i32 %retval1, !dbg !663
}

define i32 @__sigaddset(%struct.__sigset_t* %__set, i32 %__sig) nounwind {
entry:
  %__set_addr = alloca %struct.__sigset_t*, align 8
  %__sig_addr = alloca i32, align 4
  %retval = alloca i32
  %0 = alloca i32
  %__mask = alloca i64
  %__word = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store %struct.__sigset_t* %__set, %struct.__sigset_t** %__set_addr
  store i32 %__sig, i32* %__sig_addr
  %1 = load i32* %__sig_addr, align 4, !dbg !665
  %2 = sub nsw i32 %1, 1, !dbg !665
  %3 = and i32 %2, 63, !dbg !665
  %.cast = zext i32 %3 to i64, !dbg !665
  %int_cast_to_i641 = bitcast i64 %.cast to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i641), !dbg !665
  %4 = shl i64 1, %.cast, !dbg !665
  store i64 %4, i64* %__mask, align 8, !dbg !665
  %5 = load i32* %__sig_addr, align 4, !dbg !665
  %6 = sub nsw i32 %5, 1, !dbg !665
  %7 = sext i32 %6 to i64, !dbg !665
  %int_cast_to_i64 = bitcast i64 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !665
  %8 = udiv i64 %7, 64, !dbg !665
  store i64 %8, i64* %__word, align 8, !dbg !665
  %9 = load i64* %__word, align 8, !dbg !665
  %10 = load i64* %__word, align 8, !dbg !665
  %11 = load %struct.__sigset_t** %__set_addr, align 8, !dbg !665
  %12 = getelementptr inbounds %struct.__sigset_t* %11, i32 0, i32 0, !dbg !665
  %13 = getelementptr inbounds [16 x i64]* %12, i64 0, i64 %10, !dbg !665
  %14 = load i64* %13, align 8, !dbg !665
  %15 = load i64* %__mask, align 8, !dbg !665
  %16 = or i64 %14, %15, !dbg !665
  %17 = load %struct.__sigset_t** %__set_addr, align 8, !dbg !665
  %18 = getelementptr inbounds %struct.__sigset_t* %17, i32 0, i32 0, !dbg !665
  %19 = getelementptr inbounds [16 x i64]* %18, i64 0, i64 %9, !dbg !665
  store i64 %16, i64* %19, align 8, !dbg !665
  store i32 0, i32* %0, align 4, !dbg !665
  %20 = load i32* %0, align 4, !dbg !665
  store i32 %20, i32* %retval, align 4, !dbg !665
  %retval1 = load i32* %retval, !dbg !665
  ret i32 %retval1, !dbg !666
}

define i32 @__sigdelset(%struct.__sigset_t* %__set, i32 %__sig) nounwind {
entry:
  %__set_addr = alloca %struct.__sigset_t*, align 8
  %__sig_addr = alloca i32, align 4
  %retval = alloca i32
  %0 = alloca i32
  %__mask = alloca i64
  %__word = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store %struct.__sigset_t* %__set, %struct.__sigset_t** %__set_addr
  store i32 %__sig, i32* %__sig_addr
  %1 = load i32* %__sig_addr, align 4, !dbg !668
  %2 = sub nsw i32 %1, 1, !dbg !668
  %3 = and i32 %2, 63, !dbg !668
  %.cast = zext i32 %3 to i64, !dbg !668
  %int_cast_to_i641 = bitcast i64 %.cast to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i641), !dbg !668
  %4 = shl i64 1, %.cast, !dbg !668
  store i64 %4, i64* %__mask, align 8, !dbg !668
  %5 = load i32* %__sig_addr, align 4, !dbg !668
  %6 = sub nsw i32 %5, 1, !dbg !668
  %7 = sext i32 %6 to i64, !dbg !668
  %int_cast_to_i64 = bitcast i64 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !668
  %8 = udiv i64 %7, 64, !dbg !668
  store i64 %8, i64* %__word, align 8, !dbg !668
  %9 = load i64* %__word, align 8, !dbg !668
  %10 = load i64* %__word, align 8, !dbg !668
  %11 = load %struct.__sigset_t** %__set_addr, align 8, !dbg !668
  %12 = getelementptr inbounds %struct.__sigset_t* %11, i32 0, i32 0, !dbg !668
  %13 = getelementptr inbounds [16 x i64]* %12, i64 0, i64 %10, !dbg !668
  %14 = load i64* %13, align 8, !dbg !668
  %15 = load i64* %__mask, align 8, !dbg !668
  %not = xor i64 %15, -1, !dbg !668
  %16 = and i64 %14, %not, !dbg !668
  %17 = load %struct.__sigset_t** %__set_addr, align 8, !dbg !668
  %18 = getelementptr inbounds %struct.__sigset_t* %17, i32 0, i32 0, !dbg !668
  %19 = getelementptr inbounds [16 x i64]* %18, i64 0, i64 %9, !dbg !668
  store i64 %16, i64* %19, align 8, !dbg !668
  store i32 0, i32* %0, align 4, !dbg !668
  %20 = load i32* %0, align 4, !dbg !668
  store i32 %20, i32* %retval, align 4, !dbg !668
  %retval2 = load i32* %retval, !dbg !668
  ret i32 %retval2, !dbg !669
}

define hidden i64 @__stdio_wcommit(%struct.FILE* noalias %stream) nounwind {
entry:
  %stream_addr = alloca %struct.FILE*, align 8
  %retval = alloca i64
  %0 = alloca i64
  %bufsize = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store %struct.FILE* %stream, %struct.FILE** %stream_addr
  %1 = load %struct.FILE** %stream_addr, align 8, !dbg !671
  %2 = getelementptr inbounds %struct.FILE* %1, i32 0, i32 5, !dbg !671
  %3 = load i8** %2, align 8, !dbg !671
  %4 = ptrtoint i8* %3 to i64, !dbg !671
  %5 = load %struct.FILE** %stream_addr, align 8, !dbg !671
  %6 = getelementptr inbounds %struct.FILE* %5, i32 0, i32 3, !dbg !671
  %7 = load i8** %6, align 8, !dbg !671
  %8 = ptrtoint i8* %7 to i64, !dbg !671
  %9 = sub nsw i64 %4, %8, !dbg !671
  store i64 %9, i64* %bufsize, align 8, !dbg !671
  %10 = load i64* %bufsize, align 8, !dbg !671
  %11 = icmp ne i64 %10, 0, !dbg !671
  br i1 %11, label %bb, label %bb1, !dbg !671

bb:                                               ; preds = %entry
  %12 = load %struct.FILE** %stream_addr, align 8, !dbg !673
  %13 = getelementptr inbounds %struct.FILE* %12, i32 0, i32 3, !dbg !673
  %14 = load i8** %13, align 8, !dbg !673
  %15 = load %struct.FILE** %stream_addr, align 8, !dbg !673
  %16 = getelementptr inbounds %struct.FILE* %15, i32 0, i32 5, !dbg !673
  store i8* %14, i8** %16, align 8, !dbg !673
  %17 = load %struct.FILE** %stream_addr, align 8, !dbg !674
  %18 = getelementptr inbounds %struct.FILE* %17, i32 0, i32 3, !dbg !674
  %19 = load i8** %18, align 8, !dbg !674
  %20 = load %struct.FILE** %stream_addr, align 8, !dbg !674
  %21 = load i64* %bufsize, align 8, !dbg !674
  %22 = call i64 @__stdio_WRITE(%struct.FILE* %20, i8* %19, i64 %21) nounwind, !dbg !674
  br label %bb1, !dbg !674

bb1:                                              ; preds = %bb, %entry
  %23 = load %struct.FILE** %stream_addr, align 8, !dbg !675
  %24 = getelementptr inbounds %struct.FILE* %23, i32 0, i32 5, !dbg !675
  %25 = load i8** %24, align 8, !dbg !675
  %26 = ptrtoint i8* %25 to i64, !dbg !675
  %27 = load %struct.FILE** %stream_addr, align 8, !dbg !675
  %28 = getelementptr inbounds %struct.FILE* %27, i32 0, i32 3, !dbg !675
  %29 = load i8** %28, align 8, !dbg !675
  %30 = ptrtoint i8* %29 to i64, !dbg !675
  %31 = sub nsw i64 %26, %30, !dbg !675
  store i64 %31, i64* %0, align 8, !dbg !675
  %32 = load i64* %0, align 8, !dbg !675
  store i64 %32, i64* %retval, align 8, !dbg !675
  %retval2 = load i64* %retval, !dbg !675
  ret i64 %retval2, !dbg !675
}

define i32 @isatty(i32 %fd) nounwind {
entry:
  %fd_addr = alloca i32, align 4
  %retval = alloca i32
  %0 = alloca i32
  %term = alloca %struct.termios
  %"alloca point" = bitcast i32 0 to i32
  store i32 %fd, i32* %fd_addr
  %1 = load i32* %fd_addr, align 4, !dbg !676
  %2 = call i32 @tcgetattr(i32 %1, %struct.termios* %term) nounwind, !dbg !676
  %3 = icmp eq i32 %2, 0, !dbg !676
  %4 = zext i1 %3 to i32, !dbg !676
  store i32 %4, i32* %0, align 4, !dbg !676
  %5 = load i32* %0, align 4, !dbg !676
  store i32 %5, i32* %retval, align 4, !dbg !676
  %retval1 = load i32* %retval, !dbg !676
  ret i32 %retval1, !dbg !676
}

define hidden i32 @__raise(i32 %signo) nounwind {
entry:
  %signo_addr = alloca i32, align 4
  %retval = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i32 %signo, i32* %signo_addr
  %1 = call i32 @getpid() nounwind, !dbg !678
  %2 = load i32* %signo_addr, align 4, !dbg !678
  %3 = call i32 @kill(i32 %1, i32 %2) nounwind, !dbg !678
  store i32 %3, i32* %0, align 4, !dbg !678
  %4 = load i32* %0, align 4, !dbg !678
  store i32 %4, i32* %retval, align 4, !dbg !678
  %retval1 = load i32* %retval, !dbg !678
  ret i32 %retval1, !dbg !678
}

declare i32 @getpid() nounwind

declare i32 @kill(i32, i32) nounwind

define i32 @__libc_sigaction(i32 %sig, %struct.sigaction* %act, %struct.sigaction* %oact) nounwind {
entry:
  %sig_addr = alloca i32, align 4
  %act_addr = alloca %struct.sigaction*, align 8
  %oact_addr = alloca %struct.sigaction*, align 8
  %retval = alloca i32
  %0 = alloca i32
  %iftmp.1 = alloca %struct.kernel_sigaction*
  %iftmp.0 = alloca %struct.kernel_sigaction*
  %result = alloca i32
  %kact = alloca %struct.kernel_sigaction
  %koact = alloca %struct.kernel_sigaction
  %"alloca point" = bitcast i32 0 to i32
  store i32 %sig, i32* %sig_addr
  store %struct.sigaction* %act, %struct.sigaction** %act_addr
  store %struct.sigaction* %oact, %struct.sigaction** %oact_addr
  %1 = load %struct.sigaction** %act_addr, align 8, !dbg !680
  %2 = icmp ne %struct.sigaction* %1, null, !dbg !680
  br i1 %2, label %bb, label %bb1, !dbg !680

bb:                                               ; preds = %entry
  %3 = load %struct.sigaction** %act_addr, align 8, !dbg !682
  %4 = getelementptr inbounds %struct.sigaction* %3, i32 0, i32 0, !dbg !682
  %5 = getelementptr inbounds %0* %4, i32 0, i32 0, !dbg !682
  %6 = load void (i32)** %5, align 8, !dbg !682
  %7 = getelementptr inbounds %struct.kernel_sigaction* %kact, i32 0, i32 0, !dbg !682
  store void (i32)* %6, void (i32)** %7, align 8, !dbg !682
  %8 = load %struct.sigaction** %act_addr, align 8, !dbg !683
  %9 = getelementptr inbounds %struct.sigaction* %8, i32 0, i32 1, !dbg !683
  %10 = getelementptr inbounds %struct.kernel_sigaction* %kact, i32 0, i32 3, !dbg !683
  %11 = bitcast %struct.__sigset_t* %10 to i8*, !dbg !683
  %12 = bitcast %struct.__sigset_t* %9 to i8*, !dbg !683
  %13 = call i8* @memcpy(i8* noalias %11, i8* noalias %12, i64 128) nounwind, !dbg !683
  %14 = load %struct.sigaction** %act_addr, align 8, !dbg !684
  %15 = getelementptr inbounds %struct.sigaction* %14, i32 0, i32 2, !dbg !684
  %16 = load i32* %15, align 8, !dbg !684
  %17 = sext i32 %16 to i64, !dbg !684
  %18 = getelementptr inbounds %struct.kernel_sigaction* %kact, i32 0, i32 1, !dbg !684
  store i64 %17, i64* %18, align 8, !dbg !684
  %19 = load %struct.sigaction** %act_addr, align 8, !dbg !685
  %20 = getelementptr inbounds %struct.sigaction* %19, i32 0, i32 3, !dbg !685
  %21 = load void ()** %20, align 8, !dbg !685
  %22 = getelementptr inbounds %struct.kernel_sigaction* %kact, i32 0, i32 2, !dbg !685
  store void ()* %21, void ()** %22, align 8, !dbg !685
  br label %bb1, !dbg !685

bb1:                                              ; preds = %bb, %entry
  %23 = load %struct.sigaction** %oact_addr, align 8, !dbg !686
  %24 = icmp ne %struct.sigaction* %23, null, !dbg !686
  br i1 %24, label %bb2, label %bb3, !dbg !686

bb2:                                              ; preds = %bb1
  store %struct.kernel_sigaction* %koact, %struct.kernel_sigaction** %iftmp.0, align 8, !dbg !686
  br label %bb4, !dbg !686

bb3:                                              ; preds = %bb1
  store %struct.kernel_sigaction* null, %struct.kernel_sigaction** %iftmp.0, align 8, !dbg !686
  br label %bb4, !dbg !686

bb4:                                              ; preds = %bb3, %bb2
  %25 = load %struct.sigaction** %act_addr, align 8, !dbg !686
  %26 = icmp ne %struct.sigaction* %25, null, !dbg !686
  br i1 %26, label %bb5, label %bb6, !dbg !686

bb5:                                              ; preds = %bb4
  store %struct.kernel_sigaction* %kact, %struct.kernel_sigaction** %iftmp.1, align 8, !dbg !686
  br label %bb7, !dbg !686

bb6:                                              ; preds = %bb4
  store %struct.kernel_sigaction* null, %struct.kernel_sigaction** %iftmp.1, align 8, !dbg !686
  br label %bb7, !dbg !686

bb7:                                              ; preds = %bb6, %bb5
  %27 = load i32* %sig_addr, align 4, !dbg !686
  %28 = load %struct.kernel_sigaction** %iftmp.1, align 8, !dbg !686
  %29 = load %struct.kernel_sigaction** %iftmp.0, align 8, !dbg !686
  %30 = call i32 @__syscall_rt_sigaction(i32 %27, %struct.kernel_sigaction* %28, %struct.kernel_sigaction* %29, i64 8) nounwind, !dbg !686
  store i32 %30, i32* %result, align 4, !dbg !686
  %31 = load %struct.sigaction** %oact_addr, align 8, !dbg !687
  %32 = icmp ne %struct.sigaction* %31, null, !dbg !687
  br i1 %32, label %bb8, label %bb10, !dbg !687

bb8:                                              ; preds = %bb7
  %33 = load i32* %result, align 4, !dbg !687
  %34 = icmp sge i32 %33, 0, !dbg !687
  br i1 %34, label %bb9, label %bb10, !dbg !687

bb9:                                              ; preds = %bb8
  %35 = getelementptr inbounds %struct.kernel_sigaction* %koact, i32 0, i32 0, !dbg !688
  %36 = load void (i32)** %35, align 8, !dbg !688
  %37 = load %struct.sigaction** %oact_addr, align 8, !dbg !688
  %38 = getelementptr inbounds %struct.sigaction* %37, i32 0, i32 0, !dbg !688
  %39 = getelementptr inbounds %0* %38, i32 0, i32 0, !dbg !688
  store void (i32)* %36, void (i32)** %39, align 8, !dbg !688
  %40 = load %struct.sigaction** %oact_addr, align 8, !dbg !689
  %41 = getelementptr inbounds %struct.sigaction* %40, i32 0, i32 1, !dbg !689
  %42 = bitcast %struct.__sigset_t* %41 to i8*, !dbg !689
  %43 = getelementptr inbounds %struct.kernel_sigaction* %koact, i32 0, i32 3, !dbg !689
  %44 = bitcast %struct.__sigset_t* %43 to i8*, !dbg !689
  %45 = call i8* @memcpy(i8* noalias %42, i8* noalias %44, i64 128) nounwind, !dbg !689
  %46 = getelementptr inbounds %struct.kernel_sigaction* %koact, i32 0, i32 1, !dbg !690
  %47 = load i64* %46, align 8, !dbg !690
  %48 = trunc i64 %47 to i32, !dbg !690
  %49 = load %struct.sigaction** %oact_addr, align 8, !dbg !690
  %50 = getelementptr inbounds %struct.sigaction* %49, i32 0, i32 2, !dbg !690
  store i32 %48, i32* %50, align 8, !dbg !690
  %51 = getelementptr inbounds %struct.kernel_sigaction* %koact, i32 0, i32 2, !dbg !691
  %52 = load void ()** %51, align 8, !dbg !691
  %53 = load %struct.sigaction** %oact_addr, align 8, !dbg !691
  %54 = getelementptr inbounds %struct.sigaction* %53, i32 0, i32 3, !dbg !691
  store void ()* %52, void ()** %54, align 8, !dbg !691
  br label %bb10, !dbg !691

bb10:                                             ; preds = %bb9, %bb8, %bb7
  %55 = load i32* %result, align 4, !dbg !692
  store i32 %55, i32* %0, align 4, !dbg !692
  %56 = load i32* %0, align 4, !dbg !692
  store i32 %56, i32* %retval, align 4, !dbg !692
  %retval11 = load i32* %retval, !dbg !692
  ret i32 %retval11, !dbg !692
}

declare hidden i32 @__syscall_rt_sigaction(i32, %struct.kernel_sigaction*, %struct.kernel_sigaction*, i64)

define hidden i64 @__stdio_WRITE(%struct.FILE* %stream, i8* %buf, i64 %bufsize) nounwind {
entry:
  %stream_addr = alloca %struct.FILE*, align 8
  %buf_addr = alloca i8*, align 8
  %bufsize_addr = alloca i64, align 8
  %retval = alloca i64
  %iftmp.0 = alloca i64
  %0 = alloca i64
  %todo = alloca i64
  %rv = alloca i64
  %stodo = alloca i64
  %s = alloca i8*
  %"alloca point" = bitcast i32 0 to i32
  store %struct.FILE* %stream, %struct.FILE** %stream_addr
  store i8* %buf, i8** %buf_addr
  store i64 %bufsize, i64* %bufsize_addr
  %1 = load i64* %bufsize_addr, align 8, !dbg !693
  store i64 %1, i64* %todo, align 8, !dbg !693
  br label %bb, !dbg !693

bb:                                               ; preds = %bb6, %entry
  %2 = load i64* %todo, align 8, !dbg !695
  %3 = icmp eq i64 %2, 0, !dbg !695
  br i1 %3, label %bb1, label %bb2, !dbg !695

bb1:                                              ; preds = %bb
  %4 = load i64* %bufsize_addr, align 8, !dbg !696
  store i64 %4, i64* %0, align 8, !dbg !696
  br label %bb16, !dbg !696

bb2:                                              ; preds = %bb
  %5 = load i64* %todo, align 8, !dbg !697
  %6 = icmp sge i64 %5, 0, !dbg !697
  br i1 %6, label %bb3, label %bb4, !dbg !697

bb3:                                              ; preds = %bb2
  %7 = load i64* %todo, align 8, !dbg !697
  store i64 %7, i64* %iftmp.0, align 8, !dbg !697
  br label %bb5, !dbg !697

bb4:                                              ; preds = %bb2
  store i64 9223372036854775807, i64* %iftmp.0, align 8, !dbg !697
  br label %bb5, !dbg !697

bb5:                                              ; preds = %bb4, %bb3
  %8 = load i64* %iftmp.0, align 8, !dbg !697
  store i64 %8, i64* %stodo, align 8, !dbg !697
  %9 = load i64* %stodo, align 8, !dbg !698
  %10 = load %struct.FILE** %stream_addr, align 8, !dbg !698
  %11 = getelementptr inbounds %struct.FILE* %10, i32 0, i32 2, !dbg !698
  %12 = load i32* %11, align 4, !dbg !698
  %13 = load i8** %buf_addr, align 8, !dbg !698
  %14 = call i64 @write(i32 %12, i8* %13, i64 %9) nounwind, !dbg !698
  store i64 %14, i64* %rv, align 8, !dbg !698
  %15 = load i64* %rv, align 8, !dbg !698
  %16 = icmp sge i64 %15, 0, !dbg !698
  br i1 %16, label %bb6, label %bb7, !dbg !698

bb6:                                              ; preds = %bb5
  %17 = load i64* %rv, align 8, !dbg !699
  %18 = load i64* %todo, align 8, !dbg !699
  %19 = sub i64 %18, %17, !dbg !699
  store i64 %19, i64* %todo, align 8, !dbg !699
  %20 = load i8** %buf_addr, align 8, !dbg !700
  %21 = load i64* %rv, align 8, !dbg !700
  %22 = getelementptr inbounds i8* %20, i64 %21, !dbg !700
  store i8* %22, i8** %buf_addr, align 8, !dbg !700
  br label %bb, !dbg !700

bb7:                                              ; preds = %bb5
  %23 = load %struct.FILE** %stream_addr, align 8, !dbg !701
  %24 = getelementptr inbounds %struct.FILE* %23, i32 0, i32 0, !dbg !701
  %25 = load i16* %24, align 8, !dbg !701
  %26 = or i16 %25, 8, !dbg !701
  %27 = load %struct.FILE** %stream_addr, align 8, !dbg !701
  %28 = getelementptr inbounds %struct.FILE* %27, i32 0, i32 0, !dbg !701
  store i16 %26, i16* %28, align 8, !dbg !701
  %29 = load %struct.FILE** %stream_addr, align 8, !dbg !702
  %30 = getelementptr inbounds %struct.FILE* %29, i32 0, i32 4, !dbg !702
  %31 = load i8** %30, align 8, !dbg !702
  %32 = ptrtoint i8* %31 to i64, !dbg !702
  %33 = load %struct.FILE** %stream_addr, align 8, !dbg !702
  %34 = getelementptr inbounds %struct.FILE* %33, i32 0, i32 3, !dbg !702
  %35 = load i8** %34, align 8, !dbg !702
  %36 = ptrtoint i8* %35 to i64, !dbg !702
  %37 = sub nsw i64 %32, %36, !dbg !702
  store i64 %37, i64* %stodo, align 8, !dbg !702
  %38 = load i64* %stodo, align 8, !dbg !702
  %39 = icmp ne i64 %38, 0, !dbg !702
  br i1 %39, label %bb8, label %bb15, !dbg !702

bb8:                                              ; preds = %bb7
  %40 = load i64* %stodo, align 8, !dbg !703
  %41 = load i64* %todo, align 8, !dbg !703
  %42 = icmp ugt i64 %40, %41, !dbg !703
  br i1 %42, label %bb9, label %bb10, !dbg !703

bb9:                                              ; preds = %bb8
  %43 = load i64* %todo, align 8, !dbg !705
  store i64 %43, i64* %stodo, align 8, !dbg !705
  br label %bb10, !dbg !705

bb10:                                             ; preds = %bb9, %bb8
  %44 = load %struct.FILE** %stream_addr, align 8, !dbg !706
  %45 = getelementptr inbounds %struct.FILE* %44, i32 0, i32 3, !dbg !706
  %46 = load i8** %45, align 8, !dbg !706
  store i8* %46, i8** %s, align 8, !dbg !706
  br label %bb11, !dbg !706

bb11:                                             ; preds = %bb13, %bb10
  %47 = load i8** %buf_addr, align 8, !dbg !707
  %48 = load i8* %47, align 1, !dbg !707
  %49 = load i8** %s, align 8, !dbg !707
  store i8 %48, i8* %49, align 1, !dbg !707
  %50 = load i8** %s, align 8, !dbg !707
  %51 = load i8* %50, align 1, !dbg !707
  %52 = icmp eq i8 %51, 10, !dbg !707
  br i1 %52, label %bb12, label %bb13, !dbg !707

bb12:                                             ; preds = %bb11
  %53 = load %struct.FILE** %stream_addr, align 8, !dbg !707
  %54 = getelementptr inbounds %struct.FILE* %53, i32 0, i32 0, !dbg !707
  %55 = load i16* %54, align 8, !dbg !707
  %56 = zext i16 %55 to i32, !dbg !707
  %57 = and i32 %56, 256, !dbg !707
  %58 = icmp ne i32 %57, 0, !dbg !707
  br i1 %58, label %bb14, label %bb13, !dbg !707

bb13:                                             ; preds = %bb12, %bb11
  %59 = load i8** %s, align 8, !dbg !708
  %60 = getelementptr inbounds i8* %59, i64 1, !dbg !708
  store i8* %60, i8** %s, align 8, !dbg !708
  %61 = load i8** %buf_addr, align 8, !dbg !709
  %62 = getelementptr inbounds i8* %61, i64 1, !dbg !709
  store i8* %62, i8** %buf_addr, align 8, !dbg !709
  %63 = load i64* %stodo, align 8, !dbg !710
  %64 = sub nsw i64 %63, 1, !dbg !710
  store i64 %64, i64* %stodo, align 8, !dbg !710
  %65 = load i64* %stodo, align 8, !dbg !710
  %66 = icmp ne i64 %65, 0, !dbg !710
  br i1 %66, label %bb11, label %bb14, !dbg !710

bb14:                                             ; preds = %bb13, %bb12
  %67 = load %struct.FILE** %stream_addr, align 8, !dbg !711
  %68 = getelementptr inbounds %struct.FILE* %67, i32 0, i32 5, !dbg !711
  %69 = load i8** %s, align 8, !dbg !711
  store i8* %69, i8** %68, align 8, !dbg !711
  %70 = load i8** %s, align 8, !dbg !712
  %71 = ptrtoint i8* %70 to i64, !dbg !712
  %72 = load %struct.FILE** %stream_addr, align 8, !dbg !712
  %73 = getelementptr inbounds %struct.FILE* %72, i32 0, i32 3, !dbg !712
  %74 = load i8** %73, align 8, !dbg !712
  %75 = ptrtoint i8* %74 to i64, !dbg !712
  %76 = sub nsw i64 %71, %75, !dbg !712
  %77 = load i64* %todo, align 8, !dbg !712
  %78 = sub i64 %77, %76, !dbg !712
  store i64 %78, i64* %todo, align 8, !dbg !712
  br label %bb15, !dbg !712

bb15:                                             ; preds = %bb14, %bb7
  %79 = load i64* %bufsize_addr, align 8, !dbg !713
  %80 = load i64* %todo, align 8, !dbg !713
  %81 = sub i64 %79, %80, !dbg !713
  store i64 %81, i64* %0, align 8, !dbg !713
  br label %bb16, !dbg !713

bb16:                                             ; preds = %bb15, %bb1
  %82 = load i64* %0, align 8, !dbg !696
  store i64 %82, i64* %retval, align 8, !dbg !696
  %retval17 = load i64* %retval, !dbg !696
  ret i64 %retval17, !dbg !696
}

declare i64 @write(i32, i8*, i64)

define i32 @tcgetattr(i32 %fd, %struct.termios* %termios_p) nounwind {
entry:
  %fd_addr = alloca i32, align 4
  %termios_p_addr = alloca %struct.termios*, align 8
  %retval = alloca i32
  %0 = alloca i32
  %k_termios = alloca %struct.__kernel_termios
  %retval1 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i32 %fd, i32* %fd_addr
  store %struct.termios* %termios_p, %struct.termios** %termios_p_addr
  %1 = load i32* %fd_addr, align 4, !dbg !714
  %2 = call i32 (i32, i64, ...)* @ioctl(i32 %1, i64 21505, %struct.__kernel_termios* %k_termios) nounwind, !dbg !714
  store i32 %2, i32* %retval1, align 4, !dbg !714
  %3 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 0, !dbg !716
  %4 = load i32* %3, align 4, !dbg !716
  %5 = load %struct.termios** %termios_p_addr, align 8, !dbg !716
  %6 = getelementptr inbounds %struct.termios* %5, i32 0, i32 0, !dbg !716
  store i32 %4, i32* %6, align 4, !dbg !716
  %7 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 1, !dbg !717
  %8 = load i32* %7, align 4, !dbg !717
  %9 = load %struct.termios** %termios_p_addr, align 8, !dbg !717
  %10 = getelementptr inbounds %struct.termios* %9, i32 0, i32 1, !dbg !717
  store i32 %8, i32* %10, align 4, !dbg !717
  %11 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 2, !dbg !718
  %12 = load i32* %11, align 4, !dbg !718
  %13 = load %struct.termios** %termios_p_addr, align 8, !dbg !718
  %14 = getelementptr inbounds %struct.termios* %13, i32 0, i32 2, !dbg !718
  store i32 %12, i32* %14, align 4, !dbg !718
  %15 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 3, !dbg !719
  %16 = load i32* %15, align 4, !dbg !719
  %17 = load %struct.termios** %termios_p_addr, align 8, !dbg !719
  %18 = getelementptr inbounds %struct.termios* %17, i32 0, i32 3, !dbg !719
  store i32 %16, i32* %18, align 4, !dbg !719
  %19 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 4, !dbg !720
  %20 = load i8* %19, align 4, !dbg !720
  %21 = load %struct.termios** %termios_p_addr, align 8, !dbg !720
  %22 = getelementptr inbounds %struct.termios* %21, i32 0, i32 4, !dbg !720
  store i8 %20, i8* %22, align 4, !dbg !720
  %23 = load %struct.termios** %termios_p_addr, align 8, !dbg !721
  %24 = getelementptr inbounds %struct.termios* %23, i32 0, i32 5, !dbg !721
  %25 = getelementptr inbounds [32 x i8]* %24, i64 0, i64 0, !dbg !721
  %26 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 5, !dbg !721
  %27 = getelementptr inbounds [19 x i8]* %26, i64 0, i64 0, !dbg !721
  %28 = call i8* @mempcpy(i8* noalias %25, i8* noalias %27, i64 19) nounwind, !dbg !721
  %29 = call i8* @memset(i8* %28, i32 0, i64 13) nounwind, !dbg !721
  %30 = load i32* %retval1, align 4, !dbg !722
  store i32 %30, i32* %0, align 4, !dbg !722
  %31 = load i32* %0, align 4, !dbg !722
  store i32 %31, i32* %retval, align 4, !dbg !722
  %retval2 = load i32* %retval, !dbg !722
  ret i32 %retval2, !dbg !722
}

declare i32 @ioctl(i32, i64, ...) nounwind

define i8* @mempcpy(i8* noalias %s1, i8* noalias %s2, i64 %n) nounwind {
entry:
  %s1_addr = alloca i8*, align 8
  %s2_addr = alloca i8*, align 8
  %n_addr = alloca i64, align 8
  %retval = alloca i8*
  %0 = alloca i8*
  %r1 = alloca i8*
  %r2 = alloca i8*
  %"alloca point" = bitcast i32 0 to i32
  store i8* %s1, i8** %s1_addr
  store i8* %s2, i8** %s2_addr
  store i64 %n, i64* %n_addr
  %1 = load i8** %s1_addr, align 8, !dbg !723
  store i8* %1, i8** %r1, align 8, !dbg !723
  %2 = load i8** %s2_addr, align 8, !dbg !725
  store i8* %2, i8** %r2, align 8, !dbg !725
  br label %bb1, !dbg !725

bb:                                               ; preds = %bb1
  %3 = load i8** %r2, align 8, !dbg !726
  %4 = load i8* %3, align 1, !dbg !726
  %5 = load i8** %r1, align 8, !dbg !726
  store i8 %4, i8* %5, align 1, !dbg !726
  %6 = load i8** %r1, align 8, !dbg !726
  %7 = getelementptr inbounds i8* %6, i64 1, !dbg !726
  store i8* %7, i8** %r1, align 8, !dbg !726
  %8 = load i8** %r2, align 8, !dbg !726
  %9 = getelementptr inbounds i8* %8, i64 1, !dbg !726
  store i8* %9, i8** %r2, align 8, !dbg !726
  %10 = load i64* %n_addr, align 8, !dbg !727
  %11 = sub i64 %10, 1, !dbg !727
  store i64 %11, i64* %n_addr, align 8, !dbg !727
  br label %bb1, !dbg !727

bb1:                                              ; preds = %bb, %entry
  %12 = load i64* %n_addr, align 8, !dbg !728
  %13 = icmp ne i64 %12, 0, !dbg !728
  br i1 %13, label %bb, label %bb2, !dbg !728

bb2:                                              ; preds = %bb1
  %14 = load i8** %r1, align 8, !dbg !729
  store i8* %14, i8** %0, align 8, !dbg !729
  %15 = load i8** %0, align 8, !dbg !729
  store i8* %15, i8** %retval, align 8, !dbg !729
  %retval3 = load i8** %retval, !dbg !729
  ret i8* %retval3, !dbg !729
}

define i32 @main(i32, i8**) {
entry:
  call void @__uClibc_main(i32 (i32, i8**, i8**)* bitcast (i32 ()* @__user_main to i32 (i32, i8**, i8**)*), i32 %0, i8** %1, void ()* null, void ()* null, void ()* null, i8* null)
  unreachable
}

define void @klee_div_zero_check(i64 %z) nounwind {
entry:
  %0 = icmp eq i64 %z, 0, !dbg !730
  br i1 %0, label %bb, label %return, !dbg !730

bb:                                               ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str29, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str130, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str231, i64 0, i64 0)) noreturn nounwind, !
  unreachable, !dbg !732

return:                                           ; preds = %entry
  ret void, !dbg !733
}

declare void @klee_report_error(i8*, i32, i8*, i8*) noreturn

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i32 @klee_int(i8* %name) nounwind {
entry:
  %x = alloca i32, align 4
  %x1 = bitcast i32* %x to i8*, !dbg !734
  call void @klee_make_symbolic(i8* %x1, i64 4, i8* %name) nounwind, !dbg !734
  %0 = load i32* %x, align 4, !dbg !735
  ret i32 %0, !dbg !735
}

define void @klee_overshift_check(i64 %bitWidth, i64 %shift) nounwind {
entry:
  %0 = icmp ult i64 %shift, %bitWidth, !dbg !736
  br i1 %0, label %return, label %bb, !dbg !736

bb:                                               ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str332, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) noreturn nounwind, !db
  unreachable, !dbg !738

return:                                           ; preds = %entry
  ret void, !dbg !739
}

define i32 @klee_range(i32 %start, i32 %end, i8* %name) nounwind {
entry:
  %x = alloca i32, align 4
  %0 = icmp slt i32 %start, %end, !dbg !740
  br i1 %0, label %bb1, label %bb, !dbg !740

bb:                                               ; preds = %entry
  call void @klee_report_error(i8* getelementptr inbounds ([13 x i8]* @.str633, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) noreturn nounwind, !dbg !7
  unreachable, !dbg !741

bb1:                                              ; preds = %entry
  %1 = add nsw i32 %start, 1, !dbg !742
  %2 = icmp eq i32 %1, %end, !dbg !742
  br i1 %2, label %bb8, label %bb3, !dbg !742

bb3:                                              ; preds = %bb1
  %x4 = bitcast i32* %x to i8*, !dbg !743
  call void @klee_make_symbolic(i8* %x4, i64 4, i8* %name) nounwind, !dbg !743
  %3 = icmp eq i32 %start, 0, !dbg !744
  %4 = load i32* %x, align 4, !dbg !745
  br i1 %3, label %bb5, label %bb6, !dbg !744

bb5:                                              ; preds = %bb3
  %5 = icmp ult i32 %4, %end, !dbg !745
  %6 = zext i1 %5 to i64, !dbg !745
  call void @klee_assume(i64 %6) nounwind, !dbg !745
  br label %bb7, !dbg !745

bb6:                                              ; preds = %bb3
  %7 = icmp sge i32 %4, %start, !dbg !746
  %8 = zext i1 %7 to i64, !dbg !746
  call void @klee_assume(i64 %8) nounwind, !dbg !746
  %9 = load i32* %x, align 4, !dbg !747
  %10 = icmp slt i32 %9, %end, !dbg !747
  %11 = zext i1 %10 to i64, !dbg !747
  call void @klee_assume(i64 %11) nounwind, !dbg !747
  br label %bb7, !dbg !747

bb7:                                              ; preds = %bb6, %bb5
  %12 = load i32* %x, align 4, !dbg !748
  br label %bb8, !dbg !748

bb8:                                              ; preds = %bb7, %bb1
  %.0 = phi i32 [ %12, %bb7 ], [ %start, %bb1 ]
  ret i32 %.0, !dbg !749
}

declare void @klee_assume(i64)

!llvm.dbg.sp = !{!0, !6, !9, !15, !21, !24, !27, !28, !39, !48, !60, !67, !74, !78, !79, !83, !90, !99, !109, !125, !126, !127, !169, !175, !181, !279, !321, !347, !356, !362, !371, !377, !386, !395, !404, !413}
!llvm.dbg.gv = !{!423, !424, !427, !428, !432, !433, !434, !435, !471, !473, !474, !475, !476, !477, !478, !480, !482, !486}
!llvm.dbg.lv.klee_div_zero_check = !{!487}
!llvm.dbg.lv.klee_int = !{!488, !489}
!llvm.dbg.lv.klee_overshift_check = !{!491, !492}
!llvm.dbg.lv.klee_range = !{!493, !494, !495, !496}
!llvm.dbg.lv.memcpy = !{!498, !499, !500, !501, !505}
!llvm.dbg.lv.memmove = !{!508, !509, !510, !511, !515}
!llvm.dbg.lv.mempcpy = !{!518, !519, !520, !521, !525}
!llvm.dbg.lv.memset = !{!528, !529, !530, !531}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"branching_function", metadata !"branching_function", metadata !"branching_function", metadata !1, i32 6, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @br
!1 = metadata !{i32 589865, metadata !"test-z3.c", metadata !"/home/zehranaz/finalproj/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 1, metadata !"test-z3.c", metadata !"/home/zehranaz/finalproj/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !5, metadata !5}
!5 = metadata !{i32 589860, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 589870, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"main", metadata !1, i32 38, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @__user_main} ; [ DW_TAG_subprogram ]
!7 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{metadata !5}
!9 = metadata !{i32 589870, i32 0, metadata !10, metadata !"__check_one_fd", metadata !"__check_one_fd", metadata !"", metadata !10, i32 137, metadata !12, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32)* @__check_one_fd} ; [ DW_
!10 = metadata !{i32 589865, metadata !"__uClibc_main.c", metadata !"/home/zehranaz/klee-uclibc/libc/misc/internals", metadata !11} ; [ DW_TAG_file_type ]
!11 = metadata !{i32 589841, i32 0, i32 1, metadata !"__uClibc_main.c", metadata !"/home/zehranaz/klee-uclibc/libc/misc/internals", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_co
!12 = metadata !{i32 589845, metadata !10, metadata !"", metadata !10, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !13, i32 0, null} ; [ DW_TAG_subroutine_type ]
!13 = metadata !{null, metadata !14, metadata !14}
!14 = metadata !{i32 589860, metadata !10, metadata !"int", metadata !10, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!15 = metadata !{i32 589870, i32 0, metadata !10, metadata !"gnu_dev_makedev", metadata !"gnu_dev_makedev", metadata !"", metadata !16, i32 55, metadata !17, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i32, i32)* @gnu_dev_makedev} ; [ D
!16 = metadata !{i32 589865, metadata !"sysmacros.h", metadata !"/home/zehranaz/klee-uclibc/./include/sys", metadata !11} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 589845, metadata !10, metadata !"", metadata !10, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null} ; [ DW_TAG_subroutine_type ]
!18 = metadata !{metadata !19, metadata !20, metadata !20}
!19 = metadata !{i32 589860, metadata !10, metadata !"long long unsigned int", metadata !10, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!20 = metadata !{i32 589860, metadata !10, metadata !"unsigned int", metadata !10, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!21 = metadata !{i32 589870, i32 0, metadata !10, metadata !"__check_suid", metadata !"__check_suid", metadata !"", metadata !10, i32 156, metadata !22, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @__check_suid} ; [ DW_TAG_subprogram
!22 = metadata !{i32 589845, metadata !10, metadata !"", metadata !10, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, null} ; [ DW_TAG_subroutine_type ]
!23 = metadata !{metadata !14}
!24 = metadata !{i32 589870, i32 0, metadata !10, metadata !"__uClibc_init", metadata !"__uClibc_init", metadata !"__uClibc_init", metadata !10, i32 188, metadata !25, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @__uClibc_init} ; [
!25 = metadata !{i32 589845, metadata !10, metadata !"", metadata !10, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, null} ; [ DW_TAG_subroutine_type ]
!26 = metadata !{null}
!27 = metadata !{i32 589870, i32 0, metadata !10, metadata !"__uClibc_fini", metadata !"__uClibc_fini", metadata !"__uClibc_fini", metadata !10, i32 252, metadata !25, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @__uClibc_fini} ; [
!28 = metadata !{i32 589870, i32 0, metadata !10, metadata !"__uClibc_main", metadata !"__uClibc_main", metadata !"__uClibc_main", metadata !10, i32 281, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32 (i32, i8**, i8**)*
!29 = metadata !{i32 589845, metadata !10, metadata !"", metadata !10, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null} ; [ DW_TAG_subroutine_type ]
!30 = metadata !{null, metadata !31, metadata !14, metadata !34, metadata !37, metadata !37, metadata !37, metadata !38}
!31 = metadata !{i32 589839, metadata !10, metadata !"", metadata !10, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !32} ; [ DW_TAG_pointer_type ]
!32 = metadata !{i32 589845, metadata !10, metadata !"", metadata !10, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !33, i32 0, null} ; [ DW_TAG_subroutine_type ]
!33 = metadata !{metadata !14, metadata !14, metadata !34, metadata !34}
!34 = metadata !{i32 589839, metadata !10, metadata !"", metadata !10, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !35} ; [ DW_TAG_pointer_type ]
!35 = metadata !{i32 589839, metadata !10, metadata !"", metadata !10, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !36} ; [ DW_TAG_pointer_type ]
!36 = metadata !{i32 589860, metadata !10, metadata !"char", metadata !10, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!37 = metadata !{i32 589839, metadata !10, metadata !"", metadata !10, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !25} ; [ DW_TAG_pointer_type ]
!38 = metadata !{i32 589839, metadata !10, metadata !"", metadata !10, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!39 = metadata !{i32 589870, i32 0, metadata !40, metadata !"strcmp", metadata !"strcmp", metadata !"strcmp", metadata !40, i32 21, metadata !42, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*, i8*)* @strcmp} ; [ DW_TAG_subprogram ]
!40 = metadata !{i32 589865, metadata !"strcmp.c", metadata !"/home/zehranaz/klee-uclibc/libc/string", metadata !41} ; [ DW_TAG_file_type ]
!41 = metadata !{i32 589841, i32 0, i32 1, metadata !"strcmp.c", metadata !"/home/zehranaz/klee-uclibc/libc/string", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!42 = metadata !{i32 589845, metadata !40, metadata !"", metadata !40, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !43, i32 0, null} ; [ DW_TAG_subroutine_type ]
!43 = metadata !{metadata !44, metadata !45, metadata !45}
!44 = metadata !{i32 589860, metadata !40, metadata !"int", metadata !40, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!45 = metadata !{i32 589839, metadata !40, metadata !"", metadata !40, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !46} ; [ DW_TAG_pointer_type ]
!46 = metadata !{i32 589862, metadata !40, metadata !"", metadata !40, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !47} ; [ DW_TAG_const_type ]
!47 = metadata !{i32 589860, metadata !40, metadata !"char", metadata !40, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!48 = metadata !{i32 589870, i32 0, metadata !49, metadata !"strncpy", metadata !"strncpy", metadata !"strncpy", metadata !49, i32 19, metadata !51, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i8*, i64)* @strncpy} ; [ DW_TAG_subpr
!49 = metadata !{i32 589865, metadata !"strncpy.c", metadata !"/home/zehranaz/klee-uclibc/libc/string", metadata !50} ; [ DW_TAG_file_type ]
!50 = metadata !{i32 589841, i32 0, i32 1, metadata !"strncpy.c", metadata !"/home/zehranaz/klee-uclibc/libc/string", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!51 = metadata !{i32 589845, metadata !49, metadata !"", metadata !49, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !52, i32 0, null} ; [ DW_TAG_subroutine_type ]
!52 = metadata !{metadata !53, metadata !53, metadata !55, metadata !57}
!53 = metadata !{i32 589839, metadata !49, metadata !"", metadata !49, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !54} ; [ DW_TAG_pointer_type ]
!54 = metadata !{i32 589860, metadata !49, metadata !"char", metadata !49, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!55 = metadata !{i32 589839, metadata !49, metadata !"", metadata !49, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !56} ; [ DW_TAG_pointer_type ]
!56 = metadata !{i32 589862, metadata !49, metadata !"", metadata !49, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !54} ; [ DW_TAG_const_type ]
!57 = metadata !{i32 589846, metadata !58, metadata !"size_t", metadata !58, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !59} ; [ DW_TAG_typedef ]
!58 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !50} ; [ DW_TAG_file_type ]
!59 = metadata !{i32 589860, metadata !49, metadata !"long unsigned int", metadata !49, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!60 = metadata !{i32 589870, i32 0, metadata !61, metadata !"__errno_location", metadata !"__errno_location", metadata !"__errno_location", metadata !61, i32 12, metadata !63, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32* ()* @__errno_lo
!61 = metadata !{i32 589865, metadata !"__errno_location.c", metadata !"/home/zehranaz/klee-uclibc/libc/misc/internals", metadata !62} ; [ DW_TAG_file_type ]
!62 = metadata !{i32 589841, i32 0, i32 1, metadata !"__errno_location.c", metadata !"/home/zehranaz/klee-uclibc/libc/misc/internals", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG
!63 = metadata !{i32 589845, metadata !61, metadata !"", metadata !61, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !64, i32 0, null} ; [ DW_TAG_subroutine_type ]
!64 = metadata !{metadata !65}
!65 = metadata !{i32 589839, metadata !61, metadata !"", metadata !61, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !66} ; [ DW_TAG_pointer_type ]
!66 = metadata !{i32 589860, metadata !61, metadata !"int", metadata !61, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!67 = metadata !{i32 589870, i32 0, metadata !68, metadata !"__h_errno_location", metadata !"__h_errno_location", metadata !"__h_errno_location", metadata !68, i32 11, metadata !70, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32* ()* @__h_
!68 = metadata !{i32 589865, metadata !"__h_errno_location.c", metadata !"/home/zehranaz/klee-uclibc/libc/misc/internals", metadata !69} ; [ DW_TAG_file_type ]
!69 = metadata !{i32 589841, i32 0, i32 1, metadata !"__h_errno_location.c", metadata !"/home/zehranaz/klee-uclibc/libc/misc/internals", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_T
!70 = metadata !{i32 589845, metadata !68, metadata !"", metadata !68, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !71, i32 0, null} ; [ DW_TAG_subroutine_type ]
!71 = metadata !{metadata !72}
!72 = metadata !{i32 589839, metadata !68, metadata !"", metadata !68, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !73} ; [ DW_TAG_pointer_type ]
!73 = metadata !{i32 589860, metadata !68, metadata !"int", metadata !68, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!74 = metadata !{i32 589870, i32 0, metadata !75, metadata !"_stdio_term", metadata !"_stdio_term", metadata !"_stdio_term", metadata !75, i32 211, metadata !77, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @_stdio_term} ; [ DW_TAG_
!75 = metadata !{i32 589865, metadata !"_stdio.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdio", metadata !76} ; [ DW_TAG_file_type ]
!76 = metadata !{i32 589841, i32 0, i32 1, metadata !"_stdio.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!77 = metadata !{i32 589845, metadata !75, metadata !"", metadata !75, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, null} ; [ DW_TAG_subroutine_type ]
!78 = metadata !{i32 589870, i32 0, metadata !75, metadata !"_stdio_init", metadata !"_stdio_init", metadata !"_stdio_init", metadata !75, i32 278, metadata !77, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @_stdio_init} ; [ DW_TAG_
!79 = metadata !{i32 589870, i32 0, metadata !80, metadata !"abort", metadata !"abort", metadata !"abort", metadata !80, i32 57, metadata !82, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @abort} ; [ DW_TAG_subprogram ]
!80 = metadata !{i32 589865, metadata !"abort.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdlib", metadata !81} ; [ DW_TAG_file_type ]
!81 = metadata !{i32 589841, i32 0, i32 1, metadata !"abort.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdlib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!82 = metadata !{i32 589845, metadata !80, metadata !"", metadata !80, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, null} ; [ DW_TAG_subroutine_type ]
!83 = metadata !{i32 589870, i32 0, metadata !84, metadata !"exit", metadata !"exit", metadata !"exit", metadata !86, i32 319, metadata !87, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32)* @exit} ; [ DW_TAG_subprogram ]
!84 = metadata !{i32 589865, metadata !"exit.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdlib", metadata !85} ; [ DW_TAG_file_type ]
!85 = metadata !{i32 589841, i32 0, i32 1, metadata !"exit.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdlib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!86 = metadata !{i32 589865, metadata !"_atexit.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdlib", metadata !85} ; [ DW_TAG_file_type ]
!87 = metadata !{i32 589845, metadata !84, metadata !"", metadata !84, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !88, i32 0, null} ; [ DW_TAG_subroutine_type ]
!88 = metadata !{null, metadata !89}
!89 = metadata !{i32 589860, metadata !84, metadata !"int", metadata !84, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!90 = metadata !{i32 589870, i32 0, metadata !91, metadata !"memcpy", metadata !"memcpy", metadata !"memcpy", metadata !91, i32 19, metadata !93, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i8*, i64)* @memcpy} ; [ DW_TAG_subprogra
!91 = metadata !{i32 589865, metadata !"memcpy.c", metadata !"/home/zehranaz/klee-uclibc/libc/string", metadata !92} ; [ DW_TAG_file_type ]
!92 = metadata !{i32 589841, i32 0, i32 1, metadata !"memcpy.c", metadata !"/home/zehranaz/klee-uclibc/libc/string", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!93 = metadata !{i32 589845, metadata !91, metadata !"", metadata !91, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !94, i32 0, null} ; [ DW_TAG_subroutine_type ]
!94 = metadata !{metadata !95, metadata !95, metadata !95, metadata !96}
!95 = metadata !{i32 589839, metadata !91, metadata !"", metadata !91, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!96 = metadata !{i32 589846, metadata !97, metadata !"size_t", metadata !97, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !98} ; [ DW_TAG_typedef ]
!97 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !92} ; [ DW_TAG_file_type ]
!98 = metadata !{i32 589860, metadata !91, metadata !"long unsigned int", metadata !91, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!99 = metadata !{i32 589870, i32 0, metadata !100, metadata !"memset", metadata !"memset", metadata !"memset", metadata !100, i32 18, metadata !102, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i32, i64)* @memset} ; [ DW_TAG_subpro
!100 = metadata !{i32 589865, metadata !"memset.c", metadata !"/home/zehranaz/klee-uclibc/libc/string", metadata !101} ; [ DW_TAG_file_type ]
!101 = metadata !{i32 589841, i32 0, i32 1, metadata !"memset.c", metadata !"/home/zehranaz/klee-uclibc/libc/string", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!102 = metadata !{i32 589845, metadata !100, metadata !"", metadata !100, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !103, i32 0, null} ; [ DW_TAG_subroutine_type ]
!103 = metadata !{metadata !104, metadata !104, metadata !105, metadata !106}
!104 = metadata !{i32 589839, metadata !100, metadata !"", metadata !100, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!105 = metadata !{i32 589860, metadata !100, metadata !"int", metadata !100, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!106 = metadata !{i32 589846, metadata !107, metadata !"size_t", metadata !107, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !108} ; [ DW_TAG_typedef ]
!107 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !101} ; [ DW_TAG_file_type ]
!108 = metadata !{i32 589860, metadata !100, metadata !"long unsigned int", metadata !100, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!109 = metadata !{i32 589870, i32 0, metadata !110, metadata !"__sigismember", metadata !"__sigismember", metadata !"__sigismember", metadata !112, i32 117, metadata !113, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.__sigset_t*
!110 = metadata !{i32 589865, metadata !"sigsetops.c", metadata !"/home/zehranaz/klee-uclibc/libc/signal", metadata !111} ; [ DW_TAG_file_type ]
!111 = metadata !{i32 589841, i32 0, i32 1, metadata !"sigsetops.c", metadata !"/home/zehranaz/klee-uclibc/libc/signal", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit 
!112 = metadata !{i32 589865, metadata !"sigset.h", metadata !"/home/zehranaz/klee-uclibc/./include/bits", metadata !111} ; [ DW_TAG_file_type ]
!113 = metadata !{i32 589845, metadata !110, metadata !"", metadata !110, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !114, i32 0, null} ; [ DW_TAG_subroutine_type ]
!114 = metadata !{metadata !115, metadata !116, metadata !115}
!115 = metadata !{i32 589860, metadata !110, metadata !"int", metadata !110, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!116 = metadata !{i32 589839, metadata !110, metadata !"", metadata !110, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !117} ; [ DW_TAG_pointer_type ]
!117 = metadata !{i32 589846, metadata !112, metadata !"__sigset_t", metadata !112, i32 31, i64 0, i64 0, i64 0, i32 0, metadata !118} ; [ DW_TAG_typedef ]
!118 = metadata !{i32 589843, metadata !110, metadata !"", metadata !112, i32 29, i64 1024, i64 64, i64 0, i32 0, null, metadata !119, i32 0, null} ; [ DW_TAG_structure_type ]
!119 = metadata !{metadata !120}
!120 = metadata !{i32 589837, metadata !118, metadata !"__val", metadata !112, i32 30, i64 1024, i64 64, i64 0, i32 0, metadata !121} ; [ DW_TAG_member ]
!121 = metadata !{i32 589825, metadata !110, metadata !"", metadata !110, i32 0, i64 1024, i64 64, i64 0, i32 0, metadata !122, metadata !123, i32 0, null} ; [ DW_TAG_array_type ]
!122 = metadata !{i32 589860, metadata !110, metadata !"long unsigned int", metadata !110, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!123 = metadata !{metadata !124}
!124 = metadata !{i32 589857, i64 0, i64 15}      ; [ DW_TAG_subrange_type ]
!125 = metadata !{i32 589870, i32 0, metadata !110, metadata !"__sigaddset", metadata !"__sigaddset", metadata !"__sigaddset", metadata !112, i32 118, metadata !113, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.__sigset_t*, i32)
!126 = metadata !{i32 589870, i32 0, metadata !110, metadata !"__sigdelset", metadata !"__sigdelset", metadata !"__sigdelset", metadata !112, i32 119, metadata !113, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.__sigset_t*, i32)
!127 = metadata !{i32 589870, i32 0, metadata !128, metadata !"__stdio_wcommit", metadata !"__stdio_wcommit", metadata !"__stdio_wcommit", metadata !128, i32 18, metadata !130, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (%struct.FILE*)
!128 = metadata !{i32 589865, metadata !"_wcommit.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdio", metadata !129} ; [ DW_TAG_file_type ]
!129 = metadata !{i32 589841, i32 0, i32 1, metadata !"_wcommit.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!130 = metadata !{i32 589845, metadata !128, metadata !"", metadata !128, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !131, i32 0, null} ; [ DW_TAG_subroutine_type ]
!131 = metadata !{metadata !132, metadata !135}
!132 = metadata !{i32 589846, metadata !133, metadata !"size_t", metadata !133, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !134} ; [ DW_TAG_typedef ]
!133 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !129} ; [ DW_TAG_file_type ]
!134 = metadata !{i32 589860, metadata !128, metadata !"long unsigned int", metadata !128, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!135 = metadata !{i32 589839, metadata !128, metadata !"", metadata !128, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !136} ; [ DW_TAG_pointer_type ]
!136 = metadata !{i32 589846, metadata !137, metadata !"FILE", metadata !137, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !138} ; [ DW_TAG_typedef ]
!137 = metadata !{i32 589865, metadata !"stdio.h", metadata !"/home/zehranaz/klee-uclibc/./include", metadata !129} ; [ DW_TAG_file_type ]
!138 = metadata !{i32 589843, metadata !128, metadata !"__STDIO_FILE_STRUCT", metadata !137, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !139, i32 0, null} ; [ DW_TAG_structure_type ]
!139 = metadata !{metadata !140, metadata !143, metadata !148, metadata !150, metadata !152, metadata !153, metadata !154, metadata !155, metadata !156, metadata !157, metadata !159, metadata !162}
!140 = metadata !{i32 589837, metadata !138, metadata !"__modeflags", metadata !141, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !142} ; [ DW_TAG_member ]
!141 = metadata !{i32 589865, metadata !"uClibc_stdio.h", metadata !"/home/zehranaz/klee-uclibc/./include/bits", metadata !129} ; [ DW_TAG_file_type ]
!142 = metadata !{i32 589860, metadata !128, metadata !"short unsigned int", metadata !128, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!143 = metadata !{i32 589837, metadata !138, metadata !"__ungot_width", metadata !141, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !144} ; [ DW_TAG_member ]
!144 = metadata !{i32 589825, metadata !128, metadata !"", metadata !128, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !145, metadata !146, i32 0, null} ; [ DW_TAG_array_type ]
!145 = metadata !{i32 589860, metadata !128, metadata !"unsigned char", metadata !128, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!146 = metadata !{metadata !147}
!147 = metadata !{i32 589857, i64 0, i64 1}       ; [ DW_TAG_subrange_type ]
!148 = metadata !{i32 589837, metadata !138, metadata !"__filedes", metadata !141, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !149} ; [ DW_TAG_member ]
!149 = metadata !{i32 589860, metadata !128, metadata !"int", metadata !128, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!150 = metadata !{i32 589837, metadata !138, metadata !"__bufstart", metadata !141, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !151} ; [ DW_TAG_member ]
!151 = metadata !{i32 589839, metadata !128, metadata !"", metadata !128, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !145} ; [ DW_TAG_pointer_type ]
!152 = metadata !{i32 589837, metadata !138, metadata !"__bufend", metadata !141, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !151} ; [ DW_TAG_member ]
!153 = metadata !{i32 589837, metadata !138, metadata !"__bufpos", metadata !141, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !151} ; [ DW_TAG_member ]
!154 = metadata !{i32 589837, metadata !138, metadata !"__bufread", metadata !141, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !151} ; [ DW_TAG_member ]
!155 = metadata !{i32 589837, metadata !138, metadata !"__bufgetc_u", metadata !141, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !151} ; [ DW_TAG_member ]
!156 = metadata !{i32 589837, metadata !138, metadata !"__bufputc_u", metadata !141, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !151} ; [ DW_TAG_member ]
!157 = metadata !{i32 589837, metadata !138, metadata !"__nextopen", metadata !141, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !158} ; [ DW_TAG_member ]
!158 = metadata !{i32 589839, metadata !128, metadata !"", metadata !128, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !138} ; [ DW_TAG_pointer_type ]
!159 = metadata !{i32 589837, metadata !138, metadata !"__ungot", metadata !141, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !160} ; [ DW_TAG_member ]
!160 = metadata !{i32 589825, metadata !128, metadata !"", metadata !128, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !161, metadata !146, i32 0, null} ; [ DW_TAG_array_type ]
!161 = metadata !{i32 589846, metadata !133, metadata !"wchar_t", metadata !133, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !149} ; [ DW_TAG_typedef ]
!162 = metadata !{i32 589837, metadata !138, metadata !"__state", metadata !141, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !163} ; [ DW_TAG_member ]
!163 = metadata !{i32 589846, metadata !164, metadata !"__mbstate_t", metadata !164, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !165} ; [ DW_TAG_typedef ]
!164 = metadata !{i32 589865, metadata !"wchar.h", metadata !"/home/zehranaz/klee-uclibc/./include", metadata !129} ; [ DW_TAG_file_type ]
!165 = metadata !{i32 589843, metadata !128, metadata !"", metadata !164, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !166, i32 0, null} ; [ DW_TAG_structure_type ]
!166 = metadata !{metadata !167, metadata !168}
!167 = metadata !{i32 589837, metadata !165, metadata !"__mask", metadata !164, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !161} ; [ DW_TAG_member ]
!168 = metadata !{i32 589837, metadata !165, metadata !"__wc", metadata !164, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !161} ; [ DW_TAG_member ]
!169 = metadata !{i32 589870, i32 0, metadata !170, metadata !"isatty", metadata !"isatty", metadata !"isatty", metadata !170, i32 27, metadata !172, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isatty} ; [ DW_TAG_subprogram ]
!170 = metadata !{i32 589865, metadata !"isatty.c", metadata !"/home/zehranaz/klee-uclibc/libc/termios", metadata !171} ; [ DW_TAG_file_type ]
!171 = metadata !{i32 589841, i32 0, i32 1, metadata !"isatty.c", metadata !"/home/zehranaz/klee-uclibc/libc/termios", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!172 = metadata !{i32 589845, metadata !170, metadata !"", metadata !170, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !173, i32 0, null} ; [ DW_TAG_subroutine_type ]
!173 = metadata !{metadata !174, metadata !174}
!174 = metadata !{i32 589860, metadata !170, metadata !"int", metadata !170, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!175 = metadata !{i32 589870, i32 0, metadata !176, metadata !"__raise", metadata !"__raise", metadata !"__raise", metadata !176, i32 16, metadata !178, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @__raise} ; [ DW_TAG_subprogram 
!176 = metadata !{i32 589865, metadata !"raise.c", metadata !"/home/zehranaz/klee-uclibc/libc/signal", metadata !177} ; [ DW_TAG_file_type ]
!177 = metadata !{i32 589841, i32 0, i32 1, metadata !"raise.c", metadata !"/home/zehranaz/klee-uclibc/libc/signal", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!178 = metadata !{i32 589845, metadata !176, metadata !"", metadata !176, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !179, i32 0, null} ; [ DW_TAG_subroutine_type ]
!179 = metadata !{metadata !180, metadata !180}
!180 = metadata !{i32 589860, metadata !176, metadata !"int", metadata !176, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!181 = metadata !{i32 589870, i32 0, metadata !182, metadata !"__libc_sigaction", metadata !"__libc_sigaction", metadata !"__libc_sigaction", metadata !182, i32 43, metadata !184, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, %struc
!182 = metadata !{i32 589865, metadata !"sigaction.c", metadata !"/home/zehranaz/klee-uclibc/libc/signal", metadata !183} ; [ DW_TAG_file_type ]
!183 = metadata !{i32 589841, i32 0, i32 1, metadata !"sigaction.c", metadata !"/home/zehranaz/klee-uclibc/libc/signal", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit 
!184 = metadata !{i32 589845, metadata !182, metadata !"", metadata !182, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !185, i32 0, null} ; [ DW_TAG_subroutine_type ]
!185 = metadata !{metadata !186, metadata !186, metadata !187, metadata !278}
!186 = metadata !{i32 589860, metadata !182, metadata !"int", metadata !182, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!187 = metadata !{i32 589839, metadata !182, metadata !"", metadata !182, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !188} ; [ DW_TAG_pointer_type ]
!188 = metadata !{i32 589862, metadata !182, metadata !"", metadata !182, i32 0, i64 1216, i64 64, i64 0, i32 0, metadata !189} ; [ DW_TAG_const_type ]
!189 = metadata !{i32 589843, metadata !182, metadata !"sigaction", metadata !190, i32 26, i64 1216, i64 64, i64 0, i32 0, null, metadata !191, i32 0, null} ; [ DW_TAG_structure_type ]
!190 = metadata !{i32 589865, metadata !"sigaction.h", metadata !"/home/zehranaz/klee-uclibc/./include/bits", metadata !183} ; [ DW_TAG_file_type ]
!191 = metadata !{metadata !192, metadata !266, metadata !274, metadata !275}
!192 = metadata !{i32 589837, metadata !189, metadata !"__sigaction_handler", metadata !190, i32 36, i64 64, i64 64, i64 0, i32 0, metadata !193} ; [ DW_TAG_member ]
!193 = metadata !{i32 589847, metadata !182, metadata !"", metadata !190, i32 30, i64 64, i64 64, i64 0, i32 0, null, metadata !194, i32 0, null} ; [ DW_TAG_union_type ]
!194 = metadata !{metadata !195, metadata !201}
!195 = metadata !{i32 589837, metadata !193, metadata !"sa_handler", metadata !190, i32 32, i64 64, i64 64, i64 0, i32 0, metadata !196} ; [ DW_TAG_member ]
!196 = metadata !{i32 589846, metadata !197, metadata !"__sighandler_t", metadata !197, i32 75, i64 0, i64 0, i64 0, i32 0, metadata !198} ; [ DW_TAG_typedef ]
!197 = metadata !{i32 589865, metadata !"signal.h", metadata !"/home/zehranaz/klee-uclibc/./include", metadata !183} ; [ DW_TAG_file_type ]
!198 = metadata !{i32 589839, metadata !182, metadata !"", metadata !182, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !199} ; [ DW_TAG_pointer_type ]
!199 = metadata !{i32 589845, metadata !182, metadata !"", metadata !182, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !200, i32 0, null} ; [ DW_TAG_subroutine_type ]
!200 = metadata !{null, metadata !186}
!201 = metadata !{i32 589837, metadata !193, metadata !"sa_sigaction", metadata !190, i32 34, i64 64, i64 64, i64 0, i32 0, metadata !202} ; [ DW_TAG_member ]
!202 = metadata !{i32 589839, metadata !182, metadata !"", metadata !182, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !203} ; [ DW_TAG_pointer_type ]
!203 = metadata !{i32 589845, metadata !182, metadata !"", metadata !182, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !204, i32 0, null} ; [ DW_TAG_subroutine_type ]
!204 = metadata !{null, metadata !186, metadata !205, metadata !240}
!205 = metadata !{i32 589839, metadata !182, metadata !"", metadata !182, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !206} ; [ DW_TAG_pointer_type ]
!206 = metadata !{i32 589846, metadata !207, metadata !"siginfo_t", metadata !207, i32 108, i64 0, i64 0, i64 0, i32 0, metadata !208} ; [ DW_TAG_typedef ]
!207 = metadata !{i32 589865, metadata !"siginfo.h", metadata !"/home/zehranaz/klee-uclibc/./include/bits", metadata !183} ; [ DW_TAG_file_type ]
!208 = metadata !{i32 589843, metadata !182, metadata !"siginfo", metadata !207, i32 52, i64 1024, i64 64, i64 0, i32 0, null, metadata !209, i32 0, null} ; [ DW_TAG_structure_type ]
!209 = metadata !{metadata !210, metadata !211, metadata !212, metadata !213}
!210 = metadata !{i32 589837, metadata !208, metadata !"si_signo", metadata !207, i32 53, i64 32, i64 32, i64 0, i32 0, metadata !186} ; [ DW_TAG_member ]
!211 = metadata !{i32 589837, metadata !208, metadata !"si_errno", metadata !207, i32 54, i64 32, i64 32, i64 32, i32 0, metadata !186} ; [ DW_TAG_member ]
!212 = metadata !{i32 589837, metadata !208, metadata !"si_code", metadata !207, i32 56, i64 32, i64 32, i64 64, i32 0, metadata !186} ; [ DW_TAG_member ]
!213 = metadata !{i32 589837, metadata !208, metadata !"_sifields", metadata !207, i32 107, i64 896, i64 64, i64 128, i32 0, metadata !214} ; [ DW_TAG_member ]
!214 = metadata !{i32 589847, metadata !182, metadata !"", metadata !207, i32 59, i64 896, i64 64, i64 0, i32 0, null, metadata !215, i32 0, null} ; [ DW_TAG_union_type ]
!215 = metadata !{metadata !216, metadata !220, metadata !229, metadata !241, metadata !247, metadata !257, metadata !261}
!216 = metadata !{i32 589837, metadata !214, metadata !"_pad", metadata !207, i32 60, i64 896, i64 32, i64 0, i32 0, metadata !217} ; [ DW_TAG_member ]
!217 = metadata !{i32 589825, metadata !182, metadata !"", metadata !182, i32 0, i64 896, i64 32, i64 0, i32 0, metadata !186, metadata !218, i32 0, null} ; [ DW_TAG_array_type ]
!218 = metadata !{metadata !219}
!219 = metadata !{i32 589857, i64 0, i64 27}      ; [ DW_TAG_subrange_type ]
!220 = metadata !{i32 589837, metadata !214, metadata !"_kill", metadata !207, i32 67, i64 64, i64 32, i64 0, i32 0, metadata !221} ; [ DW_TAG_member ]
!221 = metadata !{i32 589843, metadata !182, metadata !"", metadata !207, i32 64, i64 64, i64 32, i64 0, i32 0, null, metadata !222, i32 0, null} ; [ DW_TAG_structure_type ]
!222 = metadata !{metadata !223, metadata !226}
!223 = metadata !{i32 589837, metadata !221, metadata !"si_pid", metadata !207, i32 65, i64 32, i64 32, i64 0, i32 0, metadata !224} ; [ DW_TAG_member ]
!224 = metadata !{i32 589846, metadata !225, metadata !"__pid_t", metadata !225, i32 147, i64 0, i64 0, i64 0, i32 0, metadata !186} ; [ DW_TAG_typedef ]
!225 = metadata !{i32 589865, metadata !"types.h", metadata !"/home/zehranaz/klee-uclibc/./include/bits", metadata !183} ; [ DW_TAG_file_type ]
!226 = metadata !{i32 589837, metadata !221, metadata !"si_uid", metadata !207, i32 66, i64 32, i64 32, i64 32, i32 0, metadata !227} ; [ DW_TAG_member ]
!227 = metadata !{i32 589846, metadata !225, metadata !"__uid_t", metadata !225, i32 139, i64 0, i64 0, i64 0, i32 0, metadata !228} ; [ DW_TAG_typedef ]
!228 = metadata !{i32 589860, metadata !182, metadata !"unsigned int", metadata !182, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!229 = metadata !{i32 589837, metadata !214, metadata !"_timer", metadata !207, i32 75, i64 128, i64 64, i64 0, i32 0, metadata !230} ; [ DW_TAG_member ]
!230 = metadata !{i32 589843, metadata !182, metadata !"", metadata !207, i32 71, i64 128, i64 64, i64 0, i32 0, null, metadata !231, i32 0, null} ; [ DW_TAG_structure_type ]
!231 = metadata !{metadata !232, metadata !233, metadata !234}
!232 = metadata !{i32 589837, metadata !230, metadata !"si_tid", metadata !207, i32 72, i64 32, i64 32, i64 0, i32 0, metadata !186} ; [ DW_TAG_member ]
!233 = metadata !{i32 589837, metadata !230, metadata !"si_overrun", metadata !207, i32 73, i64 32, i64 32, i64 32, i32 0, metadata !186} ; [ DW_TAG_member ]
!234 = metadata !{i32 589837, metadata !230, metadata !"si_sigval", metadata !207, i32 74, i64 64, i64 64, i64 64, i32 0, metadata !235} ; [ DW_TAG_member ]
!235 = metadata !{i32 589846, metadata !207, metadata !"sigval_t", metadata !207, i32 37, i64 0, i64 0, i64 0, i32 0, metadata !236} ; [ DW_TAG_typedef ]
!236 = metadata !{i32 589847, metadata !182, metadata !"sigval", metadata !207, i32 34, i64 64, i64 64, i64 0, i32 0, null, metadata !237, i32 0, null} ; [ DW_TAG_union_type ]
!237 = metadata !{metadata !238, metadata !239}
!238 = metadata !{i32 589837, metadata !236, metadata !"sival_int", metadata !207, i32 35, i64 32, i64 32, i64 0, i32 0, metadata !186} ; [ DW_TAG_member ]
!239 = metadata !{i32 589837, metadata !236, metadata !"sival_ptr", metadata !207, i32 36, i64 64, i64 64, i64 0, i32 0, metadata !240} ; [ DW_TAG_member ]
!240 = metadata !{i32 589839, metadata !182, metadata !"", metadata !182, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!241 = metadata !{i32 589837, metadata !214, metadata !"_rt", metadata !207, i32 83, i64 128, i64 64, i64 0, i32 0, metadata !242} ; [ DW_TAG_member ]
!242 = metadata !{i32 589843, metadata !182, metadata !"", metadata !207, i32 79, i64 128, i64 64, i64 0, i32 0, null, metadata !243, i32 0, null} ; [ DW_TAG_structure_type ]
!243 = metadata !{metadata !244, metadata !245, metadata !246}
!244 = metadata !{i32 589837, metadata !242, metadata !"si_pid", metadata !207, i32 80, i64 32, i64 32, i64 0, i32 0, metadata !224} ; [ DW_TAG_member ]
!245 = metadata !{i32 589837, metadata !242, metadata !"si_uid", metadata !207, i32 81, i64 32, i64 32, i64 32, i32 0, metadata !227} ; [ DW_TAG_member ]
!246 = metadata !{i32 589837, metadata !242, metadata !"si_sigval", metadata !207, i32 82, i64 64, i64 64, i64 64, i32 0, metadata !235} ; [ DW_TAG_member ]
!247 = metadata !{i32 589837, metadata !214, metadata !"_sigchld", metadata !207, i32 93, i64 256, i64 64, i64 0, i32 0, metadata !248} ; [ DW_TAG_member ]
!248 = metadata !{i32 589843, metadata !182, metadata !"", metadata !207, i32 87, i64 256, i64 64, i64 0, i32 0, null, metadata !249, i32 0, null} ; [ DW_TAG_structure_type ]
!249 = metadata !{metadata !250, metadata !251, metadata !252, metadata !253, metadata !256}
!250 = metadata !{i32 589837, metadata !248, metadata !"si_pid", metadata !207, i32 88, i64 32, i64 32, i64 0, i32 0, metadata !224} ; [ DW_TAG_member ]
!251 = metadata !{i32 589837, metadata !248, metadata !"si_uid", metadata !207, i32 89, i64 32, i64 32, i64 32, i32 0, metadata !227} ; [ DW_TAG_member ]
!252 = metadata !{i32 589837, metadata !248, metadata !"si_status", metadata !207, i32 90, i64 32, i64 32, i64 64, i32 0, metadata !186} ; [ DW_TAG_member ]
!253 = metadata !{i32 589837, metadata !248, metadata !"si_utime", metadata !207, i32 91, i64 64, i64 64, i64 128, i32 0, metadata !254} ; [ DW_TAG_member ]
!254 = metadata !{i32 589846, metadata !225, metadata !"__clock_t", metadata !225, i32 149, i64 0, i64 0, i64 0, i32 0, metadata !255} ; [ DW_TAG_typedef ]
!255 = metadata !{i32 589860, metadata !182, metadata !"long int", metadata !182, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!256 = metadata !{i32 589837, metadata !248, metadata !"si_stime", metadata !207, i32 92, i64 64, i64 64, i64 192, i32 0, metadata !254} ; [ DW_TAG_member ]
!257 = metadata !{i32 589837, metadata !214, metadata !"_sigfault", metadata !207, i32 99, i64 64, i64 64, i64 0, i32 0, metadata !258} ; [ DW_TAG_member ]
!258 = metadata !{i32 589843, metadata !182, metadata !"", metadata !207, i32 97, i64 64, i64 64, i64 0, i32 0, null, metadata !259, i32 0, null} ; [ DW_TAG_structure_type ]
!259 = metadata !{metadata !260}
!260 = metadata !{i32 589837, metadata !258, metadata !"si_addr", metadata !207, i32 98, i64 64, i64 64, i64 0, i32 0, metadata !240} ; [ DW_TAG_member ]
!261 = metadata !{i32 589837, metadata !214, metadata !"_sigpoll", metadata !207, i32 106, i64 128, i64 64, i64 0, i32 0, metadata !262} ; [ DW_TAG_member ]
!262 = metadata !{i32 589843, metadata !182, metadata !"", metadata !207, i32 103, i64 128, i64 64, i64 0, i32 0, null, metadata !263, i32 0, null} ; [ DW_TAG_structure_type ]
!263 = metadata !{metadata !264, metadata !265}
!264 = metadata !{i32 589837, metadata !262, metadata !"si_band", metadata !207, i32 104, i64 64, i64 64, i64 0, i32 0, metadata !255} ; [ DW_TAG_member ]
!265 = metadata !{i32 589837, metadata !262, metadata !"si_fd", metadata !207, i32 105, i64 32, i64 32, i64 64, i32 0, metadata !186} ; [ DW_TAG_member ]
!266 = metadata !{i32 589837, metadata !189, metadata !"sa_mask", metadata !190, i32 44, i64 1024, i64 64, i64 64, i32 0, metadata !267} ; [ DW_TAG_member ]
!267 = metadata !{i32 589846, metadata !268, metadata !"__sigset_t", metadata !268, i32 31, i64 0, i64 0, i64 0, i32 0, metadata !269} ; [ DW_TAG_typedef ]
!268 = metadata !{i32 589865, metadata !"sigset.h", metadata !"/home/zehranaz/klee-uclibc/./include/bits", metadata !183} ; [ DW_TAG_file_type ]
!269 = metadata !{i32 589843, metadata !182, metadata !"", metadata !268, i32 29, i64 1024, i64 64, i64 0, i32 0, null, metadata !270, i32 0, null} ; [ DW_TAG_structure_type ]
!270 = metadata !{metadata !271}
!271 = metadata !{i32 589837, metadata !269, metadata !"__val", metadata !268, i32 30, i64 1024, i64 64, i64 0, i32 0, metadata !272} ; [ DW_TAG_member ]
!272 = metadata !{i32 589825, metadata !182, metadata !"", metadata !182, i32 0, i64 1024, i64 64, i64 0, i32 0, metadata !273, metadata !123, i32 0, null} ; [ DW_TAG_array_type ]
!273 = metadata !{i32 589860, metadata !182, metadata !"long unsigned int", metadata !182, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!274 = metadata !{i32 589837, metadata !189, metadata !"sa_flags", metadata !190, i32 47, i64 32, i64 32, i64 1088, i32 0, metadata !186} ; [ DW_TAG_member ]
!275 = metadata !{i32 589837, metadata !189, metadata !"sa_restorer", metadata !190, i32 50, i64 64, i64 64, i64 1152, i32 0, metadata !276} ; [ DW_TAG_member ]
!276 = metadata !{i32 589839, metadata !182, metadata !"", metadata !182, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !277} ; [ DW_TAG_pointer_type ]
!277 = metadata !{i32 589845, metadata !182, metadata !"", metadata !182, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, null} ; [ DW_TAG_subroutine_type ]
!278 = metadata !{i32 589839, metadata !182, metadata !"", metadata !182, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !189} ; [ DW_TAG_pointer_type ]
!279 = metadata !{i32 589870, i32 0, metadata !280, metadata !"__stdio_WRITE", metadata !"__stdio_WRITE", metadata !"__stdio_WRITE", metadata !280, i32 35, metadata !282, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (%struct.FILE*, i8*, 
!280 = metadata !{i32 589865, metadata !"_WRITE.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdio", metadata !281} ; [ DW_TAG_file_type ]
!281 = metadata !{i32 589841, i32 0, i32 1, metadata !"_WRITE.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!282 = metadata !{i32 589845, metadata !280, metadata !"", metadata !280, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !283, i32 0, null} ; [ DW_TAG_subroutine_type ]
!283 = metadata !{metadata !284, metadata !287, metadata !319, metadata !284}
!284 = metadata !{i32 589846, metadata !285, metadata !"size_t", metadata !285, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !286} ; [ DW_TAG_typedef ]
!285 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !281} ; [ DW_TAG_file_type ]
!286 = metadata !{i32 589860, metadata !280, metadata !"long unsigned int", metadata !280, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!287 = metadata !{i32 589839, metadata !280, metadata !"", metadata !280, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !288} ; [ DW_TAG_pointer_type ]
!288 = metadata !{i32 589846, metadata !289, metadata !"FILE", metadata !289, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !290} ; [ DW_TAG_typedef ]
!289 = metadata !{i32 589865, metadata !"stdio.h", metadata !"/home/zehranaz/klee-uclibc/./include", metadata !281} ; [ DW_TAG_file_type ]
!290 = metadata !{i32 589843, metadata !280, metadata !"__STDIO_FILE_STRUCT", metadata !289, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !291, i32 0, null} ; [ DW_TAG_structure_type ]
!291 = metadata !{metadata !292, metadata !295, metadata !298, metadata !300, metadata !302, metadata !303, metadata !304, metadata !305, metadata !306, metadata !307, metadata !309, metadata !312}
!292 = metadata !{i32 589837, metadata !290, metadata !"__modeflags", metadata !293, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !294} ; [ DW_TAG_member ]
!293 = metadata !{i32 589865, metadata !"uClibc_stdio.h", metadata !"/home/zehranaz/klee-uclibc/./include/bits", metadata !281} ; [ DW_TAG_file_type ]
!294 = metadata !{i32 589860, metadata !280, metadata !"short unsigned int", metadata !280, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!295 = metadata !{i32 589837, metadata !290, metadata !"__ungot_width", metadata !293, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !296} ; [ DW_TAG_member ]
!296 = metadata !{i32 589825, metadata !280, metadata !"", metadata !280, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !297, metadata !146, i32 0, null} ; [ DW_TAG_array_type ]
!297 = metadata !{i32 589860, metadata !280, metadata !"unsigned char", metadata !280, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!298 = metadata !{i32 589837, metadata !290, metadata !"__filedes", metadata !293, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !299} ; [ DW_TAG_member ]
!299 = metadata !{i32 589860, metadata !280, metadata !"int", metadata !280, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!300 = metadata !{i32 589837, metadata !290, metadata !"__bufstart", metadata !293, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !301} ; [ DW_TAG_member ]
!301 = metadata !{i32 589839, metadata !280, metadata !"", metadata !280, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !297} ; [ DW_TAG_pointer_type ]
!302 = metadata !{i32 589837, metadata !290, metadata !"__bufend", metadata !293, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !301} ; [ DW_TAG_member ]
!303 = metadata !{i32 589837, metadata !290, metadata !"__bufpos", metadata !293, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !301} ; [ DW_TAG_member ]
!304 = metadata !{i32 589837, metadata !290, metadata !"__bufread", metadata !293, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !301} ; [ DW_TAG_member ]
!305 = metadata !{i32 589837, metadata !290, metadata !"__bufgetc_u", metadata !293, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !301} ; [ DW_TAG_member ]
!306 = metadata !{i32 589837, metadata !290, metadata !"__bufputc_u", metadata !293, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !301} ; [ DW_TAG_member ]
!307 = metadata !{i32 589837, metadata !290, metadata !"__nextopen", metadata !293, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !308} ; [ DW_TAG_member ]
!308 = metadata !{i32 589839, metadata !280, metadata !"", metadata !280, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !290} ; [ DW_TAG_pointer_type ]
!309 = metadata !{i32 589837, metadata !290, metadata !"__ungot", metadata !293, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !310} ; [ DW_TAG_member ]
!310 = metadata !{i32 589825, metadata !280, metadata !"", metadata !280, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !311, metadata !146, i32 0, null} ; [ DW_TAG_array_type ]
!311 = metadata !{i32 589846, metadata !285, metadata !"wchar_t", metadata !285, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !299} ; [ DW_TAG_typedef ]
!312 = metadata !{i32 589837, metadata !290, metadata !"__state", metadata !293, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !313} ; [ DW_TAG_member ]
!313 = metadata !{i32 589846, metadata !314, metadata !"__mbstate_t", metadata !314, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !315} ; [ DW_TAG_typedef ]
!314 = metadata !{i32 589865, metadata !"wchar.h", metadata !"/home/zehranaz/klee-uclibc/./include", metadata !281} ; [ DW_TAG_file_type ]
!315 = metadata !{i32 589843, metadata !280, metadata !"", metadata !314, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !316, i32 0, null} ; [ DW_TAG_structure_type ]
!316 = metadata !{metadata !317, metadata !318}
!317 = metadata !{i32 589837, metadata !315, metadata !"__mask", metadata !314, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !311} ; [ DW_TAG_member ]
!318 = metadata !{i32 589837, metadata !315, metadata !"__wc", metadata !314, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !311} ; [ DW_TAG_member ]
!319 = metadata !{i32 589839, metadata !280, metadata !"", metadata !280, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !320} ; [ DW_TAG_pointer_type ]
!320 = metadata !{i32 589862, metadata !280, metadata !"", metadata !280, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !297} ; [ DW_TAG_const_type ]
!321 = metadata !{i32 589870, i32 0, metadata !322, metadata !"tcgetattr", metadata !"tcgetattr", metadata !"tcgetattr", metadata !322, i32 39, metadata !324, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, %struct.termios*)* @tcgetat
!322 = metadata !{i32 589865, metadata !"tcgetattr.c", metadata !"/home/zehranaz/klee-uclibc/libc/termios", metadata !323} ; [ DW_TAG_file_type ]
!323 = metadata !{i32 589841, i32 0, i32 1, metadata !"tcgetattr.c", metadata !"/home/zehranaz/klee-uclibc/libc/termios", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit
!324 = metadata !{i32 589845, metadata !322, metadata !"", metadata !322, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !325, i32 0, null} ; [ DW_TAG_subroutine_type ]
!325 = metadata !{metadata !326, metadata !326, metadata !327}
!326 = metadata !{i32 589860, metadata !322, metadata !"int", metadata !322, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!327 = metadata !{i32 589839, metadata !322, metadata !"", metadata !322, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !328} ; [ DW_TAG_pointer_type ]
!328 = metadata !{i32 589843, metadata !322, metadata !"termios", metadata !329, i32 31, i64 480, i64 32, i64 0, i32 0, null, metadata !330, i32 0, null} ; [ DW_TAG_structure_type ]
!329 = metadata !{i32 589865, metadata !"termios.h", metadata !"/home/zehranaz/klee-uclibc/./include/bits", metadata !323} ; [ DW_TAG_file_type ]
!330 = metadata !{metadata !331, metadata !334, metadata !335, metadata !336, metadata !337, metadata !340, metadata !344, metadata !346}
!331 = metadata !{i32 589837, metadata !328, metadata !"c_iflag", metadata !329, i32 32, i64 32, i64 32, i64 0, i32 0, metadata !332} ; [ DW_TAG_member ]
!332 = metadata !{i32 589846, metadata !329, metadata !"tcflag_t", metadata !329, i32 27, i64 0, i64 0, i64 0, i32 0, metadata !333} ; [ DW_TAG_typedef ]
!333 = metadata !{i32 589860, metadata !322, metadata !"unsigned int", metadata !322, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!334 = metadata !{i32 589837, metadata !328, metadata !"c_oflag", metadata !329, i32 33, i64 32, i64 32, i64 32, i32 0, metadata !332} ; [ DW_TAG_member ]
!335 = metadata !{i32 589837, metadata !328, metadata !"c_cflag", metadata !329, i32 34, i64 32, i64 32, i64 64, i32 0, metadata !332} ; [ DW_TAG_member ]
!336 = metadata !{i32 589837, metadata !328, metadata !"c_lflag", metadata !329, i32 35, i64 32, i64 32, i64 96, i32 0, metadata !332} ; [ DW_TAG_member ]
!337 = metadata !{i32 589837, metadata !328, metadata !"c_line", metadata !329, i32 36, i64 8, i64 8, i64 128, i32 0, metadata !338} ; [ DW_TAG_member ]
!338 = metadata !{i32 589846, metadata !329, metadata !"cc_t", metadata !329, i32 25, i64 0, i64 0, i64 0, i32 0, metadata !339} ; [ DW_TAG_typedef ]
!339 = metadata !{i32 589860, metadata !322, metadata !"unsigned char", metadata !322, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!340 = metadata !{i32 589837, metadata !328, metadata !"c_cc", metadata !329, i32 37, i64 256, i64 8, i64 136, i32 0, metadata !341} ; [ DW_TAG_member ]
!341 = metadata !{i32 589825, metadata !322, metadata !"", metadata !322, i32 0, i64 256, i64 8, i64 0, i32 0, metadata !338, metadata !342, i32 0, null} ; [ DW_TAG_array_type ]
!342 = metadata !{metadata !343}
!343 = metadata !{i32 589857, i64 0, i64 31}      ; [ DW_TAG_subrange_type ]
!344 = metadata !{i32 589837, metadata !328, metadata !"c_ispeed", metadata !329, i32 38, i64 32, i64 32, i64 416, i32 0, metadata !345} ; [ DW_TAG_member ]
!345 = metadata !{i32 589846, metadata !329, metadata !"speed_t", metadata !329, i32 26, i64 0, i64 0, i64 0, i32 0, metadata !333} ; [ DW_TAG_typedef ]
!346 = metadata !{i32 589837, metadata !328, metadata !"c_ospeed", metadata !329, i32 39, i64 32, i64 32, i64 448, i32 0, metadata !345} ; [ DW_TAG_member ]
!347 = metadata !{i32 589870, i32 0, metadata !348, metadata !"mempcpy", metadata !"mempcpy", metadata !"mempcpy", metadata !348, i32 21, metadata !350, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i8*, i64)* @mempcpy} ; [ DW_TAG_s
!348 = metadata !{i32 589865, metadata !"mempcpy.c", metadata !"/home/zehranaz/klee-uclibc/libc/string", metadata !349} ; [ DW_TAG_file_type ]
!349 = metadata !{i32 589841, i32 0, i32 1, metadata !"mempcpy.c", metadata !"/home/zehranaz/klee-uclibc/libc/string", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!350 = metadata !{i32 589845, metadata !348, metadata !"", metadata !348, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !351, i32 0, null} ; [ DW_TAG_subroutine_type ]
!351 = metadata !{metadata !352, metadata !352, metadata !352, metadata !353}
!352 = metadata !{i32 589839, metadata !348, metadata !"", metadata !348, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!353 = metadata !{i32 589846, metadata !354, metadata !"size_t", metadata !354, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !355} ; [ DW_TAG_typedef ]
!354 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !349} ; [ DW_TAG_file_type ]
!355 = metadata !{i32 589860, metadata !348, metadata !"long unsigned int", metadata !348, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!356 = metadata !{i32 589870, i32 0, metadata !357, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !357, i32 12, metadata !359, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i6
!357 = metadata !{i32 589865, metadata !"klee_div_zero_check.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !358} ; [ DW_TAG_file_type ]
!358 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_div_zero_check.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_comp
!359 = metadata !{i32 589845, metadata !357, metadata !"", metadata !357, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !360, i32 0, null} ; [ DW_TAG_subroutine_type ]
!360 = metadata !{null, metadata !361}
!361 = metadata !{i32 589860, metadata !357, metadata !"long long int", metadata !357, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!362 = metadata !{i32 589870, i32 0, metadata !363, metadata !"klee_int", metadata !"klee_int", metadata !"klee_int", metadata !363, i32 13, metadata !365, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int} ; [ DW_TAG_subprogr
!363 = metadata !{i32 589865, metadata !"klee_int.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !364} ; [ DW_TAG_file_type ]
!364 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_int.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!365 = metadata !{i32 589845, metadata !363, metadata !"", metadata !363, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !366, i32 0, null} ; [ DW_TAG_subroutine_type ]
!366 = metadata !{metadata !367, metadata !368}
!367 = metadata !{i32 589860, metadata !363, metadata !"int", metadata !363, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!368 = metadata !{i32 589839, metadata !363, metadata !"", metadata !363, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !369} ; [ DW_TAG_pointer_type ]
!369 = metadata !{i32 589862, metadata !363, metadata !"", metadata !363, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !370} ; [ DW_TAG_const_type ]
!370 = metadata !{i32 589860, metadata !363, metadata !"char", metadata !363, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!371 = metadata !{i32 589870, i32 0, metadata !372, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !372, i32 20, metadata !374, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void 
!372 = metadata !{i32 589865, metadata !"klee_overshift_check.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !373} ; [ DW_TAG_file_type ]
!373 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_overshift_check.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_com
!374 = metadata !{i32 589845, metadata !372, metadata !"", metadata !372, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !375, i32 0, null} ; [ DW_TAG_subroutine_type ]
!375 = metadata !{null, metadata !376, metadata !376}
!376 = metadata !{i32 589860, metadata !372, metadata !"long long unsigned int", metadata !372, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!377 = metadata !{i32 589870, i32 0, metadata !378, metadata !"klee_range", metadata !"klee_range", metadata !"klee_range", metadata !378, i32 13, metadata !380, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range} ;
!378 = metadata !{i32 589865, metadata !"klee_range.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !379} ; [ DW_TAG_file_type ]
!379 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_range.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit 
!380 = metadata !{i32 589845, metadata !378, metadata !"", metadata !378, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !381, i32 0, null} ; [ DW_TAG_subroutine_type ]
!381 = metadata !{metadata !382, metadata !382, metadata !382, metadata !383}
!382 = metadata !{i32 589860, metadata !378, metadata !"int", metadata !378, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!383 = metadata !{i32 589839, metadata !378, metadata !"", metadata !378, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !384} ; [ DW_TAG_pointer_type ]
!384 = metadata !{i32 589862, metadata !378, metadata !"", metadata !378, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !385} ; [ DW_TAG_const_type ]
!385 = metadata !{i32 589860, metadata !378, metadata !"char", metadata !378, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!386 = metadata !{i32 589870, i32 0, metadata !387, metadata !"memcpy", metadata !"memcpy", metadata !"memcpy", metadata !387, i32 12, metadata !389, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy} ; [ DW_TAG_subpro
!387 = metadata !{i32 589865, metadata !"memcpy.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !388} ; [ DW_TAG_file_type ]
!388 = metadata !{i32 589841, i32 0, i32 1, metadata !"memcpy.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!389 = metadata !{i32 589845, metadata !387, metadata !"", metadata !387, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !390, i32 0, null} ; [ DW_TAG_subroutine_type ]
!390 = metadata !{metadata !391, metadata !391, metadata !391, metadata !392}
!391 = metadata !{i32 589839, metadata !387, metadata !"", metadata !387, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!392 = metadata !{i32 589846, metadata !393, metadata !"size_t", metadata !393, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !394} ; [ DW_TAG_typedef ]
!393 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !388} ; [ DW_TAG_file_type ]
!394 = metadata !{i32 589860, metadata !387, metadata !"long unsigned int", metadata !387, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!395 = metadata !{i32 589870, i32 0, metadata !396, metadata !"memmove", metadata !"memmove", metadata !"memmove", metadata !396, i32 12, metadata !398, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!396 = metadata !{i32 589865, metadata !"memmove.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !397} ; [ DW_TAG_file_type ]
!397 = metadata !{i32 589841, i32 0, i32 1, metadata !"memmove.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!398 = metadata !{i32 589845, metadata !396, metadata !"", metadata !396, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !399, i32 0, null} ; [ DW_TAG_subroutine_type ]
!399 = metadata !{metadata !400, metadata !400, metadata !400, metadata !401}
!400 = metadata !{i32 589839, metadata !396, metadata !"", metadata !396, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!401 = metadata !{i32 589846, metadata !402, metadata !"size_t", metadata !402, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !403} ; [ DW_TAG_typedef ]
!402 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !397} ; [ DW_TAG_file_type ]
!403 = metadata !{i32 589860, metadata !396, metadata !"long unsigned int", metadata !396, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!404 = metadata !{i32 589870, i32 0, metadata !405, metadata !"mempcpy", metadata !"mempcpy", metadata !"mempcpy", metadata !405, i32 11, metadata !407, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy} ; [ DW_TAG_su
!405 = metadata !{i32 589865, metadata !"mempcpy.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !406} ; [ DW_TAG_file_type ]
!406 = metadata !{i32 589841, i32 0, i32 1, metadata !"mempcpy.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!407 = metadata !{i32 589845, metadata !405, metadata !"", metadata !405, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !408, i32 0, null} ; [ DW_TAG_subroutine_type ]
!408 = metadata !{metadata !409, metadata !409, metadata !409, metadata !410}
!409 = metadata !{i32 589839, metadata !405, metadata !"", metadata !405, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!410 = metadata !{i32 589846, metadata !411, metadata !"size_t", metadata !411, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !412} ; [ DW_TAG_typedef ]
!411 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !406} ; [ DW_TAG_file_type ]
!412 = metadata !{i32 589860, metadata !405, metadata !"long unsigned int", metadata !405, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!413 = metadata !{i32 589870, i32 0, metadata !414, metadata !"memset", metadata !"memset", metadata !"memset", metadata !414, i32 11, metadata !416, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset} ; [ DW_TAG_subpro
!414 = metadata !{i32 589865, metadata !"memset.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !415} ; [ DW_TAG_file_type ]
!415 = metadata !{i32 589841, i32 0, i32 1, metadata !"memset.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!416 = metadata !{i32 589845, metadata !414, metadata !"", metadata !414, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !417, i32 0, null} ; [ DW_TAG_subroutine_type ]
!417 = metadata !{metadata !418, metadata !418, metadata !419, metadata !420}
!418 = metadata !{i32 589839, metadata !414, metadata !"", metadata !414, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!419 = metadata !{i32 589860, metadata !414, metadata !"int", metadata !414, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!420 = metadata !{i32 589846, metadata !421, metadata !"size_t", metadata !421, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !422} ; [ DW_TAG_typedef ]
!421 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !415} ; [ DW_TAG_file_type ]
!422 = metadata !{i32 589860, metadata !414, metadata !"long unsigned int", metadata !414, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!423 = metadata !{i32 589876, i32 0, metadata !10, metadata !"__libc_stack_end", metadata !"__libc_stack_end", metadata !"", metadata !10, i32 52, metadata !38, i1 false, i1 true, i8** @__libc_stack_end} ; [ DW_TAG_variable ]
!424 = metadata !{i32 589876, i32 0, metadata !10, metadata !"__uclibc_progname", metadata !"__uclibc_progname", metadata !"", metadata !10, i32 110, metadata !425, i1 false, i1 true, i8** @__uclibc_progname} ; [ DW_TAG_variable ]
!425 = metadata !{i32 589839, metadata !10, metadata !"", metadata !10, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !426} ; [ DW_TAG_pointer_type ]
!426 = metadata !{i32 589862, metadata !10, metadata !"", metadata !10, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !36} ; [ DW_TAG_const_type ]
!427 = metadata !{i32 589876, i32 0, metadata !10, metadata !"__environ", metadata !"__environ", metadata !"", metadata !10, i32 125, metadata !34, i1 false, i1 true, i8*** @__environ} ; [ DW_TAG_variable ]
!428 = metadata !{i32 589876, i32 0, metadata !10, metadata !"__pagesize", metadata !"__pagesize", metadata !"", metadata !10, i32 129, metadata !429, i1 false, i1 true, i64* @__pagesize} ; [ DW_TAG_variable ]
!429 = metadata !{i32 589846, metadata !430, metadata !"size_t", metadata !430, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !431} ; [ DW_TAG_typedef ]
!430 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !11} ; [ DW_TAG_file_type ]
!431 = metadata !{i32 589860, metadata !10, metadata !"long unsigned int", metadata !10, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!432 = metadata !{i32 589876, i32 0, metadata !24, metadata !"been_there_done_that", metadata !"been_there_done_that", metadata !"", metadata !10, i32 189, metadata !14, i1 true, i1 true, i32* @been_there_done_that.2848} ; [ DW_TAG_variable ]
!433 = metadata !{i32 589876, i32 0, metadata !10, metadata !"__app_fini", metadata !"__app_fini", metadata !"", metadata !10, i32 244, metadata !37, i1 false, i1 true, void ()** @__app_fini} ; [ DW_TAG_variable ]
!434 = metadata !{i32 589876, i32 0, metadata !10, metadata !"__rtld_fini", metadata !"__rtld_fini", metadata !"", metadata !10, i32 247, metadata !37, i1 false, i1 true, void ()** @__rtld_fini} ; [ DW_TAG_variable ]
!435 = metadata !{i32 589876, i32 0, metadata !75, metadata !"_stdio_streams", metadata !"_stdio_streams", metadata !"", metadata !75, i32 131, metadata !436, i1 true, i1 true, [3 x %struct.FILE]* @_stdio_streams} ; [ DW_TAG_variable ]
!436 = metadata !{i32 589825, metadata !75, metadata !"", metadata !75, i32 0, i64 1920, i64 64, i64 0, i32 0, metadata !437, metadata !469, i32 0, null} ; [ DW_TAG_array_type ]
!437 = metadata !{i32 589846, metadata !438, metadata !"FILE", metadata !438, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !439} ; [ DW_TAG_typedef ]
!438 = metadata !{i32 589865, metadata !"stdio.h", metadata !"/home/zehranaz/klee-uclibc/./include", metadata !76} ; [ DW_TAG_file_type ]
!439 = metadata !{i32 589843, metadata !75, metadata !"__STDIO_FILE_STRUCT", metadata !438, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !440, i32 0, null} ; [ DW_TAG_structure_type ]
!440 = metadata !{metadata !441, metadata !444, metadata !447, metadata !449, metadata !451, metadata !452, metadata !453, metadata !454, metadata !455, metadata !456, metadata !458, metadata !462}
!441 = metadata !{i32 589837, metadata !439, metadata !"__modeflags", metadata !442, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !443} ; [ DW_TAG_member ]
!442 = metadata !{i32 589865, metadata !"uClibc_stdio.h", metadata !"/home/zehranaz/klee-uclibc/./include/bits", metadata !76} ; [ DW_TAG_file_type ]
!443 = metadata !{i32 589860, metadata !75, metadata !"short unsigned int", metadata !75, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!444 = metadata !{i32 589837, metadata !439, metadata !"__ungot_width", metadata !442, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !445} ; [ DW_TAG_member ]
!445 = metadata !{i32 589825, metadata !75, metadata !"", metadata !75, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !446, metadata !146, i32 0, null} ; [ DW_TAG_array_type ]
!446 = metadata !{i32 589860, metadata !75, metadata !"unsigned char", metadata !75, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!447 = metadata !{i32 589837, metadata !439, metadata !"__filedes", metadata !442, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !448} ; [ DW_TAG_member ]
!448 = metadata !{i32 589860, metadata !75, metadata !"int", metadata !75, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!449 = metadata !{i32 589837, metadata !439, metadata !"__bufstart", metadata !442, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !450} ; [ DW_TAG_member ]
!450 = metadata !{i32 589839, metadata !75, metadata !"", metadata !75, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !446} ; [ DW_TAG_pointer_type ]
!451 = metadata !{i32 589837, metadata !439, metadata !"__bufend", metadata !442, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !450} ; [ DW_TAG_member ]
!452 = metadata !{i32 589837, metadata !439, metadata !"__bufpos", metadata !442, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !450} ; [ DW_TAG_member ]
!453 = metadata !{i32 589837, metadata !439, metadata !"__bufread", metadata !442, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !450} ; [ DW_TAG_member ]
!454 = metadata !{i32 589837, metadata !439, metadata !"__bufgetc_u", metadata !442, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !450} ; [ DW_TAG_member ]
!455 = metadata !{i32 589837, metadata !439, metadata !"__bufputc_u", metadata !442, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !450} ; [ DW_TAG_member ]
!456 = metadata !{i32 589837, metadata !439, metadata !"__nextopen", metadata !442, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !457} ; [ DW_TAG_member ]
!457 = metadata !{i32 589839, metadata !75, metadata !"", metadata !75, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !439} ; [ DW_TAG_pointer_type ]
!458 = metadata !{i32 589837, metadata !439, metadata !"__ungot", metadata !442, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !459} ; [ DW_TAG_member ]
!459 = metadata !{i32 589825, metadata !75, metadata !"", metadata !75, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !460, metadata !146, i32 0, null} ; [ DW_TAG_array_type ]
!460 = metadata !{i32 589846, metadata !461, metadata !"wchar_t", metadata !461, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !448} ; [ DW_TAG_typedef ]
!461 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !76} ; [ DW_TAG_file_type ]
!462 = metadata !{i32 589837, metadata !439, metadata !"__state", metadata !442, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !463} ; [ DW_TAG_member ]
!463 = metadata !{i32 589846, metadata !464, metadata !"__mbstate_t", metadata !464, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !465} ; [ DW_TAG_typedef ]
!464 = metadata !{i32 589865, metadata !"wchar.h", metadata !"/home/zehranaz/klee-uclibc/./include", metadata !76} ; [ DW_TAG_file_type ]
!465 = metadata !{i32 589843, metadata !75, metadata !"", metadata !464, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !466, i32 0, null} ; [ DW_TAG_structure_type ]
!466 = metadata !{metadata !467, metadata !468}
!467 = metadata !{i32 589837, metadata !465, metadata !"__mask", metadata !464, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !460} ; [ DW_TAG_member ]
!468 = metadata !{i32 589837, metadata !465, metadata !"__wc", metadata !464, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !460} ; [ DW_TAG_member ]
!469 = metadata !{metadata !470}
!470 = metadata !{i32 589857, i64 0, i64 2}       ; [ DW_TAG_subrange_type ]
!471 = metadata !{i32 589876, i32 0, metadata !75, metadata !"stdin", metadata !"stdin", metadata !"", metadata !75, i32 154, metadata !472, i1 false, i1 true, %struct.FILE** @stdin} ; [ DW_TAG_variable ]
!472 = metadata !{i32 589839, metadata !75, metadata !"", metadata !75, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !437} ; [ DW_TAG_pointer_type ]
!473 = metadata !{i32 589876, i32 0, metadata !75, metadata !"stdout", metadata !"stdout", metadata !"", metadata !75, i32 155, metadata !472, i1 false, i1 true, %struct.FILE** @stdout} ; [ DW_TAG_variable ]
!474 = metadata !{i32 589876, i32 0, metadata !75, metadata !"stderr", metadata !"stderr", metadata !"", metadata !75, i32 156, metadata !472, i1 false, i1 true, %struct.FILE** @stderr} ; [ DW_TAG_variable ]
!475 = metadata !{i32 589876, i32 0, metadata !75, metadata !"__stdin", metadata !"__stdin", metadata !"", metadata !75, i32 159, metadata !472, i1 false, i1 true, %struct.FILE** @__stdin} ; [ DW_TAG_variable ]
!476 = metadata !{i32 589876, i32 0, metadata !75, metadata !"__stdout", metadata !"__stdout", metadata !"", metadata !75, i32 162, metadata !472, i1 false, i1 true, %struct.FILE** @__stdout} ; [ DW_TAG_variable ]
!477 = metadata !{i32 589876, i32 0, metadata !75, metadata !"_stdio_openlist", metadata !"_stdio_openlist", metadata !"", metadata !75, i32 180, metadata !457, i1 false, i1 true, %struct.FILE** @_stdio_openlist} ; [ DW_TAG_variable ]
!478 = metadata !{i32 589876, i32 0, metadata !80, metadata !"been_there_done_that", metadata !"been_there_done_that", metadata !"", metadata !80, i32 49, metadata !479, i1 true, i1 true, i32* @been_there_done_that} ; [ DW_TAG_variable ]
!479 = metadata !{i32 589860, metadata !80, metadata !"int", metadata !80, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!480 = metadata !{i32 589876, i32 0, metadata !86, metadata !"__exit_cleanup", metadata !"__exit_cleanup", metadata !"", metadata !86, i32 309, metadata !481, i1 false, i1 true, void (i32)** @__exit_cleanup} ; [ DW_TAG_variable ]
!481 = metadata !{i32 589839, metadata !84, metadata !"", metadata !84, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !87} ; [ DW_TAG_pointer_type ]
!482 = metadata !{i32 589876, i32 0, metadata !483, metadata !"errno", metadata !"errno", metadata !"", metadata !483, i32 7, metadata !485, i1 false, i1 true, i32* @errno} ; [ DW_TAG_variable ]
!483 = metadata !{i32 589865, metadata !"errno.c", metadata !"/home/zehranaz/klee-uclibc/libc/misc/internals", metadata !484} ; [ DW_TAG_file_type ]
!484 = metadata !{i32 589841, i32 0, i32 1, metadata !"errno.c", metadata !"/home/zehranaz/klee-uclibc/libc/misc/internals", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_u
!485 = metadata !{i32 589860, metadata !483, metadata !"int", metadata !483, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!486 = metadata !{i32 589876, i32 0, metadata !483, metadata !"h_errno", metadata !"h_errno", metadata !"", metadata !483, i32 8, metadata !485, i1 false, i1 true, i32* @h_errno} ; [ DW_TAG_variable ]
!487 = metadata !{i32 590081, metadata !356, metadata !"z", metadata !357, i32 12, metadata !361, i32 0} ; [ DW_TAG_arg_variable ]
!488 = metadata !{i32 590081, metadata !362, metadata !"name", metadata !363, i32 13, metadata !368, i32 0} ; [ DW_TAG_arg_variable ]
!489 = metadata !{i32 590080, metadata !490, metadata !"x", metadata !363, i32 14, metadata !367, i32 0} ; [ DW_TAG_auto_variable ]
!490 = metadata !{i32 589835, metadata !362, i32 13, i32 0, metadata !363, i32 0} ; [ DW_TAG_lexical_block ]
!491 = metadata !{i32 590081, metadata !371, metadata !"bitWidth", metadata !372, i32 20, metadata !376, i32 0} ; [ DW_TAG_arg_variable ]
!492 = metadata !{i32 590081, metadata !371, metadata !"shift", metadata !372, i32 20, metadata !376, i32 0} ; [ DW_TAG_arg_variable ]
!493 = metadata !{i32 590081, metadata !377, metadata !"start", metadata !378, i32 13, metadata !382, i32 0} ; [ DW_TAG_arg_variable ]
!494 = metadata !{i32 590081, metadata !377, metadata !"end", metadata !378, i32 13, metadata !382, i32 0} ; [ DW_TAG_arg_variable ]
!495 = metadata !{i32 590081, metadata !377, metadata !"name", metadata !378, i32 13, metadata !383, i32 0} ; [ DW_TAG_arg_variable ]
!496 = metadata !{i32 590080, metadata !497, metadata !"x", metadata !378, i32 14, metadata !382, i32 0} ; [ DW_TAG_auto_variable ]
!497 = metadata !{i32 589835, metadata !377, i32 13, i32 0, metadata !378, i32 0} ; [ DW_TAG_lexical_block ]
!498 = metadata !{i32 590081, metadata !386, metadata !"destaddr", metadata !387, i32 12, metadata !391, i32 0} ; [ DW_TAG_arg_variable ]
!499 = metadata !{i32 590081, metadata !386, metadata !"srcaddr", metadata !387, i32 12, metadata !391, i32 0} ; [ DW_TAG_arg_variable ]
!500 = metadata !{i32 590081, metadata !386, metadata !"len", metadata !387, i32 12, metadata !392, i32 0} ; [ DW_TAG_arg_variable ]
!501 = metadata !{i32 590080, metadata !502, metadata !"dest", metadata !387, i32 13, metadata !503, i32 0} ; [ DW_TAG_auto_variable ]
!502 = metadata !{i32 589835, metadata !386, i32 12, i32 0, metadata !387, i32 0} ; [ DW_TAG_lexical_block ]
!503 = metadata !{i32 589839, metadata !387, metadata !"", metadata !387, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !504} ; [ DW_TAG_pointer_type ]
!504 = metadata !{i32 589860, metadata !387, metadata !"char", metadata !387, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!505 = metadata !{i32 590080, metadata !502, metadata !"src", metadata !387, i32 14, metadata !506, i32 0} ; [ DW_TAG_auto_variable ]
!506 = metadata !{i32 589839, metadata !387, metadata !"", metadata !387, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !507} ; [ DW_TAG_pointer_type ]
!507 = metadata !{i32 589862, metadata !387, metadata !"", metadata !387, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !504} ; [ DW_TAG_const_type ]
!508 = metadata !{i32 590081, metadata !395, metadata !"dst", metadata !396, i32 12, metadata !400, i32 0} ; [ DW_TAG_arg_variable ]
!509 = metadata !{i32 590081, metadata !395, metadata !"src", metadata !396, i32 12, metadata !400, i32 0} ; [ DW_TAG_arg_variable ]
!510 = metadata !{i32 590081, metadata !395, metadata !"count", metadata !396, i32 12, metadata !401, i32 0} ; [ DW_TAG_arg_variable ]
!511 = metadata !{i32 590080, metadata !512, metadata !"a", metadata !396, i32 13, metadata !513, i32 0} ; [ DW_TAG_auto_variable ]
!512 = metadata !{i32 589835, metadata !395, i32 12, i32 0, metadata !396, i32 0} ; [ DW_TAG_lexical_block ]
!513 = metadata !{i32 589839, metadata !396, metadata !"", metadata !396, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !514} ; [ DW_TAG_pointer_type ]
!514 = metadata !{i32 589860, metadata !396, metadata !"char", metadata !396, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!515 = metadata !{i32 590080, metadata !512, metadata !"b", metadata !396, i32 14, metadata !516, i32 0} ; [ DW_TAG_auto_variable ]
!516 = metadata !{i32 589839, metadata !396, metadata !"", metadata !396, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !517} ; [ DW_TAG_pointer_type ]
!517 = metadata !{i32 589862, metadata !396, metadata !"", metadata !396, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !514} ; [ DW_TAG_const_type ]
!518 = metadata !{i32 590081, metadata !404, metadata !"destaddr", metadata !405, i32 11, metadata !409, i32 0} ; [ DW_TAG_arg_variable ]
!519 = metadata !{i32 590081, metadata !404, metadata !"srcaddr", metadata !405, i32 11, metadata !409, i32 0} ; [ DW_TAG_arg_variable ]
!520 = metadata !{i32 590081, metadata !404, metadata !"len", metadata !405, i32 11, metadata !410, i32 0} ; [ DW_TAG_arg_variable ]
!521 = metadata !{i32 590080, metadata !522, metadata !"dest", metadata !405, i32 12, metadata !523, i32 0} ; [ DW_TAG_auto_variable ]
!522 = metadata !{i32 589835, metadata !404, i32 11, i32 0, metadata !405, i32 0} ; [ DW_TAG_lexical_block ]
!523 = metadata !{i32 589839, metadata !405, metadata !"", metadata !405, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !524} ; [ DW_TAG_pointer_type ]
!524 = metadata !{i32 589860, metadata !405, metadata !"char", metadata !405, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!525 = metadata !{i32 590080, metadata !522, metadata !"src", metadata !405, i32 13, metadata !526, i32 0} ; [ DW_TAG_auto_variable ]
!526 = metadata !{i32 589839, metadata !405, metadata !"", metadata !405, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !527} ; [ DW_TAG_pointer_type ]
!527 = metadata !{i32 589862, metadata !405, metadata !"", metadata !405, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !524} ; [ DW_TAG_const_type ]
!528 = metadata !{i32 590081, metadata !413, metadata !"dst", metadata !414, i32 11, metadata !418, i32 0} ; [ DW_TAG_arg_variable ]
!529 = metadata !{i32 590081, metadata !413, metadata !"s", metadata !414, i32 11, metadata !419, i32 0} ; [ DW_TAG_arg_variable ]
!530 = metadata !{i32 590081, metadata !413, metadata !"count", metadata !414, i32 11, metadata !420, i32 0} ; [ DW_TAG_arg_variable ]
!531 = metadata !{i32 590080, metadata !532, metadata !"a", metadata !414, i32 12, metadata !533, i32 0} ; [ DW_TAG_auto_variable ]
!532 = metadata !{i32 589835, metadata !413, i32 11, i32 0, metadata !414, i32 0} ; [ DW_TAG_lexical_block ]
!533 = metadata !{i32 589839, metadata !414, metadata !"", metadata !414, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !534} ; [ DW_TAG_pointer_type ]
!534 = metadata !{i32 589877, metadata !414, metadata !"", metadata !414, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !535} ; [ DW_TAG_volatile_type ]
!535 = metadata !{i32 589860, metadata !414, metadata !"char", metadata !414, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!536 = metadata !{i32 9, i32 0, metadata !537, null}
!537 = metadata !{i32 589835, metadata !0, i32 6, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!538 = metadata !{i32 10, i32 0, metadata !537, null}
!539 = metadata !{i32 11, i32 0, metadata !537, null}
!540 = metadata !{i32 14, i32 0, metadata !537, null}
!541 = metadata !{i32 18, i32 0, metadata !537, null}
!542 = metadata !{i32 19, i32 0, metadata !537, null}
!543 = metadata !{i32 21, i32 0, metadata !537, null}
!544 = metadata !{i32 24, i32 0, metadata !537, null}
!545 = metadata !{i32 25, i32 0, metadata !546, null}
!546 = metadata !{i32 589835, metadata !537, i32 25, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!547 = metadata !{i32 26, i32 0, metadata !546, null}
!548 = metadata !{i32 27, i32 0, metadata !546, null}
!549 = metadata !{i32 28, i32 0, metadata !546, null}
!550 = metadata !{i32 31, i32 0, metadata !546, null}
!551 = metadata !{i32 34, i32 0, metadata !537, null}
!552 = metadata !{i32 40, i32 0, metadata !553, null}
!553 = metadata !{i32 589835, metadata !6, i32 38, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!554 = metadata !{i32 41, i32 0, metadata !553, null}
!555 = metadata !{i32 42, i32 0, metadata !553, null}
!556 = metadata !{i32 43, i32 0, metadata !553, null}
!557 = metadata !{i32 139, i32 0, metadata !558, null}
!558 = metadata !{i32 589835, metadata !9, i32 137, i32 0, metadata !10, i32 0} ; [ DW_TAG_lexical_block ]
!559 = metadata !{i32 143, i32 0, metadata !560, null}
!560 = metadata !{i32 589835, metadata !558, i32 137, i32 0, metadata !10, i32 1} ; [ DW_TAG_lexical_block ]
!561 = metadata !{i32 147, i32 0, metadata !560, null}
!562 = metadata !{i32 150, i32 0, metadata !560, null}
!563 = metadata !{i32 153, i32 0, metadata !560, null}
!564 = metadata !{i32 56, i32 0, metadata !565, null}
!565 = metadata !{i32 589835, metadata !15, i32 55, i32 0, metadata !16, i32 2} ; [ DW_TAG_lexical_block ]
!566 = metadata !{i32 160, i32 0, metadata !567, null}
!567 = metadata !{i32 589835, metadata !21, i32 156, i32 0, metadata !10, i32 3} ; [ DW_TAG_lexical_block ]
!568 = metadata !{i32 161, i32 0, metadata !567, null}
!569 = metadata !{i32 162, i32 0, metadata !567, null}
!570 = metadata !{i32 163, i32 0, metadata !567, null}
!571 = metadata !{i32 165, i32 0, metadata !567, null}
!572 = metadata !{i32 166, i32 0, metadata !567, null}
!573 = metadata !{i32 168, i32 0, metadata !567, null}
!574 = metadata !{i32 191, i32 0, metadata !575, null}
!575 = metadata !{i32 589835, metadata !24, i32 188, i32 0, metadata !10, i32 4} ; [ DW_TAG_lexical_block ]
!576 = metadata !{i32 193, i32 0, metadata !575, null}
!577 = metadata !{i32 197, i32 0, metadata !575, null}
!578 = metadata !{i32 239, i32 0, metadata !575, null}
!579 = metadata !{i32 192, i32 0, metadata !575, null}
!580 = metadata !{i32 263, i32 0, metadata !581, null}
!581 = metadata !{i32 589835, metadata !27, i32 252, i32 0, metadata !10, i32 5} ; [ DW_TAG_lexical_block ]
!582 = metadata !{i32 264, i32 0, metadata !581, null}
!583 = metadata !{i32 266, i32 0, metadata !581, null}
!584 = metadata !{i32 267, i32 0, metadata !581, null}
!585 = metadata !{i32 268, i32 0, metadata !581, null}
!586 = metadata !{i32 288, i32 0, metadata !587, null}
!587 = metadata !{i32 589835, metadata !28, i32 281, i32 0, metadata !10, i32 6} ; [ DW_TAG_lexical_block ]
!588 = metadata !{i32 291, i32 0, metadata !587, null}
!589 = metadata !{i32 294, i32 0, metadata !587, null}
!590 = metadata !{i32 298, i32 0, metadata !587, null}
!591 = metadata !{i32 300, i32 0, metadata !587, null}
!592 = metadata !{i32 305, i32 0, metadata !587, null}
!593 = metadata !{i32 306, i32 0, metadata !587, null}
!594 = metadata !{i32 307, i32 0, metadata !587, null}
!595 = metadata !{i32 308, i32 0, metadata !587, null}
!596 = metadata !{i32 312, i32 0, metadata !597, null}
!597 = metadata !{i32 589835, metadata !587, i32 312, i32 0, metadata !10, i32 7} ; [ DW_TAG_lexical_block ]
!598 = metadata !{i32 313, i32 0, metadata !597, null}
!599 = metadata !{i32 314, i32 0, metadata !597, null}
!600 = metadata !{i32 316, i32 0, metadata !597, null}
!601 = metadata !{i32 311, i32 0, metadata !587, null}
!602 = metadata !{i32 323, i32 0, metadata !587, null}
!603 = metadata !{i32 327, i32 0, metadata !587, null}
!604 = metadata !{i32 331, i32 0, metadata !587, null}
!605 = metadata !{i32 336, i32 0, metadata !587, null}
!606 = metadata !{i32 337, i32 0, metadata !587, null}
!607 = metadata !{i32 338, i32 0, metadata !587, null}
!608 = metadata !{i32 342, i32 0, metadata !587, null}
!609 = metadata !{i32 354, i32 0, metadata !587, null}
!610 = metadata !{i32 370, i32 0, metadata !587, null}
!611 = metadata !{i32 371, i32 0, metadata !587, null}
!612 = metadata !{i32 391, i32 0, metadata !587, null}
!613 = metadata !{i32 392, i32 0, metadata !587, null}
!614 = metadata !{i32 395, i32 0, metadata !587, null}
!615 = metadata !{i32 396, i32 0, metadata !587, null}
!616 = metadata !{i32 401, i32 0, metadata !587, null}
!617 = metadata !{i32 21, i32 0, metadata !39, null}
!618 = metadata !{i32 34, i32 0, metadata !619, null}
!619 = metadata !{i32 589835, metadata !39, i32 21, i32 0, metadata !40, i32 0} ; [ DW_TAG_lexical_block ]
!620 = metadata !{i32 37, i32 0, metadata !619, null}
!621 = metadata !{i32 20, i32 0, metadata !622, null}
!622 = metadata !{i32 589835, metadata !48, i32 19, i32 0, metadata !49, i32 0} ; [ DW_TAG_lexical_block ]
!623 = metadata !{i32 29, i32 0, metadata !622, null}
!624 = metadata !{i32 30, i32 0, metadata !622, null}
!625 = metadata !{i32 31, i32 0, metadata !622, null}
!626 = metadata !{i32 28, i32 0, metadata !622, null}
!627 = metadata !{i32 35, i32 0, metadata !622, null}
!628 = metadata !{i32 13, i32 0, metadata !629, null}
!629 = metadata !{i32 589835, metadata !60, i32 12, i32 0, metadata !61, i32 0} ; [ DW_TAG_lexical_block ]
!630 = metadata !{i32 12, i32 0, metadata !631, null}
!631 = metadata !{i32 589835, metadata !67, i32 11, i32 0, metadata !68, i32 0} ; [ DW_TAG_lexical_block ]
!632 = metadata !{i32 258, i32 0, metadata !633, null}
!633 = metadata !{i32 589835, metadata !74, i32 211, i32 0, metadata !75, i32 0} ; [ DW_TAG_lexical_block ]
!634 = metadata !{i32 261, i32 0, metadata !633, null}
!635 = metadata !{i32 262, i32 0, metadata !633, null}
!636 = metadata !{i32 274, i32 0, metadata !633, null}
!637 = metadata !{i32 280, i32 0, metadata !638, null}
!638 = metadata !{i32 589835, metadata !78, i32 278, i32 0, metadata !75, i32 1} ; [ DW_TAG_lexical_block ]
!639 = metadata !{i32 282, i32 0, metadata !638, null}
!640 = metadata !{i32 283, i32 0, metadata !638, null}
!641 = metadata !{i32 284, i32 0, metadata !638, null}
!642 = metadata !{i32 291, i32 0, metadata !638, null}
!643 = metadata !{i32 322, i32 0, metadata !644, null}
!644 = metadata !{i32 589835, metadata !83, i32 319, i32 0, metadata !86, i32 0} ; [ DW_TAG_lexical_block ]
!645 = metadata !{i32 323, i32 0, metadata !644, null}
!646 = metadata !{i32 327, i32 0, metadata !644, null}
!647 = metadata !{i32 334, i32 0, metadata !644, null}
!648 = metadata !{i32 336, i32 0, metadata !644, null}
!649 = metadata !{i32 20, i32 0, metadata !650, null}
!650 = metadata !{i32 589835, metadata !90, i32 19, i32 0, metadata !91, i32 0} ; [ DW_TAG_lexical_block ]
!651 = metadata !{i32 21, i32 0, metadata !650, null}
!652 = metadata !{i32 29, i32 0, metadata !650, null}
!653 = metadata !{i32 30, i32 0, metadata !650, null}
!654 = metadata !{i32 28, i32 0, metadata !650, null}
!655 = metadata !{i32 34, i32 0, metadata !650, null}
!656 = metadata !{i32 19, i32 0, metadata !657, null}
!657 = metadata !{i32 589835, metadata !99, i32 18, i32 0, metadata !100, i32 0} ; [ DW_TAG_lexical_block ]
!658 = metadata !{i32 28, i32 0, metadata !657, null}
!659 = metadata !{i32 29, i32 0, metadata !657, null}
!660 = metadata !{i32 27, i32 0, metadata !657, null}
!661 = metadata !{i32 32, i32 0, metadata !657, null}
!662 = metadata !{i32 117, i32 0, metadata !109, null}
!663 = metadata !{i32 117, i32 0, metadata !664, null}
!664 = metadata !{i32 589835, metadata !109, i32 117, i32 0, metadata !112, i32 0} ; [ DW_TAG_lexical_block ]
!665 = metadata !{i32 118, i32 0, metadata !125, null}
!666 = metadata !{i32 118, i32 0, metadata !667, null}
!667 = metadata !{i32 589835, metadata !125, i32 118, i32 0, metadata !112, i32 1} ; [ DW_TAG_lexical_block ]
!668 = metadata !{i32 119, i32 0, metadata !126, null}
!669 = metadata !{i32 119, i32 0, metadata !670, null}
!670 = metadata !{i32 589835, metadata !126, i32 119, i32 0, metadata !112, i32 2} ; [ DW_TAG_lexical_block ]
!671 = metadata !{i32 23, i32 0, metadata !672, null}
!672 = metadata !{i32 589835, metadata !127, i32 18, i32 0, metadata !128, i32 0} ; [ DW_TAG_lexical_block ]
!673 = metadata !{i32 24, i32 0, metadata !672, null}
!674 = metadata !{i32 25, i32 0, metadata !672, null}
!675 = metadata !{i32 28, i32 0, metadata !672, null}
!676 = metadata !{i32 30, i32 0, metadata !677, null}
!677 = metadata !{i32 589835, metadata !169, i32 27, i32 0, metadata !170, i32 0} ; [ DW_TAG_lexical_block ]
!678 = metadata !{i32 17, i32 0, metadata !679, null}
!679 = metadata !{i32 589835, metadata !175, i32 16, i32 0, metadata !176, i32 0} ; [ DW_TAG_lexical_block ]
!680 = metadata !{i32 47, i32 0, metadata !681, null}
!681 = metadata !{i32 589835, metadata !181, i32 43, i32 0, metadata !182, i32 0} ; [ DW_TAG_lexical_block ]
!682 = metadata !{i32 48, i32 0, metadata !681, null}
!683 = metadata !{i32 49, i32 0, metadata !681, null}
!684 = metadata !{i32 50, i32 0, metadata !681, null}
!685 = metadata !{i32 52, i32 0, metadata !681, null}
!686 = metadata !{i32 58, i32 0, metadata !681, null}
!687 = metadata !{i32 62, i32 0, metadata !681, null}
!688 = metadata !{i32 63, i32 0, metadata !681, null}
!689 = metadata !{i32 64, i32 0, metadata !681, null}
!690 = metadata !{i32 65, i32 0, metadata !681, null}
!691 = metadata !{i32 67, i32 0, metadata !681, null}
!692 = metadata !{i32 71, i32 0, metadata !681, null}
!693 = metadata !{i32 44, i32 0, metadata !694, null}
!694 = metadata !{i32 589835, metadata !279, i32 35, i32 0, metadata !280, i32 0} ; [ DW_TAG_lexical_block ]
!695 = metadata !{i32 47, i32 0, metadata !694, null}
!696 = metadata !{i32 49, i32 0, metadata !694, null}
!697 = metadata !{i32 51, i32 0, metadata !694, null}
!698 = metadata !{i32 52, i32 0, metadata !694, null}
!699 = metadata !{i32 62, i32 0, metadata !694, null}
!700 = metadata !{i32 63, i32 0, metadata !694, null}
!701 = metadata !{i32 70, i32 0, metadata !694, null}
!702 = metadata !{i32 73, i32 0, metadata !694, null}
!703 = metadata !{i32 76, i32 0, metadata !704, null}
!704 = metadata !{i32 589835, metadata !694, i32 76, i32 0, metadata !280, i32 1} ; [ DW_TAG_lexical_block ]
!705 = metadata !{i32 77, i32 0, metadata !704, null}
!706 = metadata !{i32 80, i32 0, metadata !704, null}
!707 = metadata !{i32 83, i32 0, metadata !704, null}
!708 = metadata !{i32 88, i32 0, metadata !704, null}
!709 = metadata !{i32 89, i32 0, metadata !704, null}
!710 = metadata !{i32 90, i32 0, metadata !704, null}
!711 = metadata !{i32 92, i32 0, metadata !704, null}
!712 = metadata !{i32 94, i32 0, metadata !704, null}
!713 = metadata !{i32 99, i32 0, metadata !694, null}
!714 = metadata !{i32 43, i32 0, metadata !715, null}
!715 = metadata !{i32 589835, metadata !321, i32 39, i32 0, metadata !322, i32 0} ; [ DW_TAG_lexical_block ]
!716 = metadata !{i32 45, i32 0, metadata !715, null}
!717 = metadata !{i32 46, i32 0, metadata !715, null}
!718 = metadata !{i32 47, i32 0, metadata !715, null}
!719 = metadata !{i32 48, i32 0, metadata !715, null}
!720 = metadata !{i32 49, i32 0, metadata !715, null}
!721 = metadata !{i32 61, i32 0, metadata !715, null}
!722 = metadata !{i32 79, i32 0, metadata !715, null}
!723 = metadata !{i32 22, i32 0, metadata !724, null}
!724 = metadata !{i32 589835, metadata !347, i32 21, i32 0, metadata !348, i32 0} ; [ DW_TAG_lexical_block ]
!725 = metadata !{i32 23, i32 0, metadata !724, null}
!726 = metadata !{i32 31, i32 0, metadata !724, null}
!727 = metadata !{i32 32, i32 0, metadata !724, null}
!728 = metadata !{i32 30, i32 0, metadata !724, null}
!729 = metadata !{i32 36, i32 0, metadata !724, null}
!730 = metadata !{i32 13, i32 0, metadata !731, null}
!731 = metadata !{i32 589835, metadata !356, i32 12, i32 0, metadata !357, i32 0} ; [ DW_TAG_lexical_block ]
!732 = metadata !{i32 14, i32 0, metadata !731, null}
!733 = metadata !{i32 15, i32 0, metadata !731, null}
!734 = metadata !{i32 15, i32 0, metadata !490, null}
!735 = metadata !{i32 16, i32 0, metadata !490, null}
!736 = metadata !{i32 21, i32 0, metadata !737, null}
!737 = metadata !{i32 589835, metadata !371, i32 20, i32 0, metadata !372, i32 0} ; [ DW_TAG_lexical_block ]
!738 = metadata !{i32 27, i32 0, metadata !737, null}
!739 = metadata !{i32 29, i32 0, metadata !737, null}
!740 = metadata !{i32 16, i32 0, metadata !497, null}
!741 = metadata !{i32 17, i32 0, metadata !497, null}
!742 = metadata !{i32 19, i32 0, metadata !497, null}
!743 = metadata !{i32 22, i32 0, metadata !497, null}
!744 = metadata !{i32 25, i32 0, metadata !497, null}
!745 = metadata !{i32 26, i32 0, metadata !497, null}
!746 = metadata !{i32 28, i32 0, metadata !497, null}
!747 = metadata !{i32 29, i32 0, metadata !497, null}
!748 = metadata !{i32 32, i32 0, metadata !497, null}
!749 = metadata !{i32 20, i32 0, metadata !497, null}
