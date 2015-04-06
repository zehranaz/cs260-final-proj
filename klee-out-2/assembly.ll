; ModuleID = 'klee_string_test.o'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-f128:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [37 x i8] c"error! please provide valid inputs. \00", align 8
@.str1 = private unnamed_addr constant [5 x i8] c"hay1\00", align 1
@.str2 = private unnamed_addr constant [5 x i8] c"hay2\00", align 1
@.str3 = private unnamed_addr constant [7 x i8] c"needle\00", align 1
@.str4 = private constant [22 x i8] c"klee_div_zero_check.c\00", align 1
@.str15 = private constant [15 x i8] c"divide by zero\00", align 1
@.str26 = private constant [8 x i8] c"div.err\00", align 1
@.str37 = private constant [8 x i8] c"IGNORED\00", align 1
@.str14 = private constant [16 x i8] c"overshift error\00", align 1
@.str25 = private constant [14 x i8] c"overshift.err\00", align 1
@.str6 = private constant [13 x i8] c"klee_range.c\00", align 1
@.str17 = private constant [14 x i8] c"invalid range\00", align 1
@.str28 = private constant [5 x i8] c"user\00", align 1

define i8* @string_concat(i8* %front, i8* %back) nounwind {
entry:
  %front_addr = alloca i8*, align 8
  %back_addr = alloca i8*, align 8
  %retval = alloca i8*
  %0 = alloca i8*
  %front_count = alloca i32
  %back_count = alloca i32
  %return_val = alloca i8*
  %combined = alloca i8*
  %"alloca point" = bitcast i32 0 to i32
  store i8* %front, i8** %front_addr
  store i8* %back, i8** %back_addr
  %1 = load i8** %front_addr, align 8, !dbg !130
  %2 = icmp eq i8* %1, null, !dbg !130
  br i1 %2, label %bb1, label %bb, !dbg !130

bb:                                               ; preds = %entry
  %3 = load i8** %back_addr, align 8, !dbg !130
  %4 = icmp eq i8* %3, null, !dbg !130
  br i1 %4, label %bb1, label %bb2, !dbg !130

bb1:                                              ; preds = %bb, %entry
  %5 = call i32 @puts(i8* getelementptr inbounds ([37 x i8]* @.str, i64 0, i64 0)) nounwind, !dbg !132
  store i8* null, i8** %0, align 8, !dbg !133
  br label %bb3, !dbg !133

bb2:                                              ; preds = %bb
  %6 = load i8** %front_addr, align 8, !dbg !134
  %7 = call i64 @strlen(i8* %6) nounwind readonly, !dbg !134
  %8 = trunc i64 %7 to i32, !dbg !134
  store i32 %8, i32* %front_count, align 4, !dbg !134
  %9 = load i8** %back_addr, align 8, !dbg !135
  %10 = call i64 @strlen(i8* %9) nounwind readonly, !dbg !135
  %11 = trunc i64 %10 to i32, !dbg !135
  store i32 %11, i32* %back_count, align 4, !dbg !135
  %12 = load i32* %front_count, align 4, !dbg !136
  %13 = load i32* %back_count, align 4, !dbg !136
  %14 = add nsw i32 %12, %13, !dbg !136
  %15 = add nsw i32 %14, 1, !dbg !136
  %16 = sext i32 %15 to i64, !dbg !136
  %17 = call noalias i8* @malloc(i64 %16) nounwind, !dbg !136
  store i8* %17, i8** %return_val, align 8, !dbg !136
  %18 = load i8** %front_addr, align 8, !dbg !137
  %19 = load i8** %back_addr, align 8, !dbg !137
  %20 = call i8* @strcat(i8* noalias %18, i8* noalias %19) nounwind, !dbg !137
  store i8* %20, i8** %combined, align 8, !dbg !137
  %21 = load i8** %return_val, align 8, !dbg !138
  %22 = load i8** %combined, align 8, !dbg !138
  %23 = call i8* @strcpy(i8* noalias %21, i8* noalias %22) nounwind, !dbg !138
  %24 = load i8** %return_val, align 8, !dbg !139
  store i8* %24, i8** %0, align 8, !dbg !139
  br label %bb3, !dbg !139

bb3:                                              ; preds = %bb2, %bb1
  %25 = load i8** %0, align 8, !dbg !133
  store i8* %25, i8** %retval, align 8, !dbg !133
  %retval4 = load i8** %retval, !dbg !133
  ret i8* %retval4, !dbg !133
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare i32 @puts(i8*)

declare i64 @strlen(i8*) nounwind readonly

declare noalias i8* @malloc(i64) nounwind

declare i8* @strcat(i8* noalias, i8* noalias) nounwind

declare i8* @strcpy(i8* noalias, i8* noalias) nounwind

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
  %1 = load i8** %hay1_addr, align 8, !dbg !140
  %2 = load i8** %hay2_addr, align 8, !dbg !140
  %3 = call i8* @strcat(i8* noalias %1, i8* noalias %2) nounwind, !dbg !140
  store i8* %3, i8** %haystack, align 8, !dbg !140
  %4 = load i8** %needle_addr, align 8, !dbg !142
  %5 = load i8** %haystack, align 8, !dbg !142
  %6 = call i32 @strcmp(i8* %4, i8* %5) nounwind readonly, !dbg !142
  %7 = icmp eq i32 %6, 0, !dbg !142
  br i1 %7, label %bb, label %bb1, !dbg !142

bb:                                               ; preds = %entry
  store i32 1, i32* %0, align 4, !dbg !143
  br label %bb2, !dbg !143

bb1:                                              ; preds = %entry
  store i32 0, i32* %0, align 4, !dbg !144
  br label %bb2, !dbg !144

bb2:                                              ; preds = %bb1, %bb
  %8 = load i32* %0, align 4, !dbg !143
  store i32 %8, i32* %retval, align 4, !dbg !143
  %retval3 = load i32* %retval, !dbg !143
  ret i32 %retval3, !dbg !143
}

