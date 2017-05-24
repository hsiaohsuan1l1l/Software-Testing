; ModuleID = 'main_klee.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"m\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"d\00", align 1
@.str3 = private unnamed_addr constant [13 x i8] c"InvalidInput\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"%d.%d.%d\00", align 1
@.str5 = private unnamed_addr constant [60 x i8] c"/home/klee/klee_src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str16 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str27 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str38 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str14 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str25 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1
@.str6 = private unnamed_addr constant [51 x i8] c"/home/klee/klee_src/runtime/Intrinsic/klee_range.c\00", align 1
@.str17 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1
@.str28 = private unnamed_addr constant [5 x i8] c"user\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %y = alloca i32, align 4
  %m = alloca i32, align 4
  %d = alloca i32, align 4
  %edgeday = alloca i32, align 4
  store i32 0, i32* %1
  %2 = bitcast i32* %y to i8*, !dbg !120
  call void @klee_make_symbolic(i8* %2, i64 4, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)), !dbg !120
  %3 = bitcast i32* %m to i8*, !dbg !121
  call void @klee_make_symbolic(i8* %3, i64 4, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)), !dbg !121
  %4 = bitcast i32* %d to i8*, !dbg !122
  call void @klee_make_symbolic(i8* %4, i64 4, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !122
  %5 = load i32* %y, align 4, !dbg !123
  %6 = icmp slt i32 %5, 1, !dbg !123
  %7 = load i32* %m, align 4, !dbg !123
  %8 = icmp slt i32 %7, 1, !dbg !123
  %or.cond = or i1 %6, %8, !dbg !123
  %9 = load i32* %m, align 4, !dbg !123
  %10 = icmp sgt i32 %9, 12, !dbg !123
  %or.cond5 = or i1 %or.cond, %10, !dbg !123
  %11 = load i32* %d, align 4, !dbg !123
  %12 = icmp slt i32 %11, 1, !dbg !123
  %or.cond7 = or i1 %or.cond5, %12, !dbg !123
  %13 = load i32* %d, align 4, !dbg !123
  %14 = icmp sgt i32 %13, 31, !dbg !123
  %or.cond9 = or i1 %or.cond7, %14, !dbg !123
  br i1 %or.cond9, label %15, label %17, !dbg !123

; <label>:15                                      ; preds = %0
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str3, i32 0, i32 0)), !dbg !125
  br label %17, !dbg !125

; <label>:17                                      ; preds = %0, %15
  %18 = load i32* %m, align 4, !dbg !126
  %19 = icmp eq i32 %18, 1, !dbg !126
  %20 = load i32* %m, align 4, !dbg !126
  %21 = icmp eq i32 %20, 3, !dbg !126
  %or.cond11 = or i1 %19, %21, !dbg !126
  %22 = load i32* %m, align 4, !dbg !126
  %23 = icmp eq i32 %22, 5, !dbg !126
  %or.cond13 = or i1 %or.cond11, %23, !dbg !126
  %24 = load i32* %m, align 4, !dbg !126
  %25 = icmp eq i32 %24, 7, !dbg !126
  %or.cond15 = or i1 %or.cond13, %25, !dbg !126
  %26 = load i32* %m, align 4, !dbg !126
  %27 = icmp eq i32 %26, 8, !dbg !126
  %or.cond17 = or i1 %or.cond15, %27, !dbg !126
  %28 = load i32* %m, align 4, !dbg !126
  %29 = icmp eq i32 %28, 10, !dbg !126
  %or.cond19 = or i1 %or.cond17, %29, !dbg !126
  %30 = load i32* %m, align 4, !dbg !126
  %31 = icmp eq i32 %30, 12, !dbg !126
  %or.cond21 = or i1 %or.cond19, %31, !dbg !126
  br i1 %or.cond21, label %32, label %33, !dbg !126

; <label>:32                                      ; preds = %17
  store i32 31, i32* %edgeday, align 4, !dbg !128
  br label %54, !dbg !128

; <label>:33                                      ; preds = %17
  %34 = load i32* %m, align 4, !dbg !129
  %35 = icmp eq i32 %34, 2, !dbg !129
  br i1 %35, label %36, label %49, !dbg !129

; <label>:36                                      ; preds = %33
  %37 = load i32* %y, align 4, !dbg !129
  %int_cast_to_i64 = zext i32 400 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !129
  %38 = srem i32 %37, 400, !dbg !129
  %39 = icmp eq i32 %38, 0, !dbg !129
  br i1 %39, label %48, label %40, !dbg !129

; <label>:40                                      ; preds = %36
  %41 = load i32* %y, align 4, !dbg !129
  %int_cast_to_i641 = zext i32 4 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !129
  %42 = srem i32 %41, 4, !dbg !129
  %43 = icmp eq i32 %42, 0, !dbg !129
  br i1 %43, label %44, label %49, !dbg !129

; <label>:44                                      ; preds = %40
  %45 = load i32* %y, align 4, !dbg !129
  %int_cast_to_i642 = zext i32 100 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !129
  %46 = srem i32 %45, 100, !dbg !129
  %47 = icmp ne i32 %46, 0, !dbg !129
  br i1 %47, label %48, label %49, !dbg !129

