; ModuleID = 'klee_string_test.o'
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

@.str = private unnamed_addr constant [4 x i8] c"car\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"hay1\00", align 1
@.str2 = private unnamed_addr constant [5 x i8] c"hay2\00", align 1
@__libc_stack_end = global i8* null
@__uclibc_progname = hidden global i8* getelementptr inbounds ([1 x i8]* @.str3, i64 0, i64 0)
@.str3 = private constant [1 x i8] zeroinitializer, align 1
@__environ = global i8** null
@__pagesize = global i64 0
@.str14 = private constant [10 x i8] c"/dev/null\00", align 1
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
@.str25 = private constant [22 x i8] c"klee_div_zero_check.c\00", align 1
@.str126 = private constant [15 x i8] c"divide by zero\00", align 1
@.str227 = private constant [8 x i8] c"div.err\00", align 1
@.str328 = private constant [8 x i8] c"IGNORED\00", align 1
@.str1429 = private constant [16 x i8] c"overshift error\00", align 1
@.str2530 = private constant [14 x i8] c"overshift.err\00", align 1
@.str6 = private constant [13 x i8] c"klee_range.c\00", align 1
@.str17 = private constant [14 x i8] c"invalid range\00", align 1
@.str28 = private constant [5 x i8] c"user\00", align 1

@environ = alias weak i8*** @__environ
@strcoll = alias i32 (i8*, i8*)* @strcmp
@raise = alias weak i32 (i32)* @__raise
@sigaction = alias weak i32 (i32, %struct.sigaction*, %struct.sigaction*)* @__libc_sigaction

define i32 @find_needle_in_haystack(i8* %hay1, i8* %hay2, i8* %needle) nounwind {
entry:
  %hay1_addr = alloca i8*, align 8
  %hay2_addr = alloca i8*, align 8
  %needle_addr = alloca i8*, align 8
  %retval = alloca i32
  %0 = alloca i32
  %haystack = alloca i8*
  %"alloca point" = bitcast i32 0 to i32
  store i8* %hay1, i8** %hay1_addr
  store i8* %hay2, i8** %hay2_addr
  store i8* %needle, i8** %needle_addr
  %1 = load i8** %hay1_addr, align 8, !dbg !535
  %2 = load i8** %hay2_addr, align 8, !dbg !535
  %3 = call i8* @strcat(i8* noalias %1, i8* noalias %2) nounwind, !dbg !535
  store i8* %3, i8** %haystack, align 8, !dbg !535
  %4 = load i8** %needle_addr, align 8, !dbg !537
  %5 = load i8** %haystack, align 8, !dbg !537
  %6 = call i32 @strcmp(i8* %4, i8* %5) nounwind readonly, !dbg !537
  %7 = icmp eq i32 %6, 0, !dbg !537
  br i1 %7, label %bb, label %bb1, !dbg !537

bb:                                               ; preds = %entry
  store i32 1, i32* %0, align 4, !dbg !538
  br label %bb2, !dbg !538

bb1:                                              ; preds = %entry
  store i32 0, i32* %0, align 4, !dbg !539
  br label %bb2, !dbg !539

bb2:                                              ; preds = %bb1, %bb
  %8 = load i32* %0, align 4, !dbg !538
  store i32 %8, i32* %retval, align 4, !dbg !538
  %retval3 = load i32* %retval, !dbg !538
  ret i32 %retval3, !dbg !538
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define i32 @__user_main() nounwind {
entry:
  %retval = alloca i32
  %0 = alloca i32
  %hay1 = alloca [3 x i8]
  %hay2 = alloca [3 x i8]
  %needle = alloca [4 x i8]
  %"alloca point" = bitcast i32 0 to i32
  %1 = getelementptr inbounds [4 x i8]* %needle, i32 0, i32 0, !dbg !540
  %2 = load i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), align 1, !dbg !540
  store i8 %2, i8* %1, align 1, !dbg !540
  %3 = getelementptr inbounds [4 x i8]* %needle, i32 0, i32 1, !dbg !540
  %4 = load i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 1), align 1, !dbg !540
  store i8 %4, i8* %3, align 1, !dbg !540
  %5 = getelementptr inbounds [4 x i8]* %needle, i32 0, i32 2, !dbg !540
  %6 = load i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 2), align 1, !dbg !540
  store i8 %6, i8* %5, align 1, !dbg !540
  %7 = getelementptr inbounds [4 x i8]* %needle, i32 0, i32 3, !dbg !540
  %8 = load i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 3), align 1, !dbg !540
  store i8 %8, i8* %7, align 1, !dbg !540
  %hay11 = bitcast [3 x i8]* %hay1 to i8*, !dbg !542
  call void @klee_make_symbolic(i8* %hay11, i64 3, i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind, !dbg !542
  %hay22 = bitcast [3 x i8]* %hay2 to i8*, !dbg !543
  call void @klee_make_symbolic(i8* %hay22, i64 3, i8* getelementptr inbounds ([5 x i8]* @.str2, i64 0, i64 0)) nounwind, !dbg !543
  %hay13 = bitcast [3 x i8]* %hay1 to i8*, !dbg !544
  %hay24 = bitcast [3 x i8]* %hay2 to i8*, !dbg !544
  %needle5 = bitcast [4 x i8]* %needle to i8*, !dbg !544
  %9 = call i32 @find_needle_in_haystack(i8* %hay13, i8* %hay24, i8* %needle5) nounwind, !dbg !544
  store i32 %9, i32* %0, align 4, !dbg !544
  %10 = load i32* %0, align 4, !dbg !544
  store i32 %10, i32* %retval, align 4, !dbg !544
  %retval6 = load i32* %retval, !dbg !544
  ret i32 %retval6, !dbg !544
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
  %0 = load i32* %fd_addr, align 4, !dbg !545
  %1 = call i32 (i32, i32, ...)* @fcntl(i32 %0, i32 1) nounwind, !dbg !545
  %2 = icmp ne i32 %1, -1, !dbg !545
  br i1 %2, label %bb2, label %bb, !dbg !545

bb:                                               ; preds = %entry
  %3 = call i32* @__errno_location() nounwind readnone, !dbg !545
  %4 = load i32* %3, align 4, !dbg !545
  %5 = icmp ne i32 %4, 9, !dbg !545
  br i1 %5, label %bb2, label %bb1, !dbg !545

bb1:                                              ; preds = %bb
  store i32 1, i32* %iftmp.0, align 4, !dbg !545
  br label %bb3, !dbg !545

bb2:                                              ; preds = %bb, %entry
  store i32 0, i32* %iftmp.0, align 4, !dbg !545
  br label %bb3, !dbg !545

bb3:                                              ; preds = %bb2, %bb1
  %6 = load i32* %iftmp.0, align 4, !dbg !545
  %7 = sext i32 %6 to i64, !dbg !545
  %8 = icmp ne i64 %7, 0, !dbg !545
  br i1 %8, label %bb4, label %return, !dbg !545

bb4:                                              ; preds = %bb3
  %9 = load i32* %mode_addr, align 4, !dbg !547
  %10 = call i32 (i8*, i32, ...)* @open(i8* getelementptr inbounds ([10 x i8]* @.str14, i64 0, i64 0), i32 %9) nounwind, !dbg !547
  store i32 %10, i32* %nullfd, align 4, !dbg !547
  %11 = load i32* %nullfd, align 4, !dbg !549
  %12 = load i32* %fd_addr, align 4, !dbg !549
  %13 = icmp ne i32 %11, %12, !dbg !549
  br i1 %13, label %bb8, label %bb5, !dbg !549

bb5:                                              ; preds = %bb4
  %14 = load i32* %fd_addr, align 4, !dbg !549
  %15 = call i32 @fstat(i32 %14, %struct.stat* %st) nounwind, !dbg !549
  %16 = icmp ne i32 %15, 0, !dbg !549
  br i1 %16, label %bb8, label %bb6, !dbg !549

bb6:                                              ; preds = %bb5
  %17 = getelementptr inbounds %struct.stat* %st, i32 0, i32 3, !dbg !549
  %18 = load i32* %17, align 8, !dbg !549
  %19 = and i32 %18, 61440, !dbg !549
  %20 = icmp ne i32 %19, 8192, !dbg !549
  br i1 %20, label %bb8, label %bb7, !dbg !549

bb7:                                              ; preds = %bb6
  %21 = getelementptr inbounds %struct.stat* %st, i32 0, i32 7, !dbg !549
  %22 = load i64* %21, align 8, !dbg !549
  %23 = call i64 @gnu_dev_makedev(i32 1, i32 3) nounwind, !dbg !549
  %24 = icmp ne i64 %22, %23, !dbg !549
  br i1 %24, label %bb8, label %return, !dbg !549

bb8:                                              ; preds = %bb7, %bb6, %bb5, %bb4
  call void @abort() noreturn nounwind, !dbg !550
  unreachable, !dbg !550

return:                                           ; preds = %bb3, %bb7
  ret void, !dbg !551
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
  %1 = load i32* %__minor_addr, align 4, !dbg !552
  %2 = and i32 %1, 255, !dbg !552
  %3 = load i32* %__major_addr, align 4, !dbg !552
  %4 = and i32 %3, 4095, !dbg !552
  %int_cast_to_i64 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !552
  %5 = shl i32 %4, 8, !dbg !552
  %6 = or i32 %2, %5, !dbg !552
  %7 = zext i32 %6 to i64, !dbg !552
  %8 = load i32* %__minor_addr, align 4, !dbg !552
  %9 = zext i32 %8 to i64, !dbg !552
  %10 = and i64 %9, 4294967040, !dbg !552
  %int_cast_to_i641 = bitcast i64 12 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i641), !dbg !552
  %11 = shl i64 %10, 12, !dbg !552
  %12 = or i64 %7, %11, !dbg !552
  %13 = load i32* %__major_addr, align 4, !dbg !552
  %14 = zext i32 %13 to i64, !dbg !552
  %15 = and i64 %14, 4294963200, !dbg !552
  %int_cast_to_i642 = bitcast i64 32 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i642), !dbg !552
  %16 = shl i64 %15, 32, !dbg !552
  %17 = or i64 %12, %16, !dbg !552
  store i64 %17, i64* %0, align 8, !dbg !552
  %18 = load i64* %0, align 8, !dbg !552
  store i64 %18, i64* %retval, align 8, !dbg !552
  %retval1 = load i64* %retval, !dbg !552
  ret i64 %retval1, !dbg !552
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
  %1 = call i32 @getuid() nounwind, !dbg !554
  store i32 %1, i32* %uid, align 4, !dbg !554
  %2 = call i32 @geteuid() nounwind, !dbg !556
  store i32 %2, i32* %euid, align 4, !dbg !556
  %3 = call i32 @getgid() nounwind, !dbg !557
  store i32 %3, i32* %gid, align 4, !dbg !557
  %4 = call i32 @getegid() nounwind, !dbg !558
  store i32 %4, i32* %egid, align 4, !dbg !558
  %5 = load i32* %uid, align 4, !dbg !559
  %6 = load i32* %euid, align 4, !dbg !559
  %7 = icmp eq i32 %5, %6, !dbg !559
  br i1 %7, label %bb, label %bb2, !dbg !559

bb:                                               ; preds = %entry
  %8 = load i32* %gid, align 4, !dbg !559
  %9 = load i32* %egid, align 4, !dbg !559
  %10 = icmp eq i32 %8, %9, !dbg !559
  br i1 %10, label %bb1, label %bb2, !dbg !559

bb1:                                              ; preds = %bb
  store i32 0, i32* %0, align 4, !dbg !560
  br label %bb3, !dbg !560

bb2:                                              ; preds = %bb, %entry
  store i32 1, i32* %0, align 4, !dbg !561
  br label %bb3, !dbg !561

bb3:                                              ; preds = %bb2, %bb1
  %11 = load i32* %0, align 4, !dbg !560
  store i32 %11, i32* %retval, align 4, !dbg !560
  %retval4 = load i32* %retval, !dbg !560
  ret i32 %retval4, !dbg !560
}

declare i32 @getuid() nounwind

declare i32 @geteuid() nounwind

declare i32 @getgid() nounwind

declare i32 @getegid() nounwind

define void @__uClibc_init() nounwind {
entry:
  %0 = load i32* @been_there_done_that.2848, align 4, !dbg !562
  %1 = icmp ne i32 %0, 0, !dbg !562
  br i1 %1, label %return, label %bb, !dbg !562

bb:                                               ; preds = %entry
  %2 = load i32* @been_there_done_that.2848, align 4, !dbg !564
  %3 = add nsw i32 %2, 1, !dbg !564
  store i32 %3, i32* @been_there_done_that.2848, align 4, !dbg !564
  store i64 4096, i64* @__pagesize, align 8, !dbg !565
  call void @_stdio_init() nounwind, !dbg !566
  br label %return, !dbg !566

return:                                           ; preds = %entry, %bb
  ret void, !dbg !567
}

define void @__uClibc_fini() nounwind {
entry:
  %0 = load void ()** @__app_fini, align 8, !dbg !568
  %1 = icmp ne void ()* %0, null, !dbg !568
  br i1 %1, label %bb, label %bb1, !dbg !568

bb:                                               ; preds = %entry
  %2 = load void ()** @__app_fini, align 8, !dbg !570
  call void %2() nounwind, !dbg !570
  br label %bb1, !dbg !570

bb1:                                              ; preds = %bb, %entry
  %3 = load void ()** @__rtld_fini, align 8, !dbg !571
  %4 = icmp ne void ()* %3, null, !dbg !571
  br i1 %4, label %bb2, label %return, !dbg !571

bb2:                                              ; preds = %bb1
  %5 = load void ()** @__rtld_fini, align 8, !dbg !572
  call void %5() nounwind, !dbg !572
  br label %return, !dbg !572

return:                                           ; preds = %bb1, %bb2
  ret void, !dbg !573
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
  %0 = load i8** %stack_end_addr, align 8, !dbg !574
  store i8* %0, i8** @__libc_stack_end, align 8, !dbg !574
  %1 = load void ()** %rtld_fini_addr, align 8, !dbg !576
  store void ()* %1, void ()** @__rtld_fini, align 8, !dbg !576
  %2 = load i32* %argc_addr, align 4, !dbg !577
  %3 = add nsw i32 %2, 1, !dbg !577
  %4 = load i8*** %argv_addr, align 8, !dbg !577
  %5 = sext i32 %3 to i64, !dbg !577
  %6 = getelementptr inbounds i8** %4, i64 %5, !dbg !577
  store i8** %6, i8*** @__environ, align 8, !dbg !577
  %7 = load i8*** %argv_addr, align 8, !dbg !578
  %8 = load i8** %7, align 8, !dbg !578
  %9 = load i8*** @__environ, align 8, !dbg !578
  %10 = bitcast i8** %9 to i8*, !dbg !578
  %11 = icmp eq i8* %8, %10, !dbg !578
  br i1 %11, label %bb, label %bb1, !dbg !578

bb:                                               ; preds = %entry
  %12 = load i8*** %argv_addr, align 8, !dbg !579
  %13 = load i32* %argc_addr, align 4, !dbg !579
  %14 = sext i32 %13 to i64, !dbg !579
  %15 = getelementptr inbounds i8** %12, i64 %14, !dbg !579
  store i8** %15, i8*** @__environ, align 8, !dbg !579
  br label %bb1, !dbg !579

bb1:                                              ; preds = %bb, %entry
  %auxvt2 = bitcast [15 x %struct.Elf64_auxv_t]* %auxvt to %struct.Elf64_auxv_t*, !dbg !580
  %auxvt23 = bitcast %struct.Elf64_auxv_t* %auxvt2 to i8*, !dbg !580
  %16 = call i8* @memset(i8* %auxvt23, i32 0, i64 240) nounwind, !dbg !580
  %17 = load i8*** @__environ, align 8, !dbg !581
  %18 = bitcast i8** %17 to i64*, !dbg !581
  store i64* %18, i64** %aux_dat, align 8, !dbg !581
  br label %bb5, !dbg !581

bb5:                                              ; preds = %bb5, %bb1
  %19 = load i64** %aux_dat, align 8, !dbg !582
  %20 = load i64* %19, align 8, !dbg !582
  %21 = icmp ne i64 %20, 0, !dbg !582
  %22 = load i64** %aux_dat, align 8, !dbg !583
  %23 = getelementptr inbounds i64* %22, i64 1, !dbg !583
  store i64* %23, i64** %aux_dat, align 8, !dbg !583
  br i1 %21, label %bb5, label %bb10, !dbg !582

bb7:                                              ; preds = %bb10
  %24 = load i64** %aux_dat, align 8, !dbg !584
  %25 = bitcast i64* %24 to %struct.Elf64_auxv_t*, !dbg !584
  store %struct.Elf64_auxv_t* %25, %struct.Elf64_auxv_t** %auxv_entry, align 8, !dbg !584
  %26 = load %struct.Elf64_auxv_t** %auxv_entry, align 8, !dbg !586
  %27 = getelementptr inbounds %struct.Elf64_auxv_t* %26, i32 0, i32 0, !dbg !586
  %28 = load i64* %27, align 8, !dbg !586
  %29 = icmp ule i64 %28, 14, !dbg !586
  br i1 %29, label %bb8, label %bb9, !dbg !586

bb8:                                              ; preds = %bb7
  %30 = load %struct.Elf64_auxv_t** %auxv_entry, align 8, !dbg !587
  %31 = getelementptr inbounds %struct.Elf64_auxv_t* %30, i32 0, i32 0, !dbg !587
  %32 = load i64* %31, align 8, !dbg !587
  %33 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 %32, !dbg !587
  %34 = bitcast %struct.Elf64_auxv_t* %33 to i8*, !dbg !587
  %35 = load %struct.Elf64_auxv_t** %auxv_entry, align 8, !dbg !587
  %36 = bitcast %struct.Elf64_auxv_t* %35 to i8*, !dbg !587
  %37 = call i8* @memcpy(i8* noalias %34, i8* noalias %36, i64 16) nounwind, !dbg !587
  br label %bb9, !dbg !587

bb9:                                              ; preds = %bb8, %bb7
  %38 = load i64** %aux_dat, align 8, !dbg !588
  %39 = getelementptr inbounds i64* %38, i64 2, !dbg !588
  store i64* %39, i64** %aux_dat, align 8, !dbg !588
  br label %bb10, !dbg !588

bb10:                                             ; preds = %bb5, %bb9
  %40 = load i64** %aux_dat, align 8, !dbg !589
  %41 = load i64* %40, align 8, !dbg !589
  %42 = icmp ne i64 %41, 0, !dbg !589
  br i1 %42, label %bb7, label %bb11, !dbg !589

bb11:                                             ; preds = %bb10
  call void @__uClibc_init() nounwind, !dbg !590
  %43 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 6, !dbg !591
  %44 = getelementptr inbounds %struct.Elf64_auxv_t* %43, i32 0, i32 1, !dbg !591
  %45 = getelementptr inbounds %union.anon* %44, i32 0, i32 0, !dbg !591
  %46 = load i64* %45, align 8, !dbg !591
  %47 = icmp ne i64 %46, 0, !dbg !591
  br i1 %47, label %bb12, label %bb13, !dbg !591

bb12:                                             ; preds = %bb11
  %48 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 6, !dbg !591
  %49 = getelementptr inbounds %struct.Elf64_auxv_t* %48, i32 0, i32 1, !dbg !591
  %50 = getelementptr inbounds %union.anon* %49, i32 0, i32 0, !dbg !591
  %51 = load i64* %50, align 8, !dbg !591
  store i64 %51, i64* %iftmp.10, align 8, !dbg !591
  br label %bb14, !dbg !591

bb13:                                             ; preds = %bb11
  store i64 4096, i64* %iftmp.10, align 8, !dbg !591
  br label %bb14, !dbg !591

bb14:                                             ; preds = %bb13, %bb12
  %52 = load i64* %iftmp.10, align 8, !dbg !591
  store i64 %52, i64* @__pagesize, align 8, !dbg !591
  %53 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 11, !dbg !592
  %54 = getelementptr inbounds %struct.Elf64_auxv_t* %53, i32 0, i32 1, !dbg !592
  %55 = getelementptr inbounds %union.anon* %54, i32 0, i32 0, !dbg !592
  %56 = load i64* %55, align 8, !dbg !592
  %57 = icmp ne i64 %56, -1, !dbg !592
  br i1 %57, label %bb16, label %bb15, !dbg !592

bb15:                                             ; preds = %bb14
  %58 = call i32 @__check_suid() nounwind, !dbg !592
  %59 = icmp ne i32 %58, 0, !dbg !592
  br i1 %59, label %bb19, label %bb16, !dbg !592

bb16:                                             ; preds = %bb15, %bb14
  %60 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 11, !dbg !592
  %61 = getelementptr inbounds %struct.Elf64_auxv_t* %60, i32 0, i32 1, !dbg !592
  %62 = getelementptr inbounds %union.anon* %61, i32 0, i32 0, !dbg !592
  %63 = load i64* %62, align 8, !dbg !592
  %64 = icmp eq i64 %63, -1, !dbg !592
  br i1 %64, label %bb20, label %bb17, !dbg !592

bb17:                                             ; preds = %bb16
  %65 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 11, !dbg !592
  %66 = getelementptr inbounds %struct.Elf64_auxv_t* %65, i32 0, i32 1, !dbg !592
  %67 = getelementptr inbounds %union.anon* %66, i32 0, i32 0, !dbg !592
  %68 = load i64* %67, align 8, !dbg !592
  %69 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 12, !dbg !592
  %70 = getelementptr inbounds %struct.Elf64_auxv_t* %69, i32 0, i32 1, !dbg !592
  %71 = getelementptr inbounds %union.anon* %70, i32 0, i32 0, !dbg !592
  %72 = load i64* %71, align 8, !dbg !592
  %73 = icmp ne i64 %68, %72, !dbg !592
  br i1 %73, label %bb19, label %bb18, !dbg !592

bb18:                                             ; preds = %bb17
  %74 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 13, !dbg !592
  %75 = getelementptr inbounds %struct.Elf64_auxv_t* %74, i32 0, i32 1, !dbg !592
  %76 = getelementptr inbounds %union.anon* %75, i32 0, i32 0, !dbg !592
  %77 = load i64* %76, align 8, !dbg !592
  %78 = getelementptr inbounds [15 x %struct.Elf64_auxv_t]* %auxvt, i64 0, i64 14, !dbg !592
  %79 = getelementptr inbounds %struct.Elf64_auxv_t* %78, i32 0, i32 1, !dbg !592
  %80 = getelementptr inbounds %union.anon* %79, i32 0, i32 0, !dbg !592
  %81 = load i64* %80, align 8, !dbg !592
  %82 = icmp ne i64 %77, %81, !dbg !592
  br i1 %82, label %bb19, label %bb20, !dbg !592

bb19:                                             ; preds = %bb18, %bb17, %bb15
  call void @__check_one_fd(i32 0, i32 131072) nounwind, !dbg !593
  call void @__check_one_fd(i32 1, i32 131074) nounwind, !dbg !594
  call void @__check_one_fd(i32 2, i32 131074) nounwind, !dbg !595
  br label %bb20, !dbg !595

bb20:                                             ; preds = %bb19, %bb18, %bb16
  %83 = load i8*** %argv_addr, align 8, !dbg !596
  %84 = load i8** %83, align 8, !dbg !596
  store i8* %84, i8** @__uclibc_progname, align 8, !dbg !596
  %85 = load void ()** %app_fini_addr, align 8, !dbg !597
  store void ()* %85, void ()** @__app_fini, align 8, !dbg !597
  %86 = load void ()** %app_init_addr, align 8, !dbg !598
  %87 = icmp ne void ()* %86, null, !dbg !598
  br i1 %87, label %bb21, label %bb22, !dbg !598

bb21:                                             ; preds = %bb20
  %88 = load void ()** %app_init_addr, align 8, !dbg !599
  call void %88() nounwind, !dbg !599
  br label %bb22, !dbg !599

bb22:                                             ; preds = %bb21, %bb20
  %89 = icmp ne i8* bitcast (i32* ()* @__errno_location to i8*), null, !dbg !600
  br i1 %89, label %bb23, label %bb24, !dbg !600

bb23:                                             ; preds = %bb22
  %90 = call i32* @__errno_location() nounwind readnone, !dbg !601
  store i32 0, i32* %90, align 4, !dbg !601
  br label %bb24, !dbg !601

bb24:                                             ; preds = %bb23, %bb22
  %91 = icmp ne i8* bitcast (i32* ()* @__h_errno_location to i8*), null, !dbg !602
  br i1 %91, label %bb25, label %bb26, !dbg !602

bb25:                                             ; preds = %bb24
  %92 = call i32* @__h_errno_location() nounwind readnone, !dbg !603
  store i32 0, i32* %92, align 4, !dbg !603
  br label %bb26, !dbg !603

bb26:                                             ; preds = %bb25, %bb24
  %93 = load i8*** @__environ, align 8, !dbg !604
  %94 = load i32 (i32, i8**, i8**)** %main_addr, align 8, !dbg !604
  %95 = load i32* %argc_addr, align 4, !dbg !604
  %96 = load i8*** %argv_addr, align 8, !dbg !604
  %97 = call i32 %94(i32 %95, i8** %96, i8** %93) nounwind, !dbg !604
  call void @exit(i32 %97) noreturn nounwind, !dbg !604
  unreachable, !dbg !604
}