declare i32 @strcmp(i8*, i8*) nounwind readonly

define i32 @main() nounwind {
entry:
  %retval = alloca i32
  %0 = alloca i32
  %hay1 = alloca [256 x i8]
  %hay2 = alloca [256 x i8]
  %needle = alloca [256 x i8]
  %"alloca point" = bitcast i32 0 to i32
  %hay11 = bitcast [256 x i8]* %hay1 to i8*, !dbg !145
  call void @klee_make_symbolic(i8* %hay11, i64 256, i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind, !dbg !145
  %hay22 = bitcast [256 x i8]* %hay2 to i8*, !dbg !147
  call void @klee_make_symbolic(i8* %hay22, i64 256, i8* getelementptr inbounds ([5 x i8]* @.str2, i64 0, i64 0)) nounwind, !dbg !147
  %needle3 = bitcast [256 x i8]* %needle to i8*, !dbg !148
  call void @klee_make_symbolic(i8* %needle3, i64 256, i8* getelementptr inbounds ([7 x i8]* @.str3, i64 0, i64 0)) nounwind, !dbg !148
  %hay14 = bitcast [256 x i8]* %hay1 to i8*, !dbg !149
  %hay25 = bitcast [256 x i8]* %hay2 to i8*, !dbg !149
  %needle6 = bitcast [256 x i8]* %needle to i8*, !dbg !149
  %1 = call i32 @find_needle_in_haystack(i8* %hay14, i8* %hay25, i8* %needle6) nounwind, !dbg !149
  store i32 %1, i32* %0, align 4, !dbg !149
  %2 = load i32* %0, align 4, !dbg !149
  store i32 %2, i32* %retval, align 4, !dbg !149
  %retval7 = load i32* %retval, !dbg !149
  ret i32 %retval7, !dbg !149
}

declare void @klee_make_symbolic(i8*, i64, i8*)

define void @klee_div_zero_check(i64 %z) nounwind {
entry:
  %0 = icmp eq i64 %z, 0, !dbg !150
  br i1 %0, label %bb, label %return, !dbg !150

bb:                                               ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str15, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str26, i64 0, i64 0)) noreturn nounwind, !dbg
  unreachable, !dbg !152