; <label>:48                                      ; preds = %44, %36
  store i32 29, i32* %edgeday, align 4, !dbg !131
  br label %54, !dbg !131

; <label>:49                                      ; preds = %44, %40, %33
  %50 = load i32* %m, align 4, !dbg !132
  %51 = icmp eq i32 %50, 2, !dbg !132
  br i1 %51, label %52, label %53, !dbg !132

; <label>:52                                      ; preds = %49
  store i32 28, i32* %edgeday, align 4, !dbg !134
  br label %54, !dbg !134

; <label>:53                                      ; preds = %49
  store i32 30, i32* %edgeday, align 4, !dbg !135
  br label %54

; <label>:54                                      ; preds = %48, %53, %52, %32
  %55 = load i32* %d, align 4, !dbg !136
  %56 = load i32* %edgeday, align 4, !dbg !136
  %57 = icmp sgt i32 %55, %56, !dbg !136
  br i1 %57, label %58, label %60, !dbg !136

; <label>:58                                      ; preds = %54
  %59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str3, i32 0, i32 0)), !dbg !138
  br label %60, !dbg !138

; <label>:60                                      ; preds = %58, %54
  %61 = load i32* %d, align 4, !dbg !139
  %62 = add nsw i32 %61, 1, !dbg !139
  %63 = load i32* %edgeday, align 4, !dbg !139
  %64 = icmp sgt i32 %62, %63, !dbg !139
  br i1 %64, label %65, label %75, !dbg !139

; <label>:65                                      ; preds = %60
  %66 = load i32* %m, align 4, !dbg !141
  %67 = add nsw i32 %66, 1, !dbg !141
  %68 = icmp sgt i32 %67, 12, !dbg !141
  br i1 %68, label %69, label %72, !dbg !141

; <label>:69                                      ; preds = %65
  %70 = load i32* %y, align 4, !dbg !144
  %71 = add nsw i32 %70, 1, !dbg !144
  store i32 %71, i32* %y, align 4, !dbg !144
  store i32 1, i32* %d, align 4, !dbg !146
  store i32 1, i32* %m, align 4, !dbg !146
  br label %78, !dbg !147

; <label>:72                                      ; preds = %65
  %73 = load i32* %m, align 4, !dbg !148
  %74 = add nsw i32 %73, 1, !dbg !148
  store i32 %74, i32* %m, align 4, !dbg !148
  store i32 1, i32* %d, align 4, !dbg !150
  br label %78

; <label>:75                                      ; preds = %60
  %76 = load i32* %d, align 4, !dbg !151
  %77 = add nsw i32 %76, 1, !dbg !151
  store i32 %77, i32* %d, align 4, !dbg !151
  br label %78

; <label>:78                                      ; preds = %69, %72, %75
  %79 = load i32* %y, align 4, !dbg !153
  %80 = load i32* %m, align 4, !dbg !153
  %81 = load i32* %d, align 4, !dbg !153
  %82 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0), i32 %79, i32 %80, i32 %81), !dbg !153
  ret i32 0, !dbg !154
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare void @klee_make_symbolic(i8*, i64, i8*) #2

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #3 {
  %1 = icmp eq i64 %z, 0, !dbg !155
  br i1 %1, label %2, label %3, !dbg !155

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([60 x i8]* @.str5, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str16, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str27, i64 0, i64 0)) #6, !dbg !157
  unreachable, !dbg !157

; <label>:3                                       ; preds = %0
  ret void, !dbg !158
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #3 {
  %x = alloca i32, align 4
  %1 = bitcast i32* %x to i8*, !dbg !159
  call void @klee_make_symbolic(i8* %1, i64 4, i8* %name) #7, !dbg !159
  %2 = load i32* %x, align 4, !dbg !160, !tbaa !161
  ret i32 %2, !dbg !160
}

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #3 {
  %1 = icmp ult i64 %shift, %bitWidth, !dbg !165
  br i1 %1, label %3, label %2, !dbg !165

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str38, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) #6, !dbg !167
  unreachable, !dbg !167

; <label>:3                                       ; preds = %0
  ret void, !dbg !169
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #3 {
  %x = alloca i32, align 4
  %1 = icmp slt i32 %start, %end, !dbg !170
  br i1 %1, label %3, label %2, !dbg !170

; <label>:2                                       ; preds = %0
  call void @klee_report_error(i8* getelementptr inbounds ([51 x i8]* @.str6, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) #6, !dbg !172
  unreachable, !dbg !172

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1, !dbg !173
  %5 = icmp eq i32 %4, %end, !dbg !173
  br i1 %5, label %21, label %6, !dbg !173

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*, !dbg !175
  call void @klee_make_symbolic(i8* %7, i64 4, i8* %name) #7, !dbg !175
  %8 = icmp eq i32 %start, 0, !dbg !177
  %9 = load i32* %x, align 4, !dbg !179, !tbaa !161
  br i1 %8, label %10, label %13, !dbg !177

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end, !dbg !179
  %12 = zext i1 %11 to i64, !dbg !179
  call void @klee_assume(i64 %12) #7, !dbg !179
  br label %19, !dbg !181

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start, !dbg !182
  %15 = zext i1 %14 to i64, !dbg !182
  call void @klee_assume(i64 %15) #7, !dbg !182
  %16 = load i32* %x, align 4, !dbg !184, !tbaa !161
  %17 = icmp slt i32 %16, %end, !dbg !184
  %18 = zext i1 %17 to i64, !dbg !184
  call void @klee_assume(i64 %18) #7, !dbg !184
  br label %19

; <label>:19                                      ; preds = %13, %10
  %20 = load i32* %x, align 4, !dbg !185, !tbaa !161
  br label %21, !dbg !185

; <label>:21                                      ; preds = %19, %3
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0, !dbg !186
}