define i8* @strcat(i8* noalias %s1, i8* noalias %s2) nounwind {
entry:
  %s1_addr = alloca i8*, align 8
  %s2_addr = alloca i8*, align 8
  %retval = alloca i8*
  %0 = alloca i8*
  %s = alloca i8*
  %"alloca point" = bitcast i32 0 to i32
  store i8* %s1, i8** %s1_addr
  store i8* %s2, i8** %s2_addr
  %1 = load i8** %s1_addr, align 8, !dbg !605
  store i8* %1, i8** %s, align 8, !dbg !605
  br label %bb, !dbg !605

bb:                                               ; preds = %bb, %entry
  %2 = load i8** %s, align 8, !dbg !607
  %3 = load i8* %2, align 1, !dbg !607
  %4 = icmp ne i8 %3, 0, !dbg !607
  %5 = zext i1 %4 to i8, !dbg !607
  %6 = load i8** %s, align 8, !dbg !607
  %7 = getelementptr inbounds i8* %6, i64 1, !dbg !607
  store i8* %7, i8** %s, align 8, !dbg !607
  %toBool = icmp ne i8 %5, 0, !dbg !607
  br i1 %toBool, label %bb, label %bb1, !dbg !607

bb1:                                              ; preds = %bb
  %8 = load i8** %s, align 8, !dbg !608
  %9 = getelementptr inbounds i8* %8, i64 -1, !dbg !608
  store i8* %9, i8** %s, align 8, !dbg !608
  br label %bb2, !dbg !608

bb2:                                              ; preds = %bb2, %bb1
  %10 = load i8** %s2_addr, align 8, !dbg !609
  %11 = load i8* %10, align 1, !dbg !609
  %12 = load i8** %s, align 8, !dbg !609
  store i8 %11, i8* %12, align 1, !dbg !609
  %13 = load i8** %s, align 8, !dbg !609
  %14 = load i8* %13, align 1, !dbg !609
  %15 = icmp ne i8 %14, 0, !dbg !609
  %16 = zext i1 %15 to i8, !dbg !609
  %17 = load i8** %s, align 8, !dbg !609
  %18 = getelementptr inbounds i8* %17, i64 1, !dbg !609
  store i8* %18, i8** %s, align 8, !dbg !609
  %19 = load i8** %s2_addr, align 8, !dbg !609
  %20 = getelementptr inbounds i8* %19, i64 1, !dbg !609
  store i8* %20, i8** %s2_addr, align 8, !dbg !609
  %toBool3 = icmp ne i8 %16, 0, !dbg !609
  br i1 %toBool3, label %bb2, label %bb4, !dbg !609

bb4:                                              ; preds = %bb2
  %21 = load i8** %s1_addr, align 8, !dbg !610
  store i8* %21, i8** %0, align 8, !dbg !610
  %22 = load i8** %0, align 8, !dbg !610
  store i8* %22, i8** %retval, align 8, !dbg !610
  %retval5 = load i8** %retval, !dbg !610
  ret i8* %retval5, !dbg !610
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
  br label %bb, !dbg !611

bb:                                               ; preds = %bb4, %entry
  %1 = load i8** %s1_addr, align 8, !dbg !612
  %2 = load i8* %1, align 1, !dbg !612
  %3 = zext i8 %2 to i32, !dbg !612
  %4 = load i8** %s2_addr, align 8, !dbg !612
  %5 = load i8* %4, align 1, !dbg !612
  %6 = zext i8 %5 to i32, !dbg !612
  %7 = sub nsw i32 %3, %6, !dbg !612
  store i32 %7, i32* %r, align 4, !dbg !612
  %8 = load i32* %r, align 4, !dbg !612
  %9 = icmp eq i32 %8, 0, !dbg !612
  %10 = zext i1 %9 to i8, !dbg !612
  %11 = load i8** %s2_addr, align 8, !dbg !612
  %12 = getelementptr inbounds i8* %11, i64 1, !dbg !612
  store i8* %12, i8** %s2_addr, align 8, !dbg !612
  %toBool = icmp ne i8 %10, 0, !dbg !612
  %toBoolnot = xor i1 %toBool, true, !dbg !612
  %toBoolnot1 = zext i1 %toBoolnot to i8, !dbg !612
  %toBool3 = icmp ne i8 %toBoolnot1, 0, !dbg !612
  br i1 %toBool3, label %bb6, label %bb4, !dbg !612

bb4:                                              ; preds = %bb
  %13 = load i8** %s1_addr, align 8, !dbg !612
  %14 = load i8* %13, align 1, !dbg !612
  %15 = icmp ne i8 %14, 0, !dbg !612
  %16 = zext i1 %15 to i8, !dbg !612
  %17 = load i8** %s1_addr, align 8, !dbg !612
  %18 = getelementptr inbounds i8* %17, i64 1, !dbg !612
  store i8* %18, i8** %s1_addr, align 8, !dbg !612
  %toBool5 = icmp ne i8 %16, 0, !dbg !612
  br i1 %toBool5, label %bb, label %bb6, !dbg !612

bb6:                                              ; preds = %bb4, %bb
  %19 = load i32* %r, align 4, !dbg !614
  store i32 %19, i32* %0, align 4, !dbg !614
  %20 = load i32* %0, align 4, !dbg !614
  store i32 %20, i32* %retval, align 4, !dbg !614
  %retval7 = load i32* %retval, !dbg !614
  ret i32 %retval7, !dbg !614
}

define weak i32* @__errno_location() nounwind readnone {
entry:
  %retval = alloca i32*
  %0 = alloca i32*
  %"alloca point" = bitcast i32 0 to i32
  store i32* @errno, i32** %0, align 8, !dbg !615
  %1 = load i32** %0, align 8, !dbg !615
  store i32* %1, i32** %retval, align 8, !dbg !615
  %retval1 = load i32** %retval, !dbg !615
  ret i32* %retval1, !dbg !615
}

define weak i32* @__h_errno_location() nounwind readnone {
entry:
  %retval = alloca i32*
  %0 = alloca i32*
  %"alloca point" = bitcast i32 0 to i32
  store i32* @h_errno, i32** %0, align 8, !dbg !617
  %1 = load i32** %0, align 8, !dbg !617
  store i32* %1, i32** %retval, align 8, !dbg !617
  %retval1 = load i32** %retval, !dbg !617
  ret i32* %retval1, !dbg !617
}

define hidden void @_stdio_term() nounwind {
entry:
  %ptr = alloca %struct.FILE*
  %"alloca point" = bitcast i32 0 to i32
  %0 = load %struct.FILE** @_stdio_openlist, align 8, !dbg !619
  store %struct.FILE* %0, %struct.FILE** %ptr, align 8, !dbg !619
  br label %bb3, !dbg !619

bb:                                               ; preds = %bb3
  %1 = load %struct.FILE** %ptr, align 8, !dbg !621
  %2 = getelementptr inbounds %struct.FILE* %1, i32 0, i32 0, !dbg !621
  %3 = load i16* %2, align 8, !dbg !621
  %4 = zext i16 %3 to i32, !dbg !621
  %5 = and i32 %4, 64, !dbg !621
  %6 = icmp ne i32 %5, 0, !dbg !621
  br i1 %6, label %bb1, label %bb2, !dbg !621

bb1:                                              ; preds = %bb
  %7 = load %struct.FILE** %ptr, align 8, !dbg !622
  %8 = call i64 @__stdio_wcommit(%struct.FILE* noalias %7) nounwind, !dbg !622
  br label %bb2, !dbg !622

bb2:                                              ; preds = %bb1, %bb
  %9 = load %struct.FILE** %ptr, align 8, !dbg !619
  %10 = getelementptr inbounds %struct.FILE* %9, i32 0, i32 9, !dbg !619
  %11 = load %struct.FILE** %10, align 8, !dbg !619
  store %struct.FILE* %11, %struct.FILE** %ptr, align 8, !dbg !619
  br label %bb3, !dbg !619

bb3:                                              ; preds = %bb2, %entry
  %12 = load %struct.FILE** %ptr, align 8, !dbg !619
  %13 = icmp ne %struct.FILE* %12, null, !dbg !619
  br i1 %13, label %bb, label %return, !dbg !619

return:                                           ; preds = %bb3
  ret void, !dbg !623
}

define hidden void @_stdio_init() nounwind {
entry:
  %old_errno = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  %0 = load i32* @errno, align 4, !dbg !624
  store i32 %0, i32* %old_errno, align 4, !dbg !624
  %1 = load i16* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 0, i32 0), align 8, !dbg !626
  %2 = call i32 @isatty(i32 0) nounwind, !dbg !626
  %3 = sub nsw i32 1, %2, !dbg !626
  %4 = mul i32 %3, 256, !dbg !626
  %5 = trunc i32 %4 to i16, !dbg !626
  %6 = xor i16 %1, %5, !dbg !626
  store i16 %6, i16* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 0, i32 0), align 8, !dbg !626
  %7 = load i16* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 1, i32 0), align 8, !dbg !627
  %8 = call i32 @isatty(i32 1) nounwind, !dbg !627
  %9 = sub nsw i32 1, %8, !dbg !627
  %10 = mul i32 %9, 256, !dbg !627
  %11 = trunc i32 %10 to i16, !dbg !627
  %12 = xor i16 %7, %11, !dbg !627
  store i16 %12, i16* getelementptr inbounds ([3 x %struct.FILE]* @_stdio_streams, i64 0, i64 1, i32 0), align 8, !dbg !627
  %13 = load i32* %old_errno, align 4, !dbg !628
  store i32 %13, i32* @errno, align 4, !dbg !628
  ret void, !dbg !629
}

declare void @abort() noreturn nounwind

declare i32 @sigprocmask(i32, %struct.__sigset_t* noalias, %struct.__sigset_t* noalias) nounwind

declare void @_exit(i32) noreturn

define void @exit(i32 %rv) noreturn nounwind {
entry:
  %rv_addr = alloca i32, align 4
  %"alloca point" = bitcast i32 0 to i32
  store i32 %rv, i32* %rv_addr
  %0 = load void (i32)** @__exit_cleanup, align 8, !dbg !630
  %1 = icmp ne void (i32)* %0, null, !dbg !630
  br i1 %1, label %bb, label %bb1, !dbg !630

bb:                                               ; preds = %entry
  %2 = load void (i32)** @__exit_cleanup, align 8, !dbg !632
  %3 = load i32* %rv_addr, align 4, !dbg !632
  call void %2(i32 %3) nounwind, !dbg !632
  br label %bb1, !dbg !632

bb1:                                              ; preds = %bb, %entry
  call void @__uClibc_fini() nounwind, !dbg !633
  call void @_stdio_term() nounwind, !dbg !634
  %4 = load i32* %rv_addr, align 4, !dbg !635
  call void @_exit(i32 %4) noreturn nounwind, !dbg !635
  unreachable, !dbg !635
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
  %1 = load i8** %s1_addr, align 8, !dbg !636
  store i8* %1, i8** %r1, align 8, !dbg !636
  %2 = load i8** %s2_addr, align 8, !dbg !638
  store i8* %2, i8** %r2, align 8, !dbg !638
  br label %bb1, !dbg !638

bb:                                               ; preds = %bb1
  %3 = load i8** %r2, align 8, !dbg !639
  %4 = load i8* %3, align 1, !dbg !639
  %5 = load i8** %r1, align 8, !dbg !639
  store i8 %4, i8* %5, align 1, !dbg !639
  %6 = load i8** %r1, align 8, !dbg !639
  %7 = getelementptr inbounds i8* %6, i64 1, !dbg !639
  store i8* %7, i8** %r1, align 8, !dbg !639
  %8 = load i8** %r2, align 8, !dbg !639
  %9 = getelementptr inbounds i8* %8, i64 1, !dbg !639
  store i8* %9, i8** %r2, align 8, !dbg !639
  %10 = load i64* %n_addr, align 8, !dbg !640
  %11 = sub i64 %10, 1, !dbg !640
  store i64 %11, i64* %n_addr, align 8, !dbg !640
  br label %bb1, !dbg !640

bb1:                                              ; preds = %bb, %entry
  %12 = load i64* %n_addr, align 8, !dbg !641
  %13 = icmp ne i64 %12, 0, !dbg !641
  br i1 %13, label %bb, label %bb2, !dbg !641

bb2:                                              ; preds = %bb1
  %14 = load i8** %s1_addr, align 8, !dbg !642
  store i8* %14, i8** %0, align 8, !dbg !642
  %15 = load i8** %0, align 8, !dbg !642
  store i8* %15, i8** %retval, align 8, !dbg !642
  %retval3 = load i8** %retval, !dbg !642
  ret i8* %retval3, !dbg !642
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
  %1 = load i8** %s_addr, align 8, !dbg !643
  store i8* %1, i8** %p, align 8, !dbg !643
  br label %bb1, !dbg !643

bb:                                               ; preds = %bb1
  %2 = load i32* %c_addr, align 4, !dbg !645
  %3 = trunc i32 %2 to i8, !dbg !645
  %4 = load i8** %p, align 8, !dbg !645
  store i8 %3, i8* %4, align 1, !dbg !645
  %5 = load i8** %p, align 8, !dbg !645
  %6 = getelementptr inbounds i8* %5, i64 1, !dbg !645
  store i8* %6, i8** %p, align 8, !dbg !645
  %7 = load i64* %n_addr, align 8, !dbg !646
  %8 = sub i64 %7, 1, !dbg !646
  store i64 %8, i64* %n_addr, align 8, !dbg !646
  br label %bb1, !dbg !646

bb1:                                              ; preds = %bb, %entry
  %9 = load i64* %n_addr, align 8, !dbg !647
  %10 = icmp ne i64 %9, 0, !dbg !647
  br i1 %10, label %bb, label %bb2, !dbg !647

bb2:                                              ; preds = %bb1
  %11 = load i8** %s_addr, align 8, !dbg !648
  store i8* %11, i8** %0, align 8, !dbg !648
  %12 = load i8** %0, align 8, !dbg !648
  store i8* %12, i8** %retval, align 8, !dbg !648
  %retval3 = load i8** %retval, !dbg !648
  ret i8* %retval3, !dbg !648
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
  %1 = load i32* %__sig_addr, align 4, !dbg !649
  %2 = sub nsw i32 %1, 1, !dbg !649
  %3 = and i32 %2, 63, !dbg !649
  %.cast = zext i32 %3 to i64, !dbg !649
  %int_cast_to_i641 = bitcast i64 %.cast to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i641), !dbg !649
  %4 = shl i64 1, %.cast, !dbg !649
  store i64 %4, i64* %__mask, align 8, !dbg !649
  %5 = load i32* %__sig_addr, align 4, !dbg !649
  %6 = sub nsw i32 %5, 1, !dbg !649
  %7 = sext i32 %6 to i64, !dbg !649
  %int_cast_to_i64 = bitcast i64 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !649
  %8 = udiv i64 %7, 64, !dbg !649
  store i64 %8, i64* %__word, align 8, !dbg !649
  %9 = load i64* %__word, align 8, !dbg !649
  %10 = load %struct.__sigset_t** %__set_addr, align 8, !dbg !649
  %11 = getelementptr inbounds %struct.__sigset_t* %10, i32 0, i32 0, !dbg !649
  %12 = getelementptr inbounds [16 x i64]* %11, i64 0, i64 %9, !dbg !649
  %13 = load i64* %12, align 8, !dbg !649
  %14 = load i64* %__mask, align 8, !dbg !649
  %15 = and i64 %13, %14, !dbg !649
  %16 = icmp ne i64 %15, 0, !dbg !649
  %17 = zext i1 %16 to i32, !dbg !649
  store i32 %17, i32* %0, align 4, !dbg !649
  %18 = load i32* %0, align 4, !dbg !649
  store i32 %18, i32* %retval, align 4, !dbg !649
  %retval1 = load i32* %retval, !dbg !649
  ret i32 %retval1, !dbg !650
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
  %1 = load i32* %__sig_addr, align 4, !dbg !652
  %2 = sub nsw i32 %1, 1, !dbg !652
  %3 = and i32 %2, 63, !dbg !652
  %.cast = zext i32 %3 to i64, !dbg !652
  %int_cast_to_i641 = bitcast i64 %.cast to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i641), !dbg !652
  %4 = shl i64 1, %.cast, !dbg !652
  store i64 %4, i64* %__mask, align 8, !dbg !652
  %5 = load i32* %__sig_addr, align 4, !dbg !652
  %6 = sub nsw i32 %5, 1, !dbg !652
  %7 = sext i32 %6 to i64, !dbg !652
  %int_cast_to_i64 = bitcast i64 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !652
  %8 = udiv i64 %7, 64, !dbg !652
  store i64 %8, i64* %__word, align 8, !dbg !652
  %9 = load i64* %__word, align 8, !dbg !652
  %10 = load i64* %__word, align 8, !dbg !652
  %11 = load %struct.__sigset_t** %__set_addr, align 8, !dbg !652
  %12 = getelementptr inbounds %struct.__sigset_t* %11, i32 0, i32 0, !dbg !652
  %13 = getelementptr inbounds [16 x i64]* %12, i64 0, i64 %10, !dbg !652
  %14 = load i64* %13, align 8, !dbg !652
  %15 = load i64* %__mask, align 8, !dbg !652
  %16 = or i64 %14, %15, !dbg !652
  %17 = load %struct.__sigset_t** %__set_addr, align 8, !dbg !652
  %18 = getelementptr inbounds %struct.__sigset_t* %17, i32 0, i32 0, !dbg !652
  %19 = getelementptr inbounds [16 x i64]* %18, i64 0, i64 %9, !dbg !652
  store i64 %16, i64* %19, align 8, !dbg !652
  store i32 0, i32* %0, align 4, !dbg !652
  %20 = load i32* %0, align 4, !dbg !652
  store i32 %20, i32* %retval, align 4, !dbg !652
  %retval1 = load i32* %retval, !dbg !652
  ret i32 %retval1, !dbg !653
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
  %1 = load i32* %__sig_addr, align 4, !dbg !655
  %2 = sub nsw i32 %1, 1, !dbg !655
  %3 = and i32 %2, 63, !dbg !655
  %.cast = zext i32 %3 to i64, !dbg !655
  %int_cast_to_i641 = bitcast i64 %.cast to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i641), !dbg !655
  %4 = shl i64 1, %.cast, !dbg !655
  store i64 %4, i64* %__mask, align 8, !dbg !655
  %5 = load i32* %__sig_addr, align 4, !dbg !655
  %6 = sub nsw i32 %5, 1, !dbg !655
  %7 = sext i32 %6 to i64, !dbg !655
  %int_cast_to_i64 = bitcast i64 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !655
  %8 = udiv i64 %7, 64, !dbg !655
  store i64 %8, i64* %__word, align 8, !dbg !655
  %9 = load i64* %__word, align 8, !dbg !655
  %10 = load i64* %__word, align 8, !dbg !655
  %11 = load %struct.__sigset_t** %__set_addr, align 8, !dbg !655
  %12 = getelementptr inbounds %struct.__sigset_t* %11, i32 0, i32 0, !dbg !655
  %13 = getelementptr inbounds [16 x i64]* %12, i64 0, i64 %10, !dbg !655
  %14 = load i64* %13, align 8, !dbg !655
  %15 = load i64* %__mask, align 8, !dbg !655
  %not = xor i64 %15, -1, !dbg !655
  %16 = and i64 %14, %not, !dbg !655
  %17 = load %struct.__sigset_t** %__set_addr, align 8, !dbg !655
  %18 = getelementptr inbounds %struct.__sigset_t* %17, i32 0, i32 0, !dbg !655
  %19 = getelementptr inbounds [16 x i64]* %18, i64 0, i64 %9, !dbg !655
  store i64 %16, i64* %19, align 8, !dbg !655
  store i32 0, i32* %0, align 4, !dbg !655
  %20 = load i32* %0, align 4, !dbg !655
  store i32 %20, i32* %retval, align 4, !dbg !655
  %retval2 = load i32* %retval, !dbg !655
  ret i32 %retval2, !dbg !656
}

