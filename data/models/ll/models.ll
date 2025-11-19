; ModuleID = '/home/marek/root/fizzer/dist/output/posix/optind.ll'
source_filename = "/home/marek/root/fizzer/dist/data//models/c/posix/optind.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.option = type { ptr, i32, ptr, i32 }
%struct.__va_list_tag = type { i32, i32, ptr, ptr }
%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, ptr }

@__fizzer_model__optind = dso_local global i32 1, align 4, !dbg !0
@__fizzer_model__optarg = dso_local global ptr null, align 8, !dbg !7
@__fizzer_model__opterr = dso_local global i32 1, align 4, !dbg !15
@__fizzer_model__optopt = dso_local global i32 63, align 4, !dbg !21
@__fizzer_model__strerror.unknown = internal global [14 x i8] c"Unknown error\00", align 1, !dbg !27
@.str = private unnamed_addr constant [9 x i8] c"No error\00", align 1, !dbg !36
@.str.1 = private unnamed_addr constant [24 x i8] c"Operation not permitted\00", align 1, !dbg !41
@.str.2 = private unnamed_addr constant [26 x i8] c"No such file or directory\00", align 1, !dbg !46
@.str.3 = private unnamed_addr constant [16 x i8] c"No such process\00", align 1, !dbg !51
@.str.4 = private unnamed_addr constant [24 x i8] c"Interrupted system call\00", align 1, !dbg !56
@.str.5 = private unnamed_addr constant [19 x i8] c"Input/output error\00", align 1, !dbg !58
@__fizzer_model__strtok.next = internal global ptr null, align 8, !dbg !67
@__const.__fizzer_model__ctime.template = private unnamed_addr constant [26 x i8] c"Wed Jan 01 00:00:00 1970\0A\00", align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__getopt_long(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #0 !dbg !199 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !215, metadata !DIExpression()), !dbg !216
  store ptr %1, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !217, metadata !DIExpression()), !dbg !218
  store ptr %2, ptr %9, align 8
  call void @llvm.dbg.declare(metadata ptr %9, metadata !219, metadata !DIExpression()), !dbg !220
  store ptr %3, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %10, metadata !221, metadata !DIExpression()), !dbg !222
  store ptr %4, ptr %11, align 8
  call void @llvm.dbg.declare(metadata ptr %11, metadata !223, metadata !DIExpression()), !dbg !224
  %16 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !225
  %17 = load i32, ptr %7, align 4, !dbg !227
  %18 = icmp sge i32 %16, %17, !dbg !228
  br i1 %18, label %19, label %20, !dbg !229

19:                                               ; preds = %5
  store i32 -1, ptr %6, align 4, !dbg !230
  br label %180, !dbg !230

20:                                               ; preds = %5
  call void @llvm.dbg.declare(metadata ptr %12, metadata !232, metadata !DIExpression()), !dbg !233
  %21 = load ptr, ptr %8, align 8, !dbg !234
  %22 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !235
  %23 = sext i32 %22 to i64, !dbg !234
  %24 = getelementptr inbounds ptr, ptr %21, i64 %23, !dbg !234
  %25 = load ptr, ptr %24, align 8, !dbg !234
  store ptr %25, ptr %12, align 8, !dbg !233
  %26 = load ptr, ptr %12, align 8, !dbg !236
  %27 = getelementptr inbounds i8, ptr %26, i64 0, !dbg !236
  %28 = load i8, ptr %27, align 1, !dbg !236
  %29 = sext i8 %28 to i32, !dbg !236
  %30 = icmp ne i32 %29, 45, !dbg !238
  br i1 %30, label %37, label %31, !dbg !239

31:                                               ; preds = %20
  %32 = load ptr, ptr %12, align 8, !dbg !240
  %33 = getelementptr inbounds i8, ptr %32, i64 1, !dbg !240
  %34 = load i8, ptr %33, align 1, !dbg !240
  %35 = sext i8 %34 to i32, !dbg !240
  %36 = icmp ne i32 %35, 45, !dbg !241
  br i1 %36, label %37, label %42, !dbg !242

37:                                               ; preds = %31, %20
  %38 = load i32, ptr %7, align 4, !dbg !243
  %39 = load ptr, ptr %8, align 8, !dbg !245
  %40 = load ptr, ptr %9, align 8, !dbg !246
  %41 = call i32 @__fizzer_model__getopt(i32 noundef %38, ptr noundef %39, ptr noundef %40), !dbg !247
  store i32 %41, ptr %6, align 4, !dbg !248
  br label %180, !dbg !248

42:                                               ; preds = %31
  call void @llvm.dbg.declare(metadata ptr %13, metadata !249, metadata !DIExpression()), !dbg !253
  store i64 0, ptr %13, align 8, !dbg !253
  br label %43, !dbg !254

43:                                               ; preds = %174, %42
  %44 = load ptr, ptr %10, align 8, !dbg !255
  %45 = load i64, ptr %13, align 8, !dbg !256
  %46 = getelementptr inbounds %struct.option, ptr %44, i64 %45, !dbg !255
  %47 = getelementptr inbounds %struct.option, ptr %46, i32 0, i32 0, !dbg !257
  %48 = load ptr, ptr %47, align 8, !dbg !257
  %49 = icmp ne ptr %48, null, !dbg !258
  br i1 %49, label %50, label %177, !dbg !254

50:                                               ; preds = %43
  call void @llvm.dbg.declare(metadata ptr %14, metadata !259, metadata !DIExpression()), !dbg !261
  store i64 0, ptr %14, align 8, !dbg !261
  call void @llvm.dbg.declare(metadata ptr %15, metadata !262, metadata !DIExpression()), !dbg !263
  store i32 1, ptr %15, align 4, !dbg !263
  br label %51, !dbg !264

51:                                               ; preds = %90, %50
  %52 = load ptr, ptr %10, align 8, !dbg !265
  %53 = load i64, ptr %13, align 8, !dbg !266
  %54 = getelementptr inbounds %struct.option, ptr %52, i64 %53, !dbg !265
  %55 = getelementptr inbounds %struct.option, ptr %54, i32 0, i32 0, !dbg !267
  %56 = load ptr, ptr %55, align 8, !dbg !267
  %57 = load i64, ptr %14, align 8, !dbg !268
  %58 = getelementptr inbounds i8, ptr %56, i64 %57, !dbg !265
  %59 = load i8, ptr %58, align 1, !dbg !265
  %60 = sext i8 %59 to i32, !dbg !265
  %61 = icmp ne i32 %60, 0, !dbg !269
  br i1 %61, label %62, label %70, !dbg !270

62:                                               ; preds = %51
  %63 = load ptr, ptr %12, align 8, !dbg !271
  %64 = load i64, ptr %14, align 8, !dbg !272
  %65 = add i64 2, %64, !dbg !273
  %66 = getelementptr inbounds i8, ptr %63, i64 %65, !dbg !271
  %67 = load i8, ptr %66, align 1, !dbg !271
  %68 = sext i8 %67 to i32, !dbg !271
  %69 = icmp ne i32 %68, 0, !dbg !274
  br label %70

70:                                               ; preds = %62, %51
  %71 = phi i1 [ false, %51 ], [ %69, %62 ], !dbg !275
  br i1 %71, label %72, label %93, !dbg !264

72:                                               ; preds = %70
  %73 = load ptr, ptr %10, align 8, !dbg !276
  %74 = load i64, ptr %13, align 8, !dbg !279
  %75 = getelementptr inbounds %struct.option, ptr %73, i64 %74, !dbg !276
  %76 = getelementptr inbounds %struct.option, ptr %75, i32 0, i32 0, !dbg !280
  %77 = load ptr, ptr %76, align 8, !dbg !280
  %78 = load i64, ptr %14, align 8, !dbg !281
  %79 = getelementptr inbounds i8, ptr %77, i64 %78, !dbg !276
  %80 = load i8, ptr %79, align 1, !dbg !276
  %81 = sext i8 %80 to i32, !dbg !276
  %82 = load ptr, ptr %12, align 8, !dbg !282
  %83 = load i64, ptr %14, align 8, !dbg !283
  %84 = add i64 2, %83, !dbg !284
  %85 = getelementptr inbounds i8, ptr %82, i64 %84, !dbg !282
  %86 = load i8, ptr %85, align 1, !dbg !282
  %87 = sext i8 %86 to i32, !dbg !282
  %88 = icmp ne i32 %81, %87, !dbg !285
  br i1 %88, label %89, label %90, !dbg !286

89:                                               ; preds = %72
  store i32 0, ptr %15, align 4, !dbg !287
  br label %93, !dbg !289

90:                                               ; preds = %72
  %91 = load i64, ptr %14, align 8, !dbg !290
  %92 = add i64 %91, 1, !dbg !290
  store i64 %92, ptr %14, align 8, !dbg !290
  br label %51, !dbg !264, !llvm.loop !291

93:                                               ; preds = %89, %70
  %94 = load i32, ptr %15, align 4, !dbg !294
  %95 = icmp ne i32 %94, 0, !dbg !294
  br i1 %95, label %96, label %174, !dbg !296

96:                                               ; preds = %93
  %97 = load ptr, ptr %10, align 8, !dbg !297
  %98 = load i64, ptr %13, align 8, !dbg !298
  %99 = getelementptr inbounds %struct.option, ptr %97, i64 %98, !dbg !297
  %100 = getelementptr inbounds %struct.option, ptr %99, i32 0, i32 0, !dbg !299
  %101 = load ptr, ptr %100, align 8, !dbg !299
  %102 = load i64, ptr %14, align 8, !dbg !300
  %103 = getelementptr inbounds i8, ptr %101, i64 %102, !dbg !297
  %104 = load i8, ptr %103, align 1, !dbg !297
  %105 = sext i8 %104 to i32, !dbg !297
  %106 = icmp eq i32 %105, 0, !dbg !301
  br i1 %106, label %107, label %174, !dbg !302

107:                                              ; preds = %96
  %108 = load ptr, ptr %12, align 8, !dbg !303
  %109 = load i64, ptr %14, align 8, !dbg !304
  %110 = add i64 2, %109, !dbg !305
  %111 = getelementptr inbounds i8, ptr %108, i64 %110, !dbg !303
  %112 = load i8, ptr %111, align 1, !dbg !303
  %113 = sext i8 %112 to i32, !dbg !303
  %114 = icmp eq i32 %113, 0, !dbg !306
  br i1 %114, label %115, label %174, !dbg !307

115:                                              ; preds = %107
  %116 = load ptr, ptr %11, align 8, !dbg !308
  %117 = icmp ne ptr %116, null, !dbg !311
  br i1 %117, label %118, label %122, !dbg !312

118:                                              ; preds = %115
  %119 = load i64, ptr %13, align 8, !dbg !313
  %120 = trunc i64 %119 to i32, !dbg !315
  %121 = load ptr, ptr %11, align 8, !dbg !316
  store i32 %120, ptr %121, align 4, !dbg !317
  br label %122, !dbg !318

122:                                              ; preds = %118, %115
  %123 = load ptr, ptr %10, align 8, !dbg !319
  %124 = load i64, ptr %13, align 8, !dbg !321
  %125 = getelementptr inbounds %struct.option, ptr %123, i64 %124, !dbg !319
  %126 = getelementptr inbounds %struct.option, ptr %125, i32 0, i32 1, !dbg !322
  %127 = load i32, ptr %126, align 8, !dbg !322
  %128 = icmp eq i32 %127, 1, !dbg !323
  br i1 %128, label %129, label %147, !dbg !324

129:                                              ; preds = %122
  %130 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !325
  %131 = add nsw i32 %130, 1, !dbg !328
  %132 = load i32, ptr %7, align 4, !dbg !329
  %133 = icmp slt i32 %131, %132, !dbg !330
  br i1 %133, label %134, label %143, !dbg !331

134:                                              ; preds = %129
  %135 = load ptr, ptr %8, align 8, !dbg !332
  %136 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !334
  %137 = add nsw i32 %136, 1, !dbg !335
  %138 = sext i32 %137 to i64, !dbg !332
  %139 = getelementptr inbounds ptr, ptr %135, i64 %138, !dbg !332
  %140 = load ptr, ptr %139, align 8, !dbg !332
  store ptr %140, ptr @__fizzer_model__optarg, align 8, !dbg !336
  %141 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !337
  %142 = add nsw i32 %141, 2, !dbg !337
  store i32 %142, ptr @__fizzer_model__optind, align 4, !dbg !337
  br label %146, !dbg !338

143:                                              ; preds = %129
  store ptr null, ptr @__fizzer_model__optarg, align 8, !dbg !339
  %144 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !341
  %145 = add nsw i32 %144, 1, !dbg !341
  store i32 %145, ptr @__fizzer_model__optind, align 4, !dbg !341
  br label %146

146:                                              ; preds = %143, %134
  br label %150, !dbg !342

147:                                              ; preds = %122
  store ptr null, ptr @__fizzer_model__optarg, align 8, !dbg !343
  %148 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !345
  %149 = add nsw i32 %148, 1, !dbg !345
  store i32 %149, ptr @__fizzer_model__optind, align 4, !dbg !345
  br label %150

150:                                              ; preds = %147, %146
  %151 = load ptr, ptr %10, align 8, !dbg !346
  %152 = load i64, ptr %13, align 8, !dbg !348
  %153 = getelementptr inbounds %struct.option, ptr %151, i64 %152, !dbg !346
  %154 = getelementptr inbounds %struct.option, ptr %153, i32 0, i32 2, !dbg !349
  %155 = load ptr, ptr %154, align 8, !dbg !349
  %156 = icmp ne ptr %155, null, !dbg !350
  br i1 %156, label %157, label %168, !dbg !351

157:                                              ; preds = %150
  %158 = load ptr, ptr %10, align 8, !dbg !352
  %159 = load i64, ptr %13, align 8, !dbg !354
  %160 = getelementptr inbounds %struct.option, ptr %158, i64 %159, !dbg !352
  %161 = getelementptr inbounds %struct.option, ptr %160, i32 0, i32 3, !dbg !355
  %162 = load i32, ptr %161, align 8, !dbg !355
  %163 = load ptr, ptr %10, align 8, !dbg !356
  %164 = load i64, ptr %13, align 8, !dbg !357
  %165 = getelementptr inbounds %struct.option, ptr %163, i64 %164, !dbg !356
  %166 = getelementptr inbounds %struct.option, ptr %165, i32 0, i32 2, !dbg !358
  %167 = load ptr, ptr %166, align 8, !dbg !358
  store i32 %162, ptr %167, align 4, !dbg !359
  store i32 0, ptr %6, align 4, !dbg !360
  br label %180, !dbg !360

168:                                              ; preds = %150
  %169 = load ptr, ptr %10, align 8, !dbg !361
  %170 = load i64, ptr %13, align 8, !dbg !362
  %171 = getelementptr inbounds %struct.option, ptr %169, i64 %170, !dbg !361
  %172 = getelementptr inbounds %struct.option, ptr %171, i32 0, i32 3, !dbg !363
  %173 = load i32, ptr %172, align 8, !dbg !363
  store i32 %173, ptr %6, align 4, !dbg !364
  br label %180, !dbg !364

174:                                              ; preds = %107, %96, %93
  %175 = load i64, ptr %13, align 8, !dbg !365
  %176 = add i64 %175, 1, !dbg !365
  store i64 %176, ptr %13, align 8, !dbg !365
  br label %43, !dbg !254, !llvm.loop !366

177:                                              ; preds = %43
  %178 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !368
  %179 = add nsw i32 %178, 1, !dbg !368
  store i32 %179, ptr @__fizzer_model__optind, align 4, !dbg !368
  store i32 63, ptr %6, align 4, !dbg !369
  br label %180, !dbg !369

180:                                              ; preds = %177, %168, %157, %37, %19
  %181 = load i32, ptr %6, align 4, !dbg !370
  ret i32 %181, !dbg !370
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__getopt(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !371 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i8, align 1
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !375, metadata !DIExpression()), !dbg !376
  store ptr %1, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !377, metadata !DIExpression()), !dbg !378
  store ptr %2, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !379, metadata !DIExpression()), !dbg !380
  %12 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !381
  %13 = load i32, ptr %5, align 4, !dbg !383
  %14 = icmp sge i32 %12, %13, !dbg !384
  br i1 %14, label %15, label %16, !dbg !385

15:                                               ; preds = %3
  store i32 -1, ptr %4, align 4, !dbg !386
  br label %113, !dbg !386

16:                                               ; preds = %3
  call void @llvm.dbg.declare(metadata ptr %8, metadata !388, metadata !DIExpression()), !dbg !389
  %17 = load ptr, ptr %6, align 8, !dbg !390
  %18 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !391
  %19 = sext i32 %18 to i64, !dbg !390
  %20 = getelementptr inbounds ptr, ptr %17, i64 %19, !dbg !390
  %21 = load ptr, ptr %20, align 8, !dbg !390
  store ptr %21, ptr %8, align 8, !dbg !389
  %22 = load ptr, ptr %8, align 8, !dbg !392
  %23 = getelementptr inbounds i8, ptr %22, i64 0, !dbg !392
  %24 = load i8, ptr %23, align 1, !dbg !392
  %25 = sext i8 %24 to i32, !dbg !392
  %26 = icmp ne i32 %25, 45, !dbg !394
  br i1 %26, label %33, label %27, !dbg !395

27:                                               ; preds = %16
  %28 = load ptr, ptr %8, align 8, !dbg !396
  %29 = getelementptr inbounds i8, ptr %28, i64 1, !dbg !396
  %30 = load i8, ptr %29, align 1, !dbg !396
  %31 = sext i8 %30 to i32, !dbg !396
  %32 = icmp eq i32 %31, 0, !dbg !397
  br i1 %32, label %33, label %34, !dbg !398

33:                                               ; preds = %27, %16
  store i32 -1, ptr %4, align 4, !dbg !399
  br label %113, !dbg !399

34:                                               ; preds = %27
  call void @llvm.dbg.declare(metadata ptr %9, metadata !401, metadata !DIExpression()), !dbg !402
  %35 = load ptr, ptr %8, align 8, !dbg !403
  %36 = getelementptr inbounds i8, ptr %35, i64 1, !dbg !403
  %37 = load i8, ptr %36, align 1, !dbg !403
  store i8 %37, ptr %9, align 1, !dbg !402
  call void @llvm.dbg.declare(metadata ptr %10, metadata !404, metadata !DIExpression()), !dbg !407
  store i64 0, ptr %10, align 8, !dbg !407
  call void @llvm.dbg.declare(metadata ptr %11, metadata !408, metadata !DIExpression()), !dbg !409
  store i32 0, ptr %11, align 4, !dbg !409
  br label %38, !dbg !410

38:                                               ; preds = %55, %34
  %39 = load ptr, ptr %7, align 8, !dbg !411
  %40 = load i64, ptr %10, align 8, !dbg !412
  %41 = getelementptr inbounds i8, ptr %39, i64 %40, !dbg !411
  %42 = load i8, ptr %41, align 1, !dbg !411
  %43 = sext i8 %42 to i32, !dbg !411
  %44 = icmp ne i32 %43, 0, !dbg !413
  br i1 %44, label %45, label %58, !dbg !410

45:                                               ; preds = %38
  %46 = load ptr, ptr %7, align 8, !dbg !414
  %47 = load i64, ptr %10, align 8, !dbg !417
  %48 = getelementptr inbounds i8, ptr %46, i64 %47, !dbg !414
  %49 = load i8, ptr %48, align 1, !dbg !414
  %50 = sext i8 %49 to i32, !dbg !414
  %51 = load i8, ptr %9, align 1, !dbg !418
  %52 = sext i8 %51 to i32, !dbg !418
  %53 = icmp eq i32 %50, %52, !dbg !419
  br i1 %53, label %54, label %55, !dbg !420

54:                                               ; preds = %45
  store i32 1, ptr %11, align 4, !dbg !421
  br label %58, !dbg !423

55:                                               ; preds = %45
  %56 = load i64, ptr %10, align 8, !dbg !424
  %57 = add i64 %56, 1, !dbg !424
  store i64 %57, ptr %10, align 8, !dbg !424
  br label %38, !dbg !410, !llvm.loop !425

58:                                               ; preds = %54, %38
  %59 = load i32, ptr %11, align 4, !dbg !427
  %60 = icmp ne i32 %59, 0, !dbg !427
  br i1 %60, label %66, label %61, !dbg !429

61:                                               ; preds = %58
  %62 = load i8, ptr %9, align 1, !dbg !430
  %63 = sext i8 %62 to i32, !dbg !430
  store i32 %63, ptr @__fizzer_model__optopt, align 4, !dbg !432
  %64 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !433
  %65 = add nsw i32 %64, 1, !dbg !433
  store i32 %65, ptr @__fizzer_model__optind, align 4, !dbg !433
  store i32 63, ptr %4, align 4, !dbg !434
  br label %113, !dbg !434

66:                                               ; preds = %58
  %67 = load ptr, ptr %7, align 8, !dbg !435
  %68 = load i64, ptr %10, align 8, !dbg !437
  %69 = add i64 %68, 1, !dbg !438
  %70 = getelementptr inbounds i8, ptr %67, i64 %69, !dbg !435
  %71 = load i8, ptr %70, align 1, !dbg !435
  %72 = sext i8 %71 to i32, !dbg !435
  %73 = icmp eq i32 %72, 58, !dbg !439
  br i1 %73, label %74, label %107, !dbg !440

74:                                               ; preds = %66
  %75 = load ptr, ptr %8, align 8, !dbg !441
  %76 = getelementptr inbounds i8, ptr %75, i64 2, !dbg !441
  %77 = load i8, ptr %76, align 1, !dbg !441
  %78 = sext i8 %77 to i32, !dbg !441
  %79 = icmp ne i32 %78, 0, !dbg !444
  br i1 %79, label %80, label %83, !dbg !445

80:                                               ; preds = %74
  %81 = load ptr, ptr %8, align 8, !dbg !446
  %82 = getelementptr inbounds i8, ptr %81, i64 2, !dbg !446
  store ptr %82, ptr @__fizzer_model__optarg, align 8, !dbg !448
  br label %104, !dbg !449

83:                                               ; preds = %74
  %84 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !450
  %85 = add nsw i32 %84, 1, !dbg !452
  %86 = load i32, ptr %5, align 4, !dbg !453
  %87 = icmp slt i32 %85, %86, !dbg !454
  br i1 %87, label %88, label %96, !dbg !455

88:                                               ; preds = %83
  %89 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !456
  %90 = add nsw i32 %89, 1, !dbg !456
  store i32 %90, ptr @__fizzer_model__optind, align 4, !dbg !456
  %91 = load ptr, ptr %6, align 8, !dbg !458
  %92 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !459
  %93 = sext i32 %92 to i64, !dbg !458
  %94 = getelementptr inbounds ptr, ptr %91, i64 %93, !dbg !458
  %95 = load ptr, ptr %94, align 8, !dbg !458
  store ptr %95, ptr @__fizzer_model__optarg, align 8, !dbg !460
  br label %103, !dbg !461

96:                                               ; preds = %83
  store ptr null, ptr @__fizzer_model__optarg, align 8, !dbg !462
  %97 = load i32, ptr @__fizzer_model__opterr, align 4, !dbg !464
  %98 = icmp ne i32 %97, 0, !dbg !464
  br i1 %98, label %99, label %100, !dbg !466

99:                                               ; preds = %96
  br label %100, !dbg !467

100:                                              ; preds = %99, %96
  %101 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !469
  %102 = add nsw i32 %101, 1, !dbg !469
  store i32 %102, ptr @__fizzer_model__optind, align 4, !dbg !469
  store i32 58, ptr %4, align 4, !dbg !470
  br label %113, !dbg !470

103:                                              ; preds = %88
  br label %104

104:                                              ; preds = %103, %80
  %105 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !471
  %106 = add nsw i32 %105, 1, !dbg !471
  store i32 %106, ptr @__fizzer_model__optind, align 4, !dbg !471
  br label %110, !dbg !472

107:                                              ; preds = %66
  store ptr null, ptr @__fizzer_model__optarg, align 8, !dbg !473
  %108 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !475
  %109 = add nsw i32 %108, 1, !dbg !475
  store i32 %109, ptr @__fizzer_model__optind, align 4, !dbg !475
  br label %110

110:                                              ; preds = %107, %104
  %111 = load i8, ptr %9, align 1, !dbg !476
  %112 = sext i8 %111 to i32, !dbg !476
  store i32 %112, ptr %4, align 4, !dbg !477
  br label %113, !dbg !477

113:                                              ; preds = %110, %100, %61, %33, %15
  %114 = load i32, ptr %4, align 4, !dbg !478
  ret i32 %114, !dbg !478
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__atoll(ptr noundef %0) #0 !dbg !479 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !484, metadata !DIExpression()), !dbg !485
  call void @llvm.dbg.declare(metadata ptr %3, metadata !486, metadata !DIExpression()), !dbg !487
  store i64 0, ptr %3, align 8, !dbg !487
  call void @llvm.dbg.declare(metadata ptr %4, metadata !488, metadata !DIExpression()), !dbg !489
  store i32 1, ptr %4, align 4, !dbg !489
  call void @llvm.dbg.declare(metadata ptr %5, metadata !490, metadata !DIExpression()), !dbg !493
  store i64 0, ptr %5, align 8, !dbg !493
  br label %6, !dbg !494

6:                                                ; preds = %23, %1
  %7 = load ptr, ptr %2, align 8, !dbg !495
  %8 = load i64, ptr %5, align 8, !dbg !496
  %9 = getelementptr inbounds i8, ptr %7, i64 %8, !dbg !495
  %10 = load i8, ptr %9, align 1, !dbg !495
  %11 = sext i8 %10 to i32, !dbg !495
  %12 = icmp ne i32 %11, 0, !dbg !497
  br i1 %12, label %13, label %21, !dbg !498

13:                                               ; preds = %6
  %14 = load ptr, ptr %2, align 8, !dbg !499
  %15 = load i64, ptr %5, align 8, !dbg !500
  %16 = getelementptr inbounds i8, ptr %14, i64 %15, !dbg !499
  %17 = load i8, ptr %16, align 1, !dbg !499
  %18 = sext i8 %17 to i32, !dbg !499
  %19 = call i32 @__fizzer_model__isspace(i32 noundef %18), !dbg !501
  %20 = icmp ne i32 %19, 0, !dbg !498
  br label %21

21:                                               ; preds = %13, %6
  %22 = phi i1 [ false, %6 ], [ %20, %13 ], !dbg !502
  br i1 %22, label %23, label %26, !dbg !494

23:                                               ; preds = %21
  %24 = load i64, ptr %5, align 8, !dbg !503
  %25 = add i64 %24, 1, !dbg !503
  store i64 %25, ptr %5, align 8, !dbg !503
  br label %6, !dbg !494, !llvm.loop !505

26:                                               ; preds = %21
  %27 = load ptr, ptr %2, align 8, !dbg !507
  %28 = load i64, ptr %5, align 8, !dbg !509
  %29 = getelementptr inbounds i8, ptr %27, i64 %28, !dbg !507
  %30 = load i8, ptr %29, align 1, !dbg !507
  %31 = sext i8 %30 to i32, !dbg !507
  %32 = icmp eq i32 %31, 43, !dbg !510
  br i1 %32, label %33, label %36, !dbg !511

33:                                               ; preds = %26
  %34 = load i64, ptr %5, align 8, !dbg !512
  %35 = add i64 %34, 1, !dbg !512
  store i64 %35, ptr %5, align 8, !dbg !512
  br label %47, !dbg !514

36:                                               ; preds = %26
  %37 = load ptr, ptr %2, align 8, !dbg !515
  %38 = load i64, ptr %5, align 8, !dbg !517
  %39 = getelementptr inbounds i8, ptr %37, i64 %38, !dbg !515
  %40 = load i8, ptr %39, align 1, !dbg !515
  %41 = sext i8 %40 to i32, !dbg !515
  %42 = icmp eq i32 %41, 45, !dbg !518
  br i1 %42, label %43, label %46, !dbg !519

43:                                               ; preds = %36
  store i32 -1, ptr %4, align 4, !dbg !520
  %44 = load i64, ptr %5, align 8, !dbg !522
  %45 = add i64 %44, 1, !dbg !522
  store i64 %45, ptr %5, align 8, !dbg !522
  br label %46, !dbg !523

46:                                               ; preds = %43, %36
  br label %47

47:                                               ; preds = %46, %33
  br label %48, !dbg !524

48:                                               ; preds = %65, %47
  %49 = load ptr, ptr %2, align 8, !dbg !525
  %50 = load i64, ptr %5, align 8, !dbg !526
  %51 = getelementptr inbounds i8, ptr %49, i64 %50, !dbg !525
  %52 = load i8, ptr %51, align 1, !dbg !525
  %53 = sext i8 %52 to i32, !dbg !525
  %54 = icmp ne i32 %53, 0, !dbg !527
  br i1 %54, label %55, label %63, !dbg !528

55:                                               ; preds = %48
  %56 = load ptr, ptr %2, align 8, !dbg !529
  %57 = load i64, ptr %5, align 8, !dbg !530
  %58 = getelementptr inbounds i8, ptr %56, i64 %57, !dbg !529
  %59 = load i8, ptr %58, align 1, !dbg !529
  %60 = sext i8 %59 to i32, !dbg !529
  %61 = call i32 @__fizzer_model__isdigit(i32 noundef %60), !dbg !531
  %62 = icmp ne i32 %61, 0, !dbg !528
  br label %63

63:                                               ; preds = %55, %48
  %64 = phi i1 [ false, %48 ], [ %62, %55 ], !dbg !502
  br i1 %64, label %65, label %78, !dbg !524

65:                                               ; preds = %63
  %66 = load i64, ptr %3, align 8, !dbg !532
  %67 = mul nsw i64 %66, 10, !dbg !534
  %68 = load ptr, ptr %2, align 8, !dbg !535
  %69 = load i64, ptr %5, align 8, !dbg !536
  %70 = getelementptr inbounds i8, ptr %68, i64 %69, !dbg !535
  %71 = load i8, ptr %70, align 1, !dbg !535
  %72 = sext i8 %71 to i32, !dbg !535
  %73 = sub nsw i32 %72, 48, !dbg !537
  %74 = sext i32 %73 to i64, !dbg !538
  %75 = add nsw i64 %67, %74, !dbg !539
  store i64 %75, ptr %3, align 8, !dbg !540
  %76 = load i64, ptr %5, align 8, !dbg !541
  %77 = add i64 %76, 1, !dbg !541
  store i64 %77, ptr %5, align 8, !dbg !541
  br label %48, !dbg !524, !llvm.loop !542

78:                                               ; preds = %63
  %79 = load i32, ptr %4, align 4, !dbg !544
  %80 = sext i32 %79 to i64, !dbg !544
  %81 = load i64, ptr %3, align 8, !dbg !545
  %82 = mul nsw i64 %80, %81, !dbg !546
  ret i64 %82, !dbg !547
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @__fizzer_model__strtod(ptr noundef %0, ptr noundef %1) #0 !dbg !548 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i64, align 8
  %12 = alloca double, align 8
  %13 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !553, metadata !DIExpression()), !dbg !554
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !555, metadata !DIExpression()), !dbg !556
  call void @llvm.dbg.declare(metadata ptr %5, metadata !557, metadata !DIExpression()), !dbg !558
  store double 0.000000e+00, ptr %5, align 8, !dbg !558
  call void @llvm.dbg.declare(metadata ptr %6, metadata !559, metadata !DIExpression()), !dbg !560
  store double 0.000000e+00, ptr %6, align 8, !dbg !560
  call void @llvm.dbg.declare(metadata ptr %7, metadata !561, metadata !DIExpression()), !dbg !562
  store i32 1, ptr %7, align 4, !dbg !562
  call void @llvm.dbg.declare(metadata ptr %8, metadata !563, metadata !DIExpression()), !dbg !564
  store i32 1, ptr %8, align 4, !dbg !564
  call void @llvm.dbg.declare(metadata ptr %9, metadata !565, metadata !DIExpression()), !dbg !566
  store i32 1, ptr %9, align 4, !dbg !566
  call void @llvm.dbg.declare(metadata ptr %10, metadata !567, metadata !DIExpression()), !dbg !568
  store i32 0, ptr %10, align 4, !dbg !568
  call void @llvm.dbg.declare(metadata ptr %11, metadata !569, metadata !DIExpression()), !dbg !572
  store i64 0, ptr %11, align 8, !dbg !572
  br label %14, !dbg !573

14:                                               ; preds = %31, %2
  %15 = load ptr, ptr %3, align 8, !dbg !574
  %16 = load i64, ptr %11, align 8, !dbg !575
  %17 = getelementptr inbounds i8, ptr %15, i64 %16, !dbg !574
  %18 = load i8, ptr %17, align 1, !dbg !574
  %19 = sext i8 %18 to i32, !dbg !574
  %20 = icmp ne i32 %19, 0, !dbg !576
  br i1 %20, label %21, label %29, !dbg !577

21:                                               ; preds = %14
  %22 = load ptr, ptr %3, align 8, !dbg !578
  %23 = load i64, ptr %11, align 8, !dbg !579
  %24 = getelementptr inbounds i8, ptr %22, i64 %23, !dbg !578
  %25 = load i8, ptr %24, align 1, !dbg !578
  %26 = sext i8 %25 to i32, !dbg !578
  %27 = call i32 @__fizzer_model__isspace(i32 noundef %26), !dbg !580
  %28 = icmp ne i32 %27, 0, !dbg !577
  br label %29

29:                                               ; preds = %21, %14
  %30 = phi i1 [ false, %14 ], [ %28, %21 ], !dbg !581
  br i1 %30, label %31, label %34, !dbg !573

31:                                               ; preds = %29
  %32 = load i64, ptr %11, align 8, !dbg !582
  %33 = add i64 %32, 1, !dbg !582
  store i64 %33, ptr %11, align 8, !dbg !582
  br label %14, !dbg !573, !llvm.loop !584

34:                                               ; preds = %29
  %35 = load ptr, ptr %3, align 8, !dbg !586
  %36 = load i64, ptr %11, align 8, !dbg !588
  %37 = getelementptr inbounds i8, ptr %35, i64 %36, !dbg !586
  %38 = load i8, ptr %37, align 1, !dbg !586
  %39 = sext i8 %38 to i32, !dbg !586
  %40 = icmp eq i32 %39, 43, !dbg !589
  br i1 %40, label %41, label %44, !dbg !590

41:                                               ; preds = %34
  %42 = load i64, ptr %11, align 8, !dbg !591
  %43 = add i64 %42, 1, !dbg !591
  store i64 %43, ptr %11, align 8, !dbg !591
  br label %55, !dbg !593

44:                                               ; preds = %34
  %45 = load ptr, ptr %3, align 8, !dbg !594
  %46 = load i64, ptr %11, align 8, !dbg !596
  %47 = getelementptr inbounds i8, ptr %45, i64 %46, !dbg !594
  %48 = load i8, ptr %47, align 1, !dbg !594
  %49 = sext i8 %48 to i32, !dbg !594
  %50 = icmp eq i32 %49, 45, !dbg !597
  br i1 %50, label %51, label %54, !dbg !598

51:                                               ; preds = %44
  store i32 -1, ptr %7, align 4, !dbg !599
  %52 = load i64, ptr %11, align 8, !dbg !601
  %53 = add i64 %52, 1, !dbg !601
  store i64 %53, ptr %11, align 8, !dbg !601
  br label %54, !dbg !602

54:                                               ; preds = %51, %44
  br label %55

55:                                               ; preds = %54, %41
  br label %56, !dbg !603

56:                                               ; preds = %73, %55
  %57 = load ptr, ptr %3, align 8, !dbg !604
  %58 = load i64, ptr %11, align 8, !dbg !605
  %59 = getelementptr inbounds i8, ptr %57, i64 %58, !dbg !604
  %60 = load i8, ptr %59, align 1, !dbg !604
  %61 = sext i8 %60 to i32, !dbg !604
  %62 = icmp ne i32 %61, 0, !dbg !606
  br i1 %62, label %63, label %71, !dbg !607

63:                                               ; preds = %56
  %64 = load ptr, ptr %3, align 8, !dbg !608
  %65 = load i64, ptr %11, align 8, !dbg !609
  %66 = getelementptr inbounds i8, ptr %64, i64 %65, !dbg !608
  %67 = load i8, ptr %66, align 1, !dbg !608
  %68 = sext i8 %67 to i32, !dbg !608
  %69 = call i32 @__fizzer_model__isdigit(i32 noundef %68), !dbg !610
  %70 = icmp ne i32 %69, 0, !dbg !607
  br label %71

71:                                               ; preds = %63, %56
  %72 = phi i1 [ false, %56 ], [ %70, %63 ], !dbg !581
  br i1 %72, label %73, label %85, !dbg !603

73:                                               ; preds = %71
  %74 = load double, ptr %5, align 8, !dbg !611
  %75 = load ptr, ptr %3, align 8, !dbg !613
  %76 = load i64, ptr %11, align 8, !dbg !614
  %77 = getelementptr inbounds i8, ptr %75, i64 %76, !dbg !613
  %78 = load i8, ptr %77, align 1, !dbg !613
  %79 = sext i8 %78 to i32, !dbg !613
  %80 = sub nsw i32 %79, 48, !dbg !615
  %81 = sitofp i32 %80 to double, !dbg !616
  %82 = call double @llvm.fmuladd.f64(double %74, double 1.000000e+01, double %81), !dbg !617
  store double %82, ptr %5, align 8, !dbg !618
  %83 = load i64, ptr %11, align 8, !dbg !619
  %84 = add i64 %83, 1, !dbg !619
  store i64 %84, ptr %11, align 8, !dbg !619
  br label %56, !dbg !603, !llvm.loop !620

85:                                               ; preds = %71
  %86 = load ptr, ptr %3, align 8, !dbg !622
  %87 = load i64, ptr %11, align 8, !dbg !624
  %88 = getelementptr inbounds i8, ptr %86, i64 %87, !dbg !622
  %89 = load i8, ptr %88, align 1, !dbg !622
  %90 = sext i8 %89 to i32, !dbg !622
  %91 = icmp eq i32 %90, 46, !dbg !625
  br i1 %91, label %92, label %133, !dbg !626

92:                                               ; preds = %85
  %93 = load i64, ptr %11, align 8, !dbg !627
  %94 = add i64 %93, 1, !dbg !627
  store i64 %94, ptr %11, align 8, !dbg !627
  br label %95, !dbg !629

95:                                               ; preds = %112, %92
  %96 = load ptr, ptr %3, align 8, !dbg !630
  %97 = load i64, ptr %11, align 8, !dbg !631
  %98 = getelementptr inbounds i8, ptr %96, i64 %97, !dbg !630
  %99 = load i8, ptr %98, align 1, !dbg !630
  %100 = sext i8 %99 to i32, !dbg !630
  %101 = icmp ne i32 %100, 0, !dbg !632
  br i1 %101, label %102, label %110, !dbg !633

102:                                              ; preds = %95
  %103 = load ptr, ptr %3, align 8, !dbg !634
  %104 = load i64, ptr %11, align 8, !dbg !635
  %105 = getelementptr inbounds i8, ptr %103, i64 %104, !dbg !634
  %106 = load i8, ptr %105, align 1, !dbg !634
  %107 = sext i8 %106 to i32, !dbg !634
  %108 = call i32 @__fizzer_model__isdigit(i32 noundef %107), !dbg !636
  %109 = icmp ne i32 %108, 0, !dbg !633
  br label %110

110:                                              ; preds = %102, %95
  %111 = phi i1 [ false, %95 ], [ %109, %102 ], !dbg !637
  br i1 %111, label %112, label %126, !dbg !629

112:                                              ; preds = %110
  %113 = load double, ptr %6, align 8, !dbg !638
  %114 = load ptr, ptr %3, align 8, !dbg !640
  %115 = load i64, ptr %11, align 8, !dbg !641
  %116 = getelementptr inbounds i8, ptr %114, i64 %115, !dbg !640
  %117 = load i8, ptr %116, align 1, !dbg !640
  %118 = sext i8 %117 to i32, !dbg !640
  %119 = sub nsw i32 %118, 48, !dbg !642
  %120 = sitofp i32 %119 to double, !dbg !643
  %121 = call double @llvm.fmuladd.f64(double %113, double 1.000000e+01, double %120), !dbg !644
  store double %121, ptr %6, align 8, !dbg !645
  %122 = load i32, ptr %8, align 4, !dbg !646
  %123 = mul nsw i32 %122, 10, !dbg !647
  store i32 %123, ptr %8, align 4, !dbg !648
  %124 = load i64, ptr %11, align 8, !dbg !649
  %125 = add i64 %124, 1, !dbg !649
  store i64 %125, ptr %11, align 8, !dbg !649
  br label %95, !dbg !629, !llvm.loop !650

126:                                              ; preds = %110
  %127 = load double, ptr %5, align 8, !dbg !652
  %128 = load double, ptr %6, align 8, !dbg !653
  %129 = load i32, ptr %8, align 4, !dbg !654
  %130 = sitofp i32 %129 to double, !dbg !655
  %131 = fdiv double %128, %130, !dbg !656
  %132 = fadd double %127, %131, !dbg !657
  store double %132, ptr %5, align 8, !dbg !658
  br label %133, !dbg !659

133:                                              ; preds = %126, %85
  %134 = load ptr, ptr %3, align 8, !dbg !660
  %135 = load i64, ptr %11, align 8, !dbg !662
  %136 = getelementptr inbounds i8, ptr %134, i64 %135, !dbg !660
  %137 = load i8, ptr %136, align 1, !dbg !660
  %138 = sext i8 %137 to i32, !dbg !660
  %139 = icmp eq i32 %138, 101, !dbg !663
  br i1 %139, label %147, label %140, !dbg !664

140:                                              ; preds = %133
  %141 = load ptr, ptr %3, align 8, !dbg !665
  %142 = load i64, ptr %11, align 8, !dbg !666
  %143 = getelementptr inbounds i8, ptr %141, i64 %142, !dbg !665
  %144 = load i8, ptr %143, align 1, !dbg !665
  %145 = sext i8 %144 to i32, !dbg !665
  %146 = icmp eq i32 %145, 69, !dbg !667
  br i1 %146, label %147, label %201, !dbg !668

147:                                              ; preds = %140, %133
  %148 = load i64, ptr %11, align 8, !dbg !669
  %149 = add i64 %148, 1, !dbg !669
  store i64 %149, ptr %11, align 8, !dbg !669
  %150 = load ptr, ptr %3, align 8, !dbg !671
  %151 = load i64, ptr %11, align 8, !dbg !673
  %152 = getelementptr inbounds i8, ptr %150, i64 %151, !dbg !671
  %153 = load i8, ptr %152, align 1, !dbg !671
  %154 = sext i8 %153 to i32, !dbg !671
  %155 = icmp eq i32 %154, 43, !dbg !674
  br i1 %155, label %156, label %159, !dbg !675

156:                                              ; preds = %147
  %157 = load i64, ptr %11, align 8, !dbg !676
  %158 = add i64 %157, 1, !dbg !676
  store i64 %158, ptr %11, align 8, !dbg !676
  br label %170, !dbg !678

159:                                              ; preds = %147
  %160 = load ptr, ptr %3, align 8, !dbg !679
  %161 = load i64, ptr %11, align 8, !dbg !681
  %162 = getelementptr inbounds i8, ptr %160, i64 %161, !dbg !679
  %163 = load i8, ptr %162, align 1, !dbg !679
  %164 = sext i8 %163 to i32, !dbg !679
  %165 = icmp eq i32 %164, 45, !dbg !682
  br i1 %165, label %166, label %169, !dbg !683

166:                                              ; preds = %159
  store i32 -1, ptr %9, align 4, !dbg !684
  %167 = load i64, ptr %11, align 8, !dbg !686
  %168 = add i64 %167, 1, !dbg !686
  store i64 %168, ptr %11, align 8, !dbg !686
  br label %169, !dbg !687

169:                                              ; preds = %166, %159
  br label %170

170:                                              ; preds = %169, %156
  br label %171, !dbg !688

171:                                              ; preds = %188, %170
  %172 = load ptr, ptr %3, align 8, !dbg !689
  %173 = load i64, ptr %11, align 8, !dbg !690
  %174 = getelementptr inbounds i8, ptr %172, i64 %173, !dbg !689
  %175 = load i8, ptr %174, align 1, !dbg !689
  %176 = sext i8 %175 to i32, !dbg !689
  %177 = icmp ne i32 %176, 0, !dbg !691
  br i1 %177, label %178, label %186, !dbg !692

178:                                              ; preds = %171
  %179 = load ptr, ptr %3, align 8, !dbg !693
  %180 = load i64, ptr %11, align 8, !dbg !694
  %181 = getelementptr inbounds i8, ptr %179, i64 %180, !dbg !693
  %182 = load i8, ptr %181, align 1, !dbg !693
  %183 = sext i8 %182 to i32, !dbg !693
  %184 = call i32 @__fizzer_model__isdigit(i32 noundef %183), !dbg !695
  %185 = icmp ne i32 %184, 0, !dbg !692
  br label %186

186:                                              ; preds = %178, %171
  %187 = phi i1 [ false, %171 ], [ %185, %178 ], !dbg !696
  br i1 %187, label %188, label %200, !dbg !688

188:                                              ; preds = %186
  %189 = load i32, ptr %10, align 4, !dbg !697
  %190 = mul nsw i32 %189, 10, !dbg !699
  %191 = load ptr, ptr %3, align 8, !dbg !700
  %192 = load i64, ptr %11, align 8, !dbg !701
  %193 = getelementptr inbounds i8, ptr %191, i64 %192, !dbg !700
  %194 = load i8, ptr %193, align 1, !dbg !700
  %195 = sext i8 %194 to i32, !dbg !700
  %196 = sub nsw i32 %195, 48, !dbg !702
  %197 = add nsw i32 %190, %196, !dbg !703
  store i32 %197, ptr %10, align 4, !dbg !704
  %198 = load i64, ptr %11, align 8, !dbg !705
  %199 = add i64 %198, 1, !dbg !705
  store i64 %199, ptr %11, align 8, !dbg !705
  br label %171, !dbg !688, !llvm.loop !706

200:                                              ; preds = %186
  br label %201, !dbg !708

201:                                              ; preds = %200, %140
  %202 = load ptr, ptr %4, align 8, !dbg !709
  %203 = icmp ne ptr %202, null, !dbg !711
  br i1 %203, label %204, label %209, !dbg !712

204:                                              ; preds = %201
  %205 = load ptr, ptr %3, align 8, !dbg !713
  %206 = load i64, ptr %11, align 8, !dbg !715
  %207 = getelementptr inbounds i8, ptr %205, i64 %206, !dbg !716
  %208 = load ptr, ptr %4, align 8, !dbg !717
  store ptr %207, ptr %208, align 8, !dbg !718
  br label %209, !dbg !719

209:                                              ; preds = %204, %201
  call void @llvm.dbg.declare(metadata ptr %12, metadata !720, metadata !DIExpression()), !dbg !721
  store double 1.000000e+00, ptr %12, align 8, !dbg !721
  call void @llvm.dbg.declare(metadata ptr %13, metadata !722, metadata !DIExpression()), !dbg !724
  store i32 0, ptr %13, align 4, !dbg !724
  br label %210, !dbg !725

210:                                              ; preds = %217, %209
  %211 = load i32, ptr %13, align 4, !dbg !726
  %212 = load i32, ptr %10, align 4, !dbg !728
  %213 = icmp slt i32 %211, %212, !dbg !729
  br i1 %213, label %214, label %220, !dbg !730

214:                                              ; preds = %210
  %215 = load double, ptr %12, align 8, !dbg !731
  %216 = fmul double %215, 1.000000e+01, !dbg !733
  store double %216, ptr %12, align 8, !dbg !734
  br label %217, !dbg !735

217:                                              ; preds = %214
  %218 = load i32, ptr %13, align 4, !dbg !736
  %219 = add nsw i32 %218, 1, !dbg !736
  store i32 %219, ptr %13, align 4, !dbg !736
  br label %210, !dbg !737, !llvm.loop !738

220:                                              ; preds = %210
  %221 = load i32, ptr %9, align 4, !dbg !740
  %222 = icmp slt i32 %221, 0, !dbg !742
  br i1 %222, label %223, label %227, !dbg !743

223:                                              ; preds = %220
  %224 = load double, ptr %5, align 8, !dbg !744
  %225 = load double, ptr %12, align 8, !dbg !746
  %226 = fdiv double %224, %225, !dbg !747
  store double %226, ptr %5, align 8, !dbg !748
  br label %231, !dbg !749

227:                                              ; preds = %220
  %228 = load double, ptr %5, align 8, !dbg !750
  %229 = load double, ptr %12, align 8, !dbg !752
  %230 = fmul double %228, %229, !dbg !753
  store double %230, ptr %5, align 8, !dbg !754
  br label %231

231:                                              ; preds = %227, %223
  %232 = load i32, ptr %7, align 4, !dbg !755
  %233 = sitofp i32 %232 to double, !dbg !755
  %234 = load double, ptr %5, align 8, !dbg !756
  %235 = fmul double %233, %234, !dbg !757
  ret double %235, !dbg !758
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__abs(i32 noundef %0) #0 !dbg !759 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !763, metadata !DIExpression()), !dbg !764
  %4 = load i32, ptr %3, align 4, !dbg !765
  %5 = icmp slt i32 %4, 0, !dbg !767
  br i1 %5, label %6, label %9, !dbg !768

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !769
  %8 = sub nsw i32 0, %7, !dbg !770
  store i32 %8, ptr %2, align 4, !dbg !771
  br label %11, !dbg !771

9:                                                ; preds = %1
  %10 = load i32, ptr %3, align 4, !dbg !772
  store i32 %10, ptr %2, align 4, !dbg !773
  br label %11, !dbg !773

11:                                               ; preds = %9, %6
  %12 = load i32, ptr %2, align 4, !dbg !774
  ret i32 %12, !dbg !774
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__labs(i64 noundef %0) #0 !dbg !775 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !780, metadata !DIExpression()), !dbg !781
  %4 = load i64, ptr %3, align 8, !dbg !782
  %5 = icmp slt i64 %4, 0, !dbg !784
  br i1 %5, label %6, label %9, !dbg !785

6:                                                ; preds = %1
  %7 = load i64, ptr %3, align 8, !dbg !786
  %8 = sub nsw i64 0, %7, !dbg !787
  store i64 %8, ptr %2, align 8, !dbg !788
  br label %11, !dbg !788

9:                                                ; preds = %1
  %10 = load i64, ptr %3, align 8, !dbg !789
  store i64 %10, ptr %2, align 8, !dbg !790
  br label %11, !dbg !790

11:                                               ; preds = %9, %6
  %12 = load i64, ptr %2, align 8, !dbg !791
  ret i64 %12, !dbg !791
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__llabs(i64 noundef %0) #0 !dbg !792 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !796, metadata !DIExpression()), !dbg !797
  %4 = load i64, ptr %3, align 8, !dbg !798
  %5 = icmp slt i64 %4, 0, !dbg !800
  br i1 %5, label %6, label %9, !dbg !801

6:                                                ; preds = %1
  %7 = load i64, ptr %3, align 8, !dbg !802
  %8 = sub nsw i64 0, %7, !dbg !803
  store i64 %8, ptr %2, align 8, !dbg !804
  br label %11, !dbg !804

9:                                                ; preds = %1
  %10 = load i64, ptr %3, align 8, !dbg !805
  store i64 %10, ptr %2, align 8, !dbg !806
  br label %11, !dbg !806

11:                                               ; preds = %9, %6
  %12 = load i64, ptr %2, align 8, !dbg !807
  ret i64 %12, !dbg !807
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__strtol(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !808 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !812, metadata !DIExpression()), !dbg !813
  store ptr %1, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !814, metadata !DIExpression()), !dbg !815
  store i32 %2, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !816, metadata !DIExpression()), !dbg !817
  call void @llvm.dbg.declare(metadata ptr %8, metadata !818, metadata !DIExpression()), !dbg !819
  store i64 0, ptr %8, align 8, !dbg !819
  call void @llvm.dbg.declare(metadata ptr %9, metadata !820, metadata !DIExpression()), !dbg !821
  store i32 1, ptr %9, align 4, !dbg !821
  call void @llvm.dbg.declare(metadata ptr %10, metadata !822, metadata !DIExpression()), !dbg !825
  store i64 0, ptr %10, align 8, !dbg !825
  %12 = load i32, ptr %7, align 4, !dbg !826
  %13 = icmp ne i32 %12, 10, !dbg !828
  br i1 %13, label %14, label %21, !dbg !829

14:                                               ; preds = %3
  %15 = load ptr, ptr %6, align 8, !dbg !830
  %16 = icmp ne ptr %15, null, !dbg !833
  br i1 %16, label %17, label %20, !dbg !834

17:                                               ; preds = %14
  %18 = load ptr, ptr %5, align 8, !dbg !835
  %19 = load ptr, ptr %6, align 8, !dbg !837
  store ptr %18, ptr %19, align 8, !dbg !838
  br label %20, !dbg !839

20:                                               ; preds = %17, %14
  store i64 0, ptr %4, align 8, !dbg !840
  br label %108, !dbg !840

21:                                               ; preds = %3
  br label %22, !dbg !841

22:                                               ; preds = %39, %21
  %23 = load ptr, ptr %5, align 8, !dbg !842
  %24 = load i64, ptr %10, align 8, !dbg !843
  %25 = getelementptr inbounds i8, ptr %23, i64 %24, !dbg !842
  %26 = load i8, ptr %25, align 1, !dbg !842
  %27 = sext i8 %26 to i32, !dbg !842
  %28 = icmp ne i32 %27, 0, !dbg !844
  br i1 %28, label %29, label %37, !dbg !845

29:                                               ; preds = %22
  %30 = load ptr, ptr %5, align 8, !dbg !846
  %31 = load i64, ptr %10, align 8, !dbg !847
  %32 = getelementptr inbounds i8, ptr %30, i64 %31, !dbg !846
  %33 = load i8, ptr %32, align 1, !dbg !846
  %34 = sext i8 %33 to i32, !dbg !846
  %35 = call i32 @__fizzer_model__isspace(i32 noundef %34), !dbg !848
  %36 = icmp ne i32 %35, 0, !dbg !845
  br label %37

37:                                               ; preds = %29, %22
  %38 = phi i1 [ false, %22 ], [ %36, %29 ], !dbg !849
  br i1 %38, label %39, label %42, !dbg !841

39:                                               ; preds = %37
  %40 = load i64, ptr %10, align 8, !dbg !850
  %41 = add i64 %40, 1, !dbg !850
  store i64 %41, ptr %10, align 8, !dbg !850
  br label %22, !dbg !841, !llvm.loop !852

42:                                               ; preds = %37
  %43 = load ptr, ptr %5, align 8, !dbg !854
  %44 = load i64, ptr %10, align 8, !dbg !856
  %45 = getelementptr inbounds i8, ptr %43, i64 %44, !dbg !854
  %46 = load i8, ptr %45, align 1, !dbg !854
  %47 = sext i8 %46 to i32, !dbg !854
  %48 = icmp eq i32 %47, 43, !dbg !857
  br i1 %48, label %49, label %52, !dbg !858

49:                                               ; preds = %42
  %50 = load i64, ptr %10, align 8, !dbg !859
  %51 = add i64 %50, 1, !dbg !859
  store i64 %51, ptr %10, align 8, !dbg !859
  br label %63, !dbg !861

52:                                               ; preds = %42
  %53 = load ptr, ptr %5, align 8, !dbg !862
  %54 = load i64, ptr %10, align 8, !dbg !864
  %55 = getelementptr inbounds i8, ptr %53, i64 %54, !dbg !862
  %56 = load i8, ptr %55, align 1, !dbg !862
  %57 = sext i8 %56 to i32, !dbg !862
  %58 = icmp eq i32 %57, 45, !dbg !865
  br i1 %58, label %59, label %62, !dbg !866

59:                                               ; preds = %52
  store i32 -1, ptr %9, align 4, !dbg !867
  %60 = load i64, ptr %10, align 8, !dbg !869
  %61 = add i64 %60, 1, !dbg !869
  store i64 %61, ptr %10, align 8, !dbg !869
  br label %62, !dbg !870

62:                                               ; preds = %59, %52
  br label %63

63:                                               ; preds = %62, %49
  call void @llvm.dbg.declare(metadata ptr %11, metadata !871, metadata !DIExpression()), !dbg !872
  %64 = load i64, ptr %10, align 8, !dbg !873
  store i64 %64, ptr %11, align 8, !dbg !872
  br label %65, !dbg !874

65:                                               ; preds = %82, %63
  %66 = load ptr, ptr %5, align 8, !dbg !875
  %67 = load i64, ptr %10, align 8, !dbg !876
  %68 = getelementptr inbounds i8, ptr %66, i64 %67, !dbg !875
  %69 = load i8, ptr %68, align 1, !dbg !875
  %70 = sext i8 %69 to i32, !dbg !875
  %71 = icmp ne i32 %70, 0, !dbg !877
  br i1 %71, label %72, label %80, !dbg !878

72:                                               ; preds = %65
  %73 = load ptr, ptr %5, align 8, !dbg !879
  %74 = load i64, ptr %10, align 8, !dbg !880
  %75 = getelementptr inbounds i8, ptr %73, i64 %74, !dbg !879
  %76 = load i8, ptr %75, align 1, !dbg !879
  %77 = sext i8 %76 to i32, !dbg !879
  %78 = call i32 @__fizzer_model__isdigit(i32 noundef %77), !dbg !881
  %79 = icmp ne i32 %78, 0, !dbg !878
  br label %80

80:                                               ; preds = %72, %65
  %81 = phi i1 [ false, %65 ], [ %79, %72 ], !dbg !849
  br i1 %81, label %82, label %95, !dbg !874

82:                                               ; preds = %80
  %83 = load i64, ptr %8, align 8, !dbg !882
  %84 = mul nsw i64 %83, 10, !dbg !884
  %85 = load ptr, ptr %5, align 8, !dbg !885
  %86 = load i64, ptr %10, align 8, !dbg !886
  %87 = getelementptr inbounds i8, ptr %85, i64 %86, !dbg !885
  %88 = load i8, ptr %87, align 1, !dbg !885
  %89 = sext i8 %88 to i32, !dbg !885
  %90 = sub nsw i32 %89, 48, !dbg !887
  %91 = sext i32 %90 to i64, !dbg !888
  %92 = add nsw i64 %84, %91, !dbg !889
  store i64 %92, ptr %8, align 8, !dbg !890
  %93 = load i64, ptr %10, align 8, !dbg !891
  %94 = add i64 %93, 1, !dbg !891
  store i64 %94, ptr %10, align 8, !dbg !891
  br label %65, !dbg !874, !llvm.loop !892

95:                                               ; preds = %80
  %96 = load ptr, ptr %6, align 8, !dbg !894
  %97 = icmp ne ptr %96, null, !dbg !896
  br i1 %97, label %98, label %103, !dbg !897

98:                                               ; preds = %95
  %99 = load ptr, ptr %5, align 8, !dbg !898
  %100 = load i64, ptr %10, align 8, !dbg !900
  %101 = getelementptr inbounds i8, ptr %99, i64 %100, !dbg !901
  %102 = load ptr, ptr %6, align 8, !dbg !902
  store ptr %101, ptr %102, align 8, !dbg !903
  br label %103, !dbg !904

103:                                              ; preds = %98, %95
  %104 = load i32, ptr %9, align 4, !dbg !905
  %105 = sext i32 %104 to i64, !dbg !905
  %106 = load i64, ptr %8, align 8, !dbg !906
  %107 = mul nsw i64 %105, %106, !dbg !907
  store i64 %107, ptr %4, align 8, !dbg !908
  br label %108, !dbg !908

108:                                              ; preds = %103, %20
  %109 = load i64, ptr %4, align 8, !dbg !909
  ret i64 %109, !dbg !909
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__atol(ptr noundef %0) #0 !dbg !910 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !914, metadata !DIExpression()), !dbg !915
  call void @llvm.dbg.declare(metadata ptr %3, metadata !916, metadata !DIExpression()), !dbg !917
  store i64 0, ptr %3, align 8, !dbg !917
  call void @llvm.dbg.declare(metadata ptr %4, metadata !918, metadata !DIExpression()), !dbg !919
  store i32 1, ptr %4, align 4, !dbg !919
  call void @llvm.dbg.declare(metadata ptr %5, metadata !920, metadata !DIExpression()), !dbg !923
  store i64 0, ptr %5, align 8, !dbg !923
  br label %6, !dbg !924

6:                                                ; preds = %23, %1
  %7 = load ptr, ptr %2, align 8, !dbg !925
  %8 = load i64, ptr %5, align 8, !dbg !926
  %9 = getelementptr inbounds i8, ptr %7, i64 %8, !dbg !925
  %10 = load i8, ptr %9, align 1, !dbg !925
  %11 = sext i8 %10 to i32, !dbg !925
  %12 = icmp ne i32 %11, 0, !dbg !927
  br i1 %12, label %13, label %21, !dbg !928

13:                                               ; preds = %6
  %14 = load ptr, ptr %2, align 8, !dbg !929
  %15 = load i64, ptr %5, align 8, !dbg !930
  %16 = getelementptr inbounds i8, ptr %14, i64 %15, !dbg !929
  %17 = load i8, ptr %16, align 1, !dbg !929
  %18 = sext i8 %17 to i32, !dbg !929
  %19 = call i32 @__fizzer_model__isspace(i32 noundef %18), !dbg !931
  %20 = icmp ne i32 %19, 0, !dbg !928
  br label %21

21:                                               ; preds = %13, %6
  %22 = phi i1 [ false, %6 ], [ %20, %13 ], !dbg !932
  br i1 %22, label %23, label %26, !dbg !924

23:                                               ; preds = %21
  %24 = load i64, ptr %5, align 8, !dbg !933
  %25 = add i64 %24, 1, !dbg !933
  store i64 %25, ptr %5, align 8, !dbg !933
  br label %6, !dbg !924, !llvm.loop !935

26:                                               ; preds = %21
  %27 = load ptr, ptr %2, align 8, !dbg !937
  %28 = load i64, ptr %5, align 8, !dbg !939
  %29 = getelementptr inbounds i8, ptr %27, i64 %28, !dbg !937
  %30 = load i8, ptr %29, align 1, !dbg !937
  %31 = sext i8 %30 to i32, !dbg !937
  %32 = icmp eq i32 %31, 43, !dbg !940
  br i1 %32, label %33, label %36, !dbg !941

33:                                               ; preds = %26
  %34 = load i64, ptr %5, align 8, !dbg !942
  %35 = add i64 %34, 1, !dbg !942
  store i64 %35, ptr %5, align 8, !dbg !942
  br label %47, !dbg !944

36:                                               ; preds = %26
  %37 = load ptr, ptr %2, align 8, !dbg !945
  %38 = load i64, ptr %5, align 8, !dbg !947
  %39 = getelementptr inbounds i8, ptr %37, i64 %38, !dbg !945
  %40 = load i8, ptr %39, align 1, !dbg !945
  %41 = sext i8 %40 to i32, !dbg !945
  %42 = icmp eq i32 %41, 45, !dbg !948
  br i1 %42, label %43, label %46, !dbg !949

43:                                               ; preds = %36
  store i32 -1, ptr %4, align 4, !dbg !950
  %44 = load i64, ptr %5, align 8, !dbg !952
  %45 = add i64 %44, 1, !dbg !952
  store i64 %45, ptr %5, align 8, !dbg !952
  br label %46, !dbg !953

46:                                               ; preds = %43, %36
  br label %47

47:                                               ; preds = %46, %33
  br label %48, !dbg !954

48:                                               ; preds = %65, %47
  %49 = load ptr, ptr %2, align 8, !dbg !955
  %50 = load i64, ptr %5, align 8, !dbg !956
  %51 = getelementptr inbounds i8, ptr %49, i64 %50, !dbg !955
  %52 = load i8, ptr %51, align 1, !dbg !955
  %53 = sext i8 %52 to i32, !dbg !955
  %54 = icmp ne i32 %53, 0, !dbg !957
  br i1 %54, label %55, label %63, !dbg !958

55:                                               ; preds = %48
  %56 = load ptr, ptr %2, align 8, !dbg !959
  %57 = load i64, ptr %5, align 8, !dbg !960
  %58 = getelementptr inbounds i8, ptr %56, i64 %57, !dbg !959
  %59 = load i8, ptr %58, align 1, !dbg !959
  %60 = sext i8 %59 to i32, !dbg !959
  %61 = call i32 @__fizzer_model__isdigit(i32 noundef %60), !dbg !961
  %62 = icmp ne i32 %61, 0, !dbg !958
  br label %63

63:                                               ; preds = %55, %48
  %64 = phi i1 [ false, %48 ], [ %62, %55 ], !dbg !932
  br i1 %64, label %65, label %78, !dbg !954

65:                                               ; preds = %63
  %66 = load i64, ptr %3, align 8, !dbg !962
  %67 = mul nsw i64 %66, 10, !dbg !964
  %68 = load ptr, ptr %2, align 8, !dbg !965
  %69 = load i64, ptr %5, align 8, !dbg !966
  %70 = getelementptr inbounds i8, ptr %68, i64 %69, !dbg !965
  %71 = load i8, ptr %70, align 1, !dbg !965
  %72 = sext i8 %71 to i32, !dbg !965
  %73 = sub nsw i32 %72, 48, !dbg !967
  %74 = sext i32 %73 to i64, !dbg !968
  %75 = add nsw i64 %67, %74, !dbg !969
  store i64 %75, ptr %3, align 8, !dbg !970
  %76 = load i64, ptr %5, align 8, !dbg !971
  %77 = add i64 %76, 1, !dbg !971
  store i64 %77, ptr %5, align 8, !dbg !971
  br label %48, !dbg !954, !llvm.loop !972

78:                                               ; preds = %63
  %79 = load i32, ptr %4, align 4, !dbg !974
  %80 = sext i32 %79 to i64, !dbg !974
  %81 = load i64, ptr %3, align 8, !dbg !975
  %82 = mul nsw i64 %80, %81, !dbg !976
  ret i64 %82, !dbg !977
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__strtoul(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !978 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !982, metadata !DIExpression()), !dbg !983
  store ptr %1, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !984, metadata !DIExpression()), !dbg !985
  store i32 %2, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !986, metadata !DIExpression()), !dbg !987
  call void @llvm.dbg.declare(metadata ptr %8, metadata !988, metadata !DIExpression()), !dbg !989
  store i64 0, ptr %8, align 8, !dbg !989
  call void @llvm.dbg.declare(metadata ptr %9, metadata !990, metadata !DIExpression()), !dbg !993
  store i64 0, ptr %9, align 8, !dbg !993
  %11 = load i32, ptr %7, align 4, !dbg !994
  %12 = icmp ne i32 %11, 10, !dbg !996
  br i1 %12, label %13, label %20, !dbg !997

13:                                               ; preds = %3
  %14 = load ptr, ptr %6, align 8, !dbg !998
  %15 = icmp ne ptr %14, null, !dbg !1001
  br i1 %15, label %16, label %19, !dbg !1002

16:                                               ; preds = %13
  %17 = load ptr, ptr %5, align 8, !dbg !1003
  %18 = load ptr, ptr %6, align 8, !dbg !1005
  store ptr %17, ptr %18, align 8, !dbg !1006
  br label %19, !dbg !1007

19:                                               ; preds = %16, %13
  store i64 0, ptr %4, align 8, !dbg !1008
  br label %93, !dbg !1008

20:                                               ; preds = %3
  br label %21, !dbg !1009

21:                                               ; preds = %38, %20
  %22 = load ptr, ptr %5, align 8, !dbg !1010
  %23 = load i64, ptr %9, align 8, !dbg !1011
  %24 = getelementptr inbounds i8, ptr %22, i64 %23, !dbg !1010
  %25 = load i8, ptr %24, align 1, !dbg !1010
  %26 = sext i8 %25 to i32, !dbg !1010
  %27 = icmp ne i32 %26, 0, !dbg !1012
  br i1 %27, label %28, label %36, !dbg !1013

28:                                               ; preds = %21
  %29 = load ptr, ptr %5, align 8, !dbg !1014
  %30 = load i64, ptr %9, align 8, !dbg !1015
  %31 = getelementptr inbounds i8, ptr %29, i64 %30, !dbg !1014
  %32 = load i8, ptr %31, align 1, !dbg !1014
  %33 = sext i8 %32 to i32, !dbg !1014
  %34 = call i32 @__fizzer_model__isspace(i32 noundef %33), !dbg !1016
  %35 = icmp ne i32 %34, 0, !dbg !1013
  br label %36

36:                                               ; preds = %28, %21
  %37 = phi i1 [ false, %21 ], [ %35, %28 ], !dbg !1017
  br i1 %37, label %38, label %41, !dbg !1009

38:                                               ; preds = %36
  %39 = load i64, ptr %9, align 8, !dbg !1018
  %40 = add i64 %39, 1, !dbg !1018
  store i64 %40, ptr %9, align 8, !dbg !1018
  br label %21, !dbg !1009, !llvm.loop !1020

41:                                               ; preds = %36
  %42 = load ptr, ptr %5, align 8, !dbg !1022
  %43 = load i64, ptr %9, align 8, !dbg !1024
  %44 = getelementptr inbounds i8, ptr %42, i64 %43, !dbg !1022
  %45 = load i8, ptr %44, align 1, !dbg !1022
  %46 = sext i8 %45 to i32, !dbg !1022
  %47 = icmp eq i32 %46, 43, !dbg !1025
  br i1 %47, label %48, label %51, !dbg !1026

48:                                               ; preds = %41
  %49 = load i64, ptr %9, align 8, !dbg !1027
  %50 = add i64 %49, 1, !dbg !1027
  store i64 %50, ptr %9, align 8, !dbg !1027
  br label %51, !dbg !1029

51:                                               ; preds = %48, %41
  call void @llvm.dbg.declare(metadata ptr %10, metadata !1030, metadata !DIExpression()), !dbg !1031
  %52 = load i64, ptr %9, align 8, !dbg !1032
  store i64 %52, ptr %10, align 8, !dbg !1031
  br label %53, !dbg !1033

53:                                               ; preds = %70, %51
  %54 = load ptr, ptr %5, align 8, !dbg !1034
  %55 = load i64, ptr %9, align 8, !dbg !1035
  %56 = getelementptr inbounds i8, ptr %54, i64 %55, !dbg !1034
  %57 = load i8, ptr %56, align 1, !dbg !1034
  %58 = sext i8 %57 to i32, !dbg !1034
  %59 = icmp ne i32 %58, 0, !dbg !1036
  br i1 %59, label %60, label %68, !dbg !1037

60:                                               ; preds = %53
  %61 = load ptr, ptr %5, align 8, !dbg !1038
  %62 = load i64, ptr %9, align 8, !dbg !1039
  %63 = getelementptr inbounds i8, ptr %61, i64 %62, !dbg !1038
  %64 = load i8, ptr %63, align 1, !dbg !1038
  %65 = sext i8 %64 to i32, !dbg !1038
  %66 = call i32 @__fizzer_model__isdigit(i32 noundef %65), !dbg !1040
  %67 = icmp ne i32 %66, 0, !dbg !1037
  br label %68

68:                                               ; preds = %60, %53
  %69 = phi i1 [ false, %53 ], [ %67, %60 ], !dbg !1017
  br i1 %69, label %70, label %83, !dbg !1033

70:                                               ; preds = %68
  %71 = load i64, ptr %8, align 8, !dbg !1041
  %72 = mul i64 %71, 10, !dbg !1043
  %73 = load ptr, ptr %5, align 8, !dbg !1044
  %74 = load i64, ptr %9, align 8, !dbg !1045
  %75 = getelementptr inbounds i8, ptr %73, i64 %74, !dbg !1044
  %76 = load i8, ptr %75, align 1, !dbg !1044
  %77 = sext i8 %76 to i32, !dbg !1044
  %78 = sub nsw i32 %77, 48, !dbg !1046
  %79 = sext i32 %78 to i64, !dbg !1047
  %80 = add i64 %72, %79, !dbg !1048
  store i64 %80, ptr %8, align 8, !dbg !1049
  %81 = load i64, ptr %9, align 8, !dbg !1050
  %82 = add i64 %81, 1, !dbg !1050
  store i64 %82, ptr %9, align 8, !dbg !1050
  br label %53, !dbg !1033, !llvm.loop !1051

83:                                               ; preds = %68
  %84 = load ptr, ptr %6, align 8, !dbg !1053
  %85 = icmp ne ptr %84, null, !dbg !1055
  br i1 %85, label %86, label %91, !dbg !1056

86:                                               ; preds = %83
  %87 = load ptr, ptr %5, align 8, !dbg !1057
  %88 = load i64, ptr %9, align 8, !dbg !1059
  %89 = getelementptr inbounds i8, ptr %87, i64 %88, !dbg !1060
  %90 = load ptr, ptr %6, align 8, !dbg !1061
  store ptr %89, ptr %90, align 8, !dbg !1062
  br label %91, !dbg !1063

91:                                               ; preds = %86, %83
  %92 = load i64, ptr %8, align 8, !dbg !1064
  store i64 %92, ptr %4, align 8, !dbg !1065
  br label %93, !dbg !1065

93:                                               ; preds = %91, %19
  %94 = load i64, ptr %4, align 8, !dbg !1066
  ret i64 %94, !dbg !1066
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__atoi(ptr noundef %0) #0 !dbg !1067 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1071, metadata !DIExpression()), !dbg !1072
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1073, metadata !DIExpression()), !dbg !1074
  store i32 0, ptr %3, align 4, !dbg !1074
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1075, metadata !DIExpression()), !dbg !1076
  store i32 1, ptr %4, align 4, !dbg !1076
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1077, metadata !DIExpression()), !dbg !1080
  store i64 0, ptr %5, align 8, !dbg !1080
  br label %6, !dbg !1081

6:                                                ; preds = %23, %1
  %7 = load ptr, ptr %2, align 8, !dbg !1082
  %8 = load i64, ptr %5, align 8, !dbg !1083
  %9 = getelementptr inbounds i8, ptr %7, i64 %8, !dbg !1082
  %10 = load i8, ptr %9, align 1, !dbg !1082
  %11 = sext i8 %10 to i32, !dbg !1082
  %12 = icmp ne i32 %11, 0, !dbg !1084
  br i1 %12, label %13, label %21, !dbg !1085

13:                                               ; preds = %6
  %14 = load ptr, ptr %2, align 8, !dbg !1086
  %15 = load i64, ptr %5, align 8, !dbg !1087
  %16 = getelementptr inbounds i8, ptr %14, i64 %15, !dbg !1086
  %17 = load i8, ptr %16, align 1, !dbg !1086
  %18 = sext i8 %17 to i32, !dbg !1086
  %19 = call i32 @__fizzer_model__isspace(i32 noundef %18), !dbg !1088
  %20 = icmp ne i32 %19, 0, !dbg !1085
  br label %21

21:                                               ; preds = %13, %6
  %22 = phi i1 [ false, %6 ], [ %20, %13 ], !dbg !1089
  br i1 %22, label %23, label %26, !dbg !1081

23:                                               ; preds = %21
  %24 = load i64, ptr %5, align 8, !dbg !1090
  %25 = add i64 %24, 1, !dbg !1090
  store i64 %25, ptr %5, align 8, !dbg !1090
  br label %6, !dbg !1081, !llvm.loop !1092

26:                                               ; preds = %21
  %27 = load ptr, ptr %2, align 8, !dbg !1094
  %28 = load i64, ptr %5, align 8, !dbg !1096
  %29 = getelementptr inbounds i8, ptr %27, i64 %28, !dbg !1094
  %30 = load i8, ptr %29, align 1, !dbg !1094
  %31 = sext i8 %30 to i32, !dbg !1094
  %32 = icmp eq i32 %31, 43, !dbg !1097
  br i1 %32, label %33, label %36, !dbg !1098

33:                                               ; preds = %26
  %34 = load i64, ptr %5, align 8, !dbg !1099
  %35 = add i64 %34, 1, !dbg !1099
  store i64 %35, ptr %5, align 8, !dbg !1099
  br label %47, !dbg !1101

36:                                               ; preds = %26
  %37 = load ptr, ptr %2, align 8, !dbg !1102
  %38 = load i64, ptr %5, align 8, !dbg !1104
  %39 = getelementptr inbounds i8, ptr %37, i64 %38, !dbg !1102
  %40 = load i8, ptr %39, align 1, !dbg !1102
  %41 = sext i8 %40 to i32, !dbg !1102
  %42 = icmp eq i32 %41, 45, !dbg !1105
  br i1 %42, label %43, label %46, !dbg !1106

43:                                               ; preds = %36
  store i32 -1, ptr %4, align 4, !dbg !1107
  %44 = load i64, ptr %5, align 8, !dbg !1109
  %45 = add i64 %44, 1, !dbg !1109
  store i64 %45, ptr %5, align 8, !dbg !1109
  br label %46, !dbg !1110

46:                                               ; preds = %43, %36
  br label %47

47:                                               ; preds = %46, %33
  br label %48, !dbg !1111

48:                                               ; preds = %65, %47
  %49 = load ptr, ptr %2, align 8, !dbg !1112
  %50 = load i64, ptr %5, align 8, !dbg !1113
  %51 = getelementptr inbounds i8, ptr %49, i64 %50, !dbg !1112
  %52 = load i8, ptr %51, align 1, !dbg !1112
  %53 = sext i8 %52 to i32, !dbg !1112
  %54 = icmp ne i32 %53, 0, !dbg !1114
  br i1 %54, label %55, label %63, !dbg !1115

55:                                               ; preds = %48
  %56 = load ptr, ptr %2, align 8, !dbg !1116
  %57 = load i64, ptr %5, align 8, !dbg !1117
  %58 = getelementptr inbounds i8, ptr %56, i64 %57, !dbg !1116
  %59 = load i8, ptr %58, align 1, !dbg !1116
  %60 = sext i8 %59 to i32, !dbg !1116
  %61 = call i32 @__fizzer_model__isdigit(i32 noundef %60), !dbg !1118
  %62 = icmp ne i32 %61, 0, !dbg !1115
  br label %63

63:                                               ; preds = %55, %48
  %64 = phi i1 [ false, %48 ], [ %62, %55 ], !dbg !1089
  br i1 %64, label %65, label %77, !dbg !1111

65:                                               ; preds = %63
  %66 = load i32, ptr %3, align 4, !dbg !1119
  %67 = mul nsw i32 %66, 10, !dbg !1121
  %68 = load ptr, ptr %2, align 8, !dbg !1122
  %69 = load i64, ptr %5, align 8, !dbg !1123
  %70 = getelementptr inbounds i8, ptr %68, i64 %69, !dbg !1122
  %71 = load i8, ptr %70, align 1, !dbg !1122
  %72 = sext i8 %71 to i32, !dbg !1122
  %73 = sub nsw i32 %72, 48, !dbg !1124
  %74 = add nsw i32 %67, %73, !dbg !1125
  store i32 %74, ptr %3, align 4, !dbg !1126
  %75 = load i64, ptr %5, align 8, !dbg !1127
  %76 = add i64 %75, 1, !dbg !1127
  store i64 %76, ptr %5, align 8, !dbg !1127
  br label %48, !dbg !1111, !llvm.loop !1128

77:                                               ; preds = %63
  %78 = load i32, ptr %4, align 4, !dbg !1130
  %79 = load i32, ptr %3, align 4, !dbg !1131
  %80 = mul nsw i32 %78, %79, !dbg !1132
  ret i32 %80, !dbg !1133
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strstr(ptr noundef %0, ptr noundef %1) #0 !dbg !1134 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1138, metadata !DIExpression()), !dbg !1139
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1140, metadata !DIExpression()), !dbg !1141
  %8 = load ptr, ptr %5, align 8, !dbg !1142
  %9 = load i8, ptr %8, align 1, !dbg !1144
  %10 = sext i8 %9 to i32, !dbg !1144
  %11 = icmp eq i32 %10, 0, !dbg !1145
  br i1 %11, label %12, label %14, !dbg !1146

12:                                               ; preds = %2
  %13 = load ptr, ptr %4, align 8, !dbg !1147
  store ptr %13, ptr %3, align 8, !dbg !1149
  br label %59, !dbg !1149

14:                                               ; preds = %2
  br label %15, !dbg !1150

15:                                               ; preds = %55, %14
  %16 = load ptr, ptr %4, align 8, !dbg !1151
  %17 = load i8, ptr %16, align 1, !dbg !1152
  %18 = sext i8 %17 to i32, !dbg !1152
  %19 = icmp ne i32 %18, 0, !dbg !1153
  br i1 %19, label %20, label %58, !dbg !1150

20:                                               ; preds = %15
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1154, metadata !DIExpression()), !dbg !1156
  %21 = load ptr, ptr %4, align 8, !dbg !1157
  store ptr %21, ptr %6, align 8, !dbg !1156
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1158, metadata !DIExpression()), !dbg !1159
  %22 = load ptr, ptr %5, align 8, !dbg !1160
  store ptr %22, ptr %7, align 8, !dbg !1159
  br label %23, !dbg !1161

23:                                               ; preds = %43, %20
  %24 = load ptr, ptr %6, align 8, !dbg !1162
  %25 = load i8, ptr %24, align 1, !dbg !1163
  %26 = sext i8 %25 to i32, !dbg !1163
  %27 = icmp ne i32 %26, 0, !dbg !1164
  br i1 %27, label %28, label %41, !dbg !1165

28:                                               ; preds = %23
  %29 = load ptr, ptr %7, align 8, !dbg !1166
  %30 = load i8, ptr %29, align 1, !dbg !1167
  %31 = sext i8 %30 to i32, !dbg !1167
  %32 = icmp ne i32 %31, 0, !dbg !1168
  br i1 %32, label %33, label %41, !dbg !1169

33:                                               ; preds = %28
  %34 = load ptr, ptr %6, align 8, !dbg !1170
  %35 = load i8, ptr %34, align 1, !dbg !1171
  %36 = sext i8 %35 to i32, !dbg !1171
  %37 = load ptr, ptr %7, align 8, !dbg !1172
  %38 = load i8, ptr %37, align 1, !dbg !1173
  %39 = sext i8 %38 to i32, !dbg !1173
  %40 = icmp eq i32 %36, %39, !dbg !1174
  br label %41

41:                                               ; preds = %33, %28, %23
  %42 = phi i1 [ false, %28 ], [ false, %23 ], [ %40, %33 ], !dbg !1175
  br i1 %42, label %43, label %48, !dbg !1161

43:                                               ; preds = %41
  %44 = load ptr, ptr %6, align 8, !dbg !1176
  %45 = getelementptr inbounds i8, ptr %44, i32 1, !dbg !1176
  store ptr %45, ptr %6, align 8, !dbg !1176
  %46 = load ptr, ptr %7, align 8, !dbg !1178
  %47 = getelementptr inbounds i8, ptr %46, i32 1, !dbg !1178
  store ptr %47, ptr %7, align 8, !dbg !1178
  br label %23, !dbg !1161, !llvm.loop !1179

48:                                               ; preds = %41
  %49 = load ptr, ptr %7, align 8, !dbg !1181
  %50 = load i8, ptr %49, align 1, !dbg !1183
  %51 = sext i8 %50 to i32, !dbg !1183
  %52 = icmp eq i32 %51, 0, !dbg !1184
  br i1 %52, label %53, label %55, !dbg !1185

53:                                               ; preds = %48
  %54 = load ptr, ptr %4, align 8, !dbg !1186
  store ptr %54, ptr %3, align 8, !dbg !1188
  br label %59, !dbg !1188

55:                                               ; preds = %48
  %56 = load ptr, ptr %4, align 8, !dbg !1189
  %57 = getelementptr inbounds i8, ptr %56, i32 1, !dbg !1189
  store ptr %57, ptr %4, align 8, !dbg !1189
  br label %15, !dbg !1150, !llvm.loop !1190

58:                                               ; preds = %15
  store ptr null, ptr %3, align 8, !dbg !1192
  br label %59, !dbg !1192

59:                                               ; preds = %58, %53, %12
  %60 = load ptr, ptr %3, align 8, !dbg !1193
  ret ptr %60, !dbg !1193
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strpbrk(ptr noundef %0, ptr noundef %1) #0 !dbg !1194 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1196, metadata !DIExpression()), !dbg !1197
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1198, metadata !DIExpression()), !dbg !1199
  br label %7, !dbg !1200

7:                                                ; preds = %32, %2
  %8 = load ptr, ptr %4, align 8, !dbg !1201
  %9 = load i8, ptr %8, align 1, !dbg !1202
  %10 = sext i8 %9 to i32, !dbg !1202
  %11 = icmp ne i32 %10, 0, !dbg !1203
  br i1 %11, label %12, label %35, !dbg !1200

12:                                               ; preds = %7
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1204, metadata !DIExpression()), !dbg !1206
  %13 = load ptr, ptr %5, align 8, !dbg !1207
  store ptr %13, ptr %6, align 8, !dbg !1206
  br label %14, !dbg !1208

14:                                               ; preds = %29, %12
  %15 = load ptr, ptr %6, align 8, !dbg !1209
  %16 = load i8, ptr %15, align 1, !dbg !1210
  %17 = sext i8 %16 to i32, !dbg !1210
  %18 = icmp ne i32 %17, 0, !dbg !1211
  br i1 %18, label %19, label %32, !dbg !1208

19:                                               ; preds = %14
  %20 = load ptr, ptr %6, align 8, !dbg !1212
  %21 = load i8, ptr %20, align 1, !dbg !1215
  %22 = sext i8 %21 to i32, !dbg !1215
  %23 = load ptr, ptr %4, align 8, !dbg !1216
  %24 = load i8, ptr %23, align 1, !dbg !1217
  %25 = sext i8 %24 to i32, !dbg !1217
  %26 = icmp eq i32 %22, %25, !dbg !1218
  br i1 %26, label %27, label %29, !dbg !1219

27:                                               ; preds = %19
  %28 = load ptr, ptr %4, align 8, !dbg !1220
  store ptr %28, ptr %3, align 8, !dbg !1222
  br label %36, !dbg !1222

29:                                               ; preds = %19
  %30 = load ptr, ptr %6, align 8, !dbg !1223
  %31 = getelementptr inbounds i8, ptr %30, i32 1, !dbg !1223
  store ptr %31, ptr %6, align 8, !dbg !1223
  br label %14, !dbg !1208, !llvm.loop !1224

32:                                               ; preds = %14
  %33 = load ptr, ptr %4, align 8, !dbg !1226
  %34 = getelementptr inbounds i8, ptr %33, i32 1, !dbg !1226
  store ptr %34, ptr %4, align 8, !dbg !1226
  br label %7, !dbg !1200, !llvm.loop !1227

35:                                               ; preds = %7
  store ptr null, ptr %3, align 8, !dbg !1229
  br label %36, !dbg !1229

36:                                               ; preds = %35, %27
  %37 = load ptr, ptr %3, align 8, !dbg !1230
  ret ptr %37, !dbg !1230
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strcpy(ptr noundef %0, ptr noundef %1) #0 !dbg !1231 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1233, metadata !DIExpression()), !dbg !1234
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1235, metadata !DIExpression()), !dbg !1236
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1237, metadata !DIExpression()), !dbg !1238
  %6 = load ptr, ptr %3, align 8, !dbg !1239
  store ptr %6, ptr %5, align 8, !dbg !1238
  br label %7, !dbg !1240

7:                                                ; preds = %12, %2
  %8 = load ptr, ptr %4, align 8, !dbg !1241
  %9 = load i8, ptr %8, align 1, !dbg !1242
  %10 = sext i8 %9 to i32, !dbg !1242
  %11 = icmp ne i32 %10, 0, !dbg !1243
  br i1 %11, label %12, label %20, !dbg !1240

12:                                               ; preds = %7
  %13 = load ptr, ptr %4, align 8, !dbg !1244
  %14 = load i8, ptr %13, align 1, !dbg !1246
  %15 = load ptr, ptr %5, align 8, !dbg !1247
  store i8 %14, ptr %15, align 1, !dbg !1248
  %16 = load ptr, ptr %5, align 8, !dbg !1249
  %17 = getelementptr inbounds i8, ptr %16, i32 1, !dbg !1249
  store ptr %17, ptr %5, align 8, !dbg !1249
  %18 = load ptr, ptr %4, align 8, !dbg !1250
  %19 = getelementptr inbounds i8, ptr %18, i32 1, !dbg !1250
  store ptr %19, ptr %4, align 8, !dbg !1250
  br label %7, !dbg !1240, !llvm.loop !1251

20:                                               ; preds = %7
  %21 = load ptr, ptr %5, align 8, !dbg !1253
  store i8 0, ptr %21, align 1, !dbg !1254
  %22 = load ptr, ptr %3, align 8, !dbg !1255
  ret ptr %22, !dbg !1256
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strncat(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 !dbg !1257 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1263, metadata !DIExpression()), !dbg !1264
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1265, metadata !DIExpression()), !dbg !1266
  store i64 %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1267, metadata !DIExpression()), !dbg !1268
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1269, metadata !DIExpression()), !dbg !1270
  %9 = load ptr, ptr %4, align 8, !dbg !1271
  store ptr %9, ptr %7, align 8, !dbg !1270
  br label %10, !dbg !1272

10:                                               ; preds = %15, %3
  %11 = load ptr, ptr %7, align 8, !dbg !1273
  %12 = load i8, ptr %11, align 1, !dbg !1274
  %13 = sext i8 %12 to i32, !dbg !1274
  %14 = icmp ne i32 %13, 0, !dbg !1275
  br i1 %14, label %15, label %18, !dbg !1272

15:                                               ; preds = %10
  %16 = load ptr, ptr %7, align 8, !dbg !1276
  %17 = getelementptr inbounds i8, ptr %16, i32 1, !dbg !1276
  store ptr %17, ptr %7, align 8, !dbg !1276
  br label %10, !dbg !1272, !llvm.loop !1278

18:                                               ; preds = %10
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1280, metadata !DIExpression()), !dbg !1281
  store i64 0, ptr %8, align 8, !dbg !1281
  br label %19, !dbg !1282

19:                                               ; preds = %30, %18
  %20 = load i64, ptr %8, align 8, !dbg !1283
  %21 = load i64, ptr %6, align 8, !dbg !1284
  %22 = icmp ult i64 %20, %21, !dbg !1285
  br i1 %22, label %23, label %28, !dbg !1286

23:                                               ; preds = %19
  %24 = load ptr, ptr %5, align 8, !dbg !1287
  %25 = load i8, ptr %24, align 1, !dbg !1288
  %26 = sext i8 %25 to i32, !dbg !1288
  %27 = icmp ne i32 %26, 0, !dbg !1289
  br label %28

28:                                               ; preds = %23, %19
  %29 = phi i1 [ false, %19 ], [ %27, %23 ], !dbg !1290
  br i1 %29, label %30, label %40, !dbg !1282

30:                                               ; preds = %28
  %31 = load ptr, ptr %5, align 8, !dbg !1291
  %32 = load i8, ptr %31, align 1, !dbg !1293
  %33 = load ptr, ptr %7, align 8, !dbg !1294
  store i8 %32, ptr %33, align 1, !dbg !1295
  %34 = load ptr, ptr %7, align 8, !dbg !1296
  %35 = getelementptr inbounds i8, ptr %34, i32 1, !dbg !1296
  store ptr %35, ptr %7, align 8, !dbg !1296
  %36 = load ptr, ptr %5, align 8, !dbg !1297
  %37 = getelementptr inbounds i8, ptr %36, i32 1, !dbg !1297
  store ptr %37, ptr %5, align 8, !dbg !1297
  %38 = load i64, ptr %8, align 8, !dbg !1298
  %39 = add i64 %38, 1, !dbg !1298
  store i64 %39, ptr %8, align 8, !dbg !1298
  br label %19, !dbg !1282, !llvm.loop !1299

40:                                               ; preds = %28
  %41 = load ptr, ptr %7, align 8, !dbg !1301
  store i8 0, ptr %41, align 1, !dbg !1302
  %42 = load ptr, ptr %4, align 8, !dbg !1303
  ret ptr %42, !dbg !1304
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__strcspn(ptr noundef %0, ptr noundef %1) #0 !dbg !1305 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1311, metadata !DIExpression()), !dbg !1312
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1313, metadata !DIExpression()), !dbg !1314
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1315, metadata !DIExpression()), !dbg !1316
  store i64 0, ptr %5, align 8, !dbg !1316
  br label %7, !dbg !1317

7:                                                ; preds = %38, %2
  %8 = load ptr, ptr %3, align 8, !dbg !1318
  %9 = load i8, ptr %8, align 1, !dbg !1319
  %10 = sext i8 %9 to i32, !dbg !1319
  %11 = icmp ne i32 %10, 0, !dbg !1320
  br i1 %11, label %12, label %43, !dbg !1317

12:                                               ; preds = %7
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1321, metadata !DIExpression()), !dbg !1323
  %13 = load ptr, ptr %4, align 8, !dbg !1324
  store ptr %13, ptr %6, align 8, !dbg !1323
  br label %14, !dbg !1325

14:                                               ; preds = %29, %12
  %15 = load ptr, ptr %6, align 8, !dbg !1326
  %16 = load i8, ptr %15, align 1, !dbg !1327
  %17 = sext i8 %16 to i32, !dbg !1327
  %18 = icmp ne i32 %17, 0, !dbg !1328
  br i1 %18, label %19, label %27, !dbg !1329

19:                                               ; preds = %14
  %20 = load ptr, ptr %6, align 8, !dbg !1330
  %21 = load i8, ptr %20, align 1, !dbg !1331
  %22 = sext i8 %21 to i32, !dbg !1331
  %23 = load ptr, ptr %3, align 8, !dbg !1332
  %24 = load i8, ptr %23, align 1, !dbg !1333
  %25 = sext i8 %24 to i32, !dbg !1333
  %26 = icmp ne i32 %22, %25, !dbg !1334
  br label %27

27:                                               ; preds = %19, %14
  %28 = phi i1 [ false, %14 ], [ %26, %19 ], !dbg !1335
  br i1 %28, label %29, label %32, !dbg !1325

29:                                               ; preds = %27
  %30 = load ptr, ptr %6, align 8, !dbg !1336
  %31 = getelementptr inbounds i8, ptr %30, i32 1, !dbg !1336
  store ptr %31, ptr %6, align 8, !dbg !1336
  br label %14, !dbg !1325, !llvm.loop !1338

32:                                               ; preds = %27
  %33 = load ptr, ptr %6, align 8, !dbg !1340
  %34 = load i8, ptr %33, align 1, !dbg !1342
  %35 = sext i8 %34 to i32, !dbg !1342
  %36 = icmp ne i32 %35, 0, !dbg !1343
  br i1 %36, label %37, label %38, !dbg !1344

37:                                               ; preds = %32
  br label %43, !dbg !1345

38:                                               ; preds = %32
  %39 = load i64, ptr %5, align 8, !dbg !1347
  %40 = add i64 %39, 1, !dbg !1347
  store i64 %40, ptr %5, align 8, !dbg !1347
  %41 = load ptr, ptr %3, align 8, !dbg !1348
  %42 = getelementptr inbounds i8, ptr %41, i32 1, !dbg !1348
  store ptr %42, ptr %3, align 8, !dbg !1348
  br label %7, !dbg !1317, !llvm.loop !1349

43:                                               ; preds = %37, %7
  %44 = load i64, ptr %5, align 8, !dbg !1351
  ret i64 %44, !dbg !1352
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strcoll(ptr noundef %0, ptr noundef %1) #0 !dbg !1353 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1357, metadata !DIExpression()), !dbg !1358
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1359, metadata !DIExpression()), !dbg !1360
  br label %5, !dbg !1361

5:                                                ; preds = %20, %2
  %6 = load ptr, ptr %3, align 8, !dbg !1362
  %7 = load i8, ptr %6, align 1, !dbg !1363
  %8 = sext i8 %7 to i32, !dbg !1363
  %9 = icmp ne i32 %8, 0, !dbg !1364
  br i1 %9, label %10, label %18, !dbg !1365

10:                                               ; preds = %5
  %11 = load ptr, ptr %3, align 8, !dbg !1366
  %12 = load i8, ptr %11, align 1, !dbg !1367
  %13 = sext i8 %12 to i32, !dbg !1367
  %14 = load ptr, ptr %4, align 8, !dbg !1368
  %15 = load i8, ptr %14, align 1, !dbg !1369
  %16 = sext i8 %15 to i32, !dbg !1369
  %17 = icmp eq i32 %13, %16, !dbg !1370
  br label %18

18:                                               ; preds = %10, %5
  %19 = phi i1 [ false, %5 ], [ %17, %10 ], !dbg !1371
  br i1 %19, label %20, label %25, !dbg !1361

20:                                               ; preds = %18
  %21 = load ptr, ptr %3, align 8, !dbg !1372
  %22 = getelementptr inbounds i8, ptr %21, i32 1, !dbg !1372
  store ptr %22, ptr %3, align 8, !dbg !1372
  %23 = load ptr, ptr %4, align 8, !dbg !1374
  %24 = getelementptr inbounds i8, ptr %23, i32 1, !dbg !1374
  store ptr %24, ptr %4, align 8, !dbg !1374
  br label %5, !dbg !1361, !llvm.loop !1375

25:                                               ; preds = %18
  %26 = load ptr, ptr %3, align 8, !dbg !1377
  %27 = load i8, ptr %26, align 1, !dbg !1378
  %28 = zext i8 %27 to i32, !dbg !1379
  %29 = load ptr, ptr %4, align 8, !dbg !1380
  %30 = load i8, ptr %29, align 1, !dbg !1381
  %31 = zext i8 %30 to i32, !dbg !1382
  %32 = sub nsw i32 %28, %31, !dbg !1383
  ret i32 %32, !dbg !1384
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strcmp(ptr noundef %0, ptr noundef %1) #0 !dbg !1385 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1387, metadata !DIExpression()), !dbg !1388
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1389, metadata !DIExpression()), !dbg !1390
  br label %5, !dbg !1391

5:                                                ; preds = %20, %2
  %6 = load ptr, ptr %3, align 8, !dbg !1392
  %7 = load i8, ptr %6, align 1, !dbg !1393
  %8 = sext i8 %7 to i32, !dbg !1393
  %9 = icmp ne i32 %8, 0, !dbg !1394
  br i1 %9, label %10, label %18, !dbg !1395

10:                                               ; preds = %5
  %11 = load ptr, ptr %3, align 8, !dbg !1396
  %12 = load i8, ptr %11, align 1, !dbg !1397
  %13 = sext i8 %12 to i32, !dbg !1397
  %14 = load ptr, ptr %4, align 8, !dbg !1398
  %15 = load i8, ptr %14, align 1, !dbg !1399
  %16 = sext i8 %15 to i32, !dbg !1399
  %17 = icmp eq i32 %13, %16, !dbg !1400
  br label %18

18:                                               ; preds = %10, %5
  %19 = phi i1 [ false, %5 ], [ %17, %10 ], !dbg !1401
  br i1 %19, label %20, label %25, !dbg !1391

20:                                               ; preds = %18
  %21 = load ptr, ptr %3, align 8, !dbg !1402
  %22 = getelementptr inbounds i8, ptr %21, i32 1, !dbg !1402
  store ptr %22, ptr %3, align 8, !dbg !1402
  %23 = load ptr, ptr %4, align 8, !dbg !1404
  %24 = getelementptr inbounds i8, ptr %23, i32 1, !dbg !1404
  store ptr %24, ptr %4, align 8, !dbg !1404
  br label %5, !dbg !1391, !llvm.loop !1405

25:                                               ; preds = %18
  %26 = load ptr, ptr %3, align 8, !dbg !1407
  %27 = load i8, ptr %26, align 1, !dbg !1408
  %28 = zext i8 %27 to i32, !dbg !1409
  %29 = load ptr, ptr %4, align 8, !dbg !1410
  %30 = load i8, ptr %29, align 1, !dbg !1411
  %31 = zext i8 %30 to i32, !dbg !1412
  %32 = sub nsw i32 %28, %31, !dbg !1413
  ret i32 %32, !dbg !1414
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strncmp(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 !dbg !1415 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i8, align 1
  %10 = alloca i8, align 1
  store ptr %0, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1421, metadata !DIExpression()), !dbg !1422
  store ptr %1, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1423, metadata !DIExpression()), !dbg !1424
  store i64 %2, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1425, metadata !DIExpression()), !dbg !1426
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1427, metadata !DIExpression()), !dbg !1428
  store i64 0, ptr %8, align 8, !dbg !1428
  br label %11, !dbg !1429

11:                                               ; preds = %43, %3
  %12 = load i64, ptr %8, align 8, !dbg !1430
  %13 = load i64, ptr %7, align 8, !dbg !1431
  %14 = icmp ult i64 %12, %13, !dbg !1432
  br i1 %14, label %15, label %46, !dbg !1429

15:                                               ; preds = %11
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1433, metadata !DIExpression()), !dbg !1435
  %16 = load ptr, ptr %5, align 8, !dbg !1436
  %17 = load i64, ptr %8, align 8, !dbg !1437
  %18 = getelementptr inbounds i8, ptr %16, i64 %17, !dbg !1436
  %19 = load i8, ptr %18, align 1, !dbg !1436
  store i8 %19, ptr %9, align 1, !dbg !1435
  call void @llvm.dbg.declare(metadata ptr %10, metadata !1438, metadata !DIExpression()), !dbg !1439
  %20 = load ptr, ptr %6, align 8, !dbg !1440
  %21 = load i64, ptr %8, align 8, !dbg !1441
  %22 = getelementptr inbounds i8, ptr %20, i64 %21, !dbg !1440
  %23 = load i8, ptr %22, align 1, !dbg !1440
  store i8 %23, ptr %10, align 1, !dbg !1439
  %24 = load i8, ptr %9, align 1, !dbg !1442
  %25 = zext i8 %24 to i32, !dbg !1442
  %26 = load i8, ptr %10, align 1, !dbg !1444
  %27 = zext i8 %26 to i32, !dbg !1444
  %28 = icmp ne i32 %25, %27, !dbg !1445
  br i1 %28, label %37, label %29, !dbg !1446

29:                                               ; preds = %15
  %30 = load i8, ptr %9, align 1, !dbg !1447
  %31 = zext i8 %30 to i32, !dbg !1447
  %32 = icmp eq i32 %31, 0, !dbg !1448
  br i1 %32, label %37, label %33, !dbg !1449

33:                                               ; preds = %29
  %34 = load i8, ptr %10, align 1, !dbg !1450
  %35 = zext i8 %34 to i32, !dbg !1450
  %36 = icmp eq i32 %35, 0, !dbg !1451
  br i1 %36, label %37, label %43, !dbg !1452

37:                                               ; preds = %33, %29, %15
  %38 = load i8, ptr %9, align 1, !dbg !1453
  %39 = zext i8 %38 to i32, !dbg !1453
  %40 = load i8, ptr %10, align 1, !dbg !1455
  %41 = zext i8 %40 to i32, !dbg !1455
  %42 = sub nsw i32 %39, %41, !dbg !1456
  store i32 %42, ptr %4, align 4, !dbg !1457
  br label %47, !dbg !1457

43:                                               ; preds = %33
  %44 = load i64, ptr %8, align 8, !dbg !1458
  %45 = add i64 %44, 1, !dbg !1458
  store i64 %45, ptr %8, align 8, !dbg !1458
  br label %11, !dbg !1429, !llvm.loop !1459

46:                                               ; preds = %11
  store i32 0, ptr %4, align 4, !dbg !1461
  br label %47, !dbg !1461

47:                                               ; preds = %46, %37
  %48 = load i32, ptr %4, align 4, !dbg !1462
  ret i32 %48, !dbg !1462
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strrchr(ptr noundef %0, i32 noundef %1) #0 !dbg !1463 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1467, metadata !DIExpression()), !dbg !1468
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1469, metadata !DIExpression()), !dbg !1470
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1471, metadata !DIExpression()), !dbg !1472
  store ptr null, ptr %6, align 8, !dbg !1472
  br label %7, !dbg !1473

7:                                                ; preds = %22, %2
  %8 = load ptr, ptr %4, align 8, !dbg !1474
  %9 = load i8, ptr %8, align 1, !dbg !1475
  %10 = sext i8 %9 to i32, !dbg !1475
  %11 = icmp ne i32 %10, 0, !dbg !1476
  br i1 %11, label %12, label %25, !dbg !1473

12:                                               ; preds = %7
  %13 = load ptr, ptr %4, align 8, !dbg !1477
  %14 = load i8, ptr %13, align 1, !dbg !1480
  %15 = sext i8 %14 to i32, !dbg !1480
  %16 = load i32, ptr %5, align 4, !dbg !1481
  %17 = trunc i32 %16 to i8, !dbg !1482
  %18 = sext i8 %17 to i32, !dbg !1482
  %19 = icmp eq i32 %15, %18, !dbg !1483
  br i1 %19, label %20, label %22, !dbg !1484

20:                                               ; preds = %12
  %21 = load ptr, ptr %4, align 8, !dbg !1485
  store ptr %21, ptr %6, align 8, !dbg !1487
  br label %22, !dbg !1488

22:                                               ; preds = %20, %12
  %23 = load ptr, ptr %4, align 8, !dbg !1489
  %24 = getelementptr inbounds i8, ptr %23, i32 1, !dbg !1489
  store ptr %24, ptr %4, align 8, !dbg !1489
  br label %7, !dbg !1473, !llvm.loop !1490

25:                                               ; preds = %7
  %26 = load i32, ptr %5, align 4, !dbg !1492
  %27 = trunc i32 %26 to i8, !dbg !1494
  %28 = sext i8 %27 to i32, !dbg !1494
  %29 = icmp eq i32 %28, 0, !dbg !1495
  br i1 %29, label %30, label %32, !dbg !1496

30:                                               ; preds = %25
  %31 = load ptr, ptr %4, align 8, !dbg !1497
  store ptr %31, ptr %3, align 8, !dbg !1499
  br label %34, !dbg !1499

32:                                               ; preds = %25
  %33 = load ptr, ptr %6, align 8, !dbg !1500
  store ptr %33, ptr %3, align 8, !dbg !1501
  br label %34, !dbg !1501

34:                                               ; preds = %32, %30
  %35 = load ptr, ptr %3, align 8, !dbg !1502
  ret ptr %35, !dbg !1502
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strcat(ptr noundef %0, ptr noundef %1) #0 !dbg !1503 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1505, metadata !DIExpression()), !dbg !1506
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1509, metadata !DIExpression()), !dbg !1510
  %6 = load ptr, ptr %3, align 8, !dbg !1511
  store ptr %6, ptr %5, align 8, !dbg !1510
  br label %7, !dbg !1512

7:                                                ; preds = %12, %2
  %8 = load ptr, ptr %5, align 8, !dbg !1513
  %9 = load i8, ptr %8, align 1, !dbg !1514
  %10 = sext i8 %9 to i32, !dbg !1514
  %11 = icmp ne i32 %10, 0, !dbg !1515
  br i1 %11, label %12, label %15, !dbg !1512

12:                                               ; preds = %7
  %13 = load ptr, ptr %5, align 8, !dbg !1516
  %14 = getelementptr inbounds i8, ptr %13, i32 1, !dbg !1516
  store ptr %14, ptr %5, align 8, !dbg !1516
  br label %7, !dbg !1512, !llvm.loop !1518

15:                                               ; preds = %7
  br label %16, !dbg !1520

16:                                               ; preds = %21, %15
  %17 = load ptr, ptr %4, align 8, !dbg !1521
  %18 = load i8, ptr %17, align 1, !dbg !1522
  %19 = sext i8 %18 to i32, !dbg !1522
  %20 = icmp ne i32 %19, 0, !dbg !1523
  br i1 %20, label %21, label %29, !dbg !1520

21:                                               ; preds = %16
  %22 = load ptr, ptr %4, align 8, !dbg !1524
  %23 = load i8, ptr %22, align 1, !dbg !1526
  %24 = load ptr, ptr %5, align 8, !dbg !1527
  store i8 %23, ptr %24, align 1, !dbg !1528
  %25 = load ptr, ptr %5, align 8, !dbg !1529
  %26 = getelementptr inbounds i8, ptr %25, i32 1, !dbg !1529
  store ptr %26, ptr %5, align 8, !dbg !1529
  %27 = load ptr, ptr %4, align 8, !dbg !1530
  %28 = getelementptr inbounds i8, ptr %27, i32 1, !dbg !1530
  store ptr %28, ptr %4, align 8, !dbg !1530
  br label %16, !dbg !1520, !llvm.loop !1531

29:                                               ; preds = %16
  %30 = load ptr, ptr %5, align 8, !dbg !1533
  store i8 0, ptr %30, align 1, !dbg !1534
  %31 = load ptr, ptr %3, align 8, !dbg !1535
  ret ptr %31, !dbg !1536
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__strspn(ptr noundef %0, ptr noundef %1) #0 !dbg !1537 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1543, metadata !DIExpression()), !dbg !1544
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1545, metadata !DIExpression()), !dbg !1546
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1547, metadata !DIExpression()), !dbg !1548
  store i64 0, ptr %5, align 8, !dbg !1548
  br label %7, !dbg !1549

7:                                                ; preds = %38, %2
  %8 = load ptr, ptr %3, align 8, !dbg !1550
  %9 = load i8, ptr %8, align 1, !dbg !1551
  %10 = sext i8 %9 to i32, !dbg !1551
  %11 = icmp ne i32 %10, 0, !dbg !1552
  br i1 %11, label %12, label %43, !dbg !1549

12:                                               ; preds = %7
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1553, metadata !DIExpression()), !dbg !1555
  %13 = load ptr, ptr %4, align 8, !dbg !1556
  store ptr %13, ptr %6, align 8, !dbg !1555
  br label %14, !dbg !1557

14:                                               ; preds = %29, %12
  %15 = load ptr, ptr %6, align 8, !dbg !1558
  %16 = load i8, ptr %15, align 1, !dbg !1559
  %17 = sext i8 %16 to i32, !dbg !1559
  %18 = icmp ne i32 %17, 0, !dbg !1560
  br i1 %18, label %19, label %27, !dbg !1561

19:                                               ; preds = %14
  %20 = load ptr, ptr %6, align 8, !dbg !1562
  %21 = load i8, ptr %20, align 1, !dbg !1563
  %22 = sext i8 %21 to i32, !dbg !1563
  %23 = load ptr, ptr %3, align 8, !dbg !1564
  %24 = load i8, ptr %23, align 1, !dbg !1565
  %25 = sext i8 %24 to i32, !dbg !1565
  %26 = icmp ne i32 %22, %25, !dbg !1566
  br label %27

27:                                               ; preds = %19, %14
  %28 = phi i1 [ false, %14 ], [ %26, %19 ], !dbg !1567
  br i1 %28, label %29, label %32, !dbg !1557

29:                                               ; preds = %27
  %30 = load ptr, ptr %6, align 8, !dbg !1568
  %31 = getelementptr inbounds i8, ptr %30, i32 1, !dbg !1568
  store ptr %31, ptr %6, align 8, !dbg !1568
  br label %14, !dbg !1557, !llvm.loop !1570

32:                                               ; preds = %27
  %33 = load ptr, ptr %6, align 8, !dbg !1572
  %34 = load i8, ptr %33, align 1, !dbg !1574
  %35 = sext i8 %34 to i32, !dbg !1574
  %36 = icmp eq i32 %35, 0, !dbg !1575
  br i1 %36, label %37, label %38, !dbg !1576

37:                                               ; preds = %32
  br label %43, !dbg !1577

38:                                               ; preds = %32
  %39 = load i64, ptr %5, align 8, !dbg !1579
  %40 = add i64 %39, 1, !dbg !1579
  store i64 %40, ptr %5, align 8, !dbg !1579
  %41 = load ptr, ptr %3, align 8, !dbg !1580
  %42 = getelementptr inbounds i8, ptr %41, i32 1, !dbg !1580
  store ptr %42, ptr %3, align 8, !dbg !1580
  br label %7, !dbg !1549, !llvm.loop !1581

43:                                               ; preds = %37, %7
  %44 = load i64, ptr %5, align 8, !dbg !1583
  ret i64 %44, !dbg !1584
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strncpy(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 !dbg !1585 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1591, metadata !DIExpression()), !dbg !1592
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1593, metadata !DIExpression()), !dbg !1594
  store i64 %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1595, metadata !DIExpression()), !dbg !1596
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1597, metadata !DIExpression()), !dbg !1598
  store i64 0, ptr %7, align 8, !dbg !1598
  br label %8, !dbg !1599

8:                                                ; preds = %21, %3
  %9 = load i64, ptr %7, align 8, !dbg !1600
  %10 = load i64, ptr %6, align 8, !dbg !1601
  %11 = icmp ult i64 %9, %10, !dbg !1602
  br i1 %11, label %12, label %19, !dbg !1603

12:                                               ; preds = %8
  %13 = load ptr, ptr %5, align 8, !dbg !1604
  %14 = load i64, ptr %7, align 8, !dbg !1605
  %15 = getelementptr inbounds i8, ptr %13, i64 %14, !dbg !1604
  %16 = load i8, ptr %15, align 1, !dbg !1604
  %17 = sext i8 %16 to i32, !dbg !1604
  %18 = icmp ne i32 %17, 0, !dbg !1606
  br label %19

19:                                               ; preds = %12, %8
  %20 = phi i1 [ false, %8 ], [ %18, %12 ], !dbg !1607
  br i1 %20, label %21, label %31, !dbg !1599

21:                                               ; preds = %19
  %22 = load ptr, ptr %5, align 8, !dbg !1608
  %23 = load i64, ptr %7, align 8, !dbg !1610
  %24 = getelementptr inbounds i8, ptr %22, i64 %23, !dbg !1608
  %25 = load i8, ptr %24, align 1, !dbg !1608
  %26 = load ptr, ptr %4, align 8, !dbg !1611
  %27 = load i64, ptr %7, align 8, !dbg !1612
  %28 = getelementptr inbounds i8, ptr %26, i64 %27, !dbg !1611
  store i8 %25, ptr %28, align 1, !dbg !1613
  %29 = load i64, ptr %7, align 8, !dbg !1614
  %30 = add i64 %29, 1, !dbg !1614
  store i64 %30, ptr %7, align 8, !dbg !1614
  br label %8, !dbg !1599, !llvm.loop !1615

31:                                               ; preds = %19
  br label %32, !dbg !1617

32:                                               ; preds = %36, %31
  %33 = load i64, ptr %7, align 8, !dbg !1618
  %34 = load i64, ptr %6, align 8, !dbg !1619
  %35 = icmp ult i64 %33, %34, !dbg !1620
  br i1 %35, label %36, label %42, !dbg !1617

36:                                               ; preds = %32
  %37 = load ptr, ptr %4, align 8, !dbg !1621
  %38 = load i64, ptr %7, align 8, !dbg !1623
  %39 = getelementptr inbounds i8, ptr %37, i64 %38, !dbg !1621
  store i8 0, ptr %39, align 1, !dbg !1624
  %40 = load i64, ptr %7, align 8, !dbg !1625
  %41 = add i64 %40, 1, !dbg !1625
  store i64 %41, ptr %7, align 8, !dbg !1625
  br label %32, !dbg !1617, !llvm.loop !1626

42:                                               ; preds = %32
  %43 = load ptr, ptr %4, align 8, !dbg !1628
  ret ptr %43, !dbg !1629
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strchr(ptr noundef %0, i32 noundef %1) #0 !dbg !1630 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1632, metadata !DIExpression()), !dbg !1633
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1634, metadata !DIExpression()), !dbg !1635
  br label %6, !dbg !1636

6:                                                ; preds = %21, %2
  %7 = load ptr, ptr %4, align 8, !dbg !1637
  %8 = load i8, ptr %7, align 1, !dbg !1638
  %9 = sext i8 %8 to i32, !dbg !1638
  %10 = icmp ne i32 %9, 0, !dbg !1639
  br i1 %10, label %11, label %24, !dbg !1636

11:                                               ; preds = %6
  %12 = load ptr, ptr %4, align 8, !dbg !1640
  %13 = load i8, ptr %12, align 1, !dbg !1643
  %14 = sext i8 %13 to i32, !dbg !1643
  %15 = load i32, ptr %5, align 4, !dbg !1644
  %16 = trunc i32 %15 to i8, !dbg !1645
  %17 = sext i8 %16 to i32, !dbg !1645
  %18 = icmp eq i32 %14, %17, !dbg !1646
  br i1 %18, label %19, label %21, !dbg !1647

19:                                               ; preds = %11
  %20 = load ptr, ptr %4, align 8, !dbg !1648
  store ptr %20, ptr %3, align 8, !dbg !1650
  br label %32, !dbg !1650

21:                                               ; preds = %11
  %22 = load ptr, ptr %4, align 8, !dbg !1651
  %23 = getelementptr inbounds i8, ptr %22, i32 1, !dbg !1651
  store ptr %23, ptr %4, align 8, !dbg !1651
  br label %6, !dbg !1636, !llvm.loop !1652

24:                                               ; preds = %6
  %25 = load i32, ptr %5, align 4, !dbg !1654
  %26 = trunc i32 %25 to i8, !dbg !1656
  %27 = sext i8 %26 to i32, !dbg !1656
  %28 = icmp eq i32 %27, 0, !dbg !1657
  br i1 %28, label %29, label %31, !dbg !1658

29:                                               ; preds = %24
  %30 = load ptr, ptr %4, align 8, !dbg !1659
  store ptr %30, ptr %3, align 8, !dbg !1661
  br label %32, !dbg !1661

31:                                               ; preds = %24
  store ptr null, ptr %3, align 8, !dbg !1662
  br label %32, !dbg !1662

32:                                               ; preds = %31, %29, %19
  %33 = load ptr, ptr %3, align 8, !dbg !1663
  ret ptr %33, !dbg !1663
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strerror(i32 noundef %0) #0 !dbg !29 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1664, metadata !DIExpression()), !dbg !1665
  %4 = load i32, ptr %3, align 4, !dbg !1666
  switch i32 %4, label %11 [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %7
    i32 3, label %8
    i32 4, label %9
    i32 5, label %10
  ], !dbg !1667

5:                                                ; preds = %1
  store ptr @.str, ptr %2, align 8, !dbg !1668
  br label %12, !dbg !1668

6:                                                ; preds = %1
  store ptr @.str.1, ptr %2, align 8, !dbg !1670
  br label %12, !dbg !1670

7:                                                ; preds = %1
  store ptr @.str.2, ptr %2, align 8, !dbg !1671
  br label %12, !dbg !1671

8:                                                ; preds = %1
  store ptr @.str.3, ptr %2, align 8, !dbg !1672
  br label %12, !dbg !1672

9:                                                ; preds = %1
  store ptr @.str.4, ptr %2, align 8, !dbg !1673
  br label %12, !dbg !1673

10:                                               ; preds = %1
  store ptr @.str.5, ptr %2, align 8, !dbg !1674
  br label %12, !dbg !1674

11:                                               ; preds = %1
  store ptr @__fizzer_model__strerror.unknown, ptr %2, align 8, !dbg !1675
  br label %12, !dbg !1675

12:                                               ; preds = %11, %10, %9, %8, %7, %6, %5
  %13 = load ptr, ptr %2, align 8, !dbg !1676
  ret ptr %13, !dbg !1676
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__memchr(ptr noundef %0, i32 noundef %1, i64 noundef %2) #0 !dbg !1677 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1685, metadata !DIExpression()), !dbg !1686
  store i32 %1, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1687, metadata !DIExpression()), !dbg !1688
  store i64 %2, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1689, metadata !DIExpression()), !dbg !1690
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1691, metadata !DIExpression()), !dbg !1692
  %10 = load ptr, ptr %5, align 8, !dbg !1693
  store ptr %10, ptr %8, align 8, !dbg !1692
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1694, metadata !DIExpression()), !dbg !1695
  store i64 0, ptr %9, align 8, !dbg !1695
  br label %11, !dbg !1696

11:                                               ; preds = %29, %3
  %12 = load i64, ptr %9, align 8, !dbg !1697
  %13 = load i64, ptr %7, align 8, !dbg !1698
  %14 = icmp ult i64 %12, %13, !dbg !1699
  br i1 %14, label %15, label %32, !dbg !1696

15:                                               ; preds = %11
  %16 = load ptr, ptr %8, align 8, !dbg !1700
  %17 = load i64, ptr %9, align 8, !dbg !1703
  %18 = getelementptr inbounds i8, ptr %16, i64 %17, !dbg !1700
  %19 = load i8, ptr %18, align 1, !dbg !1700
  %20 = zext i8 %19 to i32, !dbg !1700
  %21 = load i32, ptr %6, align 4, !dbg !1704
  %22 = trunc i32 %21 to i8, !dbg !1705
  %23 = zext i8 %22 to i32, !dbg !1705
  %24 = icmp eq i32 %20, %23, !dbg !1706
  br i1 %24, label %25, label %29, !dbg !1707

25:                                               ; preds = %15
  %26 = load ptr, ptr %8, align 8, !dbg !1708
  %27 = load i64, ptr %9, align 8, !dbg !1710
  %28 = getelementptr inbounds i8, ptr %26, i64 %27, !dbg !1711
  store ptr %28, ptr %4, align 8, !dbg !1712
  br label %33, !dbg !1712

29:                                               ; preds = %15
  %30 = load i64, ptr %9, align 8, !dbg !1713
  %31 = add i64 %30, 1, !dbg !1713
  store i64 %31, ptr %9, align 8, !dbg !1713
  br label %11, !dbg !1696, !llvm.loop !1714

32:                                               ; preds = %11
  store ptr null, ptr %4, align 8, !dbg !1716
  br label %33, !dbg !1716

33:                                               ; preds = %32, %25
  %34 = load ptr, ptr %4, align 8, !dbg !1717
  ret ptr %34, !dbg !1717
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__strlen(ptr noundef %0) #0 !dbg !1718 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1724, metadata !DIExpression()), !dbg !1725
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1726, metadata !DIExpression()), !dbg !1727
  store i64 0, ptr %3, align 8, !dbg !1727
  br label %4, !dbg !1728

4:                                                ; preds = %11, %1
  %5 = load ptr, ptr %2, align 8, !dbg !1729
  %6 = load i64, ptr %3, align 8, !dbg !1730
  %7 = getelementptr inbounds i8, ptr %5, i64 %6, !dbg !1729
  %8 = load i8, ptr %7, align 1, !dbg !1729
  %9 = sext i8 %8 to i32, !dbg !1729
  %10 = icmp ne i32 %9, 0, !dbg !1731
  br i1 %10, label %11, label %14, !dbg !1728

11:                                               ; preds = %4
  %12 = load i64, ptr %3, align 8, !dbg !1732
  %13 = add i64 %12, 1, !dbg !1732
  store i64 %13, ptr %3, align 8, !dbg !1732
  br label %4, !dbg !1728, !llvm.loop !1734

14:                                               ; preds = %4
  %15 = load i64, ptr %3, align 8, !dbg !1736
  ret i64 %15, !dbg !1737
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strtok(ptr noundef %0, ptr noundef %1) #0 !dbg !69 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1738, metadata !DIExpression()), !dbg !1739
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1740, metadata !DIExpression()), !dbg !1741
  %9 = load ptr, ptr %4, align 8, !dbg !1742
  %10 = icmp eq ptr %9, null, !dbg !1744
  br i1 %10, label %11, label %13, !dbg !1745

11:                                               ; preds = %2
  %12 = load ptr, ptr @__fizzer_model__strtok.next, align 8, !dbg !1746
  store ptr %12, ptr %4, align 8, !dbg !1748
  br label %13, !dbg !1749

13:                                               ; preds = %11, %2
  %14 = load ptr, ptr %4, align 8, !dbg !1750
  %15 = icmp eq ptr %14, null, !dbg !1752
  br i1 %15, label %16, label %17, !dbg !1753

16:                                               ; preds = %13
  store ptr null, ptr %3, align 8, !dbg !1754
  br label %107, !dbg !1754

17:                                               ; preds = %13
  br label %18, !dbg !1756

18:                                               ; preds = %49, %17
  %19 = load ptr, ptr %4, align 8, !dbg !1757
  %20 = load i8, ptr %19, align 1, !dbg !1758
  %21 = sext i8 %20 to i32, !dbg !1758
  %22 = icmp ne i32 %21, 0, !dbg !1759
  br i1 %22, label %23, label %52, !dbg !1756

23:                                               ; preds = %18
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1760, metadata !DIExpression()), !dbg !1762
  %24 = load ptr, ptr %5, align 8, !dbg !1763
  store ptr %24, ptr %6, align 8, !dbg !1762
  br label %25, !dbg !1764

25:                                               ; preds = %40, %23
  %26 = load ptr, ptr %6, align 8, !dbg !1765
  %27 = load i8, ptr %26, align 1, !dbg !1766
  %28 = sext i8 %27 to i32, !dbg !1766
  %29 = icmp ne i32 %28, 0, !dbg !1767
  br i1 %29, label %30, label %38, !dbg !1768

30:                                               ; preds = %25
  %31 = load ptr, ptr %6, align 8, !dbg !1769
  %32 = load i8, ptr %31, align 1, !dbg !1770
  %33 = sext i8 %32 to i32, !dbg !1770
  %34 = load ptr, ptr %4, align 8, !dbg !1771
  %35 = load i8, ptr %34, align 1, !dbg !1772
  %36 = sext i8 %35 to i32, !dbg !1772
  %37 = icmp ne i32 %33, %36, !dbg !1773
  br label %38

38:                                               ; preds = %30, %25
  %39 = phi i1 [ false, %25 ], [ %37, %30 ], !dbg !1774
  br i1 %39, label %40, label %43, !dbg !1764

40:                                               ; preds = %38
  %41 = load ptr, ptr %6, align 8, !dbg !1775
  %42 = getelementptr inbounds i8, ptr %41, i32 1, !dbg !1775
  store ptr %42, ptr %6, align 8, !dbg !1775
  br label %25, !dbg !1764, !llvm.loop !1777

43:                                               ; preds = %38
  %44 = load ptr, ptr %6, align 8, !dbg !1779
  %45 = load i8, ptr %44, align 1, !dbg !1781
  %46 = sext i8 %45 to i32, !dbg !1781
  %47 = icmp eq i32 %46, 0, !dbg !1782
  br i1 %47, label %48, label %49, !dbg !1783

48:                                               ; preds = %43
  br label %52, !dbg !1784

49:                                               ; preds = %43
  %50 = load ptr, ptr %4, align 8, !dbg !1786
  %51 = getelementptr inbounds i8, ptr %50, i32 1, !dbg !1786
  store ptr %51, ptr %4, align 8, !dbg !1786
  br label %18, !dbg !1756, !llvm.loop !1787

52:                                               ; preds = %48, %18
  %53 = load ptr, ptr %4, align 8, !dbg !1789
  %54 = load i8, ptr %53, align 1, !dbg !1791
  %55 = sext i8 %54 to i32, !dbg !1791
  %56 = icmp eq i32 %55, 0, !dbg !1792
  br i1 %56, label %57, label %58, !dbg !1793

57:                                               ; preds = %52
  store ptr null, ptr @__fizzer_model__strtok.next, align 8, !dbg !1794
  store ptr null, ptr %3, align 8, !dbg !1796
  br label %107, !dbg !1796

58:                                               ; preds = %52
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1797, metadata !DIExpression()), !dbg !1798
  %59 = load ptr, ptr %4, align 8, !dbg !1799
  store ptr %59, ptr %7, align 8, !dbg !1798
  br label %60, !dbg !1800

60:                                               ; preds = %91, %58
  %61 = load ptr, ptr %4, align 8, !dbg !1801
  %62 = load i8, ptr %61, align 1, !dbg !1802
  %63 = sext i8 %62 to i32, !dbg !1802
  %64 = icmp ne i32 %63, 0, !dbg !1803
  br i1 %64, label %65, label %94, !dbg !1800

65:                                               ; preds = %60
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1804, metadata !DIExpression()), !dbg !1806
  %66 = load ptr, ptr %5, align 8, !dbg !1807
  store ptr %66, ptr %8, align 8, !dbg !1806
  br label %67, !dbg !1808

67:                                               ; preds = %82, %65
  %68 = load ptr, ptr %8, align 8, !dbg !1809
  %69 = load i8, ptr %68, align 1, !dbg !1810
  %70 = sext i8 %69 to i32, !dbg !1810
  %71 = icmp ne i32 %70, 0, !dbg !1811
  br i1 %71, label %72, label %80, !dbg !1812

72:                                               ; preds = %67
  %73 = load ptr, ptr %8, align 8, !dbg !1813
  %74 = load i8, ptr %73, align 1, !dbg !1814
  %75 = sext i8 %74 to i32, !dbg !1814
  %76 = load ptr, ptr %4, align 8, !dbg !1815
  %77 = load i8, ptr %76, align 1, !dbg !1816
  %78 = sext i8 %77 to i32, !dbg !1816
  %79 = icmp ne i32 %75, %78, !dbg !1817
  br label %80

80:                                               ; preds = %72, %67
  %81 = phi i1 [ false, %67 ], [ %79, %72 ], !dbg !1818
  br i1 %81, label %82, label %85, !dbg !1808

82:                                               ; preds = %80
  %83 = load ptr, ptr %8, align 8, !dbg !1819
  %84 = getelementptr inbounds i8, ptr %83, i32 1, !dbg !1819
  store ptr %84, ptr %8, align 8, !dbg !1819
  br label %67, !dbg !1808, !llvm.loop !1821

85:                                               ; preds = %80
  %86 = load ptr, ptr %8, align 8, !dbg !1823
  %87 = load i8, ptr %86, align 1, !dbg !1825
  %88 = sext i8 %87 to i32, !dbg !1825
  %89 = icmp ne i32 %88, 0, !dbg !1826
  br i1 %89, label %90, label %91, !dbg !1827

90:                                               ; preds = %85
  br label %94, !dbg !1828

91:                                               ; preds = %85
  %92 = load ptr, ptr %4, align 8, !dbg !1830
  %93 = getelementptr inbounds i8, ptr %92, i32 1, !dbg !1830
  store ptr %93, ptr %4, align 8, !dbg !1830
  br label %60, !dbg !1800, !llvm.loop !1831

94:                                               ; preds = %90, %60
  %95 = load ptr, ptr %4, align 8, !dbg !1833
  %96 = load i8, ptr %95, align 1, !dbg !1835
  %97 = sext i8 %96 to i32, !dbg !1835
  %98 = icmp ne i32 %97, 0, !dbg !1836
  br i1 %98, label %99, label %104, !dbg !1837

99:                                               ; preds = %94
  %100 = load ptr, ptr %4, align 8, !dbg !1838
  store i8 0, ptr %100, align 1, !dbg !1840
  %101 = load ptr, ptr %4, align 8, !dbg !1841
  %102 = getelementptr inbounds i8, ptr %101, i32 1, !dbg !1841
  store ptr %102, ptr %4, align 8, !dbg !1841
  %103 = load ptr, ptr %4, align 8, !dbg !1842
  store ptr %103, ptr @__fizzer_model__strtok.next, align 8, !dbg !1843
  br label %105, !dbg !1844

104:                                              ; preds = %94
  store ptr null, ptr @__fizzer_model__strtok.next, align 8, !dbg !1845
  br label %105

105:                                              ; preds = %104, %99
  %106 = load ptr, ptr %7, align 8, !dbg !1847
  store ptr %106, ptr %3, align 8, !dbg !1848
  br label %107, !dbg !1848

107:                                              ; preds = %105, %57, %16
  %108 = load ptr, ptr %3, align 8, !dbg !1849
  ret ptr %108, !dbg !1849
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__strxfrm(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 !dbg !1850 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1856, metadata !DIExpression()), !dbg !1857
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1858, metadata !DIExpression()), !dbg !1859
  store i64 %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1860, metadata !DIExpression()), !dbg !1861
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1862, metadata !DIExpression()), !dbg !1863
  store i64 0, ptr %7, align 8, !dbg !1863
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1864, metadata !DIExpression()), !dbg !1865
  %10 = load ptr, ptr %5, align 8, !dbg !1866
  store ptr %10, ptr %8, align 8, !dbg !1865
  br label %11, !dbg !1867

11:                                               ; preds = %16, %3
  %12 = load ptr, ptr %8, align 8, !dbg !1868
  %13 = load i8, ptr %12, align 1, !dbg !1869
  %14 = sext i8 %13 to i32, !dbg !1869
  %15 = icmp ne i32 %14, 0, !dbg !1870
  br i1 %15, label %16, label %21, !dbg !1867

16:                                               ; preds = %11
  %17 = load i64, ptr %7, align 8, !dbg !1871
  %18 = add i64 %17, 1, !dbg !1871
  store i64 %18, ptr %7, align 8, !dbg !1871
  %19 = load ptr, ptr %8, align 8, !dbg !1873
  %20 = getelementptr inbounds i8, ptr %19, i32 1, !dbg !1873
  store ptr %20, ptr %8, align 8, !dbg !1873
  br label %11, !dbg !1867, !llvm.loop !1874

21:                                               ; preds = %11
  %22 = load i64, ptr %6, align 8, !dbg !1876
  %23 = icmp ugt i64 %22, 0, !dbg !1878
  br i1 %23, label %24, label %53, !dbg !1879

24:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1880, metadata !DIExpression()), !dbg !1882
  store i64 0, ptr %9, align 8, !dbg !1882
  br label %25, !dbg !1883

25:                                               ; preds = %39, %24
  %26 = load i64, ptr %9, align 8, !dbg !1884
  %27 = load i64, ptr %6, align 8, !dbg !1885
  %28 = sub i64 %27, 1, !dbg !1886
  %29 = icmp ult i64 %26, %28, !dbg !1887
  br i1 %29, label %30, label %37, !dbg !1888

30:                                               ; preds = %25
  %31 = load ptr, ptr %5, align 8, !dbg !1889
  %32 = load i64, ptr %9, align 8, !dbg !1890
  %33 = getelementptr inbounds i8, ptr %31, i64 %32, !dbg !1889
  %34 = load i8, ptr %33, align 1, !dbg !1889
  %35 = sext i8 %34 to i32, !dbg !1889
  %36 = icmp ne i32 %35, 0, !dbg !1891
  br label %37

37:                                               ; preds = %30, %25
  %38 = phi i1 [ false, %25 ], [ %36, %30 ], !dbg !1892
  br i1 %38, label %39, label %49, !dbg !1883

39:                                               ; preds = %37
  %40 = load ptr, ptr %5, align 8, !dbg !1893
  %41 = load i64, ptr %9, align 8, !dbg !1895
  %42 = getelementptr inbounds i8, ptr %40, i64 %41, !dbg !1893
  %43 = load i8, ptr %42, align 1, !dbg !1893
  %44 = load ptr, ptr %4, align 8, !dbg !1896
  %45 = load i64, ptr %9, align 8, !dbg !1897
  %46 = getelementptr inbounds i8, ptr %44, i64 %45, !dbg !1896
  store i8 %43, ptr %46, align 1, !dbg !1898
  %47 = load i64, ptr %9, align 8, !dbg !1899
  %48 = add i64 %47, 1, !dbg !1899
  store i64 %48, ptr %9, align 8, !dbg !1899
  br label %25, !dbg !1883, !llvm.loop !1900

49:                                               ; preds = %37
  %50 = load ptr, ptr %4, align 8, !dbg !1902
  %51 = load i64, ptr %9, align 8, !dbg !1903
  %52 = getelementptr inbounds i8, ptr %50, i64 %51, !dbg !1902
  store i8 0, ptr %52, align 1, !dbg !1904
  br label %53, !dbg !1905

53:                                               ; preds = %49, %21
  %54 = load i64, ptr %7, align 8, !dbg !1906
  ret i64 %54, !dbg !1907
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__iscntrl(i32 noundef %0) #0 !dbg !1908 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1910, metadata !DIExpression()), !dbg !1911
  %4 = load i32, ptr %3, align 4, !dbg !1912
  %5 = icmp sge i32 %4, 0, !dbg !1914
  br i1 %5, label %6, label %9, !dbg !1915

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !1916
  %8 = icmp sle i32 %7, 31, !dbg !1917
  br i1 %8, label %12, label %9, !dbg !1918

9:                                                ; preds = %6, %1
  %10 = load i32, ptr %3, align 4, !dbg !1919
  %11 = icmp eq i32 %10, 127, !dbg !1920
  br i1 %11, label %12, label %13, !dbg !1921

12:                                               ; preds = %9, %6
  store i32 1, ptr %2, align 4, !dbg !1922
  br label %14, !dbg !1922

13:                                               ; preds = %9
  store i32 0, ptr %2, align 4, !dbg !1924
  br label %14, !dbg !1924

14:                                               ; preds = %13, %12
  %15 = load i32, ptr %2, align 4, !dbg !1925
  ret i32 %15, !dbg !1925
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isxdigit(i32 noundef %0) #0 !dbg !1926 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1928, metadata !DIExpression()), !dbg !1929
  %4 = load i32, ptr %3, align 4, !dbg !1930
  %5 = call i32 @__fizzer_model__isdigit(i32 noundef %4), !dbg !1932
  %6 = icmp ne i32 %5, 0, !dbg !1932
  br i1 %6, label %19, label %7, !dbg !1933

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4, !dbg !1934
  %9 = icmp sge i32 %8, 65, !dbg !1935
  br i1 %9, label %10, label %13, !dbg !1936

10:                                               ; preds = %7
  %11 = load i32, ptr %3, align 4, !dbg !1937
  %12 = icmp sle i32 %11, 70, !dbg !1938
  br i1 %12, label %19, label %13, !dbg !1939

13:                                               ; preds = %10, %7
  %14 = load i32, ptr %3, align 4, !dbg !1940
  %15 = icmp sge i32 %14, 97, !dbg !1941
  br i1 %15, label %16, label %20, !dbg !1942

16:                                               ; preds = %13
  %17 = load i32, ptr %3, align 4, !dbg !1943
  %18 = icmp sle i32 %17, 102, !dbg !1944
  br i1 %18, label %19, label %20, !dbg !1945

19:                                               ; preds = %16, %10, %1
  store i32 1, ptr %2, align 4, !dbg !1946
  br label %21, !dbg !1946

20:                                               ; preds = %16, %13
  store i32 0, ptr %2, align 4, !dbg !1948
  br label %21, !dbg !1948

21:                                               ; preds = %20, %19
  %22 = load i32, ptr %2, align 4, !dbg !1949
  ret i32 %22, !dbg !1949
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isalnum(i32 noundef %0) #0 !dbg !1950 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1952, metadata !DIExpression()), !dbg !1953
  %4 = load i32, ptr %3, align 4, !dbg !1954
  %5 = call i32 @__fizzer_model__isalpha(i32 noundef %4), !dbg !1956
  %6 = icmp ne i32 %5, 0, !dbg !1956
  br i1 %6, label %11, label %7, !dbg !1957

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4, !dbg !1958
  %9 = call i32 @__fizzer_model__isdigit(i32 noundef %8), !dbg !1959
  %10 = icmp ne i32 %9, 0, !dbg !1959
  br i1 %10, label %11, label %12, !dbg !1960

11:                                               ; preds = %7, %1
  store i32 1, ptr %2, align 4, !dbg !1961
  br label %13, !dbg !1961

12:                                               ; preds = %7
  store i32 0, ptr %2, align 4, !dbg !1963
  br label %13, !dbg !1963

13:                                               ; preds = %12, %11
  %14 = load i32, ptr %2, align 4, !dbg !1964
  ret i32 %14, !dbg !1964
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isspace(i32 noundef %0) #0 !dbg !1965 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1967, metadata !DIExpression()), !dbg !1968
  %4 = load i32, ptr %3, align 4, !dbg !1969
  %5 = icmp eq i32 %4, 32, !dbg !1971
  br i1 %5, label %21, label %6, !dbg !1972

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !1973
  %8 = icmp eq i32 %7, 12, !dbg !1974
  br i1 %8, label %21, label %9, !dbg !1975

9:                                                ; preds = %6
  %10 = load i32, ptr %3, align 4, !dbg !1976
  %11 = icmp eq i32 %10, 10, !dbg !1977
  br i1 %11, label %21, label %12, !dbg !1978

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4, !dbg !1979
  %14 = icmp eq i32 %13, 13, !dbg !1980
  br i1 %14, label %21, label %15, !dbg !1981

15:                                               ; preds = %12
  %16 = load i32, ptr %3, align 4, !dbg !1982
  %17 = icmp eq i32 %16, 9, !dbg !1983
  br i1 %17, label %21, label %18, !dbg !1984

18:                                               ; preds = %15
  %19 = load i32, ptr %3, align 4, !dbg !1985
  %20 = icmp eq i32 %19, 11, !dbg !1986
  br i1 %20, label %21, label %22, !dbg !1987

21:                                               ; preds = %18, %15, %12, %9, %6, %1
  store i32 1, ptr %2, align 4, !dbg !1988
  br label %23, !dbg !1988

22:                                               ; preds = %18
  store i32 0, ptr %2, align 4, !dbg !1990
  br label %23, !dbg !1990

23:                                               ; preds = %22, %21
  %24 = load i32, ptr %2, align 4, !dbg !1991
  ret i32 %24, !dbg !1991
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isalpha(i32 noundef %0) #0 !dbg !1992 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1994, metadata !DIExpression()), !dbg !1995
  %4 = load i32, ptr %3, align 4, !dbg !1996
  %5 = icmp sge i32 %4, 65, !dbg !1998
  br i1 %5, label %6, label %9, !dbg !1999

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2000
  %8 = icmp sle i32 %7, 90, !dbg !2001
  br i1 %8, label %15, label %9, !dbg !2002

9:                                                ; preds = %6, %1
  %10 = load i32, ptr %3, align 4, !dbg !2003
  %11 = icmp sge i32 %10, 97, !dbg !2004
  br i1 %11, label %12, label %16, !dbg !2005

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4, !dbg !2006
  %14 = icmp sle i32 %13, 122, !dbg !2007
  br i1 %14, label %15, label %16, !dbg !2008

15:                                               ; preds = %12, %6
  store i32 1, ptr %2, align 4, !dbg !2009
  br label %17, !dbg !2009

16:                                               ; preds = %12, %9
  store i32 0, ptr %2, align 4, !dbg !2011
  br label %17, !dbg !2011

17:                                               ; preds = %16, %15
  %18 = load i32, ptr %2, align 4, !dbg !2012
  ret i32 %18, !dbg !2012
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isblank(i32 noundef %0) #0 !dbg !2013 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2015, metadata !DIExpression()), !dbg !2016
  %4 = load i32, ptr %3, align 4, !dbg !2017
  %5 = icmp eq i32 %4, 32, !dbg !2019
  br i1 %5, label %9, label %6, !dbg !2020

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2021
  %8 = icmp eq i32 %7, 9, !dbg !2022
  br i1 %8, label %9, label %10, !dbg !2023

9:                                                ; preds = %6, %1
  store i32 1, ptr %2, align 4, !dbg !2024
  br label %11, !dbg !2024

10:                                               ; preds = %6
  store i32 0, ptr %2, align 4, !dbg !2026
  br label %11, !dbg !2026

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2027
  ret i32 %12, !dbg !2027
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__islower(i32 noundef %0) #0 !dbg !2028 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2030, metadata !DIExpression()), !dbg !2031
  %4 = load i32, ptr %3, align 4, !dbg !2032
  %5 = icmp sge i32 %4, 97, !dbg !2034
  br i1 %5, label %6, label %10, !dbg !2035

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2036
  %8 = icmp sle i32 %7, 122, !dbg !2037
  br i1 %8, label %9, label %10, !dbg !2038

9:                                                ; preds = %6
  store i32 1, ptr %2, align 4, !dbg !2039
  br label %11, !dbg !2039

10:                                               ; preds = %6, %1
  store i32 0, ptr %2, align 4, !dbg !2041
  br label %11, !dbg !2041

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2042
  ret i32 %12, !dbg !2042
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isdigit(i32 noundef %0) #0 !dbg !2043 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2045, metadata !DIExpression()), !dbg !2046
  %4 = load i32, ptr %3, align 4, !dbg !2047
  %5 = icmp sge i32 %4, 48, !dbg !2049
  br i1 %5, label %6, label %10, !dbg !2050

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2051
  %8 = icmp sle i32 %7, 57, !dbg !2052
  br i1 %8, label %9, label %10, !dbg !2053

9:                                                ; preds = %6
  store i32 1, ptr %2, align 4, !dbg !2054
  br label %11, !dbg !2054

10:                                               ; preds = %6, %1
  store i32 0, ptr %2, align 4, !dbg !2056
  br label %11, !dbg !2056

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2057
  ret i32 %12, !dbg !2057
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__toupper(i32 noundef %0) #0 !dbg !2058 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2060, metadata !DIExpression()), !dbg !2061
  %4 = load i32, ptr %3, align 4, !dbg !2062
  %5 = call i32 @__fizzer_model__islower(i32 noundef %4), !dbg !2064
  %6 = icmp ne i32 %5, 0, !dbg !2064
  br i1 %6, label %7, label %11, !dbg !2065

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4, !dbg !2066
  %9 = sub nsw i32 %8, 97, !dbg !2068
  %10 = add nsw i32 %9, 65, !dbg !2069
  store i32 %10, ptr %2, align 4, !dbg !2070
  br label %13, !dbg !2070

11:                                               ; preds = %1
  %12 = load i32, ptr %3, align 4, !dbg !2071
  store i32 %12, ptr %2, align 4, !dbg !2072
  br label %13, !dbg !2072

13:                                               ; preds = %11, %7
  %14 = load i32, ptr %2, align 4, !dbg !2073
  ret i32 %14, !dbg !2073
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isprint(i32 noundef %0) #0 !dbg !2074 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2076, metadata !DIExpression()), !dbg !2077
  %4 = load i32, ptr %3, align 4, !dbg !2078
  %5 = icmp sge i32 %4, 32, !dbg !2080
  br i1 %5, label %6, label %10, !dbg !2081

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2082
  %8 = icmp sle i32 %7, 126, !dbg !2083
  br i1 %8, label %9, label %10, !dbg !2084

9:                                                ; preds = %6
  store i32 1, ptr %2, align 4, !dbg !2085
  br label %11, !dbg !2085

10:                                               ; preds = %6, %1
  store i32 0, ptr %2, align 4, !dbg !2087
  br label %11, !dbg !2087

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2088
  ret i32 %12, !dbg !2088
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isupper(i32 noundef %0) #0 !dbg !2089 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2091, metadata !DIExpression()), !dbg !2092
  %4 = load i32, ptr %3, align 4, !dbg !2093
  %5 = icmp sge i32 %4, 65, !dbg !2095
  br i1 %5, label %6, label %10, !dbg !2096

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2097
  %8 = icmp sle i32 %7, 90, !dbg !2098
  br i1 %8, label %9, label %10, !dbg !2099

9:                                                ; preds = %6
  store i32 1, ptr %2, align 4, !dbg !2100
  br label %11, !dbg !2100

10:                                               ; preds = %6, %1
  store i32 0, ptr %2, align 4, !dbg !2102
  br label %11, !dbg !2102

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2103
  ret i32 %12, !dbg !2103
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__tolower(i32 noundef %0) #0 !dbg !2104 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2106, metadata !DIExpression()), !dbg !2107
  %4 = load i32, ptr %3, align 4, !dbg !2108
  %5 = call i32 @__fizzer_model__isupper(i32 noundef %4), !dbg !2110
  %6 = icmp ne i32 %5, 0, !dbg !2110
  br i1 %6, label %7, label %11, !dbg !2111

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4, !dbg !2112
  %9 = sub nsw i32 %8, 65, !dbg !2114
  %10 = add nsw i32 %9, 97, !dbg !2115
  store i32 %10, ptr %2, align 4, !dbg !2116
  br label %13, !dbg !2116

11:                                               ; preds = %1
  %12 = load i32, ptr %3, align 4, !dbg !2117
  store i32 %12, ptr %2, align 4, !dbg !2118
  br label %13, !dbg !2118

13:                                               ; preds = %11, %7
  %14 = load i32, ptr %2, align 4, !dbg !2119
  ret i32 %14, !dbg !2119
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isgraph(i32 noundef %0) #0 !dbg !2120 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2122, metadata !DIExpression()), !dbg !2123
  %4 = load i32, ptr %3, align 4, !dbg !2124
  %5 = icmp sge i32 %4, 33, !dbg !2126
  br i1 %5, label %6, label %10, !dbg !2127

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2128
  %8 = icmp sle i32 %7, 126, !dbg !2129
  br i1 %8, label %9, label %10, !dbg !2130

9:                                                ; preds = %6
  store i32 1, ptr %2, align 4, !dbg !2131
  br label %11, !dbg !2131

10:                                               ; preds = %6, %1
  store i32 0, ptr %2, align 4, !dbg !2133
  br label %11, !dbg !2133

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2134
  ret i32 %12, !dbg !2134
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__snprintf(ptr noundef %0, i64 noundef %1, ptr noundef %2, ...) #0 !dbg !2135 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca [1 x %struct.__va_list_tag], align 16
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2141, metadata !DIExpression()), !dbg !2142
  store i64 %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2143, metadata !DIExpression()), !dbg !2144
  store ptr %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2145, metadata !DIExpression()), !dbg !2146
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2147, metadata !DIExpression()), !dbg !2160
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %7, i64 0, i64 0, !dbg !2161
  call void @llvm.va_start(ptr %9), !dbg !2161
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2162, metadata !DIExpression()), !dbg !2163
  %10 = load ptr, ptr %4, align 8, !dbg !2164
  %11 = load i64, ptr %5, align 8, !dbg !2165
  %12 = load ptr, ptr %6, align 8, !dbg !2166
  %13 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %7, i64 0, i64 0, !dbg !2167
  %14 = call i32 @__fizzer_model__vsnprintf(ptr noundef %10, i64 noundef %11, ptr noundef %12, ptr noundef %13), !dbg !2168
  store i32 %14, ptr %8, align 4, !dbg !2163
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %7, i64 0, i64 0, !dbg !2169
  call void @llvm.va_end(ptr %15), !dbg !2169
  %16 = load i32, ptr %8, align 4, !dbg !2170
  ret i32 %16, !dbg !2171
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start(ptr) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end(ptr) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__sprintf(ptr noundef %0, ptr noundef %1, ...) #0 !dbg !2172 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca [1 x %struct.__va_list_tag], align 16
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2176, metadata !DIExpression()), !dbg !2177
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2178, metadata !DIExpression()), !dbg !2179
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2180, metadata !DIExpression()), !dbg !2191
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %5, i64 0, i64 0, !dbg !2192
  call void @llvm.va_start(ptr %7), !dbg !2192
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2193, metadata !DIExpression()), !dbg !2194
  %8 = load ptr, ptr %3, align 8, !dbg !2195
  %9 = load ptr, ptr %4, align 8, !dbg !2196
  %10 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %5, i64 0, i64 0, !dbg !2197
  %11 = call i32 @__fizzer_model__vsprintf(ptr noundef %8, ptr noundef %9, ptr noundef %10), !dbg !2198
  store i32 %11, ptr %6, align 4, !dbg !2194
  %12 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %5, i64 0, i64 0, !dbg !2199
  call void @llvm.va_end(ptr %12), !dbg !2199
  %13 = load i32, ptr %6, align 4, !dbg !2200
  ret i32 %13, !dbg !2201
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__vsprintf(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !2202 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca [32 x i8], align 16
  %11 = alloca i64, align 8
  %12 = alloca i32, align 4
  %13 = alloca [32 x i8], align 16
  %14 = alloca i64, align 8
  %15 = alloca i32, align 4
  %16 = alloca [32 x i8], align 16
  %17 = alloca i64, align 8
  %18 = alloca i8, align 1
  %19 = alloca ptr, align 8
  %20 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2213, metadata !DIExpression()), !dbg !2214
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2215, metadata !DIExpression()), !dbg !2216
  store ptr %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2217, metadata !DIExpression()), !dbg !2218
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2219, metadata !DIExpression()), !dbg !2222
  store i64 0, ptr %7, align 8, !dbg !2222
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2223, metadata !DIExpression()), !dbg !2224
  store i64 0, ptr %8, align 8, !dbg !2224
  br label %21, !dbg !2225

21:                                               ; preds = %281, %3
  %22 = load ptr, ptr %5, align 8, !dbg !2226
  %23 = load i64, ptr %7, align 8, !dbg !2227
  %24 = getelementptr inbounds i8, ptr %22, i64 %23, !dbg !2226
  %25 = load i8, ptr %24, align 1, !dbg !2226
  %26 = sext i8 %25 to i32, !dbg !2226
  %27 = icmp ne i32 %26, 0, !dbg !2228
  br i1 %27, label %28, label %282, !dbg !2225

28:                                               ; preds = %21
  %29 = load ptr, ptr %5, align 8, !dbg !2229
  %30 = load i64, ptr %7, align 8, !dbg !2232
  %31 = getelementptr inbounds i8, ptr %29, i64 %30, !dbg !2229
  %32 = load i8, ptr %31, align 1, !dbg !2229
  %33 = sext i8 %32 to i32, !dbg !2229
  %34 = icmp eq i32 %33, 37, !dbg !2233
  br i1 %34, label %35, label %269, !dbg !2234

35:                                               ; preds = %28
  %36 = load i64, ptr %7, align 8, !dbg !2235
  %37 = add i64 %36, 1, !dbg !2235
  store i64 %37, ptr %7, align 8, !dbg !2235
  %38 = load ptr, ptr %5, align 8, !dbg !2237
  %39 = load i64, ptr %7, align 8, !dbg !2239
  %40 = getelementptr inbounds i8, ptr %38, i64 %39, !dbg !2237
  %41 = load i8, ptr %40, align 1, !dbg !2237
  %42 = sext i8 %41 to i32, !dbg !2237
  %43 = icmp eq i32 %42, 0, !dbg !2240
  br i1 %43, label %44, label %45, !dbg !2241

44:                                               ; preds = %35
  br label %282, !dbg !2242

45:                                               ; preds = %35
  %46 = load ptr, ptr %5, align 8, !dbg !2244
  %47 = load i64, ptr %7, align 8, !dbg !2246
  %48 = getelementptr inbounds i8, ptr %46, i64 %47, !dbg !2244
  %49 = load i8, ptr %48, align 1, !dbg !2244
  %50 = sext i8 %49 to i32, !dbg !2244
  %51 = icmp eq i32 %50, 100, !dbg !2247
  br i1 %51, label %52, label %89, !dbg !2248

52:                                               ; preds = %45
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2249, metadata !DIExpression()), !dbg !2251
  %53 = load ptr, ptr %6, align 8, !dbg !2252
  %54 = getelementptr inbounds %struct.__va_list_tag, ptr %53, i32 0, i32 0, !dbg !2252
  %55 = load i32, ptr %54, align 8, !dbg !2252
  %56 = icmp ule i32 %55, 40, !dbg !2252
  br i1 %56, label %57, label %62, !dbg !2252

57:                                               ; preds = %52
  %58 = getelementptr inbounds %struct.__va_list_tag, ptr %53, i32 0, i32 3, !dbg !2252
  %59 = load ptr, ptr %58, align 8, !dbg !2252
  %60 = getelementptr i8, ptr %59, i32 %55, !dbg !2252
  %61 = add i32 %55, 8, !dbg !2252
  store i32 %61, ptr %54, align 8, !dbg !2252
  br label %66, !dbg !2252

62:                                               ; preds = %52
  %63 = getelementptr inbounds %struct.__va_list_tag, ptr %53, i32 0, i32 2, !dbg !2252
  %64 = load ptr, ptr %63, align 8, !dbg !2252
  %65 = getelementptr i8, ptr %64, i32 8, !dbg !2252
  store ptr %65, ptr %63, align 8, !dbg !2252
  br label %66, !dbg !2252

66:                                               ; preds = %62, %57
  %67 = phi ptr [ %60, %57 ], [ %64, %62 ], !dbg !2252
  %68 = load i32, ptr %67, align 4, !dbg !2252
  store i32 %68, ptr %9, align 4, !dbg !2251
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2253, metadata !DIExpression()), !dbg !2257
  %69 = load i32, ptr %9, align 4, !dbg !2258
  %70 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0, !dbg !2259
  call void @__fizzer_model__helper_itoa(i32 noundef %69, ptr noundef %70, i32 noundef 10), !dbg !2260
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2261, metadata !DIExpression()), !dbg !2262
  store i64 0, ptr %11, align 8, !dbg !2262
  br label %71, !dbg !2263

71:                                               ; preds = %77, %66
  %72 = load i64, ptr %11, align 8, !dbg !2264
  %73 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 %72, !dbg !2265
  %74 = load i8, ptr %73, align 1, !dbg !2265
  %75 = sext i8 %74 to i32, !dbg !2265
  %76 = icmp ne i32 %75, 0, !dbg !2266
  br i1 %76, label %77, label %88, !dbg !2263

77:                                               ; preds = %71
  %78 = load i64, ptr %11, align 8, !dbg !2267
  %79 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 %78, !dbg !2269
  %80 = load i8, ptr %79, align 1, !dbg !2269
  %81 = load ptr, ptr %4, align 8, !dbg !2270
  %82 = load i64, ptr %8, align 8, !dbg !2271
  %83 = getelementptr inbounds i8, ptr %81, i64 %82, !dbg !2270
  store i8 %80, ptr %83, align 1, !dbg !2272
  %84 = load i64, ptr %8, align 8, !dbg !2273
  %85 = add i64 %84, 1, !dbg !2273
  store i64 %85, ptr %8, align 8, !dbg !2273
  %86 = load i64, ptr %11, align 8, !dbg !2274
  %87 = add i64 %86, 1, !dbg !2274
  store i64 %87, ptr %11, align 8, !dbg !2274
  br label %71, !dbg !2263, !llvm.loop !2275

88:                                               ; preds = %71
  br label %266, !dbg !2277

89:                                               ; preds = %45
  %90 = load ptr, ptr %5, align 8, !dbg !2278
  %91 = load i64, ptr %7, align 8, !dbg !2280
  %92 = getelementptr inbounds i8, ptr %90, i64 %91, !dbg !2278
  %93 = load i8, ptr %92, align 1, !dbg !2278
  %94 = sext i8 %93 to i32, !dbg !2278
  %95 = icmp eq i32 %94, 117, !dbg !2281
  br i1 %95, label %96, label %133, !dbg !2282

96:                                               ; preds = %89
  call void @llvm.dbg.declare(metadata ptr %12, metadata !2283, metadata !DIExpression()), !dbg !2285
  %97 = load ptr, ptr %6, align 8, !dbg !2286
  %98 = getelementptr inbounds %struct.__va_list_tag, ptr %97, i32 0, i32 0, !dbg !2286
  %99 = load i32, ptr %98, align 8, !dbg !2286
  %100 = icmp ule i32 %99, 40, !dbg !2286
  br i1 %100, label %101, label %106, !dbg !2286

101:                                              ; preds = %96
  %102 = getelementptr inbounds %struct.__va_list_tag, ptr %97, i32 0, i32 3, !dbg !2286
  %103 = load ptr, ptr %102, align 8, !dbg !2286
  %104 = getelementptr i8, ptr %103, i32 %99, !dbg !2286
  %105 = add i32 %99, 8, !dbg !2286
  store i32 %105, ptr %98, align 8, !dbg !2286
  br label %110, !dbg !2286

106:                                              ; preds = %96
  %107 = getelementptr inbounds %struct.__va_list_tag, ptr %97, i32 0, i32 2, !dbg !2286
  %108 = load ptr, ptr %107, align 8, !dbg !2286
  %109 = getelementptr i8, ptr %108, i32 8, !dbg !2286
  store ptr %109, ptr %107, align 8, !dbg !2286
  br label %110, !dbg !2286

110:                                              ; preds = %106, %101
  %111 = phi ptr [ %104, %101 ], [ %108, %106 ], !dbg !2286
  %112 = load i32, ptr %111, align 4, !dbg !2286
  store i32 %112, ptr %12, align 4, !dbg !2285
  call void @llvm.dbg.declare(metadata ptr %13, metadata !2287, metadata !DIExpression()), !dbg !2288
  %113 = load i32, ptr %12, align 4, !dbg !2289
  %114 = getelementptr inbounds [32 x i8], ptr %13, i64 0, i64 0, !dbg !2290
  call void @__fizzer_model__helper_itoa(i32 noundef %113, ptr noundef %114, i32 noundef 10), !dbg !2291
  call void @llvm.dbg.declare(metadata ptr %14, metadata !2292, metadata !DIExpression()), !dbg !2293
  store i64 0, ptr %14, align 8, !dbg !2293
  br label %115, !dbg !2294

115:                                              ; preds = %121, %110
  %116 = load i64, ptr %14, align 8, !dbg !2295
  %117 = getelementptr inbounds [32 x i8], ptr %13, i64 0, i64 %116, !dbg !2296
  %118 = load i8, ptr %117, align 1, !dbg !2296
  %119 = sext i8 %118 to i32, !dbg !2296
  %120 = icmp ne i32 %119, 0, !dbg !2297
  br i1 %120, label %121, label %132, !dbg !2294

121:                                              ; preds = %115
  %122 = load i64, ptr %14, align 8, !dbg !2298
  %123 = getelementptr inbounds [32 x i8], ptr %13, i64 0, i64 %122, !dbg !2300
  %124 = load i8, ptr %123, align 1, !dbg !2300
  %125 = load ptr, ptr %4, align 8, !dbg !2301
  %126 = load i64, ptr %8, align 8, !dbg !2302
  %127 = getelementptr inbounds i8, ptr %125, i64 %126, !dbg !2301
  store i8 %124, ptr %127, align 1, !dbg !2303
  %128 = load i64, ptr %8, align 8, !dbg !2304
  %129 = add i64 %128, 1, !dbg !2304
  store i64 %129, ptr %8, align 8, !dbg !2304
  %130 = load i64, ptr %14, align 8, !dbg !2305
  %131 = add i64 %130, 1, !dbg !2305
  store i64 %131, ptr %14, align 8, !dbg !2305
  br label %115, !dbg !2294, !llvm.loop !2306

132:                                              ; preds = %115
  br label %265, !dbg !2308

133:                                              ; preds = %89
  %134 = load ptr, ptr %5, align 8, !dbg !2309
  %135 = load i64, ptr %7, align 8, !dbg !2311
  %136 = getelementptr inbounds i8, ptr %134, i64 %135, !dbg !2309
  %137 = load i8, ptr %136, align 1, !dbg !2309
  %138 = sext i8 %137 to i32, !dbg !2309
  %139 = icmp eq i32 %138, 120, !dbg !2312
  br i1 %139, label %140, label %177, !dbg !2313

140:                                              ; preds = %133
  call void @llvm.dbg.declare(metadata ptr %15, metadata !2314, metadata !DIExpression()), !dbg !2316
  %141 = load ptr, ptr %6, align 8, !dbg !2317
  %142 = getelementptr inbounds %struct.__va_list_tag, ptr %141, i32 0, i32 0, !dbg !2317
  %143 = load i32, ptr %142, align 8, !dbg !2317
  %144 = icmp ule i32 %143, 40, !dbg !2317
  br i1 %144, label %145, label %150, !dbg !2317

145:                                              ; preds = %140
  %146 = getelementptr inbounds %struct.__va_list_tag, ptr %141, i32 0, i32 3, !dbg !2317
  %147 = load ptr, ptr %146, align 8, !dbg !2317
  %148 = getelementptr i8, ptr %147, i32 %143, !dbg !2317
  %149 = add i32 %143, 8, !dbg !2317
  store i32 %149, ptr %142, align 8, !dbg !2317
  br label %154, !dbg !2317

150:                                              ; preds = %140
  %151 = getelementptr inbounds %struct.__va_list_tag, ptr %141, i32 0, i32 2, !dbg !2317
  %152 = load ptr, ptr %151, align 8, !dbg !2317
  %153 = getelementptr i8, ptr %152, i32 8, !dbg !2317
  store ptr %153, ptr %151, align 8, !dbg !2317
  br label %154, !dbg !2317

154:                                              ; preds = %150, %145
  %155 = phi ptr [ %148, %145 ], [ %152, %150 ], !dbg !2317
  %156 = load i32, ptr %155, align 4, !dbg !2317
  store i32 %156, ptr %15, align 4, !dbg !2316
  call void @llvm.dbg.declare(metadata ptr %16, metadata !2318, metadata !DIExpression()), !dbg !2319
  %157 = load i32, ptr %15, align 4, !dbg !2320
  %158 = getelementptr inbounds [32 x i8], ptr %16, i64 0, i64 0, !dbg !2321
  call void @__fizzer_model__helper_itoa(i32 noundef %157, ptr noundef %158, i32 noundef 16), !dbg !2322
  call void @llvm.dbg.declare(metadata ptr %17, metadata !2323, metadata !DIExpression()), !dbg !2324
  store i64 0, ptr %17, align 8, !dbg !2324
  br label %159, !dbg !2325

159:                                              ; preds = %165, %154
  %160 = load i64, ptr %17, align 8, !dbg !2326
  %161 = getelementptr inbounds [32 x i8], ptr %16, i64 0, i64 %160, !dbg !2327
  %162 = load i8, ptr %161, align 1, !dbg !2327
  %163 = sext i8 %162 to i32, !dbg !2327
  %164 = icmp ne i32 %163, 0, !dbg !2328
  br i1 %164, label %165, label %176, !dbg !2325

165:                                              ; preds = %159
  %166 = load i64, ptr %17, align 8, !dbg !2329
  %167 = getelementptr inbounds [32 x i8], ptr %16, i64 0, i64 %166, !dbg !2331
  %168 = load i8, ptr %167, align 1, !dbg !2331
  %169 = load ptr, ptr %4, align 8, !dbg !2332
  %170 = load i64, ptr %8, align 8, !dbg !2333
  %171 = getelementptr inbounds i8, ptr %169, i64 %170, !dbg !2332
  store i8 %168, ptr %171, align 1, !dbg !2334
  %172 = load i64, ptr %8, align 8, !dbg !2335
  %173 = add i64 %172, 1, !dbg !2335
  store i64 %173, ptr %8, align 8, !dbg !2335
  %174 = load i64, ptr %17, align 8, !dbg !2336
  %175 = add i64 %174, 1, !dbg !2336
  store i64 %175, ptr %17, align 8, !dbg !2336
  br label %159, !dbg !2325, !llvm.loop !2337

176:                                              ; preds = %159
  br label %264, !dbg !2339

177:                                              ; preds = %133
  %178 = load ptr, ptr %5, align 8, !dbg !2340
  %179 = load i64, ptr %7, align 8, !dbg !2342
  %180 = getelementptr inbounds i8, ptr %178, i64 %179, !dbg !2340
  %181 = load i8, ptr %180, align 1, !dbg !2340
  %182 = sext i8 %181 to i32, !dbg !2340
  %183 = icmp eq i32 %182, 99, !dbg !2343
  br i1 %183, label %184, label %208, !dbg !2344

184:                                              ; preds = %177
  call void @llvm.dbg.declare(metadata ptr %18, metadata !2345, metadata !DIExpression()), !dbg !2347
  %185 = load ptr, ptr %6, align 8, !dbg !2348
  %186 = getelementptr inbounds %struct.__va_list_tag, ptr %185, i32 0, i32 0, !dbg !2348
  %187 = load i32, ptr %186, align 8, !dbg !2348
  %188 = icmp ule i32 %187, 40, !dbg !2348
  br i1 %188, label %189, label %194, !dbg !2348

189:                                              ; preds = %184
  %190 = getelementptr inbounds %struct.__va_list_tag, ptr %185, i32 0, i32 3, !dbg !2348
  %191 = load ptr, ptr %190, align 8, !dbg !2348
  %192 = getelementptr i8, ptr %191, i32 %187, !dbg !2348
  %193 = add i32 %187, 8, !dbg !2348
  store i32 %193, ptr %186, align 8, !dbg !2348
  br label %198, !dbg !2348

194:                                              ; preds = %184
  %195 = getelementptr inbounds %struct.__va_list_tag, ptr %185, i32 0, i32 2, !dbg !2348
  %196 = load ptr, ptr %195, align 8, !dbg !2348
  %197 = getelementptr i8, ptr %196, i32 8, !dbg !2348
  store ptr %197, ptr %195, align 8, !dbg !2348
  br label %198, !dbg !2348

198:                                              ; preds = %194, %189
  %199 = phi ptr [ %192, %189 ], [ %196, %194 ], !dbg !2348
  %200 = load i32, ptr %199, align 4, !dbg !2348
  %201 = trunc i32 %200 to i8, !dbg !2349
  store i8 %201, ptr %18, align 1, !dbg !2347
  %202 = load i8, ptr %18, align 1, !dbg !2350
  %203 = load ptr, ptr %4, align 8, !dbg !2351
  %204 = load i64, ptr %8, align 8, !dbg !2352
  %205 = getelementptr inbounds i8, ptr %203, i64 %204, !dbg !2351
  store i8 %202, ptr %205, align 1, !dbg !2353
  %206 = load i64, ptr %8, align 8, !dbg !2354
  %207 = add i64 %206, 1, !dbg !2354
  store i64 %207, ptr %8, align 8, !dbg !2354
  br label %263, !dbg !2355

208:                                              ; preds = %177
  %209 = load ptr, ptr %5, align 8, !dbg !2356
  %210 = load i64, ptr %7, align 8, !dbg !2358
  %211 = getelementptr inbounds i8, ptr %209, i64 %210, !dbg !2356
  %212 = load i8, ptr %211, align 1, !dbg !2356
  %213 = sext i8 %212 to i32, !dbg !2356
  %214 = icmp eq i32 %213, 115, !dbg !2359
  br i1 %214, label %215, label %252, !dbg !2360

215:                                              ; preds = %208
  call void @llvm.dbg.declare(metadata ptr %19, metadata !2361, metadata !DIExpression()), !dbg !2363
  %216 = load ptr, ptr %6, align 8, !dbg !2364
  %217 = getelementptr inbounds %struct.__va_list_tag, ptr %216, i32 0, i32 0, !dbg !2364
  %218 = load i32, ptr %217, align 8, !dbg !2364
  %219 = icmp ule i32 %218, 40, !dbg !2364
  br i1 %219, label %220, label %225, !dbg !2364

220:                                              ; preds = %215
  %221 = getelementptr inbounds %struct.__va_list_tag, ptr %216, i32 0, i32 3, !dbg !2364
  %222 = load ptr, ptr %221, align 8, !dbg !2364
  %223 = getelementptr i8, ptr %222, i32 %218, !dbg !2364
  %224 = add i32 %218, 8, !dbg !2364
  store i32 %224, ptr %217, align 8, !dbg !2364
  br label %229, !dbg !2364

225:                                              ; preds = %215
  %226 = getelementptr inbounds %struct.__va_list_tag, ptr %216, i32 0, i32 2, !dbg !2364
  %227 = load ptr, ptr %226, align 8, !dbg !2364
  %228 = getelementptr i8, ptr %227, i32 8, !dbg !2364
  store ptr %228, ptr %226, align 8, !dbg !2364
  br label %229, !dbg !2364

229:                                              ; preds = %225, %220
  %230 = phi ptr [ %223, %220 ], [ %227, %225 ], !dbg !2364
  %231 = load ptr, ptr %230, align 8, !dbg !2364
  store ptr %231, ptr %19, align 8, !dbg !2363
  call void @llvm.dbg.declare(metadata ptr %20, metadata !2365, metadata !DIExpression()), !dbg !2366
  store i64 0, ptr %20, align 8, !dbg !2366
  br label %232, !dbg !2367

232:                                              ; preds = %239, %229
  %233 = load ptr, ptr %19, align 8, !dbg !2368
  %234 = load i64, ptr %20, align 8, !dbg !2369
  %235 = getelementptr inbounds i8, ptr %233, i64 %234, !dbg !2368
  %236 = load i8, ptr %235, align 1, !dbg !2368
  %237 = sext i8 %236 to i32, !dbg !2368
  %238 = icmp ne i32 %237, 0, !dbg !2370
  br i1 %238, label %239, label %251, !dbg !2367

239:                                              ; preds = %232
  %240 = load ptr, ptr %19, align 8, !dbg !2371
  %241 = load i64, ptr %20, align 8, !dbg !2373
  %242 = getelementptr inbounds i8, ptr %240, i64 %241, !dbg !2371
  %243 = load i8, ptr %242, align 1, !dbg !2371
  %244 = load ptr, ptr %4, align 8, !dbg !2374
  %245 = load i64, ptr %8, align 8, !dbg !2375
  %246 = getelementptr inbounds i8, ptr %244, i64 %245, !dbg !2374
  store i8 %243, ptr %246, align 1, !dbg !2376
  %247 = load i64, ptr %8, align 8, !dbg !2377
  %248 = add i64 %247, 1, !dbg !2377
  store i64 %248, ptr %8, align 8, !dbg !2377
  %249 = load i64, ptr %20, align 8, !dbg !2378
  %250 = add i64 %249, 1, !dbg !2378
  store i64 %250, ptr %20, align 8, !dbg !2378
  br label %232, !dbg !2367, !llvm.loop !2379

251:                                              ; preds = %232
  br label %262, !dbg !2381

252:                                              ; preds = %208
  %253 = load ptr, ptr %5, align 8, !dbg !2382
  %254 = load i64, ptr %7, align 8, !dbg !2384
  %255 = getelementptr inbounds i8, ptr %253, i64 %254, !dbg !2382
  %256 = load i8, ptr %255, align 1, !dbg !2382
  %257 = load ptr, ptr %4, align 8, !dbg !2385
  %258 = load i64, ptr %8, align 8, !dbg !2386
  %259 = getelementptr inbounds i8, ptr %257, i64 %258, !dbg !2385
  store i8 %256, ptr %259, align 1, !dbg !2387
  %260 = load i64, ptr %8, align 8, !dbg !2388
  %261 = add i64 %260, 1, !dbg !2388
  store i64 %261, ptr %8, align 8, !dbg !2388
  br label %262

262:                                              ; preds = %252, %251
  br label %263

263:                                              ; preds = %262, %198
  br label %264

264:                                              ; preds = %263, %176
  br label %265

265:                                              ; preds = %264, %132
  br label %266

266:                                              ; preds = %265, %88
  %267 = load i64, ptr %7, align 8, !dbg !2389
  %268 = add i64 %267, 1, !dbg !2389
  store i64 %268, ptr %7, align 8, !dbg !2389
  br label %281, !dbg !2390

269:                                              ; preds = %28
  %270 = load ptr, ptr %5, align 8, !dbg !2391
  %271 = load i64, ptr %7, align 8, !dbg !2393
  %272 = getelementptr inbounds i8, ptr %270, i64 %271, !dbg !2391
  %273 = load i8, ptr %272, align 1, !dbg !2391
  %274 = load ptr, ptr %4, align 8, !dbg !2394
  %275 = load i64, ptr %8, align 8, !dbg !2395
  %276 = getelementptr inbounds i8, ptr %274, i64 %275, !dbg !2394
  store i8 %273, ptr %276, align 1, !dbg !2396
  %277 = load i64, ptr %7, align 8, !dbg !2397
  %278 = add i64 %277, 1, !dbg !2397
  store i64 %278, ptr %7, align 8, !dbg !2397
  %279 = load i64, ptr %8, align 8, !dbg !2398
  %280 = add i64 %279, 1, !dbg !2398
  store i64 %280, ptr %8, align 8, !dbg !2398
  br label %281

281:                                              ; preds = %269, %266
  br label %21, !dbg !2225, !llvm.loop !2399

282:                                              ; preds = %44, %21
  %283 = load ptr, ptr %4, align 8, !dbg !2401
  %284 = load i64, ptr %8, align 8, !dbg !2402
  %285 = getelementptr inbounds i8, ptr %283, i64 %284, !dbg !2401
  store i8 0, ptr %285, align 1, !dbg !2403
  %286 = load i64, ptr %8, align 8, !dbg !2404
  %287 = trunc i64 %286 to i32, !dbg !2405
  ret i32 %287, !dbg !2406
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__fizzer_model__helper_itoa(i32 noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !2407 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca [32 x i8], align 16
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2411, metadata !DIExpression()), !dbg !2412
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2413, metadata !DIExpression()), !dbg !2414
  store i32 %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2415, metadata !DIExpression()), !dbg !2416
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2417, metadata !DIExpression()), !dbg !2418
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2419, metadata !DIExpression()), !dbg !2420
  store i32 0, ptr %8, align 4, !dbg !2420
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2421, metadata !DIExpression()), !dbg !2422
  store i32 0, ptr %9, align 4, !dbg !2422
  %12 = load i32, ptr %4, align 4, !dbg !2423
  %13 = icmp slt i32 %12, 0, !dbg !2425
  br i1 %13, label %14, label %20, !dbg !2426

14:                                               ; preds = %3
  %15 = load i32, ptr %6, align 4, !dbg !2427
  %16 = icmp eq i32 %15, 10, !dbg !2428
  br i1 %16, label %17, label %20, !dbg !2429

17:                                               ; preds = %14
  store i32 1, ptr %9, align 4, !dbg !2430
  %18 = load i32, ptr %4, align 4, !dbg !2432
  %19 = sub nsw i32 0, %18, !dbg !2433
  store i32 %19, ptr %4, align 4, !dbg !2434
  br label %20, !dbg !2435

20:                                               ; preds = %17, %14, %3
  %21 = load i32, ptr %4, align 4, !dbg !2436
  %22 = icmp eq i32 %21, 0, !dbg !2438
  br i1 %22, label %23, label %28, !dbg !2439

23:                                               ; preds = %20
  %24 = load ptr, ptr %5, align 8, !dbg !2440
  %25 = getelementptr inbounds i8, ptr %24, i64 0, !dbg !2440
  store i8 48, ptr %25, align 1, !dbg !2442
  %26 = load ptr, ptr %5, align 8, !dbg !2443
  %27 = getelementptr inbounds i8, ptr %26, i64 1, !dbg !2443
  store i8 0, ptr %27, align 1, !dbg !2444
  br label %91, !dbg !2445

28:                                               ; preds = %20
  br label %29, !dbg !2446

29:                                               ; preds = %53, %28
  %30 = load i32, ptr %4, align 4, !dbg !2447
  %31 = icmp ne i32 %30, 0, !dbg !2448
  br i1 %31, label %32, label %59, !dbg !2446

32:                                               ; preds = %29
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2449, metadata !DIExpression()), !dbg !2451
  %33 = load i32, ptr %4, align 4, !dbg !2452
  %34 = load i32, ptr %6, align 4, !dbg !2453
  %35 = srem i32 %33, %34, !dbg !2454
  store i32 %35, ptr %10, align 4, !dbg !2451
  %36 = load i32, ptr %10, align 4, !dbg !2455
  %37 = icmp slt i32 %36, 10, !dbg !2457
  br i1 %37, label %38, label %45, !dbg !2458

38:                                               ; preds = %32
  %39 = load i32, ptr %10, align 4, !dbg !2459
  %40 = add nsw i32 48, %39, !dbg !2461
  %41 = trunc i32 %40 to i8, !dbg !2462
  %42 = load i32, ptr %8, align 4, !dbg !2463
  %43 = sext i32 %42 to i64, !dbg !2464
  %44 = getelementptr inbounds [32 x i8], ptr %7, i64 0, i64 %43, !dbg !2464
  store i8 %41, ptr %44, align 1, !dbg !2465
  br label %53, !dbg !2466

45:                                               ; preds = %32
  %46 = load i32, ptr %10, align 4, !dbg !2467
  %47 = sub nsw i32 %46, 10, !dbg !2469
  %48 = add nsw i32 97, %47, !dbg !2470
  %49 = trunc i32 %48 to i8, !dbg !2471
  %50 = load i32, ptr %8, align 4, !dbg !2472
  %51 = sext i32 %50 to i64, !dbg !2473
  %52 = getelementptr inbounds [32 x i8], ptr %7, i64 0, i64 %51, !dbg !2473
  store i8 %49, ptr %52, align 1, !dbg !2474
  br label %53

53:                                               ; preds = %45, %38
  %54 = load i32, ptr %4, align 4, !dbg !2475
  %55 = load i32, ptr %6, align 4, !dbg !2476
  %56 = sdiv i32 %54, %55, !dbg !2477
  store i32 %56, ptr %4, align 4, !dbg !2478
  %57 = load i32, ptr %8, align 4, !dbg !2479
  %58 = add nsw i32 %57, 1, !dbg !2479
  store i32 %58, ptr %8, align 4, !dbg !2479
  br label %29, !dbg !2446, !llvm.loop !2480

59:                                               ; preds = %29
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2482, metadata !DIExpression()), !dbg !2483
  store i32 0, ptr %11, align 4, !dbg !2483
  %60 = load i32, ptr %9, align 4, !dbg !2484
  %61 = icmp ne i32 %60, 0, !dbg !2484
  br i1 %61, label %62, label %69, !dbg !2486

62:                                               ; preds = %59
  %63 = load ptr, ptr %5, align 8, !dbg !2487
  %64 = load i32, ptr %11, align 4, !dbg !2489
  %65 = sext i32 %64 to i64, !dbg !2487
  %66 = getelementptr inbounds i8, ptr %63, i64 %65, !dbg !2487
  store i8 45, ptr %66, align 1, !dbg !2490
  %67 = load i32, ptr %11, align 4, !dbg !2491
  %68 = add nsw i32 %67, 1, !dbg !2491
  store i32 %68, ptr %11, align 4, !dbg !2491
  br label %69, !dbg !2492

69:                                               ; preds = %62, %59
  br label %70, !dbg !2493

70:                                               ; preds = %73, %69
  %71 = load i32, ptr %8, align 4, !dbg !2494
  %72 = icmp sgt i32 %71, 0, !dbg !2495
  br i1 %72, label %73, label %86, !dbg !2493

73:                                               ; preds = %70
  %74 = load i32, ptr %8, align 4, !dbg !2496
  %75 = add nsw i32 %74, -1, !dbg !2496
  store i32 %75, ptr %8, align 4, !dbg !2496
  %76 = load i32, ptr %8, align 4, !dbg !2498
  %77 = sext i32 %76 to i64, !dbg !2499
  %78 = getelementptr inbounds [32 x i8], ptr %7, i64 0, i64 %77, !dbg !2499
  %79 = load i8, ptr %78, align 1, !dbg !2499
  %80 = load ptr, ptr %5, align 8, !dbg !2500
  %81 = load i32, ptr %11, align 4, !dbg !2501
  %82 = sext i32 %81 to i64, !dbg !2500
  %83 = getelementptr inbounds i8, ptr %80, i64 %82, !dbg !2500
  store i8 %79, ptr %83, align 1, !dbg !2502
  %84 = load i32, ptr %11, align 4, !dbg !2503
  %85 = add nsw i32 %84, 1, !dbg !2503
  store i32 %85, ptr %11, align 4, !dbg !2503
  br label %70, !dbg !2493, !llvm.loop !2504

86:                                               ; preds = %70
  %87 = load ptr, ptr %5, align 8, !dbg !2506
  %88 = load i32, ptr %11, align 4, !dbg !2507
  %89 = sext i32 %88 to i64, !dbg !2506
  %90 = getelementptr inbounds i8, ptr %87, i64 %89, !dbg !2506
  store i8 0, ptr %90, align 1, !dbg !2508
  br label %91, !dbg !2509

91:                                               ; preds = %86, %23
  ret void, !dbg !2509
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__vsnprintf(ptr noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !2510 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca [32 x i8], align 16
  %13 = alloca i64, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2523, metadata !DIExpression()), !dbg !2524
  store i64 %1, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2525, metadata !DIExpression()), !dbg !2526
  store ptr %2, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2527, metadata !DIExpression()), !dbg !2528
  store ptr %3, ptr %9, align 8
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2529, metadata !DIExpression()), !dbg !2530
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2531, metadata !DIExpression()), !dbg !2532
  store i64 0, ptr %10, align 8, !dbg !2532
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2533, metadata !DIExpression()), !dbg !2534
  store i64 0, ptr %11, align 8, !dbg !2534
  %18 = load i64, ptr %7, align 8, !dbg !2535
  %19 = icmp eq i64 %18, 0, !dbg !2537
  br i1 %19, label %20, label %21, !dbg !2538

20:                                               ; preds = %4
  store i32 0, ptr %5, align 4, !dbg !2539
  br label %269, !dbg !2539

21:                                               ; preds = %4
  br label %22, !dbg !2541

22:                                               ; preds = %262, %208, %21
  %23 = load ptr, ptr %8, align 8, !dbg !2542
  %24 = load i64, ptr %10, align 8, !dbg !2543
  %25 = getelementptr inbounds i8, ptr %23, i64 %24, !dbg !2542
  %26 = load i8, ptr %25, align 1, !dbg !2542
  %27 = sext i8 %26 to i32, !dbg !2542
  %28 = icmp ne i32 %27, 0, !dbg !2544
  br i1 %28, label %29, label %34, !dbg !2545

29:                                               ; preds = %22
  %30 = load i64, ptr %11, align 8, !dbg !2546
  %31 = load i64, ptr %7, align 8, !dbg !2547
  %32 = sub i64 %31, 1, !dbg !2548
  %33 = icmp ult i64 %30, %32, !dbg !2549
  br label %34

34:                                               ; preds = %29, %22
  %35 = phi i1 [ false, %22 ], [ %33, %29 ], !dbg !2550
  br i1 %35, label %36, label %263, !dbg !2541

36:                                               ; preds = %34
  %37 = load ptr, ptr %8, align 8, !dbg !2551
  %38 = load i64, ptr %10, align 8, !dbg !2554
  %39 = getelementptr inbounds i8, ptr %37, i64 %38, !dbg !2551
  %40 = load i8, ptr %39, align 1, !dbg !2551
  %41 = sext i8 %40 to i32, !dbg !2551
  %42 = icmp eq i32 %41, 37, !dbg !2555
  br i1 %42, label %43, label %250, !dbg !2556

43:                                               ; preds = %36
  %44 = load i64, ptr %10, align 8, !dbg !2557
  %45 = add i64 %44, 1, !dbg !2557
  store i64 %45, ptr %10, align 8, !dbg !2557
  %46 = load ptr, ptr %8, align 8, !dbg !2559
  %47 = load i64, ptr %10, align 8, !dbg !2561
  %48 = getelementptr inbounds i8, ptr %46, i64 %47, !dbg !2559
  %49 = load i8, ptr %48, align 1, !dbg !2559
  %50 = sext i8 %49 to i32, !dbg !2559
  %51 = icmp eq i32 %50, 0, !dbg !2562
  br i1 %51, label %52, label %53, !dbg !2563

52:                                               ; preds = %43
  br label %263, !dbg !2564

53:                                               ; preds = %43
  call void @llvm.dbg.declare(metadata ptr %12, metadata !2566, metadata !DIExpression()), !dbg !2567
  call void @llvm.dbg.declare(metadata ptr %13, metadata !2568, metadata !DIExpression()), !dbg !2569
  store i64 0, ptr %13, align 8, !dbg !2569
  %54 = load ptr, ptr %8, align 8, !dbg !2570
  %55 = load i64, ptr %10, align 8, !dbg !2572
  %56 = getelementptr inbounds i8, ptr %54, i64 %55, !dbg !2570
  %57 = load i8, ptr %56, align 1, !dbg !2570
  %58 = sext i8 %57 to i32, !dbg !2570
  %59 = icmp eq i32 %58, 100, !dbg !2573
  br i1 %59, label %60, label %79, !dbg !2574

60:                                               ; preds = %53
  call void @llvm.dbg.declare(metadata ptr %14, metadata !2575, metadata !DIExpression()), !dbg !2577
  %61 = load ptr, ptr %9, align 8, !dbg !2578
  %62 = getelementptr inbounds %struct.__va_list_tag, ptr %61, i32 0, i32 0, !dbg !2578
  %63 = load i32, ptr %62, align 8, !dbg !2578
  %64 = icmp ule i32 %63, 40, !dbg !2578
  br i1 %64, label %65, label %70, !dbg !2578

65:                                               ; preds = %60
  %66 = getelementptr inbounds %struct.__va_list_tag, ptr %61, i32 0, i32 3, !dbg !2578
  %67 = load ptr, ptr %66, align 8, !dbg !2578
  %68 = getelementptr i8, ptr %67, i32 %63, !dbg !2578
  %69 = add i32 %63, 8, !dbg !2578
  store i32 %69, ptr %62, align 8, !dbg !2578
  br label %74, !dbg !2578

70:                                               ; preds = %60
  %71 = getelementptr inbounds %struct.__va_list_tag, ptr %61, i32 0, i32 2, !dbg !2578
  %72 = load ptr, ptr %71, align 8, !dbg !2578
  %73 = getelementptr i8, ptr %72, i32 8, !dbg !2578
  store ptr %73, ptr %71, align 8, !dbg !2578
  br label %74, !dbg !2578

74:                                               ; preds = %70, %65
  %75 = phi ptr [ %68, %65 ], [ %72, %70 ], !dbg !2578
  %76 = load i32, ptr %75, align 4, !dbg !2578
  store i32 %76, ptr %14, align 4, !dbg !2577
  %77 = load i32, ptr %14, align 4, !dbg !2579
  %78 = getelementptr inbounds [32 x i8], ptr %12, i64 0, i64 0, !dbg !2580
  call void @__fizzer_model__helper_itoa(i32 noundef %77, ptr noundef %78, i32 noundef 10), !dbg !2581
  br label %222, !dbg !2582

79:                                               ; preds = %53
  %80 = load ptr, ptr %8, align 8, !dbg !2583
  %81 = load i64, ptr %10, align 8, !dbg !2585
  %82 = getelementptr inbounds i8, ptr %80, i64 %81, !dbg !2583
  %83 = load i8, ptr %82, align 1, !dbg !2583
  %84 = sext i8 %83 to i32, !dbg !2583
  %85 = icmp eq i32 %84, 117, !dbg !2586
  br i1 %85, label %86, label %105, !dbg !2587

86:                                               ; preds = %79
  call void @llvm.dbg.declare(metadata ptr %15, metadata !2588, metadata !DIExpression()), !dbg !2590
  %87 = load ptr, ptr %9, align 8, !dbg !2591
  %88 = getelementptr inbounds %struct.__va_list_tag, ptr %87, i32 0, i32 0, !dbg !2591
  %89 = load i32, ptr %88, align 8, !dbg !2591
  %90 = icmp ule i32 %89, 40, !dbg !2591
  br i1 %90, label %91, label %96, !dbg !2591

91:                                               ; preds = %86
  %92 = getelementptr inbounds %struct.__va_list_tag, ptr %87, i32 0, i32 3, !dbg !2591
  %93 = load ptr, ptr %92, align 8, !dbg !2591
  %94 = getelementptr i8, ptr %93, i32 %89, !dbg !2591
  %95 = add i32 %89, 8, !dbg !2591
  store i32 %95, ptr %88, align 8, !dbg !2591
  br label %100, !dbg !2591

96:                                               ; preds = %86
  %97 = getelementptr inbounds %struct.__va_list_tag, ptr %87, i32 0, i32 2, !dbg !2591
  %98 = load ptr, ptr %97, align 8, !dbg !2591
  %99 = getelementptr i8, ptr %98, i32 8, !dbg !2591
  store ptr %99, ptr %97, align 8, !dbg !2591
  br label %100, !dbg !2591

100:                                              ; preds = %96, %91
  %101 = phi ptr [ %94, %91 ], [ %98, %96 ], !dbg !2591
  %102 = load i32, ptr %101, align 4, !dbg !2591
  store i32 %102, ptr %15, align 4, !dbg !2590
  %103 = load i32, ptr %15, align 4, !dbg !2592
  %104 = getelementptr inbounds [32 x i8], ptr %12, i64 0, i64 0, !dbg !2593
  call void @__fizzer_model__helper_itoa(i32 noundef %103, ptr noundef %104, i32 noundef 10), !dbg !2594
  br label %221, !dbg !2595

105:                                              ; preds = %79
  %106 = load ptr, ptr %8, align 8, !dbg !2596
  %107 = load i64, ptr %10, align 8, !dbg !2598
  %108 = getelementptr inbounds i8, ptr %106, i64 %107, !dbg !2596
  %109 = load i8, ptr %108, align 1, !dbg !2596
  %110 = sext i8 %109 to i32, !dbg !2596
  %111 = icmp eq i32 %110, 120, !dbg !2599
  br i1 %111, label %112, label %131, !dbg !2600

112:                                              ; preds = %105
  call void @llvm.dbg.declare(metadata ptr %16, metadata !2601, metadata !DIExpression()), !dbg !2603
  %113 = load ptr, ptr %9, align 8, !dbg !2604
  %114 = getelementptr inbounds %struct.__va_list_tag, ptr %113, i32 0, i32 0, !dbg !2604
  %115 = load i32, ptr %114, align 8, !dbg !2604
  %116 = icmp ule i32 %115, 40, !dbg !2604
  br i1 %116, label %117, label %122, !dbg !2604

117:                                              ; preds = %112
  %118 = getelementptr inbounds %struct.__va_list_tag, ptr %113, i32 0, i32 3, !dbg !2604
  %119 = load ptr, ptr %118, align 8, !dbg !2604
  %120 = getelementptr i8, ptr %119, i32 %115, !dbg !2604
  %121 = add i32 %115, 8, !dbg !2604
  store i32 %121, ptr %114, align 8, !dbg !2604
  br label %126, !dbg !2604

122:                                              ; preds = %112
  %123 = getelementptr inbounds %struct.__va_list_tag, ptr %113, i32 0, i32 2, !dbg !2604
  %124 = load ptr, ptr %123, align 8, !dbg !2604
  %125 = getelementptr i8, ptr %124, i32 8, !dbg !2604
  store ptr %125, ptr %123, align 8, !dbg !2604
  br label %126, !dbg !2604

126:                                              ; preds = %122, %117
  %127 = phi ptr [ %120, %117 ], [ %124, %122 ], !dbg !2604
  %128 = load i32, ptr %127, align 4, !dbg !2604
  store i32 %128, ptr %16, align 4, !dbg !2603
  %129 = load i32, ptr %16, align 4, !dbg !2605
  %130 = getelementptr inbounds [32 x i8], ptr %12, i64 0, i64 0, !dbg !2606
  call void @__fizzer_model__helper_itoa(i32 noundef %129, ptr noundef %130, i32 noundef 16), !dbg !2607
  br label %220, !dbg !2608

131:                                              ; preds = %105
  %132 = load ptr, ptr %8, align 8, !dbg !2609
  %133 = load i64, ptr %10, align 8, !dbg !2611
  %134 = getelementptr inbounds i8, ptr %132, i64 %133, !dbg !2609
  %135 = load i8, ptr %134, align 1, !dbg !2609
  %136 = sext i8 %135 to i32, !dbg !2609
  %137 = icmp eq i32 %136, 99, !dbg !2612
  br i1 %137, label %138, label %158, !dbg !2613

138:                                              ; preds = %131
  %139 = load ptr, ptr %9, align 8, !dbg !2614
  %140 = getelementptr inbounds %struct.__va_list_tag, ptr %139, i32 0, i32 0, !dbg !2614
  %141 = load i32, ptr %140, align 8, !dbg !2614
  %142 = icmp ule i32 %141, 40, !dbg !2614
  br i1 %142, label %143, label %148, !dbg !2614

143:                                              ; preds = %138
  %144 = getelementptr inbounds %struct.__va_list_tag, ptr %139, i32 0, i32 3, !dbg !2614
  %145 = load ptr, ptr %144, align 8, !dbg !2614
  %146 = getelementptr i8, ptr %145, i32 %141, !dbg !2614
  %147 = add i32 %141, 8, !dbg !2614
  store i32 %147, ptr %140, align 8, !dbg !2614
  br label %152, !dbg !2614

148:                                              ; preds = %138
  %149 = getelementptr inbounds %struct.__va_list_tag, ptr %139, i32 0, i32 2, !dbg !2614
  %150 = load ptr, ptr %149, align 8, !dbg !2614
  %151 = getelementptr i8, ptr %150, i32 8, !dbg !2614
  store ptr %151, ptr %149, align 8, !dbg !2614
  br label %152, !dbg !2614

152:                                              ; preds = %148, %143
  %153 = phi ptr [ %146, %143 ], [ %150, %148 ], !dbg !2614
  %154 = load i32, ptr %153, align 4, !dbg !2614
  %155 = trunc i32 %154 to i8, !dbg !2616
  %156 = getelementptr inbounds [32 x i8], ptr %12, i64 0, i64 0, !dbg !2617
  store i8 %155, ptr %156, align 16, !dbg !2618
  %157 = getelementptr inbounds [32 x i8], ptr %12, i64 0, i64 1, !dbg !2619
  store i8 0, ptr %157, align 1, !dbg !2620
  br label %219, !dbg !2621

158:                                              ; preds = %131
  %159 = load ptr, ptr %8, align 8, !dbg !2622
  %160 = load i64, ptr %10, align 8, !dbg !2624
  %161 = getelementptr inbounds i8, ptr %159, i64 %160, !dbg !2622
  %162 = load i8, ptr %161, align 1, !dbg !2622
  %163 = sext i8 %162 to i32, !dbg !2622
  %164 = icmp eq i32 %163, 115, !dbg !2625
  br i1 %164, label %165, label %211, !dbg !2626

165:                                              ; preds = %158
  call void @llvm.dbg.declare(metadata ptr %17, metadata !2627, metadata !DIExpression()), !dbg !2629
  %166 = load ptr, ptr %9, align 8, !dbg !2630
  %167 = getelementptr inbounds %struct.__va_list_tag, ptr %166, i32 0, i32 0, !dbg !2630
  %168 = load i32, ptr %167, align 8, !dbg !2630
  %169 = icmp ule i32 %168, 40, !dbg !2630
  br i1 %169, label %170, label %175, !dbg !2630

170:                                              ; preds = %165
  %171 = getelementptr inbounds %struct.__va_list_tag, ptr %166, i32 0, i32 3, !dbg !2630
  %172 = load ptr, ptr %171, align 8, !dbg !2630
  %173 = getelementptr i8, ptr %172, i32 %168, !dbg !2630
  %174 = add i32 %168, 8, !dbg !2630
  store i32 %174, ptr %167, align 8, !dbg !2630
  br label %179, !dbg !2630

175:                                              ; preds = %165
  %176 = getelementptr inbounds %struct.__va_list_tag, ptr %166, i32 0, i32 2, !dbg !2630
  %177 = load ptr, ptr %176, align 8, !dbg !2630
  %178 = getelementptr i8, ptr %177, i32 8, !dbg !2630
  store ptr %178, ptr %176, align 8, !dbg !2630
  br label %179, !dbg !2630

179:                                              ; preds = %175, %170
  %180 = phi ptr [ %173, %170 ], [ %177, %175 ], !dbg !2630
  %181 = load ptr, ptr %180, align 8, !dbg !2630
  store ptr %181, ptr %17, align 8, !dbg !2629
  store i64 0, ptr %13, align 8, !dbg !2631
  br label %182, !dbg !2632

182:                                              ; preds = %196, %179
  %183 = load ptr, ptr %17, align 8, !dbg !2633
  %184 = load i64, ptr %13, align 8, !dbg !2634
  %185 = getelementptr inbounds i8, ptr %183, i64 %184, !dbg !2633
  %186 = load i8, ptr %185, align 1, !dbg !2633
  %187 = sext i8 %186 to i32, !dbg !2633
  %188 = icmp ne i32 %187, 0, !dbg !2635
  br i1 %188, label %189, label %194, !dbg !2636

189:                                              ; preds = %182
  %190 = load i64, ptr %11, align 8, !dbg !2637
  %191 = load i64, ptr %7, align 8, !dbg !2638
  %192 = sub i64 %191, 1, !dbg !2639
  %193 = icmp ult i64 %190, %192, !dbg !2640
  br label %194

194:                                              ; preds = %189, %182
  %195 = phi i1 [ false, %182 ], [ %193, %189 ], !dbg !2641
  br i1 %195, label %196, label %208, !dbg !2632

196:                                              ; preds = %194
  %197 = load ptr, ptr %17, align 8, !dbg !2642
  %198 = load i64, ptr %13, align 8, !dbg !2644
  %199 = getelementptr inbounds i8, ptr %197, i64 %198, !dbg !2642
  %200 = load i8, ptr %199, align 1, !dbg !2642
  %201 = load ptr, ptr %6, align 8, !dbg !2645
  %202 = load i64, ptr %11, align 8, !dbg !2646
  %203 = getelementptr inbounds i8, ptr %201, i64 %202, !dbg !2645
  store i8 %200, ptr %203, align 1, !dbg !2647
  %204 = load i64, ptr %11, align 8, !dbg !2648
  %205 = add i64 %204, 1, !dbg !2648
  store i64 %205, ptr %11, align 8, !dbg !2648
  %206 = load i64, ptr %13, align 8, !dbg !2649
  %207 = add i64 %206, 1, !dbg !2649
  store i64 %207, ptr %13, align 8, !dbg !2649
  br label %182, !dbg !2632, !llvm.loop !2650

208:                                              ; preds = %194
  %209 = load i64, ptr %10, align 8, !dbg !2652
  %210 = add i64 %209, 1, !dbg !2652
  store i64 %210, ptr %10, align 8, !dbg !2652
  br label %22, !dbg !2653, !llvm.loop !2654

211:                                              ; preds = %158
  %212 = load ptr, ptr %8, align 8, !dbg !2656
  %213 = load i64, ptr %10, align 8, !dbg !2658
  %214 = getelementptr inbounds i8, ptr %212, i64 %213, !dbg !2656
  %215 = load i8, ptr %214, align 1, !dbg !2656
  %216 = getelementptr inbounds [32 x i8], ptr %12, i64 0, i64 0, !dbg !2659
  store i8 %215, ptr %216, align 16, !dbg !2660
  %217 = getelementptr inbounds [32 x i8], ptr %12, i64 0, i64 1, !dbg !2661
  store i8 0, ptr %217, align 1, !dbg !2662
  br label %218

218:                                              ; preds = %211
  br label %219

219:                                              ; preds = %218, %152
  br label %220

220:                                              ; preds = %219, %126
  br label %221

221:                                              ; preds = %220, %100
  br label %222

222:                                              ; preds = %221, %74
  store i64 0, ptr %13, align 8, !dbg !2663
  br label %223, !dbg !2664

223:                                              ; preds = %236, %222
  %224 = load i64, ptr %13, align 8, !dbg !2665
  %225 = getelementptr inbounds [32 x i8], ptr %12, i64 0, i64 %224, !dbg !2666
  %226 = load i8, ptr %225, align 1, !dbg !2666
  %227 = sext i8 %226 to i32, !dbg !2666
  %228 = icmp ne i32 %227, 0, !dbg !2667
  br i1 %228, label %229, label %234, !dbg !2668

229:                                              ; preds = %223
  %230 = load i64, ptr %11, align 8, !dbg !2669
  %231 = load i64, ptr %7, align 8, !dbg !2670
  %232 = sub i64 %231, 1, !dbg !2671
  %233 = icmp ult i64 %230, %232, !dbg !2672
  br label %234

234:                                              ; preds = %229, %223
  %235 = phi i1 [ false, %223 ], [ %233, %229 ], !dbg !2673
  br i1 %235, label %236, label %247, !dbg !2664

236:                                              ; preds = %234
  %237 = load i64, ptr %13, align 8, !dbg !2674
  %238 = getelementptr inbounds [32 x i8], ptr %12, i64 0, i64 %237, !dbg !2676
  %239 = load i8, ptr %238, align 1, !dbg !2676
  %240 = load ptr, ptr %6, align 8, !dbg !2677
  %241 = load i64, ptr %11, align 8, !dbg !2678
  %242 = getelementptr inbounds i8, ptr %240, i64 %241, !dbg !2677
  store i8 %239, ptr %242, align 1, !dbg !2679
  %243 = load i64, ptr %11, align 8, !dbg !2680
  %244 = add i64 %243, 1, !dbg !2680
  store i64 %244, ptr %11, align 8, !dbg !2680
  %245 = load i64, ptr %13, align 8, !dbg !2681
  %246 = add i64 %245, 1, !dbg !2681
  store i64 %246, ptr %13, align 8, !dbg !2681
  br label %223, !dbg !2664, !llvm.loop !2682

247:                                              ; preds = %234
  %248 = load i64, ptr %10, align 8, !dbg !2684
  %249 = add i64 %248, 1, !dbg !2684
  store i64 %249, ptr %10, align 8, !dbg !2684
  br label %262, !dbg !2685

250:                                              ; preds = %36
  %251 = load ptr, ptr %8, align 8, !dbg !2686
  %252 = load i64, ptr %10, align 8, !dbg !2688
  %253 = getelementptr inbounds i8, ptr %251, i64 %252, !dbg !2686
  %254 = load i8, ptr %253, align 1, !dbg !2686
  %255 = load ptr, ptr %6, align 8, !dbg !2689
  %256 = load i64, ptr %11, align 8, !dbg !2690
  %257 = getelementptr inbounds i8, ptr %255, i64 %256, !dbg !2689
  store i8 %254, ptr %257, align 1, !dbg !2691
  %258 = load i64, ptr %10, align 8, !dbg !2692
  %259 = add i64 %258, 1, !dbg !2692
  store i64 %259, ptr %10, align 8, !dbg !2692
  %260 = load i64, ptr %11, align 8, !dbg !2693
  %261 = add i64 %260, 1, !dbg !2693
  store i64 %261, ptr %11, align 8, !dbg !2693
  br label %262

262:                                              ; preds = %250, %247
  br label %22, !dbg !2541, !llvm.loop !2654

263:                                              ; preds = %52, %34
  %264 = load ptr, ptr %6, align 8, !dbg !2694
  %265 = load i64, ptr %11, align 8, !dbg !2695
  %266 = getelementptr inbounds i8, ptr %264, i64 %265, !dbg !2694
  store i8 0, ptr %266, align 1, !dbg !2696
  %267 = load i64, ptr %11, align 8, !dbg !2697
  %268 = trunc i64 %267 to i32, !dbg !2698
  store i32 %268, ptr %5, align 4, !dbg !2699
  br label %269, !dbg !2699

269:                                              ; preds = %263, %20
  %270 = load i32, ptr %5, align 4, !dbg !2700
  ret i32 %270, !dbg !2700
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local x86_fp80 @__fizzer_model__fabsl(x86_fp80 noundef %0) #0 !dbg !2701 {
  %2 = alloca x86_fp80, align 16
  %3 = alloca x86_fp80, align 16
  store x86_fp80 %0, ptr %3, align 16
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2706, metadata !DIExpression()), !dbg !2707
  %4 = load x86_fp80, ptr %3, align 16, !dbg !2708
  %5 = fcmp olt x86_fp80 %4, 0xK00000000000000000000, !dbg !2710
  br i1 %5, label %6, label %9, !dbg !2711

6:                                                ; preds = %1
  %7 = load x86_fp80, ptr %3, align 16, !dbg !2712
  %8 = fneg x86_fp80 %7, !dbg !2713
  store x86_fp80 %8, ptr %2, align 16, !dbg !2714
  br label %11, !dbg !2714

9:                                                ; preds = %1
  %10 = load x86_fp80, ptr %3, align 16, !dbg !2715
  store x86_fp80 %10, ptr %2, align 16, !dbg !2716
  br label %11, !dbg !2716

11:                                               ; preds = %9, %6
  %12 = load x86_fp80, ptr %2, align 16, !dbg !2717
  ret x86_fp80 %12, !dbg !2717
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @__fizzer_model__fabs(double noundef %0) #0 !dbg !2718 {
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  store double %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2722, metadata !DIExpression()), !dbg !2723
  %4 = load double, ptr %3, align 8, !dbg !2724
  %5 = fcmp olt double %4, 0.000000e+00, !dbg !2726
  br i1 %5, label %6, label %9, !dbg !2727

6:                                                ; preds = %1
  %7 = load double, ptr %3, align 8, !dbg !2728
  %8 = fneg double %7, !dbg !2729
  store double %8, ptr %2, align 8, !dbg !2730
  br label %11, !dbg !2730

9:                                                ; preds = %1
  %10 = load double, ptr %3, align 8, !dbg !2731
  store double %10, ptr %2, align 8, !dbg !2732
  br label %11, !dbg !2732

11:                                               ; preds = %9, %6
  %12 = load double, ptr %2, align 8, !dbg !2733
  ret double %12, !dbg !2733
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @__fizzer_model__fabsf(float noundef %0) #0 !dbg !2734 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  store float %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2739, metadata !DIExpression()), !dbg !2740
  %4 = load float, ptr %3, align 4, !dbg !2741
  %5 = fcmp olt float %4, 0.000000e+00, !dbg !2743
  br i1 %5, label %6, label %9, !dbg !2744

6:                                                ; preds = %1
  %7 = load float, ptr %3, align 4, !dbg !2745
  %8 = fneg float %7, !dbg !2746
  store float %8, ptr %2, align 4, !dbg !2747
  br label %11, !dbg !2747

9:                                                ; preds = %1
  %10 = load float, ptr %3, align 4, !dbg !2748
  store float %10, ptr %2, align 4, !dbg !2749
  br label %11, !dbg !2749

11:                                               ; preds = %9, %6
  %12 = load float, ptr %2, align 4, !dbg !2750
  ret float %12, !dbg !2750
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__strftime(ptr noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !2751 {
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca [16 x i8], align 16
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2775, metadata !DIExpression()), !dbg !2776
  store i64 %1, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2777, metadata !DIExpression()), !dbg !2778
  store ptr %2, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2779, metadata !DIExpression()), !dbg !2780
  store ptr %3, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2781, metadata !DIExpression()), !dbg !2782
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2783, metadata !DIExpression()), !dbg !2784
  store i64 0, ptr %9, align 8, !dbg !2784
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2785, metadata !DIExpression()), !dbg !2786
  store i64 0, ptr %10, align 8, !dbg !2786
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2787, metadata !DIExpression()), !dbg !2788
  br label %19, !dbg !2789

19:                                               ; preds = %184, %4
  %20 = load ptr, ptr %7, align 8, !dbg !2790
  %21 = load i64, ptr %9, align 8, !dbg !2791
  %22 = getelementptr inbounds i8, ptr %20, i64 %21, !dbg !2790
  %23 = load i8, ptr %22, align 1, !dbg !2790
  %24 = sext i8 %23 to i32, !dbg !2790
  %25 = icmp ne i32 %24, 0, !dbg !2792
  br i1 %25, label %26, label %31, !dbg !2793

26:                                               ; preds = %19
  %27 = load i64, ptr %10, align 8, !dbg !2794
  %28 = load i64, ptr %6, align 8, !dbg !2795
  %29 = sub i64 %28, 1, !dbg !2796
  %30 = icmp ult i64 %27, %29, !dbg !2797
  br label %31

31:                                               ; preds = %26, %19
  %32 = phi i1 [ false, %19 ], [ %30, %26 ], !dbg !2798
  br i1 %32, label %33, label %185, !dbg !2789

33:                                               ; preds = %31
  %34 = load ptr, ptr %7, align 8, !dbg !2799
  %35 = load i64, ptr %9, align 8, !dbg !2802
  %36 = getelementptr inbounds i8, ptr %34, i64 %35, !dbg !2799
  %37 = load i8, ptr %36, align 1, !dbg !2799
  %38 = sext i8 %37 to i32, !dbg !2799
  %39 = icmp eq i32 %38, 37, !dbg !2803
  br i1 %39, label %40, label %172, !dbg !2804

40:                                               ; preds = %33
  %41 = load i64, ptr %9, align 8, !dbg !2805
  %42 = add i64 %41, 1, !dbg !2805
  store i64 %42, ptr %9, align 8, !dbg !2805
  %43 = load ptr, ptr %7, align 8, !dbg !2807
  %44 = load i64, ptr %9, align 8, !dbg !2809
  %45 = getelementptr inbounds i8, ptr %43, i64 %44, !dbg !2807
  %46 = load i8, ptr %45, align 1, !dbg !2807
  %47 = sext i8 %46 to i32, !dbg !2807
  %48 = icmp eq i32 %47, 0, !dbg !2810
  br i1 %48, label %49, label %50, !dbg !2811

49:                                               ; preds = %40
  br label %185, !dbg !2812

50:                                               ; preds = %40
  call void @llvm.dbg.declare(metadata ptr %12, metadata !2814, metadata !DIExpression()), !dbg !2815
  store i32 0, ptr %12, align 4, !dbg !2815
  %51 = load ptr, ptr %7, align 8, !dbg !2816
  %52 = load i64, ptr %9, align 8, !dbg !2818
  %53 = getelementptr inbounds i8, ptr %51, i64 %52, !dbg !2816
  %54 = load i8, ptr %53, align 1, !dbg !2816
  %55 = sext i8 %54 to i32, !dbg !2816
  %56 = icmp eq i32 %55, 89, !dbg !2819
  br i1 %56, label %57, label %64, !dbg !2820

57:                                               ; preds = %50
  call void @llvm.dbg.declare(metadata ptr %13, metadata !2821, metadata !DIExpression()), !dbg !2823
  %58 = load ptr, ptr %8, align 8, !dbg !2824
  %59 = getelementptr inbounds %struct.tm, ptr %58, i32 0, i32 5, !dbg !2825
  %60 = load i32, ptr %59, align 4, !dbg !2825
  %61 = add nsw i32 1900, %60, !dbg !2826
  store i32 %61, ptr %13, align 4, !dbg !2823
  %62 = load i32, ptr %13, align 4, !dbg !2827
  %63 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 0, !dbg !2828
  call void @__fizzer_model__helper_itoa(i32 noundef %62, ptr noundef %63, i32 noundef 10), !dbg !2829
  br label %142, !dbg !2830

64:                                               ; preds = %50
  %65 = load ptr, ptr %7, align 8, !dbg !2831
  %66 = load i64, ptr %9, align 8, !dbg !2833
  %67 = getelementptr inbounds i8, ptr %65, i64 %66, !dbg !2831
  %68 = load i8, ptr %67, align 1, !dbg !2831
  %69 = sext i8 %68 to i32, !dbg !2831
  %70 = icmp eq i32 %69, 109, !dbg !2834
  br i1 %70, label %71, label %78, !dbg !2835

71:                                               ; preds = %64
  call void @llvm.dbg.declare(metadata ptr %14, metadata !2836, metadata !DIExpression()), !dbg !2838
  %72 = load ptr, ptr %8, align 8, !dbg !2839
  %73 = getelementptr inbounds %struct.tm, ptr %72, i32 0, i32 4, !dbg !2840
  %74 = load i32, ptr %73, align 8, !dbg !2840
  %75 = add nsw i32 %74, 1, !dbg !2841
  store i32 %75, ptr %14, align 4, !dbg !2838
  %76 = load i32, ptr %14, align 4, !dbg !2842
  %77 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 0, !dbg !2843
  call void @__fizzer_model__helper_itoa(i32 noundef %76, ptr noundef %77, i32 noundef 10), !dbg !2844
  br label %141, !dbg !2845

78:                                               ; preds = %64
  %79 = load ptr, ptr %7, align 8, !dbg !2846
  %80 = load i64, ptr %9, align 8, !dbg !2848
  %81 = getelementptr inbounds i8, ptr %79, i64 %80, !dbg !2846
  %82 = load i8, ptr %81, align 1, !dbg !2846
  %83 = sext i8 %82 to i32, !dbg !2846
  %84 = icmp eq i32 %83, 100, !dbg !2849
  br i1 %84, label %85, label %91, !dbg !2850

85:                                               ; preds = %78
  call void @llvm.dbg.declare(metadata ptr %15, metadata !2851, metadata !DIExpression()), !dbg !2853
  %86 = load ptr, ptr %8, align 8, !dbg !2854
  %87 = getelementptr inbounds %struct.tm, ptr %86, i32 0, i32 3, !dbg !2855
  %88 = load i32, ptr %87, align 4, !dbg !2855
  store i32 %88, ptr %15, align 4, !dbg !2853
  %89 = load i32, ptr %15, align 4, !dbg !2856
  %90 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 0, !dbg !2857
  call void @__fizzer_model__helper_itoa(i32 noundef %89, ptr noundef %90, i32 noundef 10), !dbg !2858
  br label %140, !dbg !2859

91:                                               ; preds = %78
  %92 = load ptr, ptr %7, align 8, !dbg !2860
  %93 = load i64, ptr %9, align 8, !dbg !2862
  %94 = getelementptr inbounds i8, ptr %92, i64 %93, !dbg !2860
  %95 = load i8, ptr %94, align 1, !dbg !2860
  %96 = sext i8 %95 to i32, !dbg !2860
  %97 = icmp eq i32 %96, 72, !dbg !2863
  br i1 %97, label %98, label %104, !dbg !2864

98:                                               ; preds = %91
  call void @llvm.dbg.declare(metadata ptr %16, metadata !2865, metadata !DIExpression()), !dbg !2867
  %99 = load ptr, ptr %8, align 8, !dbg !2868
  %100 = getelementptr inbounds %struct.tm, ptr %99, i32 0, i32 2, !dbg !2869
  %101 = load i32, ptr %100, align 8, !dbg !2869
  store i32 %101, ptr %16, align 4, !dbg !2867
  %102 = load i32, ptr %16, align 4, !dbg !2870
  %103 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 0, !dbg !2871
  call void @__fizzer_model__helper_itoa(i32 noundef %102, ptr noundef %103, i32 noundef 10), !dbg !2872
  br label %139, !dbg !2873

104:                                              ; preds = %91
  %105 = load ptr, ptr %7, align 8, !dbg !2874
  %106 = load i64, ptr %9, align 8, !dbg !2876
  %107 = getelementptr inbounds i8, ptr %105, i64 %106, !dbg !2874
  %108 = load i8, ptr %107, align 1, !dbg !2874
  %109 = sext i8 %108 to i32, !dbg !2874
  %110 = icmp eq i32 %109, 77, !dbg !2877
  br i1 %110, label %111, label %117, !dbg !2878

111:                                              ; preds = %104
  call void @llvm.dbg.declare(metadata ptr %17, metadata !2879, metadata !DIExpression()), !dbg !2881
  %112 = load ptr, ptr %8, align 8, !dbg !2882
  %113 = getelementptr inbounds %struct.tm, ptr %112, i32 0, i32 1, !dbg !2883
  %114 = load i32, ptr %113, align 4, !dbg !2883
  store i32 %114, ptr %17, align 4, !dbg !2881
  %115 = load i32, ptr %17, align 4, !dbg !2884
  %116 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 0, !dbg !2885
  call void @__fizzer_model__helper_itoa(i32 noundef %115, ptr noundef %116, i32 noundef 10), !dbg !2886
  br label %138, !dbg !2887

117:                                              ; preds = %104
  %118 = load ptr, ptr %7, align 8, !dbg !2888
  %119 = load i64, ptr %9, align 8, !dbg !2890
  %120 = getelementptr inbounds i8, ptr %118, i64 %119, !dbg !2888
  %121 = load i8, ptr %120, align 1, !dbg !2888
  %122 = sext i8 %121 to i32, !dbg !2888
  %123 = icmp eq i32 %122, 83, !dbg !2891
  br i1 %123, label %124, label %130, !dbg !2892

124:                                              ; preds = %117
  call void @llvm.dbg.declare(metadata ptr %18, metadata !2893, metadata !DIExpression()), !dbg !2895
  %125 = load ptr, ptr %8, align 8, !dbg !2896
  %126 = getelementptr inbounds %struct.tm, ptr %125, i32 0, i32 0, !dbg !2897
  %127 = load i32, ptr %126, align 8, !dbg !2897
  store i32 %127, ptr %18, align 4, !dbg !2895
  %128 = load i32, ptr %18, align 4, !dbg !2898
  %129 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 0, !dbg !2899
  call void @__fizzer_model__helper_itoa(i32 noundef %128, ptr noundef %129, i32 noundef 10), !dbg !2900
  br label %137, !dbg !2901

130:                                              ; preds = %117
  %131 = load ptr, ptr %7, align 8, !dbg !2902
  %132 = load i64, ptr %9, align 8, !dbg !2904
  %133 = getelementptr inbounds i8, ptr %131, i64 %132, !dbg !2902
  %134 = load i8, ptr %133, align 1, !dbg !2902
  %135 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 0, !dbg !2905
  store i8 %134, ptr %135, align 16, !dbg !2906
  %136 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 1, !dbg !2907
  store i8 0, ptr %136, align 1, !dbg !2908
  br label %137

137:                                              ; preds = %130, %124
  br label %138

138:                                              ; preds = %137, %111
  br label %139

139:                                              ; preds = %138, %98
  br label %140

140:                                              ; preds = %139, %85
  br label %141

141:                                              ; preds = %140, %71
  br label %142

142:                                              ; preds = %141, %57
  store i32 0, ptr %12, align 4, !dbg !2909
  br label %143, !dbg !2910

143:                                              ; preds = %157, %142
  %144 = load i32, ptr %12, align 4, !dbg !2911
  %145 = sext i32 %144 to i64, !dbg !2912
  %146 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 %145, !dbg !2912
  %147 = load i8, ptr %146, align 1, !dbg !2912
  %148 = sext i8 %147 to i32, !dbg !2912
  %149 = icmp ne i32 %148, 0, !dbg !2913
  br i1 %149, label %150, label %155, !dbg !2914

150:                                              ; preds = %143
  %151 = load i64, ptr %10, align 8, !dbg !2915
  %152 = load i64, ptr %6, align 8, !dbg !2916
  %153 = sub i64 %152, 1, !dbg !2917
  %154 = icmp ult i64 %151, %153, !dbg !2918
  br label %155

155:                                              ; preds = %150, %143
  %156 = phi i1 [ false, %143 ], [ %154, %150 ], !dbg !2919
  br i1 %156, label %157, label %169, !dbg !2910

157:                                              ; preds = %155
  %158 = load i32, ptr %12, align 4, !dbg !2920
  %159 = sext i32 %158 to i64, !dbg !2922
  %160 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 %159, !dbg !2922
  %161 = load i8, ptr %160, align 1, !dbg !2922
  %162 = load ptr, ptr %5, align 8, !dbg !2923
  %163 = load i64, ptr %10, align 8, !dbg !2924
  %164 = getelementptr inbounds i8, ptr %162, i64 %163, !dbg !2923
  store i8 %161, ptr %164, align 1, !dbg !2925
  %165 = load i64, ptr %10, align 8, !dbg !2926
  %166 = add i64 %165, 1, !dbg !2926
  store i64 %166, ptr %10, align 8, !dbg !2926
  %167 = load i32, ptr %12, align 4, !dbg !2927
  %168 = add nsw i32 %167, 1, !dbg !2927
  store i32 %168, ptr %12, align 4, !dbg !2927
  br label %143, !dbg !2910, !llvm.loop !2928

169:                                              ; preds = %155
  %170 = load i64, ptr %9, align 8, !dbg !2930
  %171 = add i64 %170, 1, !dbg !2930
  store i64 %171, ptr %9, align 8, !dbg !2930
  br label %184, !dbg !2931

172:                                              ; preds = %33
  %173 = load ptr, ptr %7, align 8, !dbg !2932
  %174 = load i64, ptr %9, align 8, !dbg !2934
  %175 = getelementptr inbounds i8, ptr %173, i64 %174, !dbg !2932
  %176 = load i8, ptr %175, align 1, !dbg !2932
  %177 = load ptr, ptr %5, align 8, !dbg !2935
  %178 = load i64, ptr %10, align 8, !dbg !2936
  %179 = getelementptr inbounds i8, ptr %177, i64 %178, !dbg !2935
  store i8 %176, ptr %179, align 1, !dbg !2937
  %180 = load i64, ptr %9, align 8, !dbg !2938
  %181 = add i64 %180, 1, !dbg !2938
  store i64 %181, ptr %9, align 8, !dbg !2938
  %182 = load i64, ptr %10, align 8, !dbg !2939
  %183 = add i64 %182, 1, !dbg !2939
  store i64 %183, ptr %10, align 8, !dbg !2939
  br label %184

184:                                              ; preds = %172, %169
  br label %19, !dbg !2789, !llvm.loop !2940

185:                                              ; preds = %49, %31
  %186 = load ptr, ptr %5, align 8, !dbg !2942
  %187 = load i64, ptr %10, align 8, !dbg !2943
  %188 = getelementptr inbounds i8, ptr %186, i64 %187, !dbg !2942
  store i8 0, ptr %188, align 1, !dbg !2944
  %189 = load i64, ptr %10, align 8, !dbg !2945
  ret i64 %189, !dbg !2946
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__ctime(ptr noundef %0, ptr noundef %1) #0 !dbg !2947 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca [26 x i8], align 16
  %6 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2955, metadata !DIExpression()), !dbg !2956
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2957, metadata !DIExpression()), !dbg !2958
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2959, metadata !DIExpression()), !dbg !2961
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %5, ptr align 16 @__const.__fizzer_model__ctime.template, i64 26, i1 false), !dbg !2961
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2962, metadata !DIExpression()), !dbg !2964
  store i64 0, ptr %6, align 8, !dbg !2964
  br label %7, !dbg !2965

7:                                                ; preds = %13, %2
  %8 = load i64, ptr %6, align 8, !dbg !2966
  %9 = getelementptr inbounds [26 x i8], ptr %5, i64 0, i64 %8, !dbg !2967
  %10 = load i8, ptr %9, align 1, !dbg !2967
  %11 = sext i8 %10 to i32, !dbg !2967
  %12 = icmp ne i32 %11, 0, !dbg !2968
  br i1 %12, label %13, label %22, !dbg !2965

13:                                               ; preds = %7
  %14 = load i64, ptr %6, align 8, !dbg !2969
  %15 = getelementptr inbounds [26 x i8], ptr %5, i64 0, i64 %14, !dbg !2971
  %16 = load i8, ptr %15, align 1, !dbg !2971
  %17 = load ptr, ptr %4, align 8, !dbg !2972
  %18 = load i64, ptr %6, align 8, !dbg !2973
  %19 = getelementptr inbounds i8, ptr %17, i64 %18, !dbg !2972
  store i8 %16, ptr %19, align 1, !dbg !2974
  %20 = load i64, ptr %6, align 8, !dbg !2975
  %21 = add i64 %20, 1, !dbg !2975
  store i64 %21, ptr %6, align 8, !dbg !2975
  br label %7, !dbg !2965, !llvm.loop !2976

22:                                               ; preds = %7
  %23 = load ptr, ptr %4, align 8, !dbg !2978
  %24 = load i64, ptr %6, align 8, !dbg !2979
  %25 = getelementptr inbounds i8, ptr %23, i64 %24, !dbg !2978
  store i8 0, ptr %25, align 1, !dbg !2980
  %26 = load ptr, ptr %4, align 8, !dbg !2981
  ret ptr %26, !dbg !2982
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.dbg.cu = !{!2, !78, !9, !81, !17, !23, !83, !85, !89, !91, !93, !95, !98, !100, !102, !104, !106, !108, !110, !112, !114, !118, !120, !123, !126, !128, !130, !132, !33, !134, !140, !75, !142, !144, !146, !148, !150, !152, !154, !156, !158, !160, !162, !164, !166, !168, !170, !172, !174, !177, !179, !181, !183, !185, !187, !189}
!llvm.module.flags = !{!191, !192, !193, !194, !195, !196, !197}
!llvm.ident = !{!198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198, !198}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__fizzer_model__optind", scope: !2, file: !5, line: 2, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/posix/optind.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "945fcb2626293b869626e4030b5152b8")
!4 = !{!0}
!5 = !DIFile(filename: "data/models/c/posix/optind.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "945fcb2626293b869626e4030b5152b8")
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "__fizzer_model__optarg", scope: !9, file: !12, line: 2, type: !13, isLocal: false, isDefinition: true)
!9 = distinct !DICompileUnit(language: DW_LANG_C11, file: !10, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !11, splitDebugInlining: false, nameTableKind: None)
!10 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/posix/optarg.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "86f072807e2e2c68c2fb011600ba3f42")
!11 = !{!7}
!12 = !DIFile(filename: "data/models/c/posix/optarg.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "86f072807e2e2c68c2fb011600ba3f42")
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "__fizzer_model__opterr", scope: !17, file: !20, line: 2, type: !6, isLocal: false, isDefinition: true)
!17 = distinct !DICompileUnit(language: DW_LANG_C11, file: !18, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !19, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/posix/opterr.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "57845018c21837129253ce8b28765272")
!19 = !{!15}
!20 = !DIFile(filename: "data/models/c/posix/opterr.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "57845018c21837129253ce8b28765272")
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "__fizzer_model__optopt", scope: !23, file: !26, line: 2, type: !6, isLocal: false, isDefinition: true)
!23 = distinct !DICompileUnit(language: DW_LANG_C11, file: !24, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !25, splitDebugInlining: false, nameTableKind: None)
!24 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/posix/optopt.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "6320db8dd870df7aa889229ce0d9119f")
!25 = !{!21}
!26 = !DIFile(filename: "data/models/c/posix/optopt.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "6320db8dd870df7aa889229ce0d9119f")
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "unknown", scope: !29, file: !30, line: 5, type: !64, isLocal: true, isDefinition: true)
!29 = distinct !DISubprogram(name: "__fizzer_model__strerror", scope: !30, file: !30, line: 2, type: !31, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !63)
!30 = !DIFile(filename: "data/models/c/std/string/strerror.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "cbe05e12c04cb8edbc875d57698a462d")
!31 = !DISubroutineType(types: !32)
!32 = !{!13, !6}
!33 = distinct !DICompileUnit(language: DW_LANG_C11, file: !34, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !35, splitDebugInlining: false, nameTableKind: None)
!34 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/string/strerror.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "cbe05e12c04cb8edbc875d57698a462d")
!35 = !{!27, !36, !41, !46, !51, !56, !58}
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(scope: null, file: !30, line: 11, type: !38, isLocal: true, isDefinition: true)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 72, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 9)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(scope: null, file: !30, line: 13, type: !43, isLocal: true, isDefinition: true)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 192, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 24)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(scope: null, file: !30, line: 15, type: !48, isLocal: true, isDefinition: true)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 208, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 26)
!51 = !DIGlobalVariableExpression(var: !52, expr: !DIExpression())
!52 = distinct !DIGlobalVariable(scope: null, file: !30, line: 17, type: !53, isLocal: true, isDefinition: true)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 128, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 16)
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(scope: null, file: !30, line: 19, type: !43, isLocal: true, isDefinition: true)
!58 = !DIGlobalVariableExpression(var: !59, expr: !DIExpression())
!59 = distinct !DIGlobalVariable(scope: null, file: !30, line: 21, type: !60, isLocal: true, isDefinition: true)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 152, elements: !61)
!61 = !{!62}
!62 = !DISubrange(count: 19)
!63 = !{}
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 112, elements: !65)
!65 = !{!66}
!66 = !DISubrange(count: 14)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(name: "next", scope: !69, file: !70, line: 4, type: !13, isLocal: true, isDefinition: true)
!69 = distinct !DISubprogram(name: "__fizzer_model__strtok", scope: !70, file: !70, line: 2, type: !71, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !75, retainedNodes: !63)
!70 = !DIFile(filename: "data/models/c/std/string/strtok.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "d6aa346c784ed4f2c46282113e65161d")
!71 = !DISubroutineType(types: !72)
!72 = !{!13, !13, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!75 = distinct !DICompileUnit(language: DW_LANG_C11, file: !76, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !77, splitDebugInlining: false, nameTableKind: None)
!76 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/string/strtok.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "d6aa346c784ed4f2c46282113e65161d")
!77 = !{!67}
!78 = distinct !DICompileUnit(language: DW_LANG_C11, file: !79, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !80, splitDebugInlining: false, nameTableKind: None)
!79 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/posix/getopt_long.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "de123133f6a530da5006cce09eb75639")
!80 = !{!6}
!81 = distinct !DICompileUnit(language: DW_LANG_C11, file: !82, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!82 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/posix/getopt.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "f654b476831f33a28b3fae574c027426")
!83 = distinct !DICompileUnit(language: DW_LANG_C11, file: !84, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!84 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/stdlib/atoll.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "a20eee9a7568d583fd9ee7193391622b")
!85 = distinct !DICompileUnit(language: DW_LANG_C11, file: !86, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !87, splitDebugInlining: false, nameTableKind: None)
!86 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/stdlib/strtod.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "8af3db33fabf3d592277f51247d76438")
!87 = !{!88, !13}
!88 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!89 = distinct !DICompileUnit(language: DW_LANG_C11, file: !90, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!90 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/stdlib/abs.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "5dc98c96c5261907ed11f631ce472103")
!91 = distinct !DICompileUnit(language: DW_LANG_C11, file: !92, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!92 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/stdlib/labs.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "d0625b0698f9d1196d0b119b4fc84b2d")
!93 = distinct !DICompileUnit(language: DW_LANG_C11, file: !94, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!94 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/stdlib/llabs.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "8095d5dd9527583f176d5d9342463eec")
!95 = distinct !DICompileUnit(language: DW_LANG_C11, file: !96, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !97, splitDebugInlining: false, nameTableKind: None)
!96 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/stdlib/strtol.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "7bd701710373e339d62a1da5b0831766")
!97 = !{!13}
!98 = distinct !DICompileUnit(language: DW_LANG_C11, file: !99, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!99 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/stdlib/atol.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "130864a3e56f877c17dbd6cd172158db")
!100 = distinct !DICompileUnit(language: DW_LANG_C11, file: !101, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !97, splitDebugInlining: false, nameTableKind: None)
!101 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/stdlib/strtoul.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "edaf3dbca4ae2e5ae7dd393d65e176da")
!102 = distinct !DICompileUnit(language: DW_LANG_C11, file: !103, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!103 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/stdlib/atoi.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "25ff8cf0c3b1eb16133d1fa2f6f4599f")
!104 = distinct !DICompileUnit(language: DW_LANG_C11, file: !105, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !97, splitDebugInlining: false, nameTableKind: None)
!105 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/string/strstr.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "88fd7ab45b37086df2d2f42655100238")
!106 = distinct !DICompileUnit(language: DW_LANG_C11, file: !107, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !97, splitDebugInlining: false, nameTableKind: None)
!107 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/string/strpbrk.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "f90ee9e8ce652e3236917e969fe7e0af")
!108 = distinct !DICompileUnit(language: DW_LANG_C11, file: !109, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!109 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/string/strcpy.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "a9d5e5946be9d668420164bcb8d1da5f")
!110 = distinct !DICompileUnit(language: DW_LANG_C11, file: !111, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!111 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/string/strncat.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "1734f838e35184e8c456b32046d1ee07")
!112 = distinct !DICompileUnit(language: DW_LANG_C11, file: !113, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!113 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/string/strcspn.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "2f7cd216c9e6f8edb02d5afb4ea11b44")
!114 = distinct !DICompileUnit(language: DW_LANG_C11, file: !115, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !116, splitDebugInlining: false, nameTableKind: None)
!115 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/string/strcoll.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "594081383e127900a617071ac71187f1")
!116 = !{!6, !117}
!117 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!118 = distinct !DICompileUnit(language: DW_LANG_C11, file: !119, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !116, splitDebugInlining: false, nameTableKind: None)
!119 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/string/strcmp.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "e8d614ef53fc1f2814b3a79a1909aaf7")
!120 = distinct !DICompileUnit(language: DW_LANG_C11, file: !121, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !122, splitDebugInlining: false, nameTableKind: None)
!121 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/string/strncmp.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "e275f67b87d7e3da1256de4308f1f1ce")
!122 = !{!117, !6}
!123 = distinct !DICompileUnit(language: DW_LANG_C11, file: !124, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !125, splitDebugInlining: false, nameTableKind: None)
!124 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/string/strrchr.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "44079aea5c31caec0e42d813448f707f")
!125 = !{!14, !13}
!126 = distinct !DICompileUnit(language: DW_LANG_C11, file: !127, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!127 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/string/strcat.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "8970d2710d3c40f59dab15e8fb2774f9")
!128 = distinct !DICompileUnit(language: DW_LANG_C11, file: !129, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!129 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/string/strspn.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "093bc709c553b9ccbb1565b54017ff4e")
!130 = distinct !DICompileUnit(language: DW_LANG_C11, file: !131, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!131 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/string/strncpy.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "4b1e33fa2c1188492810829cb7ad397c")
!132 = distinct !DICompileUnit(language: DW_LANG_C11, file: !133, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !125, splitDebugInlining: false, nameTableKind: None)
!133 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/string/strchr.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "be78f81f7eb8078306a1616593746c64")
!134 = distinct !DICompileUnit(language: DW_LANG_C11, file: !135, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !136, splitDebugInlining: false, nameTableKind: None)
!135 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/string/memchr.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "eb41c2475f9bcc7c01385e05d30fa3e5")
!136 = !{!137, !117, !139}
!137 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !138, size: 64)
!138 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !117)
!139 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!140 = distinct !DICompileUnit(language: DW_LANG_C11, file: !141, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!141 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/string/strlen.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "02927e422ac203a0e84c9a608c987af4")
!142 = distinct !DICompileUnit(language: DW_LANG_C11, file: !143, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!143 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/string/strxfrm.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "989278973572eb57b2d093785a278add")
!144 = distinct !DICompileUnit(language: DW_LANG_C11, file: !145, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!145 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/ctype/iscntrl.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "1d16fabd886360902b60cd5383ecd536")
!146 = distinct !DICompileUnit(language: DW_LANG_C11, file: !147, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!147 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/ctype/isxdigit.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "0abf049bb725434344eee06d1063bde8")
!148 = distinct !DICompileUnit(language: DW_LANG_C11, file: !149, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!149 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/ctype/isalnum.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "6bbe9a062fcf4ea45225490b0c0403ef")
!150 = distinct !DICompileUnit(language: DW_LANG_C11, file: !151, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!151 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/ctype/isspace.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "9ab9a851c14ac485b9c69b251ca4421f")
!152 = distinct !DICompileUnit(language: DW_LANG_C11, file: !153, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!153 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/ctype/isalpha.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "ec45d1a23298cf8353ee76bfbe3010f4")
!154 = distinct !DICompileUnit(language: DW_LANG_C11, file: !155, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!155 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/ctype/isblank.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "4469204b656f7c8f7e1807d1f4e59567")
!156 = distinct !DICompileUnit(language: DW_LANG_C11, file: !157, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!157 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/ctype/islower.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "7f0db237b2957c408137ff19b95b9f37")
!158 = distinct !DICompileUnit(language: DW_LANG_C11, file: !159, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!159 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/ctype/isdigit.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "9967dfc55f3c5b9e8a34a1c12ab51128")
!160 = distinct !DICompileUnit(language: DW_LANG_C11, file: !161, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!161 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/ctype/toupper.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "35ae67ebdb17b245d732ce3603fdfa64")
!162 = distinct !DICompileUnit(language: DW_LANG_C11, file: !163, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!163 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/ctype/isprint.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "d8538a5b382a98a36fe86b916256fcc7")
!164 = distinct !DICompileUnit(language: DW_LANG_C11, file: !165, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!165 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/ctype/isupper.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "c2334b5acdb0a1b26cc08f11cf47c244")
!166 = distinct !DICompileUnit(language: DW_LANG_C11, file: !167, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!167 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/ctype/tolower.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "7faecd1bd1600a814e6c8b43347332c3")
!168 = distinct !DICompileUnit(language: DW_LANG_C11, file: !169, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!169 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/ctype/isgraph.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "53707fda19088bc8e89fad78f4c3a13f")
!170 = distinct !DICompileUnit(language: DW_LANG_C11, file: !171, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!171 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/stdio/snprintf.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "76bc06d30e021e08fbd62dcb20d50aff")
!172 = distinct !DICompileUnit(language: DW_LANG_C11, file: !173, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!173 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/stdio/sprintf.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "56f45916c6775fca737b2a248636b9a4")
!174 = distinct !DICompileUnit(language: DW_LANG_C11, file: !175, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !176, splitDebugInlining: false, nameTableKind: None)
!175 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/stdio/vsprintf.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "108c7547e9301a0fdafaac5451fdb696")
!176 = !{!6, !14}
!177 = distinct !DICompileUnit(language: DW_LANG_C11, file: !178, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!178 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/stdio/helper_itoa.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "20d31603d5d66432f19663f52fc24b10")
!179 = distinct !DICompileUnit(language: DW_LANG_C11, file: !180, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !176, splitDebugInlining: false, nameTableKind: None)
!180 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/stdio/vsnprintf.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "97ba02a558780981a4df185c06cf20d5")
!181 = distinct !DICompileUnit(language: DW_LANG_C11, file: !182, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!182 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/math/fabsl.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "5c5076ae740114377af63cf033329357")
!183 = distinct !DICompileUnit(language: DW_LANG_C11, file: !184, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!184 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/math/fabs.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "8c49c577f21ca028a8a9f5afb48aacbb")
!185 = distinct !DICompileUnit(language: DW_LANG_C11, file: !186, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!186 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/math/fabsf.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "b084fca80d77cc63411b9d4b3fe450c4")
!187 = distinct !DICompileUnit(language: DW_LANG_C11, file: !188, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!188 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/time/strftime.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "60233b54b62040efdc56806d7e2f5c85")
!189 = distinct !DICompileUnit(language: DW_LANG_C11, file: !190, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!190 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//models/c/std/time/ctime.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "a911ddebb345e08702cf6c685c49baca")
!191 = !{i32 7, !"Dwarf Version", i32 5}
!192 = !{i32 2, !"Debug Info Version", i32 3}
!193 = !{i32 1, !"wchar_size", i32 4}
!194 = !{i32 8, !"PIC Level", i32 2}
!195 = !{i32 7, !"PIE Level", i32 2}
!196 = !{i32 7, !"uwtable", i32 2}
!197 = !{i32 7, !"frame-pointer", i32 2}
!198 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!199 = distinct !DISubprogram(name: "__fizzer_model__getopt_long", scope: !200, file: !200, line: 3, type: !201, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !78, retainedNodes: !63)
!200 = !DIFile(filename: "data/models/c/posix/getopt_long.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "de123133f6a530da5006cce09eb75639")
!201 = !DISubroutineType(types: !202)
!202 = !{!6, !6, !203, !73, !205, !213}
!203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !204, size: 64)
!204 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!205 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !206, size: 64)
!206 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !207)
!207 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "option", file: !208, line: 50, size: 256, elements: !209)
!208 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/getopt_ext.h", directory: "", checksumkind: CSK_MD5, checksum: "3b9516601798e99ca8a1ad9f5208e7ec")
!209 = !{!210, !211, !212, !214}
!210 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !207, file: !208, line: 52, baseType: !73, size: 64)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "has_arg", scope: !207, file: !208, line: 55, baseType: !6, size: 32, offset: 64)
!212 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !207, file: !208, line: 56, baseType: !213, size: 64, offset: 128)
!213 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!214 = !DIDerivedType(tag: DW_TAG_member, name: "val", scope: !207, file: !208, line: 57, baseType: !6, size: 32, offset: 192)
!215 = !DILocalVariable(name: "argc", arg: 1, scope: !199, file: !200, line: 3, type: !6)
!216 = !DILocation(line: 3, column: 37, scope: !199)
!217 = !DILocalVariable(name: "argv", arg: 2, scope: !199, file: !200, line: 3, type: !203)
!218 = !DILocation(line: 3, column: 56, scope: !199)
!219 = !DILocalVariable(name: "optstring", arg: 3, scope: !199, file: !200, line: 3, type: !73)
!220 = !DILocation(line: 3, column: 76, scope: !199)
!221 = !DILocalVariable(name: "longopts", arg: 4, scope: !199, file: !200, line: 4, type: !205)
!222 = !DILocation(line: 4, column: 54, scope: !199)
!223 = !DILocalVariable(name: "longindex", arg: 5, scope: !199, file: !200, line: 4, type: !213)
!224 = !DILocation(line: 4, column: 69, scope: !199)
!225 = !DILocation(line: 6, column: 9, scope: !226)
!226 = distinct !DILexicalBlock(scope: !199, file: !200, line: 6, column: 9)
!227 = !DILocation(line: 6, column: 35, scope: !226)
!228 = !DILocation(line: 6, column: 32, scope: !226)
!229 = !DILocation(line: 6, column: 9, scope: !199)
!230 = !DILocation(line: 8, column: 9, scope: !231)
!231 = distinct !DILexicalBlock(scope: !226, file: !200, line: 7, column: 5)
!232 = !DILocalVariable(name: "current", scope: !199, file: !200, line: 11, type: !13)
!233 = !DILocation(line: 11, column: 11, scope: !199)
!234 = !DILocation(line: 11, column: 21, scope: !199)
!235 = !DILocation(line: 11, column: 26, scope: !199)
!236 = !DILocation(line: 13, column: 9, scope: !237)
!237 = distinct !DILexicalBlock(scope: !199, file: !200, line: 13, column: 9)
!238 = !DILocation(line: 13, column: 20, scope: !237)
!239 = !DILocation(line: 13, column: 27, scope: !237)
!240 = !DILocation(line: 13, column: 30, scope: !237)
!241 = !DILocation(line: 13, column: 41, scope: !237)
!242 = !DILocation(line: 13, column: 9, scope: !199)
!243 = !DILocation(line: 15, column: 39, scope: !244)
!244 = distinct !DILexicalBlock(scope: !237, file: !200, line: 14, column: 5)
!245 = !DILocation(line: 15, column: 45, scope: !244)
!246 = !DILocation(line: 15, column: 51, scope: !244)
!247 = !DILocation(line: 15, column: 16, scope: !244)
!248 = !DILocation(line: 15, column: 9, scope: !244)
!249 = !DILocalVariable(name: "i", scope: !199, file: !200, line: 18, type: !250)
!250 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !251, line: 6, baseType: !252)
!251 = !DIFile(filename: "data/models/c/posix/getopt_long.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "df33a0efdb11040b8d720c7550c383ff")
!252 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!253 = !DILocation(line: 18, column: 12, scope: !199)
!254 = !DILocation(line: 19, column: 5, scope: !199)
!255 = !DILocation(line: 19, column: 12, scope: !199)
!256 = !DILocation(line: 19, column: 21, scope: !199)
!257 = !DILocation(line: 19, column: 24, scope: !199)
!258 = !DILocation(line: 19, column: 29, scope: !199)
!259 = !DILocalVariable(name: "j", scope: !260, file: !200, line: 21, type: !250)
!260 = distinct !DILexicalBlock(scope: !199, file: !200, line: 20, column: 5)
!261 = !DILocation(line: 21, column: 16, scope: !260)
!262 = !DILocalVariable(name: "match", scope: !260, file: !200, line: 22, type: !6)
!263 = !DILocation(line: 22, column: 13, scope: !260)
!264 = !DILocation(line: 24, column: 9, scope: !260)
!265 = !DILocation(line: 24, column: 16, scope: !260)
!266 = !DILocation(line: 24, column: 25, scope: !260)
!267 = !DILocation(line: 24, column: 28, scope: !260)
!268 = !DILocation(line: 24, column: 33, scope: !260)
!269 = !DILocation(line: 24, column: 36, scope: !260)
!270 = !DILocation(line: 24, column: 41, scope: !260)
!271 = !DILocation(line: 24, column: 44, scope: !260)
!272 = !DILocation(line: 24, column: 56, scope: !260)
!273 = !DILocation(line: 24, column: 54, scope: !260)
!274 = !DILocation(line: 24, column: 59, scope: !260)
!275 = !DILocation(line: 0, scope: !260)
!276 = !DILocation(line: 26, column: 17, scope: !277)
!277 = distinct !DILexicalBlock(scope: !278, file: !200, line: 26, column: 17)
!278 = distinct !DILexicalBlock(scope: !260, file: !200, line: 25, column: 9)
!279 = !DILocation(line: 26, column: 26, scope: !277)
!280 = !DILocation(line: 26, column: 29, scope: !277)
!281 = !DILocation(line: 26, column: 34, scope: !277)
!282 = !DILocation(line: 26, column: 40, scope: !277)
!283 = !DILocation(line: 26, column: 52, scope: !277)
!284 = !DILocation(line: 26, column: 50, scope: !277)
!285 = !DILocation(line: 26, column: 37, scope: !277)
!286 = !DILocation(line: 26, column: 17, scope: !278)
!287 = !DILocation(line: 28, column: 23, scope: !288)
!288 = distinct !DILexicalBlock(scope: !277, file: !200, line: 27, column: 13)
!289 = !DILocation(line: 29, column: 17, scope: !288)
!290 = !DILocation(line: 31, column: 14, scope: !278)
!291 = distinct !{!291, !264, !292, !293}
!292 = !DILocation(line: 32, column: 9, scope: !260)
!293 = !{!"llvm.loop.mustprogress"}
!294 = !DILocation(line: 34, column: 13, scope: !295)
!295 = distinct !DILexicalBlock(scope: !260, file: !200, line: 34, column: 13)
!296 = !DILocation(line: 34, column: 19, scope: !295)
!297 = !DILocation(line: 34, column: 22, scope: !295)
!298 = !DILocation(line: 34, column: 31, scope: !295)
!299 = !DILocation(line: 34, column: 34, scope: !295)
!300 = !DILocation(line: 34, column: 39, scope: !295)
!301 = !DILocation(line: 34, column: 42, scope: !295)
!302 = !DILocation(line: 34, column: 47, scope: !295)
!303 = !DILocation(line: 34, column: 50, scope: !295)
!304 = !DILocation(line: 34, column: 62, scope: !295)
!305 = !DILocation(line: 34, column: 60, scope: !295)
!306 = !DILocation(line: 34, column: 65, scope: !295)
!307 = !DILocation(line: 34, column: 13, scope: !260)
!308 = !DILocation(line: 36, column: 17, scope: !309)
!309 = distinct !DILexicalBlock(scope: !310, file: !200, line: 36, column: 17)
!310 = distinct !DILexicalBlock(scope: !295, file: !200, line: 35, column: 9)
!311 = !DILocation(line: 36, column: 27, scope: !309)
!312 = !DILocation(line: 36, column: 17, scope: !310)
!313 = !DILocation(line: 38, column: 35, scope: !314)
!314 = distinct !DILexicalBlock(scope: !309, file: !200, line: 37, column: 13)
!315 = !DILocation(line: 38, column: 30, scope: !314)
!316 = !DILocation(line: 38, column: 18, scope: !314)
!317 = !DILocation(line: 38, column: 28, scope: !314)
!318 = !DILocation(line: 39, column: 13, scope: !314)
!319 = !DILocation(line: 41, column: 17, scope: !320)
!320 = distinct !DILexicalBlock(scope: !310, file: !200, line: 41, column: 17)
!321 = !DILocation(line: 41, column: 26, scope: !320)
!322 = !DILocation(line: 41, column: 29, scope: !320)
!323 = !DILocation(line: 41, column: 37, scope: !320)
!324 = !DILocation(line: 41, column: 17, scope: !310)
!325 = !DILocation(line: 43, column: 21, scope: !326)
!326 = distinct !DILexicalBlock(scope: !327, file: !200, line: 43, column: 21)
!327 = distinct !DILexicalBlock(scope: !320, file: !200, line: 42, column: 13)
!328 = !DILocation(line: 43, column: 44, scope: !326)
!329 = !DILocation(line: 43, column: 50, scope: !326)
!330 = !DILocation(line: 43, column: 48, scope: !326)
!331 = !DILocation(line: 43, column: 21, scope: !327)
!332 = !DILocation(line: 45, column: 46, scope: !333)
!333 = distinct !DILexicalBlock(scope: !326, file: !200, line: 44, column: 17)
!334 = !DILocation(line: 45, column: 51, scope: !333)
!335 = !DILocation(line: 45, column: 74, scope: !333)
!336 = !DILocation(line: 45, column: 44, scope: !333)
!337 = !DILocation(line: 46, column: 44, scope: !333)
!338 = !DILocation(line: 47, column: 17, scope: !333)
!339 = !DILocation(line: 50, column: 44, scope: !340)
!340 = distinct !DILexicalBlock(scope: !326, file: !200, line: 49, column: 17)
!341 = !DILocation(line: 51, column: 43, scope: !340)
!342 = !DILocation(line: 53, column: 13, scope: !327)
!343 = !DILocation(line: 56, column: 40, scope: !344)
!344 = distinct !DILexicalBlock(scope: !320, file: !200, line: 55, column: 13)
!345 = !DILocation(line: 57, column: 39, scope: !344)
!346 = !DILocation(line: 60, column: 17, scope: !347)
!347 = distinct !DILexicalBlock(scope: !310, file: !200, line: 60, column: 17)
!348 = !DILocation(line: 60, column: 26, scope: !347)
!349 = !DILocation(line: 60, column: 29, scope: !347)
!350 = !DILocation(line: 60, column: 34, scope: !347)
!351 = !DILocation(line: 60, column: 17, scope: !310)
!352 = !DILocation(line: 62, column: 37, scope: !353)
!353 = distinct !DILexicalBlock(scope: !347, file: !200, line: 61, column: 13)
!354 = !DILocation(line: 62, column: 46, scope: !353)
!355 = !DILocation(line: 62, column: 49, scope: !353)
!356 = !DILocation(line: 62, column: 18, scope: !353)
!357 = !DILocation(line: 62, column: 27, scope: !353)
!358 = !DILocation(line: 62, column: 30, scope: !353)
!359 = !DILocation(line: 62, column: 35, scope: !353)
!360 = !DILocation(line: 63, column: 17, scope: !353)
!361 = !DILocation(line: 66, column: 20, scope: !310)
!362 = !DILocation(line: 66, column: 29, scope: !310)
!363 = !DILocation(line: 66, column: 32, scope: !310)
!364 = !DILocation(line: 66, column: 13, scope: !310)
!365 = !DILocation(line: 69, column: 10, scope: !260)
!366 = distinct !{!366, !254, !367, !293}
!367 = !DILocation(line: 70, column: 5, scope: !199)
!368 = !DILocation(line: 72, column: 27, scope: !199)
!369 = !DILocation(line: 73, column: 5, scope: !199)
!370 = !DILocation(line: 74, column: 1, scope: !199)
!371 = distinct !DISubprogram(name: "__fizzer_model__getopt", scope: !372, file: !372, line: 2, type: !373, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !81, retainedNodes: !63)
!372 = !DIFile(filename: "data/models/c/posix/getopt.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "f654b476831f33a28b3fae574c027426")
!373 = !DISubroutineType(types: !374)
!374 = !{!6, !6, !203, !73}
!375 = !DILocalVariable(name: "argc", arg: 1, scope: !371, file: !372, line: 2, type: !6)
!376 = !DILocation(line: 2, column: 32, scope: !371)
!377 = !DILocalVariable(name: "argv", arg: 2, scope: !371, file: !372, line: 2, type: !203)
!378 = !DILocation(line: 2, column: 51, scope: !371)
!379 = !DILocalVariable(name: "optstring", arg: 3, scope: !371, file: !372, line: 2, type: !73)
!380 = !DILocation(line: 2, column: 71, scope: !371)
!381 = !DILocation(line: 4, column: 9, scope: !382)
!382 = distinct !DILexicalBlock(scope: !371, file: !372, line: 4, column: 9)
!383 = !DILocation(line: 4, column: 35, scope: !382)
!384 = !DILocation(line: 4, column: 32, scope: !382)
!385 = !DILocation(line: 4, column: 9, scope: !371)
!386 = !DILocation(line: 6, column: 9, scope: !387)
!387 = distinct !DILexicalBlock(scope: !382, file: !372, line: 5, column: 5)
!388 = !DILocalVariable(name: "current", scope: !371, file: !372, line: 9, type: !13)
!389 = !DILocation(line: 9, column: 11, scope: !371)
!390 = !DILocation(line: 9, column: 21, scope: !371)
!391 = !DILocation(line: 9, column: 26, scope: !371)
!392 = !DILocation(line: 11, column: 9, scope: !393)
!393 = distinct !DILexicalBlock(scope: !371, file: !372, line: 11, column: 9)
!394 = !DILocation(line: 11, column: 20, scope: !393)
!395 = !DILocation(line: 11, column: 27, scope: !393)
!396 = !DILocation(line: 11, column: 30, scope: !393)
!397 = !DILocation(line: 11, column: 41, scope: !393)
!398 = !DILocation(line: 11, column: 9, scope: !371)
!399 = !DILocation(line: 13, column: 9, scope: !400)
!400 = distinct !DILexicalBlock(scope: !393, file: !372, line: 12, column: 5)
!401 = !DILocalVariable(name: "opt", scope: !371, file: !372, line: 16, type: !14)
!402 = !DILocation(line: 16, column: 10, scope: !371)
!403 = !DILocation(line: 16, column: 16, scope: !371)
!404 = !DILocalVariable(name: "i", scope: !371, file: !372, line: 17, type: !405)
!405 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !406, line: 6, baseType: !252)
!406 = !DIFile(filename: "data/models/c/posix/getopt.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "e9a8dd2397db46be8d234080af23f4e9")
!407 = !DILocation(line: 17, column: 12, scope: !371)
!408 = !DILocalVariable(name: "found", scope: !371, file: !372, line: 18, type: !6)
!409 = !DILocation(line: 18, column: 9, scope: !371)
!410 = !DILocation(line: 20, column: 5, scope: !371)
!411 = !DILocation(line: 20, column: 12, scope: !371)
!412 = !DILocation(line: 20, column: 22, scope: !371)
!413 = !DILocation(line: 20, column: 25, scope: !371)
!414 = !DILocation(line: 22, column: 13, scope: !415)
!415 = distinct !DILexicalBlock(scope: !416, file: !372, line: 22, column: 13)
!416 = distinct !DILexicalBlock(scope: !371, file: !372, line: 21, column: 5)
!417 = !DILocation(line: 22, column: 23, scope: !415)
!418 = !DILocation(line: 22, column: 29, scope: !415)
!419 = !DILocation(line: 22, column: 26, scope: !415)
!420 = !DILocation(line: 22, column: 13, scope: !416)
!421 = !DILocation(line: 24, column: 19, scope: !422)
!422 = distinct !DILexicalBlock(scope: !415, file: !372, line: 23, column: 9)
!423 = !DILocation(line: 25, column: 13, scope: !422)
!424 = !DILocation(line: 27, column: 10, scope: !416)
!425 = distinct !{!425, !410, !426, !293}
!426 = !DILocation(line: 28, column: 5, scope: !371)
!427 = !DILocation(line: 30, column: 10, scope: !428)
!428 = distinct !DILexicalBlock(scope: !371, file: !372, line: 30, column: 9)
!429 = !DILocation(line: 30, column: 9, scope: !371)
!430 = !DILocation(line: 32, column: 34, scope: !431)
!431 = distinct !DILexicalBlock(scope: !428, file: !372, line: 31, column: 5)
!432 = !DILocation(line: 32, column: 32, scope: !431)
!433 = !DILocation(line: 33, column: 31, scope: !431)
!434 = !DILocation(line: 34, column: 9, scope: !431)
!435 = !DILocation(line: 38, column: 9, scope: !436)
!436 = distinct !DILexicalBlock(scope: !371, file: !372, line: 38, column: 9)
!437 = !DILocation(line: 38, column: 19, scope: !436)
!438 = !DILocation(line: 38, column: 21, scope: !436)
!439 = !DILocation(line: 38, column: 26, scope: !436)
!440 = !DILocation(line: 38, column: 9, scope: !371)
!441 = !DILocation(line: 40, column: 13, scope: !442)
!442 = distinct !DILexicalBlock(scope: !443, file: !372, line: 40, column: 13)
!443 = distinct !DILexicalBlock(scope: !436, file: !372, line: 39, column: 5)
!444 = !DILocation(line: 40, column: 24, scope: !442)
!445 = !DILocation(line: 40, column: 13, scope: !443)
!446 = !DILocation(line: 42, column: 39, scope: !447)
!447 = distinct !DILexicalBlock(scope: !442, file: !372, line: 41, column: 9)
!448 = !DILocation(line: 42, column: 36, scope: !447)
!449 = !DILocation(line: 43, column: 9, scope: !447)
!450 = !DILocation(line: 44, column: 18, scope: !451)
!451 = distinct !DILexicalBlock(scope: !442, file: !372, line: 44, column: 18)
!452 = !DILocation(line: 44, column: 41, scope: !451)
!453 = !DILocation(line: 44, column: 47, scope: !451)
!454 = !DILocation(line: 44, column: 45, scope: !451)
!455 = !DILocation(line: 44, column: 18, scope: !442)
!456 = !DILocation(line: 46, column: 35, scope: !457)
!457 = distinct !DILexicalBlock(scope: !451, file: !372, line: 45, column: 9)
!458 = !DILocation(line: 47, column: 38, scope: !457)
!459 = !DILocation(line: 47, column: 43, scope: !457)
!460 = !DILocation(line: 47, column: 36, scope: !457)
!461 = !DILocation(line: 48, column: 9, scope: !457)
!462 = !DILocation(line: 51, column: 36, scope: !463)
!463 = distinct !DILexicalBlock(scope: !451, file: !372, line: 50, column: 9)
!464 = !DILocation(line: 52, column: 17, scope: !465)
!465 = distinct !DILexicalBlock(scope: !463, file: !372, line: 52, column: 17)
!466 = !DILocation(line: 52, column: 17, scope: !463)
!467 = !DILocation(line: 55, column: 13, scope: !468)
!468 = distinct !DILexicalBlock(scope: !465, file: !372, line: 53, column: 13)
!469 = !DILocation(line: 56, column: 35, scope: !463)
!470 = !DILocation(line: 57, column: 13, scope: !463)
!471 = !DILocation(line: 59, column: 31, scope: !443)
!472 = !DILocation(line: 60, column: 5, scope: !443)
!473 = !DILocation(line: 63, column: 32, scope: !474)
!474 = distinct !DILexicalBlock(scope: !436, file: !372, line: 62, column: 5)
!475 = !DILocation(line: 64, column: 31, scope: !474)
!476 = !DILocation(line: 67, column: 12, scope: !371)
!477 = !DILocation(line: 67, column: 5, scope: !371)
!478 = !DILocation(line: 68, column: 1, scope: !371)
!479 = distinct !DISubprogram(name: "__fizzer_model__atoll", scope: !480, file: !480, line: 2, type: !481, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !63)
!480 = !DIFile(filename: "data/models/c/std/stdlib/atoll.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "a20eee9a7568d583fd9ee7193391622b")
!481 = !DISubroutineType(types: !482)
!482 = !{!483, !73}
!483 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!484 = !DILocalVariable(name: "nptr", arg: 1, scope: !479, file: !480, line: 2, type: !73)
!485 = !DILocation(line: 2, column: 45, scope: !479)
!486 = !DILocalVariable(name: "result", scope: !479, file: !480, line: 4, type: !483)
!487 = !DILocation(line: 4, column: 15, scope: !479)
!488 = !DILocalVariable(name: "sign", scope: !479, file: !480, line: 5, type: !6)
!489 = !DILocation(line: 5, column: 9, scope: !479)
!490 = !DILocalVariable(name: "i", scope: !479, file: !480, line: 6, type: !491)
!491 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !492, line: 6, baseType: !252)
!492 = !DIFile(filename: "data/models/c/std/stdlib/atoll.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "9741b0e725109815faf588d300e73d9a")
!493 = !DILocation(line: 6, column: 12, scope: !479)
!494 = !DILocation(line: 8, column: 5, scope: !479)
!495 = !DILocation(line: 8, column: 12, scope: !479)
!496 = !DILocation(line: 8, column: 17, scope: !479)
!497 = !DILocation(line: 8, column: 20, scope: !479)
!498 = !DILocation(line: 8, column: 25, scope: !479)
!499 = !DILocation(line: 8, column: 52, scope: !479)
!500 = !DILocation(line: 8, column: 57, scope: !479)
!501 = !DILocation(line: 8, column: 28, scope: !479)
!502 = !DILocation(line: 0, scope: !479)
!503 = !DILocation(line: 10, column: 10, scope: !504)
!504 = distinct !DILexicalBlock(scope: !479, file: !480, line: 9, column: 5)
!505 = distinct !{!505, !494, !506, !293}
!506 = !DILocation(line: 11, column: 5, scope: !479)
!507 = !DILocation(line: 13, column: 9, scope: !508)
!508 = distinct !DILexicalBlock(scope: !479, file: !480, line: 13, column: 9)
!509 = !DILocation(line: 13, column: 14, scope: !508)
!510 = !DILocation(line: 13, column: 17, scope: !508)
!511 = !DILocation(line: 13, column: 9, scope: !479)
!512 = !DILocation(line: 15, column: 10, scope: !513)
!513 = distinct !DILexicalBlock(scope: !508, file: !480, line: 14, column: 5)
!514 = !DILocation(line: 16, column: 5, scope: !513)
!515 = !DILocation(line: 17, column: 14, scope: !516)
!516 = distinct !DILexicalBlock(scope: !508, file: !480, line: 17, column: 14)
!517 = !DILocation(line: 17, column: 19, scope: !516)
!518 = !DILocation(line: 17, column: 22, scope: !516)
!519 = !DILocation(line: 17, column: 14, scope: !508)
!520 = !DILocation(line: 19, column: 14, scope: !521)
!521 = distinct !DILexicalBlock(scope: !516, file: !480, line: 18, column: 5)
!522 = !DILocation(line: 20, column: 10, scope: !521)
!523 = !DILocation(line: 21, column: 5, scope: !521)
!524 = !DILocation(line: 23, column: 5, scope: !479)
!525 = !DILocation(line: 23, column: 12, scope: !479)
!526 = !DILocation(line: 23, column: 17, scope: !479)
!527 = !DILocation(line: 23, column: 20, scope: !479)
!528 = !DILocation(line: 23, column: 25, scope: !479)
!529 = !DILocation(line: 23, column: 52, scope: !479)
!530 = !DILocation(line: 23, column: 57, scope: !479)
!531 = !DILocation(line: 23, column: 28, scope: !479)
!532 = !DILocation(line: 25, column: 18, scope: !533)
!533 = distinct !DILexicalBlock(scope: !479, file: !480, line: 24, column: 5)
!534 = !DILocation(line: 25, column: 25, scope: !533)
!535 = !DILocation(line: 25, column: 33, scope: !533)
!536 = !DILocation(line: 25, column: 38, scope: !533)
!537 = !DILocation(line: 25, column: 41, scope: !533)
!538 = !DILocation(line: 25, column: 32, scope: !533)
!539 = !DILocation(line: 25, column: 30, scope: !533)
!540 = !DILocation(line: 25, column: 16, scope: !533)
!541 = !DILocation(line: 26, column: 10, scope: !533)
!542 = distinct !{!542, !524, !543, !293}
!543 = !DILocation(line: 27, column: 5, scope: !479)
!544 = !DILocation(line: 29, column: 12, scope: !479)
!545 = !DILocation(line: 29, column: 19, scope: !479)
!546 = !DILocation(line: 29, column: 17, scope: !479)
!547 = !DILocation(line: 29, column: 5, scope: !479)
!548 = distinct !DISubprogram(name: "__fizzer_model__strtod", scope: !549, file: !549, line: 2, type: !550, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !85, retainedNodes: !63)
!549 = !DIFile(filename: "data/models/c/std/stdlib/strtod.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "8af3db33fabf3d592277f51247d76438")
!550 = !DISubroutineType(types: !551)
!551 = !{!88, !73, !552}
!552 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!553 = !DILocalVariable(name: "nptr", arg: 1, scope: !548, file: !549, line: 2, type: !73)
!554 = !DILocation(line: 2, column: 43, scope: !548)
!555 = !DILocalVariable(name: "endptr", arg: 2, scope: !548, file: !549, line: 2, type: !552)
!556 = !DILocation(line: 2, column: 56, scope: !548)
!557 = !DILocalVariable(name: "result", scope: !548, file: !549, line: 4, type: !88)
!558 = !DILocation(line: 4, column: 12, scope: !548)
!559 = !DILocalVariable(name: "fraction", scope: !548, file: !549, line: 5, type: !88)
!560 = !DILocation(line: 5, column: 12, scope: !548)
!561 = !DILocalVariable(name: "sign", scope: !548, file: !549, line: 6, type: !6)
!562 = !DILocation(line: 6, column: 9, scope: !548)
!563 = !DILocalVariable(name: "frac_div", scope: !548, file: !549, line: 7, type: !6)
!564 = !DILocation(line: 7, column: 9, scope: !548)
!565 = !DILocalVariable(name: "exp_sign", scope: !548, file: !549, line: 8, type: !6)
!566 = !DILocation(line: 8, column: 9, scope: !548)
!567 = !DILocalVariable(name: "exponent", scope: !548, file: !549, line: 9, type: !6)
!568 = !DILocation(line: 9, column: 9, scope: !548)
!569 = !DILocalVariable(name: "i", scope: !548, file: !549, line: 10, type: !570)
!570 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !571, line: 6, baseType: !252)
!571 = !DIFile(filename: "data/models/c/std/stdlib/strtod.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "6a00107a07643da7bae7e93112654d20")
!572 = !DILocation(line: 10, column: 12, scope: !548)
!573 = !DILocation(line: 13, column: 5, scope: !548)
!574 = !DILocation(line: 13, column: 12, scope: !548)
!575 = !DILocation(line: 13, column: 17, scope: !548)
!576 = !DILocation(line: 13, column: 20, scope: !548)
!577 = !DILocation(line: 13, column: 25, scope: !548)
!578 = !DILocation(line: 13, column: 52, scope: !548)
!579 = !DILocation(line: 13, column: 57, scope: !548)
!580 = !DILocation(line: 13, column: 28, scope: !548)
!581 = !DILocation(line: 0, scope: !548)
!582 = !DILocation(line: 15, column: 10, scope: !583)
!583 = distinct !DILexicalBlock(scope: !548, file: !549, line: 14, column: 5)
!584 = distinct !{!584, !573, !585, !293}
!585 = !DILocation(line: 16, column: 5, scope: !548)
!586 = !DILocation(line: 19, column: 9, scope: !587)
!587 = distinct !DILexicalBlock(scope: !548, file: !549, line: 19, column: 9)
!588 = !DILocation(line: 19, column: 14, scope: !587)
!589 = !DILocation(line: 19, column: 17, scope: !587)
!590 = !DILocation(line: 19, column: 9, scope: !548)
!591 = !DILocation(line: 21, column: 10, scope: !592)
!592 = distinct !DILexicalBlock(scope: !587, file: !549, line: 20, column: 5)
!593 = !DILocation(line: 22, column: 5, scope: !592)
!594 = !DILocation(line: 23, column: 14, scope: !595)
!595 = distinct !DILexicalBlock(scope: !587, file: !549, line: 23, column: 14)
!596 = !DILocation(line: 23, column: 19, scope: !595)
!597 = !DILocation(line: 23, column: 22, scope: !595)
!598 = !DILocation(line: 23, column: 14, scope: !587)
!599 = !DILocation(line: 25, column: 14, scope: !600)
!600 = distinct !DILexicalBlock(scope: !595, file: !549, line: 24, column: 5)
!601 = !DILocation(line: 26, column: 10, scope: !600)
!602 = !DILocation(line: 27, column: 5, scope: !600)
!603 = !DILocation(line: 30, column: 5, scope: !548)
!604 = !DILocation(line: 30, column: 12, scope: !548)
!605 = !DILocation(line: 30, column: 17, scope: !548)
!606 = !DILocation(line: 30, column: 20, scope: !548)
!607 = !DILocation(line: 30, column: 25, scope: !548)
!608 = !DILocation(line: 30, column: 52, scope: !548)
!609 = !DILocation(line: 30, column: 57, scope: !548)
!610 = !DILocation(line: 30, column: 28, scope: !548)
!611 = !DILocation(line: 32, column: 18, scope: !612)
!612 = distinct !DILexicalBlock(scope: !548, file: !549, line: 31, column: 5)
!613 = !DILocation(line: 32, column: 43, scope: !612)
!614 = !DILocation(line: 32, column: 48, scope: !612)
!615 = !DILocation(line: 32, column: 51, scope: !612)
!616 = !DILocation(line: 32, column: 34, scope: !612)
!617 = !DILocation(line: 32, column: 32, scope: !612)
!618 = !DILocation(line: 32, column: 16, scope: !612)
!619 = !DILocation(line: 33, column: 10, scope: !612)
!620 = distinct !{!620, !603, !621, !293}
!621 = !DILocation(line: 34, column: 5, scope: !548)
!622 = !DILocation(line: 37, column: 9, scope: !623)
!623 = distinct !DILexicalBlock(scope: !548, file: !549, line: 37, column: 9)
!624 = !DILocation(line: 37, column: 14, scope: !623)
!625 = !DILocation(line: 37, column: 17, scope: !623)
!626 = !DILocation(line: 37, column: 9, scope: !548)
!627 = !DILocation(line: 39, column: 10, scope: !628)
!628 = distinct !DILexicalBlock(scope: !623, file: !549, line: 38, column: 5)
!629 = !DILocation(line: 40, column: 9, scope: !628)
!630 = !DILocation(line: 40, column: 16, scope: !628)
!631 = !DILocation(line: 40, column: 21, scope: !628)
!632 = !DILocation(line: 40, column: 24, scope: !628)
!633 = !DILocation(line: 40, column: 29, scope: !628)
!634 = !DILocation(line: 40, column: 56, scope: !628)
!635 = !DILocation(line: 40, column: 61, scope: !628)
!636 = !DILocation(line: 40, column: 32, scope: !628)
!637 = !DILocation(line: 0, scope: !628)
!638 = !DILocation(line: 42, column: 24, scope: !639)
!639 = distinct !DILexicalBlock(scope: !628, file: !549, line: 41, column: 9)
!640 = !DILocation(line: 42, column: 51, scope: !639)
!641 = !DILocation(line: 42, column: 56, scope: !639)
!642 = !DILocation(line: 42, column: 59, scope: !639)
!643 = !DILocation(line: 42, column: 42, scope: !639)
!644 = !DILocation(line: 42, column: 40, scope: !639)
!645 = !DILocation(line: 42, column: 22, scope: !639)
!646 = !DILocation(line: 43, column: 24, scope: !639)
!647 = !DILocation(line: 43, column: 33, scope: !639)
!648 = !DILocation(line: 43, column: 22, scope: !639)
!649 = !DILocation(line: 44, column: 14, scope: !639)
!650 = distinct !{!650, !629, !651, !293}
!651 = !DILocation(line: 45, column: 9, scope: !628)
!652 = !DILocation(line: 46, column: 18, scope: !628)
!653 = !DILocation(line: 46, column: 27, scope: !628)
!654 = !DILocation(line: 46, column: 46, scope: !628)
!655 = !DILocation(line: 46, column: 38, scope: !628)
!656 = !DILocation(line: 46, column: 36, scope: !628)
!657 = !DILocation(line: 46, column: 25, scope: !628)
!658 = !DILocation(line: 46, column: 16, scope: !628)
!659 = !DILocation(line: 47, column: 5, scope: !628)
!660 = !DILocation(line: 50, column: 9, scope: !661)
!661 = distinct !DILexicalBlock(scope: !548, file: !549, line: 50, column: 9)
!662 = !DILocation(line: 50, column: 14, scope: !661)
!663 = !DILocation(line: 50, column: 17, scope: !661)
!664 = !DILocation(line: 50, column: 24, scope: !661)
!665 = !DILocation(line: 50, column: 27, scope: !661)
!666 = !DILocation(line: 50, column: 32, scope: !661)
!667 = !DILocation(line: 50, column: 35, scope: !661)
!668 = !DILocation(line: 50, column: 9, scope: !548)
!669 = !DILocation(line: 52, column: 10, scope: !670)
!670 = distinct !DILexicalBlock(scope: !661, file: !549, line: 51, column: 5)
!671 = !DILocation(line: 54, column: 13, scope: !672)
!672 = distinct !DILexicalBlock(scope: !670, file: !549, line: 54, column: 13)
!673 = !DILocation(line: 54, column: 18, scope: !672)
!674 = !DILocation(line: 54, column: 21, scope: !672)
!675 = !DILocation(line: 54, column: 13, scope: !670)
!676 = !DILocation(line: 56, column: 14, scope: !677)
!677 = distinct !DILexicalBlock(scope: !672, file: !549, line: 55, column: 9)
!678 = !DILocation(line: 57, column: 9, scope: !677)
!679 = !DILocation(line: 58, column: 18, scope: !680)
!680 = distinct !DILexicalBlock(scope: !672, file: !549, line: 58, column: 18)
!681 = !DILocation(line: 58, column: 23, scope: !680)
!682 = !DILocation(line: 58, column: 26, scope: !680)
!683 = !DILocation(line: 58, column: 18, scope: !672)
!684 = !DILocation(line: 60, column: 22, scope: !685)
!685 = distinct !DILexicalBlock(scope: !680, file: !549, line: 59, column: 9)
!686 = !DILocation(line: 61, column: 14, scope: !685)
!687 = !DILocation(line: 62, column: 9, scope: !685)
!688 = !DILocation(line: 64, column: 9, scope: !670)
!689 = !DILocation(line: 64, column: 16, scope: !670)
!690 = !DILocation(line: 64, column: 21, scope: !670)
!691 = !DILocation(line: 64, column: 24, scope: !670)
!692 = !DILocation(line: 64, column: 29, scope: !670)
!693 = !DILocation(line: 64, column: 56, scope: !670)
!694 = !DILocation(line: 64, column: 61, scope: !670)
!695 = !DILocation(line: 64, column: 32, scope: !670)
!696 = !DILocation(line: 0, scope: !670)
!697 = !DILocation(line: 66, column: 24, scope: !698)
!698 = distinct !DILexicalBlock(scope: !670, file: !549, line: 65, column: 9)
!699 = !DILocation(line: 66, column: 33, scope: !698)
!700 = !DILocation(line: 66, column: 41, scope: !698)
!701 = !DILocation(line: 66, column: 46, scope: !698)
!702 = !DILocation(line: 66, column: 49, scope: !698)
!703 = !DILocation(line: 66, column: 38, scope: !698)
!704 = !DILocation(line: 66, column: 22, scope: !698)
!705 = !DILocation(line: 67, column: 14, scope: !698)
!706 = distinct !{!706, !688, !707, !293}
!707 = !DILocation(line: 68, column: 9, scope: !670)
!708 = !DILocation(line: 69, column: 5, scope: !670)
!709 = !DILocation(line: 71, column: 9, scope: !710)
!710 = distinct !DILexicalBlock(scope: !548, file: !549, line: 71, column: 9)
!711 = !DILocation(line: 71, column: 16, scope: !710)
!712 = !DILocation(line: 71, column: 9, scope: !548)
!713 = !DILocation(line: 73, column: 28, scope: !714)
!714 = distinct !DILexicalBlock(scope: !710, file: !549, line: 72, column: 5)
!715 = !DILocation(line: 73, column: 35, scope: !714)
!716 = !DILocation(line: 73, column: 33, scope: !714)
!717 = !DILocation(line: 73, column: 10, scope: !714)
!718 = !DILocation(line: 73, column: 17, scope: !714)
!719 = !DILocation(line: 74, column: 5, scope: !714)
!720 = !DILocalVariable(name: "exp_multiplier", scope: !548, file: !549, line: 77, type: !88)
!721 = !DILocation(line: 77, column: 12, scope: !548)
!722 = !DILocalVariable(name: "j", scope: !723, file: !549, line: 78, type: !6)
!723 = distinct !DILexicalBlock(scope: !548, file: !549, line: 78, column: 5)
!724 = !DILocation(line: 78, column: 14, scope: !723)
!725 = !DILocation(line: 78, column: 10, scope: !723)
!726 = !DILocation(line: 78, column: 21, scope: !727)
!727 = distinct !DILexicalBlock(scope: !723, file: !549, line: 78, column: 5)
!728 = !DILocation(line: 78, column: 25, scope: !727)
!729 = !DILocation(line: 78, column: 23, scope: !727)
!730 = !DILocation(line: 78, column: 5, scope: !723)
!731 = !DILocation(line: 80, column: 26, scope: !732)
!732 = distinct !DILexicalBlock(scope: !727, file: !549, line: 79, column: 5)
!733 = !DILocation(line: 80, column: 41, scope: !732)
!734 = !DILocation(line: 80, column: 24, scope: !732)
!735 = !DILocation(line: 81, column: 5, scope: !732)
!736 = !DILocation(line: 78, column: 36, scope: !727)
!737 = !DILocation(line: 78, column: 5, scope: !727)
!738 = distinct !{!738, !730, !739, !293}
!739 = !DILocation(line: 81, column: 5, scope: !723)
!740 = !DILocation(line: 83, column: 9, scope: !741)
!741 = distinct !DILexicalBlock(scope: !548, file: !549, line: 83, column: 9)
!742 = !DILocation(line: 83, column: 18, scope: !741)
!743 = !DILocation(line: 83, column: 9, scope: !548)
!744 = !DILocation(line: 85, column: 18, scope: !745)
!745 = distinct !DILexicalBlock(scope: !741, file: !549, line: 84, column: 5)
!746 = !DILocation(line: 85, column: 27, scope: !745)
!747 = !DILocation(line: 85, column: 25, scope: !745)
!748 = !DILocation(line: 85, column: 16, scope: !745)
!749 = !DILocation(line: 86, column: 5, scope: !745)
!750 = !DILocation(line: 89, column: 18, scope: !751)
!751 = distinct !DILexicalBlock(scope: !741, file: !549, line: 88, column: 5)
!752 = !DILocation(line: 89, column: 27, scope: !751)
!753 = !DILocation(line: 89, column: 25, scope: !751)
!754 = !DILocation(line: 89, column: 16, scope: !751)
!755 = !DILocation(line: 92, column: 12, scope: !548)
!756 = !DILocation(line: 92, column: 19, scope: !548)
!757 = !DILocation(line: 92, column: 17, scope: !548)
!758 = !DILocation(line: 92, column: 5, scope: !548)
!759 = distinct !DISubprogram(name: "__fizzer_model__abs", scope: !760, file: !760, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !63)
!760 = !DIFile(filename: "data/models/c/std/stdlib/abs.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "5dc98c96c5261907ed11f631ce472103")
!761 = !DISubroutineType(types: !762)
!762 = !{!6, !6}
!763 = !DILocalVariable(name: "x", arg: 1, scope: !759, file: !760, line: 2, type: !6)
!764 = !DILocation(line: 2, column: 29, scope: !759)
!765 = !DILocation(line: 4, column: 9, scope: !766)
!766 = distinct !DILexicalBlock(scope: !759, file: !760, line: 4, column: 9)
!767 = !DILocation(line: 4, column: 11, scope: !766)
!768 = !DILocation(line: 4, column: 9, scope: !759)
!769 = !DILocation(line: 5, column: 17, scope: !766)
!770 = !DILocation(line: 5, column: 16, scope: !766)
!771 = !DILocation(line: 5, column: 9, scope: !766)
!772 = !DILocation(line: 7, column: 16, scope: !766)
!773 = !DILocation(line: 7, column: 9, scope: !766)
!774 = !DILocation(line: 8, column: 1, scope: !759)
!775 = distinct !DISubprogram(name: "__fizzer_model__labs", scope: !776, file: !776, line: 2, type: !777, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !91, retainedNodes: !63)
!776 = !DIFile(filename: "data/models/c/std/stdlib/labs.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "d0625b0698f9d1196d0b119b4fc84b2d")
!777 = !DISubroutineType(types: !778)
!778 = !{!779, !779}
!779 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!780 = !DILocalVariable(name: "x", arg: 1, scope: !775, file: !776, line: 2, type: !779)
!781 = !DILocation(line: 2, column: 40, scope: !775)
!782 = !DILocation(line: 4, column: 9, scope: !783)
!783 = distinct !DILexicalBlock(scope: !775, file: !776, line: 4, column: 9)
!784 = !DILocation(line: 4, column: 11, scope: !783)
!785 = !DILocation(line: 4, column: 9, scope: !775)
!786 = !DILocation(line: 5, column: 17, scope: !783)
!787 = !DILocation(line: 5, column: 16, scope: !783)
!788 = !DILocation(line: 5, column: 9, scope: !783)
!789 = !DILocation(line: 7, column: 16, scope: !783)
!790 = !DILocation(line: 7, column: 9, scope: !783)
!791 = !DILocation(line: 8, column: 1, scope: !775)
!792 = distinct !DISubprogram(name: "__fizzer_model__llabs", scope: !793, file: !793, line: 2, type: !794, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !63)
!793 = !DIFile(filename: "data/models/c/std/stdlib/llabs.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "8095d5dd9527583f176d5d9342463eec")
!794 = !DISubroutineType(types: !795)
!795 = !{!483, !483}
!796 = !DILocalVariable(name: "x", arg: 1, scope: !792, file: !793, line: 2, type: !483)
!797 = !DILocation(line: 2, column: 51, scope: !792)
!798 = !DILocation(line: 4, column: 9, scope: !799)
!799 = distinct !DILexicalBlock(scope: !792, file: !793, line: 4, column: 9)
!800 = !DILocation(line: 4, column: 11, scope: !799)
!801 = !DILocation(line: 4, column: 9, scope: !792)
!802 = !DILocation(line: 5, column: 17, scope: !799)
!803 = !DILocation(line: 5, column: 16, scope: !799)
!804 = !DILocation(line: 5, column: 9, scope: !799)
!805 = !DILocation(line: 7, column: 16, scope: !799)
!806 = !DILocation(line: 7, column: 9, scope: !799)
!807 = !DILocation(line: 8, column: 1, scope: !792)
!808 = distinct !DISubprogram(name: "__fizzer_model__strtol", scope: !809, file: !809, line: 2, type: !810, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !63)
!809 = !DIFile(filename: "data/models/c/std/stdlib/strtol.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "7bd701710373e339d62a1da5b0831766")
!810 = !DISubroutineType(types: !811)
!811 = !{!779, !73, !552, !6}
!812 = !DILocalVariable(name: "nptr", arg: 1, scope: !808, file: !809, line: 2, type: !73)
!813 = !DILocation(line: 2, column: 41, scope: !808)
!814 = !DILocalVariable(name: "endptr", arg: 2, scope: !808, file: !809, line: 2, type: !552)
!815 = !DILocation(line: 2, column: 54, scope: !808)
!816 = !DILocalVariable(name: "base", arg: 3, scope: !808, file: !809, line: 2, type: !6)
!817 = !DILocation(line: 2, column: 66, scope: !808)
!818 = !DILocalVariable(name: "result", scope: !808, file: !809, line: 4, type: !779)
!819 = !DILocation(line: 4, column: 10, scope: !808)
!820 = !DILocalVariable(name: "sign", scope: !808, file: !809, line: 5, type: !6)
!821 = !DILocation(line: 5, column: 9, scope: !808)
!822 = !DILocalVariable(name: "i", scope: !808, file: !809, line: 6, type: !823)
!823 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !824, line: 6, baseType: !252)
!824 = !DIFile(filename: "data/models/c/std/stdlib/strtol.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "47e12629a1c37bef079652283e66cf67")
!825 = !DILocation(line: 6, column: 12, scope: !808)
!826 = !DILocation(line: 8, column: 9, scope: !827)
!827 = distinct !DILexicalBlock(scope: !808, file: !809, line: 8, column: 9)
!828 = !DILocation(line: 8, column: 14, scope: !827)
!829 = !DILocation(line: 8, column: 9, scope: !808)
!830 = !DILocation(line: 11, column: 13, scope: !831)
!831 = distinct !DILexicalBlock(scope: !832, file: !809, line: 11, column: 13)
!832 = distinct !DILexicalBlock(scope: !827, file: !809, line: 9, column: 5)
!833 = !DILocation(line: 11, column: 20, scope: !831)
!834 = !DILocation(line: 11, column: 13, scope: !832)
!835 = !DILocation(line: 13, column: 31, scope: !836)
!836 = distinct !DILexicalBlock(scope: !831, file: !809, line: 12, column: 9)
!837 = !DILocation(line: 13, column: 14, scope: !836)
!838 = !DILocation(line: 13, column: 21, scope: !836)
!839 = !DILocation(line: 14, column: 9, scope: !836)
!840 = !DILocation(line: 15, column: 9, scope: !832)
!841 = !DILocation(line: 18, column: 5, scope: !808)
!842 = !DILocation(line: 18, column: 12, scope: !808)
!843 = !DILocation(line: 18, column: 17, scope: !808)
!844 = !DILocation(line: 18, column: 20, scope: !808)
!845 = !DILocation(line: 18, column: 25, scope: !808)
!846 = !DILocation(line: 18, column: 52, scope: !808)
!847 = !DILocation(line: 18, column: 57, scope: !808)
!848 = !DILocation(line: 18, column: 28, scope: !808)
!849 = !DILocation(line: 0, scope: !808)
!850 = !DILocation(line: 20, column: 10, scope: !851)
!851 = distinct !DILexicalBlock(scope: !808, file: !809, line: 19, column: 5)
!852 = distinct !{!852, !841, !853, !293}
!853 = !DILocation(line: 21, column: 5, scope: !808)
!854 = !DILocation(line: 23, column: 9, scope: !855)
!855 = distinct !DILexicalBlock(scope: !808, file: !809, line: 23, column: 9)
!856 = !DILocation(line: 23, column: 14, scope: !855)
!857 = !DILocation(line: 23, column: 17, scope: !855)
!858 = !DILocation(line: 23, column: 9, scope: !808)
!859 = !DILocation(line: 25, column: 10, scope: !860)
!860 = distinct !DILexicalBlock(scope: !855, file: !809, line: 24, column: 5)
!861 = !DILocation(line: 26, column: 5, scope: !860)
!862 = !DILocation(line: 27, column: 14, scope: !863)
!863 = distinct !DILexicalBlock(scope: !855, file: !809, line: 27, column: 14)
!864 = !DILocation(line: 27, column: 19, scope: !863)
!865 = !DILocation(line: 27, column: 22, scope: !863)
!866 = !DILocation(line: 27, column: 14, scope: !855)
!867 = !DILocation(line: 29, column: 14, scope: !868)
!868 = distinct !DILexicalBlock(scope: !863, file: !809, line: 28, column: 5)
!869 = !DILocation(line: 30, column: 10, scope: !868)
!870 = !DILocation(line: 31, column: 5, scope: !868)
!871 = !DILocalVariable(name: "start", scope: !808, file: !809, line: 33, type: !823)
!872 = !DILocation(line: 33, column: 12, scope: !808)
!873 = !DILocation(line: 33, column: 20, scope: !808)
!874 = !DILocation(line: 35, column: 5, scope: !808)
!875 = !DILocation(line: 35, column: 12, scope: !808)
!876 = !DILocation(line: 35, column: 17, scope: !808)
!877 = !DILocation(line: 35, column: 20, scope: !808)
!878 = !DILocation(line: 35, column: 25, scope: !808)
!879 = !DILocation(line: 35, column: 52, scope: !808)
!880 = !DILocation(line: 35, column: 57, scope: !808)
!881 = !DILocation(line: 35, column: 28, scope: !808)
!882 = !DILocation(line: 37, column: 18, scope: !883)
!883 = distinct !DILexicalBlock(scope: !808, file: !809, line: 36, column: 5)
!884 = !DILocation(line: 37, column: 25, scope: !883)
!885 = !DILocation(line: 37, column: 33, scope: !883)
!886 = !DILocation(line: 37, column: 38, scope: !883)
!887 = !DILocation(line: 37, column: 41, scope: !883)
!888 = !DILocation(line: 37, column: 32, scope: !883)
!889 = !DILocation(line: 37, column: 30, scope: !883)
!890 = !DILocation(line: 37, column: 16, scope: !883)
!891 = !DILocation(line: 38, column: 10, scope: !883)
!892 = distinct !{!892, !874, !893, !293}
!893 = !DILocation(line: 39, column: 5, scope: !808)
!894 = !DILocation(line: 41, column: 9, scope: !895)
!895 = distinct !DILexicalBlock(scope: !808, file: !809, line: 41, column: 9)
!896 = !DILocation(line: 41, column: 16, scope: !895)
!897 = !DILocation(line: 41, column: 9, scope: !808)
!898 = !DILocation(line: 43, column: 28, scope: !899)
!899 = distinct !DILexicalBlock(scope: !895, file: !809, line: 42, column: 5)
!900 = !DILocation(line: 43, column: 35, scope: !899)
!901 = !DILocation(line: 43, column: 33, scope: !899)
!902 = !DILocation(line: 43, column: 10, scope: !899)
!903 = !DILocation(line: 43, column: 17, scope: !899)
!904 = !DILocation(line: 44, column: 5, scope: !899)
!905 = !DILocation(line: 46, column: 12, scope: !808)
!906 = !DILocation(line: 46, column: 19, scope: !808)
!907 = !DILocation(line: 46, column: 17, scope: !808)
!908 = !DILocation(line: 46, column: 5, scope: !808)
!909 = !DILocation(line: 47, column: 1, scope: !808)
!910 = distinct !DISubprogram(name: "__fizzer_model__atol", scope: !911, file: !911, line: 2, type: !912, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !98, retainedNodes: !63)
!911 = !DIFile(filename: "data/models/c/std/stdlib/atol.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "130864a3e56f877c17dbd6cd172158db")
!912 = !DISubroutineType(types: !913)
!913 = !{!779, !73}
!914 = !DILocalVariable(name: "nptr", arg: 1, scope: !910, file: !911, line: 2, type: !73)
!915 = !DILocation(line: 2, column: 39, scope: !910)
!916 = !DILocalVariable(name: "result", scope: !910, file: !911, line: 4, type: !779)
!917 = !DILocation(line: 4, column: 10, scope: !910)
!918 = !DILocalVariable(name: "sign", scope: !910, file: !911, line: 5, type: !6)
!919 = !DILocation(line: 5, column: 9, scope: !910)
!920 = !DILocalVariable(name: "i", scope: !910, file: !911, line: 6, type: !921)
!921 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !922, line: 6, baseType: !252)
!922 = !DIFile(filename: "data/models/c/std/stdlib/atol.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "1fd40bbb4fabb448cf5666fb2ad7f378")
!923 = !DILocation(line: 6, column: 12, scope: !910)
!924 = !DILocation(line: 8, column: 5, scope: !910)
!925 = !DILocation(line: 8, column: 12, scope: !910)
!926 = !DILocation(line: 8, column: 17, scope: !910)
!927 = !DILocation(line: 8, column: 20, scope: !910)
!928 = !DILocation(line: 8, column: 25, scope: !910)
!929 = !DILocation(line: 8, column: 52, scope: !910)
!930 = !DILocation(line: 8, column: 57, scope: !910)
!931 = !DILocation(line: 8, column: 28, scope: !910)
!932 = !DILocation(line: 0, scope: !910)
!933 = !DILocation(line: 10, column: 10, scope: !934)
!934 = distinct !DILexicalBlock(scope: !910, file: !911, line: 9, column: 5)
!935 = distinct !{!935, !924, !936, !293}
!936 = !DILocation(line: 11, column: 5, scope: !910)
!937 = !DILocation(line: 13, column: 9, scope: !938)
!938 = distinct !DILexicalBlock(scope: !910, file: !911, line: 13, column: 9)
!939 = !DILocation(line: 13, column: 14, scope: !938)
!940 = !DILocation(line: 13, column: 17, scope: !938)
!941 = !DILocation(line: 13, column: 9, scope: !910)
!942 = !DILocation(line: 15, column: 10, scope: !943)
!943 = distinct !DILexicalBlock(scope: !938, file: !911, line: 14, column: 5)
!944 = !DILocation(line: 16, column: 5, scope: !943)
!945 = !DILocation(line: 17, column: 14, scope: !946)
!946 = distinct !DILexicalBlock(scope: !938, file: !911, line: 17, column: 14)
!947 = !DILocation(line: 17, column: 19, scope: !946)
!948 = !DILocation(line: 17, column: 22, scope: !946)
!949 = !DILocation(line: 17, column: 14, scope: !938)
!950 = !DILocation(line: 19, column: 14, scope: !951)
!951 = distinct !DILexicalBlock(scope: !946, file: !911, line: 18, column: 5)
!952 = !DILocation(line: 20, column: 10, scope: !951)
!953 = !DILocation(line: 21, column: 5, scope: !951)
!954 = !DILocation(line: 23, column: 5, scope: !910)
!955 = !DILocation(line: 23, column: 12, scope: !910)
!956 = !DILocation(line: 23, column: 17, scope: !910)
!957 = !DILocation(line: 23, column: 20, scope: !910)
!958 = !DILocation(line: 23, column: 25, scope: !910)
!959 = !DILocation(line: 23, column: 52, scope: !910)
!960 = !DILocation(line: 23, column: 57, scope: !910)
!961 = !DILocation(line: 23, column: 28, scope: !910)
!962 = !DILocation(line: 25, column: 18, scope: !963)
!963 = distinct !DILexicalBlock(scope: !910, file: !911, line: 24, column: 5)
!964 = !DILocation(line: 25, column: 25, scope: !963)
!965 = !DILocation(line: 25, column: 33, scope: !963)
!966 = !DILocation(line: 25, column: 38, scope: !963)
!967 = !DILocation(line: 25, column: 41, scope: !963)
!968 = !DILocation(line: 25, column: 32, scope: !963)
!969 = !DILocation(line: 25, column: 30, scope: !963)
!970 = !DILocation(line: 25, column: 16, scope: !963)
!971 = !DILocation(line: 26, column: 10, scope: !963)
!972 = distinct !{!972, !954, !973, !293}
!973 = !DILocation(line: 27, column: 5, scope: !910)
!974 = !DILocation(line: 29, column: 12, scope: !910)
!975 = !DILocation(line: 29, column: 19, scope: !910)
!976 = !DILocation(line: 29, column: 17, scope: !910)
!977 = !DILocation(line: 29, column: 5, scope: !910)
!978 = distinct !DISubprogram(name: "__fizzer_model__strtoul", scope: !979, file: !979, line: 2, type: !980, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !63)
!979 = !DIFile(filename: "data/models/c/std/stdlib/strtoul.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "edaf3dbca4ae2e5ae7dd393d65e176da")
!980 = !DISubroutineType(types: !981)
!981 = !{!252, !73, !552, !6}
!982 = !DILocalVariable(name: "nptr", arg: 1, scope: !978, file: !979, line: 2, type: !73)
!983 = !DILocation(line: 2, column: 51, scope: !978)
!984 = !DILocalVariable(name: "endptr", arg: 2, scope: !978, file: !979, line: 2, type: !552)
!985 = !DILocation(line: 2, column: 64, scope: !978)
!986 = !DILocalVariable(name: "base", arg: 3, scope: !978, file: !979, line: 2, type: !6)
!987 = !DILocation(line: 2, column: 76, scope: !978)
!988 = !DILocalVariable(name: "result", scope: !978, file: !979, line: 4, type: !252)
!989 = !DILocation(line: 4, column: 19, scope: !978)
!990 = !DILocalVariable(name: "i", scope: !978, file: !979, line: 5, type: !991)
!991 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !992, line: 6, baseType: !252)
!992 = !DIFile(filename: "data/models/c/std/stdlib/strtoul.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "34874f151f8ea8334fcbf34c096cdb20")
!993 = !DILocation(line: 5, column: 12, scope: !978)
!994 = !DILocation(line: 7, column: 9, scope: !995)
!995 = distinct !DILexicalBlock(scope: !978, file: !979, line: 7, column: 9)
!996 = !DILocation(line: 7, column: 14, scope: !995)
!997 = !DILocation(line: 7, column: 9, scope: !978)
!998 = !DILocation(line: 9, column: 13, scope: !999)
!999 = distinct !DILexicalBlock(scope: !1000, file: !979, line: 9, column: 13)
!1000 = distinct !DILexicalBlock(scope: !995, file: !979, line: 8, column: 5)
!1001 = !DILocation(line: 9, column: 20, scope: !999)
!1002 = !DILocation(line: 9, column: 13, scope: !1000)
!1003 = !DILocation(line: 11, column: 31, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !999, file: !979, line: 10, column: 9)
!1005 = !DILocation(line: 11, column: 14, scope: !1004)
!1006 = !DILocation(line: 11, column: 21, scope: !1004)
!1007 = !DILocation(line: 12, column: 9, scope: !1004)
!1008 = !DILocation(line: 13, column: 9, scope: !1000)
!1009 = !DILocation(line: 16, column: 5, scope: !978)
!1010 = !DILocation(line: 16, column: 12, scope: !978)
!1011 = !DILocation(line: 16, column: 17, scope: !978)
!1012 = !DILocation(line: 16, column: 20, scope: !978)
!1013 = !DILocation(line: 16, column: 25, scope: !978)
!1014 = !DILocation(line: 16, column: 52, scope: !978)
!1015 = !DILocation(line: 16, column: 57, scope: !978)
!1016 = !DILocation(line: 16, column: 28, scope: !978)
!1017 = !DILocation(line: 0, scope: !978)
!1018 = !DILocation(line: 18, column: 10, scope: !1019)
!1019 = distinct !DILexicalBlock(scope: !978, file: !979, line: 17, column: 5)
!1020 = distinct !{!1020, !1009, !1021, !293}
!1021 = !DILocation(line: 19, column: 5, scope: !978)
!1022 = !DILocation(line: 22, column: 9, scope: !1023)
!1023 = distinct !DILexicalBlock(scope: !978, file: !979, line: 22, column: 9)
!1024 = !DILocation(line: 22, column: 14, scope: !1023)
!1025 = !DILocation(line: 22, column: 17, scope: !1023)
!1026 = !DILocation(line: 22, column: 9, scope: !978)
!1027 = !DILocation(line: 24, column: 10, scope: !1028)
!1028 = distinct !DILexicalBlock(scope: !1023, file: !979, line: 23, column: 5)
!1029 = !DILocation(line: 25, column: 5, scope: !1028)
!1030 = !DILocalVariable(name: "start", scope: !978, file: !979, line: 27, type: !991)
!1031 = !DILocation(line: 27, column: 12, scope: !978)
!1032 = !DILocation(line: 27, column: 20, scope: !978)
!1033 = !DILocation(line: 29, column: 5, scope: !978)
!1034 = !DILocation(line: 29, column: 12, scope: !978)
!1035 = !DILocation(line: 29, column: 17, scope: !978)
!1036 = !DILocation(line: 29, column: 20, scope: !978)
!1037 = !DILocation(line: 29, column: 25, scope: !978)
!1038 = !DILocation(line: 29, column: 52, scope: !978)
!1039 = !DILocation(line: 29, column: 57, scope: !978)
!1040 = !DILocation(line: 29, column: 28, scope: !978)
!1041 = !DILocation(line: 31, column: 18, scope: !1042)
!1042 = distinct !DILexicalBlock(scope: !978, file: !979, line: 30, column: 5)
!1043 = !DILocation(line: 31, column: 25, scope: !1042)
!1044 = !DILocation(line: 31, column: 33, scope: !1042)
!1045 = !DILocation(line: 31, column: 38, scope: !1042)
!1046 = !DILocation(line: 31, column: 41, scope: !1042)
!1047 = !DILocation(line: 31, column: 32, scope: !1042)
!1048 = !DILocation(line: 31, column: 30, scope: !1042)
!1049 = !DILocation(line: 31, column: 16, scope: !1042)
!1050 = !DILocation(line: 32, column: 10, scope: !1042)
!1051 = distinct !{!1051, !1033, !1052, !293}
!1052 = !DILocation(line: 33, column: 5, scope: !978)
!1053 = !DILocation(line: 35, column: 9, scope: !1054)
!1054 = distinct !DILexicalBlock(scope: !978, file: !979, line: 35, column: 9)
!1055 = !DILocation(line: 35, column: 16, scope: !1054)
!1056 = !DILocation(line: 35, column: 9, scope: !978)
!1057 = !DILocation(line: 37, column: 28, scope: !1058)
!1058 = distinct !DILexicalBlock(scope: !1054, file: !979, line: 36, column: 5)
!1059 = !DILocation(line: 37, column: 35, scope: !1058)
!1060 = !DILocation(line: 37, column: 33, scope: !1058)
!1061 = !DILocation(line: 37, column: 10, scope: !1058)
!1062 = !DILocation(line: 37, column: 17, scope: !1058)
!1063 = !DILocation(line: 38, column: 5, scope: !1058)
!1064 = !DILocation(line: 40, column: 12, scope: !978)
!1065 = !DILocation(line: 40, column: 5, scope: !978)
!1066 = !DILocation(line: 41, column: 1, scope: !978)
!1067 = distinct !DISubprogram(name: "__fizzer_model__atoi", scope: !1068, file: !1068, line: 2, type: !1069, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !102, retainedNodes: !63)
!1068 = !DIFile(filename: "data/models/c/std/stdlib/atoi.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "25ff8cf0c3b1eb16133d1fa2f6f4599f")
!1069 = !DISubroutineType(types: !1070)
!1070 = !{!6, !73}
!1071 = !DILocalVariable(name: "nptr", arg: 1, scope: !1067, file: !1068, line: 2, type: !73)
!1072 = !DILocation(line: 2, column: 38, scope: !1067)
!1073 = !DILocalVariable(name: "result", scope: !1067, file: !1068, line: 4, type: !6)
!1074 = !DILocation(line: 4, column: 9, scope: !1067)
!1075 = !DILocalVariable(name: "sign", scope: !1067, file: !1068, line: 5, type: !6)
!1076 = !DILocation(line: 5, column: 9, scope: !1067)
!1077 = !DILocalVariable(name: "i", scope: !1067, file: !1068, line: 6, type: !1078)
!1078 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1079, line: 6, baseType: !252)
!1079 = !DIFile(filename: "data/models/c/std/stdlib/atoi.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "7570ed2f727a93bc5429216171743e1c")
!1080 = !DILocation(line: 6, column: 12, scope: !1067)
!1081 = !DILocation(line: 9, column: 5, scope: !1067)
!1082 = !DILocation(line: 9, column: 12, scope: !1067)
!1083 = !DILocation(line: 9, column: 17, scope: !1067)
!1084 = !DILocation(line: 9, column: 20, scope: !1067)
!1085 = !DILocation(line: 9, column: 25, scope: !1067)
!1086 = !DILocation(line: 9, column: 52, scope: !1067)
!1087 = !DILocation(line: 9, column: 57, scope: !1067)
!1088 = !DILocation(line: 9, column: 28, scope: !1067)
!1089 = !DILocation(line: 0, scope: !1067)
!1090 = !DILocation(line: 11, column: 10, scope: !1091)
!1091 = distinct !DILexicalBlock(scope: !1067, file: !1068, line: 10, column: 5)
!1092 = distinct !{!1092, !1081, !1093, !293}
!1093 = !DILocation(line: 12, column: 5, scope: !1067)
!1094 = !DILocation(line: 15, column: 9, scope: !1095)
!1095 = distinct !DILexicalBlock(scope: !1067, file: !1068, line: 15, column: 9)
!1096 = !DILocation(line: 15, column: 14, scope: !1095)
!1097 = !DILocation(line: 15, column: 17, scope: !1095)
!1098 = !DILocation(line: 15, column: 9, scope: !1067)
!1099 = !DILocation(line: 17, column: 10, scope: !1100)
!1100 = distinct !DILexicalBlock(scope: !1095, file: !1068, line: 16, column: 5)
!1101 = !DILocation(line: 18, column: 5, scope: !1100)
!1102 = !DILocation(line: 19, column: 14, scope: !1103)
!1103 = distinct !DILexicalBlock(scope: !1095, file: !1068, line: 19, column: 14)
!1104 = !DILocation(line: 19, column: 19, scope: !1103)
!1105 = !DILocation(line: 19, column: 22, scope: !1103)
!1106 = !DILocation(line: 19, column: 14, scope: !1095)
!1107 = !DILocation(line: 21, column: 14, scope: !1108)
!1108 = distinct !DILexicalBlock(scope: !1103, file: !1068, line: 20, column: 5)
!1109 = !DILocation(line: 22, column: 10, scope: !1108)
!1110 = !DILocation(line: 23, column: 5, scope: !1108)
!1111 = !DILocation(line: 26, column: 5, scope: !1067)
!1112 = !DILocation(line: 26, column: 12, scope: !1067)
!1113 = !DILocation(line: 26, column: 17, scope: !1067)
!1114 = !DILocation(line: 26, column: 20, scope: !1067)
!1115 = !DILocation(line: 26, column: 25, scope: !1067)
!1116 = !DILocation(line: 26, column: 52, scope: !1067)
!1117 = !DILocation(line: 26, column: 57, scope: !1067)
!1118 = !DILocation(line: 26, column: 28, scope: !1067)
!1119 = !DILocation(line: 28, column: 18, scope: !1120)
!1120 = distinct !DILexicalBlock(scope: !1067, file: !1068, line: 27, column: 5)
!1121 = !DILocation(line: 28, column: 25, scope: !1120)
!1122 = !DILocation(line: 28, column: 33, scope: !1120)
!1123 = !DILocation(line: 28, column: 38, scope: !1120)
!1124 = !DILocation(line: 28, column: 41, scope: !1120)
!1125 = !DILocation(line: 28, column: 30, scope: !1120)
!1126 = !DILocation(line: 28, column: 16, scope: !1120)
!1127 = !DILocation(line: 29, column: 10, scope: !1120)
!1128 = distinct !{!1128, !1111, !1129, !293}
!1129 = !DILocation(line: 30, column: 5, scope: !1067)
!1130 = !DILocation(line: 32, column: 12, scope: !1067)
!1131 = !DILocation(line: 32, column: 19, scope: !1067)
!1132 = !DILocation(line: 32, column: 17, scope: !1067)
!1133 = !DILocation(line: 32, column: 5, scope: !1067)
!1134 = distinct !DISubprogram(name: "__fizzer_model__strstr", scope: !1135, file: !1135, line: 2, type: !1136, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !104, retainedNodes: !63)
!1135 = !DIFile(filename: "data/models/c/std/string/strstr.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "88fd7ab45b37086df2d2f42655100238")
!1136 = !DISubroutineType(types: !1137)
!1137 = !{!13, !73, !73}
!1138 = !DILocalVariable(name: "haystack", arg: 1, scope: !1134, file: !1135, line: 2, type: !73)
!1139 = !DILocation(line: 2, column: 42, scope: !1134)
!1140 = !DILocalVariable(name: "needle", arg: 2, scope: !1134, file: !1135, line: 2, type: !73)
!1141 = !DILocation(line: 2, column: 64, scope: !1134)
!1142 = !DILocation(line: 4, column: 10, scope: !1143)
!1143 = distinct !DILexicalBlock(scope: !1134, file: !1135, line: 4, column: 9)
!1144 = !DILocation(line: 4, column: 9, scope: !1143)
!1145 = !DILocation(line: 4, column: 17, scope: !1143)
!1146 = !DILocation(line: 4, column: 9, scope: !1134)
!1147 = !DILocation(line: 6, column: 24, scope: !1148)
!1148 = distinct !DILexicalBlock(scope: !1143, file: !1135, line: 5, column: 5)
!1149 = !DILocation(line: 6, column: 9, scope: !1148)
!1150 = !DILocation(line: 8, column: 5, scope: !1134)
!1151 = !DILocation(line: 8, column: 13, scope: !1134)
!1152 = !DILocation(line: 8, column: 12, scope: !1134)
!1153 = !DILocation(line: 8, column: 22, scope: !1134)
!1154 = !DILocalVariable(name: "h", scope: !1155, file: !1135, line: 10, type: !73)
!1155 = distinct !DILexicalBlock(scope: !1134, file: !1135, line: 9, column: 5)
!1156 = !DILocation(line: 10, column: 21, scope: !1155)
!1157 = !DILocation(line: 10, column: 25, scope: !1155)
!1158 = !DILocalVariable(name: "n", scope: !1155, file: !1135, line: 11, type: !73)
!1159 = !DILocation(line: 11, column: 21, scope: !1155)
!1160 = !DILocation(line: 11, column: 25, scope: !1155)
!1161 = !DILocation(line: 12, column: 9, scope: !1155)
!1162 = !DILocation(line: 12, column: 17, scope: !1155)
!1163 = !DILocation(line: 12, column: 16, scope: !1155)
!1164 = !DILocation(line: 12, column: 19, scope: !1155)
!1165 = !DILocation(line: 12, column: 24, scope: !1155)
!1166 = !DILocation(line: 12, column: 28, scope: !1155)
!1167 = !DILocation(line: 12, column: 27, scope: !1155)
!1168 = !DILocation(line: 12, column: 30, scope: !1155)
!1169 = !DILocation(line: 12, column: 35, scope: !1155)
!1170 = !DILocation(line: 12, column: 39, scope: !1155)
!1171 = !DILocation(line: 12, column: 38, scope: !1155)
!1172 = !DILocation(line: 12, column: 45, scope: !1155)
!1173 = !DILocation(line: 12, column: 44, scope: !1155)
!1174 = !DILocation(line: 12, column: 41, scope: !1155)
!1175 = !DILocation(line: 0, scope: !1155)
!1176 = !DILocation(line: 14, column: 14, scope: !1177)
!1177 = distinct !DILexicalBlock(scope: !1155, file: !1135, line: 13, column: 9)
!1178 = !DILocation(line: 15, column: 14, scope: !1177)
!1179 = distinct !{!1179, !1161, !1180, !293}
!1180 = !DILocation(line: 16, column: 9, scope: !1155)
!1181 = !DILocation(line: 17, column: 14, scope: !1182)
!1182 = distinct !DILexicalBlock(scope: !1155, file: !1135, line: 17, column: 13)
!1183 = !DILocation(line: 17, column: 13, scope: !1182)
!1184 = !DILocation(line: 17, column: 16, scope: !1182)
!1185 = !DILocation(line: 17, column: 13, scope: !1155)
!1186 = !DILocation(line: 19, column: 28, scope: !1187)
!1187 = distinct !DILexicalBlock(scope: !1182, file: !1135, line: 18, column: 9)
!1188 = !DILocation(line: 19, column: 13, scope: !1187)
!1189 = !DILocation(line: 21, column: 17, scope: !1155)
!1190 = distinct !{!1190, !1150, !1191, !293}
!1191 = !DILocation(line: 22, column: 5, scope: !1134)
!1192 = !DILocation(line: 23, column: 5, scope: !1134)
!1193 = !DILocation(line: 24, column: 1, scope: !1134)
!1194 = distinct !DISubprogram(name: "__fizzer_model__strpbrk", scope: !1195, file: !1195, line: 2, type: !1136, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !106, retainedNodes: !63)
!1195 = !DIFile(filename: "data/models/c/std/string/strpbrk.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "f90ee9e8ce652e3236917e969fe7e0af")
!1196 = !DILocalVariable(name: "s", arg: 1, scope: !1194, file: !1195, line: 2, type: !73)
!1197 = !DILocation(line: 2, column: 43, scope: !1194)
!1198 = !DILocalVariable(name: "accept", arg: 2, scope: !1194, file: !1195, line: 2, type: !73)
!1199 = !DILocation(line: 2, column: 58, scope: !1194)
!1200 = !DILocation(line: 4, column: 5, scope: !1194)
!1201 = !DILocation(line: 4, column: 13, scope: !1194)
!1202 = !DILocation(line: 4, column: 12, scope: !1194)
!1203 = !DILocation(line: 4, column: 15, scope: !1194)
!1204 = !DILocalVariable(name: "a", scope: !1205, file: !1195, line: 6, type: !73)
!1205 = distinct !DILexicalBlock(scope: !1194, file: !1195, line: 5, column: 5)
!1206 = !DILocation(line: 6, column: 21, scope: !1205)
!1207 = !DILocation(line: 6, column: 25, scope: !1205)
!1208 = !DILocation(line: 7, column: 9, scope: !1205)
!1209 = !DILocation(line: 7, column: 17, scope: !1205)
!1210 = !DILocation(line: 7, column: 16, scope: !1205)
!1211 = !DILocation(line: 7, column: 19, scope: !1205)
!1212 = !DILocation(line: 9, column: 18, scope: !1213)
!1213 = distinct !DILexicalBlock(scope: !1214, file: !1195, line: 9, column: 17)
!1214 = distinct !DILexicalBlock(scope: !1205, file: !1195, line: 8, column: 9)
!1215 = !DILocation(line: 9, column: 17, scope: !1213)
!1216 = !DILocation(line: 9, column: 24, scope: !1213)
!1217 = !DILocation(line: 9, column: 23, scope: !1213)
!1218 = !DILocation(line: 9, column: 20, scope: !1213)
!1219 = !DILocation(line: 9, column: 17, scope: !1214)
!1220 = !DILocation(line: 11, column: 32, scope: !1221)
!1221 = distinct !DILexicalBlock(scope: !1213, file: !1195, line: 10, column: 13)
!1222 = !DILocation(line: 11, column: 17, scope: !1221)
!1223 = !DILocation(line: 13, column: 14, scope: !1214)
!1224 = distinct !{!1224, !1208, !1225, !293}
!1225 = !DILocation(line: 14, column: 9, scope: !1205)
!1226 = !DILocation(line: 15, column: 10, scope: !1205)
!1227 = distinct !{!1227, !1200, !1228, !293}
!1228 = !DILocation(line: 16, column: 5, scope: !1194)
!1229 = !DILocation(line: 17, column: 5, scope: !1194)
!1230 = !DILocation(line: 18, column: 1, scope: !1194)
!1231 = distinct !DISubprogram(name: "__fizzer_model__strcpy", scope: !1232, file: !1232, line: 2, type: !71, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !108, retainedNodes: !63)
!1232 = !DIFile(filename: "data/models/c/std/string/strcpy.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "a9d5e5946be9d668420164bcb8d1da5f")
!1233 = !DILocalVariable(name: "dest", arg: 1, scope: !1231, file: !1232, line: 2, type: !13)
!1234 = !DILocation(line: 2, column: 36, scope: !1231)
!1235 = !DILocalVariable(name: "src", arg: 2, scope: !1231, file: !1232, line: 2, type: !73)
!1236 = !DILocation(line: 2, column: 54, scope: !1231)
!1237 = !DILocalVariable(name: "d", scope: !1231, file: !1232, line: 4, type: !13)
!1238 = !DILocation(line: 4, column: 11, scope: !1231)
!1239 = !DILocation(line: 4, column: 15, scope: !1231)
!1240 = !DILocation(line: 5, column: 5, scope: !1231)
!1241 = !DILocation(line: 5, column: 13, scope: !1231)
!1242 = !DILocation(line: 5, column: 12, scope: !1231)
!1243 = !DILocation(line: 5, column: 17, scope: !1231)
!1244 = !DILocation(line: 7, column: 15, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1231, file: !1232, line: 6, column: 5)
!1246 = !DILocation(line: 7, column: 14, scope: !1245)
!1247 = !DILocation(line: 7, column: 10, scope: !1245)
!1248 = !DILocation(line: 7, column: 12, scope: !1245)
!1249 = !DILocation(line: 8, column: 10, scope: !1245)
!1250 = !DILocation(line: 9, column: 12, scope: !1245)
!1251 = distinct !{!1251, !1240, !1252, !293}
!1252 = !DILocation(line: 10, column: 5, scope: !1231)
!1253 = !DILocation(line: 11, column: 6, scope: !1231)
!1254 = !DILocation(line: 11, column: 8, scope: !1231)
!1255 = !DILocation(line: 12, column: 12, scope: !1231)
!1256 = !DILocation(line: 12, column: 5, scope: !1231)
!1257 = distinct !DISubprogram(name: "__fizzer_model__strncat", scope: !1258, file: !1258, line: 2, type: !1259, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !110, retainedNodes: !63)
!1258 = !DIFile(filename: "data/models/c/std/string/strncat.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "1734f838e35184e8c456b32046d1ee07")
!1259 = !DISubroutineType(types: !1260)
!1260 = !{!13, !13, !73, !1261}
!1261 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1262, line: 6, baseType: !252)
!1262 = !DIFile(filename: "data/models/c/std/string/strncat.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "c3654096277bccf248969a0055808a98")
!1263 = !DILocalVariable(name: "dest", arg: 1, scope: !1257, file: !1258, line: 2, type: !13)
!1264 = !DILocation(line: 2, column: 37, scope: !1257)
!1265 = !DILocalVariable(name: "src", arg: 2, scope: !1257, file: !1258, line: 2, type: !73)
!1266 = !DILocation(line: 2, column: 55, scope: !1257)
!1267 = !DILocalVariable(name: "n", arg: 3, scope: !1257, file: !1258, line: 2, type: !1261)
!1268 = !DILocation(line: 2, column: 67, scope: !1257)
!1269 = !DILocalVariable(name: "d", scope: !1257, file: !1258, line: 4, type: !13)
!1270 = !DILocation(line: 4, column: 11, scope: !1257)
!1271 = !DILocation(line: 4, column: 15, scope: !1257)
!1272 = !DILocation(line: 5, column: 5, scope: !1257)
!1273 = !DILocation(line: 5, column: 13, scope: !1257)
!1274 = !DILocation(line: 5, column: 12, scope: !1257)
!1275 = !DILocation(line: 5, column: 15, scope: !1257)
!1276 = !DILocation(line: 7, column: 10, scope: !1277)
!1277 = distinct !DILexicalBlock(scope: !1257, file: !1258, line: 6, column: 5)
!1278 = distinct !{!1278, !1272, !1279, !293}
!1279 = !DILocation(line: 8, column: 5, scope: !1257)
!1280 = !DILocalVariable(name: "i", scope: !1257, file: !1258, line: 9, type: !1261)
!1281 = !DILocation(line: 9, column: 12, scope: !1257)
!1282 = !DILocation(line: 10, column: 5, scope: !1257)
!1283 = !DILocation(line: 10, column: 12, scope: !1257)
!1284 = !DILocation(line: 10, column: 16, scope: !1257)
!1285 = !DILocation(line: 10, column: 14, scope: !1257)
!1286 = !DILocation(line: 10, column: 18, scope: !1257)
!1287 = !DILocation(line: 10, column: 22, scope: !1257)
!1288 = !DILocation(line: 10, column: 21, scope: !1257)
!1289 = !DILocation(line: 10, column: 26, scope: !1257)
!1290 = !DILocation(line: 0, scope: !1257)
!1291 = !DILocation(line: 12, column: 15, scope: !1292)
!1292 = distinct !DILexicalBlock(scope: !1257, file: !1258, line: 11, column: 5)
!1293 = !DILocation(line: 12, column: 14, scope: !1292)
!1294 = !DILocation(line: 12, column: 10, scope: !1292)
!1295 = !DILocation(line: 12, column: 12, scope: !1292)
!1296 = !DILocation(line: 13, column: 10, scope: !1292)
!1297 = !DILocation(line: 14, column: 12, scope: !1292)
!1298 = !DILocation(line: 15, column: 10, scope: !1292)
!1299 = distinct !{!1299, !1282, !1300, !293}
!1300 = !DILocation(line: 16, column: 5, scope: !1257)
!1301 = !DILocation(line: 17, column: 6, scope: !1257)
!1302 = !DILocation(line: 17, column: 8, scope: !1257)
!1303 = !DILocation(line: 18, column: 12, scope: !1257)
!1304 = !DILocation(line: 18, column: 5, scope: !1257)
!1305 = distinct !DISubprogram(name: "__fizzer_model__strcspn", scope: !1306, file: !1306, line: 2, type: !1307, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !112, retainedNodes: !63)
!1306 = !DIFile(filename: "data/models/c/std/string/strcspn.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "2f7cd216c9e6f8edb02d5afb4ea11b44")
!1307 = !DISubroutineType(types: !1308)
!1308 = !{!1309, !73, !73}
!1309 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1310, line: 6, baseType: !252)
!1310 = !DIFile(filename: "data/models/c/std/string/strcspn.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "14201ac4b9600306ae68639f4954a548")
!1311 = !DILocalVariable(name: "s", arg: 1, scope: !1305, file: !1306, line: 2, type: !73)
!1312 = !DILocation(line: 2, column: 44, scope: !1305)
!1313 = !DILocalVariable(name: "reject", arg: 2, scope: !1305, file: !1306, line: 2, type: !73)
!1314 = !DILocation(line: 2, column: 59, scope: !1305)
!1315 = !DILocalVariable(name: "count", scope: !1305, file: !1306, line: 4, type: !1309)
!1316 = !DILocation(line: 4, column: 12, scope: !1305)
!1317 = !DILocation(line: 5, column: 5, scope: !1305)
!1318 = !DILocation(line: 5, column: 13, scope: !1305)
!1319 = !DILocation(line: 5, column: 12, scope: !1305)
!1320 = !DILocation(line: 5, column: 15, scope: !1305)
!1321 = !DILocalVariable(name: "r", scope: !1322, file: !1306, line: 7, type: !73)
!1322 = distinct !DILexicalBlock(scope: !1305, file: !1306, line: 6, column: 5)
!1323 = !DILocation(line: 7, column: 21, scope: !1322)
!1324 = !DILocation(line: 7, column: 25, scope: !1322)
!1325 = !DILocation(line: 8, column: 9, scope: !1322)
!1326 = !DILocation(line: 8, column: 17, scope: !1322)
!1327 = !DILocation(line: 8, column: 16, scope: !1322)
!1328 = !DILocation(line: 8, column: 19, scope: !1322)
!1329 = !DILocation(line: 8, column: 24, scope: !1322)
!1330 = !DILocation(line: 8, column: 28, scope: !1322)
!1331 = !DILocation(line: 8, column: 27, scope: !1322)
!1332 = !DILocation(line: 8, column: 34, scope: !1322)
!1333 = !DILocation(line: 8, column: 33, scope: !1322)
!1334 = !DILocation(line: 8, column: 30, scope: !1322)
!1335 = !DILocation(line: 0, scope: !1322)
!1336 = !DILocation(line: 10, column: 14, scope: !1337)
!1337 = distinct !DILexicalBlock(scope: !1322, file: !1306, line: 9, column: 9)
!1338 = distinct !{!1338, !1325, !1339, !293}
!1339 = !DILocation(line: 11, column: 9, scope: !1322)
!1340 = !DILocation(line: 12, column: 14, scope: !1341)
!1341 = distinct !DILexicalBlock(scope: !1322, file: !1306, line: 12, column: 13)
!1342 = !DILocation(line: 12, column: 13, scope: !1341)
!1343 = !DILocation(line: 12, column: 16, scope: !1341)
!1344 = !DILocation(line: 12, column: 13, scope: !1322)
!1345 = !DILocation(line: 14, column: 13, scope: !1346)
!1346 = distinct !DILexicalBlock(scope: !1341, file: !1306, line: 13, column: 9)
!1347 = !DILocation(line: 16, column: 14, scope: !1322)
!1348 = !DILocation(line: 17, column: 10, scope: !1322)
!1349 = distinct !{!1349, !1317, !1350, !293}
!1350 = !DILocation(line: 18, column: 5, scope: !1305)
!1351 = !DILocation(line: 19, column: 12, scope: !1305)
!1352 = !DILocation(line: 19, column: 5, scope: !1305)
!1353 = distinct !DISubprogram(name: "__fizzer_model__strcoll", scope: !1354, file: !1354, line: 2, type: !1355, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !114, retainedNodes: !63)
!1354 = !DIFile(filename: "data/models/c/std/string/strcoll.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "594081383e127900a617071ac71187f1")
!1355 = !DISubroutineType(types: !1356)
!1356 = !{!6, !73, !73}
!1357 = !DILocalVariable(name: "s1", arg: 1, scope: !1353, file: !1354, line: 2, type: !73)
!1358 = !DILocation(line: 2, column: 41, scope: !1353)
!1359 = !DILocalVariable(name: "s2", arg: 2, scope: !1353, file: !1354, line: 2, type: !73)
!1360 = !DILocation(line: 2, column: 57, scope: !1353)
!1361 = !DILocation(line: 4, column: 5, scope: !1353)
!1362 = !DILocation(line: 4, column: 13, scope: !1353)
!1363 = !DILocation(line: 4, column: 12, scope: !1353)
!1364 = !DILocation(line: 4, column: 16, scope: !1353)
!1365 = !DILocation(line: 4, column: 21, scope: !1353)
!1366 = !DILocation(line: 4, column: 25, scope: !1353)
!1367 = !DILocation(line: 4, column: 24, scope: !1353)
!1368 = !DILocation(line: 4, column: 32, scope: !1353)
!1369 = !DILocation(line: 4, column: 31, scope: !1353)
!1370 = !DILocation(line: 4, column: 28, scope: !1353)
!1371 = !DILocation(line: 0, scope: !1353)
!1372 = !DILocation(line: 6, column: 11, scope: !1373)
!1373 = distinct !DILexicalBlock(scope: !1353, file: !1354, line: 5, column: 5)
!1374 = !DILocation(line: 7, column: 11, scope: !1373)
!1375 = distinct !{!1375, !1361, !1376, !293}
!1376 = !DILocation(line: 8, column: 5, scope: !1353)
!1377 = !DILocation(line: 9, column: 34, scope: !1353)
!1378 = !DILocation(line: 9, column: 33, scope: !1353)
!1379 = !DILocation(line: 9, column: 18, scope: !1353)
!1380 = !DILocation(line: 9, column: 55, scope: !1353)
!1381 = !DILocation(line: 9, column: 54, scope: !1353)
!1382 = !DILocation(line: 9, column: 39, scope: !1353)
!1383 = !DILocation(line: 9, column: 37, scope: !1353)
!1384 = !DILocation(line: 9, column: 5, scope: !1353)
!1385 = distinct !DISubprogram(name: "__fizzer_model__strcmp", scope: !1386, file: !1386, line: 2, type: !1355, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !118, retainedNodes: !63)
!1386 = !DIFile(filename: "data/models/c/std/string/strcmp.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "e8d614ef53fc1f2814b3a79a1909aaf7")
!1387 = !DILocalVariable(name: "s1", arg: 1, scope: !1385, file: !1386, line: 2, type: !73)
!1388 = !DILocation(line: 2, column: 40, scope: !1385)
!1389 = !DILocalVariable(name: "s2", arg: 2, scope: !1385, file: !1386, line: 2, type: !73)
!1390 = !DILocation(line: 2, column: 56, scope: !1385)
!1391 = !DILocation(line: 4, column: 5, scope: !1385)
!1392 = !DILocation(line: 4, column: 13, scope: !1385)
!1393 = !DILocation(line: 4, column: 12, scope: !1385)
!1394 = !DILocation(line: 4, column: 16, scope: !1385)
!1395 = !DILocation(line: 4, column: 21, scope: !1385)
!1396 = !DILocation(line: 4, column: 25, scope: !1385)
!1397 = !DILocation(line: 4, column: 24, scope: !1385)
!1398 = !DILocation(line: 4, column: 32, scope: !1385)
!1399 = !DILocation(line: 4, column: 31, scope: !1385)
!1400 = !DILocation(line: 4, column: 28, scope: !1385)
!1401 = !DILocation(line: 0, scope: !1385)
!1402 = !DILocation(line: 6, column: 11, scope: !1403)
!1403 = distinct !DILexicalBlock(scope: !1385, file: !1386, line: 5, column: 5)
!1404 = !DILocation(line: 7, column: 11, scope: !1403)
!1405 = distinct !{!1405, !1391, !1406, !293}
!1406 = !DILocation(line: 8, column: 5, scope: !1385)
!1407 = !DILocation(line: 9, column: 34, scope: !1385)
!1408 = !DILocation(line: 9, column: 33, scope: !1385)
!1409 = !DILocation(line: 9, column: 18, scope: !1385)
!1410 = !DILocation(line: 9, column: 55, scope: !1385)
!1411 = !DILocation(line: 9, column: 54, scope: !1385)
!1412 = !DILocation(line: 9, column: 39, scope: !1385)
!1413 = !DILocation(line: 9, column: 37, scope: !1385)
!1414 = !DILocation(line: 9, column: 5, scope: !1385)
!1415 = distinct !DISubprogram(name: "__fizzer_model__strncmp", scope: !1416, file: !1416, line: 2, type: !1417, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !120, retainedNodes: !63)
!1416 = !DIFile(filename: "data/models/c/std/string/strncmp.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "e275f67b87d7e3da1256de4308f1f1ce")
!1417 = !DISubroutineType(types: !1418)
!1418 = !{!6, !73, !73, !1419}
!1419 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1420, line: 6, baseType: !252)
!1420 = !DIFile(filename: "data/models/c/std/string/strncmp.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "d722468f3764edd1057fdc528e8c267d")
!1421 = !DILocalVariable(name: "s1", arg: 1, scope: !1415, file: !1416, line: 2, type: !73)
!1422 = !DILocation(line: 2, column: 41, scope: !1415)
!1423 = !DILocalVariable(name: "s2", arg: 2, scope: !1415, file: !1416, line: 2, type: !73)
!1424 = !DILocation(line: 2, column: 57, scope: !1415)
!1425 = !DILocalVariable(name: "n", arg: 3, scope: !1415, file: !1416, line: 2, type: !1419)
!1426 = !DILocation(line: 2, column: 68, scope: !1415)
!1427 = !DILocalVariable(name: "i", scope: !1415, file: !1416, line: 4, type: !1419)
!1428 = !DILocation(line: 4, column: 12, scope: !1415)
!1429 = !DILocation(line: 5, column: 5, scope: !1415)
!1430 = !DILocation(line: 5, column: 12, scope: !1415)
!1431 = !DILocation(line: 5, column: 16, scope: !1415)
!1432 = !DILocation(line: 5, column: 14, scope: !1415)
!1433 = !DILocalVariable(name: "c1", scope: !1434, file: !1416, line: 7, type: !117)
!1434 = distinct !DILexicalBlock(scope: !1415, file: !1416, line: 6, column: 5)
!1435 = !DILocation(line: 7, column: 23, scope: !1434)
!1436 = !DILocation(line: 7, column: 43, scope: !1434)
!1437 = !DILocation(line: 7, column: 46, scope: !1434)
!1438 = !DILocalVariable(name: "c2", scope: !1434, file: !1416, line: 8, type: !117)
!1439 = !DILocation(line: 8, column: 23, scope: !1434)
!1440 = !DILocation(line: 8, column: 43, scope: !1434)
!1441 = !DILocation(line: 8, column: 46, scope: !1434)
!1442 = !DILocation(line: 9, column: 13, scope: !1443)
!1443 = distinct !DILexicalBlock(scope: !1434, file: !1416, line: 9, column: 13)
!1444 = !DILocation(line: 9, column: 19, scope: !1443)
!1445 = !DILocation(line: 9, column: 16, scope: !1443)
!1446 = !DILocation(line: 9, column: 22, scope: !1443)
!1447 = !DILocation(line: 9, column: 25, scope: !1443)
!1448 = !DILocation(line: 9, column: 28, scope: !1443)
!1449 = !DILocation(line: 9, column: 33, scope: !1443)
!1450 = !DILocation(line: 9, column: 36, scope: !1443)
!1451 = !DILocation(line: 9, column: 39, scope: !1443)
!1452 = !DILocation(line: 9, column: 13, scope: !1434)
!1453 = !DILocation(line: 11, column: 26, scope: !1454)
!1454 = distinct !DILexicalBlock(scope: !1443, file: !1416, line: 10, column: 9)
!1455 = !DILocation(line: 11, column: 31, scope: !1454)
!1456 = !DILocation(line: 11, column: 29, scope: !1454)
!1457 = !DILocation(line: 11, column: 13, scope: !1454)
!1458 = !DILocation(line: 13, column: 10, scope: !1434)
!1459 = distinct !{!1459, !1429, !1460, !293}
!1460 = !DILocation(line: 14, column: 5, scope: !1415)
!1461 = !DILocation(line: 15, column: 5, scope: !1415)
!1462 = !DILocation(line: 16, column: 1, scope: !1415)
!1463 = distinct !DISubprogram(name: "__fizzer_model__strrchr", scope: !1464, file: !1464, line: 2, type: !1465, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !63)
!1464 = !DIFile(filename: "data/models/c/std/string/strrchr.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "44079aea5c31caec0e42d813448f707f")
!1465 = !DISubroutineType(types: !1466)
!1466 = !{!13, !73, !6}
!1467 = !DILocalVariable(name: "s", arg: 1, scope: !1463, file: !1464, line: 2, type: !73)
!1468 = !DILocation(line: 2, column: 43, scope: !1463)
!1469 = !DILocalVariable(name: "c", arg: 2, scope: !1463, file: !1464, line: 2, type: !6)
!1470 = !DILocation(line: 2, column: 50, scope: !1463)
!1471 = !DILocalVariable(name: "last", scope: !1463, file: !1464, line: 4, type: !73)
!1472 = !DILocation(line: 4, column: 17, scope: !1463)
!1473 = !DILocation(line: 5, column: 5, scope: !1463)
!1474 = !DILocation(line: 5, column: 13, scope: !1463)
!1475 = !DILocation(line: 5, column: 12, scope: !1463)
!1476 = !DILocation(line: 5, column: 15, scope: !1463)
!1477 = !DILocation(line: 7, column: 14, scope: !1478)
!1478 = distinct !DILexicalBlock(scope: !1479, file: !1464, line: 7, column: 13)
!1479 = distinct !DILexicalBlock(scope: !1463, file: !1464, line: 6, column: 5)
!1480 = !DILocation(line: 7, column: 13, scope: !1478)
!1481 = !DILocation(line: 7, column: 25, scope: !1478)
!1482 = !DILocation(line: 7, column: 19, scope: !1478)
!1483 = !DILocation(line: 7, column: 16, scope: !1478)
!1484 = !DILocation(line: 7, column: 13, scope: !1479)
!1485 = !DILocation(line: 9, column: 20, scope: !1486)
!1486 = distinct !DILexicalBlock(scope: !1478, file: !1464, line: 8, column: 9)
!1487 = !DILocation(line: 9, column: 18, scope: !1486)
!1488 = !DILocation(line: 10, column: 9, scope: !1486)
!1489 = !DILocation(line: 11, column: 10, scope: !1479)
!1490 = distinct !{!1490, !1473, !1491, !293}
!1491 = !DILocation(line: 12, column: 5, scope: !1463)
!1492 = !DILocation(line: 13, column: 15, scope: !1493)
!1493 = distinct !DILexicalBlock(scope: !1463, file: !1464, line: 13, column: 9)
!1494 = !DILocation(line: 13, column: 9, scope: !1493)
!1495 = !DILocation(line: 13, column: 17, scope: !1493)
!1496 = !DILocation(line: 13, column: 9, scope: !1463)
!1497 = !DILocation(line: 15, column: 24, scope: !1498)
!1498 = distinct !DILexicalBlock(scope: !1493, file: !1464, line: 14, column: 5)
!1499 = !DILocation(line: 15, column: 9, scope: !1498)
!1500 = !DILocation(line: 17, column: 20, scope: !1463)
!1501 = !DILocation(line: 17, column: 5, scope: !1463)
!1502 = !DILocation(line: 18, column: 1, scope: !1463)
!1503 = distinct !DISubprogram(name: "__fizzer_model__strcat", scope: !1504, file: !1504, line: 2, type: !71, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !126, retainedNodes: !63)
!1504 = !DIFile(filename: "data/models/c/std/string/strcat.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "8970d2710d3c40f59dab15e8fb2774f9")
!1505 = !DILocalVariable(name: "dest", arg: 1, scope: !1503, file: !1504, line: 2, type: !13)
!1506 = !DILocation(line: 2, column: 36, scope: !1503)
!1507 = !DILocalVariable(name: "src", arg: 2, scope: !1503, file: !1504, line: 2, type: !73)
!1508 = !DILocation(line: 2, column: 54, scope: !1503)
!1509 = !DILocalVariable(name: "d", scope: !1503, file: !1504, line: 4, type: !13)
!1510 = !DILocation(line: 4, column: 11, scope: !1503)
!1511 = !DILocation(line: 4, column: 15, scope: !1503)
!1512 = !DILocation(line: 5, column: 5, scope: !1503)
!1513 = !DILocation(line: 5, column: 13, scope: !1503)
!1514 = !DILocation(line: 5, column: 12, scope: !1503)
!1515 = !DILocation(line: 5, column: 15, scope: !1503)
!1516 = !DILocation(line: 7, column: 10, scope: !1517)
!1517 = distinct !DILexicalBlock(scope: !1503, file: !1504, line: 6, column: 5)
!1518 = distinct !{!1518, !1512, !1519, !293}
!1519 = !DILocation(line: 8, column: 5, scope: !1503)
!1520 = !DILocation(line: 9, column: 5, scope: !1503)
!1521 = !DILocation(line: 9, column: 13, scope: !1503)
!1522 = !DILocation(line: 9, column: 12, scope: !1503)
!1523 = !DILocation(line: 9, column: 17, scope: !1503)
!1524 = !DILocation(line: 11, column: 15, scope: !1525)
!1525 = distinct !DILexicalBlock(scope: !1503, file: !1504, line: 10, column: 5)
!1526 = !DILocation(line: 11, column: 14, scope: !1525)
!1527 = !DILocation(line: 11, column: 10, scope: !1525)
!1528 = !DILocation(line: 11, column: 12, scope: !1525)
!1529 = !DILocation(line: 12, column: 10, scope: !1525)
!1530 = !DILocation(line: 13, column: 12, scope: !1525)
!1531 = distinct !{!1531, !1520, !1532, !293}
!1532 = !DILocation(line: 14, column: 5, scope: !1503)
!1533 = !DILocation(line: 15, column: 6, scope: !1503)
!1534 = !DILocation(line: 15, column: 8, scope: !1503)
!1535 = !DILocation(line: 16, column: 12, scope: !1503)
!1536 = !DILocation(line: 16, column: 5, scope: !1503)
!1537 = distinct !DISubprogram(name: "__fizzer_model__strspn", scope: !1538, file: !1538, line: 2, type: !1539, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !128, retainedNodes: !63)
!1538 = !DIFile(filename: "data/models/c/std/string/strspn.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "093bc709c553b9ccbb1565b54017ff4e")
!1539 = !DISubroutineType(types: !1540)
!1540 = !{!1541, !73, !73}
!1541 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1542, line: 6, baseType: !252)
!1542 = !DIFile(filename: "data/models/c/std/string/strspn.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "e204dc773920ac8c268dc68093e93bcb")
!1543 = !DILocalVariable(name: "s", arg: 1, scope: !1537, file: !1538, line: 2, type: !73)
!1544 = !DILocation(line: 2, column: 43, scope: !1537)
!1545 = !DILocalVariable(name: "accept", arg: 2, scope: !1537, file: !1538, line: 2, type: !73)
!1546 = !DILocation(line: 2, column: 58, scope: !1537)
!1547 = !DILocalVariable(name: "count", scope: !1537, file: !1538, line: 4, type: !1541)
!1548 = !DILocation(line: 4, column: 12, scope: !1537)
!1549 = !DILocation(line: 5, column: 5, scope: !1537)
!1550 = !DILocation(line: 5, column: 13, scope: !1537)
!1551 = !DILocation(line: 5, column: 12, scope: !1537)
!1552 = !DILocation(line: 5, column: 15, scope: !1537)
!1553 = !DILocalVariable(name: "a", scope: !1554, file: !1538, line: 7, type: !73)
!1554 = distinct !DILexicalBlock(scope: !1537, file: !1538, line: 6, column: 5)
!1555 = !DILocation(line: 7, column: 21, scope: !1554)
!1556 = !DILocation(line: 7, column: 25, scope: !1554)
!1557 = !DILocation(line: 8, column: 9, scope: !1554)
!1558 = !DILocation(line: 8, column: 17, scope: !1554)
!1559 = !DILocation(line: 8, column: 16, scope: !1554)
!1560 = !DILocation(line: 8, column: 19, scope: !1554)
!1561 = !DILocation(line: 8, column: 24, scope: !1554)
!1562 = !DILocation(line: 8, column: 28, scope: !1554)
!1563 = !DILocation(line: 8, column: 27, scope: !1554)
!1564 = !DILocation(line: 8, column: 34, scope: !1554)
!1565 = !DILocation(line: 8, column: 33, scope: !1554)
!1566 = !DILocation(line: 8, column: 30, scope: !1554)
!1567 = !DILocation(line: 0, scope: !1554)
!1568 = !DILocation(line: 10, column: 14, scope: !1569)
!1569 = distinct !DILexicalBlock(scope: !1554, file: !1538, line: 9, column: 9)
!1570 = distinct !{!1570, !1557, !1571, !293}
!1571 = !DILocation(line: 11, column: 9, scope: !1554)
!1572 = !DILocation(line: 12, column: 14, scope: !1573)
!1573 = distinct !DILexicalBlock(scope: !1554, file: !1538, line: 12, column: 13)
!1574 = !DILocation(line: 12, column: 13, scope: !1573)
!1575 = !DILocation(line: 12, column: 16, scope: !1573)
!1576 = !DILocation(line: 12, column: 13, scope: !1554)
!1577 = !DILocation(line: 14, column: 13, scope: !1578)
!1578 = distinct !DILexicalBlock(scope: !1573, file: !1538, line: 13, column: 9)
!1579 = !DILocation(line: 16, column: 14, scope: !1554)
!1580 = !DILocation(line: 17, column: 10, scope: !1554)
!1581 = distinct !{!1581, !1549, !1582, !293}
!1582 = !DILocation(line: 18, column: 5, scope: !1537)
!1583 = !DILocation(line: 19, column: 12, scope: !1537)
!1584 = !DILocation(line: 19, column: 5, scope: !1537)
!1585 = distinct !DISubprogram(name: "__fizzer_model__strncpy", scope: !1586, file: !1586, line: 2, type: !1587, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !130, retainedNodes: !63)
!1586 = !DIFile(filename: "data/models/c/std/string/strncpy.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "4b1e33fa2c1188492810829cb7ad397c")
!1587 = !DISubroutineType(types: !1588)
!1588 = !{!13, !13, !73, !1589}
!1589 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1590, line: 6, baseType: !252)
!1590 = !DIFile(filename: "data/models/c/std/string/strncpy.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "05e0494f8da850b7625fd57dcdc37446")
!1591 = !DILocalVariable(name: "dest", arg: 1, scope: !1585, file: !1586, line: 2, type: !13)
!1592 = !DILocation(line: 2, column: 37, scope: !1585)
!1593 = !DILocalVariable(name: "src", arg: 2, scope: !1585, file: !1586, line: 2, type: !73)
!1594 = !DILocation(line: 2, column: 55, scope: !1585)
!1595 = !DILocalVariable(name: "n", arg: 3, scope: !1585, file: !1586, line: 2, type: !1589)
!1596 = !DILocation(line: 2, column: 67, scope: !1585)
!1597 = !DILocalVariable(name: "i", scope: !1585, file: !1586, line: 4, type: !1589)
!1598 = !DILocation(line: 4, column: 12, scope: !1585)
!1599 = !DILocation(line: 5, column: 5, scope: !1585)
!1600 = !DILocation(line: 5, column: 12, scope: !1585)
!1601 = !DILocation(line: 5, column: 16, scope: !1585)
!1602 = !DILocation(line: 5, column: 14, scope: !1585)
!1603 = !DILocation(line: 5, column: 18, scope: !1585)
!1604 = !DILocation(line: 5, column: 21, scope: !1585)
!1605 = !DILocation(line: 5, column: 25, scope: !1585)
!1606 = !DILocation(line: 5, column: 28, scope: !1585)
!1607 = !DILocation(line: 0, scope: !1585)
!1608 = !DILocation(line: 7, column: 19, scope: !1609)
!1609 = distinct !DILexicalBlock(scope: !1585, file: !1586, line: 6, column: 5)
!1610 = !DILocation(line: 7, column: 23, scope: !1609)
!1611 = !DILocation(line: 7, column: 9, scope: !1609)
!1612 = !DILocation(line: 7, column: 14, scope: !1609)
!1613 = !DILocation(line: 7, column: 17, scope: !1609)
!1614 = !DILocation(line: 8, column: 10, scope: !1609)
!1615 = distinct !{!1615, !1599, !1616, !293}
!1616 = !DILocation(line: 9, column: 5, scope: !1585)
!1617 = !DILocation(line: 10, column: 5, scope: !1585)
!1618 = !DILocation(line: 10, column: 12, scope: !1585)
!1619 = !DILocation(line: 10, column: 16, scope: !1585)
!1620 = !DILocation(line: 10, column: 14, scope: !1585)
!1621 = !DILocation(line: 12, column: 9, scope: !1622)
!1622 = distinct !DILexicalBlock(scope: !1585, file: !1586, line: 11, column: 5)
!1623 = !DILocation(line: 12, column: 14, scope: !1622)
!1624 = !DILocation(line: 12, column: 17, scope: !1622)
!1625 = !DILocation(line: 13, column: 10, scope: !1622)
!1626 = distinct !{!1626, !1617, !1627, !293}
!1627 = !DILocation(line: 14, column: 5, scope: !1585)
!1628 = !DILocation(line: 15, column: 12, scope: !1585)
!1629 = !DILocation(line: 15, column: 5, scope: !1585)
!1630 = distinct !DISubprogram(name: "__fizzer_model__strchr", scope: !1631, file: !1631, line: 2, type: !1465, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !132, retainedNodes: !63)
!1631 = !DIFile(filename: "data/models/c/std/string/strchr.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "be78f81f7eb8078306a1616593746c64")
!1632 = !DILocalVariable(name: "s", arg: 1, scope: !1630, file: !1631, line: 2, type: !73)
!1633 = !DILocation(line: 2, column: 42, scope: !1630)
!1634 = !DILocalVariable(name: "c", arg: 2, scope: !1630, file: !1631, line: 2, type: !6)
!1635 = !DILocation(line: 2, column: 49, scope: !1630)
!1636 = !DILocation(line: 4, column: 5, scope: !1630)
!1637 = !DILocation(line: 4, column: 13, scope: !1630)
!1638 = !DILocation(line: 4, column: 12, scope: !1630)
!1639 = !DILocation(line: 4, column: 15, scope: !1630)
!1640 = !DILocation(line: 6, column: 14, scope: !1641)
!1641 = distinct !DILexicalBlock(scope: !1642, file: !1631, line: 6, column: 13)
!1642 = distinct !DILexicalBlock(scope: !1630, file: !1631, line: 5, column: 5)
!1643 = !DILocation(line: 6, column: 13, scope: !1641)
!1644 = !DILocation(line: 6, column: 25, scope: !1641)
!1645 = !DILocation(line: 6, column: 19, scope: !1641)
!1646 = !DILocation(line: 6, column: 16, scope: !1641)
!1647 = !DILocation(line: 6, column: 13, scope: !1642)
!1648 = !DILocation(line: 8, column: 28, scope: !1649)
!1649 = distinct !DILexicalBlock(scope: !1641, file: !1631, line: 7, column: 9)
!1650 = !DILocation(line: 8, column: 13, scope: !1649)
!1651 = !DILocation(line: 10, column: 10, scope: !1642)
!1652 = distinct !{!1652, !1636, !1653, !293}
!1653 = !DILocation(line: 11, column: 5, scope: !1630)
!1654 = !DILocation(line: 12, column: 15, scope: !1655)
!1655 = distinct !DILexicalBlock(scope: !1630, file: !1631, line: 12, column: 9)
!1656 = !DILocation(line: 12, column: 9, scope: !1655)
!1657 = !DILocation(line: 12, column: 17, scope: !1655)
!1658 = !DILocation(line: 12, column: 9, scope: !1630)
!1659 = !DILocation(line: 14, column: 24, scope: !1660)
!1660 = distinct !DILexicalBlock(scope: !1655, file: !1631, line: 13, column: 5)
!1661 = !DILocation(line: 14, column: 9, scope: !1660)
!1662 = !DILocation(line: 16, column: 5, scope: !1630)
!1663 = !DILocation(line: 17, column: 1, scope: !1630)
!1664 = !DILocalVariable(name: "errnum", arg: 1, scope: !29, file: !30, line: 2, type: !6)
!1665 = !DILocation(line: 2, column: 36, scope: !29)
!1666 = !DILocation(line: 8, column: 13, scope: !29)
!1667 = !DILocation(line: 8, column: 5, scope: !29)
!1668 = !DILocation(line: 11, column: 13, scope: !1669)
!1669 = distinct !DILexicalBlock(scope: !29, file: !30, line: 9, column: 5)
!1670 = !DILocation(line: 13, column: 13, scope: !1669)
!1671 = !DILocation(line: 15, column: 13, scope: !1669)
!1672 = !DILocation(line: 17, column: 13, scope: !1669)
!1673 = !DILocation(line: 19, column: 13, scope: !1669)
!1674 = !DILocation(line: 21, column: 13, scope: !1669)
!1675 = !DILocation(line: 23, column: 13, scope: !1669)
!1676 = !DILocation(line: 25, column: 1, scope: !29)
!1677 = distinct !DISubprogram(name: "__fizzer_model__memchr", scope: !1678, file: !1678, line: 2, type: !1679, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !134, retainedNodes: !63)
!1678 = !DIFile(filename: "data/models/c/std/string/memchr.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "eb41c2475f9bcc7c01385e05d30fa3e5")
!1679 = !DISubroutineType(types: !1680)
!1680 = !{!139, !1681, !6, !1683}
!1681 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1682, size: 64)
!1682 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!1683 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1684, line: 6, baseType: !252)
!1684 = !DIFile(filename: "data/models/c/std/string/memchr.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "af02b37770d7a7765f9edfc9d8d94d59")
!1685 = !DILocalVariable(name: "s", arg: 1, scope: !1677, file: !1678, line: 2, type: !1681)
!1686 = !DILocation(line: 2, column: 42, scope: !1677)
!1687 = !DILocalVariable(name: "c", arg: 2, scope: !1677, file: !1678, line: 2, type: !6)
!1688 = !DILocation(line: 2, column: 49, scope: !1677)
!1689 = !DILocalVariable(name: "n", arg: 3, scope: !1677, file: !1678, line: 2, type: !1683)
!1690 = !DILocation(line: 2, column: 59, scope: !1677)
!1691 = !DILocalVariable(name: "p", scope: !1677, file: !1678, line: 4, type: !137)
!1692 = !DILocation(line: 4, column: 26, scope: !1677)
!1693 = !DILocation(line: 4, column: 53, scope: !1677)
!1694 = !DILocalVariable(name: "i", scope: !1677, file: !1678, line: 5, type: !1683)
!1695 = !DILocation(line: 5, column: 12, scope: !1677)
!1696 = !DILocation(line: 7, column: 5, scope: !1677)
!1697 = !DILocation(line: 7, column: 12, scope: !1677)
!1698 = !DILocation(line: 7, column: 16, scope: !1677)
!1699 = !DILocation(line: 7, column: 14, scope: !1677)
!1700 = !DILocation(line: 9, column: 13, scope: !1701)
!1701 = distinct !DILexicalBlock(scope: !1702, file: !1678, line: 9, column: 13)
!1702 = distinct !DILexicalBlock(scope: !1677, file: !1678, line: 8, column: 5)
!1703 = !DILocation(line: 9, column: 15, scope: !1701)
!1704 = !DILocation(line: 9, column: 36, scope: !1701)
!1705 = !DILocation(line: 9, column: 21, scope: !1701)
!1706 = !DILocation(line: 9, column: 18, scope: !1701)
!1707 = !DILocation(line: 9, column: 13, scope: !1702)
!1708 = !DILocation(line: 11, column: 29, scope: !1709)
!1709 = distinct !DILexicalBlock(scope: !1701, file: !1678, line: 10, column: 9)
!1710 = !DILocation(line: 11, column: 33, scope: !1709)
!1711 = !DILocation(line: 11, column: 31, scope: !1709)
!1712 = !DILocation(line: 11, column: 13, scope: !1709)
!1713 = !DILocation(line: 13, column: 10, scope: !1702)
!1714 = distinct !{!1714, !1696, !1715, !293}
!1715 = !DILocation(line: 14, column: 5, scope: !1677)
!1716 = !DILocation(line: 15, column: 5, scope: !1677)
!1717 = !DILocation(line: 16, column: 1, scope: !1677)
!1718 = distinct !DISubprogram(name: "__fizzer_model__strlen", scope: !1719, file: !1719, line: 2, type: !1720, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !140, retainedNodes: !63)
!1719 = !DIFile(filename: "data/models/c/std/string/strlen.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "02927e422ac203a0e84c9a608c987af4")
!1720 = !DISubroutineType(types: !1721)
!1721 = !{!1722, !73}
!1722 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1723, line: 6, baseType: !252)
!1723 = !DIFile(filename: "data/models/c/std/string/strlen.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "b08c6e51a3e99f12523321dfde78fc5e")
!1724 = !DILocalVariable(name: "s", arg: 1, scope: !1718, file: !1719, line: 2, type: !73)
!1725 = !DILocation(line: 2, column: 43, scope: !1718)
!1726 = !DILocalVariable(name: "n", scope: !1718, file: !1719, line: 4, type: !1722)
!1727 = !DILocation(line: 4, column: 12, scope: !1718)
!1728 = !DILocation(line: 5, column: 5, scope: !1718)
!1729 = !DILocation(line: 5, column: 12, scope: !1718)
!1730 = !DILocation(line: 5, column: 14, scope: !1718)
!1731 = !DILocation(line: 5, column: 17, scope: !1718)
!1732 = !DILocation(line: 7, column: 10, scope: !1733)
!1733 = distinct !DILexicalBlock(scope: !1718, file: !1719, line: 6, column: 5)
!1734 = distinct !{!1734, !1728, !1735, !293}
!1735 = !DILocation(line: 8, column: 5, scope: !1718)
!1736 = !DILocation(line: 9, column: 12, scope: !1718)
!1737 = !DILocation(line: 9, column: 5, scope: !1718)
!1738 = !DILocalVariable(name: "s", arg: 1, scope: !69, file: !70, line: 2, type: !13)
!1739 = !DILocation(line: 2, column: 36, scope: !69)
!1740 = !DILocalVariable(name: "delim", arg: 2, scope: !69, file: !70, line: 2, type: !73)
!1741 = !DILocation(line: 2, column: 51, scope: !69)
!1742 = !DILocation(line: 6, column: 9, scope: !1743)
!1743 = distinct !DILexicalBlock(scope: !69, file: !70, line: 6, column: 9)
!1744 = !DILocation(line: 6, column: 11, scope: !1743)
!1745 = !DILocation(line: 6, column: 9, scope: !69)
!1746 = !DILocation(line: 8, column: 13, scope: !1747)
!1747 = distinct !DILexicalBlock(scope: !1743, file: !70, line: 7, column: 5)
!1748 = !DILocation(line: 8, column: 11, scope: !1747)
!1749 = !DILocation(line: 9, column: 5, scope: !1747)
!1750 = !DILocation(line: 11, column: 9, scope: !1751)
!1751 = distinct !DILexicalBlock(scope: !69, file: !70, line: 11, column: 9)
!1752 = !DILocation(line: 11, column: 11, scope: !1751)
!1753 = !DILocation(line: 11, column: 9, scope: !69)
!1754 = !DILocation(line: 13, column: 9, scope: !1755)
!1755 = distinct !DILexicalBlock(scope: !1751, file: !70, line: 12, column: 5)
!1756 = !DILocation(line: 17, column: 5, scope: !69)
!1757 = !DILocation(line: 17, column: 13, scope: !69)
!1758 = !DILocation(line: 17, column: 12, scope: !69)
!1759 = !DILocation(line: 17, column: 15, scope: !69)
!1760 = !DILocalVariable(name: "d", scope: !1761, file: !70, line: 19, type: !73)
!1761 = distinct !DILexicalBlock(scope: !69, file: !70, line: 18, column: 5)
!1762 = !DILocation(line: 19, column: 21, scope: !1761)
!1763 = !DILocation(line: 19, column: 25, scope: !1761)
!1764 = !DILocation(line: 20, column: 9, scope: !1761)
!1765 = !DILocation(line: 20, column: 17, scope: !1761)
!1766 = !DILocation(line: 20, column: 16, scope: !1761)
!1767 = !DILocation(line: 20, column: 19, scope: !1761)
!1768 = !DILocation(line: 20, column: 24, scope: !1761)
!1769 = !DILocation(line: 20, column: 28, scope: !1761)
!1770 = !DILocation(line: 20, column: 27, scope: !1761)
!1771 = !DILocation(line: 20, column: 34, scope: !1761)
!1772 = !DILocation(line: 20, column: 33, scope: !1761)
!1773 = !DILocation(line: 20, column: 30, scope: !1761)
!1774 = !DILocation(line: 0, scope: !1761)
!1775 = !DILocation(line: 22, column: 14, scope: !1776)
!1776 = distinct !DILexicalBlock(scope: !1761, file: !70, line: 21, column: 9)
!1777 = distinct !{!1777, !1764, !1778, !293}
!1778 = !DILocation(line: 23, column: 9, scope: !1761)
!1779 = !DILocation(line: 24, column: 14, scope: !1780)
!1780 = distinct !DILexicalBlock(scope: !1761, file: !70, line: 24, column: 13)
!1781 = !DILocation(line: 24, column: 13, scope: !1780)
!1782 = !DILocation(line: 24, column: 16, scope: !1780)
!1783 = !DILocation(line: 24, column: 13, scope: !1761)
!1784 = !DILocation(line: 26, column: 13, scope: !1785)
!1785 = distinct !DILexicalBlock(scope: !1780, file: !70, line: 25, column: 9)
!1786 = !DILocation(line: 28, column: 10, scope: !1761)
!1787 = distinct !{!1787, !1756, !1788, !293}
!1788 = !DILocation(line: 29, column: 5, scope: !69)
!1789 = !DILocation(line: 31, column: 10, scope: !1790)
!1790 = distinct !DILexicalBlock(scope: !69, file: !70, line: 31, column: 9)
!1791 = !DILocation(line: 31, column: 9, scope: !1790)
!1792 = !DILocation(line: 31, column: 12, scope: !1790)
!1793 = !DILocation(line: 31, column: 9, scope: !69)
!1794 = !DILocation(line: 33, column: 14, scope: !1795)
!1795 = distinct !DILexicalBlock(scope: !1790, file: !70, line: 32, column: 5)
!1796 = !DILocation(line: 34, column: 9, scope: !1795)
!1797 = !DILocalVariable(name: "token", scope: !69, file: !70, line: 37, type: !13)
!1798 = !DILocation(line: 37, column: 11, scope: !69)
!1799 = !DILocation(line: 37, column: 19, scope: !69)
!1800 = !DILocation(line: 40, column: 5, scope: !69)
!1801 = !DILocation(line: 40, column: 13, scope: !69)
!1802 = !DILocation(line: 40, column: 12, scope: !69)
!1803 = !DILocation(line: 40, column: 15, scope: !69)
!1804 = !DILocalVariable(name: "d", scope: !1805, file: !70, line: 42, type: !73)
!1805 = distinct !DILexicalBlock(scope: !69, file: !70, line: 41, column: 5)
!1806 = !DILocation(line: 42, column: 21, scope: !1805)
!1807 = !DILocation(line: 42, column: 25, scope: !1805)
!1808 = !DILocation(line: 43, column: 9, scope: !1805)
!1809 = !DILocation(line: 43, column: 17, scope: !1805)
!1810 = !DILocation(line: 43, column: 16, scope: !1805)
!1811 = !DILocation(line: 43, column: 19, scope: !1805)
!1812 = !DILocation(line: 43, column: 24, scope: !1805)
!1813 = !DILocation(line: 43, column: 28, scope: !1805)
!1814 = !DILocation(line: 43, column: 27, scope: !1805)
!1815 = !DILocation(line: 43, column: 34, scope: !1805)
!1816 = !DILocation(line: 43, column: 33, scope: !1805)
!1817 = !DILocation(line: 43, column: 30, scope: !1805)
!1818 = !DILocation(line: 0, scope: !1805)
!1819 = !DILocation(line: 45, column: 14, scope: !1820)
!1820 = distinct !DILexicalBlock(scope: !1805, file: !70, line: 44, column: 9)
!1821 = distinct !{!1821, !1808, !1822, !293}
!1822 = !DILocation(line: 46, column: 9, scope: !1805)
!1823 = !DILocation(line: 47, column: 14, scope: !1824)
!1824 = distinct !DILexicalBlock(scope: !1805, file: !70, line: 47, column: 13)
!1825 = !DILocation(line: 47, column: 13, scope: !1824)
!1826 = !DILocation(line: 47, column: 16, scope: !1824)
!1827 = !DILocation(line: 47, column: 13, scope: !1805)
!1828 = !DILocation(line: 49, column: 13, scope: !1829)
!1829 = distinct !DILexicalBlock(scope: !1824, file: !70, line: 48, column: 9)
!1830 = !DILocation(line: 51, column: 10, scope: !1805)
!1831 = distinct !{!1831, !1800, !1832, !293}
!1832 = !DILocation(line: 52, column: 5, scope: !69)
!1833 = !DILocation(line: 54, column: 10, scope: !1834)
!1834 = distinct !DILexicalBlock(scope: !69, file: !70, line: 54, column: 9)
!1835 = !DILocation(line: 54, column: 9, scope: !1834)
!1836 = !DILocation(line: 54, column: 12, scope: !1834)
!1837 = !DILocation(line: 54, column: 9, scope: !69)
!1838 = !DILocation(line: 56, column: 10, scope: !1839)
!1839 = distinct !DILexicalBlock(scope: !1834, file: !70, line: 55, column: 5)
!1840 = !DILocation(line: 56, column: 12, scope: !1839)
!1841 = !DILocation(line: 57, column: 10, scope: !1839)
!1842 = !DILocation(line: 58, column: 16, scope: !1839)
!1843 = !DILocation(line: 58, column: 14, scope: !1839)
!1844 = !DILocation(line: 59, column: 5, scope: !1839)
!1845 = !DILocation(line: 62, column: 14, scope: !1846)
!1846 = distinct !DILexicalBlock(scope: !1834, file: !70, line: 61, column: 5)
!1847 = !DILocation(line: 65, column: 12, scope: !69)
!1848 = !DILocation(line: 65, column: 5, scope: !69)
!1849 = !DILocation(line: 66, column: 1, scope: !69)
!1850 = distinct !DISubprogram(name: "__fizzer_model__strxfrm", scope: !1851, file: !1851, line: 2, type: !1852, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !142, retainedNodes: !63)
!1851 = !DIFile(filename: "data/models/c/std/string/strxfrm.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "989278973572eb57b2d093785a278add")
!1852 = !DISubroutineType(types: !1853)
!1853 = !{!1854, !13, !73, !1854}
!1854 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1855, line: 6, baseType: !252)
!1855 = !DIFile(filename: "data/models/c/std/string/strxfrm.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "710e97a829760447cb50814df00571f8")
!1856 = !DILocalVariable(name: "dest", arg: 1, scope: !1850, file: !1851, line: 2, type: !13)
!1857 = !DILocation(line: 2, column: 38, scope: !1850)
!1858 = !DILocalVariable(name: "src", arg: 2, scope: !1850, file: !1851, line: 2, type: !73)
!1859 = !DILocation(line: 2, column: 56, scope: !1850)
!1860 = !DILocalVariable(name: "n", arg: 3, scope: !1850, file: !1851, line: 2, type: !1854)
!1861 = !DILocation(line: 2, column: 68, scope: !1850)
!1862 = !DILocalVariable(name: "len", scope: !1850, file: !1851, line: 4, type: !1854)
!1863 = !DILocation(line: 4, column: 12, scope: !1850)
!1864 = !DILocalVariable(name: "s", scope: !1850, file: !1851, line: 5, type: !73)
!1865 = !DILocation(line: 5, column: 17, scope: !1850)
!1866 = !DILocation(line: 5, column: 21, scope: !1850)
!1867 = !DILocation(line: 8, column: 5, scope: !1850)
!1868 = !DILocation(line: 8, column: 13, scope: !1850)
!1869 = !DILocation(line: 8, column: 12, scope: !1850)
!1870 = !DILocation(line: 8, column: 15, scope: !1850)
!1871 = !DILocation(line: 10, column: 12, scope: !1872)
!1872 = distinct !DILexicalBlock(scope: !1850, file: !1851, line: 9, column: 5)
!1873 = !DILocation(line: 11, column: 10, scope: !1872)
!1874 = distinct !{!1874, !1867, !1875, !293}
!1875 = !DILocation(line: 12, column: 5, scope: !1850)
!1876 = !DILocation(line: 15, column: 9, scope: !1877)
!1877 = distinct !DILexicalBlock(scope: !1850, file: !1851, line: 15, column: 9)
!1878 = !DILocation(line: 15, column: 11, scope: !1877)
!1879 = !DILocation(line: 15, column: 9, scope: !1850)
!1880 = !DILocalVariable(name: "i", scope: !1881, file: !1851, line: 17, type: !1854)
!1881 = distinct !DILexicalBlock(scope: !1877, file: !1851, line: 16, column: 5)
!1882 = !DILocation(line: 17, column: 16, scope: !1881)
!1883 = !DILocation(line: 18, column: 9, scope: !1881)
!1884 = !DILocation(line: 18, column: 16, scope: !1881)
!1885 = !DILocation(line: 18, column: 20, scope: !1881)
!1886 = !DILocation(line: 18, column: 22, scope: !1881)
!1887 = !DILocation(line: 18, column: 18, scope: !1881)
!1888 = !DILocation(line: 18, column: 26, scope: !1881)
!1889 = !DILocation(line: 18, column: 29, scope: !1881)
!1890 = !DILocation(line: 18, column: 33, scope: !1881)
!1891 = !DILocation(line: 18, column: 36, scope: !1881)
!1892 = !DILocation(line: 0, scope: !1881)
!1893 = !DILocation(line: 20, column: 23, scope: !1894)
!1894 = distinct !DILexicalBlock(scope: !1881, file: !1851, line: 19, column: 9)
!1895 = !DILocation(line: 20, column: 27, scope: !1894)
!1896 = !DILocation(line: 20, column: 13, scope: !1894)
!1897 = !DILocation(line: 20, column: 18, scope: !1894)
!1898 = !DILocation(line: 20, column: 21, scope: !1894)
!1899 = !DILocation(line: 21, column: 14, scope: !1894)
!1900 = distinct !{!1900, !1883, !1901, !293}
!1901 = !DILocation(line: 22, column: 9, scope: !1881)
!1902 = !DILocation(line: 23, column: 9, scope: !1881)
!1903 = !DILocation(line: 23, column: 14, scope: !1881)
!1904 = !DILocation(line: 23, column: 17, scope: !1881)
!1905 = !DILocation(line: 24, column: 5, scope: !1881)
!1906 = !DILocation(line: 26, column: 12, scope: !1850)
!1907 = !DILocation(line: 26, column: 5, scope: !1850)
!1908 = distinct !DISubprogram(name: "__fizzer_model__iscntrl", scope: !1909, file: !1909, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !144, retainedNodes: !63)
!1909 = !DIFile(filename: "data/models/c/std/ctype/iscntrl.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "1d16fabd886360902b60cd5383ecd536")
!1910 = !DILocalVariable(name: "c", arg: 1, scope: !1908, file: !1909, line: 2, type: !6)
!1911 = !DILocation(line: 2, column: 33, scope: !1908)
!1912 = !DILocation(line: 4, column: 10, scope: !1913)
!1913 = distinct !DILexicalBlock(scope: !1908, file: !1909, line: 4, column: 9)
!1914 = !DILocation(line: 4, column: 12, scope: !1913)
!1915 = !DILocation(line: 4, column: 17, scope: !1913)
!1916 = !DILocation(line: 4, column: 20, scope: !1913)
!1917 = !DILocation(line: 4, column: 22, scope: !1913)
!1918 = !DILocation(line: 4, column: 29, scope: !1913)
!1919 = !DILocation(line: 4, column: 32, scope: !1913)
!1920 = !DILocation(line: 4, column: 34, scope: !1913)
!1921 = !DILocation(line: 4, column: 9, scope: !1908)
!1922 = !DILocation(line: 6, column: 9, scope: !1923)
!1923 = distinct !DILexicalBlock(scope: !1913, file: !1909, line: 5, column: 5)
!1924 = !DILocation(line: 8, column: 5, scope: !1908)
!1925 = !DILocation(line: 9, column: 1, scope: !1908)
!1926 = distinct !DISubprogram(name: "__fizzer_model__isxdigit", scope: !1927, file: !1927, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !146, retainedNodes: !63)
!1927 = !DIFile(filename: "data/models/c/std/ctype/isxdigit.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "0abf049bb725434344eee06d1063bde8")
!1928 = !DILocalVariable(name: "c", arg: 1, scope: !1926, file: !1927, line: 2, type: !6)
!1929 = !DILocation(line: 2, column: 34, scope: !1926)
!1930 = !DILocation(line: 4, column: 34, scope: !1931)
!1931 = distinct !DILexicalBlock(scope: !1926, file: !1927, line: 4, column: 9)
!1932 = !DILocation(line: 4, column: 10, scope: !1931)
!1933 = !DILocation(line: 4, column: 38, scope: !1931)
!1934 = !DILocation(line: 5, column: 10, scope: !1931)
!1935 = !DILocation(line: 5, column: 12, scope: !1931)
!1936 = !DILocation(line: 5, column: 19, scope: !1931)
!1937 = !DILocation(line: 5, column: 22, scope: !1931)
!1938 = !DILocation(line: 5, column: 24, scope: !1931)
!1939 = !DILocation(line: 5, column: 32, scope: !1931)
!1940 = !DILocation(line: 6, column: 10, scope: !1931)
!1941 = !DILocation(line: 6, column: 12, scope: !1931)
!1942 = !DILocation(line: 6, column: 19, scope: !1931)
!1943 = !DILocation(line: 6, column: 22, scope: !1931)
!1944 = !DILocation(line: 6, column: 24, scope: !1931)
!1945 = !DILocation(line: 4, column: 9, scope: !1926)
!1946 = !DILocation(line: 8, column: 9, scope: !1947)
!1947 = distinct !DILexicalBlock(scope: !1931, file: !1927, line: 7, column: 5)
!1948 = !DILocation(line: 10, column: 5, scope: !1926)
!1949 = !DILocation(line: 11, column: 1, scope: !1926)
!1950 = distinct !DISubprogram(name: "__fizzer_model__isalnum", scope: !1951, file: !1951, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !148, retainedNodes: !63)
!1951 = !DIFile(filename: "data/models/c/std/ctype/isalnum.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "6bbe9a062fcf4ea45225490b0c0403ef")
!1952 = !DILocalVariable(name: "c", arg: 1, scope: !1950, file: !1951, line: 2, type: !6)
!1953 = !DILocation(line: 2, column: 33, scope: !1950)
!1954 = !DILocation(line: 4, column: 33, scope: !1955)
!1955 = distinct !DILexicalBlock(scope: !1950, file: !1951, line: 4, column: 9)
!1956 = !DILocation(line: 4, column: 9, scope: !1955)
!1957 = !DILocation(line: 4, column: 36, scope: !1955)
!1958 = !DILocation(line: 4, column: 63, scope: !1955)
!1959 = !DILocation(line: 4, column: 39, scope: !1955)
!1960 = !DILocation(line: 4, column: 9, scope: !1950)
!1961 = !DILocation(line: 6, column: 9, scope: !1962)
!1962 = distinct !DILexicalBlock(scope: !1955, file: !1951, line: 5, column: 5)
!1963 = !DILocation(line: 8, column: 5, scope: !1950)
!1964 = !DILocation(line: 9, column: 1, scope: !1950)
!1965 = distinct !DISubprogram(name: "__fizzer_model__isspace", scope: !1966, file: !1966, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !150, retainedNodes: !63)
!1966 = !DIFile(filename: "data/models/c/std/ctype/isspace.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "9ab9a851c14ac485b9c69b251ca4421f")
!1967 = !DILocalVariable(name: "c", arg: 1, scope: !1965, file: !1966, line: 2, type: !6)
!1968 = !DILocation(line: 2, column: 33, scope: !1965)
!1969 = !DILocation(line: 4, column: 9, scope: !1970)
!1970 = distinct !DILexicalBlock(scope: !1965, file: !1966, line: 4, column: 9)
!1971 = !DILocation(line: 4, column: 11, scope: !1970)
!1972 = !DILocation(line: 4, column: 18, scope: !1970)
!1973 = !DILocation(line: 4, column: 21, scope: !1970)
!1974 = !DILocation(line: 4, column: 23, scope: !1970)
!1975 = !DILocation(line: 4, column: 31, scope: !1970)
!1976 = !DILocation(line: 4, column: 34, scope: !1970)
!1977 = !DILocation(line: 4, column: 36, scope: !1970)
!1978 = !DILocation(line: 4, column: 44, scope: !1970)
!1979 = !DILocation(line: 4, column: 47, scope: !1970)
!1980 = !DILocation(line: 4, column: 49, scope: !1970)
!1981 = !DILocation(line: 4, column: 57, scope: !1970)
!1982 = !DILocation(line: 4, column: 60, scope: !1970)
!1983 = !DILocation(line: 4, column: 62, scope: !1970)
!1984 = !DILocation(line: 4, column: 70, scope: !1970)
!1985 = !DILocation(line: 4, column: 73, scope: !1970)
!1986 = !DILocation(line: 4, column: 75, scope: !1970)
!1987 = !DILocation(line: 4, column: 9, scope: !1965)
!1988 = !DILocation(line: 6, column: 9, scope: !1989)
!1989 = distinct !DILexicalBlock(scope: !1970, file: !1966, line: 5, column: 5)
!1990 = !DILocation(line: 8, column: 5, scope: !1965)
!1991 = !DILocation(line: 9, column: 1, scope: !1965)
!1992 = distinct !DISubprogram(name: "__fizzer_model__isalpha", scope: !1993, file: !1993, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !152, retainedNodes: !63)
!1993 = !DIFile(filename: "data/models/c/std/ctype/isalpha.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "ec45d1a23298cf8353ee76bfbe3010f4")
!1994 = !DILocalVariable(name: "c", arg: 1, scope: !1992, file: !1993, line: 2, type: !6)
!1995 = !DILocation(line: 2, column: 33, scope: !1992)
!1996 = !DILocation(line: 4, column: 10, scope: !1997)
!1997 = distinct !DILexicalBlock(scope: !1992, file: !1993, line: 4, column: 9)
!1998 = !DILocation(line: 4, column: 12, scope: !1997)
!1999 = !DILocation(line: 4, column: 19, scope: !1997)
!2000 = !DILocation(line: 4, column: 22, scope: !1997)
!2001 = !DILocation(line: 4, column: 24, scope: !1997)
!2002 = !DILocation(line: 4, column: 32, scope: !1997)
!2003 = !DILocation(line: 4, column: 36, scope: !1997)
!2004 = !DILocation(line: 4, column: 38, scope: !1997)
!2005 = !DILocation(line: 4, column: 45, scope: !1997)
!2006 = !DILocation(line: 4, column: 48, scope: !1997)
!2007 = !DILocation(line: 4, column: 50, scope: !1997)
!2008 = !DILocation(line: 4, column: 9, scope: !1992)
!2009 = !DILocation(line: 6, column: 9, scope: !2010)
!2010 = distinct !DILexicalBlock(scope: !1997, file: !1993, line: 5, column: 5)
!2011 = !DILocation(line: 8, column: 5, scope: !1992)
!2012 = !DILocation(line: 9, column: 1, scope: !1992)
!2013 = distinct !DISubprogram(name: "__fizzer_model__isblank", scope: !2014, file: !2014, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !154, retainedNodes: !63)
!2014 = !DIFile(filename: "data/models/c/std/ctype/isblank.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "4469204b656f7c8f7e1807d1f4e59567")
!2015 = !DILocalVariable(name: "c", arg: 1, scope: !2013, file: !2014, line: 2, type: !6)
!2016 = !DILocation(line: 2, column: 33, scope: !2013)
!2017 = !DILocation(line: 4, column: 9, scope: !2018)
!2018 = distinct !DILexicalBlock(scope: !2013, file: !2014, line: 4, column: 9)
!2019 = !DILocation(line: 4, column: 11, scope: !2018)
!2020 = !DILocation(line: 4, column: 18, scope: !2018)
!2021 = !DILocation(line: 4, column: 21, scope: !2018)
!2022 = !DILocation(line: 4, column: 23, scope: !2018)
!2023 = !DILocation(line: 4, column: 9, scope: !2013)
!2024 = !DILocation(line: 6, column: 9, scope: !2025)
!2025 = distinct !DILexicalBlock(scope: !2018, file: !2014, line: 5, column: 5)
!2026 = !DILocation(line: 8, column: 5, scope: !2013)
!2027 = !DILocation(line: 9, column: 1, scope: !2013)
!2028 = distinct !DISubprogram(name: "__fizzer_model__islower", scope: !2029, file: !2029, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !156, retainedNodes: !63)
!2029 = !DIFile(filename: "data/models/c/std/ctype/islower.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "7f0db237b2957c408137ff19b95b9f37")
!2030 = !DILocalVariable(name: "c", arg: 1, scope: !2028, file: !2029, line: 2, type: !6)
!2031 = !DILocation(line: 2, column: 33, scope: !2028)
!2032 = !DILocation(line: 4, column: 9, scope: !2033)
!2033 = distinct !DILexicalBlock(scope: !2028, file: !2029, line: 4, column: 9)
!2034 = !DILocation(line: 4, column: 11, scope: !2033)
!2035 = !DILocation(line: 4, column: 18, scope: !2033)
!2036 = !DILocation(line: 4, column: 21, scope: !2033)
!2037 = !DILocation(line: 4, column: 23, scope: !2033)
!2038 = !DILocation(line: 4, column: 9, scope: !2028)
!2039 = !DILocation(line: 6, column: 9, scope: !2040)
!2040 = distinct !DILexicalBlock(scope: !2033, file: !2029, line: 5, column: 5)
!2041 = !DILocation(line: 8, column: 5, scope: !2028)
!2042 = !DILocation(line: 9, column: 1, scope: !2028)
!2043 = distinct !DISubprogram(name: "__fizzer_model__isdigit", scope: !2044, file: !2044, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !158, retainedNodes: !63)
!2044 = !DIFile(filename: "data/models/c/std/ctype/isdigit.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "9967dfc55f3c5b9e8a34a1c12ab51128")
!2045 = !DILocalVariable(name: "c", arg: 1, scope: !2043, file: !2044, line: 2, type: !6)
!2046 = !DILocation(line: 2, column: 33, scope: !2043)
!2047 = !DILocation(line: 4, column: 9, scope: !2048)
!2048 = distinct !DILexicalBlock(scope: !2043, file: !2044, line: 4, column: 9)
!2049 = !DILocation(line: 4, column: 11, scope: !2048)
!2050 = !DILocation(line: 4, column: 18, scope: !2048)
!2051 = !DILocation(line: 4, column: 21, scope: !2048)
!2052 = !DILocation(line: 4, column: 23, scope: !2048)
!2053 = !DILocation(line: 4, column: 9, scope: !2043)
!2054 = !DILocation(line: 6, column: 9, scope: !2055)
!2055 = distinct !DILexicalBlock(scope: !2048, file: !2044, line: 5, column: 5)
!2056 = !DILocation(line: 8, column: 5, scope: !2043)
!2057 = !DILocation(line: 9, column: 1, scope: !2043)
!2058 = distinct !DISubprogram(name: "__fizzer_model__toupper", scope: !2059, file: !2059, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !160, retainedNodes: !63)
!2059 = !DIFile(filename: "data/models/c/std/ctype/toupper.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "35ae67ebdb17b245d732ce3603fdfa64")
!2060 = !DILocalVariable(name: "c", arg: 1, scope: !2058, file: !2059, line: 2, type: !6)
!2061 = !DILocation(line: 2, column: 33, scope: !2058)
!2062 = !DILocation(line: 4, column: 33, scope: !2063)
!2063 = distinct !DILexicalBlock(scope: !2058, file: !2059, line: 4, column: 9)
!2064 = !DILocation(line: 4, column: 9, scope: !2063)
!2065 = !DILocation(line: 4, column: 9, scope: !2058)
!2066 = !DILocation(line: 6, column: 16, scope: !2067)
!2067 = distinct !DILexicalBlock(scope: !2063, file: !2059, line: 5, column: 5)
!2068 = !DILocation(line: 6, column: 18, scope: !2067)
!2069 = !DILocation(line: 6, column: 24, scope: !2067)
!2070 = !DILocation(line: 6, column: 9, scope: !2067)
!2071 = !DILocation(line: 8, column: 12, scope: !2058)
!2072 = !DILocation(line: 8, column: 5, scope: !2058)
!2073 = !DILocation(line: 9, column: 1, scope: !2058)
!2074 = distinct !DISubprogram(name: "__fizzer_model__isprint", scope: !2075, file: !2075, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !162, retainedNodes: !63)
!2075 = !DIFile(filename: "data/models/c/std/ctype/isprint.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "d8538a5b382a98a36fe86b916256fcc7")
!2076 = !DILocalVariable(name: "c", arg: 1, scope: !2074, file: !2075, line: 2, type: !6)
!2077 = !DILocation(line: 2, column: 33, scope: !2074)
!2078 = !DILocation(line: 4, column: 9, scope: !2079)
!2079 = distinct !DILexicalBlock(scope: !2074, file: !2075, line: 4, column: 9)
!2080 = !DILocation(line: 4, column: 11, scope: !2079)
!2081 = !DILocation(line: 4, column: 17, scope: !2079)
!2082 = !DILocation(line: 4, column: 20, scope: !2079)
!2083 = !DILocation(line: 4, column: 22, scope: !2079)
!2084 = !DILocation(line: 4, column: 9, scope: !2074)
!2085 = !DILocation(line: 6, column: 9, scope: !2086)
!2086 = distinct !DILexicalBlock(scope: !2079, file: !2075, line: 5, column: 5)
!2087 = !DILocation(line: 8, column: 5, scope: !2074)
!2088 = !DILocation(line: 9, column: 1, scope: !2074)
!2089 = distinct !DISubprogram(name: "__fizzer_model__isupper", scope: !2090, file: !2090, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !164, retainedNodes: !63)
!2090 = !DIFile(filename: "data/models/c/std/ctype/isupper.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "c2334b5acdb0a1b26cc08f11cf47c244")
!2091 = !DILocalVariable(name: "c", arg: 1, scope: !2089, file: !2090, line: 2, type: !6)
!2092 = !DILocation(line: 2, column: 33, scope: !2089)
!2093 = !DILocation(line: 4, column: 9, scope: !2094)
!2094 = distinct !DILexicalBlock(scope: !2089, file: !2090, line: 4, column: 9)
!2095 = !DILocation(line: 4, column: 11, scope: !2094)
!2096 = !DILocation(line: 4, column: 18, scope: !2094)
!2097 = !DILocation(line: 4, column: 21, scope: !2094)
!2098 = !DILocation(line: 4, column: 23, scope: !2094)
!2099 = !DILocation(line: 4, column: 9, scope: !2089)
!2100 = !DILocation(line: 6, column: 9, scope: !2101)
!2101 = distinct !DILexicalBlock(scope: !2094, file: !2090, line: 5, column: 5)
!2102 = !DILocation(line: 8, column: 5, scope: !2089)
!2103 = !DILocation(line: 9, column: 1, scope: !2089)
!2104 = distinct !DISubprogram(name: "__fizzer_model__tolower", scope: !2105, file: !2105, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !166, retainedNodes: !63)
!2105 = !DIFile(filename: "data/models/c/std/ctype/tolower.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "7faecd1bd1600a814e6c8b43347332c3")
!2106 = !DILocalVariable(name: "c", arg: 1, scope: !2104, file: !2105, line: 2, type: !6)
!2107 = !DILocation(line: 2, column: 33, scope: !2104)
!2108 = !DILocation(line: 4, column: 33, scope: !2109)
!2109 = distinct !DILexicalBlock(scope: !2104, file: !2105, line: 4, column: 9)
!2110 = !DILocation(line: 4, column: 9, scope: !2109)
!2111 = !DILocation(line: 4, column: 9, scope: !2104)
!2112 = !DILocation(line: 6, column: 16, scope: !2113)
!2113 = distinct !DILexicalBlock(scope: !2109, file: !2105, line: 5, column: 5)
!2114 = !DILocation(line: 6, column: 18, scope: !2113)
!2115 = !DILocation(line: 6, column: 24, scope: !2113)
!2116 = !DILocation(line: 6, column: 9, scope: !2113)
!2117 = !DILocation(line: 8, column: 12, scope: !2104)
!2118 = !DILocation(line: 8, column: 5, scope: !2104)
!2119 = !DILocation(line: 9, column: 1, scope: !2104)
!2120 = distinct !DISubprogram(name: "__fizzer_model__isgraph", scope: !2121, file: !2121, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !168, retainedNodes: !63)
!2121 = !DIFile(filename: "data/models/c/std/ctype/isgraph.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "53707fda19088bc8e89fad78f4c3a13f")
!2122 = !DILocalVariable(name: "c", arg: 1, scope: !2120, file: !2121, line: 2, type: !6)
!2123 = !DILocation(line: 2, column: 33, scope: !2120)
!2124 = !DILocation(line: 4, column: 9, scope: !2125)
!2125 = distinct !DILexicalBlock(scope: !2120, file: !2121, line: 4, column: 9)
!2126 = !DILocation(line: 4, column: 11, scope: !2125)
!2127 = !DILocation(line: 4, column: 17, scope: !2125)
!2128 = !DILocation(line: 4, column: 20, scope: !2125)
!2129 = !DILocation(line: 4, column: 22, scope: !2125)
!2130 = !DILocation(line: 4, column: 9, scope: !2120)
!2131 = !DILocation(line: 6, column: 9, scope: !2132)
!2132 = distinct !DILexicalBlock(scope: !2125, file: !2121, line: 5, column: 5)
!2133 = !DILocation(line: 8, column: 5, scope: !2120)
!2134 = !DILocation(line: 9, column: 1, scope: !2120)
!2135 = distinct !DISubprogram(name: "__fizzer_model__snprintf", scope: !2136, file: !2136, line: 2, type: !2137, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !170, retainedNodes: !63)
!2136 = !DIFile(filename: "data/models/c/std/stdio/snprintf.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "76bc06d30e021e08fbd62dcb20d50aff")
!2137 = !DISubroutineType(types: !2138)
!2138 = !{!6, !13, !2139, !73, null}
!2139 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2140, line: 6, baseType: !252)
!2140 = !DIFile(filename: "data/models/c/std/stdio/snprintf.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "3041458efcb1c5564be86cab3319404a")
!2141 = !DILocalVariable(name: "str", arg: 1, scope: !2135, file: !2136, line: 2, type: !13)
!2142 = !DILocation(line: 2, column: 36, scope: !2135)
!2143 = !DILocalVariable(name: "size", arg: 2, scope: !2135, file: !2136, line: 2, type: !2139)
!2144 = !DILocation(line: 2, column: 48, scope: !2135)
!2145 = !DILocalVariable(name: "format", arg: 3, scope: !2135, file: !2136, line: 2, type: !73)
!2146 = !DILocation(line: 2, column: 66, scope: !2135)
!2147 = !DILocalVariable(name: "ap", scope: !2135, file: !2136, line: 4, type: !2148)
!2148 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !2140, line: 14, baseType: !2149)
!2149 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !2136, baseType: !2150)
!2150 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2151, size: 192, elements: !2158)
!2151 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, elements: !2152)
!2152 = !{!2153, !2155, !2156, !2157}
!2153 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !2151, file: !2136, line: 4, baseType: !2154, size: 32)
!2154 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!2155 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !2151, file: !2136, line: 4, baseType: !2154, size: 32, offset: 32)
!2156 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !2151, file: !2136, line: 4, baseType: !139, size: 64, offset: 64)
!2157 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !2151, file: !2136, line: 4, baseType: !139, size: 64, offset: 128)
!2158 = !{!2159}
!2159 = !DISubrange(count: 1)
!2160 = !DILocation(line: 4, column: 13, scope: !2135)
!2161 = !DILocation(line: 5, column: 5, scope: !2135)
!2162 = !DILocalVariable(name: "result", scope: !2135, file: !2136, line: 6, type: !6)
!2163 = !DILocation(line: 6, column: 9, scope: !2135)
!2164 = !DILocation(line: 6, column: 44, scope: !2135)
!2165 = !DILocation(line: 6, column: 49, scope: !2135)
!2166 = !DILocation(line: 6, column: 55, scope: !2135)
!2167 = !DILocation(line: 6, column: 63, scope: !2135)
!2168 = !DILocation(line: 6, column: 18, scope: !2135)
!2169 = !DILocation(line: 7, column: 5, scope: !2135)
!2170 = !DILocation(line: 8, column: 12, scope: !2135)
!2171 = !DILocation(line: 8, column: 5, scope: !2135)
!2172 = distinct !DISubprogram(name: "__fizzer_model__sprintf", scope: !2173, file: !2173, line: 2, type: !2174, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !172, retainedNodes: !63)
!2173 = !DIFile(filename: "data/models/c/std/stdio/sprintf.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "56f45916c6775fca737b2a248636b9a4")
!2174 = !DISubroutineType(types: !2175)
!2175 = !{!6, !13, !73, null}
!2176 = !DILocalVariable(name: "str", arg: 1, scope: !2172, file: !2173, line: 2, type: !13)
!2177 = !DILocation(line: 2, column: 35, scope: !2172)
!2178 = !DILocalVariable(name: "format", arg: 2, scope: !2172, file: !2173, line: 2, type: !73)
!2179 = !DILocation(line: 2, column: 52, scope: !2172)
!2180 = !DILocalVariable(name: "ap", scope: !2172, file: !2173, line: 4, type: !2181)
!2181 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !2182, line: 4, baseType: !2183)
!2182 = !DIFile(filename: "data/models/c/std/stdio/sprintf.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "d6124a58b9c67c791cdec6fe4c5e48a1")
!2183 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !2173, baseType: !2184)
!2184 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2185, size: 192, elements: !2158)
!2185 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, elements: !2186)
!2186 = !{!2187, !2188, !2189, !2190}
!2187 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !2185, file: !2173, line: 4, baseType: !2154, size: 32)
!2188 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !2185, file: !2173, line: 4, baseType: !2154, size: 32, offset: 32)
!2189 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !2185, file: !2173, line: 4, baseType: !139, size: 64, offset: 64)
!2190 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !2185, file: !2173, line: 4, baseType: !139, size: 64, offset: 128)
!2191 = !DILocation(line: 4, column: 13, scope: !2172)
!2192 = !DILocation(line: 5, column: 5, scope: !2172)
!2193 = !DILocalVariable(name: "result", scope: !2172, file: !2173, line: 6, type: !6)
!2194 = !DILocation(line: 6, column: 9, scope: !2172)
!2195 = !DILocation(line: 6, column: 43, scope: !2172)
!2196 = !DILocation(line: 6, column: 48, scope: !2172)
!2197 = !DILocation(line: 6, column: 56, scope: !2172)
!2198 = !DILocation(line: 6, column: 18, scope: !2172)
!2199 = !DILocation(line: 7, column: 5, scope: !2172)
!2200 = !DILocation(line: 8, column: 12, scope: !2172)
!2201 = !DILocation(line: 8, column: 5, scope: !2172)
!2202 = distinct !DISubprogram(name: "__fizzer_model__vsprintf", scope: !2203, file: !2203, line: 2, type: !2204, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !174, retainedNodes: !63)
!2203 = !DIFile(filename: "data/models/c/std/stdio/vsprintf.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "108c7547e9301a0fdafaac5451fdb696")
!2204 = !DISubroutineType(types: !2205)
!2205 = !{!6, !13, !73, !2206}
!2206 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2207, size: 64)
!2207 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, elements: !2208)
!2208 = !{!2209, !2210, !2211, !2212}
!2209 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !2207, file: !2203, baseType: !2154, size: 32)
!2210 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !2207, file: !2203, baseType: !2154, size: 32, offset: 32)
!2211 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !2207, file: !2203, baseType: !139, size: 64, offset: 64)
!2212 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !2207, file: !2203, baseType: !139, size: 64, offset: 128)
!2213 = !DILocalVariable(name: "str", arg: 1, scope: !2202, file: !2203, line: 2, type: !13)
!2214 = !DILocation(line: 2, column: 36, scope: !2202)
!2215 = !DILocalVariable(name: "format", arg: 2, scope: !2202, file: !2203, line: 2, type: !73)
!2216 = !DILocation(line: 2, column: 53, scope: !2202)
!2217 = !DILocalVariable(name: "ap", arg: 3, scope: !2202, file: !2203, line: 2, type: !2206)
!2218 = !DILocation(line: 2, column: 69, scope: !2202)
!2219 = !DILocalVariable(name: "i", scope: !2202, file: !2203, line: 4, type: !2220)
!2220 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2221, line: 6, baseType: !252)
!2221 = !DIFile(filename: "data/models/c/std/stdio/vsprintf.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "22dc0c17cd450f7813777d9af49e0ce8")
!2222 = !DILocation(line: 4, column: 12, scope: !2202)
!2223 = !DILocalVariable(name: "j", scope: !2202, file: !2203, line: 5, type: !2220)
!2224 = !DILocation(line: 5, column: 12, scope: !2202)
!2225 = !DILocation(line: 7, column: 5, scope: !2202)
!2226 = !DILocation(line: 7, column: 12, scope: !2202)
!2227 = !DILocation(line: 7, column: 19, scope: !2202)
!2228 = !DILocation(line: 7, column: 22, scope: !2202)
!2229 = !DILocation(line: 9, column: 13, scope: !2230)
!2230 = distinct !DILexicalBlock(scope: !2231, file: !2203, line: 9, column: 13)
!2231 = distinct !DILexicalBlock(scope: !2202, file: !2203, line: 8, column: 5)
!2232 = !DILocation(line: 9, column: 20, scope: !2230)
!2233 = !DILocation(line: 9, column: 23, scope: !2230)
!2234 = !DILocation(line: 9, column: 13, scope: !2231)
!2235 = !DILocation(line: 11, column: 14, scope: !2236)
!2236 = distinct !DILexicalBlock(scope: !2230, file: !2203, line: 10, column: 9)
!2237 = !DILocation(line: 12, column: 17, scope: !2238)
!2238 = distinct !DILexicalBlock(scope: !2236, file: !2203, line: 12, column: 17)
!2239 = !DILocation(line: 12, column: 24, scope: !2238)
!2240 = !DILocation(line: 12, column: 27, scope: !2238)
!2241 = !DILocation(line: 12, column: 17, scope: !2236)
!2242 = !DILocation(line: 14, column: 17, scope: !2243)
!2243 = distinct !DILexicalBlock(scope: !2238, file: !2203, line: 13, column: 13)
!2244 = !DILocation(line: 17, column: 17, scope: !2245)
!2245 = distinct !DILexicalBlock(scope: !2236, file: !2203, line: 17, column: 17)
!2246 = !DILocation(line: 17, column: 24, scope: !2245)
!2247 = !DILocation(line: 17, column: 27, scope: !2245)
!2248 = !DILocation(line: 17, column: 17, scope: !2236)
!2249 = !DILocalVariable(name: "val", scope: !2250, file: !2203, line: 19, type: !6)
!2250 = distinct !DILexicalBlock(scope: !2245, file: !2203, line: 18, column: 13)
!2251 = !DILocation(line: 19, column: 21, scope: !2250)
!2252 = !DILocation(line: 19, column: 27, scope: !2250)
!2253 = !DILocalVariable(name: "buf", scope: !2250, file: !2203, line: 20, type: !2254)
!2254 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 256, elements: !2255)
!2255 = !{!2256}
!2256 = !DISubrange(count: 32)
!2257 = !DILocation(line: 20, column: 22, scope: !2250)
!2258 = !DILocation(line: 21, column: 45, scope: !2250)
!2259 = !DILocation(line: 21, column: 50, scope: !2250)
!2260 = !DILocation(line: 21, column: 17, scope: !2250)
!2261 = !DILocalVariable(name: "k", scope: !2250, file: !2203, line: 22, type: !2220)
!2262 = !DILocation(line: 22, column: 24, scope: !2250)
!2263 = !DILocation(line: 23, column: 17, scope: !2250)
!2264 = !DILocation(line: 23, column: 28, scope: !2250)
!2265 = !DILocation(line: 23, column: 24, scope: !2250)
!2266 = !DILocation(line: 23, column: 31, scope: !2250)
!2267 = !DILocation(line: 25, column: 34, scope: !2268)
!2268 = distinct !DILexicalBlock(scope: !2250, file: !2203, line: 24, column: 17)
!2269 = !DILocation(line: 25, column: 30, scope: !2268)
!2270 = !DILocation(line: 25, column: 21, scope: !2268)
!2271 = !DILocation(line: 25, column: 25, scope: !2268)
!2272 = !DILocation(line: 25, column: 28, scope: !2268)
!2273 = !DILocation(line: 26, column: 22, scope: !2268)
!2274 = !DILocation(line: 27, column: 22, scope: !2268)
!2275 = distinct !{!2275, !2263, !2276, !293}
!2276 = !DILocation(line: 28, column: 17, scope: !2250)
!2277 = !DILocation(line: 29, column: 13, scope: !2250)
!2278 = !DILocation(line: 30, column: 22, scope: !2279)
!2279 = distinct !DILexicalBlock(scope: !2245, file: !2203, line: 30, column: 22)
!2280 = !DILocation(line: 30, column: 29, scope: !2279)
!2281 = !DILocation(line: 30, column: 32, scope: !2279)
!2282 = !DILocation(line: 30, column: 22, scope: !2245)
!2283 = !DILocalVariable(name: "val", scope: !2284, file: !2203, line: 32, type: !2154)
!2284 = distinct !DILexicalBlock(scope: !2279, file: !2203, line: 31, column: 13)
!2285 = !DILocation(line: 32, column: 30, scope: !2284)
!2286 = !DILocation(line: 32, column: 36, scope: !2284)
!2287 = !DILocalVariable(name: "buf", scope: !2284, file: !2203, line: 33, type: !2254)
!2288 = !DILocation(line: 33, column: 22, scope: !2284)
!2289 = !DILocation(line: 34, column: 50, scope: !2284)
!2290 = !DILocation(line: 34, column: 55, scope: !2284)
!2291 = !DILocation(line: 34, column: 17, scope: !2284)
!2292 = !DILocalVariable(name: "k", scope: !2284, file: !2203, line: 35, type: !2220)
!2293 = !DILocation(line: 35, column: 24, scope: !2284)
!2294 = !DILocation(line: 36, column: 17, scope: !2284)
!2295 = !DILocation(line: 36, column: 28, scope: !2284)
!2296 = !DILocation(line: 36, column: 24, scope: !2284)
!2297 = !DILocation(line: 36, column: 31, scope: !2284)
!2298 = !DILocation(line: 38, column: 34, scope: !2299)
!2299 = distinct !DILexicalBlock(scope: !2284, file: !2203, line: 37, column: 17)
!2300 = !DILocation(line: 38, column: 30, scope: !2299)
!2301 = !DILocation(line: 38, column: 21, scope: !2299)
!2302 = !DILocation(line: 38, column: 25, scope: !2299)
!2303 = !DILocation(line: 38, column: 28, scope: !2299)
!2304 = !DILocation(line: 39, column: 22, scope: !2299)
!2305 = !DILocation(line: 40, column: 22, scope: !2299)
!2306 = distinct !{!2306, !2294, !2307, !293}
!2307 = !DILocation(line: 41, column: 17, scope: !2284)
!2308 = !DILocation(line: 42, column: 13, scope: !2284)
!2309 = !DILocation(line: 43, column: 22, scope: !2310)
!2310 = distinct !DILexicalBlock(scope: !2279, file: !2203, line: 43, column: 22)
!2311 = !DILocation(line: 43, column: 29, scope: !2310)
!2312 = !DILocation(line: 43, column: 32, scope: !2310)
!2313 = !DILocation(line: 43, column: 22, scope: !2279)
!2314 = !DILocalVariable(name: "val", scope: !2315, file: !2203, line: 45, type: !2154)
!2315 = distinct !DILexicalBlock(scope: !2310, file: !2203, line: 44, column: 13)
!2316 = !DILocation(line: 45, column: 30, scope: !2315)
!2317 = !DILocation(line: 45, column: 36, scope: !2315)
!2318 = !DILocalVariable(name: "buf", scope: !2315, file: !2203, line: 46, type: !2254)
!2319 = !DILocation(line: 46, column: 22, scope: !2315)
!2320 = !DILocation(line: 47, column: 50, scope: !2315)
!2321 = !DILocation(line: 47, column: 55, scope: !2315)
!2322 = !DILocation(line: 47, column: 17, scope: !2315)
!2323 = !DILocalVariable(name: "k", scope: !2315, file: !2203, line: 48, type: !2220)
!2324 = !DILocation(line: 48, column: 24, scope: !2315)
!2325 = !DILocation(line: 49, column: 17, scope: !2315)
!2326 = !DILocation(line: 49, column: 28, scope: !2315)
!2327 = !DILocation(line: 49, column: 24, scope: !2315)
!2328 = !DILocation(line: 49, column: 31, scope: !2315)
!2329 = !DILocation(line: 51, column: 34, scope: !2330)
!2330 = distinct !DILexicalBlock(scope: !2315, file: !2203, line: 50, column: 17)
!2331 = !DILocation(line: 51, column: 30, scope: !2330)
!2332 = !DILocation(line: 51, column: 21, scope: !2330)
!2333 = !DILocation(line: 51, column: 25, scope: !2330)
!2334 = !DILocation(line: 51, column: 28, scope: !2330)
!2335 = !DILocation(line: 52, column: 22, scope: !2330)
!2336 = !DILocation(line: 53, column: 22, scope: !2330)
!2337 = distinct !{!2337, !2325, !2338, !293}
!2338 = !DILocation(line: 54, column: 17, scope: !2315)
!2339 = !DILocation(line: 55, column: 13, scope: !2315)
!2340 = !DILocation(line: 56, column: 22, scope: !2341)
!2341 = distinct !DILexicalBlock(scope: !2310, file: !2203, line: 56, column: 22)
!2342 = !DILocation(line: 56, column: 29, scope: !2341)
!2343 = !DILocation(line: 56, column: 32, scope: !2341)
!2344 = !DILocation(line: 56, column: 22, scope: !2310)
!2345 = !DILocalVariable(name: "c", scope: !2346, file: !2203, line: 58, type: !14)
!2346 = distinct !DILexicalBlock(scope: !2341, file: !2203, line: 57, column: 13)
!2347 = !DILocation(line: 58, column: 22, scope: !2346)
!2348 = !DILocation(line: 58, column: 32, scope: !2346)
!2349 = !DILocation(line: 58, column: 26, scope: !2346)
!2350 = !DILocation(line: 59, column: 26, scope: !2346)
!2351 = !DILocation(line: 59, column: 17, scope: !2346)
!2352 = !DILocation(line: 59, column: 21, scope: !2346)
!2353 = !DILocation(line: 59, column: 24, scope: !2346)
!2354 = !DILocation(line: 60, column: 18, scope: !2346)
!2355 = !DILocation(line: 61, column: 13, scope: !2346)
!2356 = !DILocation(line: 62, column: 22, scope: !2357)
!2357 = distinct !DILexicalBlock(scope: !2341, file: !2203, line: 62, column: 22)
!2358 = !DILocation(line: 62, column: 29, scope: !2357)
!2359 = !DILocation(line: 62, column: 32, scope: !2357)
!2360 = !DILocation(line: 62, column: 22, scope: !2341)
!2361 = !DILocalVariable(name: "s", scope: !2362, file: !2203, line: 64, type: !13)
!2362 = distinct !DILexicalBlock(scope: !2357, file: !2203, line: 63, column: 13)
!2363 = !DILocation(line: 64, column: 23, scope: !2362)
!2364 = !DILocation(line: 64, column: 27, scope: !2362)
!2365 = !DILocalVariable(name: "k", scope: !2362, file: !2203, line: 65, type: !2220)
!2366 = !DILocation(line: 65, column: 24, scope: !2362)
!2367 = !DILocation(line: 66, column: 17, scope: !2362)
!2368 = !DILocation(line: 66, column: 24, scope: !2362)
!2369 = !DILocation(line: 66, column: 26, scope: !2362)
!2370 = !DILocation(line: 66, column: 29, scope: !2362)
!2371 = !DILocation(line: 68, column: 30, scope: !2372)
!2372 = distinct !DILexicalBlock(scope: !2362, file: !2203, line: 67, column: 17)
!2373 = !DILocation(line: 68, column: 32, scope: !2372)
!2374 = !DILocation(line: 68, column: 21, scope: !2372)
!2375 = !DILocation(line: 68, column: 25, scope: !2372)
!2376 = !DILocation(line: 68, column: 28, scope: !2372)
!2377 = !DILocation(line: 69, column: 22, scope: !2372)
!2378 = !DILocation(line: 70, column: 22, scope: !2372)
!2379 = distinct !{!2379, !2367, !2380, !293}
!2380 = !DILocation(line: 71, column: 17, scope: !2362)
!2381 = !DILocation(line: 72, column: 13, scope: !2362)
!2382 = !DILocation(line: 75, column: 26, scope: !2383)
!2383 = distinct !DILexicalBlock(scope: !2357, file: !2203, line: 74, column: 13)
!2384 = !DILocation(line: 75, column: 33, scope: !2383)
!2385 = !DILocation(line: 75, column: 17, scope: !2383)
!2386 = !DILocation(line: 75, column: 21, scope: !2383)
!2387 = !DILocation(line: 75, column: 24, scope: !2383)
!2388 = !DILocation(line: 76, column: 18, scope: !2383)
!2389 = !DILocation(line: 79, column: 14, scope: !2236)
!2390 = !DILocation(line: 80, column: 9, scope: !2236)
!2391 = !DILocation(line: 83, column: 22, scope: !2392)
!2392 = distinct !DILexicalBlock(scope: !2230, file: !2203, line: 82, column: 9)
!2393 = !DILocation(line: 83, column: 29, scope: !2392)
!2394 = !DILocation(line: 83, column: 13, scope: !2392)
!2395 = !DILocation(line: 83, column: 17, scope: !2392)
!2396 = !DILocation(line: 83, column: 20, scope: !2392)
!2397 = !DILocation(line: 84, column: 14, scope: !2392)
!2398 = !DILocation(line: 85, column: 14, scope: !2392)
!2399 = distinct !{!2399, !2225, !2400, !293}
!2400 = !DILocation(line: 87, column: 5, scope: !2202)
!2401 = !DILocation(line: 89, column: 5, scope: !2202)
!2402 = !DILocation(line: 89, column: 9, scope: !2202)
!2403 = !DILocation(line: 89, column: 12, scope: !2202)
!2404 = !DILocation(line: 91, column: 17, scope: !2202)
!2405 = !DILocation(line: 91, column: 12, scope: !2202)
!2406 = !DILocation(line: 91, column: 5, scope: !2202)
!2407 = distinct !DISubprogram(name: "__fizzer_model__helper_itoa", scope: !2408, file: !2408, line: 2, type: !2409, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !177, retainedNodes: !63)
!2408 = !DIFile(filename: "data/models/c/std/stdio/helper_itoa.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "20d31603d5d66432f19663f52fc24b10")
!2409 = !DISubroutineType(types: !2410)
!2410 = !{null, !6, !13, !6}
!2411 = !DILocalVariable(name: "value", arg: 1, scope: !2407, file: !2408, line: 2, type: !6)
!2412 = !DILocation(line: 2, column: 38, scope: !2407)
!2413 = !DILocalVariable(name: "buffer", arg: 2, scope: !2407, file: !2408, line: 2, type: !13)
!2414 = !DILocation(line: 2, column: 51, scope: !2407)
!2415 = !DILocalVariable(name: "base", arg: 3, scope: !2407, file: !2408, line: 2, type: !6)
!2416 = !DILocation(line: 2, column: 63, scope: !2407)
!2417 = !DILocalVariable(name: "temp", scope: !2407, file: !2408, line: 4, type: !2254)
!2418 = !DILocation(line: 4, column: 10, scope: !2407)
!2419 = !DILocalVariable(name: "i", scope: !2407, file: !2408, line: 5, type: !6)
!2420 = !DILocation(line: 5, column: 9, scope: !2407)
!2421 = !DILocalVariable(name: "is_negative", scope: !2407, file: !2408, line: 6, type: !6)
!2422 = !DILocation(line: 6, column: 9, scope: !2407)
!2423 = !DILocation(line: 8, column: 9, scope: !2424)
!2424 = distinct !DILexicalBlock(scope: !2407, file: !2408, line: 8, column: 9)
!2425 = !DILocation(line: 8, column: 15, scope: !2424)
!2426 = !DILocation(line: 8, column: 19, scope: !2424)
!2427 = !DILocation(line: 8, column: 22, scope: !2424)
!2428 = !DILocation(line: 8, column: 27, scope: !2424)
!2429 = !DILocation(line: 8, column: 9, scope: !2407)
!2430 = !DILocation(line: 10, column: 21, scope: !2431)
!2431 = distinct !DILexicalBlock(scope: !2424, file: !2408, line: 9, column: 5)
!2432 = !DILocation(line: 11, column: 18, scope: !2431)
!2433 = !DILocation(line: 11, column: 17, scope: !2431)
!2434 = !DILocation(line: 11, column: 15, scope: !2431)
!2435 = !DILocation(line: 12, column: 5, scope: !2431)
!2436 = !DILocation(line: 14, column: 9, scope: !2437)
!2437 = distinct !DILexicalBlock(scope: !2407, file: !2408, line: 14, column: 9)
!2438 = !DILocation(line: 14, column: 15, scope: !2437)
!2439 = !DILocation(line: 14, column: 9, scope: !2407)
!2440 = !DILocation(line: 16, column: 9, scope: !2441)
!2441 = distinct !DILexicalBlock(scope: !2437, file: !2408, line: 15, column: 5)
!2442 = !DILocation(line: 16, column: 19, scope: !2441)
!2443 = !DILocation(line: 17, column: 9, scope: !2441)
!2444 = !DILocation(line: 17, column: 19, scope: !2441)
!2445 = !DILocation(line: 18, column: 9, scope: !2441)
!2446 = !DILocation(line: 21, column: 5, scope: !2407)
!2447 = !DILocation(line: 21, column: 12, scope: !2407)
!2448 = !DILocation(line: 21, column: 18, scope: !2407)
!2449 = !DILocalVariable(name: "rem", scope: !2450, file: !2408, line: 23, type: !6)
!2450 = distinct !DILexicalBlock(scope: !2407, file: !2408, line: 22, column: 5)
!2451 = !DILocation(line: 23, column: 13, scope: !2450)
!2452 = !DILocation(line: 23, column: 19, scope: !2450)
!2453 = !DILocation(line: 23, column: 27, scope: !2450)
!2454 = !DILocation(line: 23, column: 25, scope: !2450)
!2455 = !DILocation(line: 24, column: 13, scope: !2456)
!2456 = distinct !DILexicalBlock(scope: !2450, file: !2408, line: 24, column: 13)
!2457 = !DILocation(line: 24, column: 17, scope: !2456)
!2458 = !DILocation(line: 24, column: 13, scope: !2450)
!2459 = !DILocation(line: 26, column: 29, scope: !2460)
!2460 = distinct !DILexicalBlock(scope: !2456, file: !2408, line: 25, column: 9)
!2461 = !DILocation(line: 26, column: 27, scope: !2460)
!2462 = !DILocation(line: 26, column: 23, scope: !2460)
!2463 = !DILocation(line: 26, column: 18, scope: !2460)
!2464 = !DILocation(line: 26, column: 13, scope: !2460)
!2465 = !DILocation(line: 26, column: 21, scope: !2460)
!2466 = !DILocation(line: 27, column: 9, scope: !2460)
!2467 = !DILocation(line: 30, column: 30, scope: !2468)
!2468 = distinct !DILexicalBlock(scope: !2456, file: !2408, line: 29, column: 9)
!2469 = !DILocation(line: 30, column: 34, scope: !2468)
!2470 = !DILocation(line: 30, column: 27, scope: !2468)
!2471 = !DILocation(line: 30, column: 23, scope: !2468)
!2472 = !DILocation(line: 30, column: 18, scope: !2468)
!2473 = !DILocation(line: 30, column: 13, scope: !2468)
!2474 = !DILocation(line: 30, column: 21, scope: !2468)
!2475 = !DILocation(line: 32, column: 17, scope: !2450)
!2476 = !DILocation(line: 32, column: 25, scope: !2450)
!2477 = !DILocation(line: 32, column: 23, scope: !2450)
!2478 = !DILocation(line: 32, column: 15, scope: !2450)
!2479 = !DILocation(line: 33, column: 10, scope: !2450)
!2480 = distinct !{!2480, !2446, !2481, !293}
!2481 = !DILocation(line: 34, column: 5, scope: !2407)
!2482 = !DILocalVariable(name: "j", scope: !2407, file: !2408, line: 36, type: !6)
!2483 = !DILocation(line: 36, column: 9, scope: !2407)
!2484 = !DILocation(line: 37, column: 9, scope: !2485)
!2485 = distinct !DILexicalBlock(scope: !2407, file: !2408, line: 37, column: 9)
!2486 = !DILocation(line: 37, column: 9, scope: !2407)
!2487 = !DILocation(line: 39, column: 9, scope: !2488)
!2488 = distinct !DILexicalBlock(scope: !2485, file: !2408, line: 38, column: 5)
!2489 = !DILocation(line: 39, column: 16, scope: !2488)
!2490 = !DILocation(line: 39, column: 19, scope: !2488)
!2491 = !DILocation(line: 40, column: 10, scope: !2488)
!2492 = !DILocation(line: 41, column: 5, scope: !2488)
!2493 = !DILocation(line: 43, column: 5, scope: !2407)
!2494 = !DILocation(line: 43, column: 12, scope: !2407)
!2495 = !DILocation(line: 43, column: 14, scope: !2407)
!2496 = !DILocation(line: 45, column: 10, scope: !2497)
!2497 = distinct !DILexicalBlock(scope: !2407, file: !2408, line: 44, column: 5)
!2498 = !DILocation(line: 46, column: 26, scope: !2497)
!2499 = !DILocation(line: 46, column: 21, scope: !2497)
!2500 = !DILocation(line: 46, column: 9, scope: !2497)
!2501 = !DILocation(line: 46, column: 16, scope: !2497)
!2502 = !DILocation(line: 46, column: 19, scope: !2497)
!2503 = !DILocation(line: 47, column: 10, scope: !2497)
!2504 = distinct !{!2504, !2493, !2505, !293}
!2505 = !DILocation(line: 48, column: 5, scope: !2407)
!2506 = !DILocation(line: 50, column: 5, scope: !2407)
!2507 = !DILocation(line: 50, column: 12, scope: !2407)
!2508 = !DILocation(line: 50, column: 15, scope: !2407)
!2509 = !DILocation(line: 51, column: 1, scope: !2407)
!2510 = distinct !DISubprogram(name: "__fizzer_model__vsnprintf", scope: !2511, file: !2511, line: 2, type: !2512, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !179, retainedNodes: !63)
!2511 = !DIFile(filename: "data/models/c/std/stdio/vsnprintf.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "97ba02a558780981a4df185c06cf20d5")
!2512 = !DISubroutineType(types: !2513)
!2513 = !{!6, !13, !2514, !73, !2516}
!2514 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2515, line: 6, baseType: !252)
!2515 = !DIFile(filename: "data/models/c/std/stdio/vsnprintf.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "811d6d74b8b56631aab99e8a3863ea0c")
!2516 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2517, size: 64)
!2517 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, elements: !2518)
!2518 = !{!2519, !2520, !2521, !2522}
!2519 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !2517, file: !2511, baseType: !2154, size: 32)
!2520 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !2517, file: !2511, baseType: !2154, size: 32, offset: 32)
!2521 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !2517, file: !2511, baseType: !139, size: 64, offset: 64)
!2522 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !2517, file: !2511, baseType: !139, size: 64, offset: 128)
!2523 = !DILocalVariable(name: "str", arg: 1, scope: !2510, file: !2511, line: 2, type: !13)
!2524 = !DILocation(line: 2, column: 37, scope: !2510)
!2525 = !DILocalVariable(name: "size", arg: 2, scope: !2510, file: !2511, line: 2, type: !2514)
!2526 = !DILocation(line: 2, column: 49, scope: !2510)
!2527 = !DILocalVariable(name: "format", arg: 3, scope: !2510, file: !2511, line: 2, type: !73)
!2528 = !DILocation(line: 2, column: 67, scope: !2510)
!2529 = !DILocalVariable(name: "ap", arg: 4, scope: !2510, file: !2511, line: 2, type: !2516)
!2530 = !DILocation(line: 2, column: 83, scope: !2510)
!2531 = !DILocalVariable(name: "i", scope: !2510, file: !2511, line: 4, type: !2514)
!2532 = !DILocation(line: 4, column: 12, scope: !2510)
!2533 = !DILocalVariable(name: "j", scope: !2510, file: !2511, line: 5, type: !2514)
!2534 = !DILocation(line: 5, column: 12, scope: !2510)
!2535 = !DILocation(line: 7, column: 9, scope: !2536)
!2536 = distinct !DILexicalBlock(scope: !2510, file: !2511, line: 7, column: 9)
!2537 = !DILocation(line: 7, column: 14, scope: !2536)
!2538 = !DILocation(line: 7, column: 9, scope: !2510)
!2539 = !DILocation(line: 9, column: 9, scope: !2540)
!2540 = distinct !DILexicalBlock(scope: !2536, file: !2511, line: 8, column: 5)
!2541 = !DILocation(line: 12, column: 5, scope: !2510)
!2542 = !DILocation(line: 12, column: 12, scope: !2510)
!2543 = !DILocation(line: 12, column: 19, scope: !2510)
!2544 = !DILocation(line: 12, column: 22, scope: !2510)
!2545 = !DILocation(line: 12, column: 27, scope: !2510)
!2546 = !DILocation(line: 12, column: 30, scope: !2510)
!2547 = !DILocation(line: 12, column: 34, scope: !2510)
!2548 = !DILocation(line: 12, column: 39, scope: !2510)
!2549 = !DILocation(line: 12, column: 32, scope: !2510)
!2550 = !DILocation(line: 0, scope: !2510)
!2551 = !DILocation(line: 14, column: 13, scope: !2552)
!2552 = distinct !DILexicalBlock(scope: !2553, file: !2511, line: 14, column: 13)
!2553 = distinct !DILexicalBlock(scope: !2510, file: !2511, line: 13, column: 5)
!2554 = !DILocation(line: 14, column: 20, scope: !2552)
!2555 = !DILocation(line: 14, column: 23, scope: !2552)
!2556 = !DILocation(line: 14, column: 13, scope: !2553)
!2557 = !DILocation(line: 16, column: 14, scope: !2558)
!2558 = distinct !DILexicalBlock(scope: !2552, file: !2511, line: 15, column: 9)
!2559 = !DILocation(line: 17, column: 17, scope: !2560)
!2560 = distinct !DILexicalBlock(scope: !2558, file: !2511, line: 17, column: 17)
!2561 = !DILocation(line: 17, column: 24, scope: !2560)
!2562 = !DILocation(line: 17, column: 27, scope: !2560)
!2563 = !DILocation(line: 17, column: 17, scope: !2558)
!2564 = !DILocation(line: 19, column: 17, scope: !2565)
!2565 = distinct !DILexicalBlock(scope: !2560, file: !2511, line: 18, column: 13)
!2566 = !DILocalVariable(name: "buf", scope: !2558, file: !2511, line: 22, type: !2254)
!2567 = !DILocation(line: 22, column: 18, scope: !2558)
!2568 = !DILocalVariable(name: "k", scope: !2558, file: !2511, line: 23, type: !2514)
!2569 = !DILocation(line: 23, column: 20, scope: !2558)
!2570 = !DILocation(line: 25, column: 17, scope: !2571)
!2571 = distinct !DILexicalBlock(scope: !2558, file: !2511, line: 25, column: 17)
!2572 = !DILocation(line: 25, column: 24, scope: !2571)
!2573 = !DILocation(line: 25, column: 27, scope: !2571)
!2574 = !DILocation(line: 25, column: 17, scope: !2558)
!2575 = !DILocalVariable(name: "val", scope: !2576, file: !2511, line: 27, type: !6)
!2576 = distinct !DILexicalBlock(scope: !2571, file: !2511, line: 26, column: 13)
!2577 = !DILocation(line: 27, column: 21, scope: !2576)
!2578 = !DILocation(line: 27, column: 27, scope: !2576)
!2579 = !DILocation(line: 28, column: 45, scope: !2576)
!2580 = !DILocation(line: 28, column: 50, scope: !2576)
!2581 = !DILocation(line: 28, column: 17, scope: !2576)
!2582 = !DILocation(line: 29, column: 13, scope: !2576)
!2583 = !DILocation(line: 30, column: 22, scope: !2584)
!2584 = distinct !DILexicalBlock(scope: !2571, file: !2511, line: 30, column: 22)
!2585 = !DILocation(line: 30, column: 29, scope: !2584)
!2586 = !DILocation(line: 30, column: 32, scope: !2584)
!2587 = !DILocation(line: 30, column: 22, scope: !2571)
!2588 = !DILocalVariable(name: "val", scope: !2589, file: !2511, line: 32, type: !2154)
!2589 = distinct !DILexicalBlock(scope: !2584, file: !2511, line: 31, column: 13)
!2590 = !DILocation(line: 32, column: 30, scope: !2589)
!2591 = !DILocation(line: 32, column: 36, scope: !2589)
!2592 = !DILocation(line: 33, column: 50, scope: !2589)
!2593 = !DILocation(line: 33, column: 55, scope: !2589)
!2594 = !DILocation(line: 33, column: 17, scope: !2589)
!2595 = !DILocation(line: 34, column: 13, scope: !2589)
!2596 = !DILocation(line: 35, column: 22, scope: !2597)
!2597 = distinct !DILexicalBlock(scope: !2584, file: !2511, line: 35, column: 22)
!2598 = !DILocation(line: 35, column: 29, scope: !2597)
!2599 = !DILocation(line: 35, column: 32, scope: !2597)
!2600 = !DILocation(line: 35, column: 22, scope: !2584)
!2601 = !DILocalVariable(name: "val", scope: !2602, file: !2511, line: 37, type: !2154)
!2602 = distinct !DILexicalBlock(scope: !2597, file: !2511, line: 36, column: 13)
!2603 = !DILocation(line: 37, column: 30, scope: !2602)
!2604 = !DILocation(line: 37, column: 36, scope: !2602)
!2605 = !DILocation(line: 38, column: 50, scope: !2602)
!2606 = !DILocation(line: 38, column: 55, scope: !2602)
!2607 = !DILocation(line: 38, column: 17, scope: !2602)
!2608 = !DILocation(line: 39, column: 13, scope: !2602)
!2609 = !DILocation(line: 40, column: 22, scope: !2610)
!2610 = distinct !DILexicalBlock(scope: !2597, file: !2511, line: 40, column: 22)
!2611 = !DILocation(line: 40, column: 29, scope: !2610)
!2612 = !DILocation(line: 40, column: 32, scope: !2610)
!2613 = !DILocation(line: 40, column: 22, scope: !2597)
!2614 = !DILocation(line: 42, column: 32, scope: !2615)
!2615 = distinct !DILexicalBlock(scope: !2610, file: !2511, line: 41, column: 13)
!2616 = !DILocation(line: 42, column: 26, scope: !2615)
!2617 = !DILocation(line: 42, column: 17, scope: !2615)
!2618 = !DILocation(line: 42, column: 24, scope: !2615)
!2619 = !DILocation(line: 43, column: 17, scope: !2615)
!2620 = !DILocation(line: 43, column: 24, scope: !2615)
!2621 = !DILocation(line: 44, column: 13, scope: !2615)
!2622 = !DILocation(line: 45, column: 22, scope: !2623)
!2623 = distinct !DILexicalBlock(scope: !2610, file: !2511, line: 45, column: 22)
!2624 = !DILocation(line: 45, column: 29, scope: !2623)
!2625 = !DILocation(line: 45, column: 32, scope: !2623)
!2626 = !DILocation(line: 45, column: 22, scope: !2610)
!2627 = !DILocalVariable(name: "s", scope: !2628, file: !2511, line: 47, type: !13)
!2628 = distinct !DILexicalBlock(scope: !2623, file: !2511, line: 46, column: 13)
!2629 = !DILocation(line: 47, column: 23, scope: !2628)
!2630 = !DILocation(line: 47, column: 27, scope: !2628)
!2631 = !DILocation(line: 48, column: 19, scope: !2628)
!2632 = !DILocation(line: 49, column: 17, scope: !2628)
!2633 = !DILocation(line: 49, column: 24, scope: !2628)
!2634 = !DILocation(line: 49, column: 26, scope: !2628)
!2635 = !DILocation(line: 49, column: 29, scope: !2628)
!2636 = !DILocation(line: 49, column: 34, scope: !2628)
!2637 = !DILocation(line: 49, column: 37, scope: !2628)
!2638 = !DILocation(line: 49, column: 41, scope: !2628)
!2639 = !DILocation(line: 49, column: 46, scope: !2628)
!2640 = !DILocation(line: 49, column: 39, scope: !2628)
!2641 = !DILocation(line: 0, scope: !2628)
!2642 = !DILocation(line: 51, column: 30, scope: !2643)
!2643 = distinct !DILexicalBlock(scope: !2628, file: !2511, line: 50, column: 17)
!2644 = !DILocation(line: 51, column: 32, scope: !2643)
!2645 = !DILocation(line: 51, column: 21, scope: !2643)
!2646 = !DILocation(line: 51, column: 25, scope: !2643)
!2647 = !DILocation(line: 51, column: 28, scope: !2643)
!2648 = !DILocation(line: 52, column: 22, scope: !2643)
!2649 = !DILocation(line: 53, column: 22, scope: !2643)
!2650 = distinct !{!2650, !2632, !2651, !293}
!2651 = !DILocation(line: 54, column: 17, scope: !2628)
!2652 = !DILocation(line: 55, column: 18, scope: !2628)
!2653 = !DILocation(line: 56, column: 17, scope: !2628)
!2654 = distinct !{!2654, !2541, !2655, !293}
!2655 = !DILocation(line: 80, column: 5, scope: !2510)
!2656 = !DILocation(line: 60, column: 26, scope: !2657)
!2657 = distinct !DILexicalBlock(scope: !2623, file: !2511, line: 59, column: 13)
!2658 = !DILocation(line: 60, column: 33, scope: !2657)
!2659 = !DILocation(line: 60, column: 17, scope: !2657)
!2660 = !DILocation(line: 60, column: 24, scope: !2657)
!2661 = !DILocation(line: 61, column: 17, scope: !2657)
!2662 = !DILocation(line: 61, column: 24, scope: !2657)
!2663 = !DILocation(line: 64, column: 15, scope: !2558)
!2664 = !DILocation(line: 65, column: 13, scope: !2558)
!2665 = !DILocation(line: 65, column: 24, scope: !2558)
!2666 = !DILocation(line: 65, column: 20, scope: !2558)
!2667 = !DILocation(line: 65, column: 27, scope: !2558)
!2668 = !DILocation(line: 65, column: 32, scope: !2558)
!2669 = !DILocation(line: 65, column: 35, scope: !2558)
!2670 = !DILocation(line: 65, column: 39, scope: !2558)
!2671 = !DILocation(line: 65, column: 44, scope: !2558)
!2672 = !DILocation(line: 65, column: 37, scope: !2558)
!2673 = !DILocation(line: 0, scope: !2558)
!2674 = !DILocation(line: 67, column: 30, scope: !2675)
!2675 = distinct !DILexicalBlock(scope: !2558, file: !2511, line: 66, column: 13)
!2676 = !DILocation(line: 67, column: 26, scope: !2675)
!2677 = !DILocation(line: 67, column: 17, scope: !2675)
!2678 = !DILocation(line: 67, column: 21, scope: !2675)
!2679 = !DILocation(line: 67, column: 24, scope: !2675)
!2680 = !DILocation(line: 68, column: 18, scope: !2675)
!2681 = !DILocation(line: 69, column: 18, scope: !2675)
!2682 = distinct !{!2682, !2664, !2683, !293}
!2683 = !DILocation(line: 70, column: 13, scope: !2558)
!2684 = !DILocation(line: 72, column: 14, scope: !2558)
!2685 = !DILocation(line: 73, column: 9, scope: !2558)
!2686 = !DILocation(line: 76, column: 22, scope: !2687)
!2687 = distinct !DILexicalBlock(scope: !2552, file: !2511, line: 75, column: 9)
!2688 = !DILocation(line: 76, column: 29, scope: !2687)
!2689 = !DILocation(line: 76, column: 13, scope: !2687)
!2690 = !DILocation(line: 76, column: 17, scope: !2687)
!2691 = !DILocation(line: 76, column: 20, scope: !2687)
!2692 = !DILocation(line: 77, column: 14, scope: !2687)
!2693 = !DILocation(line: 78, column: 14, scope: !2687)
!2694 = !DILocation(line: 82, column: 5, scope: !2510)
!2695 = !DILocation(line: 82, column: 9, scope: !2510)
!2696 = !DILocation(line: 82, column: 12, scope: !2510)
!2697 = !DILocation(line: 83, column: 17, scope: !2510)
!2698 = !DILocation(line: 83, column: 12, scope: !2510)
!2699 = !DILocation(line: 83, column: 5, scope: !2510)
!2700 = !DILocation(line: 84, column: 1, scope: !2510)
!2701 = distinct !DISubprogram(name: "__fizzer_model__fabsl", scope: !2702, file: !2702, line: 2, type: !2703, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !181, retainedNodes: !63)
!2702 = !DIFile(filename: "data/models/c/std/math/fabsl.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "5c5076ae740114377af63cf033329357")
!2703 = !DISubroutineType(types: !2704)
!2704 = !{!2705, !2705}
!2705 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!2706 = !DILocalVariable(name: "x", arg: 1, scope: !2701, file: !2702, line: 2, type: !2705)
!2707 = !DILocation(line: 2, column: 47, scope: !2701)
!2708 = !DILocation(line: 4, column: 9, scope: !2709)
!2709 = distinct !DILexicalBlock(scope: !2701, file: !2702, line: 4, column: 9)
!2710 = !DILocation(line: 4, column: 11, scope: !2709)
!2711 = !DILocation(line: 4, column: 9, scope: !2701)
!2712 = !DILocation(line: 5, column: 17, scope: !2709)
!2713 = !DILocation(line: 5, column: 16, scope: !2709)
!2714 = !DILocation(line: 5, column: 9, scope: !2709)
!2715 = !DILocation(line: 7, column: 16, scope: !2709)
!2716 = !DILocation(line: 7, column: 9, scope: !2709)
!2717 = !DILocation(line: 8, column: 1, scope: !2701)
!2718 = distinct !DISubprogram(name: "__fizzer_model__fabs", scope: !2719, file: !2719, line: 2, type: !2720, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !183, retainedNodes: !63)
!2719 = !DIFile(filename: "data/models/c/std/math/fabs.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "8c49c577f21ca028a8a9f5afb48aacbb")
!2720 = !DISubroutineType(types: !2721)
!2721 = !{!88, !88}
!2722 = !DILocalVariable(name: "x", arg: 1, scope: !2718, file: !2719, line: 2, type: !88)
!2723 = !DILocation(line: 2, column: 36, scope: !2718)
!2724 = !DILocation(line: 4, column: 9, scope: !2725)
!2725 = distinct !DILexicalBlock(scope: !2718, file: !2719, line: 4, column: 9)
!2726 = !DILocation(line: 4, column: 11, scope: !2725)
!2727 = !DILocation(line: 4, column: 9, scope: !2718)
!2728 = !DILocation(line: 5, column: 17, scope: !2725)
!2729 = !DILocation(line: 5, column: 16, scope: !2725)
!2730 = !DILocation(line: 5, column: 9, scope: !2725)
!2731 = !DILocation(line: 7, column: 16, scope: !2725)
!2732 = !DILocation(line: 7, column: 9, scope: !2725)
!2733 = !DILocation(line: 8, column: 1, scope: !2718)
!2734 = distinct !DISubprogram(name: "__fizzer_model__fabsf", scope: !2735, file: !2735, line: 2, type: !2736, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !185, retainedNodes: !63)
!2735 = !DIFile(filename: "data/models/c/std/math/fabsf.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "b084fca80d77cc63411b9d4b3fe450c4")
!2736 = !DISubroutineType(types: !2737)
!2737 = !{!2738, !2738}
!2738 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!2739 = !DILocalVariable(name: "x", arg: 1, scope: !2734, file: !2735, line: 2, type: !2738)
!2740 = !DILocation(line: 2, column: 35, scope: !2734)
!2741 = !DILocation(line: 4, column: 9, scope: !2742)
!2742 = distinct !DILexicalBlock(scope: !2734, file: !2735, line: 4, column: 9)
!2743 = !DILocation(line: 4, column: 11, scope: !2742)
!2744 = !DILocation(line: 4, column: 9, scope: !2734)
!2745 = !DILocation(line: 5, column: 17, scope: !2742)
!2746 = !DILocation(line: 5, column: 16, scope: !2742)
!2747 = !DILocation(line: 5, column: 9, scope: !2742)
!2748 = !DILocation(line: 7, column: 16, scope: !2742)
!2749 = !DILocation(line: 7, column: 9, scope: !2742)
!2750 = !DILocation(line: 8, column: 1, scope: !2734)
!2751 = distinct !DISubprogram(name: "__fizzer_model__strftime", scope: !2752, file: !2752, line: 3, type: !2753, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !187, retainedNodes: !63)
!2752 = !DIFile(filename: "data/models/c/std/time/strftime.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "60233b54b62040efdc56806d7e2f5c85")
!2753 = !DISubroutineType(types: !2754)
!2754 = !{!2755, !13, !2757, !73, !2759}
!2755 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2756, line: 6, baseType: !252)
!2756 = !DIFile(filename: "data/models/c/std/time/strftime.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "0140443382a318fb7fcf42588cda3812")
!2757 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2758, line: 18, baseType: !252)
!2758 = !DIFile(filename: "/usr/lib/llvm-18/lib/clang/18/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!2759 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2760, size: 64)
!2760 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2761)
!2761 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !2762, line: 7, size: 448, elements: !2763)
!2762 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h", directory: "", checksumkind: CSK_MD5, checksum: "9e5545b565ef031c4cd0faf90b69386f")
!2763 = !{!2764, !2765, !2766, !2767, !2768, !2769, !2770, !2771, !2772, !2773, !2774}
!2764 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !2761, file: !2762, line: 9, baseType: !6, size: 32)
!2765 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !2761, file: !2762, line: 10, baseType: !6, size: 32, offset: 32)
!2766 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !2761, file: !2762, line: 11, baseType: !6, size: 32, offset: 64)
!2767 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !2761, file: !2762, line: 12, baseType: !6, size: 32, offset: 96)
!2768 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !2761, file: !2762, line: 13, baseType: !6, size: 32, offset: 128)
!2769 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !2761, file: !2762, line: 14, baseType: !6, size: 32, offset: 160)
!2770 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !2761, file: !2762, line: 15, baseType: !6, size: 32, offset: 192)
!2771 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !2761, file: !2762, line: 16, baseType: !6, size: 32, offset: 224)
!2772 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !2761, file: !2762, line: 17, baseType: !6, size: 32, offset: 256)
!2773 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !2761, file: !2762, line: 20, baseType: !779, size: 64, offset: 320)
!2774 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !2761, file: !2762, line: 21, baseType: !73, size: 64, offset: 384)
!2775 = !DILocalVariable(name: "s", arg: 1, scope: !2751, file: !2752, line: 3, type: !13)
!2776 = !DILocation(line: 3, column: 39, scope: !2751)
!2777 = !DILocalVariable(name: "max", arg: 2, scope: !2751, file: !2752, line: 3, type: !2757)
!2778 = !DILocation(line: 3, column: 49, scope: !2751)
!2779 = !DILocalVariable(name: "format", arg: 3, scope: !2751, file: !2752, line: 3, type: !73)
!2780 = !DILocation(line: 3, column: 66, scope: !2751)
!2781 = !DILocalVariable(name: "tm", arg: 4, scope: !2751, file: !2752, line: 3, type: !2759)
!2782 = !DILocation(line: 3, column: 91, scope: !2751)
!2783 = !DILocalVariable(name: "i", scope: !2751, file: !2752, line: 5, type: !2757)
!2784 = !DILocation(line: 5, column: 12, scope: !2751)
!2785 = !DILocalVariable(name: "j", scope: !2751, file: !2752, line: 6, type: !2757)
!2786 = !DILocation(line: 6, column: 12, scope: !2751)
!2787 = !DILocalVariable(name: "buf", scope: !2751, file: !2752, line: 8, type: !53)
!2788 = !DILocation(line: 8, column: 10, scope: !2751)
!2789 = !DILocation(line: 10, column: 5, scope: !2751)
!2790 = !DILocation(line: 10, column: 12, scope: !2751)
!2791 = !DILocation(line: 10, column: 19, scope: !2751)
!2792 = !DILocation(line: 10, column: 22, scope: !2751)
!2793 = !DILocation(line: 10, column: 27, scope: !2751)
!2794 = !DILocation(line: 10, column: 30, scope: !2751)
!2795 = !DILocation(line: 10, column: 34, scope: !2751)
!2796 = !DILocation(line: 10, column: 38, scope: !2751)
!2797 = !DILocation(line: 10, column: 32, scope: !2751)
!2798 = !DILocation(line: 0, scope: !2751)
!2799 = !DILocation(line: 12, column: 13, scope: !2800)
!2800 = distinct !DILexicalBlock(scope: !2801, file: !2752, line: 12, column: 13)
!2801 = distinct !DILexicalBlock(scope: !2751, file: !2752, line: 11, column: 5)
!2802 = !DILocation(line: 12, column: 20, scope: !2800)
!2803 = !DILocation(line: 12, column: 23, scope: !2800)
!2804 = !DILocation(line: 12, column: 13, scope: !2801)
!2805 = !DILocation(line: 14, column: 14, scope: !2806)
!2806 = distinct !DILexicalBlock(scope: !2800, file: !2752, line: 13, column: 9)
!2807 = !DILocation(line: 15, column: 17, scope: !2808)
!2808 = distinct !DILexicalBlock(scope: !2806, file: !2752, line: 15, column: 17)
!2809 = !DILocation(line: 15, column: 24, scope: !2808)
!2810 = !DILocation(line: 15, column: 27, scope: !2808)
!2811 = !DILocation(line: 15, column: 17, scope: !2806)
!2812 = !DILocation(line: 17, column: 17, scope: !2813)
!2813 = distinct !DILexicalBlock(scope: !2808, file: !2752, line: 16, column: 13)
!2814 = !DILocalVariable(name: "k", scope: !2806, file: !2752, line: 20, type: !6)
!2815 = !DILocation(line: 20, column: 17, scope: !2806)
!2816 = !DILocation(line: 21, column: 17, scope: !2817)
!2817 = distinct !DILexicalBlock(scope: !2806, file: !2752, line: 21, column: 17)
!2818 = !DILocation(line: 21, column: 24, scope: !2817)
!2819 = !DILocation(line: 21, column: 27, scope: !2817)
!2820 = !DILocation(line: 21, column: 17, scope: !2806)
!2821 = !DILocalVariable(name: "year", scope: !2822, file: !2752, line: 23, type: !6)
!2822 = distinct !DILexicalBlock(scope: !2817, file: !2752, line: 22, column: 13)
!2823 = !DILocation(line: 23, column: 21, scope: !2822)
!2824 = !DILocation(line: 23, column: 35, scope: !2822)
!2825 = !DILocation(line: 23, column: 39, scope: !2822)
!2826 = !DILocation(line: 23, column: 33, scope: !2822)
!2827 = !DILocation(line: 24, column: 45, scope: !2822)
!2828 = !DILocation(line: 24, column: 51, scope: !2822)
!2829 = !DILocation(line: 24, column: 17, scope: !2822)
!2830 = !DILocation(line: 25, column: 13, scope: !2822)
!2831 = !DILocation(line: 26, column: 22, scope: !2832)
!2832 = distinct !DILexicalBlock(scope: !2817, file: !2752, line: 26, column: 22)
!2833 = !DILocation(line: 26, column: 29, scope: !2832)
!2834 = !DILocation(line: 26, column: 32, scope: !2832)
!2835 = !DILocation(line: 26, column: 22, scope: !2817)
!2836 = !DILocalVariable(name: "month", scope: !2837, file: !2752, line: 28, type: !6)
!2837 = distinct !DILexicalBlock(scope: !2832, file: !2752, line: 27, column: 13)
!2838 = !DILocation(line: 28, column: 21, scope: !2837)
!2839 = !DILocation(line: 28, column: 29, scope: !2837)
!2840 = !DILocation(line: 28, column: 33, scope: !2837)
!2841 = !DILocation(line: 28, column: 40, scope: !2837)
!2842 = !DILocation(line: 29, column: 45, scope: !2837)
!2843 = !DILocation(line: 29, column: 52, scope: !2837)
!2844 = !DILocation(line: 29, column: 17, scope: !2837)
!2845 = !DILocation(line: 30, column: 13, scope: !2837)
!2846 = !DILocation(line: 31, column: 22, scope: !2847)
!2847 = distinct !DILexicalBlock(scope: !2832, file: !2752, line: 31, column: 22)
!2848 = !DILocation(line: 31, column: 29, scope: !2847)
!2849 = !DILocation(line: 31, column: 32, scope: !2847)
!2850 = !DILocation(line: 31, column: 22, scope: !2832)
!2851 = !DILocalVariable(name: "day", scope: !2852, file: !2752, line: 33, type: !6)
!2852 = distinct !DILexicalBlock(scope: !2847, file: !2752, line: 32, column: 13)
!2853 = !DILocation(line: 33, column: 21, scope: !2852)
!2854 = !DILocation(line: 33, column: 27, scope: !2852)
!2855 = !DILocation(line: 33, column: 31, scope: !2852)
!2856 = !DILocation(line: 34, column: 45, scope: !2852)
!2857 = !DILocation(line: 34, column: 50, scope: !2852)
!2858 = !DILocation(line: 34, column: 17, scope: !2852)
!2859 = !DILocation(line: 35, column: 13, scope: !2852)
!2860 = !DILocation(line: 36, column: 22, scope: !2861)
!2861 = distinct !DILexicalBlock(scope: !2847, file: !2752, line: 36, column: 22)
!2862 = !DILocation(line: 36, column: 29, scope: !2861)
!2863 = !DILocation(line: 36, column: 32, scope: !2861)
!2864 = !DILocation(line: 36, column: 22, scope: !2847)
!2865 = !DILocalVariable(name: "hour", scope: !2866, file: !2752, line: 38, type: !6)
!2866 = distinct !DILexicalBlock(scope: !2861, file: !2752, line: 37, column: 13)
!2867 = !DILocation(line: 38, column: 21, scope: !2866)
!2868 = !DILocation(line: 38, column: 28, scope: !2866)
!2869 = !DILocation(line: 38, column: 32, scope: !2866)
!2870 = !DILocation(line: 39, column: 45, scope: !2866)
!2871 = !DILocation(line: 39, column: 51, scope: !2866)
!2872 = !DILocation(line: 39, column: 17, scope: !2866)
!2873 = !DILocation(line: 40, column: 13, scope: !2866)
!2874 = !DILocation(line: 41, column: 22, scope: !2875)
!2875 = distinct !DILexicalBlock(scope: !2861, file: !2752, line: 41, column: 22)
!2876 = !DILocation(line: 41, column: 29, scope: !2875)
!2877 = !DILocation(line: 41, column: 32, scope: !2875)
!2878 = !DILocation(line: 41, column: 22, scope: !2861)
!2879 = !DILocalVariable(name: "minute", scope: !2880, file: !2752, line: 43, type: !6)
!2880 = distinct !DILexicalBlock(scope: !2875, file: !2752, line: 42, column: 13)
!2881 = !DILocation(line: 43, column: 21, scope: !2880)
!2882 = !DILocation(line: 43, column: 30, scope: !2880)
!2883 = !DILocation(line: 43, column: 34, scope: !2880)
!2884 = !DILocation(line: 44, column: 45, scope: !2880)
!2885 = !DILocation(line: 44, column: 53, scope: !2880)
!2886 = !DILocation(line: 44, column: 17, scope: !2880)
!2887 = !DILocation(line: 45, column: 13, scope: !2880)
!2888 = !DILocation(line: 46, column: 22, scope: !2889)
!2889 = distinct !DILexicalBlock(scope: !2875, file: !2752, line: 46, column: 22)
!2890 = !DILocation(line: 46, column: 29, scope: !2889)
!2891 = !DILocation(line: 46, column: 32, scope: !2889)
!2892 = !DILocation(line: 46, column: 22, scope: !2875)
!2893 = !DILocalVariable(name: "second", scope: !2894, file: !2752, line: 48, type: !6)
!2894 = distinct !DILexicalBlock(scope: !2889, file: !2752, line: 47, column: 13)
!2895 = !DILocation(line: 48, column: 21, scope: !2894)
!2896 = !DILocation(line: 48, column: 30, scope: !2894)
!2897 = !DILocation(line: 48, column: 34, scope: !2894)
!2898 = !DILocation(line: 49, column: 45, scope: !2894)
!2899 = !DILocation(line: 49, column: 53, scope: !2894)
!2900 = !DILocation(line: 49, column: 17, scope: !2894)
!2901 = !DILocation(line: 50, column: 13, scope: !2894)
!2902 = !DILocation(line: 53, column: 26, scope: !2903)
!2903 = distinct !DILexicalBlock(scope: !2889, file: !2752, line: 52, column: 13)
!2904 = !DILocation(line: 53, column: 33, scope: !2903)
!2905 = !DILocation(line: 53, column: 17, scope: !2903)
!2906 = !DILocation(line: 53, column: 24, scope: !2903)
!2907 = !DILocation(line: 54, column: 17, scope: !2903)
!2908 = !DILocation(line: 54, column: 24, scope: !2903)
!2909 = !DILocation(line: 57, column: 15, scope: !2806)
!2910 = !DILocation(line: 58, column: 13, scope: !2806)
!2911 = !DILocation(line: 58, column: 24, scope: !2806)
!2912 = !DILocation(line: 58, column: 20, scope: !2806)
!2913 = !DILocation(line: 58, column: 27, scope: !2806)
!2914 = !DILocation(line: 58, column: 32, scope: !2806)
!2915 = !DILocation(line: 58, column: 35, scope: !2806)
!2916 = !DILocation(line: 58, column: 39, scope: !2806)
!2917 = !DILocation(line: 58, column: 43, scope: !2806)
!2918 = !DILocation(line: 58, column: 37, scope: !2806)
!2919 = !DILocation(line: 0, scope: !2806)
!2920 = !DILocation(line: 60, column: 28, scope: !2921)
!2921 = distinct !DILexicalBlock(scope: !2806, file: !2752, line: 59, column: 13)
!2922 = !DILocation(line: 60, column: 24, scope: !2921)
!2923 = !DILocation(line: 60, column: 17, scope: !2921)
!2924 = !DILocation(line: 60, column: 19, scope: !2921)
!2925 = !DILocation(line: 60, column: 22, scope: !2921)
!2926 = !DILocation(line: 61, column: 18, scope: !2921)
!2927 = !DILocation(line: 62, column: 18, scope: !2921)
!2928 = distinct !{!2928, !2910, !2929, !293}
!2929 = !DILocation(line: 63, column: 13, scope: !2806)
!2930 = !DILocation(line: 65, column: 14, scope: !2806)
!2931 = !DILocation(line: 66, column: 9, scope: !2806)
!2932 = !DILocation(line: 69, column: 20, scope: !2933)
!2933 = distinct !DILexicalBlock(scope: !2800, file: !2752, line: 68, column: 9)
!2934 = !DILocation(line: 69, column: 27, scope: !2933)
!2935 = !DILocation(line: 69, column: 13, scope: !2933)
!2936 = !DILocation(line: 69, column: 15, scope: !2933)
!2937 = !DILocation(line: 69, column: 18, scope: !2933)
!2938 = !DILocation(line: 70, column: 14, scope: !2933)
!2939 = !DILocation(line: 71, column: 14, scope: !2933)
!2940 = distinct !{!2940, !2789, !2941, !293}
!2941 = !DILocation(line: 73, column: 5, scope: !2751)
!2942 = !DILocation(line: 75, column: 5, scope: !2751)
!2943 = !DILocation(line: 75, column: 7, scope: !2751)
!2944 = !DILocation(line: 75, column: 10, scope: !2751)
!2945 = !DILocation(line: 76, column: 12, scope: !2751)
!2946 = !DILocation(line: 76, column: 5, scope: !2751)
!2947 = distinct !DISubprogram(name: "__fizzer_model__ctime", scope: !2948, file: !2948, line: 2, type: !2949, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !189, retainedNodes: !63)
!2948 = !DIFile(filename: "data/models/c/std/time/ctime.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "a911ddebb345e08702cf6c685c49baca")
!2949 = !DISubroutineType(types: !2950)
!2950 = !{!13, !2951, !13}
!2951 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2952, size: 64)
!2952 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2953)
!2953 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !2954, line: 14, baseType: !779)
!2954 = !DIFile(filename: "data/models/c/std/time/ctime.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "fa159fd5097e337914b2eb75fc3ffc16")
!2955 = !DILocalVariable(name: "timep", arg: 1, scope: !2947, file: !2948, line: 2, type: !2951)
!2956 = !DILocation(line: 2, column: 43, scope: !2947)
!2957 = !DILocalVariable(name: "buffer", arg: 2, scope: !2947, file: !2948, line: 2, type: !13)
!2958 = !DILocation(line: 2, column: 56, scope: !2947)
!2959 = !DILocalVariable(name: "template", scope: !2947, file: !2948, line: 4, type: !2960)
!2960 = !DICompositeType(tag: DW_TAG_array_type, baseType: !74, size: 208, elements: !49)
!2961 = !DILocation(line: 4, column: 16, scope: !2947)
!2962 = !DILocalVariable(name: "i", scope: !2947, file: !2948, line: 5, type: !2963)
!2963 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2954, line: 6, baseType: !252)
!2964 = !DILocation(line: 5, column: 12, scope: !2947)
!2965 = !DILocation(line: 7, column: 5, scope: !2947)
!2966 = !DILocation(line: 7, column: 21, scope: !2947)
!2967 = !DILocation(line: 7, column: 12, scope: !2947)
!2968 = !DILocation(line: 7, column: 24, scope: !2947)
!2969 = !DILocation(line: 9, column: 30, scope: !2970)
!2970 = distinct !DILexicalBlock(scope: !2947, file: !2948, line: 8, column: 5)
!2971 = !DILocation(line: 9, column: 21, scope: !2970)
!2972 = !DILocation(line: 9, column: 9, scope: !2970)
!2973 = !DILocation(line: 9, column: 16, scope: !2970)
!2974 = !DILocation(line: 9, column: 19, scope: !2970)
!2975 = !DILocation(line: 10, column: 10, scope: !2970)
!2976 = distinct !{!2976, !2965, !2977, !293}
!2977 = !DILocation(line: 11, column: 5, scope: !2947)
!2978 = !DILocation(line: 13, column: 5, scope: !2947)
!2979 = !DILocation(line: 13, column: 12, scope: !2947)
!2980 = !DILocation(line: 13, column: 15, scope: !2947)
!2981 = !DILocation(line: 14, column: 12, scope: !2947)
!2982 = !DILocation(line: 14, column: 5, scope: !2947)