return:                                           ; preds = %entry
  ret void, !dbg !153
}

declare void @klee_report_error(i8*, i32, i8*, i8*) noreturn

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i32 @klee_int(i8* %name) nounwind {
entry:
  %x = alloca i32, align 4
  %x1 = bitcast i32* %x to i8*, !dbg !154
  call void @klee_make_symbolic(i8* %x1, i64 4, i8* %name) nounwind, !dbg !154
  %0 = load i32* %x, align 4, !dbg !155
  ret i32 %0, !dbg !155
}

define void @klee_overshift_check(i64 %bitWidth, i64 %shift) nounwind {
entry:
  %0 = icmp ult i64 %shift, %bitWidth, !dbg !156
  br i1 %0, label %return, label %bb, !dbg !156

bb:                                               ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str37, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) noreturn nounwind, !dbg
  unreachable, !dbg !158

return:                                           ; preds = %entry
  ret void, !dbg !159
}

define i32 @klee_range(i32 %start, i32 %end, i8* %name) nounwind {
entry:
  %x = alloca i32, align 4
  %0 = icmp slt i32 %start, %end, !dbg !160
  br i1 %0, label %bb1, label %bb, !dbg !160

bb:                                               ; preds = %entry
  call void @klee_report_error(i8* getelementptr inbounds ([13 x i8]* @.str6, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) noreturn nounwind, !dbg !161
  unreachable, !dbg !161

bb1:                                              ; preds = %entry
  %1 = add nsw i32 %start, 1, !dbg !162
  %2 = icmp eq i32 %1, %end, !dbg !162
  br i1 %2, label %bb8, label %bb3, !dbg !162

bb3:                                              ; preds = %bb1
  %x4 = bitcast i32* %x to i8*, !dbg !163
  call void @klee_make_symbolic(i8* %x4, i64 4, i8* %name) nounwind, !dbg !163
  %3 = icmp eq i32 %start, 0, !dbg !164
  %4 = load i32* %x, align 4, !dbg !165
  br i1 %3, label %bb5, label %bb6, !dbg !164

bb5:                                              ; preds = %bb3
  %5 = icmp ult i32 %4, %end, !dbg !165
  %6 = zext i1 %5 to i64, !dbg !165
  call void @klee_assume(i64 %6) nounwind, !dbg !165
  br label %bb7, !dbg !165

bb6:                                              ; preds = %bb3
  %7 = icmp sge i32 %4, %start, !dbg !166
  %8 = zext i1 %7 to i64, !dbg !166
  call void @klee_assume(i64 %8) nounwind, !dbg !166
  %9 = load i32* %x, align 4, !dbg !167
  %10 = icmp slt i32 %9, %end, !dbg !167
  %11 = zext i1 %10 to i64, !dbg !167
  call void @klee_assume(i64 %11) nounwind, !dbg !167
  br label %bb7, !dbg !167

bb7:                                              ; preds = %bb6, %bb5
  %12 = load i32* %x, align 4, !dbg !168
  br label %bb8, !dbg !168

bb8:                                              ; preds = %bb7, %bb1
  %.0 = phi i32 [ %12, %bb7 ], [ %start, %bb1 ]
  ret i32 %.0, !dbg !169
}

declare void @klee_assume(i64)

define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) nounwind {
entry:
  %0 = icmp eq i64 %len, 0, !dbg !170
  br i1 %0, label %bb2, label %bb, !dbg !170

bb:                                               ; preds = %bb, %entry
  %indvar = phi i64 [ %indvar.next, %bb ], [ 0, %entry ]
  %dest.05 = getelementptr i8* %destaddr, i64 %indvar
  %src.06 = getelementptr i8* %srcaddr, i64 %indvar
  %1 = load i8* %src.06, align 1, !dbg !171
  store i8 %1, i8* %dest.05, align 1, !dbg !171
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %len
  br i1 %exitcond1, label %bb1.bb2_crit_edge, label %bb, !dbg !170

bb1.bb2_crit_edge:                                ; preds = %bb
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %bb2

bb2:                                              ; preds = %bb1.bb2_crit_edge, %entry
  %dest.0.lcssa = phi i8* [ %scevgep, %bb1.bb2_crit_edge ], [ %destaddr, %entry ]
  ret i8* %dest.0.lcssa, !dbg !172
}