define hidden i64 @__stdio_wcommit(%struct.FILE* noalias %stream) nounwind {
entry:
  %stream_addr = alloca %struct.FILE*, align 8
  %retval = alloca i64
  %0 = alloca i64
  %bufsize = alloca i64
  %"alloca point" = bitcast i32 0 to i32
  store %struct.FILE* %stream, %struct.FILE** %stream_addr
  %1 = load %struct.FILE** %stream_addr, align 8, !dbg !658
  %2 = getelementptr inbounds %struct.FILE* %1, i32 0, i32 5, !dbg !658
  %3 = load i8** %2, align 8, !dbg !658
  %4 = ptrtoint i8* %3 to i64, !dbg !658
  %5 = load %struct.FILE** %stream_addr, align 8, !dbg !658
  %6 = getelementptr inbounds %struct.FILE* %5, i32 0, i32 3, !dbg !658
  %7 = load i8** %6, align 8, !dbg !658
  %8 = ptrtoint i8* %7 to i64, !dbg !658
  %9 = sub nsw i64 %4, %8, !dbg !658
  store i64 %9, i64* %bufsize, align 8, !dbg !658
  %10 = load i64* %bufsize, align 8, !dbg !658
  %11 = icmp ne i64 %10, 0, !dbg !658
  br i1 %11, label %bb, label %bb1, !dbg !658

bb:                                               ; preds = %entry
  %12 = load %struct.FILE** %stream_addr, align 8, !dbg !660
  %13 = getelementptr inbounds %struct.FILE* %12, i32 0, i32 3, !dbg !660
  %14 = load i8** %13, align 8, !dbg !660
  %15 = load %struct.FILE** %stream_addr, align 8, !dbg !660
  %16 = getelementptr inbounds %struct.FILE* %15, i32 0, i32 5, !dbg !660
  store i8* %14, i8** %16, align 8, !dbg !660
  %17 = load %struct.FILE** %stream_addr, align 8, !dbg !661
  %18 = getelementptr inbounds %struct.FILE* %17, i32 0, i32 3, !dbg !661
  %19 = load i8** %18, align 8, !dbg !661
  %20 = load %struct.FILE** %stream_addr, align 8, !dbg !661
  %21 = load i64* %bufsize, align 8, !dbg !661
  %22 = call i64 @__stdio_WRITE(%struct.FILE* %20, i8* %19, i64 %21) nounwind, !dbg !661
  br label %bb1, !dbg !661

bb1:                                              ; preds = %bb, %entry
  %23 = load %struct.FILE** %stream_addr, align 8, !dbg !662
  %24 = getelementptr inbounds %struct.FILE* %23, i32 0, i32 5, !dbg !662
  %25 = load i8** %24, align 8, !dbg !662
  %26 = ptrtoint i8* %25 to i64, !dbg !662
  %27 = load %struct.FILE** %stream_addr, align 8, !dbg !662
  %28 = getelementptr inbounds %struct.FILE* %27, i32 0, i32 3, !dbg !662
  %29 = load i8** %28, align 8, !dbg !662
  %30 = ptrtoint i8* %29 to i64, !dbg !662
  %31 = sub nsw i64 %26, %30, !dbg !662
  store i64 %31, i64* %0, align 8, !dbg !662
  %32 = load i64* %0, align 8, !dbg !662
  store i64 %32, i64* %retval, align 8, !dbg !662
  %retval2 = load i64* %retval, !dbg !662
  ret i64 %retval2, !dbg !662
}

define i32 @isatty(i32 %fd) nounwind {
entry:
  %fd_addr = alloca i32, align 4
  %retval = alloca i32
  %0 = alloca i32
  %term = alloca %struct.termios
  %"alloca point" = bitcast i32 0 to i32
  store i32 %fd, i32* %fd_addr
  %1 = load i32* %fd_addr, align 4, !dbg !663
  %2 = call i32 @tcgetattr(i32 %1, %struct.termios* %term) nounwind, !dbg !663
  %3 = icmp eq i32 %2, 0, !dbg !663
  %4 = zext i1 %3 to i32, !dbg !663
  store i32 %4, i32* %0, align 4, !dbg !663
  %5 = load i32* %0, align 4, !dbg !663
  store i32 %5, i32* %retval, align 4, !dbg !663
  %retval1 = load i32* %retval, !dbg !663
  ret i32 %retval1, !dbg !663
}

define hidden i32 @__raise(i32 %signo) nounwind {
entry:
  %signo_addr = alloca i32, align 4
  %retval = alloca i32
  %0 = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i32 %signo, i32* %signo_addr
  %1 = call i32 @getpid() nounwind, !dbg !665
  %2 = load i32* %signo_addr, align 4, !dbg !665
  %3 = call i32 @kill(i32 %1, i32 %2) nounwind, !dbg !665
  store i32 %3, i32* %0, align 4, !dbg !665
  %4 = load i32* %0, align 4, !dbg !665
  store i32 %4, i32* %retval, align 4, !dbg !665
  %retval1 = load i32* %retval, !dbg !665
  ret i32 %retval1, !dbg !665
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
  %1 = load %struct.sigaction** %act_addr, align 8, !dbg !667
  %2 = icmp ne %struct.sigaction* %1, null, !dbg !667
  br i1 %2, label %bb, label %bb1, !dbg !667

bb:                                               ; preds = %entry
  %3 = load %struct.sigaction** %act_addr, align 8, !dbg !669
  %4 = getelementptr inbounds %struct.sigaction* %3, i32 0, i32 0, !dbg !669
  %5 = getelementptr inbounds %0* %4, i32 0, i32 0, !dbg !669
  %6 = load void (i32)** %5, align 8, !dbg !669
  %7 = getelementptr inbounds %struct.kernel_sigaction* %kact, i32 0, i32 0, !dbg !669
  store void (i32)* %6, void (i32)** %7, align 8, !dbg !669
  %8 = load %struct.sigaction** %act_addr, align 8, !dbg !670
  %9 = getelementptr inbounds %struct.sigaction* %8, i32 0, i32 1, !dbg !670
  %10 = getelementptr inbounds %struct.kernel_sigaction* %kact, i32 0, i32 3, !dbg !670
  %11 = bitcast %struct.__sigset_t* %10 to i8*, !dbg !670
  %12 = bitcast %struct.__sigset_t* %9 to i8*, !dbg !670
  %13 = call i8* @memcpy(i8* noalias %11, i8* noalias %12, i64 128) nounwind, !dbg !670
  %14 = load %struct.sigaction** %act_addr, align 8, !dbg !671
  %15 = getelementptr inbounds %struct.sigaction* %14, i32 0, i32 2, !dbg !671
  %16 = load i32* %15, align 8, !dbg !671
  %17 = sext i32 %16 to i64, !dbg !671
  %18 = getelementptr inbounds %struct.kernel_sigaction* %kact, i32 0, i32 1, !dbg !671
  store i64 %17, i64* %18, align 8, !dbg !671
  %19 = load %struct.sigaction** %act_addr, align 8, !dbg !672
  %20 = getelementptr inbounds %struct.sigaction* %19, i32 0, i32 3, !dbg !672
  %21 = load void ()** %20, align 8, !dbg !672
  %22 = getelementptr inbounds %struct.kernel_sigaction* %kact, i32 0, i32 2, !dbg !672
  store void ()* %21, void ()** %22, align 8, !dbg !672
  br label %bb1, !dbg !672

bb1:                                              ; preds = %bb, %entry
  %23 = load %struct.sigaction** %oact_addr, align 8, !dbg !673
  %24 = icmp ne %struct.sigaction* %23, null, !dbg !673
  br i1 %24, label %bb2, label %bb3, !dbg !673

bb2:                                              ; preds = %bb1
  store %struct.kernel_sigaction* %koact, %struct.kernel_sigaction** %iftmp.0, align 8, !dbg !673
  br label %bb4, !dbg !673

bb3:                                              ; preds = %bb1
  store %struct.kernel_sigaction* null, %struct.kernel_sigaction** %iftmp.0, align 8, !dbg !673
  br label %bb4, !dbg !673

bb4:                                              ; preds = %bb3, %bb2
  %25 = load %struct.sigaction** %act_addr, align 8, !dbg !673
  %26 = icmp ne %struct.sigaction* %25, null, !dbg !673
  br i1 %26, label %bb5, label %bb6, !dbg !673

bb5:                                              ; preds = %bb4
  store %struct.kernel_sigaction* %kact, %struct.kernel_sigaction** %iftmp.1, align 8, !dbg !673
  br label %bb7, !dbg !673

bb6:                                              ; preds = %bb4
  store %struct.kernel_sigaction* null, %struct.kernel_sigaction** %iftmp.1, align 8, !dbg !673
  br label %bb7, !dbg !673

bb7:                                              ; preds = %bb6, %bb5
  %27 = load i32* %sig_addr, align 4, !dbg !673
  %28 = load %struct.kernel_sigaction** %iftmp.1, align 8, !dbg !673
  %29 = load %struct.kernel_sigaction** %iftmp.0, align 8, !dbg !673
  %30 = call i32 @__syscall_rt_sigaction(i32 %27, %struct.kernel_sigaction* %28, %struct.kernel_sigaction* %29, i64 8) nounwind, !dbg !673
  store i32 %30, i32* %result, align 4, !dbg !673
  %31 = load %struct.sigaction** %oact_addr, align 8, !dbg !674
  %32 = icmp ne %struct.sigaction* %31, null, !dbg !674
  br i1 %32, label %bb8, label %bb10, !dbg !674

bb8:                                              ; preds = %bb7
  %33 = load i32* %result, align 4, !dbg !674
  %34 = icmp sge i32 %33, 0, !dbg !674
  br i1 %34, label %bb9, label %bb10, !dbg !674

bb9:                                              ; preds = %bb8
  %35 = getelementptr inbounds %struct.kernel_sigaction* %koact, i32 0, i32 0, !dbg !675
  %36 = load void (i32)** %35, align 8, !dbg !675
  %37 = load %struct.sigaction** %oact_addr, align 8, !dbg !675
  %38 = getelementptr inbounds %struct.sigaction* %37, i32 0, i32 0, !dbg !675
  %39 = getelementptr inbounds %0* %38, i32 0, i32 0, !dbg !675
  store void (i32)* %36, void (i32)** %39, align 8, !dbg !675
  %40 = load %struct.sigaction** %oact_addr, align 8, !dbg !676
  %41 = getelementptr inbounds %struct.sigaction* %40, i32 0, i32 1, !dbg !676
  %42 = bitcast %struct.__sigset_t* %41 to i8*, !dbg !676
  %43 = getelementptr inbounds %struct.kernel_sigaction* %koact, i32 0, i32 3, !dbg !676
  %44 = bitcast %struct.__sigset_t* %43 to i8*, !dbg !676
  %45 = call i8* @memcpy(i8* noalias %42, i8* noalias %44, i64 128) nounwind, !dbg !676
  %46 = getelementptr inbounds %struct.kernel_sigaction* %koact, i32 0, i32 1, !dbg !677
  %47 = load i64* %46, align 8, !dbg !677
  %48 = trunc i64 %47 to i32, !dbg !677
  %49 = load %struct.sigaction** %oact_addr, align 8, !dbg !677
  %50 = getelementptr inbounds %struct.sigaction* %49, i32 0, i32 2, !dbg !677
  store i32 %48, i32* %50, align 8, !dbg !677
  %51 = getelementptr inbounds %struct.kernel_sigaction* %koact, i32 0, i32 2, !dbg !678
  %52 = load void ()** %51, align 8, !dbg !678
  %53 = load %struct.sigaction** %oact_addr, align 8, !dbg !678
  %54 = getelementptr inbounds %struct.sigaction* %53, i32 0, i32 3, !dbg !678
  store void ()* %52, void ()** %54, align 8, !dbg !678
  br label %bb10, !dbg !678

bb10:                                             ; preds = %bb9, %bb8, %bb7
  %55 = load i32* %result, align 4, !dbg !679
  store i32 %55, i32* %0, align 4, !dbg !679
  %56 = load i32* %0, align 4, !dbg !679
  store i32 %56, i32* %retval, align 4, !dbg !679
  %retval11 = load i32* %retval, !dbg !679
  ret i32 %retval11, !dbg !679
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
  %1 = load i64* %bufsize_addr, align 8, !dbg !680
  store i64 %1, i64* %todo, align 8, !dbg !680
  br label %bb, !dbg !680

bb:                                               ; preds = %bb6, %entry
  %2 = load i64* %todo, align 8, !dbg !682
  %3 = icmp eq i64 %2, 0, !dbg !682
  br i1 %3, label %bb1, label %bb2, !dbg !682

bb1:                                              ; preds = %bb
  %4 = load i64* %bufsize_addr, align 8, !dbg !683
  store i64 %4, i64* %0, align 8, !dbg !683
  br label %bb16, !dbg !683

bb2:                                              ; preds = %bb
  %5 = load i64* %todo, align 8, !dbg !684
  %6 = icmp sge i64 %5, 0, !dbg !684
  br i1 %6, label %bb3, label %bb4, !dbg !684

bb3:                                              ; preds = %bb2
  %7 = load i64* %todo, align 8, !dbg !684
  store i64 %7, i64* %iftmp.0, align 8, !dbg !684
  br label %bb5, !dbg !684

bb4:                                              ; preds = %bb2
  store i64 9223372036854775807, i64* %iftmp.0, align 8, !dbg !684
  br label %bb5, !dbg !684

bb5:                                              ; preds = %bb4, %bb3
  %8 = load i64* %iftmp.0, align 8, !dbg !684
  store i64 %8, i64* %stodo, align 8, !dbg !684
  %9 = load i64* %stodo, align 8, !dbg !685
  %10 = load %struct.FILE** %stream_addr, align 8, !dbg !685
  %11 = getelementptr inbounds %struct.FILE* %10, i32 0, i32 2, !dbg !685
  %12 = load i32* %11, align 4, !dbg !685
  %13 = load i8** %buf_addr, align 8, !dbg !685
  %14 = call i64 @write(i32 %12, i8* %13, i64 %9) nounwind, !dbg !685
  store i64 %14, i64* %rv, align 8, !dbg !685
  %15 = load i64* %rv, align 8, !dbg !685
  %16 = icmp sge i64 %15, 0, !dbg !685
  br i1 %16, label %bb6, label %bb7, !dbg !685

bb6:                                              ; preds = %bb5
  %17 = load i64* %rv, align 8, !dbg !686
  %18 = load i64* %todo, align 8, !dbg !686
  %19 = sub i64 %18, %17, !dbg !686
  store i64 %19, i64* %todo, align 8, !dbg !686
  %20 = load i8** %buf_addr, align 8, !dbg !687
  %21 = load i64* %rv, align 8, !dbg !687
  %22 = getelementptr inbounds i8* %20, i64 %21, !dbg !687
  store i8* %22, i8** %buf_addr, align 8, !dbg !687
  br label %bb, !dbg !687

bb7:                                              ; preds = %bb5
  %23 = load %struct.FILE** %stream_addr, align 8, !dbg !688
  %24 = getelementptr inbounds %struct.FILE* %23, i32 0, i32 0, !dbg !688
  %25 = load i16* %24, align 8, !dbg !688
  %26 = or i16 %25, 8, !dbg !688
  %27 = load %struct.FILE** %stream_addr, align 8, !dbg !688
  %28 = getelementptr inbounds %struct.FILE* %27, i32 0, i32 0, !dbg !688
  store i16 %26, i16* %28, align 8, !dbg !688
  %29 = load %struct.FILE** %stream_addr, align 8, !dbg !689
  %30 = getelementptr inbounds %struct.FILE* %29, i32 0, i32 4, !dbg !689
  %31 = load i8** %30, align 8, !dbg !689
  %32 = ptrtoint i8* %31 to i64, !dbg !689
  %33 = load %struct.FILE** %stream_addr, align 8, !dbg !689
  %34 = getelementptr inbounds %struct.FILE* %33, i32 0, i32 3, !dbg !689
  %35 = load i8** %34, align 8, !dbg !689
  %36 = ptrtoint i8* %35 to i64, !dbg !689
  %37 = sub nsw i64 %32, %36, !dbg !689
  store i64 %37, i64* %stodo, align 8, !dbg !689
  %38 = load i64* %stodo, align 8, !dbg !689
  %39 = icmp ne i64 %38, 0, !dbg !689
  br i1 %39, label %bb8, label %bb15, !dbg !689

bb8:                                              ; preds = %bb7
  %40 = load i64* %stodo, align 8, !dbg !690
  %41 = load i64* %todo, align 8, !dbg !690
  %42 = icmp ugt i64 %40, %41, !dbg !690
  br i1 %42, label %bb9, label %bb10, !dbg !690

bb9:                                              ; preds = %bb8
  %43 = load i64* %todo, align 8, !dbg !692
  store i64 %43, i64* %stodo, align 8, !dbg !692
  br label %bb10, !dbg !692

bb10:                                             ; preds = %bb9, %bb8
  %44 = load %struct.FILE** %stream_addr, align 8, !dbg !693
  %45 = getelementptr inbounds %struct.FILE* %44, i32 0, i32 3, !dbg !693
  %46 = load i8** %45, align 8, !dbg !693
  store i8* %46, i8** %s, align 8, !dbg !693
  br label %bb11, !dbg !693

bb11:                                             ; preds = %bb13, %bb10
  %47 = load i8** %buf_addr, align 8, !dbg !694
  %48 = load i8* %47, align 1, !dbg !694
  %49 = load i8** %s, align 8, !dbg !694
  store i8 %48, i8* %49, align 1, !dbg !694
  %50 = load i8** %s, align 8, !dbg !694
  %51 = load i8* %50, align 1, !dbg !694
  %52 = icmp eq i8 %51, 10, !dbg !694
  br i1 %52, label %bb12, label %bb13, !dbg !694

bb12:                                             ; preds = %bb11
  %53 = load %struct.FILE** %stream_addr, align 8, !dbg !694
  %54 = getelementptr inbounds %struct.FILE* %53, i32 0, i32 0, !dbg !694
  %55 = load i16* %54, align 8, !dbg !694
  %56 = zext i16 %55 to i32, !dbg !694
  %57 = and i32 %56, 256, !dbg !694
  %58 = icmp ne i32 %57, 0, !dbg !694
  br i1 %58, label %bb14, label %bb13, !dbg !694

bb13:                                             ; preds = %bb12, %bb11
  %59 = load i8** %s, align 8, !dbg !695
  %60 = getelementptr inbounds i8* %59, i64 1, !dbg !695
  store i8* %60, i8** %s, align 8, !dbg !695
  %61 = load i8** %buf_addr, align 8, !dbg !696
  %62 = getelementptr inbounds i8* %61, i64 1, !dbg !696
  store i8* %62, i8** %buf_addr, align 8, !dbg !696
  %63 = load i64* %stodo, align 8, !dbg !697
  %64 = sub nsw i64 %63, 1, !dbg !697
  store i64 %64, i64* %stodo, align 8, !dbg !697
  %65 = load i64* %stodo, align 8, !dbg !697
  %66 = icmp ne i64 %65, 0, !dbg !697
  br i1 %66, label %bb11, label %bb14, !dbg !697

bb14:                                             ; preds = %bb13, %bb12
  %67 = load %struct.FILE** %stream_addr, align 8, !dbg !698
  %68 = getelementptr inbounds %struct.FILE* %67, i32 0, i32 5, !dbg !698
  %69 = load i8** %s, align 8, !dbg !698
  store i8* %69, i8** %68, align 8, !dbg !698
  %70 = load i8** %s, align 8, !dbg !699
  %71 = ptrtoint i8* %70 to i64, !dbg !699
  %72 = load %struct.FILE** %stream_addr, align 8, !dbg !699
  %73 = getelementptr inbounds %struct.FILE* %72, i32 0, i32 3, !dbg !699
  %74 = load i8** %73, align 8, !dbg !699
  %75 = ptrtoint i8* %74 to i64, !dbg !699
  %76 = sub nsw i64 %71, %75, !dbg !699
  %77 = load i64* %todo, align 8, !dbg !699
  %78 = sub i64 %77, %76, !dbg !699
  store i64 %78, i64* %todo, align 8, !dbg !699
  br label %bb15, !dbg !699

bb15:                                             ; preds = %bb14, %bb7
  %79 = load i64* %bufsize_addr, align 8, !dbg !700
  %80 = load i64* %todo, align 8, !dbg !700
  %81 = sub i64 %79, %80, !dbg !700
  store i64 %81, i64* %0, align 8, !dbg !700
  br label %bb16, !dbg !700

bb16:                                             ; preds = %bb15, %bb1
  %82 = load i64* %0, align 8, !dbg !683
  store i64 %82, i64* %retval, align 8, !dbg !683
  %retval17 = load i64* %retval, !dbg !683
  ret i64 %retval17, !dbg !683
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
  %1 = load i32* %fd_addr, align 4, !dbg !701
  %2 = call i32 (i32, i64, ...)* @ioctl(i32 %1, i64 21505, %struct.__kernel_termios* %k_termios) nounwind, !dbg !701
  store i32 %2, i32* %retval1, align 4, !dbg !701
  %3 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 0, !dbg !703
  %4 = load i32* %3, align 4, !dbg !703
  %5 = load %struct.termios** %termios_p_addr, align 8, !dbg !703
  %6 = getelementptr inbounds %struct.termios* %5, i32 0, i32 0, !dbg !703
  store i32 %4, i32* %6, align 4, !dbg !703
  %7 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 1, !dbg !704
  %8 = load i32* %7, align 4, !dbg !704
  %9 = load %struct.termios** %termios_p_addr, align 8, !dbg !704
  %10 = getelementptr inbounds %struct.termios* %9, i32 0, i32 1, !dbg !704
  store i32 %8, i32* %10, align 4, !dbg !704
  %11 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 2, !dbg !705
  %12 = load i32* %11, align 4, !dbg !705
  %13 = load %struct.termios** %termios_p_addr, align 8, !dbg !705
  %14 = getelementptr inbounds %struct.termios* %13, i32 0, i32 2, !dbg !705
  store i32 %12, i32* %14, align 4, !dbg !705
  %15 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 3, !dbg !706
  %16 = load i32* %15, align 4, !dbg !706
  %17 = load %struct.termios** %termios_p_addr, align 8, !dbg !706
  %18 = getelementptr inbounds %struct.termios* %17, i32 0, i32 3, !dbg !706
  store i32 %16, i32* %18, align 4, !dbg !706
  %19 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 4, !dbg !707
  %20 = load i8* %19, align 4, !dbg !707
  %21 = load %struct.termios** %termios_p_addr, align 8, !dbg !707
  %22 = getelementptr inbounds %struct.termios* %21, i32 0, i32 4, !dbg !707
  store i8 %20, i8* %22, align 4, !dbg !707
  %23 = load %struct.termios** %termios_p_addr, align 8, !dbg !708
  %24 = getelementptr inbounds %struct.termios* %23, i32 0, i32 5, !dbg !708
  %25 = getelementptr inbounds [32 x i8]* %24, i64 0, i64 0, !dbg !708
  %26 = getelementptr inbounds %struct.__kernel_termios* %k_termios, i32 0, i32 5, !dbg !708
  %27 = getelementptr inbounds [19 x i8]* %26, i64 0, i64 0, !dbg !708
  %28 = call i8* @mempcpy(i8* noalias %25, i8* noalias %27, i64 19) nounwind, !dbg !708
  %29 = call i8* @memset(i8* %28, i32 0, i64 13) nounwind, !dbg !708
  %30 = load i32* %retval1, align 4, !dbg !709
  store i32 %30, i32* %0, align 4, !dbg !709
  %31 = load i32* %0, align 4, !dbg !709
  store i32 %31, i32* %retval, align 4, !dbg !709
  %retval2 = load i32* %retval, !dbg !709
  ret i32 %retval2, !dbg !709
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
  %1 = load i8** %s1_addr, align 8, !dbg !710
  store i8* %1, i8** %r1, align 8, !dbg !710
  %2 = load i8** %s2_addr, align 8, !dbg !712
  store i8* %2, i8** %r2, align 8, !dbg !712
  br label %bb1, !dbg !712

bb:                                               ; preds = %bb1
  %3 = load i8** %r2, align 8, !dbg !713
  %4 = load i8* %3, align 1, !dbg !713
  %5 = load i8** %r1, align 8, !dbg !713
  store i8 %4, i8* %5, align 1, !dbg !713
  %6 = load i8** %r1, align 8, !dbg !713
  %7 = getelementptr inbounds i8* %6, i64 1, !dbg !713
  store i8* %7, i8** %r1, align 8, !dbg !713
  %8 = load i8** %r2, align 8, !dbg !713
  %9 = getelementptr inbounds i8* %8, i64 1, !dbg !713
  store i8* %9, i8** %r2, align 8, !dbg !713
  %10 = load i64* %n_addr, align 8, !dbg !714
  %11 = sub i64 %10, 1, !dbg !714
  store i64 %11, i64* %n_addr, align 8, !dbg !714
  br label %bb1, !dbg !714

bb1:                                              ; preds = %bb, %entry
  %12 = load i64* %n_addr, align 8, !dbg !715
  %13 = icmp ne i64 %12, 0, !dbg !715
  br i1 %13, label %bb, label %bb2, !dbg !715

bb2:                                              ; preds = %bb1
  %14 = load i8** %r1, align 8, !dbg !716
  store i8* %14, i8** %0, align 8, !dbg !716
  %15 = load i8** %0, align 8, !dbg !716
  store i8* %15, i8** %retval, align 8, !dbg !716
  %retval3 = load i8** %retval, !dbg !716
  ret i8* %retval3, !dbg !716
}