declare void @klee_assume(i64) #5

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #3 {
  %1 = icmp eq i64 %len, 0, !dbg !187
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader, !dbg !187

.lr.ph.preheader:                                 ; preds = %0
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %2 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep4 = getelementptr i8* %srcaddr, i64 %2
  %scevgep = getelementptr i8* %destaddr, i64 %2
  %bound1 = icmp uge i8* %scevgep, %srcaddr
  %bound0 = icmp uge i8* %scevgep4, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end6 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep103 = getelementptr i8* %destaddr, i64 %index
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !188
  %wide.load = load <16 x i8>* %3, align 1, !dbg !188
  %next.gep.sum279 = or i64 %index, 16, !dbg !188
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum279, !dbg !188
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !188
  %wide.load200 = load <16 x i8>* %5, align 1, !dbg !188
  %6 = bitcast i8* %next.gep103 to <16 x i8>*, !dbg !188
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !188
  %next.gep103.sum296 = or i64 %index, 16, !dbg !188
  %7 = getelementptr i8* %destaddr, i64 %next.gep103.sum296, !dbg !188
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !188
  store <16 x i8> %wide.load200, <16 x i8>* %8, align 1, !dbg !188
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !189

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %srcaddr, %.lr.ph.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val5 = phi i8* [ %destaddr, %.lr.ph.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end6, %vector.body ]
  %resume.val7 = phi i64 [ %len, %.lr.ph.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %src.03 = phi i8* [ %11, %.lr.ph ], [ %resume.val, %middle.block ]
  %dest.02 = phi i8* [ %13, %.lr.ph ], [ %resume.val5, %middle.block ]
  %.01 = phi i64 [ %10, %.lr.ph ], [ %resume.val7, %middle.block ]
  %10 = add i64 %.01, -1, !dbg !187
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !188
  %12 = load i8* %src.03, align 1, !dbg !188, !tbaa !192
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !188
  store i8 %12, i8* %dest.02, align 1, !dbg !188, !tbaa !192
  %14 = icmp eq i64 %10, 0, !dbg !187
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !187, !llvm.loop !193

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret i8* %destaddr, !dbg !194
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #3 {
  %1 = icmp eq i8* %src, %dst, !dbg !195
  br i1 %1, label %.loopexit, label %2, !dbg !195

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i8* %src, %dst, !dbg !197
  br i1 %3, label %.preheader, label %18, !dbg !197

.preheader:                                       ; preds = %2
  %4 = icmp eq i64 %count, 0, !dbg !199
  br i1 %4, label %.loopexit, label %.lr.ph.preheader, !dbg !199

.lr.ph.preheader:                                 ; preds = %.preheader
  %n.vec = and i64 %count, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %5 = add i64 %count, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep11 = getelementptr i8* %src, i64 %5
  %scevgep = getelementptr i8* %dst, i64 %5
  %bound1 = icmp uge i8* %scevgep, %src
  %bound0 = icmp uge i8* %scevgep11, %dst
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %src, i64 %n.vec
  %ptr.ind.end13 = getelementptr i8* %dst, i64 %n.vec
  %rev.ind.end = sub i64 %count, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %src, i64 %index
  %next.gep110 = getelementptr i8* %dst, i64 %index
  %6 = bitcast i8* %next.gep to <16 x i8>*, !dbg !199
  %wide.load = load <16 x i8>* %6, align 1, !dbg !199
  %next.gep.sum586 = or i64 %index, 16, !dbg !199
  %7 = getelementptr i8* %src, i64 %next.gep.sum586, !dbg !199
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !199
  %wide.load207 = load <16 x i8>* %8, align 1, !dbg !199
  %9 = bitcast i8* %next.gep110 to <16 x i8>*, !dbg !199
  store <16 x i8> %wide.load, <16 x i8>* %9, align 1, !dbg !199
  %next.gep110.sum603 = or i64 %index, 16, !dbg !199
  %10 = getelementptr i8* %dst, i64 %next.gep110.sum603, !dbg !199
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !199
  store <16 x i8> %wide.load207, <16 x i8>* %11, align 1, !dbg !199
  %index.next = add i64 %index, 32
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !201

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %src, %.lr.ph.preheader ], [ %src, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val12 = phi i8* [ %dst, %.lr.ph.preheader ], [ %dst, %vector.memcheck ], [ %ptr.ind.end13, %vector.body ]
  %resume.val14 = phi i64 [ %count, %.lr.ph.preheader ], [ %count, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %count
  br i1 %cmp.n, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %b.04 = phi i8* [ %14, %.lr.ph ], [ %resume.val, %middle.block ]
  %a.03 = phi i8* [ %16, %.lr.ph ], [ %resume.val12, %middle.block ]
  %.02 = phi i64 [ %13, %.lr.ph ], [ %resume.val14, %middle.block ]
  %13 = add i64 %.02, -1, !dbg !199
  %14 = getelementptr inbounds i8* %b.04, i64 1, !dbg !199
  %15 = load i8* %b.04, align 1, !dbg !199, !tbaa !192
  %16 = getelementptr inbounds i8* %a.03, i64 1, !dbg !199
  store i8 %15, i8* %a.03, align 1, !dbg !199, !tbaa !192
  %17 = icmp eq i64 %13, 0, !dbg !199
  br i1 %17, label %.loopexit, label %.lr.ph, !dbg !199, !llvm.loop !202

; <label>:18                                      ; preds = %2
  %19 = add i64 %count, -1, !dbg !203
  %20 = icmp eq i64 %count, 0, !dbg !205
  br i1 %20, label %.loopexit, label %.lr.ph9, !dbg !205

.lr.ph9:                                          ; preds = %18
  %21 = getelementptr inbounds i8* %src, i64 %19, !dbg !206
  %22 = getelementptr inbounds i8* %dst, i64 %19, !dbg !203
  %n.vec215 = and i64 %count, -32
  %cmp.zero217 = icmp eq i64 %n.vec215, 0
  %23 = add i64 %count, -1
  br i1 %cmp.zero217, label %middle.block210, label %vector.memcheck224

vector.memcheck224:                               ; preds = %.lr.ph9
  %scevgep219 = getelementptr i8* %src, i64 %23
  %scevgep218 = getelementptr i8* %dst, i64 %23
  %bound1221 = icmp ule i8* %scevgep219, %dst
  %bound0220 = icmp ule i8* %scevgep218, %src
  %memcheck.conflict223 = and i1 %bound0220, %bound1221
  %.sum = sub i64 %19, %n.vec215
  %rev.ptr.ind.end = getelementptr i8* %src, i64 %.sum
  %.sum439 = sub i64 %19, %n.vec215
  %rev.ptr.ind.end229 = getelementptr i8* %dst, i64 %.sum439
  %rev.ind.end231 = sub i64 %count, %n.vec215
  br i1 %memcheck.conflict223, label %middle.block210, label %vector.body209

vector.body209:                                   ; preds = %vector.body209, %vector.memcheck224
  %index212 = phi i64 [ %index.next234, %vector.body209 ], [ 0, %vector.memcheck224 ]
  %.sum440 = sub i64 %19, %index212
  %.sum472 = sub i64 %19, %index212
  %next.gep236.sum = add i64 %.sum440, -15, !dbg !205
  %24 = getelementptr i8* %src, i64 %next.gep236.sum, !dbg !205
  %25 = bitcast i8* %24 to <16 x i8>*, !dbg !205
  %wide.load434 = load <16 x i8>* %25, align 1, !dbg !205
  %reverse = shufflevector <16 x i8> %wide.load434, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !205
  %.sum505 = add i64 %.sum440, -31, !dbg !205
  %26 = getelementptr i8* %src, i64 %.sum505, !dbg !205
  %27 = bitcast i8* %26 to <16 x i8>*, !dbg !205
  %wide.load435 = load <16 x i8>* %27, align 1, !dbg !205
  %reverse436 = shufflevector <16 x i8> %wide.load435, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !205
  %reverse437 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !205
  %next.gep333.sum = add i64 %.sum472, -15, !dbg !205
  %28 = getelementptr i8* %dst, i64 %next.gep333.sum, !dbg !205
  %29 = bitcast i8* %28 to <16 x i8>*, !dbg !205
  store <16 x i8> %reverse437, <16 x i8>* %29, align 1, !dbg !205
  %reverse438 = shufflevector <16 x i8> %reverse436, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !205
  %.sum507 = add i64 %.sum472, -31, !dbg !205
  %30 = getelementptr i8* %dst, i64 %.sum507, !dbg !205
  %31 = bitcast i8* %30 to <16 x i8>*, !dbg !205
  store <16 x i8> %reverse438, <16 x i8>* %31, align 1, !dbg !205
  %index.next234 = add i64 %index212, 32
  %32 = icmp eq i64 %index.next234, %n.vec215
  br i1 %32, label %middle.block210, label %vector.body209, !llvm.loop !207

middle.block210:                                  ; preds = %vector.body209, %vector.memcheck224, %.lr.ph9
  %resume.val225 = phi i8* [ %21, %.lr.ph9 ], [ %21, %vector.memcheck224 ], [ %rev.ptr.ind.end, %vector.body209 ]
  %resume.val227 = phi i8* [ %22, %.lr.ph9 ], [ %22, %vector.memcheck224 ], [ %rev.ptr.ind.end229, %vector.body209 ]
  %resume.val230 = phi i64 [ %count, %.lr.ph9 ], [ %count, %vector.memcheck224 ], [ %rev.ind.end231, %vector.body209 ]
  %new.indc.resume.val232 = phi i64 [ 0, %.lr.ph9 ], [ 0, %vector.memcheck224 ], [ %n.vec215, %vector.body209 ]
  %cmp.n233 = icmp eq i64 %new.indc.resume.val232, %count
  br i1 %cmp.n233, label %.loopexit, label %scalar.ph211

scalar.ph211:                                     ; preds = %scalar.ph211, %middle.block210
  %b.18 = phi i8* [ %34, %scalar.ph211 ], [ %resume.val225, %middle.block210 ]
  %a.17 = phi i8* [ %36, %scalar.ph211 ], [ %resume.val227, %middle.block210 ]
  %.16 = phi i64 [ %33, %scalar.ph211 ], [ %resume.val230, %middle.block210 ]
  %33 = add i64 %.16, -1, !dbg !205
  %34 = getelementptr inbounds i8* %b.18, i64 -1, !dbg !205
  %35 = load i8* %b.18, align 1, !dbg !205, !tbaa !192
  %36 = getelementptr inbounds i8* %a.17, i64 -1, !dbg !205
  store i8 %35, i8* %a.17, align 1, !dbg !205, !tbaa !192
  %37 = icmp eq i64 %33, 0, !dbg !205
  br i1 %37, label %.loopexit, label %scalar.ph211, !dbg !205, !llvm.loop !208

.loopexit:                                        ; preds = %scalar.ph211, %middle.block210, %18, %.lr.ph, %middle.block, %.preheader, %0
  ret i8* %dst, !dbg !209
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #3 {
  %1 = icmp eq i64 %len, 0, !dbg !210
  br i1 %1, label %15, label %.lr.ph.preheader, !dbg !210

.lr.ph.preheader:                                 ; preds = %0
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %2 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep5 = getelementptr i8* %srcaddr, i64 %2
  %scevgep4 = getelementptr i8* %destaddr, i64 %2
  %bound1 = icmp uge i8* %scevgep4, %srcaddr
  %bound0 = icmp uge i8* %scevgep5, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end7 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep104 = getelementptr i8* %destaddr, i64 %index
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !211
  %wide.load = load <16 x i8>* %3, align 1, !dbg !211
  %next.gep.sum280 = or i64 %index, 16, !dbg !211
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum280, !dbg !211
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !211
  %wide.load201 = load <16 x i8>* %5, align 1, !dbg !211
  %6 = bitcast i8* %next.gep104 to <16 x i8>*, !dbg !211
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !211
  %next.gep104.sum297 = or i64 %index, 16, !dbg !211
  %7 = getelementptr i8* %destaddr, i64 %next.gep104.sum297, !dbg !211
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !211
  store <16 x i8> %wide.load201, <16 x i8>* %8, align 1, !dbg !211
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !212

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %srcaddr, %.lr.ph.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val6 = phi i8* [ %destaddr, %.lr.ph.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end7, %vector.body ]
  %resume.val8 = phi i64 [ %len, %.lr.ph.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %src.03 = phi i8* [ %11, %.lr.ph ], [ %resume.val, %middle.block ]
  %dest.02 = phi i8* [ %13, %.lr.ph ], [ %resume.val6, %middle.block ]
  %.01 = phi i64 [ %10, %.lr.ph ], [ %resume.val8, %middle.block ]
  %10 = add i64 %.01, -1, !dbg !210
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !211
  %12 = load i8* %src.03, align 1, !dbg !211, !tbaa !192
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !211
  store i8 %12, i8* %dest.02, align 1, !dbg !211, !tbaa !192
  %14 = icmp eq i64 %10, 0, !dbg !210
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !210, !llvm.loop !213

._crit_edge:                                      ; preds = %.lr.ph, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %15, !dbg !210

; <label>:15                                      ; preds = %._crit_edge, %0
  %dest.0.lcssa = phi i8* [ %scevgep, %._crit_edge ], [ %destaddr, %0 ]
  ret i8* %dest.0.lcssa, !dbg !214
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #3 {
  %1 = icmp eq i64 %count, 0, !dbg !215
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !215

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !216
  br label %3, !dbg !215

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.02 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.01 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.01, -1, !dbg !215
  %5 = getelementptr inbounds i8* %a.02, i64 1, !dbg !216
  store volatile i8 %2, i8* %a.02, align 1, !dbg !216, !tbaa !192
  %6 = icmp eq i64 %4, 0, !dbg !215
  br i1 %6, label %._crit_edge, label %3, !dbg !215

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !217
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nobuiltin noreturn nounwind }
attributes #7 = { nobuiltin nounwind }

!llvm.dbg.cu = !{!0, !9, !19, !32, !43, !55, !74, !88, !102}
!llvm.module.flags = !{!117, !118}
!llvm.ident = !{!119, !119, !119, !119, !119, !119, !119, !119, !119}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ 
!1 = metadata !{metadata !"main_klee.c", metadata !"/home/klee/Software-Testing/src/NextDate"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 6, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !2, i32 6} ; [ DW_TAG_subprogram ] [
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/klee/Software-Testing/src/NextDate/main_klee.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786449, metadata !10, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !11, metadata !2, metadata !2, metadata !""} ; [ 
!10 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786478, metadata !10, metadata !13, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", i32 12, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_check, null
!13 = metadata !{i32 786473, metadata !10}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_div_zero_check.c]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{null, metadata !16}
!16 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!17 = metadata !{metadata !18}
!18 = metadata !{i32 786689, metadata !12, metadata !"z", metadata !13, i32 16777228, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!19 = metadata !{i32 786449, metadata !20, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !21, metadata !2, metadata !2, metadata !""} ; [
!20 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/klee_int.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!21 = metadata !{metadata !22}
!22 = metadata !{i32 786478, metadata !20, metadata !23, metadata !"klee_int", metadata !"klee_int", metadata !"", i32 13, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int, null, null, metadata !29, i32 13} ; [ 
!23 = metadata !{i32 786473, metadata !20}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_int.c]
!24 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{metadata !8, metadata !26}
!26 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !27} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!27 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !28} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!28 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!29 = metadata !{metadata !30, metadata !31}
!30 = metadata !{i32 786689, metadata !22, metadata !"name", metadata !23, i32 16777229, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!31 = metadata !{i32 786688, metadata !22, metadata !"x", metadata !23, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!32 = metadata !{i32 786449, metadata !33, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !34, metadata !2, metadata !2, metadata !""} ; [
!33 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!34 = metadata !{metadata !35}
!35 = metadata !{i32 786478, metadata !33, metadata !36, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", i32 20, metadata !37, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64)* @klee_overshift_che
!36 = metadata !{i32 786473, metadata !33}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_overshift_check.c]
!37 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !38, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!38 = metadata !{null, metadata !39, metadata !39}
!39 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!40 = metadata !{metadata !41, metadata !42}
!41 = metadata !{i32 786689, metadata !35, metadata !"bitWidth", metadata !36, i32 16777236, metadata !39, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bitWidth] [line 20]
!42 = metadata !{i32 786689, metadata !35, metadata !"shift", metadata !36, i32 33554452, metadata !39, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [shift] [line 20]
!43 = metadata !{i32 786449, metadata !44, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !45, metadata !2, metadata !2, metadata !""} ; [
!44 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/klee_range.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!45 = metadata !{metadata !46}
!46 = metadata !{i32 786478, metadata !44, metadata !47, metadata !"klee_range", metadata !"klee_range", metadata !"", i32 13, metadata !48, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range, null, null, metadata !
!47 = metadata !{i32 786473, metadata !44}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!48 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !49, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = metadata !{metadata !8, metadata !8, metadata !8, metadata !26}
!50 = metadata !{metadata !51, metadata !52, metadata !53, metadata !54}
!51 = metadata !{i32 786689, metadata !46, metadata !"start", metadata !47, i32 16777229, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!52 = metadata !{i32 786689, metadata !46, metadata !"end", metadata !47, i32 33554445, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!53 = metadata !{i32 786689, metadata !46, metadata !"name", metadata !47, i32 50331661, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!54 = metadata !{i32 786688, metadata !46, metadata !"x", metadata !47, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!55 = metadata !{i32 786449, metadata !56, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !57, metadata !2, metadata !2, metadata !""} ; [
!56 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/memcpy.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!57 = metadata !{metadata !58}
!58 = metadata !{i32 786478, metadata !56, metadata !59, metadata !"memcpy", metadata !"memcpy", metadata !"", i32 12, metadata !60, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !67, i32 12} 
!59 = metadata !{i32 786473, metadata !56}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memcpy.c]
!60 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !61, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!61 = metadata !{metadata !62, metadata !62, metadata !63, metadata !65}
!62 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!63 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !64} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!64 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!65 = metadata !{i32 786454, metadata !56, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!66 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!67 = metadata !{metadata !68, metadata !69, metadata !70, metadata !71, metadata !73}
!68 = metadata !{i32 786689, metadata !58, metadata !"destaddr", metadata !59, i32 16777228, metadata !62, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!69 = metadata !{i32 786689, metadata !58, metadata !"srcaddr", metadata !59, i32 33554444, metadata !63, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!70 = metadata !{i32 786689, metadata !58, metadata !"len", metadata !59, i32 50331660, metadata !65, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!71 = metadata !{i32 786688, metadata !58, metadata !"dest", metadata !59, i32 13, metadata !72, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!72 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!73 = metadata !{i32 786688, metadata !58, metadata !"src", metadata !59, i32 14, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!74 = metadata !{i32 786449, metadata !75, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !76, metadata !2, metadata !2, metadata !""} ; [
!75 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/memmove.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!76 = metadata !{metadata !77}
!77 = metadata !{i32 786478, metadata !75, metadata !78, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !79, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !82, i32 1
!78 = metadata !{i32 786473, metadata !75}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memmove.c]
!79 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !80, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!80 = metadata !{metadata !62, metadata !62, metadata !63, metadata !81}
!81 = metadata !{i32 786454, metadata !75, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!82 = metadata !{metadata !83, metadata !84, metadata !85, metadata !86, metadata !87}
!83 = metadata !{i32 786689, metadata !77, metadata !"dst", metadata !78, i32 16777228, metadata !62, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!84 = metadata !{i32 786689, metadata !77, metadata !"src", metadata !78, i32 33554444, metadata !63, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!85 = metadata !{i32 786689, metadata !77, metadata !"count", metadata !78, i32 50331660, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!86 = metadata !{i32 786688, metadata !77, metadata !"a", metadata !78, i32 13, metadata !72, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!87 = metadata !{i32 786688, metadata !77, metadata !"b", metadata !78, i32 14, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!88 = metadata !{i32 786449, metadata !89, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !90, metadata !2, metadata !2, metadata !""} ; [
!89 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/mempcpy.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!90 = metadata !{metadata !91}
!91 = metadata !{i32 786478, metadata !89, metadata !92, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !93, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !96, i32 1
!92 = metadata !{i32 786473, metadata !89}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/mempcpy.c]
!93 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !94, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!94 = metadata !{metadata !62, metadata !62, metadata !63, metadata !95}
!95 = metadata !{i32 786454, metadata !89, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!96 = metadata !{metadata !97, metadata !98, metadata !99, metadata !100, metadata !101}
!97 = metadata !{i32 786689, metadata !91, metadata !"destaddr", metadata !92, i32 16777227, metadata !62, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!98 = metadata !{i32 786689, metadata !91, metadata !"srcaddr", metadata !92, i32 33554443, metadata !63, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!99 = metadata !{i32 786689, metadata !91, metadata !"len", metadata !92, i32 50331659, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!100 = metadata !{i32 786688, metadata !91, metadata !"dest", metadata !92, i32 12, metadata !72, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!101 = metadata !{i32 786688, metadata !91, metadata !"src", metadata !92, i32 13, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!102 = metadata !{i32 786449, metadata !103, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !104, metadata !2, metadata !2, metadata !""} 
!103 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/memset.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!104 = metadata !{metadata !105}
!105 = metadata !{i32 786478, metadata !103, metadata !106, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !107, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !110, i32
!106 = metadata !{i32 786473, metadata !103}      ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memset.c]
!107 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !108, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!108 = metadata !{metadata !62, metadata !62, metadata !8, metadata !109}
!109 = metadata !{i32 786454, metadata !103, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!110 = metadata !{metadata !111, metadata !112, metadata !113, metadata !114}
!111 = metadata !{i32 786689, metadata !105, metadata !"dst", metadata !106, i32 16777227, metadata !62, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!112 = metadata !{i32 786689, metadata !105, metadata !"s", metadata !106, i32 33554443, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!113 = metadata !{i32 786689, metadata !105, metadata !"count", metadata !106, i32 50331659, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!114 = metadata !{i32 786688, metadata !105, metadata !"a", metadata !106, i32 12, metadata !115, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!115 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !116} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!116 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !28} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!117 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!118 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!119 = metadata !{metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)"}
!120 = metadata !{i32 9, i32 0, metadata !4, null}
!121 = metadata !{i32 10, i32 0, metadata !4, null}
!122 = metadata !{i32 11, i32 0, metadata !4, null}
!123 = metadata !{i32 14, i32 0, metadata !124, null}
!124 = metadata !{i32 786443, metadata !1, metadata !4, i32 14, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/Software-Testing/src/NextDate/main_klee.c]
!125 = metadata !{i32 15, i32 0, metadata !124, null}
!126 = metadata !{i32 18, i32 0, metadata !127, null}
!127 = metadata !{i32 786443, metadata !1, metadata !4, i32 18, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/klee/Software-Testing/src/NextDate/main_klee.c]
!128 = metadata !{i32 19, i32 0, metadata !127, null}
!129 = metadata !{i32 20, i32 0, metadata !130, null}
!130 = metadata !{i32 786443, metadata !1, metadata !127, i32 20, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/klee/Software-Testing/src/NextDate/main_klee.c]
!131 = metadata !{i32 21, i32 0, metadata !130, null}
!132 = metadata !{i32 22, i32 0, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !130, i32 22, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/klee/Software-Testing/src/NextDate/main_klee.c]
!134 = metadata !{i32 23, i32 0, metadata !133, null}
!135 = metadata !{i32 25, i32 0, metadata !133, null}
!136 = metadata !{i32 28, i32 0, metadata !137, null}
!137 = metadata !{i32 786443, metadata !1, metadata !4, i32 28, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/klee/Software-Testing/src/NextDate/main_klee.c]
!138 = metadata !{i32 29, i32 0, metadata !137, null}
!139 = metadata !{i32 32, i32 0, metadata !140, null}
!140 = metadata !{i32 786443, metadata !1, metadata !4, i32 32, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/klee/Software-Testing/src/NextDate/main_klee.c]
!141 = metadata !{i32 33, i32 0, metadata !142, null}
!142 = metadata !{i32 786443, metadata !1, metadata !143, i32 33, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/klee/Software-Testing/src/NextDate/main_klee.c]
!143 = metadata !{i32 786443, metadata !1, metadata !140, i32 32, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/klee/Software-Testing/src/NextDate/main_klee.c]
!144 = metadata !{i32 34, i32 0, metadata !145, null}
!145 = metadata !{i32 786443, metadata !1, metadata !142, i32 33, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/klee/Software-Testing/src/NextDate/main_klee.c]
!146 = metadata !{i32 35, i32 0, metadata !145, null}
!147 = metadata !{i32 36, i32 0, metadata !145, null}
!148 = metadata !{i32 37, i32 0, metadata !149, null}
!149 = metadata !{i32 786443, metadata !1, metadata !142, i32 36, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/klee/Software-Testing/src/NextDate/main_klee.c]
!150 = metadata !{i32 38, i32 0, metadata !149, null}
!151 = metadata !{i32 41, i32 0, metadata !152, null}
!152 = metadata !{i32 786443, metadata !1, metadata !140, i32 40, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/klee/Software-Testing/src/NextDate/main_klee.c]
!153 = metadata !{i32 44, i32 0, metadata !4, null}
!154 = metadata !{i32 46, i32 0, metadata !4, null}
!155 = metadata !{i32 13, i32 0, metadata !156, null}
!156 = metadata !{i32 786443, metadata !10, metadata !12, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_div_zero_check.c]
!157 = metadata !{i32 14, i32 0, metadata !156, null}
!158 = metadata !{i32 15, i32 0, metadata !12, null}
!159 = metadata !{i32 15, i32 0, metadata !22, null}
!160 = metadata !{i32 16, i32 0, metadata !22, null}
!161 = metadata !{metadata !162, metadata !162, i64 0}
!162 = metadata !{metadata !"int", metadata !163, i64 0}
!163 = metadata !{metadata !"omnipotent char", metadata !164, i64 0}
!164 = metadata !{metadata !"Simple C/C++ TBAA"}
!165 = metadata !{i32 21, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !33, metadata !35, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_overshift_check.c]
!167 = metadata !{i32 27, i32 0, metadata !168, null}
!168 = metadata !{i32 786443, metadata !33, metadata !166, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_overshift_check.c]
!169 = metadata !{i32 29, i32 0, metadata !35, null}
!170 = metadata !{i32 16, i32 0, metadata !171, null}
!171 = metadata !{i32 786443, metadata !44, metadata !46, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!172 = metadata !{i32 17, i32 0, metadata !171, null}
!173 = metadata !{i32 19, i32 0, metadata !174, null}
!174 = metadata !{i32 786443, metadata !44, metadata !46, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!175 = metadata !{i32 22, i32 0, metadata !176, null}
!176 = metadata !{i32 786443, metadata !44, metadata !174, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!177 = metadata !{i32 25, i32 0, metadata !178, null}
!178 = metadata !{i32 786443, metadata !44, metadata !176, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!179 = metadata !{i32 26, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !44, metadata !178, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!181 = metadata !{i32 27, i32 0, metadata !180, null}
!182 = metadata !{i32 28, i32 0, metadata !183, null}
!183 = metadata !{i32 786443, metadata !44, metadata !178, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!184 = metadata !{i32 29, i32 0, metadata !183, null}
!185 = metadata !{i32 32, i32 0, metadata !176, null}
!186 = metadata !{i32 34, i32 0, metadata !46, null}
!187 = metadata !{i32 16, i32 0, metadata !58, null}
!188 = metadata !{i32 17, i32 0, metadata !58, null}
!189 = metadata !{metadata !189, metadata !190, metadata !191}
!190 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!191 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!192 = metadata !{metadata !163, metadata !163, i64 0}
!193 = metadata !{metadata !193, metadata !190, metadata !191}
!194 = metadata !{i32 18, i32 0, metadata !58, null}
!195 = metadata !{i32 16, i32 0, metadata !196, null}
!196 = metadata !{i32 786443, metadata !75, metadata !77, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memmove.c]
!197 = metadata !{i32 19, i32 0, metadata !198, null}
!198 = metadata !{i32 786443, metadata !75, metadata !77, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memmove.c]
!199 = metadata !{i32 20, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !75, metadata !198, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memmove.c]
!201 = metadata !{metadata !201, metadata !190, metadata !191}
!202 = metadata !{metadata !202, metadata !190, metadata !191}
!203 = metadata !{i32 22, i32 0, metadata !204, null}
!204 = metadata !{i32 786443, metadata !75, metadata !198, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memmove.c]
!205 = metadata !{i32 24, i32 0, metadata !204, null}
!206 = metadata !{i32 23, i32 0, metadata !204, null}
!207 = metadata !{metadata !207, metadata !190, metadata !191}
!208 = metadata !{metadata !208, metadata !190, metadata !191}
!209 = metadata !{i32 28, i32 0, metadata !77, null}
!210 = metadata !{i32 15, i32 0, metadata !91, null}
!211 = metadata !{i32 16, i32 0, metadata !91, null}
!212 = metadata !{metadata !212, metadata !190, metadata !191}
!213 = metadata !{metadata !213, metadata !190, metadata !191}
!214 = metadata !{i32 17, i32 0, metadata !91, null}
!215 = metadata !{i32 13, i32 0, metadata !105, null}
!216 = metadata !{i32 14, i32 0, metadata !105, null}
!217 = metadata !{i32 15, i32 0, metadata !105, null}