!llvm.dbg.sp = !{!0, !7, !11, !14, !20, !29, !35, !44, !53, !62, !71}
!llvm.dbg.lv.klee_div_zero_check = !{!81}
!llvm.dbg.lv.klee_int = !{!82, !83}
!llvm.dbg.lv.klee_overshift_check = !{!85, !86}
!llvm.dbg.lv.klee_range = !{!87, !88, !89, !90}
!llvm.dbg.lv.memcpy = !{!92, !93, !94, !95, !99}
!llvm.dbg.lv.memmove = !{!102, !103, !104, !105, !109}
!llvm.dbg.lv.mempcpy = !{!112, !113, !114, !115, !119}
!llvm.dbg.lv.memset = !{!122, !123, !124, !125}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"string_concat", metadata !"string_concat", metadata !"string_concat", metadata !1, i32 12, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i8*)* @string_concat} ;
!1 = metadata !{i32 589865, metadata !"klee_string_test.c", metadata !"/home/zehranaz/finalproj/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_string_test.c", metadata !"/home/zehranaz/finalproj/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !5, metadata !5}
!5 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !6} ; [ DW_TAG_pointer_type ]
!6 = metadata !{i32 589860, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!7 = metadata !{i32 589870, i32 0, metadata !1, metadata !"find_needle_in_haystack", metadata !"find_needle_in_haystack", metadata !"find_needle_in_haystack", metadata !1, i32 30, metadata !8, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32
!8 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !9, i32 0, null} ; [ DW_TAG_subroutine_type ]
!9 = metadata !{metadata !10, metadata !5, metadata !5, metadata !5}
!10 = metadata !{i32 589860, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!11 = metadata !{i32 589870, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"main", metadata !1, i32 38, metadata !12, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main} ; [ DW_TAG_subprogram ]
!12 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !13, i32 0, null} ; [ DW_TAG_subroutine_type ]
!13 = metadata !{metadata !10}
!14 = metadata !{i32 589870, i32 0, metadata !15, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !15, i32 12, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* 
!15 = metadata !{i32 589865, metadata !"klee_div_zero_check.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !16} ; [ DW_TAG_file_type ]
!16 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_div_zero_check.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compi
!17 = metadata !{i32 589845, metadata !15, metadata !"", metadata !15, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null} ; [ DW_TAG_subroutine_type ]
!18 = metadata !{null, metadata !19}
!19 = metadata !{i32 589860, metadata !15, metadata !"long long int", metadata !15, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!20 = metadata !{i32 589870, i32 0, metadata !21, metadata !"klee_int", metadata !"klee_int", metadata !"klee_int", metadata !21, i32 13, metadata !23, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int} ; [ DW_TAG_subprogram ]
!21 = metadata !{i32 589865, metadata !"klee_int.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !22} ; [ DW_TAG_file_type ]
!22 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_int.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!23 = metadata !{i32 589845, metadata !21, metadata !"", metadata !21, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !24, i32 0, null} ; [ DW_TAG_subroutine_type ]
!24 = metadata !{metadata !25, metadata !26}
!25 = metadata !{i32 589860, metadata !21, metadata !"int", metadata !21, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!26 = metadata !{i32 589839, metadata !21, metadata !"", metadata !21, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !27} ; [ DW_TAG_pointer_type ]
!27 = metadata !{i32 589862, metadata !21, metadata !"", metadata !21, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !28} ; [ DW_TAG_const_type ]
!28 = metadata !{i32 589860, metadata !21, metadata !"char", metadata !21, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!29 = metadata !{i32 589870, i32 0, metadata !30, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !30, i32 20, metadata !32, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64
!30 = metadata !{i32 589865, metadata !"klee_overshift_check.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !31} ; [ DW_TAG_file_type ]
!31 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_overshift_check.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_comp
!32 = metadata !{i32 589845, metadata !30, metadata !"", metadata !30, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !33, i32 0, null} ; [ DW_TAG_subroutine_type ]
!33 = metadata !{null, metadata !34, metadata !34}
!34 = metadata !{i32 589860, metadata !30, metadata !"long long unsigned int", metadata !30, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!35 = metadata !{i32 589870, i32 0, metadata !36, metadata !"klee_range", metadata !"klee_range", metadata !"klee_range", metadata !36, i32 13, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range} ; [ D
!36 = metadata !{i32 589865, metadata !"klee_range.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !37} ; [ DW_TAG_file_type ]
!37 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_range.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!38 = metadata !{i32 589845, metadata !36, metadata !"", metadata !36, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, null} ; [ DW_TAG_subroutine_type ]
!39 = metadata !{metadata !40, metadata !40, metadata !40, metadata !41}
!40 = metadata !{i32 589860, metadata !36, metadata !"int", metadata !36, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!41 = metadata !{i32 589839, metadata !36, metadata !"", metadata !36, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !42} ; [ DW_TAG_pointer_type ]
!42 = metadata !{i32 589862, metadata !36, metadata !"", metadata !36, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !43} ; [ DW_TAG_const_type ]
!43 = metadata !{i32 589860, metadata !36, metadata !"char", metadata !36, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!44 = metadata !{i32 589870, i32 0, metadata !45, metadata !"memcpy", metadata !"memcpy", metadata !"memcpy", metadata !45, i32 12, metadata !47, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!45 = metadata !{i32 589865, metadata !"memcpy.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !46} ; [ DW_TAG_file_type ]
!46 = metadata !{i32 589841, i32 0, i32 1, metadata !"memcpy.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!47 = metadata !{i32 589845, metadata !45, metadata !"", metadata !45, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !48, i32 0, null} ; [ DW_TAG_subroutine_type ]
!48 = metadata !{metadata !49, metadata !49, metadata !49, metadata !50}
!49 = metadata !{i32 589839, metadata !45, metadata !"", metadata !45, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!50 = metadata !{i32 589846, metadata !51, metadata !"size_t", metadata !51, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ]
!51 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !46} ; [ DW_TAG_file_type ]
!52 = metadata !{i32 589860, metadata !45, metadata !"long unsigned int", metadata !45, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!53 = metadata !{i32 589870, i32 0, metadata !54, metadata !"memmove", metadata !"memmove", metadata !"memmove", metadata !54, i32 12, metadata !56, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!54 = metadata !{i32 589865, metadata !"memmove.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !55} ; [ DW_TAG_file_type ]
!55 = metadata !{i32 589841, i32 0, i32 1, metadata !"memmove.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!56 = metadata !{i32 589845, metadata !54, metadata !"", metadata !54, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !57, i32 0, null} ; [ DW_TAG_subroutine_type ]
!57 = metadata !{metadata !58, metadata !58, metadata !58, metadata !59}
!58 = metadata !{i32 589839, metadata !54, metadata !"", metadata !54, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!59 = metadata !{i32 589846, metadata !60, metadata !"size_t", metadata !60, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !61} ; [ DW_TAG_typedef ]
!60 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !55} ; [ DW_TAG_file_type ]
!61 = metadata !{i32 589860, metadata !54, metadata !"long unsigned int", metadata !54, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!62 = metadata !{i32 589870, i32 0, metadata !63, metadata !"mempcpy", metadata !"mempcpy", metadata !"mempcpy", metadata !63, i32 11, metadata !65, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy} ; [ DW_TAG_subpro
!63 = metadata !{i32 589865, metadata !"mempcpy.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !64} ; [ DW_TAG_file_type ]
!64 = metadata !{i32 589841, i32 0, i32 1, metadata !"mempcpy.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!65 = metadata !{i32 589845, metadata !63, metadata !"", metadata !63, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, null} ; [ DW_TAG_subroutine_type ]
!66 = metadata !{metadata !67, metadata !67, metadata !67, metadata !68}
!67 = metadata !{i32 589839, metadata !63, metadata !"", metadata !63, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!68 = metadata !{i32 589846, metadata !69, metadata !"size_t", metadata !69, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !70} ; [ DW_TAG_typedef ]
!69 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !64} ; [ DW_TAG_file_type ]
!70 = metadata !{i32 589860, metadata !63, metadata !"long unsigned int", metadata !63, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!71 = metadata !{i32 589870, i32 0, metadata !72, metadata !"memset", metadata !"memset", metadata !"memset", metadata !72, i32 11, metadata !74, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!72 = metadata !{i32 589865, metadata !"memset.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !73} ; [ DW_TAG_file_type ]
!73 = metadata !{i32 589841, i32 0, i32 1, metadata !"memset.c", metadata !"/home/zehranaz/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!74 = metadata !{i32 589845, metadata !72, metadata !"", metadata !72, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !75, i32 0, null} ; [ DW_TAG_subroutine_type ]
!75 = metadata !{metadata !76, metadata !76, metadata !77, metadata !78}
!76 = metadata !{i32 589839, metadata !72, metadata !"", metadata !72, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!77 = metadata !{i32 589860, metadata !72, metadata !"int", metadata !72, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!78 = metadata !{i32 589846, metadata !79, metadata !"size_t", metadata !79, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !80} ; [ DW_TAG_typedef ]
!79 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/local/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !73} ; [ DW_TAG_file_type ]
!80 = metadata !{i32 589860, metadata !72, metadata !"long unsigned int", metadata !72, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!81 = metadata !{i32 590081, metadata !14, metadata !"z", metadata !15, i32 12, metadata !19, i32 0} ; [ DW_TAG_arg_variable ]
!82 = metadata !{i32 590081, metadata !20, metadata !"name", metadata !21, i32 13, metadata !26, i32 0} ; [ DW_TAG_arg_variable ]
!83 = metadata !{i32 590080, metadata !84, metadata !"x", metadata !21, i32 14, metadata !25, i32 0} ; [ DW_TAG_auto_variable ]
!84 = metadata !{i32 589835, metadata !20, i32 13, i32 0, metadata !21, i32 0} ; [ DW_TAG_lexical_block ]
!85 = metadata !{i32 590081, metadata !29, metadata !"bitWidth", metadata !30, i32 20, metadata !34, i32 0} ; [ DW_TAG_arg_variable ]
!86 = metadata !{i32 590081, metadata !29, metadata !"shift", metadata !30, i32 20, metadata !34, i32 0} ; [ DW_TAG_arg_variable ]
!87 = metadata !{i32 590081, metadata !35, metadata !"start", metadata !36, i32 13, metadata !40, i32 0} ; [ DW_TAG_arg_variable ]
!88 = metadata !{i32 590081, metadata !35, metadata !"end", metadata !36, i32 13, metadata !40, i32 0} ; [ DW_TAG_arg_variable ]
!89 = metadata !{i32 590081, metadata !35, metadata !"name", metadata !36, i32 13, metadata !41, i32 0} ; [ DW_TAG_arg_variable ]
!90 = metadata !{i32 590080, metadata !91, metadata !"x", metadata !36, i32 14, metadata !40, i32 0} ; [ DW_TAG_auto_variable ]
!91 = metadata !{i32 589835, metadata !35, i32 13, i32 0, metadata !36, i32 0} ; [ DW_TAG_lexical_block ]
!92 = metadata !{i32 590081, metadata !44, metadata !"destaddr", metadata !45, i32 12, metadata !49, i32 0} ; [ DW_TAG_arg_variable ]
!93 = metadata !{i32 590081, metadata !44, metadata !"srcaddr", metadata !45, i32 12, metadata !49, i32 0} ; [ DW_TAG_arg_variable ]
!94 = metadata !{i32 590081, metadata !44, metadata !"len", metadata !45, i32 12, metadata !50, i32 0} ; [ DW_TAG_arg_variable ]
!95 = metadata !{i32 590080, metadata !96, metadata !"dest", metadata !45, i32 13, metadata !97, i32 0} ; [ DW_TAG_auto_variable ]
!96 = metadata !{i32 589835, metadata !44, i32 12, i32 0, metadata !45, i32 0} ; [ DW_TAG_lexical_block ]
!97 = metadata !{i32 589839, metadata !45, metadata !"", metadata !45, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !98} ; [ DW_TAG_pointer_type ]
!98 = metadata !{i32 589860, metadata !45, metadata !"char", metadata !45, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!99 = metadata !{i32 590080, metadata !96, metadata !"src", metadata !45, i32 14, metadata !100, i32 0} ; [ DW_TAG_auto_variable ]
!100 = metadata !{i32 589839, metadata !45, metadata !"", metadata !45, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !101} ; [ DW_TAG_pointer_type ]
!101 = metadata !{i32 589862, metadata !45, metadata !"", metadata !45, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !98} ; [ DW_TAG_const_type ]
!102 = metadata !{i32 590081, metadata !53, metadata !"dst", metadata !54, i32 12, metadata !58, i32 0} ; [ DW_TAG_arg_variable ]
!103 = metadata !{i32 590081, metadata !53, metadata !"src", metadata !54, i32 12, metadata !58, i32 0} ; [ DW_TAG_arg_variable ]
!104 = metadata !{i32 590081, metadata !53, metadata !"count", metadata !54, i32 12, metadata !59, i32 0} ; [ DW_TAG_arg_variable ]
!105 = metadata !{i32 590080, metadata !106, metadata !"a", metadata !54, i32 13, metadata !107, i32 0} ; [ DW_TAG_auto_variable ]
!106 = metadata !{i32 589835, metadata !53, i32 12, i32 0, metadata !54, i32 0} ; [ DW_TAG_lexical_block ]
!107 = metadata !{i32 589839, metadata !54, metadata !"", metadata !54, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !108} ; [ DW_TAG_pointer_type ]
!108 = metadata !{i32 589860, metadata !54, metadata !"char", metadata !54, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!109 = metadata !{i32 590080, metadata !106, metadata !"b", metadata !54, i32 14, metadata !110, i32 0} ; [ DW_TAG_auto_variable ]
!110 = metadata !{i32 589839, metadata !54, metadata !"", metadata !54, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !111} ; [ DW_TAG_pointer_type ]
!111 = metadata !{i32 589862, metadata !54, metadata !"", metadata !54, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !108} ; [ DW_TAG_const_type ]
!112 = metadata !{i32 590081, metadata !62, metadata !"destaddr", metadata !63, i32 11, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!113 = metadata !{i32 590081, metadata !62, metadata !"srcaddr", metadata !63, i32 11, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!114 = metadata !{i32 590081, metadata !62, metadata !"len", metadata !63, i32 11, metadata !68, i32 0} ; [ DW_TAG_arg_variable ]
!115 = metadata !{i32 590080, metadata !116, metadata !"dest", metadata !63, i32 12, metadata !117, i32 0} ; [ DW_TAG_auto_variable ]
!116 = metadata !{i32 589835, metadata !62, i32 11, i32 0, metadata !63, i32 0} ; [ DW_TAG_lexical_block ]
!117 = metadata !{i32 589839, metadata !63, metadata !"", metadata !63, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !118} ; [ DW_TAG_pointer_type ]
!118 = metadata !{i32 589860, metadata !63, metadata !"char", metadata !63, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!119 = metadata !{i32 590080, metadata !116, metadata !"src", metadata !63, i32 13, metadata !120, i32 0} ; [ DW_TAG_auto_variable ]
!120 = metadata !{i32 589839, metadata !63, metadata !"", metadata !63, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !121} ; [ DW_TAG_pointer_type ]
!121 = metadata !{i32 589862, metadata !63, metadata !"", metadata !63, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !118} ; [ DW_TAG_const_type ]
!122 = metadata !{i32 590081, metadata !71, metadata !"dst", metadata !72, i32 11, metadata !76, i32 0} ; [ DW_TAG_arg_variable ]
!123 = metadata !{i32 590081, metadata !71, metadata !"s", metadata !72, i32 11, metadata !77, i32 0} ; [ DW_TAG_arg_variable ]
!124 = metadata !{i32 590081, metadata !71, metadata !"count", metadata !72, i32 11, metadata !78, i32 0} ; [ DW_TAG_arg_variable ]
!125 = metadata !{i32 590080, metadata !126, metadata !"a", metadata !72, i32 12, metadata !127, i32 0} ; [ DW_TAG_auto_variable ]
!126 = metadata !{i32 589835, metadata !71, i32 11, i32 0, metadata !72, i32 0} ; [ DW_TAG_lexical_block ]
!127 = metadata !{i32 589839, metadata !72, metadata !"", metadata !72, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !128} ; [ DW_TAG_pointer_type ]
!128 = metadata !{i32 589877, metadata !72, metadata !"", metadata !72, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !129} ; [ DW_TAG_volatile_type ]
!129 = metadata !{i32 589860, metadata !72, metadata !"char", metadata !72, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!130 = metadata !{i32 14, i32 0, metadata !131, null}
!131 = metadata !{i32 589835, metadata !0, i32 12, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!132 = metadata !{i32 15, i32 0, metadata !131, null}
!133 = metadata !{i32 16, i32 0, metadata !131, null}
!134 = metadata !{i32 19, i32 0, metadata !131, null}
!135 = metadata !{i32 20, i32 0, metadata !131, null}
!136 = metadata !{i32 23, i32 0, metadata !131, null}
!137 = metadata !{i32 24, i32 0, metadata !131, null}
!138 = metadata !{i32 25, i32 0, metadata !131, null}
!139 = metadata !{i32 26, i32 0, metadata !131, null}
!140 = metadata !{i32 31, i32 0, metadata !141, null}
!141 = metadata !{i32 589835, metadata !7, i32 30, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!142 = metadata !{i32 32, i32 0, metadata !141, null}
!143 = metadata !{i32 33, i32 0, metadata !141, null}
!144 = metadata !{i32 35, i32 0, metadata !141, null}
!145 = metadata !{i32 45, i32 0, metadata !146, null}
!146 = metadata !{i32 589835, metadata !11, i32 38, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!147 = metadata !{i32 46, i32 0, metadata !146, null}
!148 = metadata !{i32 47, i32 0, metadata !146, null}
!149 = metadata !{i32 48, i32 0, metadata !146, null}
!150 = metadata !{i32 13, i32 0, metadata !151, null}
!151 = metadata !{i32 589835, metadata !14, i32 12, i32 0, metadata !15, i32 0} ; [ DW_TAG_lexical_block ]
!152 = metadata !{i32 14, i32 0, metadata !151, null}
!153 = metadata !{i32 15, i32 0, metadata !151, null}
!154 = metadata !{i32 15, i32 0, metadata !84, null}
!155 = metadata !{i32 16, i32 0, metadata !84, null}
!156 = metadata !{i32 21, i32 0, metadata !157, null}
!157 = metadata !{i32 589835, metadata !29, i32 20, i32 0, metadata !30, i32 0} ; [ DW_TAG_lexical_block ]
!158 = metadata !{i32 27, i32 0, metadata !157, null}
!159 = metadata !{i32 29, i32 0, metadata !157, null}
!160 = metadata !{i32 16, i32 0, metadata !91, null}
!161 = metadata !{i32 17, i32 0, metadata !91, null}
!162 = metadata !{i32 19, i32 0, metadata !91, null}
!163 = metadata !{i32 22, i32 0, metadata !91, null}
!164 = metadata !{i32 25, i32 0, metadata !91, null}
!165 = metadata !{i32 26, i32 0, metadata !91, null}
!166 = metadata !{i32 28, i32 0, metadata !91, null}
!167 = metadata !{i32 29, i32 0, metadata !91, null}
!168 = metadata !{i32 32, i32 0, metadata !91, null}
!169 = metadata !{i32 20, i32 0, metadata !91, null}
!170 = metadata !{i32 15, i32 0, metadata !116, null}
!171 = metadata !{i32 16, i32 0, metadata !116, null}
!172 = metadata !{i32 17, i32 0, metadata !116, null}