define i32 @main(i32, i8**) {
entry:
  call void @__uClibc_main(i32 (i32, i8**, i8**)* bitcast (i32 ()* @__user_main to i32 (i32, i8**, i8**)*), i32 %0, i8** %1, void ()* null, void ()* null, void ()* null, i8* null)
  unreachable
}

define void @klee_div_zero_check(i64 %z) nounwind {
entry:
  %0 = icmp eq i64 %z, 0, !dbg !717
  br i1 %0, label %bb, label %return, !dbg !717

bb:                                               ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str25, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str126, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str227, i64 0, i64 0)) noreturn nounwind, !
  unreachable, !dbg !719

return:                                           ; preds = %entry
  ret void, !dbg !720
}

declare void @klee_report_error(i8*, i32, i8*, i8*) noreturn

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i32 @klee_int(i8* %name) nounwind {
entry:
  %x = alloca i32, align 4
  %x1 = bitcast i32* %x to i8*, !dbg !721
  call void @klee_make_symbolic(i8* %x1, i64 4, i8* %name) nounwind, !dbg !721
  %0 = load i32* %x, align 4, !dbg !722
  ret i32 %0, !dbg !722
}

define void @klee_overshift_check(i64 %bitWidth, i64 %shift) nounwind {
entry:
  %0 = icmp ult i64 %shift, %bitWidth, !dbg !723
  br i1 %0, label %return, label %bb, !dbg !723

bb:                                               ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str328, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str1429, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str2530, i64 0, i64 0)) noreturn nounwind,
  unreachable, !dbg !725

return:                                           ; preds = %entry
  ret void, !dbg !726
}

define i32 @klee_range(i32 %start, i32 %end, i8* %name) nounwind {
entry:
  %x = alloca i32, align 4
  %0 = icmp slt i32 %start, %end, !dbg !727
  br i1 %0, label %bb1, label %bb, !dbg !727

bb:                                               ; preds = %entry
  call void @klee_report_error(i8* getelementptr inbounds ([13 x i8]* @.str6, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) noreturn nounwind, !dbg !728
  unreachable, !dbg !728

bb1:                                              ; preds = %entry
  %1 = add nsw i32 %start, 1, !dbg !729
  %2 = icmp eq i32 %1, %end, !dbg !729
  br i1 %2, label %bb8, label %bb3, !dbg !729

bb3:                                              ; preds = %bb1
  %x4 = bitcast i32* %x to i8*, !dbg !730
  call void @klee_make_symbolic(i8* %x4, i64 4, i8* %name) nounwind, !dbg !730
  %3 = icmp eq i32 %start, 0, !dbg !731
  %4 = load i32* %x, align 4, !dbg !732
  br i1 %3, label %bb5, label %bb6, !dbg !731

bb5:                                              ; preds = %bb3
  %5 = icmp ult i32 %4, %end, !dbg !732
  %6 = zext i1 %5 to i64, !dbg !732
  call void @klee_assume(i64 %6) nounwind, !dbg !732
  br label %bb7, !dbg !732

bb6:                                              ; preds = %bb3
  %7 = icmp sge i32 %4, %start, !dbg !733
  %8 = zext i1 %7 to i64, !dbg !733
  call void @klee_assume(i64 %8) nounwind, !dbg !733
  %9 = load i32* %x, align 4, !dbg !734
  %10 = icmp slt i32 %9, %end, !dbg !734
  %11 = zext i1 %10 to i64, !dbg !734
  call void @klee_assume(i64 %11) nounwind, !dbg !734
  br label %bb7, !dbg !734

bb7:                                              ; preds = %bb6, %bb5
  %12 = load i32* %x, align 4, !dbg !735
  br label %bb8, !dbg !735

bb8:                                              ; preds = %bb7, %bb1
  %.0 = phi i32 [ %12, %bb7 ], [ %start, %bb1 ]
  ret i32 %.0, !dbg !736
}

declare void @klee_assume(i64)

!llvm.dbg.sp = !{!0, !8, !11, !17, !23, !26, !29, !30, !41, !50, !59, !66, !73, !77, !78, !82, !89, !98, !108, !124, !125, !126, !168, !174, !180, !278, !320, !346, !355, !361, !370, !376, !385, !394, !403, !412}
!llvm.dbg.gv = !{!422, !423, !426, !427, !431, !432, !433, !434, !470, !472, !473, !474, !475, !476, !477, !479, !481, !485}
!llvm.dbg.lv.klee_div_zero_check = !{!486}
!llvm.dbg.lv.klee_int = !{!487, !488}
!llvm.dbg.lv.klee_overshift_check = !{!490, !491}
!llvm.dbg.lv.klee_range = !{!492, !493, !494, !495}
!llvm.dbg.lv.memcpy = !{!497, !498, !499, !500, !504}
!llvm.dbg.lv.memmove = !{!507, !508, !509, !510, !514}
!llvm.dbg.lv.mempcpy = !{!517, !518, !519, !520, !524}
!llvm.dbg.lv.memset = !{!527, !528, !529, !530}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"find_needle_in_haystack", metadata !"find_needle_in_haystack", metadata !"find_needle_in_haystack", metadata !1, i32 12, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32
!1 = metadata !{i32 589865, metadata !"klee_string_test.c", metadata !"/home/zehranaz/finalproj/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_string_test.c", metadata !"/home/zehranaz/finalproj/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !6, metadata !6, metadata !6}
!5 = metadata !{i32 589860, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!7 = metadata !{i32 589860, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!8 = metadata !{i32 589870, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"main", metadata !1, i32 20, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @__user_main} ; [ DW_TAG_subprogram ]
!9 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null} ; [ DW_TAG_subroutine_type ]
!10 = metadata !{metadata !5}
!11 = metadata !{i32 589870, i32 0, metadata !12, metadata !"__check_one_fd", metadata !"__check_one_fd", metadata !"", metadata !12, i32 137, metadata !14, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32)* @__check_one_fd} ; [ DW
!12 = metadata !{i32 589865, metadata !"__uClibc_main.c", metadata !"/home/zehranaz/klee-uclibc/libc/misc/internals", metadata !13} ; [ DW_TAG_file_type ]
!13 = metadata !{i32 589841, i32 0, i32 1, metadata !"__uClibc_main.c", metadata !"/home/zehranaz/klee-uclibc/libc/misc/internals", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_co
!14 = metadata !{i32 589845, metadata !12, metadata !"", metadata !12, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null} ; [ DW_TAG_subroutine_type ]
!15 = metadata !{null, metadata !16, metadata !16}
!16 = metadata !{i32 589860, metadata !12, metadata !"int", metadata !12, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!17 = metadata !{i32 589870, i32 0, metadata !12, metadata !"gnu_dev_makedev", metadata !"gnu_dev_makedev", metadata !"", metadata !18, i32 55, metadata !19, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i32, i32)* @gnu_dev_makedev} ; [ D
!18 = metadata !{i32 589865, metadata !"sysmacros.h", metadata !"/home/zehranaz/klee-uclibc/./include/sys", metadata !13} ; [ DW_TAG_file_type ]
!19 = metadata !{i32 589845, metadata !12, metadata !"", metadata !12, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null} ; [ DW_TAG_subroutine_type ]
!20 = metadata !{metadata !21, metadata !22, metadata !22}
!21 = metadata !{i32 589860, metadata !12, metadata !"long long unsigned int", metadata !12, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!22 = metadata !{i32 589860, metadata !12, metadata !"unsigned int", metadata !12, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!23 = metadata !{i32 589870, i32 0, metadata !12, metadata !"__check_suid", metadata !"__check_suid", metadata !"", metadata !12, i32 156, metadata !24, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @__check_suid} ; [ DW_TAG_subprogram
!24 = metadata !{i32 589845, metadata !12, metadata !"", metadata !12, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null} ; [ DW_TAG_subroutine_type ]
!25 = metadata !{metadata !16}
!26 = metadata !{i32 589870, i32 0, metadata !12, metadata !"__uClibc_init", metadata !"__uClibc_init", metadata !"__uClibc_init", metadata !12, i32 188, metadata !27, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @__uClibc_init} ; [
!27 = metadata !{i32 589845, metadata !12, metadata !"", metadata !12, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !28, i32 0, null} ; [ DW_TAG_subroutine_type ]
!28 = metadata !{null}
!29 = metadata !{i32 589870, i32 0, metadata !12, metadata !"__uClibc_fini", metadata !"__uClibc_fini", metadata !"__uClibc_fini", metadata !12, i32 252, metadata !27, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @__uClibc_fini} ; [
!30 = metadata !{i32 589870, i32 0, metadata !12, metadata !"__uClibc_main", metadata !"__uClibc_main", metadata !"__uClibc_main", metadata !12, i32 281, metadata !31, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32 (i32, i8**, i8**)*
!31 = metadata !{i32 589845, metadata !12, metadata !"", metadata !12, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !32, i32 0, null} ; [ DW_TAG_subroutine_type ]
!32 = metadata !{null, metadata !33, metadata !16, metadata !36, metadata !39, metadata !39, metadata !39, metadata !40}
!33 = metadata !{i32 589839, metadata !12, metadata !"", metadata !12, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !34} ; [ DW_TAG_pointer_type ]
!34 = metadata !{i32 589845, metadata !12, metadata !"", metadata !12, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !35, i32 0, null} ; [ DW_TAG_subroutine_type ]
!35 = metadata !{metadata !16, metadata !16, metadata !36, metadata !36}
!36 = metadata !{i32 589839, metadata !12, metadata !"", metadata !12, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !37} ; [ DW_TAG_pointer_type ]
!37 = metadata !{i32 589839, metadata !12, metadata !"", metadata !12, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !38} ; [ DW_TAG_pointer_type ]
!38 = metadata !{i32 589860, metadata !12, metadata !"char", metadata !12, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!39 = metadata !{i32 589839, metadata !12, metadata !"", metadata !12, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !27} ; [ DW_TAG_pointer_type ]
!40 = metadata !{i32 589839, metadata !12, metadata !"", metadata !12, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!41 = metadata !{i32 589870, i32 0, metadata !42, metadata !"strcat", metadata !"strcat", metadata !"strcat", metadata !42, i32 19, metadata !44, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i8*)* @strcat} ; [ DW_TAG_subprogram ]
!42 = metadata !{i32 589865, metadata !"strcat.c", metadata !"/home/zehranaz/klee-uclibc/libc/string", metadata !43} ; [ DW_TAG_file_type ]
!43 = metadata !{i32 589841, i32 0, i32 1, metadata !"strcat.c", metadata !"/home/zehranaz/klee-uclibc/libc/string", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!44 = metadata !{i32 589845, metadata !42, metadata !"", metadata !42, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !45, i32 0, null} ; [ DW_TAG_subroutine_type ]
!45 = metadata !{metadata !46, metadata !46, metadata !48}
!46 = metadata !{i32 589839, metadata !42, metadata !"", metadata !42, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !47} ; [ DW_TAG_pointer_type ]
!47 = metadata !{i32 589860, metadata !42, metadata !"char", metadata !42, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!48 = metadata !{i32 589839, metadata !42, metadata !"", metadata !42, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !49} ; [ DW_TAG_pointer_type ]
!49 = metadata !{i32 589862, metadata !42, metadata !"", metadata !42, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !47} ; [ DW_TAG_const_type ]
!50 = metadata !{i32 589870, i32 0, metadata !51, metadata !"strcmp", metadata !"strcmp", metadata !"strcmp", metadata !51, i32 21, metadata !53, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*, i8*)* @strcmp} ; [ DW_TAG_subprogram ]
!51 = metadata !{i32 589865, metadata !"strcmp.c", metadata !"/home/zehranaz/klee-uclibc/libc/string", metadata !52} ; [ DW_TAG_file_type ]
!52 = metadata !{i32 589841, i32 0, i32 1, metadata !"strcmp.c", metadata !"/home/zehranaz/klee-uclibc/libc/string", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!53 = metadata !{i32 589845, metadata !51, metadata !"", metadata !51, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !54, i32 0, null} ; [ DW_TAG_subroutine_type ]
!54 = metadata !{metadata !55, metadata !56, metadata !56}
!55 = metadata !{i32 589860, metadata !51, metadata !"int", metadata !51, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!56 = metadata !{i32 589839, metadata !51, metadata !"", metadata !51, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !57} ; [ DW_TAG_pointer_type ]
!57 = metadata !{i32 589862, metadata !51, metadata !"", metadata !51, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !58} ; [ DW_TAG_const_type ]
!58 = metadata !{i32 589860, metadata !51, metadata !"char", metadata !51, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!59 = metadata !{i32 589870, i32 0, metadata !60, metadata !"__errno_location", metadata !"__errno_location", metadata !"__errno_location", metadata !60, i32 12, metadata !62, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32* ()* @__errno_lo
!60 = metadata !{i32 589865, metadata !"__errno_location.c", metadata !"/home/zehranaz/klee-uclibc/libc/misc/internals", metadata !61} ; [ DW_TAG_file_type ]
!61 = metadata !{i32 589841, i32 0, i32 1, metadata !"__errno_location.c", metadata !"/home/zehranaz/klee-uclibc/libc/misc/internals", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG
!62 = metadata !{i32 589845, metadata !60, metadata !"", metadata !60, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !63, i32 0, null} ; [ DW_TAG_subroutine_type ]
!63 = metadata !{metadata !64}
!64 = metadata !{i32 589839, metadata !60, metadata !"", metadata !60, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !65} ; [ DW_TAG_pointer_type ]
!65 = metadata !{i32 589860, metadata !60, metadata !"int", metadata !60, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!66 = metadata !{i32 589870, i32 0, metadata !67, metadata !"__h_errno_location", metadata !"__h_errno_location", metadata !"__h_errno_location", metadata !67, i32 11, metadata !69, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32* ()* @__h_
!67 = metadata !{i32 589865, metadata !"__h_errno_location.c", metadata !"/home/zehranaz/klee-uclibc/libc/misc/internals", metadata !68} ; [ DW_TAG_file_type ]
!68 = metadata !{i32 589841, i32 0, i32 1, metadata !"__h_errno_location.c", metadata !"/home/zehranaz/klee-uclibc/libc/misc/internals", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_T
!69 = metadata !{i32 589845, metadata !67, metadata !"", metadata !67, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !70, i32 0, null} ; [ DW_TAG_subroutine_type ]
!70 = metadata !{metadata !71}
!71 = metadata !{i32 589839, metadata !67, metadata !"", metadata !67, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !72} ; [ DW_TAG_pointer_type ]
!72 = metadata !{i32 589860, metadata !67, metadata !"int", metadata !67, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!73 = metadata !{i32 589870, i32 0, metadata !74, metadata !"_stdio_term", metadata !"_stdio_term", metadata !"_stdio_term", metadata !74, i32 211, metadata !76, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @_stdio_term} ; [ DW_TAG_
!74 = metadata !{i32 589865, metadata !"_stdio.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdio", metadata !75} ; [ DW_TAG_file_type ]
!75 = metadata !{i32 589841, i32 0, i32 1, metadata !"_stdio.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!76 = metadata !{i32 589845, metadata !74, metadata !"", metadata !74, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !28, i32 0, null} ; [ DW_TAG_subroutine_type ]
!77 = metadata !{i32 589870, i32 0, metadata !74, metadata !"_stdio_init", metadata !"_stdio_init", metadata !"_stdio_init", metadata !74, i32 278, metadata !76, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @_stdio_init} ; [ DW_TAG_
!78 = metadata !{i32 589870, i32 0, metadata !79, metadata !"abort", metadata !"abort", metadata !"abort", metadata !79, i32 57, metadata !81, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @abort} ; [ DW_TAG_subprogram ]
!79 = metadata !{i32 589865, metadata !"abort.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdlib", metadata !80} ; [ DW_TAG_file_type ]
!80 = metadata !{i32 589841, i32 0, i32 1, metadata !"abort.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdlib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!81 = metadata !{i32 589845, metadata !79, metadata !"", metadata !79, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !28, i32 0, null} ; [ DW_TAG_subroutine_type ]
!82 = metadata !{i32 589870, i32 0, metadata !83, metadata !"exit", metadata !"exit", metadata !"exit", metadata !85, i32 319, metadata !86, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32)* @exit} ; [ DW_TAG_subprogram ]
!83 = metadata !{i32 589865, metadata !"exit.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdlib", metadata !84} ; [ DW_TAG_file_type ]
!84 = metadata !{i32 589841, i32 0, i32 1, metadata !"exit.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdlib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!85 = metadata !{i32 589865, metadata !"_atexit.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdlib", metadata !84} ; [ DW_TAG_file_type ]
!86 = metadata !{i32 589845, metadata !83, metadata !"", metadata !83, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !87, i32 0, null} ; [ DW_TAG_subroutine_type ]
!87 = metadata !{null, metadata !88}
!88 = metadata !{i32 589860, metadata !83, metadata !"int", metadata !83, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!89 = metadata !{i32 589870, i32 0, metadata !90, metadata !"memcpy", metadata !"memcpy", metadata !"memcpy", metadata !90, i32 19, metadata !92, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i8*, i64)* @memcpy} ; [ DW_TAG_subprogra
!90 = metadata !{i32 589865, metadata !"memcpy.c", metadata !"/home/zehranaz/klee-uclibc/libc/string", metadata !91} ; [ DW_TAG_file_type ]
!91 = metadata !{i32 589841, i32 0, i32 1, metadata !"memcpy.c", metadata !"/home/zehranaz/klee-uclibc/libc/string", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!92 = metadata !{i32 589845, metadata !90, metadata !"", metadata !90, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !93, i32 0, null} ; [ DW_TAG_subroutine_type ]
!93 = metadata !{metadata !94, metadata !94, metadata !94, metadata !95}
!94 = metadata !{i32 589839, metadata !90, metadata !"", metadata !90, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!95 = metadata !{i32 589846, metadata !96, metadata !"size_t", metadata !96, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !97} ; [ DW_TAG_typedef ]
!96 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !91} ; [ DW_TAG_file_type ]
!97 = metadata !{i32 589860, metadata !90, metadata !"long unsigned int", metadata !90, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!98 = metadata !{i32 589870, i32 0, metadata !99, metadata !"memset", metadata !"memset", metadata !"memset", metadata !99, i32 18, metadata !101, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i32, i64)* @memset} ; [ DW_TAG_subprogr
!99 = metadata !{i32 589865, metadata !"memset.c", metadata !"/home/zehranaz/klee-uclibc/libc/string", metadata !100} ; [ DW_TAG_file_type ]
!100 = metadata !{i32 589841, i32 0, i32 1, metadata !"memset.c", metadata !"/home/zehranaz/klee-uclibc/libc/string", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!101 = metadata !{i32 589845, metadata !99, metadata !"", metadata !99, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !102, i32 0, null} ; [ DW_TAG_subroutine_type ]
!102 = metadata !{metadata !103, metadata !103, metadata !104, metadata !105}
!103 = metadata !{i32 589839, metadata !99, metadata !"", metadata !99, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!104 = metadata !{i32 589860, metadata !99, metadata !"int", metadata !99, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!105 = metadata !{i32 589846, metadata !106, metadata !"size_t", metadata !106, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !107} ; [ DW_TAG_typedef ]
!106 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !100} ; [ DW_TAG_file_type ]
!107 = metadata !{i32 589860, metadata !99, metadata !"long unsigned int", metadata !99, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!108 = metadata !{i32 589870, i32 0, metadata !109, metadata !"__sigismember", metadata !"__sigismember", metadata !"__sigismember", metadata !111, i32 117, metadata !112, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.__sigset_t*
!109 = metadata !{i32 589865, metadata !"sigsetops.c", metadata !"/home/zehranaz/klee-uclibc/libc/signal", metadata !110} ; [ DW_TAG_file_type ]
!110 = metadata !{i32 589841, i32 0, i32 1, metadata !"sigsetops.c", metadata !"/home/zehranaz/klee-uclibc/libc/signal", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit 
!111 = metadata !{i32 589865, metadata !"sigset.h", metadata !"/home/zehranaz/klee-uclibc/./include/bits", metadata !110} ; [ DW_TAG_file_type ]
!112 = metadata !{i32 589845, metadata !109, metadata !"", metadata !109, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !113, i32 0, null} ; [ DW_TAG_subroutine_type ]
!113 = metadata !{metadata !114, metadata !115, metadata !114}
!114 = metadata !{i32 589860, metadata !109, metadata !"int", metadata !109, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!115 = metadata !{i32 589839, metadata !109, metadata !"", metadata !109, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !116} ; [ DW_TAG_pointer_type ]
!116 = metadata !{i32 589846, metadata !111, metadata !"__sigset_t", metadata !111, i32 31, i64 0, i64 0, i64 0, i32 0, metadata !117} ; [ DW_TAG_typedef ]
!117 = metadata !{i32 589843, metadata !109, metadata !"", metadata !111, i32 29, i64 1024, i64 64, i64 0, i32 0, null, metadata !118, i32 0, null} ; [ DW_TAG_structure_type ]
!118 = metadata !{metadata !119}
!119 = metadata !{i32 589837, metadata !117, metadata !"__val", metadata !111, i32 30, i64 1024, i64 64, i64 0, i32 0, metadata !120} ; [ DW_TAG_member ]
!120 = metadata !{i32 589825, metadata !109, metadata !"", metadata !109, i32 0, i64 1024, i64 64, i64 0, i32 0, metadata !121, metadata !122, i32 0, null} ; [ DW_TAG_array_type ]
!121 = metadata !{i32 589860, metadata !109, metadata !"long unsigned int", metadata !109, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!122 = metadata !{metadata !123}
!123 = metadata !{i32 589857, i64 0, i64 15}      ; [ DW_TAG_subrange_type ]
!124 = metadata !{i32 589870, i32 0, metadata !109, metadata !"__sigaddset", metadata !"__sigaddset", metadata !"__sigaddset", metadata !111, i32 118, metadata !112, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.__sigset_t*, i32)
!125 = metadata !{i32 589870, i32 0, metadata !109, metadata !"__sigdelset", metadata !"__sigdelset", metadata !"__sigdelset", metadata !111, i32 119, metadata !112, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.__sigset_t*, i32)
!126 = metadata !{i32 589870, i32 0, metadata !127, metadata !"__stdio_wcommit", metadata !"__stdio_wcommit", metadata !"__stdio_wcommit", metadata !127, i32 18, metadata !129, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (%struct.FILE*)
!127 = metadata !{i32 589865, metadata !"_wcommit.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdio", metadata !128} ; [ DW_TAG_file_type ]
!128 = metadata !{i32 589841, i32 0, i32 1, metadata !"_wcommit.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!129 = metadata !{i32 589845, metadata !127, metadata !"", metadata !127, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !130, i32 0, null} ; [ DW_TAG_subroutine_type ]
!130 = metadata !{metadata !131, metadata !134}
!131 = metadata !{i32 589846, metadata !132, metadata !"size_t", metadata !132, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !133} ; [ DW_TAG_typedef ]
!132 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !128} ; [ DW_TAG_file_type ]
!133 = metadata !{i32 589860, metadata !127, metadata !"long unsigned int", metadata !127, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!134 = metadata !{i32 589839, metadata !127, metadata !"", metadata !127, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !135} ; [ DW_TAG_pointer_type ]
!135 = metadata !{i32 589846, metadata !136, metadata !"FILE", metadata !136, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !137} ; [ DW_TAG_typedef ]
!136 = metadata !{i32 589865, metadata !"stdio.h", metadata !"/home/zehranaz/klee-uclibc/./include", metadata !128} ; [ DW_TAG_file_type ]
!137 = metadata !{i32 589843, metadata !127, metadata !"__STDIO_FILE_STRUCT", metadata !136, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !138, i32 0, null} ; [ DW_TAG_structure_type ]
!138 = metadata !{metadata !139, metadata !142, metadata !147, metadata !149, metadata !151, metadata !152, metadata !153, metadata !154, metadata !155, metadata !156, metadata !158, metadata !161}
!139 = metadata !{i32 589837, metadata !137, metadata !"__modeflags", metadata !140, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !141} ; [ DW_TAG_member ]
!140 = metadata !{i32 589865, metadata !"uClibc_stdio.h", metadata !"/home/zehranaz/klee-uclibc/./include/bits", metadata !128} ; [ DW_TAG_file_type ]
!141 = metadata !{i32 589860, metadata !127, metadata !"short unsigned int", metadata !127, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!142 = metadata !{i32 589837, metadata !137, metadata !"__ungot_width", metadata !140, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !143} ; [ DW_TAG_member ]
!143 = metadata !{i32 589825, metadata !127, metadata !"", metadata !127, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !144, metadata !145, i32 0, null} ; [ DW_TAG_array_type ]
!144 = metadata !{i32 589860, metadata !127, metadata !"unsigned char", metadata !127, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!145 = metadata !{metadata !146}
!146 = metadata !{i32 589857, i64 0, i64 1}       ; [ DW_TAG_subrange_type ]
!147 = metadata !{i32 589837, metadata !137, metadata !"__filedes", metadata !140, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !148} ; [ DW_TAG_member ]
!148 = metadata !{i32 589860, metadata !127, metadata !"int", metadata !127, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!149 = metadata !{i32 589837, metadata !137, metadata !"__bufstart", metadata !140, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !150} ; [ DW_TAG_member ]
!150 = metadata !{i32 589839, metadata !127, metadata !"", metadata !127, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !144} ; [ DW_TAG_pointer_type ]
!151 = metadata !{i32 589837, metadata !137, metadata !"__bufend", metadata !140, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !150} ; [ DW_TAG_member ]
!152 = metadata !{i32 589837, metadata !137, metadata !"__bufpos", metadata !140, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !150} ; [ DW_TAG_member ]
!153 = metadata !{i32 589837, metadata !137, metadata !"__bufread", metadata !140, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !150} ; [ DW_TAG_member ]
!154 = metadata !{i32 589837, metadata !137, metadata !"__bufgetc_u", metadata !140, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !150} ; [ DW_TAG_member ]
!155 = metadata !{i32 589837, metadata !137, metadata !"__bufputc_u", metadata !140, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !150} ; [ DW_TAG_member ]
!156 = metadata !{i32 589837, metadata !137, metadata !"__nextopen", metadata !140, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !157} ; [ DW_TAG_member ]
!157 = metadata !{i32 589839, metadata !127, metadata !"", metadata !127, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !137} ; [ DW_TAG_pointer_type ]
!158 = metadata !{i32 589837, metadata !137, metadata !"__ungot", metadata !140, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !159} ; [ DW_TAG_member ]
!159 = metadata !{i32 589825, metadata !127, metadata !"", metadata !127, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !160, metadata !145, i32 0, null} ; [ DW_TAG_array_type ]
!160 = metadata !{i32 589846, metadata !132, metadata !"wchar_t", metadata !132, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !148} ; [ DW_TAG_typedef ]
!161 = metadata !{i32 589837, metadata !137, metadata !"__state", metadata !140, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !162} ; [ DW_TAG_member ]
!162 = metadata !{i32 589846, metadata !163, metadata !"__mbstate_t", metadata !163, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !164} ; [ DW_TAG_typedef ]
!163 = metadata !{i32 589865, metadata !"wchar.h", metadata !"/home/zehranaz/klee-uclibc/./include", metadata !128} ; [ DW_TAG_file_type ]
!164 = metadata !{i32 589843, metadata !127, metadata !"", metadata !163, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !165, i32 0, null} ; [ DW_TAG_structure_type ]
!165 = metadata !{metadata !166, metadata !167}
!166 = metadata !{i32 589837, metadata !164, metadata !"__mask", metadata !163, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !160} ; [ DW_TAG_member ]
!167 = metadata !{i32 589837, metadata !164, metadata !"__wc", metadata !163, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !160} ; [ DW_TAG_member ]
!168 = metadata !{i32 589870, i32 0, metadata !169, metadata !"isatty", metadata !"isatty", metadata !"isatty", metadata !169, i32 27, metadata !171, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isatty} ; [ DW_TAG_subprogram ]
!169 = metadata !{i32 589865, metadata !"isatty.c", metadata !"/home/zehranaz/klee-uclibc/libc/termios", metadata !170} ; [ DW_TAG_file_type ]
!170 = metadata !{i32 589841, i32 0, i32 1, metadata !"isatty.c", metadata !"/home/zehranaz/klee-uclibc/libc/termios", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!171 = metadata !{i32 589845, metadata !169, metadata !"", metadata !169, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !172, i32 0, null} ; [ DW_TAG_subroutine_type ]
!172 = metadata !{metadata !173, metadata !173}
!173 = metadata !{i32 589860, metadata !169, metadata !"int", metadata !169, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!174 = metadata !{i32 589870, i32 0, metadata !175, metadata !"__raise", metadata !"__raise", metadata !"__raise", metadata !175, i32 16, metadata !177, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @__raise} ; [ DW_TAG_subprogram 
!175 = metadata !{i32 589865, metadata !"raise.c", metadata !"/home/zehranaz/klee-uclibc/libc/signal", metadata !176} ; [ DW_TAG_file_type ]
!176 = metadata !{i32 589841, i32 0, i32 1, metadata !"raise.c", metadata !"/home/zehranaz/klee-uclibc/libc/signal", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!177 = metadata !{i32 589845, metadata !175, metadata !"", metadata !175, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !178, i32 0, null} ; [ DW_TAG_subroutine_type ]
!178 = metadata !{metadata !179, metadata !179}
!179 = metadata !{i32 589860, metadata !175, metadata !"int", metadata !175, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!180 = metadata !{i32 589870, i32 0, metadata !181, metadata !"__libc_sigaction", metadata !"__libc_sigaction", metadata !"__libc_sigaction", metadata !181, i32 43, metadata !183, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, %struc
!181 = metadata !{i32 589865, metadata !"sigaction.c", metadata !"/home/zehranaz/klee-uclibc/libc/signal", metadata !182} ; [ DW_TAG_file_type ]
!182 = metadata !{i32 589841, i32 0, i32 1, metadata !"sigaction.c", metadata !"/home/zehranaz/klee-uclibc/libc/signal", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit 
!183 = metadata !{i32 589845, metadata !181, metadata !"", metadata !181, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !184, i32 0, null} ; [ DW_TAG_subroutine_type ]
!184 = metadata !{metadata !185, metadata !185, metadata !186, metadata !277}
!185 = metadata !{i32 589860, metadata !181, metadata !"int", metadata !181, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!186 = metadata !{i32 589839, metadata !181, metadata !"", metadata !181, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !187} ; [ DW_TAG_pointer_type ]
!187 = metadata !{i32 589862, metadata !181, metadata !"", metadata !181, i32 0, i64 1216, i64 64, i64 0, i32 0, metadata !188} ; [ DW_TAG_const_type ]
!188 = metadata !{i32 589843, metadata !181, metadata !"sigaction", metadata !189, i32 26, i64 1216, i64 64, i64 0, i32 0, null, metadata !190, i32 0, null} ; [ DW_TAG_structure_type ]
!189 = metadata !{i32 589865, metadata !"sigaction.h", metadata !"/home/zehranaz/klee-uclibc/./include/bits", metadata !182} ; [ DW_TAG_file_type ]
!190 = metadata !{metadata !191, metadata !265, metadata !273, metadata !274}
!191 = metadata !{i32 589837, metadata !188, metadata !"__sigaction_handler", metadata !189, i32 36, i64 64, i64 64, i64 0, i32 0, metadata !192} ; [ DW_TAG_member ]
!192 = metadata !{i32 589847, metadata !181, metadata !"", metadata !189, i32 30, i64 64, i64 64, i64 0, i32 0, null, metadata !193, i32 0, null} ; [ DW_TAG_union_type ]
!193 = metadata !{metadata !194, metadata !200}
!194 = metadata !{i32 589837, metadata !192, metadata !"sa_handler", metadata !189, i32 32, i64 64, i64 64, i64 0, i32 0, metadata !195} ; [ DW_TAG_member ]
!195 = metadata !{i32 589846, metadata !196, metadata !"__sighandler_t", metadata !196, i32 75, i64 0, i64 0, i64 0, i32 0, metadata !197} ; [ DW_TAG_typedef ]
!196 = metadata !{i32 589865, metadata !"signal.h", metadata !"/home/zehranaz/klee-uclibc/./include", metadata !182} ; [ DW_TAG_file_type ]
!197 = metadata !{i32 589839, metadata !181, metadata !"", metadata !181, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !198} ; [ DW_TAG_pointer_type ]
!198 = metadata !{i32 589845, metadata !181, metadata !"", metadata !181, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !199, i32 0, null} ; [ DW_TAG_subroutine_type ]
!199 = metadata !{null, metadata !185}
!200 = metadata !{i32 589837, metadata !192, metadata !"sa_sigaction", metadata !189, i32 34, i64 64, i64 64, i64 0, i32 0, metadata !201} ; [ DW_TAG_member ]
!201 = metadata !{i32 589839, metadata !181, metadata !"", metadata !181, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !202} ; [ DW_TAG_pointer_type ]
!202 = metadata !{i32 589845, metadata !181, metadata !"", metadata !181, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !203, i32 0, null} ; [ DW_TAG_subroutine_type ]
!203 = metadata !{null, metadata !185, metadata !204, metadata !239}
!204 = metadata !{i32 589839, metadata !181, metadata !"", metadata !181, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !205} ; [ DW_TAG_pointer_type ]
!205 = metadata !{i32 589846, metadata !206, metadata !"siginfo_t", metadata !206, i32 108, i64 0, i64 0, i64 0, i32 0, metadata !207} ; [ DW_TAG_typedef ]
!206 = metadata !{i32 589865, metadata !"siginfo.h", metadata !"/home/zehranaz/klee-uclibc/./include/bits", metadata !182} ; [ DW_TAG_file_type ]
!207 = metadata !{i32 589843, metadata !181, metadata !"siginfo", metadata !206, i32 52, i64 1024, i64 64, i64 0, i32 0, null, metadata !208, i32 0, null} ; [ DW_TAG_structure_type ]
!208 = metadata !{metadata !209, metadata !210, metadata !211, metadata !212}
!209 = metadata !{i32 589837, metadata !207, metadata !"si_signo", metadata !206, i32 53, i64 32, i64 32, i64 0, i32 0, metadata !185} ; [ DW_TAG_member ]
!210 = metadata !{i32 589837, metadata !207, metadata !"si_errno", metadata !206, i32 54, i64 32, i64 32, i64 32, i32 0, metadata !185} ; [ DW_TAG_member ]
!211 = metadata !{i32 589837, metadata !207, metadata !"si_code", metadata !206, i32 56, i64 32, i64 32, i64 64, i32 0, metadata !185} ; [ DW_TAG_member ]
!212 = metadata !{i32 589837, metadata !207, metadata !"_sifields", metadata !206, i32 107, i64 896, i64 64, i64 128, i32 0, metadata !213} ; [ DW_TAG_member ]
!213 = metadata !{i32 589847, metadata !181, metadata !"", metadata !206, i32 59, i64 896, i64 64, i64 0, i32 0, null, metadata !214, i32 0, null} ; [ DW_TAG_union_type ]
!214 = metadata !{metadata !215, metadata !219, metadata !228, metadata !240, metadata !246, metadata !256, metadata !260}
!215 = metadata !{i32 589837, metadata !213, metadata !"_pad", metadata !206, i32 60, i64 896, i64 32, i64 0, i32 0, metadata !216} ; [ DW_TAG_member ]
!216 = metadata !{i32 589825, metadata !181, metadata !"", metadata !181, i32 0, i64 896, i64 32, i64 0, i32 0, metadata !185, metadata !217, i32 0, null} ; [ DW_TAG_array_type ]
!217 = metadata !{metadata !218}
!218 = metadata !{i32 589857, i64 0, i64 27}      ; [ DW_TAG_subrange_type ]
!219 = metadata !{i32 589837, metadata !213, metadata !"_kill", metadata !206, i32 67, i64 64, i64 32, i64 0, i32 0, metadata !220} ; [ DW_TAG_member ]
!220 = metadata !{i32 589843, metadata !181, metadata !"", metadata !206, i32 64, i64 64, i64 32, i64 0, i32 0, null, metadata !221, i32 0, null} ; [ DW_TAG_structure_type ]
!221 = metadata !{metadata !222, metadata !225}
!222 = metadata !{i32 589837, metadata !220, metadata !"si_pid", metadata !206, i32 65, i64 32, i64 32, i64 0, i32 0, metadata !223} ; [ DW_TAG_member ]
!223 = metadata !{i32 589846, metadata !224, metadata !"__pid_t", metadata !224, i32 147, i64 0, i64 0, i64 0, i32 0, metadata !185} ; [ DW_TAG_typedef ]
!224 = metadata !{i32 589865, metadata !"types.h", metadata !"/home/zehranaz/klee-uclibc/./include/bits", metadata !182} ; [ DW_TAG_file_type ]
!225 = metadata !{i32 589837, metadata !220, metadata !"si_uid", metadata !206, i32 66, i64 32, i64 32, i64 32, i32 0, metadata !226} ; [ DW_TAG_member ]
!226 = metadata !{i32 589846, metadata !224, metadata !"__uid_t", metadata !224, i32 139, i64 0, i64 0, i64 0, i32 0, metadata !227} ; [ DW_TAG_typedef ]
!227 = metadata !{i32 589860, metadata !181, metadata !"unsigned int", metadata !181, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!228 = metadata !{i32 589837, metadata !213, metadata !"_timer", metadata !206, i32 75, i64 128, i64 64, i64 0, i32 0, metadata !229} ; [ DW_TAG_member ]
!229 = metadata !{i32 589843, metadata !181, metadata !"", metadata !206, i32 71, i64 128, i64 64, i64 0, i32 0, null, metadata !230, i32 0, null} ; [ DW_TAG_structure_type ]
!230 = metadata !{metadata !231, metadata !232, metadata !233}
!231 = metadata !{i32 589837, metadata !229, metadata !"si_tid", metadata !206, i32 72, i64 32, i64 32, i64 0, i32 0, metadata !185} ; [ DW_TAG_member ]
!232 = metadata !{i32 589837, metadata !229, metadata !"si_overrun", metadata !206, i32 73, i64 32, i64 32, i64 32, i32 0, metadata !185} ; [ DW_TAG_member ]
!233 = metadata !{i32 589837, metadata !229, metadata !"si_sigval", metadata !206, i32 74, i64 64, i64 64, i64 64, i32 0, metadata !234} ; [ DW_TAG_member ]
!234 = metadata !{i32 589846, metadata !206, metadata !"sigval_t", metadata !206, i32 37, i64 0, i64 0, i64 0, i32 0, metadata !235} ; [ DW_TAG_typedef ]
!235 = metadata !{i32 589847, metadata !181, metadata !"sigval", metadata !206, i32 34, i64 64, i64 64, i64 0, i32 0, null, metadata !236, i32 0, null} ; [ DW_TAG_union_type ]
!236 = metadata !{metadata !237, metadata !238}
!237 = metadata !{i32 589837, metadata !235, metadata !"sival_int", metadata !206, i32 35, i64 32, i64 32, i64 0, i32 0, metadata !185} ; [ DW_TAG_member ]
!238 = metadata !{i32 589837, metadata !235, metadata !"sival_ptr", metadata !206, i32 36, i64 64, i64 64, i64 0, i32 0, metadata !239} ; [ DW_TAG_member ]
!239 = metadata !{i32 589839, metadata !181, metadata !"", metadata !181, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!240 = metadata !{i32 589837, metadata !213, metadata !"_rt", metadata !206, i32 83, i64 128, i64 64, i64 0, i32 0, metadata !241} ; [ DW_TAG_member ]
!241 = metadata !{i32 589843, metadata !181, metadata !"", metadata !206, i32 79, i64 128, i64 64, i64 0, i32 0, null, metadata !242, i32 0, null} ; [ DW_TAG_structure_type ]
!242 = metadata !{metadata !243, metadata !244, metadata !245}
!243 = metadata !{i32 589837, metadata !241, metadata !"si_pid", metadata !206, i32 80, i64 32, i64 32, i64 0, i32 0, metadata !223} ; [ DW_TAG_member ]
!244 = metadata !{i32 589837, metadata !241, metadata !"si_uid", metadata !206, i32 81, i64 32, i64 32, i64 32, i32 0, metadata !226} ; [ DW_TAG_member ]
!245 = metadata !{i32 589837, metadata !241, metadata !"si_sigval", metadata !206, i32 82, i64 64, i64 64, i64 64, i32 0, metadata !234} ; [ DW_TAG_member ]
!246 = metadata !{i32 589837, metadata !213, metadata !"_sigchld", metadata !206, i32 93, i64 256, i64 64, i64 0, i32 0, metadata !247} ; [ DW_TAG_member ]
!247 = metadata !{i32 589843, metadata !181, metadata !"", metadata !206, i32 87, i64 256, i64 64, i64 0, i32 0, null, metadata !248, i32 0, null} ; [ DW_TAG_structure_type ]
!248 = metadata !{metadata !249, metadata !250, metadata !251, metadata !252, metadata !255}
!249 = metadata !{i32 589837, metadata !247, metadata !"si_pid", metadata !206, i32 88, i64 32, i64 32, i64 0, i32 0, metadata !223} ; [ DW_TAG_member ]
!250 = metadata !{i32 589837, metadata !247, metadata !"si_uid", metadata !206, i32 89, i64 32, i64 32, i64 32, i32 0, metadata !226} ; [ DW_TAG_member ]
!251 = metadata !{i32 589837, metadata !247, metadata !"si_status", metadata !206, i32 90, i64 32, i64 32, i64 64, i32 0, metadata !185} ; [ DW_TAG_member ]
!252 = metadata !{i32 589837, metadata !247, metadata !"si_utime", metadata !206, i32 91, i64 64, i64 64, i64 128, i32 0, metadata !253} ; [ DW_TAG_member ]
!253 = metadata !{i32 589846, metadata !224, metadata !"__clock_t", metadata !224, i32 149, i64 0, i64 0, i64 0, i32 0, metadata !254} ; [ DW_TAG_typedef ]
!254 = metadata !{i32 589860, metadata !181, metadata !"long int", metadata !181, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!255 = metadata !{i32 589837, metadata !247, metadata !"si_stime", metadata !206, i32 92, i64 64, i64 64, i64 192, i32 0, metadata !253} ; [ DW_TAG_member ]
!256 = metadata !{i32 589837, metadata !213, metadata !"_sigfault", metadata !206, i32 99, i64 64, i64 64, i64 0, i32 0, metadata !257} ; [ DW_TAG_member ]
!257 = metadata !{i32 589843, metadata !181, metadata !"", metadata !206, i32 97, i64 64, i64 64, i64 0, i32 0, null, metadata !258, i32 0, null} ; [ DW_TAG_structure_type ]
!258 = metadata !{metadata !259}
!259 = metadata !{i32 589837, metadata !257, metadata !"si_addr", metadata !206, i32 98, i64 64, i64 64, i64 0, i32 0, metadata !239} ; [ DW_TAG_member ]
!260 = metadata !{i32 589837, metadata !213, metadata !"_sigpoll", metadata !206, i32 106, i64 128, i64 64, i64 0, i32 0, metadata !261} ; [ DW_TAG_member ]
!261 = metadata !{i32 589843, metadata !181, metadata !"", metadata !206, i32 103, i64 128, i64 64, i64 0, i32 0, null, metadata !262, i32 0, null} ; [ DW_TAG_structure_type ]
!262 = metadata !{metadata !263, metadata !264}
!263 = metadata !{i32 589837, metadata !261, metadata !"si_band", metadata !206, i32 104, i64 64, i64 64, i64 0, i32 0, metadata !254} ; [ DW_TAG_member ]
!264 = metadata !{i32 589837, metadata !261, metadata !"si_fd", metadata !206, i32 105, i64 32, i64 32, i64 64, i32 0, metadata !185} ; [ DW_TAG_member ]
!265 = metadata !{i32 589837, metadata !188, metadata !"sa_mask", metadata !189, i32 44, i64 1024, i64 64, i64 64, i32 0, metadata !266} ; [ DW_TAG_member ]
!266 = metadata !{i32 589846, metadata !267, metadata !"__sigset_t", metadata !267, i32 31, i64 0, i64 0, i64 0, i32 0, metadata !268} ; [ DW_TAG_typedef ]
!267 = metadata !{i32 589865, metadata !"sigset.h", metadata !"/home/zehranaz/klee-uclibc/./include/bits", metadata !182} ; [ DW_TAG_file_type ]
!268 = metadata !{i32 589843, metadata !181, metadata !"", metadata !267, i32 29, i64 1024, i64 64, i64 0, i32 0, null, metadata !269, i32 0, null} ; [ DW_TAG_structure_type ]
!269 = metadata !{metadata !270}
!270 = metadata !{i32 589837, metadata !268, metadata !"__val", metadata !267, i32 30, i64 1024, i64 64, i64 0, i32 0, metadata !271} ; [ DW_TAG_member ]
!271 = metadata !{i32 589825, metadata !181, metadata !"", metadata !181, i32 0, i64 1024, i64 64, i64 0, i32 0, metadata !272, metadata !122, i32 0, null} ; [ DW_TAG_array_type ]
!272 = metadata !{i32 589860, metadata !181, metadata !"long unsigned int", metadata !181, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!273 = metadata !{i32 589837, metadata !188, metadata !"sa_flags", metadata !189, i32 47, i64 32, i64 32, i64 1088, i32 0, metadata !185} ; [ DW_TAG_member ]
!274 = metadata !{i32 589837, metadata !188, metadata !"sa_restorer", metadata !189, i32 50, i64 64, i64 64, i64 1152, i32 0, metadata !275} ; [ DW_TAG_member ]
!275 = metadata !{i32 589839, metadata !181, metadata !"", metadata !181, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !276} ; [ DW_TAG_pointer_type ]
!276 = metadata !{i32 589845, metadata !181, metadata !"", metadata !181, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !28, i32 0, null} ; [ DW_TAG_subroutine_type ]
!277 = metadata !{i32 589839, metadata !181, metadata !"", metadata !181, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !188} ; [ DW_TAG_pointer_type ]
!278 = metadata !{i32 589870, i32 0, metadata !279, metadata !"__stdio_WRITE", metadata !"__stdio_WRITE", metadata !"__stdio_WRITE", metadata !279, i32 35, metadata !281, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (%struct.FILE*, i8*, 
!279 = metadata !{i32 589865, metadata !"_WRITE.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdio", metadata !280} ; [ DW_TAG_file_type ]
!280 = metadata !{i32 589841, i32 0, i32 1, metadata !"_WRITE.c", metadata !"/home/zehranaz/klee-uclibc/libc/stdio", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!281 = metadata !{i32 589845, metadata !279, metadata !"", metadata !279, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !282, i32 0, null} ; [ DW_TAG_subroutine_type ]
!282 = metadata !{metadata !283, metadata !286, metadata !318, metadata !283}
!283 = metadata !{i32 589846, metadata !284, metadata !"size_t", metadata !284, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !285} ; [ DW_TAG_typedef ]
!284 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !280} ; [ DW_TAG_file_type ]
!285 = metadata !{i32 589860, metadata !279, metadata !"long unsigned int", metadata !279, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!286 = metadata !{i32 589839, metadata !279, metadata !"", metadata !279, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !287} ; [ DW_TAG_pointer_type ]
!287 = metadata !{i32 589846, metadata !288, metadata !"FILE", metadata !288, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !289} ; [ DW_TAG_typedef ]
!288 = metadata !{i32 589865, metadata !"stdio.h", metadata !"/home/zehranaz/klee-uclibc/./include", metadata !280} ; [ DW_TAG_file_type ]
!289 = metadata !{i32 589843, metadata !279, metadata !"__STDIO_FILE_STRUCT", metadata !288, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !290, i32 0, null} ; [ DW_TAG_structure_type ]
!290 = metadata !{metadata !291, metadata !294, metadata !297, metadata !299, metadata !301, metadata !302, metadata !303, metadata !304, metadata !305, metadata !306, metadata !308, metadata !311}
!291 = metadata !{i32 589837, metadata !289, metadata !"__modeflags", metadata !292, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !293} ; [ DW_TAG_member ]
!292 = metadata !{i32 589865, metadata !"uClibc_stdio.h", metadata !"/home/zehranaz/klee-uclibc/./include/bits", metadata !280} ; [ DW_TAG_file_type ]
!293 = metadata !{i32 589860, metadata !279, metadata !"short unsigned int", metadata !279, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!294 = metadata !{i32 589837, metadata !289, metadata !"__ungot_width", metadata !292, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !295} ; [ DW_TAG_member ]
!295 = metadata !{i32 589825, metadata !279, metadata !"", metadata !279, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !296, metadata !145, i32 0, null} ; [ DW_TAG_array_type ]
!296 = metadata !{i32 589860, metadata !279, metadata !"unsigned char", metadata !279, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!297 = metadata !{i32 589837, metadata !289, metadata !"__filedes", metadata !292, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !298} ; [ DW_TAG_member ]
!298 = metadata !{i32 589860, metadata !279, metadata !"int", metadata !279, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!299 = metadata !{i32 589837, metadata !289, metadata !"__bufstart", metadata !292, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !300} ; [ DW_TAG_member ]
!300 = metadata !{i32 589839, metadata !279, metadata !"", metadata !279, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !296} ; [ DW_TAG_pointer_type ]
!301 = metadata !{i32 589837, metadata !289, metadata !"__bufend", metadata !292, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !300} ; [ DW_TAG_member ]
!302 = metadata !{i32 589837, metadata !289, metadata !"__bufpos", metadata !292, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !300} ; [ DW_TAG_member ]
!303 = metadata !{i32 589837, metadata !289, metadata !"__bufread", metadata !292, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !300} ; [ DW_TAG_member ]
!304 = metadata !{i32 589837, metadata !289, metadata !"__bufgetc_u", metadata !292, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !300} ; [ DW_TAG_member ]
!305 = metadata !{i32 589837, metadata !289, metadata !"__bufputc_u", metadata !292, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !300} ; [ DW_TAG_member ]
!306 = metadata !{i32 589837, metadata !289, metadata !"__nextopen", metadata !292, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !307} ; [ DW_TAG_member ]
!307 = metadata !{i32 589839, metadata !279, metadata !"", metadata !279, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !289} ; [ DW_TAG_pointer_type ]
!308 = metadata !{i32 589837, metadata !289, metadata !"__ungot", metadata !292, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !309} ; [ DW_TAG_member ]
!309 = metadata !{i32 589825, metadata !279, metadata !"", metadata !279, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !310, metadata !145, i32 0, null} ; [ DW_TAG_array_type ]
!310 = metadata !{i32 589846, metadata !284, metadata !"wchar_t", metadata !284, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !298} ; [ DW_TAG_typedef ]
!311 = metadata !{i32 589837, metadata !289, metadata !"__state", metadata !292, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !312} ; [ DW_TAG_member ]
!312 = metadata !{i32 589846, metadata !313, metadata !"__mbstate_t", metadata !313, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !314} ; [ DW_TAG_typedef ]
!313 = metadata !{i32 589865, metadata !"wchar.h", metadata !"/home/zehranaz/klee-uclibc/./include", metadata !280} ; [ DW_TAG_file_type ]
!314 = metadata !{i32 589843, metadata !279, metadata !"", metadata !313, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !315, i32 0, null} ; [ DW_TAG_structure_type ]
!315 = metadata !{metadata !316, metadata !317}
!316 = metadata !{i32 589837, metadata !314, metadata !"__mask", metadata !313, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !310} ; [ DW_TAG_member ]
!317 = metadata !{i32 589837, metadata !314, metadata !"__wc", metadata !313, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !310} ; [ DW_TAG_member ]
!318 = metadata !{i32 589839, metadata !279, metadata !"", metadata !279, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !319} ; [ DW_TAG_pointer_type ]
!319 = metadata !{i32 589862, metadata !279, metadata !"", metadata !279, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !296} ; [ DW_TAG_const_type ]
!320 = metadata !{i32 589870, i32 0, metadata !321, metadata !"tcgetattr", metadata !"tcgetattr", metadata !"tcgetattr", metadata !321, i32 39, metadata !323, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, %struct.termios*)* @tcgetat
!321 = metadata !{i32 589865, metadata !"tcgetattr.c", metadata !"/home/zehranaz/klee-uclibc/libc/termios", metadata !322} ; [ DW_TAG_file_type ]
!322 = metadata !{i32 589841, i32 0, i32 1, metadata !"tcgetattr.c", metadata !"/home/zehranaz/klee-uclibc/libc/termios", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit
!323 = metadata !{i32 589845, metadata !321, metadata !"", metadata !321, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !324, i32 0, null} ; [ DW_TAG_subroutine_type ]
!324 = metadata !{metadata !325, metadata !325, metadata !326}
!325 = metadata !{i32 589860, metadata !321, metadata !"int", metadata !321, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!326 = metadata !{i32 589839, metadata !321, metadata !"", metadata !321, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !327} ; [ DW_TAG_pointer_type ]
!327 = metadata !{i32 589843, metadata !321, metadata !"termios", metadata !328, i32 31, i64 480, i64 32, i64 0, i32 0, null, metadata !329, i32 0, null} ; [ DW_TAG_structure_type ]
!328 = metadata !{i32 589865, metadata !"termios.h", metadata !"/home/zehranaz/klee-uclibc/./include/bits", metadata !322} ; [ DW_TAG_file_type ]
!329 = metadata !{metadata !330, metadata !333, metadata !334, metadata !335, metadata !336, metadata !339, metadata !343, metadata !345}
!330 = metadata !{i32 589837, metadata !327, metadata !"c_iflag", metadata !328, i32 32, i64 32, i64 32, i64 0, i32 0, metadata !331} ; [ DW_TAG_member ]
!331 = metadata !{i32 589846, metadata !328, metadata !"tcflag_t", metadata !328, i32 27, i64 0, i64 0, i64 0, i32 0, metadata !332} ; [ DW_TAG_typedef ]
!332 = metadata !{i32 589860, metadata !321, metadata !"unsigned int", metadata !321, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!333 = metadata !{i32 589837, metadata !327, metadata !"c_oflag", metadata !328, i32 33, i64 32, i64 32, i64 32, i32 0, metadata !331} ; [ DW_TAG_member ]
!334 = metadata !{i32 589837, metadata !327, metadata !"c_cflag", metadata !328, i32 34, i64 32, i64 32, i64 64, i32 0, metadata !331} ; [ DW_TAG_member ]
!335 = metadata !{i32 589837, metadata !327, metadata !"c_lflag", metadata !328, i32 35, i64 32, i64 32, i64 96, i32 0, metadata !331} ; [ DW_TAG_member ]
!336 = metadata !{i32 589837, metadata !327, metadata !"c_line", metadata !328, i32 36, i64 8, i64 8, i64 128, i32 0, metadata !337} ; [ DW_TAG_member ]
!337 = metadata !{i32 589846, metadata !328, metadata !"cc_t", metadata !328, i32 25, i64 0, i64 0, i64 0, i32 0, metadata !338} ; [ DW_TAG_typedef ]
!338 = metadata !{i32 589860, metadata !321, metadata !"unsigned char", metadata !321, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!339 = metadata !{i32 589837, metadata !327, metadata !"c_cc", metadata !328, i32 37, i64 256, i64 8, i64 136, i32 0, metadata !340} ; [ DW_TAG_member ]
!340 = metadata !{i32 589825, metadata !321, metadata !"", metadata !321, i32 0, i64 256, i64 8, i64 0, i32 0, metadata !337, metadata !341, i32 0, null} ; [ DW_TAG_array_type ]
!341 = metadata !{metadata !342}
!342 = metadata !{i32 589857, i64 0, i64 31}      ; [ DW_TAG_subrange_type ]
!343 = metadata !{i32 589837, metadata !327, metadata !"c_ispeed", metadata !328, i32 38, i64 32, i64 32, i64 416, i32 0, metadata !344} ; [ DW_TAG_member ]
!344 = metadata !{i32 589846, metadata !328, metadata !"speed_t", metadata !328, i32 26, i64 0, i64 0, i64 0, i32 0, metadata !332} ; [ DW_TAG_typedef ]
!345 = metadata !{i32 589837, metadata !327, metadata !"c_ospeed", metadata !328, i32 39, i64 32, i64 32, i64 448, i32 0, metadata !344} ; [ DW_TAG_member ]
!346 = metadata !{i32 589870, i32 0, metadata !347, metadata !"mempcpy", metadata !"mempcpy", metadata !"mempcpy", metadata !347, i32 21, metadata !349, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i8*, i64)* @mempcpy} ; [ DW_TAG_s
!347 = metadata !{i32 589865, metadata !"mempcpy.c", metadata !"/home/zehranaz/klee-uclibc/libc/string", metadata !348} ; [ DW_TAG_file_type ]
!348 = metadata !{i32 589841, i32 0, i32 1, metadata !"mempcpy.c", metadata !"/home/zehranaz/klee-uclibc/libc/string", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!349 = metadata !{i32 589845, metadata !347, metadata !"", metadata !347, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !350, i32 0, null} ; [ DW_TAG_subroutine_type ]
!350 = metadata !{metadata !351, metadata !351, metadata !351, metadata !352}
!351 = metadata !{i32 589839, metadata !347, metadata !"", metadata !347, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!352 = metadata !{i32 589846, metadata !353, metadata !"size_t", metadata !353, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !354} ; [ DW_TAG_typedef ]
!353 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !348} ; [ DW_TAG_file_type ]
!354 = metadata !{i32 589860, metadata !347, metadata !"long unsigned int", metadata !347, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!355 = metadata !{i32 589870, i32 0, metadata !356, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !356, i32 12, metadata !358, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i6
!356 = metadata !{i32 589865, metadata !"klee_div_zero_check.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !357} ; [ DW_TAG_file_type ]
!357 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_div_zero_check.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_comp
!358 = metadata !{i32 589845, metadata !356, metadata !"", metadata !356, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !359, i32 0, null} ; [ DW_TAG_subroutine_type ]
!359 = metadata !{null, metadata !360}
!360 = metadata !{i32 589860, metadata !356, metadata !"long long int", metadata !356, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!361 = metadata !{i32 589870, i32 0, metadata !362, metadata !"klee_int", metadata !"klee_int", metadata !"klee_int", metadata !362, i32 13, metadata !364, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int} ; [ DW_TAG_subprogr
!362 = metadata !{i32 589865, metadata !"klee_int.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !363} ; [ DW_TAG_file_type ]
!363 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_int.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!364 = metadata !{i32 589845, metadata !362, metadata !"", metadata !362, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !365, i32 0, null} ; [ DW_TAG_subroutine_type ]
!365 = metadata !{metadata !366, metadata !367}
!366 = metadata !{i32 589860, metadata !362, metadata !"int", metadata !362, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!367 = metadata !{i32 589839, metadata !362, metadata !"", metadata !362, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !368} ; [ DW_TAG_pointer_type ]
!368 = metadata !{i32 589862, metadata !362, metadata !"", metadata !362, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !369} ; [ DW_TAG_const_type ]
!369 = metadata !{i32 589860, metadata !362, metadata !"char", metadata !362, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!370 = metadata !{i32 589870, i32 0, metadata !371, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !371, i32 20, metadata !373, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void 
!371 = metadata !{i32 589865, metadata !"klee_overshift_check.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !372} ; [ DW_TAG_file_type ]
!372 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_overshift_check.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_com
!373 = metadata !{i32 589845, metadata !371, metadata !"", metadata !371, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !374, i32 0, null} ; [ DW_TAG_subroutine_type ]
!374 = metadata !{null, metadata !375, metadata !375}
!375 = metadata !{i32 589860, metadata !371, metadata !"long long unsigned int", metadata !371, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!376 = metadata !{i32 589870, i32 0, metadata !377, metadata !"klee_range", metadata !"klee_range", metadata !"klee_range", metadata !377, i32 13, metadata !379, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range} ;
!377 = metadata !{i32 589865, metadata !"klee_range.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !378} ; [ DW_TAG_file_type ]
!378 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_range.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit 
!379 = metadata !{i32 589845, metadata !377, metadata !"", metadata !377, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !380, i32 0, null} ; [ DW_TAG_subroutine_type ]
!380 = metadata !{metadata !381, metadata !381, metadata !381, metadata !382}
!381 = metadata !{i32 589860, metadata !377, metadata !"int", metadata !377, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!382 = metadata !{i32 589839, metadata !377, metadata !"", metadata !377, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !383} ; [ DW_TAG_pointer_type ]
!383 = metadata !{i32 589862, metadata !377, metadata !"", metadata !377, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !384} ; [ DW_TAG_const_type ]
!384 = metadata !{i32 589860, metadata !377, metadata !"char", metadata !377, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!385 = metadata !{i32 589870, i32 0, metadata !386, metadata !"memcpy", metadata !"memcpy", metadata !"memcpy", metadata !386, i32 12, metadata !388, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy} ; [ DW_TAG_subpro
!386 = metadata !{i32 589865, metadata !"memcpy.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !387} ; [ DW_TAG_file_type ]
!387 = metadata !{i32 589841, i32 0, i32 1, metadata !"memcpy.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!388 = metadata !{i32 589845, metadata !386, metadata !"", metadata !386, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !389, i32 0, null} ; [ DW_TAG_subroutine_type ]
!389 = metadata !{metadata !390, metadata !390, metadata !390, metadata !391}
!390 = metadata !{i32 589839, metadata !386, metadata !"", metadata !386, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!391 = metadata !{i32 589846, metadata !392, metadata !"size_t", metadata !392, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !393} ; [ DW_TAG_typedef ]
!392 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !387} ; [ DW_TAG_file_type ]
!393 = metadata !{i32 589860, metadata !386, metadata !"long unsigned int", metadata !386, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!394 = metadata !{i32 589870, i32 0, metadata !395, metadata !"memmove", metadata !"memmove", metadata !"memmove", metadata !395, i32 12, metadata !397, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!395 = metadata !{i32 589865, metadata !"memmove.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !396} ; [ DW_TAG_file_type ]
!396 = metadata !{i32 589841, i32 0, i32 1, metadata !"memmove.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!397 = metadata !{i32 589845, metadata !395, metadata !"", metadata !395, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !398, i32 0, null} ; [ DW_TAG_subroutine_type ]
!398 = metadata !{metadata !399, metadata !399, metadata !399, metadata !400}
!399 = metadata !{i32 589839, metadata !395, metadata !"", metadata !395, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!400 = metadata !{i32 589846, metadata !401, metadata !"size_t", metadata !401, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !402} ; [ DW_TAG_typedef ]
!401 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !396} ; [ DW_TAG_file_type ]
!402 = metadata !{i32 589860, metadata !395, metadata !"long unsigned int", metadata !395, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!403 = metadata !{i32 589870, i32 0, metadata !404, metadata !"mempcpy", metadata !"mempcpy", metadata !"mempcpy", metadata !404, i32 11, metadata !406, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy} ; [ DW_TAG_su
!404 = metadata !{i32 589865, metadata !"mempcpy.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !405} ; [ DW_TAG_file_type ]
!405 = metadata !{i32 589841, i32 0, i32 1, metadata !"mempcpy.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!406 = metadata !{i32 589845, metadata !404, metadata !"", metadata !404, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !407, i32 0, null} ; [ DW_TAG_subroutine_type ]
!407 = metadata !{metadata !408, metadata !408, metadata !408, metadata !409}
!408 = metadata !{i32 589839, metadata !404, metadata !"", metadata !404, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!409 = metadata !{i32 589846, metadata !410, metadata !"size_t", metadata !410, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !411} ; [ DW_TAG_typedef ]
!410 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !405} ; [ DW_TAG_file_type ]
!411 = metadata !{i32 589860, metadata !404, metadata !"long unsigned int", metadata !404, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!412 = metadata !{i32 589870, i32 0, metadata !413, metadata !"memset", metadata !"memset", metadata !"memset", metadata !413, i32 11, metadata !415, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset} ; [ DW_TAG_subpro
!413 = metadata !{i32 589865, metadata !"memset.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !414} ; [ DW_TAG_file_type ]
!414 = metadata !{i32 589841, i32 0, i32 1, metadata !"memset.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!415 = metadata !{i32 589845, metadata !413, metadata !"", metadata !413, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !416, i32 0, null} ; [ DW_TAG_subroutine_type ]
!416 = metadata !{metadata !417, metadata !417, metadata !418, metadata !419}
!417 = metadata !{i32 589839, metadata !413, metadata !"", metadata !413, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!418 = metadata !{i32 589860, metadata !413, metadata !"int", metadata !413, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!419 = metadata !{i32 589846, metadata !420, metadata !"size_t", metadata !420, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !421} ; [ DW_TAG_typedef ]
!420 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !414} ; [ DW_TAG_file_type ]
!421 = metadata !{i32 589860, metadata !413, metadata !"long unsigned int", metadata !413, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!422 = metadata !{i32 589876, i32 0, metadata !12, metadata !"__libc_stack_end", metadata !"__libc_stack_end", metadata !"", metadata !12, i32 52, metadata !40, i1 false, i1 true, i8** @__libc_stack_end} ; [ DW_TAG_variable ]
!423 = metadata !{i32 589876, i32 0, metadata !12, metadata !"__uclibc_progname", metadata !"__uclibc_progname", metadata !"", metadata !12, i32 110, metadata !424, i1 false, i1 true, i8** @__uclibc_progname} ; [ DW_TAG_variable ]
!424 = metadata !{i32 589839, metadata !12, metadata !"", metadata !12, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !425} ; [ DW_TAG_pointer_type ]
!425 = metadata !{i32 589862, metadata !12, metadata !"", metadata !12, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !38} ; [ DW_TAG_const_type ]
!426 = metadata !{i32 589876, i32 0, metadata !12, metadata !"__environ", metadata !"__environ", metadata !"", metadata !12, i32 125, metadata !36, i1 false, i1 true, i8*** @__environ} ; [ DW_TAG_variable ]
!427 = metadata !{i32 589876, i32 0, metadata !12, metadata !"__pagesize", metadata !"__pagesize", metadata !"", metadata !12, i32 129, metadata !428, i1 false, i1 true, i64* @__pagesize} ; [ DW_TAG_variable ]
!428 = metadata !{i32 589846, metadata !429, metadata !"size_t", metadata !429, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !430} ; [ DW_TAG_typedef ]
!429 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !13} ; [ DW_TAG_file_type ]
!430 = metadata !{i32 589860, metadata !12, metadata !"long unsigned int", metadata !12, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!431 = metadata !{i32 589876, i32 0, metadata !26, metadata !"been_there_done_that", metadata !"been_there_done_that", metadata !"", metadata !12, i32 189, metadata !16, i1 true, i1 true, i32* @been_there_done_that.2848} ; [ DW_TAG_variable ]
!432 = metadata !{i32 589876, i32 0, metadata !12, metadata !"__app_fini", metadata !"__app_fini", metadata !"", metadata !12, i32 244, metadata !39, i1 false, i1 true, void ()** @__app_fini} ; [ DW_TAG_variable ]
!433 = metadata !{i32 589876, i32 0, metadata !12, metadata !"__rtld_fini", metadata !"__rtld_fini", metadata !"", metadata !12, i32 247, metadata !39, i1 false, i1 true, void ()** @__rtld_fini} ; [ DW_TAG_variable ]
!434 = metadata !{i32 589876, i32 0, metadata !74, metadata !"_stdio_streams", metadata !"_stdio_streams", metadata !"", metadata !74, i32 131, metadata !435, i1 true, i1 true, [3 x %struct.FILE]* @_stdio_streams} ; [ DW_TAG_variable ]
!435 = metadata !{i32 589825, metadata !74, metadata !"", metadata !74, i32 0, i64 1920, i64 64, i64 0, i32 0, metadata !436, metadata !468, i32 0, null} ; [ DW_TAG_array_type ]
!436 = metadata !{i32 589846, metadata !437, metadata !"FILE", metadata !437, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !438} ; [ DW_TAG_typedef ]
!437 = metadata !{i32 589865, metadata !"stdio.h", metadata !"/home/zehranaz/klee-uclibc/./include", metadata !75} ; [ DW_TAG_file_type ]
!438 = metadata !{i32 589843, metadata !74, metadata !"__STDIO_FILE_STRUCT", metadata !437, i32 46, i64 640, i64 64, i64 0, i32 0, null, metadata !439, i32 0, null} ; [ DW_TAG_structure_type ]
!439 = metadata !{metadata !440, metadata !443, metadata !446, metadata !448, metadata !450, metadata !451, metadata !452, metadata !453, metadata !454, metadata !455, metadata !457, metadata !461}
!440 = metadata !{i32 589837, metadata !438, metadata !"__modeflags", metadata !441, i32 234, i64 16, i64 16, i64 0, i32 0, metadata !442} ; [ DW_TAG_member ]
!441 = metadata !{i32 589865, metadata !"uClibc_stdio.h", metadata !"/home/zehranaz/klee-uclibc/./include/bits", metadata !75} ; [ DW_TAG_file_type ]
!442 = metadata !{i32 589860, metadata !74, metadata !"short unsigned int", metadata !74, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!443 = metadata !{i32 589837, metadata !438, metadata !"__ungot_width", metadata !441, i32 237, i64 16, i64 8, i64 16, i32 0, metadata !444} ; [ DW_TAG_member ]
!444 = metadata !{i32 589825, metadata !74, metadata !"", metadata !74, i32 0, i64 16, i64 8, i64 0, i32 0, metadata !445, metadata !145, i32 0, null} ; [ DW_TAG_array_type ]
!445 = metadata !{i32 589860, metadata !74, metadata !"unsigned char", metadata !74, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!446 = metadata !{i32 589837, metadata !438, metadata !"__filedes", metadata !441, i32 244, i64 32, i64 32, i64 32, i32 0, metadata !447} ; [ DW_TAG_member ]
!447 = metadata !{i32 589860, metadata !74, metadata !"int", metadata !74, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!448 = metadata !{i32 589837, metadata !438, metadata !"__bufstart", metadata !441, i32 246, i64 64, i64 64, i64 64, i32 0, metadata !449} ; [ DW_TAG_member ]
!449 = metadata !{i32 589839, metadata !74, metadata !"", metadata !74, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !445} ; [ DW_TAG_pointer_type ]
!450 = metadata !{i32 589837, metadata !438, metadata !"__bufend", metadata !441, i32 247, i64 64, i64 64, i64 128, i32 0, metadata !449} ; [ DW_TAG_member ]
!451 = metadata !{i32 589837, metadata !438, metadata !"__bufpos", metadata !441, i32 248, i64 64, i64 64, i64 192, i32 0, metadata !449} ; [ DW_TAG_member ]
!452 = metadata !{i32 589837, metadata !438, metadata !"__bufread", metadata !441, i32 249, i64 64, i64 64, i64 256, i32 0, metadata !449} ; [ DW_TAG_member ]
!453 = metadata !{i32 589837, metadata !438, metadata !"__bufgetc_u", metadata !441, i32 252, i64 64, i64 64, i64 320, i32 0, metadata !449} ; [ DW_TAG_member ]
!454 = metadata !{i32 589837, metadata !438, metadata !"__bufputc_u", metadata !441, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !449} ; [ DW_TAG_member ]
!455 = metadata !{i32 589837, metadata !438, metadata !"__nextopen", metadata !441, i32 261, i64 64, i64 64, i64 448, i32 0, metadata !456} ; [ DW_TAG_member ]
!456 = metadata !{i32 589839, metadata !74, metadata !"", metadata !74, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !438} ; [ DW_TAG_pointer_type ]
!457 = metadata !{i32 589837, metadata !438, metadata !"__ungot", metadata !441, i32 268, i64 64, i64 32, i64 512, i32 0, metadata !458} ; [ DW_TAG_member ]
!458 = metadata !{i32 589825, metadata !74, metadata !"", metadata !74, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !459, metadata !145, i32 0, null} ; [ DW_TAG_array_type ]
!459 = metadata !{i32 589846, metadata !460, metadata !"wchar_t", metadata !460, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !447} ; [ DW_TAG_typedef ]
!460 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !75} ; [ DW_TAG_file_type ]
!461 = metadata !{i32 589837, metadata !438, metadata !"__state", metadata !441, i32 271, i64 64, i64 32, i64 576, i32 0, metadata !462} ; [ DW_TAG_member ]
!462 = metadata !{i32 589846, metadata !463, metadata !"__mbstate_t", metadata !463, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !464} ; [ DW_TAG_typedef ]
!463 = metadata !{i32 589865, metadata !"wchar.h", metadata !"/home/zehranaz/klee-uclibc/./include", metadata !75} ; [ DW_TAG_file_type ]
!464 = metadata !{i32 589843, metadata !74, metadata !"", metadata !463, i32 82, i64 64, i64 32, i64 0, i32 0, null, metadata !465, i32 0, null} ; [ DW_TAG_structure_type ]
!465 = metadata !{metadata !466, metadata !467}
!466 = metadata !{i32 589837, metadata !464, metadata !"__mask", metadata !463, i32 83, i64 32, i64 32, i64 0, i32 0, metadata !459} ; [ DW_TAG_member ]
!467 = metadata !{i32 589837, metadata !464, metadata !"__wc", metadata !463, i32 84, i64 32, i64 32, i64 32, i32 0, metadata !459} ; [ DW_TAG_member ]
!468 = metadata !{metadata !469}
!469 = metadata !{i32 589857, i64 0, i64 2}       ; [ DW_TAG_subrange_type ]
!470 = metadata !{i32 589876, i32 0, metadata !74, metadata !"stdin", metadata !"stdin", metadata !"", metadata !74, i32 154, metadata !471, i1 false, i1 true, %struct.FILE** @stdin} ; [ DW_TAG_variable ]
!471 = metadata !{i32 589839, metadata !74, metadata !"", metadata !74, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !436} ; [ DW_TAG_pointer_type ]
!472 = metadata !{i32 589876, i32 0, metadata !74, metadata !"stdout", metadata !"stdout", metadata !"", metadata !74, i32 155, metadata !471, i1 false, i1 true, %struct.FILE** @stdout} ; [ DW_TAG_variable ]
!473 = metadata !{i32 589876, i32 0, metadata !74, metadata !"stderr", metadata !"stderr", metadata !"", metadata !74, i32 156, metadata !471, i1 false, i1 true, %struct.FILE** @stderr} ; [ DW_TAG_variable ]
!474 = metadata !{i32 589876, i32 0, metadata !74, metadata !"__stdin", metadata !"__stdin", metadata !"", metadata !74, i32 159, metadata !471, i1 false, i1 true, %struct.FILE** @__stdin} ; [ DW_TAG_variable ]
!475 = metadata !{i32 589876, i32 0, metadata !74, metadata !"__stdout", metadata !"__stdout", metadata !"", metadata !74, i32 162, metadata !471, i1 false, i1 true, %struct.FILE** @__stdout} ; [ DW_TAG_variable ]
!476 = metadata !{i32 589876, i32 0, metadata !74, metadata !"_stdio_openlist", metadata !"_stdio_openlist", metadata !"", metadata !74, i32 180, metadata !456, i1 false, i1 true, %struct.FILE** @_stdio_openlist} ; [ DW_TAG_variable ]
!477 = metadata !{i32 589876, i32 0, metadata !79, metadata !"been_there_done_that", metadata !"been_there_done_that", metadata !"", metadata !79, i32 49, metadata !478, i1 true, i1 true, i32* @been_there_done_that} ; [ DW_TAG_variable ]
!478 = metadata !{i32 589860, metadata !79, metadata !"int", metadata !79, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!479 = metadata !{i32 589876, i32 0, metadata !85, metadata !"__exit_cleanup", metadata !"__exit_cleanup", metadata !"", metadata !85, i32 309, metadata !480, i1 false, i1 true, void (i32)** @__exit_cleanup} ; [ DW_TAG_variable ]
!480 = metadata !{i32 589839, metadata !83, metadata !"", metadata !83, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !86} ; [ DW_TAG_pointer_type ]
!481 = metadata !{i32 589876, i32 0, metadata !482, metadata !"errno", metadata !"errno", metadata !"", metadata !482, i32 7, metadata !484, i1 false, i1 true, i32* @errno} ; [ DW_TAG_variable ]
!482 = metadata !{i32 589865, metadata !"errno.c", metadata !"/home/zehranaz/klee-uclibc/libc/misc/internals", metadata !483} ; [ DW_TAG_file_type ]
!483 = metadata !{i32 589841, i32 0, i32 1, metadata !"errno.c", metadata !"/home/zehranaz/klee-uclibc/libc/misc/internals", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_u
!484 = metadata !{i32 589860, metadata !482, metadata !"int", metadata !482, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!485 = metadata !{i32 589876, i32 0, metadata !482, metadata !"h_errno", metadata !"h_errno", metadata !"", metadata !482, i32 8, metadata !484, i1 false, i1 true, i32* @h_errno} ; [ DW_TAG_variable ]
!486 = metadata !{i32 590081, metadata !355, metadata !"z", metadata !356, i32 12, metadata !360, i32 0} ; [ DW_TAG_arg_variable ]
!487 = metadata !{i32 590081, metadata !361, metadata !"name", metadata !362, i32 13, metadata !367, i32 0} ; [ DW_TAG_arg_variable ]
!488 = metadata !{i32 590080, metadata !489, metadata !"x", metadata !362, i32 14, metadata !366, i32 0} ; [ DW_TAG_auto_variable ]
!489 = metadata !{i32 589835, metadata !361, i32 13, i32 0, metadata !362, i32 0} ; [ DW_TAG_lexical_block ]
!490 = metadata !{i32 590081, metadata !370, metadata !"bitWidth", metadata !371, i32 20, metadata !375, i32 0} ; [ DW_TAG_arg_variable ]
!491 = metadata !{i32 590081, metadata !370, metadata !"shift", metadata !371, i32 20, metadata !375, i32 0} ; [ DW_TAG_arg_variable ]
!492 = metadata !{i32 590081, metadata !376, metadata !"start", metadata !377, i32 13, metadata !381, i32 0} ; [ DW_TAG_arg_variable ]
!493 = metadata !{i32 590081, metadata !376, metadata !"end", metadata !377, i32 13, metadata !381, i32 0} ; [ DW_TAG_arg_variable ]
!494 = metadata !{i32 590081, metadata !376, metadata !"name", metadata !377, i32 13, metadata !382, i32 0} ; [ DW_TAG_arg_variable ]
!495 = metadata !{i32 590080, metadata !496, metadata !"x", metadata !377, i32 14, metadata !381, i32 0} ; [ DW_TAG_auto_variable ]
!496 = metadata !{i32 589835, metadata !376, i32 13, i32 0, metadata !377, i32 0} ; [ DW_TAG_lexical_block ]
!497 = metadata !{i32 590081, metadata !385, metadata !"destaddr", metadata !386, i32 12, metadata !390, i32 0} ; [ DW_TAG_arg_variable ]
!498 = metadata !{i32 590081, metadata !385, metadata !"srcaddr", metadata !386, i32 12, metadata !390, i32 0} ; [ DW_TAG_arg_variable ]
!499 = metadata !{i32 590081, metadata !385, metadata !"len", metadata !386, i32 12, metadata !391, i32 0} ; [ DW_TAG_arg_variable ]
!500 = metadata !{i32 590080, metadata !501, metadata !"dest", metadata !386, i32 13, metadata !502, i32 0} ; [ DW_TAG_auto_variable ]
!501 = metadata !{i32 589835, metadata !385, i32 12, i32 0, metadata !386, i32 0} ; [ DW_TAG_lexical_block ]
!502 = metadata !{i32 589839, metadata !386, metadata !"", metadata !386, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !503} ; [ DW_TAG_pointer_type ]
!503 = metadata !{i32 589860, metadata !386, metadata !"char", metadata !386, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!504 = metadata !{i32 590080, metadata !501, metadata !"src", metadata !386, i32 14, metadata !505, i32 0} ; [ DW_TAG_auto_variable ]
!505 = metadata !{i32 589839, metadata !386, metadata !"", metadata !386, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !506} ; [ DW_TAG_pointer_type ]
!506 = metadata !{i32 589862, metadata !386, metadata !"", metadata !386, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !503} ; [ DW_TAG_const_type ]
!507 = metadata !{i32 590081, metadata !394, metadata !"dst", metadata !395, i32 12, metadata !399, i32 0} ; [ DW_TAG_arg_variable ]
!508 = metadata !{i32 590081, metadata !394, metadata !"src", metadata !395, i32 12, metadata !399, i32 0} ; [ DW_TAG_arg_variable ]
!509 = metadata !{i32 590081, metadata !394, metadata !"count", metadata !395, i32 12, metadata !400, i32 0} ; [ DW_TAG_arg_variable ]
!510 = metadata !{i32 590080, metadata !511, metadata !"a", metadata !395, i32 13, metadata !512, i32 0} ; [ DW_TAG_auto_variable ]
!511 = metadata !{i32 589835, metadata !394, i32 12, i32 0, metadata !395, i32 0} ; [ DW_TAG_lexical_block ]
!512 = metadata !{i32 589839, metadata !395, metadata !"", metadata !395, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !513} ; [ DW_TAG_pointer_type ]
!513 = metadata !{i32 589860, metadata !395, metadata !"char", metadata !395, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!514 = metadata !{i32 590080, metadata !511, metadata !"b", metadata !395, i32 14, metadata !515, i32 0} ; [ DW_TAG_auto_variable ]
!515 = metadata !{i32 589839, metadata !395, metadata !"", metadata !395, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !516} ; [ DW_TAG_pointer_type ]
!516 = metadata !{i32 589862, metadata !395, metadata !"", metadata !395, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !513} ; [ DW_TAG_const_type ]
!517 = metadata !{i32 590081, metadata !403, metadata !"destaddr", metadata !404, i32 11, metadata !408, i32 0} ; [ DW_TAG_arg_variable ]
!518 = metadata !{i32 590081, metadata !403, metadata !"srcaddr", metadata !404, i32 11, metadata !408, i32 0} ; [ DW_TAG_arg_variable ]
!519 = metadata !{i32 590081, metadata !403, metadata !"len", metadata !404, i32 11, metadata !409, i32 0} ; [ DW_TAG_arg_variable ]
!520 = metadata !{i32 590080, metadata !521, metadata !"dest", metadata !404, i32 12, metadata !522, i32 0} ; [ DW_TAG_auto_variable ]
!521 = metadata !{i32 589835, metadata !403, i32 11, i32 0, metadata !404, i32 0} ; [ DW_TAG_lexical_block ]
!522 = metadata !{i32 589839, metadata !404, metadata !"", metadata !404, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !523} ; [ DW_TAG_pointer_type ]
!523 = metadata !{i32 589860, metadata !404, metadata !"char", metadata !404, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!524 = metadata !{i32 590080, metadata !521, metadata !"src", metadata !404, i32 13, metadata !525, i32 0} ; [ DW_TAG_auto_variable ]
!525 = metadata !{i32 589839, metadata !404, metadata !"", metadata !404, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !526} ; [ DW_TAG_pointer_type ]
!526 = metadata !{i32 589862, metadata !404, metadata !"", metadata !404, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !523} ; [ DW_TAG_const_type ]
!527 = metadata !{i32 590081, metadata !412, metadata !"dst", metadata !413, i32 11, metadata !417, i32 0} ; [ DW_TAG_arg_variable ]
!528 = metadata !{i32 590081, metadata !412, metadata !"s", metadata !413, i32 11, metadata !418, i32 0} ; [ DW_TAG_arg_variable ]
!529 = metadata !{i32 590081, metadata !412, metadata !"count", metadata !413, i32 11, metadata !419, i32 0} ; [ DW_TAG_arg_variable ]
!530 = metadata !{i32 590080, metadata !531, metadata !"a", metadata !413, i32 12, metadata !532, i32 0} ; [ DW_TAG_auto_variable ]
!531 = metadata !{i32 589835, metadata !412, i32 11, i32 0, metadata !413, i32 0} ; [ DW_TAG_lexical_block ]
!532 = metadata !{i32 589839, metadata !413, metadata !"", metadata !413, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !533} ; [ DW_TAG_pointer_type ]
!533 = metadata !{i32 589877, metadata !413, metadata !"", metadata !413, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !534} ; [ DW_TAG_volatile_type ]
!534 = metadata !{i32 589860, metadata !413, metadata !"char", metadata !413, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!535 = metadata !{i32 13, i32 0, metadata !536, null}
!536 = metadata !{i32 589835, metadata !0, i32 12, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!537 = metadata !{i32 14, i32 0, metadata !536, null}
!538 = metadata !{i32 15, i32 0, metadata !536, null}
!539 = metadata !{i32 17, i32 0, metadata !536, null}
!540 = metadata !{i32 26, i32 0, metadata !541, null}
!541 = metadata !{i32 589835, metadata !8, i32 20, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!542 = metadata !{i32 27, i32 0, metadata !541, null}
!543 = metadata !{i32 28, i32 0, metadata !541, null}
!544 = metadata !{i32 30, i32 0, metadata !541, null}
!545 = metadata !{i32 139, i32 0, metadata !546, null}
!546 = metadata !{i32 589835, metadata !11, i32 137, i32 0, metadata !12, i32 0} ; [ DW_TAG_lexical_block ]
!547 = metadata !{i32 143, i32 0, metadata !548, null}
!548 = metadata !{i32 589835, metadata !546, i32 137, i32 0, metadata !12, i32 1} ; [ DW_TAG_lexical_block ]
!549 = metadata !{i32 147, i32 0, metadata !548, null}
!550 = metadata !{i32 150, i32 0, metadata !548, null}
!551 = metadata !{i32 153, i32 0, metadata !548, null}
!552 = metadata !{i32 56, i32 0, metadata !553, null}
!553 = metadata !{i32 589835, metadata !17, i32 55, i32 0, metadata !18, i32 2} ; [ DW_TAG_lexical_block ]
!554 = metadata !{i32 160, i32 0, metadata !555, null}
!555 = metadata !{i32 589835, metadata !23, i32 156, i32 0, metadata !12, i32 3} ; [ DW_TAG_lexical_block ]
!556 = metadata !{i32 161, i32 0, metadata !555, null}
!557 = metadata !{i32 162, i32 0, metadata !555, null}
!558 = metadata !{i32 163, i32 0, metadata !555, null}
!559 = metadata !{i32 165, i32 0, metadata !555, null}
!560 = metadata !{i32 166, i32 0, metadata !555, null}
!561 = metadata !{i32 168, i32 0, metadata !555, null}
!562 = metadata !{i32 191, i32 0, metadata !563, null}
!563 = metadata !{i32 589835, metadata !26, i32 188, i32 0, metadata !12, i32 4} ; [ DW_TAG_lexical_block ]
!564 = metadata !{i32 193, i32 0, metadata !563, null}
!565 = metadata !{i32 197, i32 0, metadata !563, null}
!566 = metadata !{i32 239, i32 0, metadata !563, null}
!567 = metadata !{i32 192, i32 0, metadata !563, null}
!568 = metadata !{i32 263, i32 0, metadata !569, null}
!569 = metadata !{i32 589835, metadata !29, i32 252, i32 0, metadata !12, i32 5} ; [ DW_TAG_lexical_block ]
!570 = metadata !{i32 264, i32 0, metadata !569, null}
!571 = metadata !{i32 266, i32 0, metadata !569, null}
!572 = metadata !{i32 267, i32 0, metadata !569, null}
!573 = metadata !{i32 268, i32 0, metadata !569, null}
!574 = metadata !{i32 288, i32 0, metadata !575, null}
!575 = metadata !{i32 589835, metadata !30, i32 281, i32 0, metadata !12, i32 6} ; [ DW_TAG_lexical_block ]
!576 = metadata !{i32 291, i32 0, metadata !575, null}
!577 = metadata !{i32 294, i32 0, metadata !575, null}
!578 = metadata !{i32 298, i32 0, metadata !575, null}
!579 = metadata !{i32 300, i32 0, metadata !575, null}
!580 = metadata !{i32 305, i32 0, metadata !575, null}
!581 = metadata !{i32 306, i32 0, metadata !575, null}
!582 = metadata !{i32 307, i32 0, metadata !575, null}
!583 = metadata !{i32 308, i32 0, metadata !575, null}
!584 = metadata !{i32 312, i32 0, metadata !585, null}
!585 = metadata !{i32 589835, metadata !575, i32 312, i32 0, metadata !12, i32 7} ; [ DW_TAG_lexical_block ]
!586 = metadata !{i32 313, i32 0, metadata !585, null}
!587 = metadata !{i32 314, i32 0, metadata !585, null}
!588 = metadata !{i32 316, i32 0, metadata !585, null}
!589 = metadata !{i32 311, i32 0, metadata !575, null}
!590 = metadata !{i32 323, i32 0, metadata !575, null}
!591 = metadata !{i32 327, i32 0, metadata !575, null}
!592 = metadata !{i32 331, i32 0, metadata !575, null}
!593 = metadata !{i32 336, i32 0, metadata !575, null}
!594 = metadata !{i32 337, i32 0, metadata !575, null}
!595 = metadata !{i32 338, i32 0, metadata !575, null}
!596 = metadata !{i32 342, i32 0, metadata !575, null}
!597 = metadata !{i32 354, i32 0, metadata !575, null}
!598 = metadata !{i32 370, i32 0, metadata !575, null}
!599 = metadata !{i32 371, i32 0, metadata !575, null}
!600 = metadata !{i32 391, i32 0, metadata !575, null}
!601 = metadata !{i32 392, i32 0, metadata !575, null}
!602 = metadata !{i32 395, i32 0, metadata !575, null}
!603 = metadata !{i32 396, i32 0, metadata !575, null}
!604 = metadata !{i32 401, i32 0, metadata !575, null}
!605 = metadata !{i32 20, i32 0, metadata !606, null}
!606 = metadata !{i32 589835, metadata !41, i32 19, i32 0, metadata !42, i32 0} ; [ DW_TAG_lexical_block ]
!607 = metadata !{i32 22, i32 0, metadata !606, null}
!608 = metadata !{i32 23, i32 0, metadata !606, null}
!609 = metadata !{i32 24, i32 0, metadata !606, null}
!610 = metadata !{i32 26, i32 0, metadata !606, null}
!611 = metadata !{i32 21, i32 0, metadata !50, null}
!612 = metadata !{i32 34, i32 0, metadata !613, null}
!613 = metadata !{i32 589835, metadata !50, i32 21, i32 0, metadata !51, i32 0} ; [ DW_TAG_lexical_block ]
!614 = metadata !{i32 37, i32 0, metadata !613, null}
!615 = metadata !{i32 13, i32 0, metadata !616, null}
!616 = metadata !{i32 589835, metadata !59, i32 12, i32 0, metadata !60, i32 0} ; [ DW_TAG_lexical_block ]
!617 = metadata !{i32 12, i32 0, metadata !618, null}
!618 = metadata !{i32 589835, metadata !66, i32 11, i32 0, metadata !67, i32 0} ; [ DW_TAG_lexical_block ]
!619 = metadata !{i32 258, i32 0, metadata !620, null}
!620 = metadata !{i32 589835, metadata !73, i32 211, i32 0, metadata !74, i32 0} ; [ DW_TAG_lexical_block ]
!621 = metadata !{i32 261, i32 0, metadata !620, null}
!622 = metadata !{i32 262, i32 0, metadata !620, null}
!623 = metadata !{i32 274, i32 0, metadata !620, null}
!624 = metadata !{i32 280, i32 0, metadata !625, null}
!625 = metadata !{i32 589835, metadata !77, i32 278, i32 0, metadata !74, i32 1} ; [ DW_TAG_lexical_block ]
!626 = metadata !{i32 282, i32 0, metadata !625, null}
!627 = metadata !{i32 283, i32 0, metadata !625, null}
!628 = metadata !{i32 284, i32 0, metadata !625, null}
!629 = metadata !{i32 291, i32 0, metadata !625, null}
!630 = metadata !{i32 322, i32 0, metadata !631, null}
!631 = metadata !{i32 589835, metadata !82, i32 319, i32 0, metadata !85, i32 0} ; [ DW_TAG_lexical_block ]
!632 = metadata !{i32 323, i32 0, metadata !631, null}
!633 = metadata !{i32 327, i32 0, metadata !631, null}
!634 = metadata !{i32 334, i32 0, metadata !631, null}
!635 = metadata !{i32 336, i32 0, metadata !631, null}
!636 = metadata !{i32 20, i32 0, metadata !637, null}
!637 = metadata !{i32 589835, metadata !89, i32 19, i32 0, metadata !90, i32 0} ; [ DW_TAG_lexical_block ]
!638 = metadata !{i32 21, i32 0, metadata !637, null}
!639 = metadata !{i32 29, i32 0, metadata !637, null}
!640 = metadata !{i32 30, i32 0, metadata !637, null}
!641 = metadata !{i32 28, i32 0, metadata !637, null}
!642 = metadata !{i32 34, i32 0, metadata !637, null}
!643 = metadata !{i32 19, i32 0, metadata !644, null}
!644 = metadata !{i32 589835, metadata !98, i32 18, i32 0, metadata !99, i32 0} ; [ DW_TAG_lexical_block ]
!645 = metadata !{i32 28, i32 0, metadata !644, null}
!646 = metadata !{i32 29, i32 0, metadata !644, null}
!647 = metadata !{i32 27, i32 0, metadata !644, null}
!648 = metadata !{i32 32, i32 0, metadata !644, null}
!649 = metadata !{i32 117, i32 0, metadata !108, null}
!650 = metadata !{i32 117, i32 0, metadata !651, null}
!651 = metadata !{i32 589835, metadata !108, i32 117, i32 0, metadata !111, i32 0} ; [ DW_TAG_lexical_block ]
!652 = metadata !{i32 118, i32 0, metadata !124, null}
!653 = metadata !{i32 118, i32 0, metadata !654, null}
!654 = metadata !{i32 589835, metadata !124, i32 118, i32 0, metadata !111, i32 1} ; [ DW_TAG_lexical_block ]
!655 = metadata !{i32 119, i32 0, metadata !125, null}
!656 = metadata !{i32 119, i32 0, metadata !657, null}
!657 = metadata !{i32 589835, metadata !125, i32 119, i32 0, metadata !111, i32 2} ; [ DW_TAG_lexical_block ]
!658 = metadata !{i32 23, i32 0, metadata !659, null}
!659 = metadata !{i32 589835, metadata !126, i32 18, i32 0, metadata !127, i32 0} ; [ DW_TAG_lexical_block ]
!660 = metadata !{i32 24, i32 0, metadata !659, null}
!661 = metadata !{i32 25, i32 0, metadata !659, null}
!662 = metadata !{i32 28, i32 0, metadata !659, null}
!663 = metadata !{i32 30, i32 0, metadata !664, null}
!664 = metadata !{i32 589835, metadata !168, i32 27, i32 0, metadata !169, i32 0} ; [ DW_TAG_lexical_block ]
!665 = metadata !{i32 17, i32 0, metadata !666, null}
!666 = metadata !{i32 589835, metadata !174, i32 16, i32 0, metadata !175, i32 0} ; [ DW_TAG_lexical_block ]
!667 = metadata !{i32 47, i32 0, metadata !668, null}
!668 = metadata !{i32 589835, metadata !180, i32 43, i32 0, metadata !181, i32 0} ; [ DW_TAG_lexical_block ]
!669 = metadata !{i32 48, i32 0, metadata !668, null}
!670 = metadata !{i32 49, i32 0, metadata !668, null}
!671 = metadata !{i32 50, i32 0, metadata !668, null}
!672 = metadata !{i32 52, i32 0, metadata !668, null}
!673 = metadata !{i32 58, i32 0, metadata !668, null}
!674 = metadata !{i32 62, i32 0, metadata !668, null}
!675 = metadata !{i32 63, i32 0, metadata !668, null}
!676 = metadata !{i32 64, i32 0, metadata !668, null}
!677 = metadata !{i32 65, i32 0, metadata !668, null}
!678 = metadata !{i32 67, i32 0, metadata !668, null}
!679 = metadata !{i32 71, i32 0, metadata !668, null}
!680 = metadata !{i32 44, i32 0, metadata !681, null}
!681 = metadata !{i32 589835, metadata !278, i32 35, i32 0, metadata !279, i32 0} ; [ DW_TAG_lexical_block ]
!682 = metadata !{i32 47, i32 0, metadata !681, null}
!683 = metadata !{i32 49, i32 0, metadata !681, null}
!684 = metadata !{i32 51, i32 0, metadata !681, null}
!685 = metadata !{i32 52, i32 0, metadata !681, null}
!686 = metadata !{i32 62, i32 0, metadata !681, null}
!687 = metadata !{i32 63, i32 0, metadata !681, null}
!688 = metadata !{i32 70, i32 0, metadata !681, null}
!689 = metadata !{i32 73, i32 0, metadata !681, null}
!690 = metadata !{i32 76, i32 0, metadata !691, null}
!691 = metadata !{i32 589835, metadata !681, i32 76, i32 0, metadata !279, i32 1} ; [ DW_TAG_lexical_block ]
!692 = metadata !{i32 77, i32 0, metadata !691, null}
!693 = metadata !{i32 80, i32 0, metadata !691, null}
!694 = metadata !{i32 83, i32 0, metadata !691, null}
!695 = metadata !{i32 88, i32 0, metadata !691, null}
!696 = metadata !{i32 89, i32 0, metadata !691, null}
!697 = metadata !{i32 90, i32 0, metadata !691, null}
!698 = metadata !{i32 92, i32 0, metadata !691, null}
!699 = metadata !{i32 94, i32 0, metadata !691, null}
!700 = metadata !{i32 99, i32 0, metadata !681, null}
!701 = metadata !{i32 43, i32 0, metadata !702, null}
!702 = metadata !{i32 589835, metadata !320, i32 39, i32 0, metadata !321, i32 0} ; [ DW_TAG_lexical_block ]
!703 = metadata !{i32 45, i32 0, metadata !702, null}
!704 = metadata !{i32 46, i32 0, metadata !702, null}
!705 = metadata !{i32 47, i32 0, metadata !702, null}
!706 = metadata !{i32 48, i32 0, metadata !702, null}
!707 = metadata !{i32 49, i32 0, metadata !702, null}
!708 = metadata !{i32 61, i32 0, metadata !702, null}
!709 = metadata !{i32 79, i32 0, metadata !702, null}
!710 = metadata !{i32 22, i32 0, metadata !711, null}
!711 = metadata !{i32 589835, metadata !346, i32 21, i32 0, metadata !347, i32 0} ; [ DW_TAG_lexical_block ]
!712 = metadata !{i32 23, i32 0, metadata !711, null}
!713 = metadata !{i32 31, i32 0, metadata !711, null}
!714 = metadata !{i32 32, i32 0, metadata !711, null}
!715 = metadata !{i32 30, i32 0, metadata !711, null}
!716 = metadata !{i32 36, i32 0, metadata !711, null}
!717 = metadata !{i32 13, i32 0, metadata !718, null}
!718 = metadata !{i32 589835, metadata !355, i32 12, i32 0, metadata !356, i32 0} ; [ DW_TAG_lexical_block ]
!719 = metadata !{i32 14, i32 0, metadata !718, null}
!720 = metadata !{i32 15, i32 0, metadata !718, null}
!721 = metadata !{i32 15, i32 0, metadata !489, null}
!722 = metadata !{i32 16, i32 0, metadata !489, null}
!723 = metadata !{i32 21, i32 0, metadata !724, null}
!724 = metadata !{i32 589835, metadata !370, i32 20, i32 0, metadata !371, i32 0} ; [ DW_TAG_lexical_block ]
!725 = metadata !{i32 27, i32 0, metadata !724, null}
!726 = metadata !{i32 29, i32 0, metadata !724, null}
!727 = metadata !{i32 16, i32 0, metadata !496, null}
!728 = metadata !{i32 17, i32 0, metadata !496, null}
!729 = metadata !{i32 19, i32 0, metadata !496, null}
!730 = metadata !{i32 22, i32 0, metadata !496, null}
!731 = metadata !{i32 25, i32 0, metadata !496, null}
!732 = metadata !{i32 26, i32 0, metadata !496, null}
!733 = metadata !{i32 28, i32 0, metadata !496, null}
!734 = metadata !{i32 29, i32 0, metadata !496, null}
!735 = metadata !{i32 32, i32 0, metadata !496, null}
!736 = metadata !{i32 20, i32 0, metadata !496, null}
