; ModuleID = '/home/marek/root/fizzer/dist/output/posix/optind.ll'
source_filename = "/home/marek/root/fizzer/dist/data//models/c/posix/optind.c"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

%struct.option = type { ptr, i32, ptr, i32 }
%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, ptr }

@__fizzer_model__optind = dso_local global i32 1, align 4, !dbg !0
@__fizzer_model__optarg = dso_local global ptr null, align 4, !dbg !7
@__fizzer_model__opterr = dso_local global i32 1, align 4, !dbg !15
@__fizzer_model__optopt = dso_local global i32 63, align 4, !dbg !21
@__fizzer_model__strerror.unknown = internal global [14 x i8] c"Unknown error\00", align 1, !dbg !27
@.str = private unnamed_addr constant [9 x i8] c"No error\00", align 1, !dbg !36
@.str.1 = private unnamed_addr constant [24 x i8] c"Operation not permitted\00", align 1, !dbg !41
@.str.2 = private unnamed_addr constant [26 x i8] c"No such file or directory\00", align 1, !dbg !46
@.str.3 = private unnamed_addr constant [16 x i8] c"No such process\00", align 1, !dbg !51
@.str.4 = private unnamed_addr constant [24 x i8] c"Interrupted system call\00", align 1, !dbg !56
@.str.5 = private unnamed_addr constant [19 x i8] c"Input/output error\00", align 1, !dbg !58
@__fizzer_model__strtok.next = internal global ptr null, align 4, !dbg !67
@__const.__fizzer_model__ctime.template = private unnamed_addr constant [26 x i8] c"Wed Jan 01 00:00:00 1970\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__getopt_long(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #0 !dbg !200 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 4
  %9 = alloca ptr, align 4
  %10 = alloca ptr, align 4
  %11 = alloca ptr, align 4
  %12 = alloca ptr, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !216, metadata !DIExpression()), !dbg !217
  store ptr %1, ptr %8, align 4
  call void @llvm.dbg.declare(metadata ptr %8, metadata !218, metadata !DIExpression()), !dbg !219
  store ptr %2, ptr %9, align 4
  call void @llvm.dbg.declare(metadata ptr %9, metadata !220, metadata !DIExpression()), !dbg !221
  store ptr %3, ptr %10, align 4
  call void @llvm.dbg.declare(metadata ptr %10, metadata !222, metadata !DIExpression()), !dbg !223
  store ptr %4, ptr %11, align 4
  call void @llvm.dbg.declare(metadata ptr %11, metadata !224, metadata !DIExpression()), !dbg !225
  %16 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !226
  %17 = load i32, ptr %7, align 4, !dbg !228
  %18 = icmp sge i32 %16, %17, !dbg !229
  br i1 %18, label %19, label %20, !dbg !230

19:                                               ; preds = %5
  store i32 -1, ptr %6, align 4, !dbg !231
  br label %177, !dbg !231

20:                                               ; preds = %5
  call void @llvm.dbg.declare(metadata ptr %12, metadata !233, metadata !DIExpression()), !dbg !234
  %21 = load ptr, ptr %8, align 4, !dbg !235
  %22 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !236
  %23 = getelementptr inbounds ptr, ptr %21, i32 %22, !dbg !235
  %24 = load ptr, ptr %23, align 4, !dbg !235
  store ptr %24, ptr %12, align 4, !dbg !234
  %25 = load ptr, ptr %12, align 4, !dbg !237
  %26 = getelementptr inbounds i8, ptr %25, i32 0, !dbg !237
  %27 = load i8, ptr %26, align 1, !dbg !237
  %28 = sext i8 %27 to i32, !dbg !237
  %29 = icmp ne i32 %28, 45, !dbg !239
  br i1 %29, label %36, label %30, !dbg !240

30:                                               ; preds = %20
  %31 = load ptr, ptr %12, align 4, !dbg !241
  %32 = getelementptr inbounds i8, ptr %31, i32 1, !dbg !241
  %33 = load i8, ptr %32, align 1, !dbg !241
  %34 = sext i8 %33 to i32, !dbg !241
  %35 = icmp ne i32 %34, 45, !dbg !242
  br i1 %35, label %36, label %41, !dbg !243

36:                                               ; preds = %30, %20
  %37 = load i32, ptr %7, align 4, !dbg !244
  %38 = load ptr, ptr %8, align 4, !dbg !246
  %39 = load ptr, ptr %9, align 4, !dbg !247
  %40 = call i32 @__fizzer_model__getopt(i32 noundef %37, ptr noundef %38, ptr noundef %39), !dbg !248
  store i32 %40, ptr %6, align 4, !dbg !249
  br label %177, !dbg !249

41:                                               ; preds = %30
  call void @llvm.dbg.declare(metadata ptr %13, metadata !250, metadata !DIExpression()), !dbg !254
  store i32 0, ptr %13, align 4, !dbg !254
  br label %42, !dbg !255

42:                                               ; preds = %171, %41
  %43 = load ptr, ptr %10, align 4, !dbg !256
  %44 = load i32, ptr %13, align 4, !dbg !257
  %45 = getelementptr inbounds %struct.option, ptr %43, i32 %44, !dbg !256
  %46 = getelementptr inbounds %struct.option, ptr %45, i32 0, i32 0, !dbg !258
  %47 = load ptr, ptr %46, align 4, !dbg !258
  %48 = icmp ne ptr %47, null, !dbg !259
  br i1 %48, label %49, label %174, !dbg !255

49:                                               ; preds = %42
  call void @llvm.dbg.declare(metadata ptr %14, metadata !260, metadata !DIExpression()), !dbg !262
  store i32 0, ptr %14, align 4, !dbg !262
  call void @llvm.dbg.declare(metadata ptr %15, metadata !263, metadata !DIExpression()), !dbg !264
  store i32 1, ptr %15, align 4, !dbg !264
  br label %50, !dbg !265

50:                                               ; preds = %89, %49
  %51 = load ptr, ptr %10, align 4, !dbg !266
  %52 = load i32, ptr %13, align 4, !dbg !267
  %53 = getelementptr inbounds %struct.option, ptr %51, i32 %52, !dbg !266
  %54 = getelementptr inbounds %struct.option, ptr %53, i32 0, i32 0, !dbg !268
  %55 = load ptr, ptr %54, align 4, !dbg !268
  %56 = load i32, ptr %14, align 4, !dbg !269
  %57 = getelementptr inbounds i8, ptr %55, i32 %56, !dbg !266
  %58 = load i8, ptr %57, align 1, !dbg !266
  %59 = sext i8 %58 to i32, !dbg !266
  %60 = icmp ne i32 %59, 0, !dbg !270
  br i1 %60, label %61, label %69, !dbg !271

61:                                               ; preds = %50
  %62 = load ptr, ptr %12, align 4, !dbg !272
  %63 = load i32, ptr %14, align 4, !dbg !273
  %64 = add i32 2, %63, !dbg !274
  %65 = getelementptr inbounds i8, ptr %62, i32 %64, !dbg !272
  %66 = load i8, ptr %65, align 1, !dbg !272
  %67 = sext i8 %66 to i32, !dbg !272
  %68 = icmp ne i32 %67, 0, !dbg !275
  br label %69

69:                                               ; preds = %61, %50
  %70 = phi i1 [ false, %50 ], [ %68, %61 ], !dbg !276
  br i1 %70, label %71, label %92, !dbg !265

71:                                               ; preds = %69
  %72 = load ptr, ptr %10, align 4, !dbg !277
  %73 = load i32, ptr %13, align 4, !dbg !280
  %74 = getelementptr inbounds %struct.option, ptr %72, i32 %73, !dbg !277
  %75 = getelementptr inbounds %struct.option, ptr %74, i32 0, i32 0, !dbg !281
  %76 = load ptr, ptr %75, align 4, !dbg !281
  %77 = load i32, ptr %14, align 4, !dbg !282
  %78 = getelementptr inbounds i8, ptr %76, i32 %77, !dbg !277
  %79 = load i8, ptr %78, align 1, !dbg !277
  %80 = sext i8 %79 to i32, !dbg !277
  %81 = load ptr, ptr %12, align 4, !dbg !283
  %82 = load i32, ptr %14, align 4, !dbg !284
  %83 = add i32 2, %82, !dbg !285
  %84 = getelementptr inbounds i8, ptr %81, i32 %83, !dbg !283
  %85 = load i8, ptr %84, align 1, !dbg !283
  %86 = sext i8 %85 to i32, !dbg !283
  %87 = icmp ne i32 %80, %86, !dbg !286
  br i1 %87, label %88, label %89, !dbg !287

88:                                               ; preds = %71
  store i32 0, ptr %15, align 4, !dbg !288
  br label %92, !dbg !290

89:                                               ; preds = %71
  %90 = load i32, ptr %14, align 4, !dbg !291
  %91 = add i32 %90, 1, !dbg !291
  store i32 %91, ptr %14, align 4, !dbg !291
  br label %50, !dbg !265, !llvm.loop !292

92:                                               ; preds = %88, %69
  %93 = load i32, ptr %15, align 4, !dbg !295
  %94 = icmp ne i32 %93, 0, !dbg !295
  br i1 %94, label %95, label %171, !dbg !297

95:                                               ; preds = %92
  %96 = load ptr, ptr %10, align 4, !dbg !298
  %97 = load i32, ptr %13, align 4, !dbg !299
  %98 = getelementptr inbounds %struct.option, ptr %96, i32 %97, !dbg !298
  %99 = getelementptr inbounds %struct.option, ptr %98, i32 0, i32 0, !dbg !300
  %100 = load ptr, ptr %99, align 4, !dbg !300
  %101 = load i32, ptr %14, align 4, !dbg !301
  %102 = getelementptr inbounds i8, ptr %100, i32 %101, !dbg !298
  %103 = load i8, ptr %102, align 1, !dbg !298
  %104 = sext i8 %103 to i32, !dbg !298
  %105 = icmp eq i32 %104, 0, !dbg !302
  br i1 %105, label %106, label %171, !dbg !303

106:                                              ; preds = %95
  %107 = load ptr, ptr %12, align 4, !dbg !304
  %108 = load i32, ptr %14, align 4, !dbg !305
  %109 = add i32 2, %108, !dbg !306
  %110 = getelementptr inbounds i8, ptr %107, i32 %109, !dbg !304
  %111 = load i8, ptr %110, align 1, !dbg !304
  %112 = sext i8 %111 to i32, !dbg !304
  %113 = icmp eq i32 %112, 0, !dbg !307
  br i1 %113, label %114, label %171, !dbg !308

114:                                              ; preds = %106
  %115 = load ptr, ptr %11, align 4, !dbg !309
  %116 = icmp ne ptr %115, null, !dbg !312
  br i1 %116, label %117, label %120, !dbg !313

117:                                              ; preds = %114
  %118 = load i32, ptr %13, align 4, !dbg !314
  %119 = load ptr, ptr %11, align 4, !dbg !316
  store i32 %118, ptr %119, align 4, !dbg !317
  br label %120, !dbg !318

120:                                              ; preds = %117, %114
  %121 = load ptr, ptr %10, align 4, !dbg !319
  %122 = load i32, ptr %13, align 4, !dbg !321
  %123 = getelementptr inbounds %struct.option, ptr %121, i32 %122, !dbg !319
  %124 = getelementptr inbounds %struct.option, ptr %123, i32 0, i32 1, !dbg !322
  %125 = load i32, ptr %124, align 4, !dbg !322
  %126 = icmp eq i32 %125, 1, !dbg !323
  br i1 %126, label %127, label %144, !dbg !324

127:                                              ; preds = %120
  %128 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !325
  %129 = add nsw i32 %128, 1, !dbg !328
  %130 = load i32, ptr %7, align 4, !dbg !329
  %131 = icmp slt i32 %129, %130, !dbg !330
  br i1 %131, label %132, label %140, !dbg !331

132:                                              ; preds = %127
  %133 = load ptr, ptr %8, align 4, !dbg !332
  %134 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !334
  %135 = add nsw i32 %134, 1, !dbg !335
  %136 = getelementptr inbounds ptr, ptr %133, i32 %135, !dbg !332
  %137 = load ptr, ptr %136, align 4, !dbg !332
  store ptr %137, ptr @__fizzer_model__optarg, align 4, !dbg !336
  %138 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !337
  %139 = add nsw i32 %138, 2, !dbg !337
  store i32 %139, ptr @__fizzer_model__optind, align 4, !dbg !337
  br label %143, !dbg !338

140:                                              ; preds = %127
  store ptr null, ptr @__fizzer_model__optarg, align 4, !dbg !339
  %141 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !341
  %142 = add nsw i32 %141, 1, !dbg !341
  store i32 %142, ptr @__fizzer_model__optind, align 4, !dbg !341
  br label %143

143:                                              ; preds = %140, %132
  br label %147, !dbg !342

144:                                              ; preds = %120
  store ptr null, ptr @__fizzer_model__optarg, align 4, !dbg !343
  %145 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !345
  %146 = add nsw i32 %145, 1, !dbg !345
  store i32 %146, ptr @__fizzer_model__optind, align 4, !dbg !345
  br label %147

147:                                              ; preds = %144, %143
  %148 = load ptr, ptr %10, align 4, !dbg !346
  %149 = load i32, ptr %13, align 4, !dbg !348
  %150 = getelementptr inbounds %struct.option, ptr %148, i32 %149, !dbg !346
  %151 = getelementptr inbounds %struct.option, ptr %150, i32 0, i32 2, !dbg !349
  %152 = load ptr, ptr %151, align 4, !dbg !349
  %153 = icmp ne ptr %152, null, !dbg !350
  br i1 %153, label %154, label %165, !dbg !351

154:                                              ; preds = %147
  %155 = load ptr, ptr %10, align 4, !dbg !352
  %156 = load i32, ptr %13, align 4, !dbg !354
  %157 = getelementptr inbounds %struct.option, ptr %155, i32 %156, !dbg !352
  %158 = getelementptr inbounds %struct.option, ptr %157, i32 0, i32 3, !dbg !355
  %159 = load i32, ptr %158, align 4, !dbg !355
  %160 = load ptr, ptr %10, align 4, !dbg !356
  %161 = load i32, ptr %13, align 4, !dbg !357
  %162 = getelementptr inbounds %struct.option, ptr %160, i32 %161, !dbg !356
  %163 = getelementptr inbounds %struct.option, ptr %162, i32 0, i32 2, !dbg !358
  %164 = load ptr, ptr %163, align 4, !dbg !358
  store i32 %159, ptr %164, align 4, !dbg !359
  store i32 0, ptr %6, align 4, !dbg !360
  br label %177, !dbg !360

165:                                              ; preds = %147
  %166 = load ptr, ptr %10, align 4, !dbg !361
  %167 = load i32, ptr %13, align 4, !dbg !362
  %168 = getelementptr inbounds %struct.option, ptr %166, i32 %167, !dbg !361
  %169 = getelementptr inbounds %struct.option, ptr %168, i32 0, i32 3, !dbg !363
  %170 = load i32, ptr %169, align 4, !dbg !363
  store i32 %170, ptr %6, align 4, !dbg !364
  br label %177, !dbg !364

171:                                              ; preds = %106, %95, %92
  %172 = load i32, ptr %13, align 4, !dbg !365
  %173 = add i32 %172, 1, !dbg !365
  store i32 %173, ptr %13, align 4, !dbg !365
  br label %42, !dbg !255, !llvm.loop !366

174:                                              ; preds = %42
  %175 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !368
  %176 = add nsw i32 %175, 1, !dbg !368
  store i32 %176, ptr @__fizzer_model__optind, align 4, !dbg !368
  store i32 63, ptr %6, align 4, !dbg !369
  br label %177, !dbg !369

177:                                              ; preds = %174, %165, %154, %36, %19
  %178 = load i32, ptr %6, align 4, !dbg !370
  ret i32 %178, !dbg !370
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__getopt(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !371 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 4
  %7 = alloca ptr, align 4
  %8 = alloca ptr, align 4
  %9 = alloca i8, align 1
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !375, metadata !DIExpression()), !dbg !376
  store ptr %1, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !377, metadata !DIExpression()), !dbg !378
  store ptr %2, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !379, metadata !DIExpression()), !dbg !380
  %12 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !381
  %13 = load i32, ptr %5, align 4, !dbg !383
  %14 = icmp sge i32 %12, %13, !dbg !384
  br i1 %14, label %15, label %16, !dbg !385

15:                                               ; preds = %3
  store i32 -1, ptr %4, align 4, !dbg !386
  br label %111, !dbg !386

16:                                               ; preds = %3
  call void @llvm.dbg.declare(metadata ptr %8, metadata !388, metadata !DIExpression()), !dbg !389
  %17 = load ptr, ptr %6, align 4, !dbg !390
  %18 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !391
  %19 = getelementptr inbounds ptr, ptr %17, i32 %18, !dbg !390
  %20 = load ptr, ptr %19, align 4, !dbg !390
  store ptr %20, ptr %8, align 4, !dbg !389
  %21 = load ptr, ptr %8, align 4, !dbg !392
  %22 = getelementptr inbounds i8, ptr %21, i32 0, !dbg !392
  %23 = load i8, ptr %22, align 1, !dbg !392
  %24 = sext i8 %23 to i32, !dbg !392
  %25 = icmp ne i32 %24, 45, !dbg !394
  br i1 %25, label %32, label %26, !dbg !395

26:                                               ; preds = %16
  %27 = load ptr, ptr %8, align 4, !dbg !396
  %28 = getelementptr inbounds i8, ptr %27, i32 1, !dbg !396
  %29 = load i8, ptr %28, align 1, !dbg !396
  %30 = sext i8 %29 to i32, !dbg !396
  %31 = icmp eq i32 %30, 0, !dbg !397
  br i1 %31, label %32, label %33, !dbg !398

32:                                               ; preds = %26, %16
  store i32 -1, ptr %4, align 4, !dbg !399
  br label %111, !dbg !399

33:                                               ; preds = %26
  call void @llvm.dbg.declare(metadata ptr %9, metadata !401, metadata !DIExpression()), !dbg !402
  %34 = load ptr, ptr %8, align 4, !dbg !403
  %35 = getelementptr inbounds i8, ptr %34, i32 1, !dbg !403
  %36 = load i8, ptr %35, align 1, !dbg !403
  store i8 %36, ptr %9, align 1, !dbg !402
  call void @llvm.dbg.declare(metadata ptr %10, metadata !404, metadata !DIExpression()), !dbg !407
  store i32 0, ptr %10, align 4, !dbg !407
  call void @llvm.dbg.declare(metadata ptr %11, metadata !408, metadata !DIExpression()), !dbg !409
  store i32 0, ptr %11, align 4, !dbg !409
  br label %37, !dbg !410

37:                                               ; preds = %54, %33
  %38 = load ptr, ptr %7, align 4, !dbg !411
  %39 = load i32, ptr %10, align 4, !dbg !412
  %40 = getelementptr inbounds i8, ptr %38, i32 %39, !dbg !411
  %41 = load i8, ptr %40, align 1, !dbg !411
  %42 = sext i8 %41 to i32, !dbg !411
  %43 = icmp ne i32 %42, 0, !dbg !413
  br i1 %43, label %44, label %57, !dbg !410

44:                                               ; preds = %37
  %45 = load ptr, ptr %7, align 4, !dbg !414
  %46 = load i32, ptr %10, align 4, !dbg !417
  %47 = getelementptr inbounds i8, ptr %45, i32 %46, !dbg !414
  %48 = load i8, ptr %47, align 1, !dbg !414
  %49 = sext i8 %48 to i32, !dbg !414
  %50 = load i8, ptr %9, align 1, !dbg !418
  %51 = sext i8 %50 to i32, !dbg !418
  %52 = icmp eq i32 %49, %51, !dbg !419
  br i1 %52, label %53, label %54, !dbg !420

53:                                               ; preds = %44
  store i32 1, ptr %11, align 4, !dbg !421
  br label %57, !dbg !423

54:                                               ; preds = %44
  %55 = load i32, ptr %10, align 4, !dbg !424
  %56 = add i32 %55, 1, !dbg !424
  store i32 %56, ptr %10, align 4, !dbg !424
  br label %37, !dbg !410, !llvm.loop !425

57:                                               ; preds = %53, %37
  %58 = load i32, ptr %11, align 4, !dbg !427
  %59 = icmp ne i32 %58, 0, !dbg !427
  br i1 %59, label %65, label %60, !dbg !429

60:                                               ; preds = %57
  %61 = load i8, ptr %9, align 1, !dbg !430
  %62 = sext i8 %61 to i32, !dbg !430
  store i32 %62, ptr @__fizzer_model__optopt, align 4, !dbg !432
  %63 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !433
  %64 = add nsw i32 %63, 1, !dbg !433
  store i32 %64, ptr @__fizzer_model__optind, align 4, !dbg !433
  store i32 63, ptr %4, align 4, !dbg !434
  br label %111, !dbg !434

65:                                               ; preds = %57
  %66 = load ptr, ptr %7, align 4, !dbg !435
  %67 = load i32, ptr %10, align 4, !dbg !437
  %68 = add i32 %67, 1, !dbg !438
  %69 = getelementptr inbounds i8, ptr %66, i32 %68, !dbg !435
  %70 = load i8, ptr %69, align 1, !dbg !435
  %71 = sext i8 %70 to i32, !dbg !435
  %72 = icmp eq i32 %71, 58, !dbg !439
  br i1 %72, label %73, label %105, !dbg !440

73:                                               ; preds = %65
  %74 = load ptr, ptr %8, align 4, !dbg !441
  %75 = getelementptr inbounds i8, ptr %74, i32 2, !dbg !441
  %76 = load i8, ptr %75, align 1, !dbg !441
  %77 = sext i8 %76 to i32, !dbg !441
  %78 = icmp ne i32 %77, 0, !dbg !444
  br i1 %78, label %79, label %82, !dbg !445

79:                                               ; preds = %73
  %80 = load ptr, ptr %8, align 4, !dbg !446
  %81 = getelementptr inbounds i8, ptr %80, i32 2, !dbg !446
  store ptr %81, ptr @__fizzer_model__optarg, align 4, !dbg !448
  br label %102, !dbg !449

82:                                               ; preds = %73
  %83 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !450
  %84 = add nsw i32 %83, 1, !dbg !452
  %85 = load i32, ptr %5, align 4, !dbg !453
  %86 = icmp slt i32 %84, %85, !dbg !454
  br i1 %86, label %87, label %94, !dbg !455

87:                                               ; preds = %82
  %88 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !456
  %89 = add nsw i32 %88, 1, !dbg !456
  store i32 %89, ptr @__fizzer_model__optind, align 4, !dbg !456
  %90 = load ptr, ptr %6, align 4, !dbg !458
  %91 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !459
  %92 = getelementptr inbounds ptr, ptr %90, i32 %91, !dbg !458
  %93 = load ptr, ptr %92, align 4, !dbg !458
  store ptr %93, ptr @__fizzer_model__optarg, align 4, !dbg !460
  br label %101, !dbg !461

94:                                               ; preds = %82
  store ptr null, ptr @__fizzer_model__optarg, align 4, !dbg !462
  %95 = load i32, ptr @__fizzer_model__opterr, align 4, !dbg !464
  %96 = icmp ne i32 %95, 0, !dbg !464
  br i1 %96, label %97, label %98, !dbg !466

97:                                               ; preds = %94
  br label %98, !dbg !467

98:                                               ; preds = %97, %94
  %99 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !469
  %100 = add nsw i32 %99, 1, !dbg !469
  store i32 %100, ptr @__fizzer_model__optind, align 4, !dbg !469
  store i32 58, ptr %4, align 4, !dbg !470
  br label %111, !dbg !470

101:                                              ; preds = %87
  br label %102

102:                                              ; preds = %101, %79
  %103 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !471
  %104 = add nsw i32 %103, 1, !dbg !471
  store i32 %104, ptr @__fizzer_model__optind, align 4, !dbg !471
  br label %108, !dbg !472

105:                                              ; preds = %65
  store ptr null, ptr @__fizzer_model__optarg, align 4, !dbg !473
  %106 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !475
  %107 = add nsw i32 %106, 1, !dbg !475
  store i32 %107, ptr @__fizzer_model__optind, align 4, !dbg !475
  br label %108

108:                                              ; preds = %105, %102
  %109 = load i8, ptr %9, align 1, !dbg !476
  %110 = sext i8 %109 to i32, !dbg !476
  store i32 %110, ptr %4, align 4, !dbg !477
  br label %111, !dbg !477

111:                                              ; preds = %108, %98, %60, %32, %15
  %112 = load i32, ptr %4, align 4, !dbg !478
  ret i32 %112, !dbg !478
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__atoll(ptr noundef %0) #0 !dbg !479 {
  %2 = alloca ptr, align 4
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !484, metadata !DIExpression()), !dbg !485
  call void @llvm.dbg.declare(metadata ptr %3, metadata !486, metadata !DIExpression()), !dbg !487
  store i64 0, ptr %3, align 8, !dbg !487
  call void @llvm.dbg.declare(metadata ptr %4, metadata !488, metadata !DIExpression()), !dbg !489
  store i32 1, ptr %4, align 4, !dbg !489
  call void @llvm.dbg.declare(metadata ptr %5, metadata !490, metadata !DIExpression()), !dbg !493
  store i32 0, ptr %5, align 4, !dbg !493
  br label %6, !dbg !494

6:                                                ; preds = %23, %1
  %7 = load ptr, ptr %2, align 4, !dbg !495
  %8 = load i32, ptr %5, align 4, !dbg !496
  %9 = getelementptr inbounds i8, ptr %7, i32 %8, !dbg !495
  %10 = load i8, ptr %9, align 1, !dbg !495
  %11 = sext i8 %10 to i32, !dbg !495
  %12 = icmp ne i32 %11, 0, !dbg !497
  br i1 %12, label %13, label %21, !dbg !498

13:                                               ; preds = %6
  %14 = load ptr, ptr %2, align 4, !dbg !499
  %15 = load i32, ptr %5, align 4, !dbg !500
  %16 = getelementptr inbounds i8, ptr %14, i32 %15, !dbg !499
  %17 = load i8, ptr %16, align 1, !dbg !499
  %18 = sext i8 %17 to i32, !dbg !499
  %19 = call i32 @__fizzer_model__isspace(i32 noundef %18), !dbg !501
  %20 = icmp ne i32 %19, 0, !dbg !498
  br label %21

21:                                               ; preds = %13, %6
  %22 = phi i1 [ false, %6 ], [ %20, %13 ], !dbg !502
  br i1 %22, label %23, label %26, !dbg !494

23:                                               ; preds = %21
  %24 = load i32, ptr %5, align 4, !dbg !503
  %25 = add i32 %24, 1, !dbg !503
  store i32 %25, ptr %5, align 4, !dbg !503
  br label %6, !dbg !494, !llvm.loop !505

26:                                               ; preds = %21
  %27 = load ptr, ptr %2, align 4, !dbg !507
  %28 = load i32, ptr %5, align 4, !dbg !509
  %29 = getelementptr inbounds i8, ptr %27, i32 %28, !dbg !507
  %30 = load i8, ptr %29, align 1, !dbg !507
  %31 = sext i8 %30 to i32, !dbg !507
  %32 = icmp eq i32 %31, 43, !dbg !510
  br i1 %32, label %33, label %36, !dbg !511

33:                                               ; preds = %26
  %34 = load i32, ptr %5, align 4, !dbg !512
  %35 = add i32 %34, 1, !dbg !512
  store i32 %35, ptr %5, align 4, !dbg !512
  br label %47, !dbg !514

36:                                               ; preds = %26
  %37 = load ptr, ptr %2, align 4, !dbg !515
  %38 = load i32, ptr %5, align 4, !dbg !517
  %39 = getelementptr inbounds i8, ptr %37, i32 %38, !dbg !515
  %40 = load i8, ptr %39, align 1, !dbg !515
  %41 = sext i8 %40 to i32, !dbg !515
  %42 = icmp eq i32 %41, 45, !dbg !518
  br i1 %42, label %43, label %46, !dbg !519

43:                                               ; preds = %36
  store i32 -1, ptr %4, align 4, !dbg !520
  %44 = load i32, ptr %5, align 4, !dbg !522
  %45 = add i32 %44, 1, !dbg !522
  store i32 %45, ptr %5, align 4, !dbg !522
  br label %46, !dbg !523

46:                                               ; preds = %43, %36
  br label %47

47:                                               ; preds = %46, %33
  br label %48, !dbg !524

48:                                               ; preds = %65, %47
  %49 = load ptr, ptr %2, align 4, !dbg !525
  %50 = load i32, ptr %5, align 4, !dbg !526
  %51 = getelementptr inbounds i8, ptr %49, i32 %50, !dbg !525
  %52 = load i8, ptr %51, align 1, !dbg !525
  %53 = sext i8 %52 to i32, !dbg !525
  %54 = icmp ne i32 %53, 0, !dbg !527
  br i1 %54, label %55, label %63, !dbg !528

55:                                               ; preds = %48
  %56 = load ptr, ptr %2, align 4, !dbg !529
  %57 = load i32, ptr %5, align 4, !dbg !530
  %58 = getelementptr inbounds i8, ptr %56, i32 %57, !dbg !529
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
  %68 = load ptr, ptr %2, align 4, !dbg !535
  %69 = load i32, ptr %5, align 4, !dbg !536
  %70 = getelementptr inbounds i8, ptr %68, i32 %69, !dbg !535
  %71 = load i8, ptr %70, align 1, !dbg !535
  %72 = sext i8 %71 to i32, !dbg !535
  %73 = sub nsw i32 %72, 48, !dbg !537
  %74 = sext i32 %73 to i64, !dbg !538
  %75 = add nsw i64 %67, %74, !dbg !539
  store i64 %75, ptr %3, align 8, !dbg !540
  %76 = load i32, ptr %5, align 4, !dbg !541
  %77 = add i32 %76, 1, !dbg !541
  store i32 %77, ptr %5, align 4, !dbg !541
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
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca double, align 8
  %13 = alloca i32, align 4
  store ptr %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !553, metadata !DIExpression()), !dbg !554
  store ptr %1, ptr %4, align 4
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
  store i32 0, ptr %11, align 4, !dbg !572
  br label %14, !dbg !573

14:                                               ; preds = %31, %2
  %15 = load ptr, ptr %3, align 4, !dbg !574
  %16 = load i32, ptr %11, align 4, !dbg !575
  %17 = getelementptr inbounds i8, ptr %15, i32 %16, !dbg !574
  %18 = load i8, ptr %17, align 1, !dbg !574
  %19 = sext i8 %18 to i32, !dbg !574
  %20 = icmp ne i32 %19, 0, !dbg !576
  br i1 %20, label %21, label %29, !dbg !577

21:                                               ; preds = %14
  %22 = load ptr, ptr %3, align 4, !dbg !578
  %23 = load i32, ptr %11, align 4, !dbg !579
  %24 = getelementptr inbounds i8, ptr %22, i32 %23, !dbg !578
  %25 = load i8, ptr %24, align 1, !dbg !578
  %26 = sext i8 %25 to i32, !dbg !578
  %27 = call i32 @__fizzer_model__isspace(i32 noundef %26), !dbg !580
  %28 = icmp ne i32 %27, 0, !dbg !577
  br label %29

29:                                               ; preds = %21, %14
  %30 = phi i1 [ false, %14 ], [ %28, %21 ], !dbg !581
  br i1 %30, label %31, label %34, !dbg !573

31:                                               ; preds = %29
  %32 = load i32, ptr %11, align 4, !dbg !582
  %33 = add i32 %32, 1, !dbg !582
  store i32 %33, ptr %11, align 4, !dbg !582
  br label %14, !dbg !573, !llvm.loop !584

34:                                               ; preds = %29
  %35 = load ptr, ptr %3, align 4, !dbg !586
  %36 = load i32, ptr %11, align 4, !dbg !588
  %37 = getelementptr inbounds i8, ptr %35, i32 %36, !dbg !586
  %38 = load i8, ptr %37, align 1, !dbg !586
  %39 = sext i8 %38 to i32, !dbg !586
  %40 = icmp eq i32 %39, 43, !dbg !589
  br i1 %40, label %41, label %44, !dbg !590

41:                                               ; preds = %34
  %42 = load i32, ptr %11, align 4, !dbg !591
  %43 = add i32 %42, 1, !dbg !591
  store i32 %43, ptr %11, align 4, !dbg !591
  br label %55, !dbg !593

44:                                               ; preds = %34
  %45 = load ptr, ptr %3, align 4, !dbg !594
  %46 = load i32, ptr %11, align 4, !dbg !596
  %47 = getelementptr inbounds i8, ptr %45, i32 %46, !dbg !594
  %48 = load i8, ptr %47, align 1, !dbg !594
  %49 = sext i8 %48 to i32, !dbg !594
  %50 = icmp eq i32 %49, 45, !dbg !597
  br i1 %50, label %51, label %54, !dbg !598

51:                                               ; preds = %44
  store i32 -1, ptr %7, align 4, !dbg !599
  %52 = load i32, ptr %11, align 4, !dbg !601
  %53 = add i32 %52, 1, !dbg !601
  store i32 %53, ptr %11, align 4, !dbg !601
  br label %54, !dbg !602

54:                                               ; preds = %51, %44
  br label %55

55:                                               ; preds = %54, %41
  br label %56, !dbg !603

56:                                               ; preds = %73, %55
  %57 = load ptr, ptr %3, align 4, !dbg !604
  %58 = load i32, ptr %11, align 4, !dbg !605
  %59 = getelementptr inbounds i8, ptr %57, i32 %58, !dbg !604
  %60 = load i8, ptr %59, align 1, !dbg !604
  %61 = sext i8 %60 to i32, !dbg !604
  %62 = icmp ne i32 %61, 0, !dbg !606
  br i1 %62, label %63, label %71, !dbg !607

63:                                               ; preds = %56
  %64 = load ptr, ptr %3, align 4, !dbg !608
  %65 = load i32, ptr %11, align 4, !dbg !609
  %66 = getelementptr inbounds i8, ptr %64, i32 %65, !dbg !608
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
  %75 = load ptr, ptr %3, align 4, !dbg !613
  %76 = load i32, ptr %11, align 4, !dbg !614
  %77 = getelementptr inbounds i8, ptr %75, i32 %76, !dbg !613
  %78 = load i8, ptr %77, align 1, !dbg !613
  %79 = sext i8 %78 to i32, !dbg !613
  %80 = sub nsw i32 %79, 48, !dbg !615
  %81 = sitofp i32 %80 to double, !dbg !616
  %82 = call double @llvm.fmuladd.f64(double %74, double 1.000000e+01, double %81), !dbg !617
  store double %82, ptr %5, align 8, !dbg !618
  %83 = load i32, ptr %11, align 4, !dbg !619
  %84 = add i32 %83, 1, !dbg !619
  store i32 %84, ptr %11, align 4, !dbg !619
  br label %56, !dbg !603, !llvm.loop !620

85:                                               ; preds = %71
  %86 = load ptr, ptr %3, align 4, !dbg !622
  %87 = load i32, ptr %11, align 4, !dbg !624
  %88 = getelementptr inbounds i8, ptr %86, i32 %87, !dbg !622
  %89 = load i8, ptr %88, align 1, !dbg !622
  %90 = sext i8 %89 to i32, !dbg !622
  %91 = icmp eq i32 %90, 46, !dbg !625
  br i1 %91, label %92, label %133, !dbg !626

92:                                               ; preds = %85
  %93 = load i32, ptr %11, align 4, !dbg !627
  %94 = add i32 %93, 1, !dbg !627
  store i32 %94, ptr %11, align 4, !dbg !627
  br label %95, !dbg !629

95:                                               ; preds = %112, %92
  %96 = load ptr, ptr %3, align 4, !dbg !630
  %97 = load i32, ptr %11, align 4, !dbg !631
  %98 = getelementptr inbounds i8, ptr %96, i32 %97, !dbg !630
  %99 = load i8, ptr %98, align 1, !dbg !630
  %100 = sext i8 %99 to i32, !dbg !630
  %101 = icmp ne i32 %100, 0, !dbg !632
  br i1 %101, label %102, label %110, !dbg !633

102:                                              ; preds = %95
  %103 = load ptr, ptr %3, align 4, !dbg !634
  %104 = load i32, ptr %11, align 4, !dbg !635
  %105 = getelementptr inbounds i8, ptr %103, i32 %104, !dbg !634
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
  %114 = load ptr, ptr %3, align 4, !dbg !640
  %115 = load i32, ptr %11, align 4, !dbg !641
  %116 = getelementptr inbounds i8, ptr %114, i32 %115, !dbg !640
  %117 = load i8, ptr %116, align 1, !dbg !640
  %118 = sext i8 %117 to i32, !dbg !640
  %119 = sub nsw i32 %118, 48, !dbg !642
  %120 = sitofp i32 %119 to double, !dbg !643
  %121 = call double @llvm.fmuladd.f64(double %113, double 1.000000e+01, double %120), !dbg !644
  store double %121, ptr %6, align 8, !dbg !645
  %122 = load i32, ptr %8, align 4, !dbg !646
  %123 = mul nsw i32 %122, 10, !dbg !647
  store i32 %123, ptr %8, align 4, !dbg !648
  %124 = load i32, ptr %11, align 4, !dbg !649
  %125 = add i32 %124, 1, !dbg !649
  store i32 %125, ptr %11, align 4, !dbg !649
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
  %134 = load ptr, ptr %3, align 4, !dbg !660
  %135 = load i32, ptr %11, align 4, !dbg !662
  %136 = getelementptr inbounds i8, ptr %134, i32 %135, !dbg !660
  %137 = load i8, ptr %136, align 1, !dbg !660
  %138 = sext i8 %137 to i32, !dbg !660
  %139 = icmp eq i32 %138, 101, !dbg !663
  br i1 %139, label %147, label %140, !dbg !664

140:                                              ; preds = %133
  %141 = load ptr, ptr %3, align 4, !dbg !665
  %142 = load i32, ptr %11, align 4, !dbg !666
  %143 = getelementptr inbounds i8, ptr %141, i32 %142, !dbg !665
  %144 = load i8, ptr %143, align 1, !dbg !665
  %145 = sext i8 %144 to i32, !dbg !665
  %146 = icmp eq i32 %145, 69, !dbg !667
  br i1 %146, label %147, label %201, !dbg !668

147:                                              ; preds = %140, %133
  %148 = load i32, ptr %11, align 4, !dbg !669
  %149 = add i32 %148, 1, !dbg !669
  store i32 %149, ptr %11, align 4, !dbg !669
  %150 = load ptr, ptr %3, align 4, !dbg !671
  %151 = load i32, ptr %11, align 4, !dbg !673
  %152 = getelementptr inbounds i8, ptr %150, i32 %151, !dbg !671
  %153 = load i8, ptr %152, align 1, !dbg !671
  %154 = sext i8 %153 to i32, !dbg !671
  %155 = icmp eq i32 %154, 43, !dbg !674
  br i1 %155, label %156, label %159, !dbg !675

156:                                              ; preds = %147
  %157 = load i32, ptr %11, align 4, !dbg !676
  %158 = add i32 %157, 1, !dbg !676
  store i32 %158, ptr %11, align 4, !dbg !676
  br label %170, !dbg !678

159:                                              ; preds = %147
  %160 = load ptr, ptr %3, align 4, !dbg !679
  %161 = load i32, ptr %11, align 4, !dbg !681
  %162 = getelementptr inbounds i8, ptr %160, i32 %161, !dbg !679
  %163 = load i8, ptr %162, align 1, !dbg !679
  %164 = sext i8 %163 to i32, !dbg !679
  %165 = icmp eq i32 %164, 45, !dbg !682
  br i1 %165, label %166, label %169, !dbg !683

166:                                              ; preds = %159
  store i32 -1, ptr %9, align 4, !dbg !684
  %167 = load i32, ptr %11, align 4, !dbg !686
  %168 = add i32 %167, 1, !dbg !686
  store i32 %168, ptr %11, align 4, !dbg !686
  br label %169, !dbg !687

169:                                              ; preds = %166, %159
  br label %170

170:                                              ; preds = %169, %156
  br label %171, !dbg !688

171:                                              ; preds = %188, %170
  %172 = load ptr, ptr %3, align 4, !dbg !689
  %173 = load i32, ptr %11, align 4, !dbg !690
  %174 = getelementptr inbounds i8, ptr %172, i32 %173, !dbg !689
  %175 = load i8, ptr %174, align 1, !dbg !689
  %176 = sext i8 %175 to i32, !dbg !689
  %177 = icmp ne i32 %176, 0, !dbg !691
  br i1 %177, label %178, label %186, !dbg !692

178:                                              ; preds = %171
  %179 = load ptr, ptr %3, align 4, !dbg !693
  %180 = load i32, ptr %11, align 4, !dbg !694
  %181 = getelementptr inbounds i8, ptr %179, i32 %180, !dbg !693
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
  %191 = load ptr, ptr %3, align 4, !dbg !700
  %192 = load i32, ptr %11, align 4, !dbg !701
  %193 = getelementptr inbounds i8, ptr %191, i32 %192, !dbg !700
  %194 = load i8, ptr %193, align 1, !dbg !700
  %195 = sext i8 %194 to i32, !dbg !700
  %196 = sub nsw i32 %195, 48, !dbg !702
  %197 = add nsw i32 %190, %196, !dbg !703
  store i32 %197, ptr %10, align 4, !dbg !704
  %198 = load i32, ptr %11, align 4, !dbg !705
  %199 = add i32 %198, 1, !dbg !705
  store i32 %199, ptr %11, align 4, !dbg !705
  br label %171, !dbg !688, !llvm.loop !706

200:                                              ; preds = %186
  br label %201, !dbg !708

201:                                              ; preds = %200, %140
  %202 = load ptr, ptr %4, align 4, !dbg !709
  %203 = icmp ne ptr %202, null, !dbg !711
  br i1 %203, label %204, label %209, !dbg !712

204:                                              ; preds = %201
  %205 = load ptr, ptr %3, align 4, !dbg !713
  %206 = load i32, ptr %11, align 4, !dbg !715
  %207 = getelementptr inbounds i8, ptr %205, i32 %206, !dbg !716
  %208 = load ptr, ptr %4, align 4, !dbg !717
  store ptr %207, ptr %208, align 4, !dbg !718
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
define dso_local i32 @__fizzer_model__labs(i32 noundef %0) #0 !dbg !775 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !780, metadata !DIExpression()), !dbg !781
  %4 = load i32, ptr %3, align 4, !dbg !782
  %5 = icmp slt i32 %4, 0, !dbg !784
  br i1 %5, label %6, label %9, !dbg !785

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !786
  %8 = sub nsw i32 0, %7, !dbg !787
  store i32 %8, ptr %2, align 4, !dbg !788
  br label %11, !dbg !788

9:                                                ; preds = %1
  %10 = load i32, ptr %3, align 4, !dbg !789
  store i32 %10, ptr %2, align 4, !dbg !790
  br label %11, !dbg !790

11:                                               ; preds = %9, %6
  %12 = load i32, ptr %2, align 4, !dbg !791
  ret i32 %12, !dbg !791
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__llabs(i64 noundef %0) #0 !dbg !792 {
  %2 = alloca i64, align 4
  %3 = alloca i64, align 8
  store i64 %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !796, metadata !DIExpression()), !dbg !797
  %4 = load i64, ptr %3, align 8, !dbg !798
  %5 = icmp slt i64 %4, 0, !dbg !800
  br i1 %5, label %6, label %9, !dbg !801

6:                                                ; preds = %1
  %7 = load i64, ptr %3, align 8, !dbg !802
  %8 = sub nsw i64 0, %7, !dbg !803
  store i64 %8, ptr %2, align 4, !dbg !804
  br label %11, !dbg !804

9:                                                ; preds = %1
  %10 = load i64, ptr %3, align 8, !dbg !805
  store i64 %10, ptr %2, align 4, !dbg !806
  br label %11, !dbg !806

11:                                               ; preds = %9, %6
  %12 = load i64, ptr %2, align 4, !dbg !807
  ret i64 %12, !dbg !807
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strtol(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !808 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 4
  %6 = alloca ptr, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !812, metadata !DIExpression()), !dbg !813
  store ptr %1, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !814, metadata !DIExpression()), !dbg !815
  store i32 %2, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !816, metadata !DIExpression()), !dbg !817
  call void @llvm.dbg.declare(metadata ptr %8, metadata !818, metadata !DIExpression()), !dbg !819
  store i32 0, ptr %8, align 4, !dbg !819
  call void @llvm.dbg.declare(metadata ptr %9, metadata !820, metadata !DIExpression()), !dbg !821
  store i32 1, ptr %9, align 4, !dbg !821
  call void @llvm.dbg.declare(metadata ptr %10, metadata !822, metadata !DIExpression()), !dbg !825
  store i32 0, ptr %10, align 4, !dbg !825
  %12 = load i32, ptr %7, align 4, !dbg !826
  %13 = icmp ne i32 %12, 10, !dbg !828
  br i1 %13, label %14, label %21, !dbg !829

14:                                               ; preds = %3
  %15 = load ptr, ptr %6, align 4, !dbg !830
  %16 = icmp ne ptr %15, null, !dbg !833
  br i1 %16, label %17, label %20, !dbg !834

17:                                               ; preds = %14
  %18 = load ptr, ptr %5, align 4, !dbg !835
  %19 = load ptr, ptr %6, align 4, !dbg !837
  store ptr %18, ptr %19, align 4, !dbg !838
  br label %20, !dbg !839

20:                                               ; preds = %17, %14
  store i32 0, ptr %4, align 4, !dbg !840
  br label %106, !dbg !840

21:                                               ; preds = %3
  br label %22, !dbg !841

22:                                               ; preds = %39, %21
  %23 = load ptr, ptr %5, align 4, !dbg !842
  %24 = load i32, ptr %10, align 4, !dbg !843
  %25 = getelementptr inbounds i8, ptr %23, i32 %24, !dbg !842
  %26 = load i8, ptr %25, align 1, !dbg !842
  %27 = sext i8 %26 to i32, !dbg !842
  %28 = icmp ne i32 %27, 0, !dbg !844
  br i1 %28, label %29, label %37, !dbg !845

29:                                               ; preds = %22
  %30 = load ptr, ptr %5, align 4, !dbg !846
  %31 = load i32, ptr %10, align 4, !dbg !847
  %32 = getelementptr inbounds i8, ptr %30, i32 %31, !dbg !846
  %33 = load i8, ptr %32, align 1, !dbg !846
  %34 = sext i8 %33 to i32, !dbg !846
  %35 = call i32 @__fizzer_model__isspace(i32 noundef %34), !dbg !848
  %36 = icmp ne i32 %35, 0, !dbg !845
  br label %37

37:                                               ; preds = %29, %22
  %38 = phi i1 [ false, %22 ], [ %36, %29 ], !dbg !849
  br i1 %38, label %39, label %42, !dbg !841

39:                                               ; preds = %37
  %40 = load i32, ptr %10, align 4, !dbg !850
  %41 = add i32 %40, 1, !dbg !850
  store i32 %41, ptr %10, align 4, !dbg !850
  br label %22, !dbg !841, !llvm.loop !852

42:                                               ; preds = %37
  %43 = load ptr, ptr %5, align 4, !dbg !854
  %44 = load i32, ptr %10, align 4, !dbg !856
  %45 = getelementptr inbounds i8, ptr %43, i32 %44, !dbg !854
  %46 = load i8, ptr %45, align 1, !dbg !854
  %47 = sext i8 %46 to i32, !dbg !854
  %48 = icmp eq i32 %47, 43, !dbg !857
  br i1 %48, label %49, label %52, !dbg !858

49:                                               ; preds = %42
  %50 = load i32, ptr %10, align 4, !dbg !859
  %51 = add i32 %50, 1, !dbg !859
  store i32 %51, ptr %10, align 4, !dbg !859
  br label %63, !dbg !861

52:                                               ; preds = %42
  %53 = load ptr, ptr %5, align 4, !dbg !862
  %54 = load i32, ptr %10, align 4, !dbg !864
  %55 = getelementptr inbounds i8, ptr %53, i32 %54, !dbg !862
  %56 = load i8, ptr %55, align 1, !dbg !862
  %57 = sext i8 %56 to i32, !dbg !862
  %58 = icmp eq i32 %57, 45, !dbg !865
  br i1 %58, label %59, label %62, !dbg !866

59:                                               ; preds = %52
  store i32 -1, ptr %9, align 4, !dbg !867
  %60 = load i32, ptr %10, align 4, !dbg !869
  %61 = add i32 %60, 1, !dbg !869
  store i32 %61, ptr %10, align 4, !dbg !869
  br label %62, !dbg !870

62:                                               ; preds = %59, %52
  br label %63

63:                                               ; preds = %62, %49
  call void @llvm.dbg.declare(metadata ptr %11, metadata !871, metadata !DIExpression()), !dbg !872
  %64 = load i32, ptr %10, align 4, !dbg !873
  store i32 %64, ptr %11, align 4, !dbg !872
  br label %65, !dbg !874

65:                                               ; preds = %82, %63
  %66 = load ptr, ptr %5, align 4, !dbg !875
  %67 = load i32, ptr %10, align 4, !dbg !876
  %68 = getelementptr inbounds i8, ptr %66, i32 %67, !dbg !875
  %69 = load i8, ptr %68, align 1, !dbg !875
  %70 = sext i8 %69 to i32, !dbg !875
  %71 = icmp ne i32 %70, 0, !dbg !877
  br i1 %71, label %72, label %80, !dbg !878

72:                                               ; preds = %65
  %73 = load ptr, ptr %5, align 4, !dbg !879
  %74 = load i32, ptr %10, align 4, !dbg !880
  %75 = getelementptr inbounds i8, ptr %73, i32 %74, !dbg !879
  %76 = load i8, ptr %75, align 1, !dbg !879
  %77 = sext i8 %76 to i32, !dbg !879
  %78 = call i32 @__fizzer_model__isdigit(i32 noundef %77), !dbg !881
  %79 = icmp ne i32 %78, 0, !dbg !878
  br label %80

80:                                               ; preds = %72, %65
  %81 = phi i1 [ false, %65 ], [ %79, %72 ], !dbg !849
  br i1 %81, label %82, label %94, !dbg !874

82:                                               ; preds = %80
  %83 = load i32, ptr %8, align 4, !dbg !882
  %84 = mul nsw i32 %83, 10, !dbg !884
  %85 = load ptr, ptr %5, align 4, !dbg !885
  %86 = load i32, ptr %10, align 4, !dbg !886
  %87 = getelementptr inbounds i8, ptr %85, i32 %86, !dbg !885
  %88 = load i8, ptr %87, align 1, !dbg !885
  %89 = sext i8 %88 to i32, !dbg !885
  %90 = sub nsw i32 %89, 48, !dbg !887
  %91 = add nsw i32 %84, %90, !dbg !888
  store i32 %91, ptr %8, align 4, !dbg !889
  %92 = load i32, ptr %10, align 4, !dbg !890
  %93 = add i32 %92, 1, !dbg !890
  store i32 %93, ptr %10, align 4, !dbg !890
  br label %65, !dbg !874, !llvm.loop !891

94:                                               ; preds = %80
  %95 = load ptr, ptr %6, align 4, !dbg !893
  %96 = icmp ne ptr %95, null, !dbg !895
  br i1 %96, label %97, label %102, !dbg !896

97:                                               ; preds = %94
  %98 = load ptr, ptr %5, align 4, !dbg !897
  %99 = load i32, ptr %10, align 4, !dbg !899
  %100 = getelementptr inbounds i8, ptr %98, i32 %99, !dbg !900
  %101 = load ptr, ptr %6, align 4, !dbg !901
  store ptr %100, ptr %101, align 4, !dbg !902
  br label %102, !dbg !903

102:                                              ; preds = %97, %94
  %103 = load i32, ptr %9, align 4, !dbg !904
  %104 = load i32, ptr %8, align 4, !dbg !905
  %105 = mul nsw i32 %103, %104, !dbg !906
  store i32 %105, ptr %4, align 4, !dbg !907
  br label %106, !dbg !907

106:                                              ; preds = %102, %20
  %107 = load i32, ptr %4, align 4, !dbg !908
  ret i32 %107, !dbg !908
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__atol(ptr noundef %0) #0 !dbg !909 {
  %2 = alloca ptr, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !913, metadata !DIExpression()), !dbg !914
  call void @llvm.dbg.declare(metadata ptr %3, metadata !915, metadata !DIExpression()), !dbg !916
  store i32 0, ptr %3, align 4, !dbg !916
  call void @llvm.dbg.declare(metadata ptr %4, metadata !917, metadata !DIExpression()), !dbg !918
  store i32 1, ptr %4, align 4, !dbg !918
  call void @llvm.dbg.declare(metadata ptr %5, metadata !919, metadata !DIExpression()), !dbg !922
  store i32 0, ptr %5, align 4, !dbg !922
  br label %6, !dbg !923

6:                                                ; preds = %23, %1
  %7 = load ptr, ptr %2, align 4, !dbg !924
  %8 = load i32, ptr %5, align 4, !dbg !925
  %9 = getelementptr inbounds i8, ptr %7, i32 %8, !dbg !924
  %10 = load i8, ptr %9, align 1, !dbg !924
  %11 = sext i8 %10 to i32, !dbg !924
  %12 = icmp ne i32 %11, 0, !dbg !926
  br i1 %12, label %13, label %21, !dbg !927

13:                                               ; preds = %6
  %14 = load ptr, ptr %2, align 4, !dbg !928
  %15 = load i32, ptr %5, align 4, !dbg !929
  %16 = getelementptr inbounds i8, ptr %14, i32 %15, !dbg !928
  %17 = load i8, ptr %16, align 1, !dbg !928
  %18 = sext i8 %17 to i32, !dbg !928
  %19 = call i32 @__fizzer_model__isspace(i32 noundef %18), !dbg !930
  %20 = icmp ne i32 %19, 0, !dbg !927
  br label %21

21:                                               ; preds = %13, %6
  %22 = phi i1 [ false, %6 ], [ %20, %13 ], !dbg !931
  br i1 %22, label %23, label %26, !dbg !923

23:                                               ; preds = %21
  %24 = load i32, ptr %5, align 4, !dbg !932
  %25 = add i32 %24, 1, !dbg !932
  store i32 %25, ptr %5, align 4, !dbg !932
  br label %6, !dbg !923, !llvm.loop !934

26:                                               ; preds = %21
  %27 = load ptr, ptr %2, align 4, !dbg !936
  %28 = load i32, ptr %5, align 4, !dbg !938
  %29 = getelementptr inbounds i8, ptr %27, i32 %28, !dbg !936
  %30 = load i8, ptr %29, align 1, !dbg !936
  %31 = sext i8 %30 to i32, !dbg !936
  %32 = icmp eq i32 %31, 43, !dbg !939
  br i1 %32, label %33, label %36, !dbg !940

33:                                               ; preds = %26
  %34 = load i32, ptr %5, align 4, !dbg !941
  %35 = add i32 %34, 1, !dbg !941
  store i32 %35, ptr %5, align 4, !dbg !941
  br label %47, !dbg !943

36:                                               ; preds = %26
  %37 = load ptr, ptr %2, align 4, !dbg !944
  %38 = load i32, ptr %5, align 4, !dbg !946
  %39 = getelementptr inbounds i8, ptr %37, i32 %38, !dbg !944
  %40 = load i8, ptr %39, align 1, !dbg !944
  %41 = sext i8 %40 to i32, !dbg !944
  %42 = icmp eq i32 %41, 45, !dbg !947
  br i1 %42, label %43, label %46, !dbg !948

43:                                               ; preds = %36
  store i32 -1, ptr %4, align 4, !dbg !949
  %44 = load i32, ptr %5, align 4, !dbg !951
  %45 = add i32 %44, 1, !dbg !951
  store i32 %45, ptr %5, align 4, !dbg !951
  br label %46, !dbg !952

46:                                               ; preds = %43, %36
  br label %47

47:                                               ; preds = %46, %33
  br label %48, !dbg !953

48:                                               ; preds = %65, %47
  %49 = load ptr, ptr %2, align 4, !dbg !954
  %50 = load i32, ptr %5, align 4, !dbg !955
  %51 = getelementptr inbounds i8, ptr %49, i32 %50, !dbg !954
  %52 = load i8, ptr %51, align 1, !dbg !954
  %53 = sext i8 %52 to i32, !dbg !954
  %54 = icmp ne i32 %53, 0, !dbg !956
  br i1 %54, label %55, label %63, !dbg !957

55:                                               ; preds = %48
  %56 = load ptr, ptr %2, align 4, !dbg !958
  %57 = load i32, ptr %5, align 4, !dbg !959
  %58 = getelementptr inbounds i8, ptr %56, i32 %57, !dbg !958
  %59 = load i8, ptr %58, align 1, !dbg !958
  %60 = sext i8 %59 to i32, !dbg !958
  %61 = call i32 @__fizzer_model__isdigit(i32 noundef %60), !dbg !960
  %62 = icmp ne i32 %61, 0, !dbg !957
  br label %63

63:                                               ; preds = %55, %48
  %64 = phi i1 [ false, %48 ], [ %62, %55 ], !dbg !931
  br i1 %64, label %65, label %77, !dbg !953

65:                                               ; preds = %63
  %66 = load i32, ptr %3, align 4, !dbg !961
  %67 = mul nsw i32 %66, 10, !dbg !963
  %68 = load ptr, ptr %2, align 4, !dbg !964
  %69 = load i32, ptr %5, align 4, !dbg !965
  %70 = getelementptr inbounds i8, ptr %68, i32 %69, !dbg !964
  %71 = load i8, ptr %70, align 1, !dbg !964
  %72 = sext i8 %71 to i32, !dbg !964
  %73 = sub nsw i32 %72, 48, !dbg !966
  %74 = add nsw i32 %67, %73, !dbg !967
  store i32 %74, ptr %3, align 4, !dbg !968
  %75 = load i32, ptr %5, align 4, !dbg !969
  %76 = add i32 %75, 1, !dbg !969
  store i32 %76, ptr %5, align 4, !dbg !969
  br label %48, !dbg !953, !llvm.loop !970

77:                                               ; preds = %63
  %78 = load i32, ptr %4, align 4, !dbg !972
  %79 = load i32, ptr %3, align 4, !dbg !973
  %80 = mul nsw i32 %78, %79, !dbg !974
  ret i32 %80, !dbg !975
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strtoul(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !976 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 4
  %6 = alloca ptr, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !981, metadata !DIExpression()), !dbg !982
  store ptr %1, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !983, metadata !DIExpression()), !dbg !984
  store i32 %2, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !985, metadata !DIExpression()), !dbg !986
  call void @llvm.dbg.declare(metadata ptr %8, metadata !987, metadata !DIExpression()), !dbg !988
  store i32 0, ptr %8, align 4, !dbg !988
  call void @llvm.dbg.declare(metadata ptr %9, metadata !989, metadata !DIExpression()), !dbg !992
  store i32 0, ptr %9, align 4, !dbg !992
  %11 = load i32, ptr %7, align 4, !dbg !993
  %12 = icmp ne i32 %11, 10, !dbg !995
  br i1 %12, label %13, label %20, !dbg !996

13:                                               ; preds = %3
  %14 = load ptr, ptr %6, align 4, !dbg !997
  %15 = icmp ne ptr %14, null, !dbg !1000
  br i1 %15, label %16, label %19, !dbg !1001

16:                                               ; preds = %13
  %17 = load ptr, ptr %5, align 4, !dbg !1002
  %18 = load ptr, ptr %6, align 4, !dbg !1004
  store ptr %17, ptr %18, align 4, !dbg !1005
  br label %19, !dbg !1006

19:                                               ; preds = %16, %13
  store i32 0, ptr %4, align 4, !dbg !1007
  br label %92, !dbg !1007

20:                                               ; preds = %3
  br label %21, !dbg !1008

21:                                               ; preds = %38, %20
  %22 = load ptr, ptr %5, align 4, !dbg !1009
  %23 = load i32, ptr %9, align 4, !dbg !1010
  %24 = getelementptr inbounds i8, ptr %22, i32 %23, !dbg !1009
  %25 = load i8, ptr %24, align 1, !dbg !1009
  %26 = sext i8 %25 to i32, !dbg !1009
  %27 = icmp ne i32 %26, 0, !dbg !1011
  br i1 %27, label %28, label %36, !dbg !1012

28:                                               ; preds = %21
  %29 = load ptr, ptr %5, align 4, !dbg !1013
  %30 = load i32, ptr %9, align 4, !dbg !1014
  %31 = getelementptr inbounds i8, ptr %29, i32 %30, !dbg !1013
  %32 = load i8, ptr %31, align 1, !dbg !1013
  %33 = sext i8 %32 to i32, !dbg !1013
  %34 = call i32 @__fizzer_model__isspace(i32 noundef %33), !dbg !1015
  %35 = icmp ne i32 %34, 0, !dbg !1012
  br label %36

36:                                               ; preds = %28, %21
  %37 = phi i1 [ false, %21 ], [ %35, %28 ], !dbg !1016
  br i1 %37, label %38, label %41, !dbg !1008

38:                                               ; preds = %36
  %39 = load i32, ptr %9, align 4, !dbg !1017
  %40 = add i32 %39, 1, !dbg !1017
  store i32 %40, ptr %9, align 4, !dbg !1017
  br label %21, !dbg !1008, !llvm.loop !1019

41:                                               ; preds = %36
  %42 = load ptr, ptr %5, align 4, !dbg !1021
  %43 = load i32, ptr %9, align 4, !dbg !1023
  %44 = getelementptr inbounds i8, ptr %42, i32 %43, !dbg !1021
  %45 = load i8, ptr %44, align 1, !dbg !1021
  %46 = sext i8 %45 to i32, !dbg !1021
  %47 = icmp eq i32 %46, 43, !dbg !1024
  br i1 %47, label %48, label %51, !dbg !1025

48:                                               ; preds = %41
  %49 = load i32, ptr %9, align 4, !dbg !1026
  %50 = add i32 %49, 1, !dbg !1026
  store i32 %50, ptr %9, align 4, !dbg !1026
  br label %51, !dbg !1028

51:                                               ; preds = %48, %41
  call void @llvm.dbg.declare(metadata ptr %10, metadata !1029, metadata !DIExpression()), !dbg !1030
  %52 = load i32, ptr %9, align 4, !dbg !1031
  store i32 %52, ptr %10, align 4, !dbg !1030
  br label %53, !dbg !1032

53:                                               ; preds = %70, %51
  %54 = load ptr, ptr %5, align 4, !dbg !1033
  %55 = load i32, ptr %9, align 4, !dbg !1034
  %56 = getelementptr inbounds i8, ptr %54, i32 %55, !dbg !1033
  %57 = load i8, ptr %56, align 1, !dbg !1033
  %58 = sext i8 %57 to i32, !dbg !1033
  %59 = icmp ne i32 %58, 0, !dbg !1035
  br i1 %59, label %60, label %68, !dbg !1036

60:                                               ; preds = %53
  %61 = load ptr, ptr %5, align 4, !dbg !1037
  %62 = load i32, ptr %9, align 4, !dbg !1038
  %63 = getelementptr inbounds i8, ptr %61, i32 %62, !dbg !1037
  %64 = load i8, ptr %63, align 1, !dbg !1037
  %65 = sext i8 %64 to i32, !dbg !1037
  %66 = call i32 @__fizzer_model__isdigit(i32 noundef %65), !dbg !1039
  %67 = icmp ne i32 %66, 0, !dbg !1036
  br label %68

68:                                               ; preds = %60, %53
  %69 = phi i1 [ false, %53 ], [ %67, %60 ], !dbg !1016
  br i1 %69, label %70, label %82, !dbg !1032

70:                                               ; preds = %68
  %71 = load i32, ptr %8, align 4, !dbg !1040
  %72 = mul i32 %71, 10, !dbg !1042
  %73 = load ptr, ptr %5, align 4, !dbg !1043
  %74 = load i32, ptr %9, align 4, !dbg !1044
  %75 = getelementptr inbounds i8, ptr %73, i32 %74, !dbg !1043
  %76 = load i8, ptr %75, align 1, !dbg !1043
  %77 = sext i8 %76 to i32, !dbg !1043
  %78 = sub nsw i32 %77, 48, !dbg !1045
  %79 = add i32 %72, %78, !dbg !1046
  store i32 %79, ptr %8, align 4, !dbg !1047
  %80 = load i32, ptr %9, align 4, !dbg !1048
  %81 = add i32 %80, 1, !dbg !1048
  store i32 %81, ptr %9, align 4, !dbg !1048
  br label %53, !dbg !1032, !llvm.loop !1049

82:                                               ; preds = %68
  %83 = load ptr, ptr %6, align 4, !dbg !1051
  %84 = icmp ne ptr %83, null, !dbg !1053
  br i1 %84, label %85, label %90, !dbg !1054

85:                                               ; preds = %82
  %86 = load ptr, ptr %5, align 4, !dbg !1055
  %87 = load i32, ptr %9, align 4, !dbg !1057
  %88 = getelementptr inbounds i8, ptr %86, i32 %87, !dbg !1058
  %89 = load ptr, ptr %6, align 4, !dbg !1059
  store ptr %88, ptr %89, align 4, !dbg !1060
  br label %90, !dbg !1061

90:                                               ; preds = %85, %82
  %91 = load i32, ptr %8, align 4, !dbg !1062
  store i32 %91, ptr %4, align 4, !dbg !1063
  br label %92, !dbg !1063

92:                                               ; preds = %90, %19
  %93 = load i32, ptr %4, align 4, !dbg !1064
  ret i32 %93, !dbg !1064
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__atoi(ptr noundef %0) #0 !dbg !1065 {
  %2 = alloca ptr, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1069, metadata !DIExpression()), !dbg !1070
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1071, metadata !DIExpression()), !dbg !1072
  store i32 0, ptr %3, align 4, !dbg !1072
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1073, metadata !DIExpression()), !dbg !1074
  store i32 1, ptr %4, align 4, !dbg !1074
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1075, metadata !DIExpression()), !dbg !1078
  store i32 0, ptr %5, align 4, !dbg !1078
  br label %6, !dbg !1079

6:                                                ; preds = %23, %1
  %7 = load ptr, ptr %2, align 4, !dbg !1080
  %8 = load i32, ptr %5, align 4, !dbg !1081
  %9 = getelementptr inbounds i8, ptr %7, i32 %8, !dbg !1080
  %10 = load i8, ptr %9, align 1, !dbg !1080
  %11 = sext i8 %10 to i32, !dbg !1080
  %12 = icmp ne i32 %11, 0, !dbg !1082
  br i1 %12, label %13, label %21, !dbg !1083

13:                                               ; preds = %6
  %14 = load ptr, ptr %2, align 4, !dbg !1084
  %15 = load i32, ptr %5, align 4, !dbg !1085
  %16 = getelementptr inbounds i8, ptr %14, i32 %15, !dbg !1084
  %17 = load i8, ptr %16, align 1, !dbg !1084
  %18 = sext i8 %17 to i32, !dbg !1084
  %19 = call i32 @__fizzer_model__isspace(i32 noundef %18), !dbg !1086
  %20 = icmp ne i32 %19, 0, !dbg !1083
  br label %21

21:                                               ; preds = %13, %6
  %22 = phi i1 [ false, %6 ], [ %20, %13 ], !dbg !1087
  br i1 %22, label %23, label %26, !dbg !1079

23:                                               ; preds = %21
  %24 = load i32, ptr %5, align 4, !dbg !1088
  %25 = add i32 %24, 1, !dbg !1088
  store i32 %25, ptr %5, align 4, !dbg !1088
  br label %6, !dbg !1079, !llvm.loop !1090

26:                                               ; preds = %21
  %27 = load ptr, ptr %2, align 4, !dbg !1092
  %28 = load i32, ptr %5, align 4, !dbg !1094
  %29 = getelementptr inbounds i8, ptr %27, i32 %28, !dbg !1092
  %30 = load i8, ptr %29, align 1, !dbg !1092
  %31 = sext i8 %30 to i32, !dbg !1092
  %32 = icmp eq i32 %31, 43, !dbg !1095
  br i1 %32, label %33, label %36, !dbg !1096

33:                                               ; preds = %26
  %34 = load i32, ptr %5, align 4, !dbg !1097
  %35 = add i32 %34, 1, !dbg !1097
  store i32 %35, ptr %5, align 4, !dbg !1097
  br label %47, !dbg !1099

36:                                               ; preds = %26
  %37 = load ptr, ptr %2, align 4, !dbg !1100
  %38 = load i32, ptr %5, align 4, !dbg !1102
  %39 = getelementptr inbounds i8, ptr %37, i32 %38, !dbg !1100
  %40 = load i8, ptr %39, align 1, !dbg !1100
  %41 = sext i8 %40 to i32, !dbg !1100
  %42 = icmp eq i32 %41, 45, !dbg !1103
  br i1 %42, label %43, label %46, !dbg !1104

43:                                               ; preds = %36
  store i32 -1, ptr %4, align 4, !dbg !1105
  %44 = load i32, ptr %5, align 4, !dbg !1107
  %45 = add i32 %44, 1, !dbg !1107
  store i32 %45, ptr %5, align 4, !dbg !1107
  br label %46, !dbg !1108

46:                                               ; preds = %43, %36
  br label %47

47:                                               ; preds = %46, %33
  br label %48, !dbg !1109

48:                                               ; preds = %65, %47
  %49 = load ptr, ptr %2, align 4, !dbg !1110
  %50 = load i32, ptr %5, align 4, !dbg !1111
  %51 = getelementptr inbounds i8, ptr %49, i32 %50, !dbg !1110
  %52 = load i8, ptr %51, align 1, !dbg !1110
  %53 = sext i8 %52 to i32, !dbg !1110
  %54 = icmp ne i32 %53, 0, !dbg !1112
  br i1 %54, label %55, label %63, !dbg !1113

55:                                               ; preds = %48
  %56 = load ptr, ptr %2, align 4, !dbg !1114
  %57 = load i32, ptr %5, align 4, !dbg !1115
  %58 = getelementptr inbounds i8, ptr %56, i32 %57, !dbg !1114
  %59 = load i8, ptr %58, align 1, !dbg !1114
  %60 = sext i8 %59 to i32, !dbg !1114
  %61 = call i32 @__fizzer_model__isdigit(i32 noundef %60), !dbg !1116
  %62 = icmp ne i32 %61, 0, !dbg !1113
  br label %63

63:                                               ; preds = %55, %48
  %64 = phi i1 [ false, %48 ], [ %62, %55 ], !dbg !1087
  br i1 %64, label %65, label %77, !dbg !1109

65:                                               ; preds = %63
  %66 = load i32, ptr %3, align 4, !dbg !1117
  %67 = mul nsw i32 %66, 10, !dbg !1119
  %68 = load ptr, ptr %2, align 4, !dbg !1120
  %69 = load i32, ptr %5, align 4, !dbg !1121
  %70 = getelementptr inbounds i8, ptr %68, i32 %69, !dbg !1120
  %71 = load i8, ptr %70, align 1, !dbg !1120
  %72 = sext i8 %71 to i32, !dbg !1120
  %73 = sub nsw i32 %72, 48, !dbg !1122
  %74 = add nsw i32 %67, %73, !dbg !1123
  store i32 %74, ptr %3, align 4, !dbg !1124
  %75 = load i32, ptr %5, align 4, !dbg !1125
  %76 = add i32 %75, 1, !dbg !1125
  store i32 %76, ptr %5, align 4, !dbg !1125
  br label %48, !dbg !1109, !llvm.loop !1126

77:                                               ; preds = %63
  %78 = load i32, ptr %4, align 4, !dbg !1128
  %79 = load i32, ptr %3, align 4, !dbg !1129
  %80 = mul nsw i32 %78, %79, !dbg !1130
  ret i32 %80, !dbg !1131
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strstr(ptr noundef %0, ptr noundef %1) #0 !dbg !1132 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  %6 = alloca ptr, align 4
  %7 = alloca ptr, align 4
  store ptr %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1136, metadata !DIExpression()), !dbg !1137
  store ptr %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1138, metadata !DIExpression()), !dbg !1139
  %8 = load ptr, ptr %5, align 4, !dbg !1140
  %9 = load i8, ptr %8, align 1, !dbg !1142
  %10 = sext i8 %9 to i32, !dbg !1142
  %11 = icmp eq i32 %10, 0, !dbg !1143
  br i1 %11, label %12, label %14, !dbg !1144

12:                                               ; preds = %2
  %13 = load ptr, ptr %4, align 4, !dbg !1145
  store ptr %13, ptr %3, align 4, !dbg !1147
  br label %59, !dbg !1147

14:                                               ; preds = %2
  br label %15, !dbg !1148

15:                                               ; preds = %55, %14
  %16 = load ptr, ptr %4, align 4, !dbg !1149
  %17 = load i8, ptr %16, align 1, !dbg !1150
  %18 = sext i8 %17 to i32, !dbg !1150
  %19 = icmp ne i32 %18, 0, !dbg !1151
  br i1 %19, label %20, label %58, !dbg !1148

20:                                               ; preds = %15
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1152, metadata !DIExpression()), !dbg !1154
  %21 = load ptr, ptr %4, align 4, !dbg !1155
  store ptr %21, ptr %6, align 4, !dbg !1154
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1156, metadata !DIExpression()), !dbg !1157
  %22 = load ptr, ptr %5, align 4, !dbg !1158
  store ptr %22, ptr %7, align 4, !dbg !1157
  br label %23, !dbg !1159

23:                                               ; preds = %43, %20
  %24 = load ptr, ptr %6, align 4, !dbg !1160
  %25 = load i8, ptr %24, align 1, !dbg !1161
  %26 = sext i8 %25 to i32, !dbg !1161
  %27 = icmp ne i32 %26, 0, !dbg !1162
  br i1 %27, label %28, label %41, !dbg !1163

28:                                               ; preds = %23
  %29 = load ptr, ptr %7, align 4, !dbg !1164
  %30 = load i8, ptr %29, align 1, !dbg !1165
  %31 = sext i8 %30 to i32, !dbg !1165
  %32 = icmp ne i32 %31, 0, !dbg !1166
  br i1 %32, label %33, label %41, !dbg !1167

33:                                               ; preds = %28
  %34 = load ptr, ptr %6, align 4, !dbg !1168
  %35 = load i8, ptr %34, align 1, !dbg !1169
  %36 = sext i8 %35 to i32, !dbg !1169
  %37 = load ptr, ptr %7, align 4, !dbg !1170
  %38 = load i8, ptr %37, align 1, !dbg !1171
  %39 = sext i8 %38 to i32, !dbg !1171
  %40 = icmp eq i32 %36, %39, !dbg !1172
  br label %41

41:                                               ; preds = %33, %28, %23
  %42 = phi i1 [ false, %28 ], [ false, %23 ], [ %40, %33 ], !dbg !1173
  br i1 %42, label %43, label %48, !dbg !1159

43:                                               ; preds = %41
  %44 = load ptr, ptr %6, align 4, !dbg !1174
  %45 = getelementptr inbounds i8, ptr %44, i32 1, !dbg !1174
  store ptr %45, ptr %6, align 4, !dbg !1174
  %46 = load ptr, ptr %7, align 4, !dbg !1176
  %47 = getelementptr inbounds i8, ptr %46, i32 1, !dbg !1176
  store ptr %47, ptr %7, align 4, !dbg !1176
  br label %23, !dbg !1159, !llvm.loop !1177

48:                                               ; preds = %41
  %49 = load ptr, ptr %7, align 4, !dbg !1179
  %50 = load i8, ptr %49, align 1, !dbg !1181
  %51 = sext i8 %50 to i32, !dbg !1181
  %52 = icmp eq i32 %51, 0, !dbg !1182
  br i1 %52, label %53, label %55, !dbg !1183

53:                                               ; preds = %48
  %54 = load ptr, ptr %4, align 4, !dbg !1184
  store ptr %54, ptr %3, align 4, !dbg !1186
  br label %59, !dbg !1186

55:                                               ; preds = %48
  %56 = load ptr, ptr %4, align 4, !dbg !1187
  %57 = getelementptr inbounds i8, ptr %56, i32 1, !dbg !1187
  store ptr %57, ptr %4, align 4, !dbg !1187
  br label %15, !dbg !1148, !llvm.loop !1188

58:                                               ; preds = %15
  store ptr null, ptr %3, align 4, !dbg !1190
  br label %59, !dbg !1190

59:                                               ; preds = %58, %53, %12
  %60 = load ptr, ptr %3, align 4, !dbg !1191
  ret ptr %60, !dbg !1191
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strpbrk(ptr noundef %0, ptr noundef %1) #0 !dbg !1192 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  %6 = alloca ptr, align 4
  store ptr %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1194, metadata !DIExpression()), !dbg !1195
  store ptr %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1196, metadata !DIExpression()), !dbg !1197
  br label %7, !dbg !1198

7:                                                ; preds = %32, %2
  %8 = load ptr, ptr %4, align 4, !dbg !1199
  %9 = load i8, ptr %8, align 1, !dbg !1200
  %10 = sext i8 %9 to i32, !dbg !1200
  %11 = icmp ne i32 %10, 0, !dbg !1201
  br i1 %11, label %12, label %35, !dbg !1198

12:                                               ; preds = %7
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1202, metadata !DIExpression()), !dbg !1204
  %13 = load ptr, ptr %5, align 4, !dbg !1205
  store ptr %13, ptr %6, align 4, !dbg !1204
  br label %14, !dbg !1206

14:                                               ; preds = %29, %12
  %15 = load ptr, ptr %6, align 4, !dbg !1207
  %16 = load i8, ptr %15, align 1, !dbg !1208
  %17 = sext i8 %16 to i32, !dbg !1208
  %18 = icmp ne i32 %17, 0, !dbg !1209
  br i1 %18, label %19, label %32, !dbg !1206

19:                                               ; preds = %14
  %20 = load ptr, ptr %6, align 4, !dbg !1210
  %21 = load i8, ptr %20, align 1, !dbg !1213
  %22 = sext i8 %21 to i32, !dbg !1213
  %23 = load ptr, ptr %4, align 4, !dbg !1214
  %24 = load i8, ptr %23, align 1, !dbg !1215
  %25 = sext i8 %24 to i32, !dbg !1215
  %26 = icmp eq i32 %22, %25, !dbg !1216
  br i1 %26, label %27, label %29, !dbg !1217

27:                                               ; preds = %19
  %28 = load ptr, ptr %4, align 4, !dbg !1218
  store ptr %28, ptr %3, align 4, !dbg !1220
  br label %36, !dbg !1220

29:                                               ; preds = %19
  %30 = load ptr, ptr %6, align 4, !dbg !1221
  %31 = getelementptr inbounds i8, ptr %30, i32 1, !dbg !1221
  store ptr %31, ptr %6, align 4, !dbg !1221
  br label %14, !dbg !1206, !llvm.loop !1222

32:                                               ; preds = %14
  %33 = load ptr, ptr %4, align 4, !dbg !1224
  %34 = getelementptr inbounds i8, ptr %33, i32 1, !dbg !1224
  store ptr %34, ptr %4, align 4, !dbg !1224
  br label %7, !dbg !1198, !llvm.loop !1225

35:                                               ; preds = %7
  store ptr null, ptr %3, align 4, !dbg !1227
  br label %36, !dbg !1227

36:                                               ; preds = %35, %27
  %37 = load ptr, ptr %3, align 4, !dbg !1228
  ret ptr %37, !dbg !1228
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strcpy(ptr noundef %0, ptr noundef %1) #0 !dbg !1229 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  store ptr %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1231, metadata !DIExpression()), !dbg !1232
  store ptr %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1233, metadata !DIExpression()), !dbg !1234
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1235, metadata !DIExpression()), !dbg !1236
  %6 = load ptr, ptr %3, align 4, !dbg !1237
  store ptr %6, ptr %5, align 4, !dbg !1236
  br label %7, !dbg !1238

7:                                                ; preds = %12, %2
  %8 = load ptr, ptr %4, align 4, !dbg !1239
  %9 = load i8, ptr %8, align 1, !dbg !1240
  %10 = sext i8 %9 to i32, !dbg !1240
  %11 = icmp ne i32 %10, 0, !dbg !1241
  br i1 %11, label %12, label %20, !dbg !1238

12:                                               ; preds = %7
  %13 = load ptr, ptr %4, align 4, !dbg !1242
  %14 = load i8, ptr %13, align 1, !dbg !1244
  %15 = load ptr, ptr %5, align 4, !dbg !1245
  store i8 %14, ptr %15, align 1, !dbg !1246
  %16 = load ptr, ptr %5, align 4, !dbg !1247
  %17 = getelementptr inbounds i8, ptr %16, i32 1, !dbg !1247
  store ptr %17, ptr %5, align 4, !dbg !1247
  %18 = load ptr, ptr %4, align 4, !dbg !1248
  %19 = getelementptr inbounds i8, ptr %18, i32 1, !dbg !1248
  store ptr %19, ptr %4, align 4, !dbg !1248
  br label %7, !dbg !1238, !llvm.loop !1249

20:                                               ; preds = %7
  %21 = load ptr, ptr %5, align 4, !dbg !1251
  store i8 0, ptr %21, align 1, !dbg !1252
  %22 = load ptr, ptr %3, align 4, !dbg !1253
  ret ptr %22, !dbg !1254
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strncat(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !1255 {
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1261, metadata !DIExpression()), !dbg !1262
  store ptr %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1263, metadata !DIExpression()), !dbg !1264
  store i32 %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1265, metadata !DIExpression()), !dbg !1266
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1267, metadata !DIExpression()), !dbg !1268
  %9 = load ptr, ptr %4, align 4, !dbg !1269
  store ptr %9, ptr %7, align 4, !dbg !1268
  br label %10, !dbg !1270

10:                                               ; preds = %15, %3
  %11 = load ptr, ptr %7, align 4, !dbg !1271
  %12 = load i8, ptr %11, align 1, !dbg !1272
  %13 = sext i8 %12 to i32, !dbg !1272
  %14 = icmp ne i32 %13, 0, !dbg !1273
  br i1 %14, label %15, label %18, !dbg !1270

15:                                               ; preds = %10
  %16 = load ptr, ptr %7, align 4, !dbg !1274
  %17 = getelementptr inbounds i8, ptr %16, i32 1, !dbg !1274
  store ptr %17, ptr %7, align 4, !dbg !1274
  br label %10, !dbg !1270, !llvm.loop !1276

18:                                               ; preds = %10
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1278, metadata !DIExpression()), !dbg !1279
  store i32 0, ptr %8, align 4, !dbg !1279
  br label %19, !dbg !1280

19:                                               ; preds = %30, %18
  %20 = load i32, ptr %8, align 4, !dbg !1281
  %21 = load i32, ptr %6, align 4, !dbg !1282
  %22 = icmp ult i32 %20, %21, !dbg !1283
  br i1 %22, label %23, label %28, !dbg !1284

23:                                               ; preds = %19
  %24 = load ptr, ptr %5, align 4, !dbg !1285
  %25 = load i8, ptr %24, align 1, !dbg !1286
  %26 = sext i8 %25 to i32, !dbg !1286
  %27 = icmp ne i32 %26, 0, !dbg !1287
  br label %28

28:                                               ; preds = %23, %19
  %29 = phi i1 [ false, %19 ], [ %27, %23 ], !dbg !1288
  br i1 %29, label %30, label %40, !dbg !1280

30:                                               ; preds = %28
  %31 = load ptr, ptr %5, align 4, !dbg !1289
  %32 = load i8, ptr %31, align 1, !dbg !1291
  %33 = load ptr, ptr %7, align 4, !dbg !1292
  store i8 %32, ptr %33, align 1, !dbg !1293
  %34 = load ptr, ptr %7, align 4, !dbg !1294
  %35 = getelementptr inbounds i8, ptr %34, i32 1, !dbg !1294
  store ptr %35, ptr %7, align 4, !dbg !1294
  %36 = load ptr, ptr %5, align 4, !dbg !1295
  %37 = getelementptr inbounds i8, ptr %36, i32 1, !dbg !1295
  store ptr %37, ptr %5, align 4, !dbg !1295
  %38 = load i32, ptr %8, align 4, !dbg !1296
  %39 = add i32 %38, 1, !dbg !1296
  store i32 %39, ptr %8, align 4, !dbg !1296
  br label %19, !dbg !1280, !llvm.loop !1297

40:                                               ; preds = %28
  %41 = load ptr, ptr %7, align 4, !dbg !1299
  store i8 0, ptr %41, align 1, !dbg !1300
  %42 = load ptr, ptr %4, align 4, !dbg !1301
  ret ptr %42, !dbg !1302
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strcspn(ptr noundef %0, ptr noundef %1) #0 !dbg !1303 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 4
  store ptr %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1309, metadata !DIExpression()), !dbg !1310
  store ptr %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1311, metadata !DIExpression()), !dbg !1312
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1313, metadata !DIExpression()), !dbg !1314
  store i32 0, ptr %5, align 4, !dbg !1314
  br label %7, !dbg !1315

7:                                                ; preds = %38, %2
  %8 = load ptr, ptr %3, align 4, !dbg !1316
  %9 = load i8, ptr %8, align 1, !dbg !1317
  %10 = sext i8 %9 to i32, !dbg !1317
  %11 = icmp ne i32 %10, 0, !dbg !1318
  br i1 %11, label %12, label %43, !dbg !1315

12:                                               ; preds = %7
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1319, metadata !DIExpression()), !dbg !1321
  %13 = load ptr, ptr %4, align 4, !dbg !1322
  store ptr %13, ptr %6, align 4, !dbg !1321
  br label %14, !dbg !1323

14:                                               ; preds = %29, %12
  %15 = load ptr, ptr %6, align 4, !dbg !1324
  %16 = load i8, ptr %15, align 1, !dbg !1325
  %17 = sext i8 %16 to i32, !dbg !1325
  %18 = icmp ne i32 %17, 0, !dbg !1326
  br i1 %18, label %19, label %27, !dbg !1327

19:                                               ; preds = %14
  %20 = load ptr, ptr %6, align 4, !dbg !1328
  %21 = load i8, ptr %20, align 1, !dbg !1329
  %22 = sext i8 %21 to i32, !dbg !1329
  %23 = load ptr, ptr %3, align 4, !dbg !1330
  %24 = load i8, ptr %23, align 1, !dbg !1331
  %25 = sext i8 %24 to i32, !dbg !1331
  %26 = icmp ne i32 %22, %25, !dbg !1332
  br label %27

27:                                               ; preds = %19, %14
  %28 = phi i1 [ false, %14 ], [ %26, %19 ], !dbg !1333
  br i1 %28, label %29, label %32, !dbg !1323

29:                                               ; preds = %27
  %30 = load ptr, ptr %6, align 4, !dbg !1334
  %31 = getelementptr inbounds i8, ptr %30, i32 1, !dbg !1334
  store ptr %31, ptr %6, align 4, !dbg !1334
  br label %14, !dbg !1323, !llvm.loop !1336

32:                                               ; preds = %27
  %33 = load ptr, ptr %6, align 4, !dbg !1338
  %34 = load i8, ptr %33, align 1, !dbg !1340
  %35 = sext i8 %34 to i32, !dbg !1340
  %36 = icmp ne i32 %35, 0, !dbg !1341
  br i1 %36, label %37, label %38, !dbg !1342

37:                                               ; preds = %32
  br label %43, !dbg !1343

38:                                               ; preds = %32
  %39 = load i32, ptr %5, align 4, !dbg !1345
  %40 = add i32 %39, 1, !dbg !1345
  store i32 %40, ptr %5, align 4, !dbg !1345
  %41 = load ptr, ptr %3, align 4, !dbg !1346
  %42 = getelementptr inbounds i8, ptr %41, i32 1, !dbg !1346
  store ptr %42, ptr %3, align 4, !dbg !1346
  br label %7, !dbg !1315, !llvm.loop !1347

43:                                               ; preds = %37, %7
  %44 = load i32, ptr %5, align 4, !dbg !1349
  ret i32 %44, !dbg !1350
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strcoll(ptr noundef %0, ptr noundef %1) #0 !dbg !1351 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  store ptr %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1355, metadata !DIExpression()), !dbg !1356
  store ptr %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1357, metadata !DIExpression()), !dbg !1358
  br label %5, !dbg !1359

5:                                                ; preds = %20, %2
  %6 = load ptr, ptr %3, align 4, !dbg !1360
  %7 = load i8, ptr %6, align 1, !dbg !1361
  %8 = sext i8 %7 to i32, !dbg !1361
  %9 = icmp ne i32 %8, 0, !dbg !1362
  br i1 %9, label %10, label %18, !dbg !1363

10:                                               ; preds = %5
  %11 = load ptr, ptr %3, align 4, !dbg !1364
  %12 = load i8, ptr %11, align 1, !dbg !1365
  %13 = sext i8 %12 to i32, !dbg !1365
  %14 = load ptr, ptr %4, align 4, !dbg !1366
  %15 = load i8, ptr %14, align 1, !dbg !1367
  %16 = sext i8 %15 to i32, !dbg !1367
  %17 = icmp eq i32 %13, %16, !dbg !1368
  br label %18

18:                                               ; preds = %10, %5
  %19 = phi i1 [ false, %5 ], [ %17, %10 ], !dbg !1369
  br i1 %19, label %20, label %25, !dbg !1359

20:                                               ; preds = %18
  %21 = load ptr, ptr %3, align 4, !dbg !1370
  %22 = getelementptr inbounds i8, ptr %21, i32 1, !dbg !1370
  store ptr %22, ptr %3, align 4, !dbg !1370
  %23 = load ptr, ptr %4, align 4, !dbg !1372
  %24 = getelementptr inbounds i8, ptr %23, i32 1, !dbg !1372
  store ptr %24, ptr %4, align 4, !dbg !1372
  br label %5, !dbg !1359, !llvm.loop !1373

25:                                               ; preds = %18
  %26 = load ptr, ptr %3, align 4, !dbg !1375
  %27 = load i8, ptr %26, align 1, !dbg !1376
  %28 = zext i8 %27 to i32, !dbg !1377
  %29 = load ptr, ptr %4, align 4, !dbg !1378
  %30 = load i8, ptr %29, align 1, !dbg !1379
  %31 = zext i8 %30 to i32, !dbg !1380
  %32 = sub nsw i32 %28, %31, !dbg !1381
  ret i32 %32, !dbg !1382
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strcmp(ptr noundef %0, ptr noundef %1) #0 !dbg !1383 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  store ptr %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1385, metadata !DIExpression()), !dbg !1386
  store ptr %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1387, metadata !DIExpression()), !dbg !1388
  br label %5, !dbg !1389

5:                                                ; preds = %20, %2
  %6 = load ptr, ptr %3, align 4, !dbg !1390
  %7 = load i8, ptr %6, align 1, !dbg !1391
  %8 = sext i8 %7 to i32, !dbg !1391
  %9 = icmp ne i32 %8, 0, !dbg !1392
  br i1 %9, label %10, label %18, !dbg !1393

10:                                               ; preds = %5
  %11 = load ptr, ptr %3, align 4, !dbg !1394
  %12 = load i8, ptr %11, align 1, !dbg !1395
  %13 = sext i8 %12 to i32, !dbg !1395
  %14 = load ptr, ptr %4, align 4, !dbg !1396
  %15 = load i8, ptr %14, align 1, !dbg !1397
  %16 = sext i8 %15 to i32, !dbg !1397
  %17 = icmp eq i32 %13, %16, !dbg !1398
  br label %18

18:                                               ; preds = %10, %5
  %19 = phi i1 [ false, %5 ], [ %17, %10 ], !dbg !1399
  br i1 %19, label %20, label %25, !dbg !1389

20:                                               ; preds = %18
  %21 = load ptr, ptr %3, align 4, !dbg !1400
  %22 = getelementptr inbounds i8, ptr %21, i32 1, !dbg !1400
  store ptr %22, ptr %3, align 4, !dbg !1400
  %23 = load ptr, ptr %4, align 4, !dbg !1402
  %24 = getelementptr inbounds i8, ptr %23, i32 1, !dbg !1402
  store ptr %24, ptr %4, align 4, !dbg !1402
  br label %5, !dbg !1389, !llvm.loop !1403

25:                                               ; preds = %18
  %26 = load ptr, ptr %3, align 4, !dbg !1405
  %27 = load i8, ptr %26, align 1, !dbg !1406
  %28 = zext i8 %27 to i32, !dbg !1407
  %29 = load ptr, ptr %4, align 4, !dbg !1408
  %30 = load i8, ptr %29, align 1, !dbg !1409
  %31 = zext i8 %30 to i32, !dbg !1410
  %32 = sub nsw i32 %28, %31, !dbg !1411
  ret i32 %32, !dbg !1412
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strncmp(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !1413 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 4
  %6 = alloca ptr, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8, align 1
  %10 = alloca i8, align 1
  store ptr %0, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1419, metadata !DIExpression()), !dbg !1420
  store ptr %1, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1421, metadata !DIExpression()), !dbg !1422
  store i32 %2, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1423, metadata !DIExpression()), !dbg !1424
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1425, metadata !DIExpression()), !dbg !1426
  store i32 0, ptr %8, align 4, !dbg !1426
  br label %11, !dbg !1427

11:                                               ; preds = %43, %3
  %12 = load i32, ptr %8, align 4, !dbg !1428
  %13 = load i32, ptr %7, align 4, !dbg !1429
  %14 = icmp ult i32 %12, %13, !dbg !1430
  br i1 %14, label %15, label %46, !dbg !1427

15:                                               ; preds = %11
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1431, metadata !DIExpression()), !dbg !1433
  %16 = load ptr, ptr %5, align 4, !dbg !1434
  %17 = load i32, ptr %8, align 4, !dbg !1435
  %18 = getelementptr inbounds i8, ptr %16, i32 %17, !dbg !1434
  %19 = load i8, ptr %18, align 1, !dbg !1434
  store i8 %19, ptr %9, align 1, !dbg !1433
  call void @llvm.dbg.declare(metadata ptr %10, metadata !1436, metadata !DIExpression()), !dbg !1437
  %20 = load ptr, ptr %6, align 4, !dbg !1438
  %21 = load i32, ptr %8, align 4, !dbg !1439
  %22 = getelementptr inbounds i8, ptr %20, i32 %21, !dbg !1438
  %23 = load i8, ptr %22, align 1, !dbg !1438
  store i8 %23, ptr %10, align 1, !dbg !1437
  %24 = load i8, ptr %9, align 1, !dbg !1440
  %25 = zext i8 %24 to i32, !dbg !1440
  %26 = load i8, ptr %10, align 1, !dbg !1442
  %27 = zext i8 %26 to i32, !dbg !1442
  %28 = icmp ne i32 %25, %27, !dbg !1443
  br i1 %28, label %37, label %29, !dbg !1444

29:                                               ; preds = %15
  %30 = load i8, ptr %9, align 1, !dbg !1445
  %31 = zext i8 %30 to i32, !dbg !1445
  %32 = icmp eq i32 %31, 0, !dbg !1446
  br i1 %32, label %37, label %33, !dbg !1447

33:                                               ; preds = %29
  %34 = load i8, ptr %10, align 1, !dbg !1448
  %35 = zext i8 %34 to i32, !dbg !1448
  %36 = icmp eq i32 %35, 0, !dbg !1449
  br i1 %36, label %37, label %43, !dbg !1450

37:                                               ; preds = %33, %29, %15
  %38 = load i8, ptr %9, align 1, !dbg !1451
  %39 = zext i8 %38 to i32, !dbg !1451
  %40 = load i8, ptr %10, align 1, !dbg !1453
  %41 = zext i8 %40 to i32, !dbg !1453
  %42 = sub nsw i32 %39, %41, !dbg !1454
  store i32 %42, ptr %4, align 4, !dbg !1455
  br label %47, !dbg !1455

43:                                               ; preds = %33
  %44 = load i32, ptr %8, align 4, !dbg !1456
  %45 = add i32 %44, 1, !dbg !1456
  store i32 %45, ptr %8, align 4, !dbg !1456
  br label %11, !dbg !1427, !llvm.loop !1457

46:                                               ; preds = %11
  store i32 0, ptr %4, align 4, !dbg !1459
  br label %47, !dbg !1459

47:                                               ; preds = %46, %37
  %48 = load i32, ptr %4, align 4, !dbg !1460
  ret i32 %48, !dbg !1460
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strrchr(ptr noundef %0, i32 noundef %1) #0 !dbg !1461 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 4
  store ptr %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1465, metadata !DIExpression()), !dbg !1466
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1467, metadata !DIExpression()), !dbg !1468
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1469, metadata !DIExpression()), !dbg !1470
  store ptr null, ptr %6, align 4, !dbg !1470
  br label %7, !dbg !1471

7:                                                ; preds = %22, %2
  %8 = load ptr, ptr %4, align 4, !dbg !1472
  %9 = load i8, ptr %8, align 1, !dbg !1473
  %10 = sext i8 %9 to i32, !dbg !1473
  %11 = icmp ne i32 %10, 0, !dbg !1474
  br i1 %11, label %12, label %25, !dbg !1471

12:                                               ; preds = %7
  %13 = load ptr, ptr %4, align 4, !dbg !1475
  %14 = load i8, ptr %13, align 1, !dbg !1478
  %15 = sext i8 %14 to i32, !dbg !1478
  %16 = load i32, ptr %5, align 4, !dbg !1479
  %17 = trunc i32 %16 to i8, !dbg !1480
  %18 = sext i8 %17 to i32, !dbg !1480
  %19 = icmp eq i32 %15, %18, !dbg !1481
  br i1 %19, label %20, label %22, !dbg !1482

20:                                               ; preds = %12
  %21 = load ptr, ptr %4, align 4, !dbg !1483
  store ptr %21, ptr %6, align 4, !dbg !1485
  br label %22, !dbg !1486

22:                                               ; preds = %20, %12
  %23 = load ptr, ptr %4, align 4, !dbg !1487
  %24 = getelementptr inbounds i8, ptr %23, i32 1, !dbg !1487
  store ptr %24, ptr %4, align 4, !dbg !1487
  br label %7, !dbg !1471, !llvm.loop !1488

25:                                               ; preds = %7
  %26 = load i32, ptr %5, align 4, !dbg !1490
  %27 = trunc i32 %26 to i8, !dbg !1492
  %28 = sext i8 %27 to i32, !dbg !1492
  %29 = icmp eq i32 %28, 0, !dbg !1493
  br i1 %29, label %30, label %32, !dbg !1494

30:                                               ; preds = %25
  %31 = load ptr, ptr %4, align 4, !dbg !1495
  store ptr %31, ptr %3, align 4, !dbg !1497
  br label %34, !dbg !1497

32:                                               ; preds = %25
  %33 = load ptr, ptr %6, align 4, !dbg !1498
  store ptr %33, ptr %3, align 4, !dbg !1499
  br label %34, !dbg !1499

34:                                               ; preds = %32, %30
  %35 = load ptr, ptr %3, align 4, !dbg !1500
  ret ptr %35, !dbg !1500
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strcat(ptr noundef %0, ptr noundef %1) #0 !dbg !1501 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  store ptr %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1503, metadata !DIExpression()), !dbg !1504
  store ptr %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1505, metadata !DIExpression()), !dbg !1506
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1507, metadata !DIExpression()), !dbg !1508
  %6 = load ptr, ptr %3, align 4, !dbg !1509
  store ptr %6, ptr %5, align 4, !dbg !1508
  br label %7, !dbg !1510

7:                                                ; preds = %12, %2
  %8 = load ptr, ptr %5, align 4, !dbg !1511
  %9 = load i8, ptr %8, align 1, !dbg !1512
  %10 = sext i8 %9 to i32, !dbg !1512
  %11 = icmp ne i32 %10, 0, !dbg !1513
  br i1 %11, label %12, label %15, !dbg !1510

12:                                               ; preds = %7
  %13 = load ptr, ptr %5, align 4, !dbg !1514
  %14 = getelementptr inbounds i8, ptr %13, i32 1, !dbg !1514
  store ptr %14, ptr %5, align 4, !dbg !1514
  br label %7, !dbg !1510, !llvm.loop !1516

15:                                               ; preds = %7
  br label %16, !dbg !1518

16:                                               ; preds = %21, %15
  %17 = load ptr, ptr %4, align 4, !dbg !1519
  %18 = load i8, ptr %17, align 1, !dbg !1520
  %19 = sext i8 %18 to i32, !dbg !1520
  %20 = icmp ne i32 %19, 0, !dbg !1521
  br i1 %20, label %21, label %29, !dbg !1518

21:                                               ; preds = %16
  %22 = load ptr, ptr %4, align 4, !dbg !1522
  %23 = load i8, ptr %22, align 1, !dbg !1524
  %24 = load ptr, ptr %5, align 4, !dbg !1525
  store i8 %23, ptr %24, align 1, !dbg !1526
  %25 = load ptr, ptr %5, align 4, !dbg !1527
  %26 = getelementptr inbounds i8, ptr %25, i32 1, !dbg !1527
  store ptr %26, ptr %5, align 4, !dbg !1527
  %27 = load ptr, ptr %4, align 4, !dbg !1528
  %28 = getelementptr inbounds i8, ptr %27, i32 1, !dbg !1528
  store ptr %28, ptr %4, align 4, !dbg !1528
  br label %16, !dbg !1518, !llvm.loop !1529

29:                                               ; preds = %16
  %30 = load ptr, ptr %5, align 4, !dbg !1531
  store i8 0, ptr %30, align 1, !dbg !1532
  %31 = load ptr, ptr %3, align 4, !dbg !1533
  ret ptr %31, !dbg !1534
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strspn(ptr noundef %0, ptr noundef %1) #0 !dbg !1535 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 4
  store ptr %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1541, metadata !DIExpression()), !dbg !1542
  store ptr %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1543, metadata !DIExpression()), !dbg !1544
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1545, metadata !DIExpression()), !dbg !1546
  store i32 0, ptr %5, align 4, !dbg !1546
  br label %7, !dbg !1547

7:                                                ; preds = %38, %2
  %8 = load ptr, ptr %3, align 4, !dbg !1548
  %9 = load i8, ptr %8, align 1, !dbg !1549
  %10 = sext i8 %9 to i32, !dbg !1549
  %11 = icmp ne i32 %10, 0, !dbg !1550
  br i1 %11, label %12, label %43, !dbg !1547

12:                                               ; preds = %7
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1551, metadata !DIExpression()), !dbg !1553
  %13 = load ptr, ptr %4, align 4, !dbg !1554
  store ptr %13, ptr %6, align 4, !dbg !1553
  br label %14, !dbg !1555

14:                                               ; preds = %29, %12
  %15 = load ptr, ptr %6, align 4, !dbg !1556
  %16 = load i8, ptr %15, align 1, !dbg !1557
  %17 = sext i8 %16 to i32, !dbg !1557
  %18 = icmp ne i32 %17, 0, !dbg !1558
  br i1 %18, label %19, label %27, !dbg !1559

19:                                               ; preds = %14
  %20 = load ptr, ptr %6, align 4, !dbg !1560
  %21 = load i8, ptr %20, align 1, !dbg !1561
  %22 = sext i8 %21 to i32, !dbg !1561
  %23 = load ptr, ptr %3, align 4, !dbg !1562
  %24 = load i8, ptr %23, align 1, !dbg !1563
  %25 = sext i8 %24 to i32, !dbg !1563
  %26 = icmp ne i32 %22, %25, !dbg !1564
  br label %27

27:                                               ; preds = %19, %14
  %28 = phi i1 [ false, %14 ], [ %26, %19 ], !dbg !1565
  br i1 %28, label %29, label %32, !dbg !1555

29:                                               ; preds = %27
  %30 = load ptr, ptr %6, align 4, !dbg !1566
  %31 = getelementptr inbounds i8, ptr %30, i32 1, !dbg !1566
  store ptr %31, ptr %6, align 4, !dbg !1566
  br label %14, !dbg !1555, !llvm.loop !1568

32:                                               ; preds = %27
  %33 = load ptr, ptr %6, align 4, !dbg !1570
  %34 = load i8, ptr %33, align 1, !dbg !1572
  %35 = sext i8 %34 to i32, !dbg !1572
  %36 = icmp eq i32 %35, 0, !dbg !1573
  br i1 %36, label %37, label %38, !dbg !1574

37:                                               ; preds = %32
  br label %43, !dbg !1575

38:                                               ; preds = %32
  %39 = load i32, ptr %5, align 4, !dbg !1577
  %40 = add i32 %39, 1, !dbg !1577
  store i32 %40, ptr %5, align 4, !dbg !1577
  %41 = load ptr, ptr %3, align 4, !dbg !1578
  %42 = getelementptr inbounds i8, ptr %41, i32 1, !dbg !1578
  store ptr %42, ptr %3, align 4, !dbg !1578
  br label %7, !dbg !1547, !llvm.loop !1579

43:                                               ; preds = %37, %7
  %44 = load i32, ptr %5, align 4, !dbg !1581
  ret i32 %44, !dbg !1582
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strncpy(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !1583 {
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1589, metadata !DIExpression()), !dbg !1590
  store ptr %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1591, metadata !DIExpression()), !dbg !1592
  store i32 %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1593, metadata !DIExpression()), !dbg !1594
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1595, metadata !DIExpression()), !dbg !1596
  store i32 0, ptr %7, align 4, !dbg !1596
  br label %8, !dbg !1597

8:                                                ; preds = %21, %3
  %9 = load i32, ptr %7, align 4, !dbg !1598
  %10 = load i32, ptr %6, align 4, !dbg !1599
  %11 = icmp ult i32 %9, %10, !dbg !1600
  br i1 %11, label %12, label %19, !dbg !1601

12:                                               ; preds = %8
  %13 = load ptr, ptr %5, align 4, !dbg !1602
  %14 = load i32, ptr %7, align 4, !dbg !1603
  %15 = getelementptr inbounds i8, ptr %13, i32 %14, !dbg !1602
  %16 = load i8, ptr %15, align 1, !dbg !1602
  %17 = sext i8 %16 to i32, !dbg !1602
  %18 = icmp ne i32 %17, 0, !dbg !1604
  br label %19

19:                                               ; preds = %12, %8
  %20 = phi i1 [ false, %8 ], [ %18, %12 ], !dbg !1605
  br i1 %20, label %21, label %31, !dbg !1597

21:                                               ; preds = %19
  %22 = load ptr, ptr %5, align 4, !dbg !1606
  %23 = load i32, ptr %7, align 4, !dbg !1608
  %24 = getelementptr inbounds i8, ptr %22, i32 %23, !dbg !1606
  %25 = load i8, ptr %24, align 1, !dbg !1606
  %26 = load ptr, ptr %4, align 4, !dbg !1609
  %27 = load i32, ptr %7, align 4, !dbg !1610
  %28 = getelementptr inbounds i8, ptr %26, i32 %27, !dbg !1609
  store i8 %25, ptr %28, align 1, !dbg !1611
  %29 = load i32, ptr %7, align 4, !dbg !1612
  %30 = add i32 %29, 1, !dbg !1612
  store i32 %30, ptr %7, align 4, !dbg !1612
  br label %8, !dbg !1597, !llvm.loop !1613

31:                                               ; preds = %19
  br label %32, !dbg !1615

32:                                               ; preds = %36, %31
  %33 = load i32, ptr %7, align 4, !dbg !1616
  %34 = load i32, ptr %6, align 4, !dbg !1617
  %35 = icmp ult i32 %33, %34, !dbg !1618
  br i1 %35, label %36, label %42, !dbg !1615

36:                                               ; preds = %32
  %37 = load ptr, ptr %4, align 4, !dbg !1619
  %38 = load i32, ptr %7, align 4, !dbg !1621
  %39 = getelementptr inbounds i8, ptr %37, i32 %38, !dbg !1619
  store i8 0, ptr %39, align 1, !dbg !1622
  %40 = load i32, ptr %7, align 4, !dbg !1623
  %41 = add i32 %40, 1, !dbg !1623
  store i32 %41, ptr %7, align 4, !dbg !1623
  br label %32, !dbg !1615, !llvm.loop !1624

42:                                               ; preds = %32
  %43 = load ptr, ptr %4, align 4, !dbg !1626
  ret ptr %43, !dbg !1627
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strchr(ptr noundef %0, i32 noundef %1) #0 !dbg !1628 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1630, metadata !DIExpression()), !dbg !1631
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1632, metadata !DIExpression()), !dbg !1633
  br label %6, !dbg !1634

6:                                                ; preds = %21, %2
  %7 = load ptr, ptr %4, align 4, !dbg !1635
  %8 = load i8, ptr %7, align 1, !dbg !1636
  %9 = sext i8 %8 to i32, !dbg !1636
  %10 = icmp ne i32 %9, 0, !dbg !1637
  br i1 %10, label %11, label %24, !dbg !1634

11:                                               ; preds = %6
  %12 = load ptr, ptr %4, align 4, !dbg !1638
  %13 = load i8, ptr %12, align 1, !dbg !1641
  %14 = sext i8 %13 to i32, !dbg !1641
  %15 = load i32, ptr %5, align 4, !dbg !1642
  %16 = trunc i32 %15 to i8, !dbg !1643
  %17 = sext i8 %16 to i32, !dbg !1643
  %18 = icmp eq i32 %14, %17, !dbg !1644
  br i1 %18, label %19, label %21, !dbg !1645

19:                                               ; preds = %11
  %20 = load ptr, ptr %4, align 4, !dbg !1646
  store ptr %20, ptr %3, align 4, !dbg !1648
  br label %32, !dbg !1648

21:                                               ; preds = %11
  %22 = load ptr, ptr %4, align 4, !dbg !1649
  %23 = getelementptr inbounds i8, ptr %22, i32 1, !dbg !1649
  store ptr %23, ptr %4, align 4, !dbg !1649
  br label %6, !dbg !1634, !llvm.loop !1650

24:                                               ; preds = %6
  %25 = load i32, ptr %5, align 4, !dbg !1652
  %26 = trunc i32 %25 to i8, !dbg !1654
  %27 = sext i8 %26 to i32, !dbg !1654
  %28 = icmp eq i32 %27, 0, !dbg !1655
  br i1 %28, label %29, label %31, !dbg !1656

29:                                               ; preds = %24
  %30 = load ptr, ptr %4, align 4, !dbg !1657
  store ptr %30, ptr %3, align 4, !dbg !1659
  br label %32, !dbg !1659

31:                                               ; preds = %24
  store ptr null, ptr %3, align 4, !dbg !1660
  br label %32, !dbg !1660

32:                                               ; preds = %31, %29, %19
  %33 = load ptr, ptr %3, align 4, !dbg !1661
  ret ptr %33, !dbg !1661
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strerror(i32 noundef %0) #0 !dbg !29 {
  %2 = alloca ptr, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1662, metadata !DIExpression()), !dbg !1663
  %4 = load i32, ptr %3, align 4, !dbg !1664
  switch i32 %4, label %11 [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %7
    i32 3, label %8
    i32 4, label %9
    i32 5, label %10
  ], !dbg !1665

5:                                                ; preds = %1
  store ptr @.str, ptr %2, align 4, !dbg !1666
  br label %12, !dbg !1666

6:                                                ; preds = %1
  store ptr @.str.1, ptr %2, align 4, !dbg !1668
  br label %12, !dbg !1668

7:                                                ; preds = %1
  store ptr @.str.2, ptr %2, align 4, !dbg !1669
  br label %12, !dbg !1669

8:                                                ; preds = %1
  store ptr @.str.3, ptr %2, align 4, !dbg !1670
  br label %12, !dbg !1670

9:                                                ; preds = %1
  store ptr @.str.4, ptr %2, align 4, !dbg !1671
  br label %12, !dbg !1671

10:                                               ; preds = %1
  store ptr @.str.5, ptr %2, align 4, !dbg !1672
  br label %12, !dbg !1672

11:                                               ; preds = %1
  store ptr @__fizzer_model__strerror.unknown, ptr %2, align 4, !dbg !1673
  br label %12, !dbg !1673

12:                                               ; preds = %11, %10, %9, %8, %7, %6, %5
  %13 = load ptr, ptr %2, align 4, !dbg !1674
  ret ptr %13, !dbg !1674
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__memchr(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !1675 {
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1683, metadata !DIExpression()), !dbg !1684
  store i32 %1, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1685, metadata !DIExpression()), !dbg !1686
  store i32 %2, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1687, metadata !DIExpression()), !dbg !1688
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1689, metadata !DIExpression()), !dbg !1690
  %10 = load ptr, ptr %5, align 4, !dbg !1691
  store ptr %10, ptr %8, align 4, !dbg !1690
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1692, metadata !DIExpression()), !dbg !1693
  store i32 0, ptr %9, align 4, !dbg !1693
  br label %11, !dbg !1694

11:                                               ; preds = %29, %3
  %12 = load i32, ptr %9, align 4, !dbg !1695
  %13 = load i32, ptr %7, align 4, !dbg !1696
  %14 = icmp ult i32 %12, %13, !dbg !1697
  br i1 %14, label %15, label %32, !dbg !1694

15:                                               ; preds = %11
  %16 = load ptr, ptr %8, align 4, !dbg !1698
  %17 = load i32, ptr %9, align 4, !dbg !1701
  %18 = getelementptr inbounds i8, ptr %16, i32 %17, !dbg !1698
  %19 = load i8, ptr %18, align 1, !dbg !1698
  %20 = zext i8 %19 to i32, !dbg !1698
  %21 = load i32, ptr %6, align 4, !dbg !1702
  %22 = trunc i32 %21 to i8, !dbg !1703
  %23 = zext i8 %22 to i32, !dbg !1703
  %24 = icmp eq i32 %20, %23, !dbg !1704
  br i1 %24, label %25, label %29, !dbg !1705

25:                                               ; preds = %15
  %26 = load ptr, ptr %8, align 4, !dbg !1706
  %27 = load i32, ptr %9, align 4, !dbg !1708
  %28 = getelementptr inbounds i8, ptr %26, i32 %27, !dbg !1709
  store ptr %28, ptr %4, align 4, !dbg !1710
  br label %33, !dbg !1710

29:                                               ; preds = %15
  %30 = load i32, ptr %9, align 4, !dbg !1711
  %31 = add i32 %30, 1, !dbg !1711
  store i32 %31, ptr %9, align 4, !dbg !1711
  br label %11, !dbg !1694, !llvm.loop !1712

32:                                               ; preds = %11
  store ptr null, ptr %4, align 4, !dbg !1714
  br label %33, !dbg !1714

33:                                               ; preds = %32, %25
  %34 = load ptr, ptr %4, align 4, !dbg !1715
  ret ptr %34, !dbg !1715
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strlen(ptr noundef %0) #0 !dbg !1716 {
  %2 = alloca ptr, align 4
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1722, metadata !DIExpression()), !dbg !1723
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1724, metadata !DIExpression()), !dbg !1725
  store i32 0, ptr %3, align 4, !dbg !1725
  br label %4, !dbg !1726

4:                                                ; preds = %11, %1
  %5 = load ptr, ptr %2, align 4, !dbg !1727
  %6 = load i32, ptr %3, align 4, !dbg !1728
  %7 = getelementptr inbounds i8, ptr %5, i32 %6, !dbg !1727
  %8 = load i8, ptr %7, align 1, !dbg !1727
  %9 = sext i8 %8 to i32, !dbg !1727
  %10 = icmp ne i32 %9, 0, !dbg !1729
  br i1 %10, label %11, label %14, !dbg !1726

11:                                               ; preds = %4
  %12 = load i32, ptr %3, align 4, !dbg !1730
  %13 = add i32 %12, 1, !dbg !1730
  store i32 %13, ptr %3, align 4, !dbg !1730
  br label %4, !dbg !1726, !llvm.loop !1732

14:                                               ; preds = %4
  %15 = load i32, ptr %3, align 4, !dbg !1734
  ret i32 %15, !dbg !1735
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strtok(ptr noundef %0, ptr noundef %1) #0 !dbg !69 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  %6 = alloca ptr, align 4
  %7 = alloca ptr, align 4
  %8 = alloca ptr, align 4
  store ptr %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1736, metadata !DIExpression()), !dbg !1737
  store ptr %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1738, metadata !DIExpression()), !dbg !1739
  %9 = load ptr, ptr %4, align 4, !dbg !1740
  %10 = icmp eq ptr %9, null, !dbg !1742
  br i1 %10, label %11, label %13, !dbg !1743

11:                                               ; preds = %2
  %12 = load ptr, ptr @__fizzer_model__strtok.next, align 4, !dbg !1744
  store ptr %12, ptr %4, align 4, !dbg !1746
  br label %13, !dbg !1747

13:                                               ; preds = %11, %2
  %14 = load ptr, ptr %4, align 4, !dbg !1748
  %15 = icmp eq ptr %14, null, !dbg !1750
  br i1 %15, label %16, label %17, !dbg !1751

16:                                               ; preds = %13
  store ptr null, ptr %3, align 4, !dbg !1752
  br label %107, !dbg !1752

17:                                               ; preds = %13
  br label %18, !dbg !1754

18:                                               ; preds = %49, %17
  %19 = load ptr, ptr %4, align 4, !dbg !1755
  %20 = load i8, ptr %19, align 1, !dbg !1756
  %21 = sext i8 %20 to i32, !dbg !1756
  %22 = icmp ne i32 %21, 0, !dbg !1757
  br i1 %22, label %23, label %52, !dbg !1754

23:                                               ; preds = %18
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1758, metadata !DIExpression()), !dbg !1760
  %24 = load ptr, ptr %5, align 4, !dbg !1761
  store ptr %24, ptr %6, align 4, !dbg !1760
  br label %25, !dbg !1762

25:                                               ; preds = %40, %23
  %26 = load ptr, ptr %6, align 4, !dbg !1763
  %27 = load i8, ptr %26, align 1, !dbg !1764
  %28 = sext i8 %27 to i32, !dbg !1764
  %29 = icmp ne i32 %28, 0, !dbg !1765
  br i1 %29, label %30, label %38, !dbg !1766

30:                                               ; preds = %25
  %31 = load ptr, ptr %6, align 4, !dbg !1767
  %32 = load i8, ptr %31, align 1, !dbg !1768
  %33 = sext i8 %32 to i32, !dbg !1768
  %34 = load ptr, ptr %4, align 4, !dbg !1769
  %35 = load i8, ptr %34, align 1, !dbg !1770
  %36 = sext i8 %35 to i32, !dbg !1770
  %37 = icmp ne i32 %33, %36, !dbg !1771
  br label %38

38:                                               ; preds = %30, %25
  %39 = phi i1 [ false, %25 ], [ %37, %30 ], !dbg !1772
  br i1 %39, label %40, label %43, !dbg !1762

40:                                               ; preds = %38
  %41 = load ptr, ptr %6, align 4, !dbg !1773
  %42 = getelementptr inbounds i8, ptr %41, i32 1, !dbg !1773
  store ptr %42, ptr %6, align 4, !dbg !1773
  br label %25, !dbg !1762, !llvm.loop !1775

43:                                               ; preds = %38
  %44 = load ptr, ptr %6, align 4, !dbg !1777
  %45 = load i8, ptr %44, align 1, !dbg !1779
  %46 = sext i8 %45 to i32, !dbg !1779
  %47 = icmp eq i32 %46, 0, !dbg !1780
  br i1 %47, label %48, label %49, !dbg !1781

48:                                               ; preds = %43
  br label %52, !dbg !1782

49:                                               ; preds = %43
  %50 = load ptr, ptr %4, align 4, !dbg !1784
  %51 = getelementptr inbounds i8, ptr %50, i32 1, !dbg !1784
  store ptr %51, ptr %4, align 4, !dbg !1784
  br label %18, !dbg !1754, !llvm.loop !1785

52:                                               ; preds = %48, %18
  %53 = load ptr, ptr %4, align 4, !dbg !1787
  %54 = load i8, ptr %53, align 1, !dbg !1789
  %55 = sext i8 %54 to i32, !dbg !1789
  %56 = icmp eq i32 %55, 0, !dbg !1790
  br i1 %56, label %57, label %58, !dbg !1791

57:                                               ; preds = %52
  store ptr null, ptr @__fizzer_model__strtok.next, align 4, !dbg !1792
  store ptr null, ptr %3, align 4, !dbg !1794
  br label %107, !dbg !1794

58:                                               ; preds = %52
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1795, metadata !DIExpression()), !dbg !1796
  %59 = load ptr, ptr %4, align 4, !dbg !1797
  store ptr %59, ptr %7, align 4, !dbg !1796
  br label %60, !dbg !1798

60:                                               ; preds = %91, %58
  %61 = load ptr, ptr %4, align 4, !dbg !1799
  %62 = load i8, ptr %61, align 1, !dbg !1800
  %63 = sext i8 %62 to i32, !dbg !1800
  %64 = icmp ne i32 %63, 0, !dbg !1801
  br i1 %64, label %65, label %94, !dbg !1798

65:                                               ; preds = %60
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1802, metadata !DIExpression()), !dbg !1804
  %66 = load ptr, ptr %5, align 4, !dbg !1805
  store ptr %66, ptr %8, align 4, !dbg !1804
  br label %67, !dbg !1806

67:                                               ; preds = %82, %65
  %68 = load ptr, ptr %8, align 4, !dbg !1807
  %69 = load i8, ptr %68, align 1, !dbg !1808
  %70 = sext i8 %69 to i32, !dbg !1808
  %71 = icmp ne i32 %70, 0, !dbg !1809
  br i1 %71, label %72, label %80, !dbg !1810

72:                                               ; preds = %67
  %73 = load ptr, ptr %8, align 4, !dbg !1811
  %74 = load i8, ptr %73, align 1, !dbg !1812
  %75 = sext i8 %74 to i32, !dbg !1812
  %76 = load ptr, ptr %4, align 4, !dbg !1813
  %77 = load i8, ptr %76, align 1, !dbg !1814
  %78 = sext i8 %77 to i32, !dbg !1814
  %79 = icmp ne i32 %75, %78, !dbg !1815
  br label %80

80:                                               ; preds = %72, %67
  %81 = phi i1 [ false, %67 ], [ %79, %72 ], !dbg !1816
  br i1 %81, label %82, label %85, !dbg !1806

82:                                               ; preds = %80
  %83 = load ptr, ptr %8, align 4, !dbg !1817
  %84 = getelementptr inbounds i8, ptr %83, i32 1, !dbg !1817
  store ptr %84, ptr %8, align 4, !dbg !1817
  br label %67, !dbg !1806, !llvm.loop !1819

85:                                               ; preds = %80
  %86 = load ptr, ptr %8, align 4, !dbg !1821
  %87 = load i8, ptr %86, align 1, !dbg !1823
  %88 = sext i8 %87 to i32, !dbg !1823
  %89 = icmp ne i32 %88, 0, !dbg !1824
  br i1 %89, label %90, label %91, !dbg !1825

90:                                               ; preds = %85
  br label %94, !dbg !1826

91:                                               ; preds = %85
  %92 = load ptr, ptr %4, align 4, !dbg !1828
  %93 = getelementptr inbounds i8, ptr %92, i32 1, !dbg !1828
  store ptr %93, ptr %4, align 4, !dbg !1828
  br label %60, !dbg !1798, !llvm.loop !1829

94:                                               ; preds = %90, %60
  %95 = load ptr, ptr %4, align 4, !dbg !1831
  %96 = load i8, ptr %95, align 1, !dbg !1833
  %97 = sext i8 %96 to i32, !dbg !1833
  %98 = icmp ne i32 %97, 0, !dbg !1834
  br i1 %98, label %99, label %104, !dbg !1835

99:                                               ; preds = %94
  %100 = load ptr, ptr %4, align 4, !dbg !1836
  store i8 0, ptr %100, align 1, !dbg !1838
  %101 = load ptr, ptr %4, align 4, !dbg !1839
  %102 = getelementptr inbounds i8, ptr %101, i32 1, !dbg !1839
  store ptr %102, ptr %4, align 4, !dbg !1839
  %103 = load ptr, ptr %4, align 4, !dbg !1840
  store ptr %103, ptr @__fizzer_model__strtok.next, align 4, !dbg !1841
  br label %105, !dbg !1842

104:                                              ; preds = %94
  store ptr null, ptr @__fizzer_model__strtok.next, align 4, !dbg !1843
  br label %105

105:                                              ; preds = %104, %99
  %106 = load ptr, ptr %7, align 4, !dbg !1845
  store ptr %106, ptr %3, align 4, !dbg !1846
  br label %107, !dbg !1846

107:                                              ; preds = %105, %57, %16
  %108 = load ptr, ptr %3, align 4, !dbg !1847
  ret ptr %108, !dbg !1847
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strxfrm(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !1848 {
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1854, metadata !DIExpression()), !dbg !1855
  store ptr %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1856, metadata !DIExpression()), !dbg !1857
  store i32 %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1858, metadata !DIExpression()), !dbg !1859
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1860, metadata !DIExpression()), !dbg !1861
  store i32 0, ptr %7, align 4, !dbg !1861
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1862, metadata !DIExpression()), !dbg !1863
  %10 = load ptr, ptr %5, align 4, !dbg !1864
  store ptr %10, ptr %8, align 4, !dbg !1863
  br label %11, !dbg !1865

11:                                               ; preds = %16, %3
  %12 = load ptr, ptr %8, align 4, !dbg !1866
  %13 = load i8, ptr %12, align 1, !dbg !1867
  %14 = sext i8 %13 to i32, !dbg !1867
  %15 = icmp ne i32 %14, 0, !dbg !1868
  br i1 %15, label %16, label %21, !dbg !1865

16:                                               ; preds = %11
  %17 = load i32, ptr %7, align 4, !dbg !1869
  %18 = add i32 %17, 1, !dbg !1869
  store i32 %18, ptr %7, align 4, !dbg !1869
  %19 = load ptr, ptr %8, align 4, !dbg !1871
  %20 = getelementptr inbounds i8, ptr %19, i32 1, !dbg !1871
  store ptr %20, ptr %8, align 4, !dbg !1871
  br label %11, !dbg !1865, !llvm.loop !1872

21:                                               ; preds = %11
  %22 = load i32, ptr %6, align 4, !dbg !1874
  %23 = icmp ugt i32 %22, 0, !dbg !1876
  br i1 %23, label %24, label %53, !dbg !1877

24:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1878, metadata !DIExpression()), !dbg !1880
  store i32 0, ptr %9, align 4, !dbg !1880
  br label %25, !dbg !1881

25:                                               ; preds = %39, %24
  %26 = load i32, ptr %9, align 4, !dbg !1882
  %27 = load i32, ptr %6, align 4, !dbg !1883
  %28 = sub i32 %27, 1, !dbg !1884
  %29 = icmp ult i32 %26, %28, !dbg !1885
  br i1 %29, label %30, label %37, !dbg !1886

30:                                               ; preds = %25
  %31 = load ptr, ptr %5, align 4, !dbg !1887
  %32 = load i32, ptr %9, align 4, !dbg !1888
  %33 = getelementptr inbounds i8, ptr %31, i32 %32, !dbg !1887
  %34 = load i8, ptr %33, align 1, !dbg !1887
  %35 = sext i8 %34 to i32, !dbg !1887
  %36 = icmp ne i32 %35, 0, !dbg !1889
  br label %37

37:                                               ; preds = %30, %25
  %38 = phi i1 [ false, %25 ], [ %36, %30 ], !dbg !1890
  br i1 %38, label %39, label %49, !dbg !1881

39:                                               ; preds = %37
  %40 = load ptr, ptr %5, align 4, !dbg !1891
  %41 = load i32, ptr %9, align 4, !dbg !1893
  %42 = getelementptr inbounds i8, ptr %40, i32 %41, !dbg !1891
  %43 = load i8, ptr %42, align 1, !dbg !1891
  %44 = load ptr, ptr %4, align 4, !dbg !1894
  %45 = load i32, ptr %9, align 4, !dbg !1895
  %46 = getelementptr inbounds i8, ptr %44, i32 %45, !dbg !1894
  store i8 %43, ptr %46, align 1, !dbg !1896
  %47 = load i32, ptr %9, align 4, !dbg !1897
  %48 = add i32 %47, 1, !dbg !1897
  store i32 %48, ptr %9, align 4, !dbg !1897
  br label %25, !dbg !1881, !llvm.loop !1898

49:                                               ; preds = %37
  %50 = load ptr, ptr %4, align 4, !dbg !1900
  %51 = load i32, ptr %9, align 4, !dbg !1901
  %52 = getelementptr inbounds i8, ptr %50, i32 %51, !dbg !1900
  store i8 0, ptr %52, align 1, !dbg !1902
  br label %53, !dbg !1903

53:                                               ; preds = %49, %21
  %54 = load i32, ptr %7, align 4, !dbg !1904
  ret i32 %54, !dbg !1905
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__iscntrl(i32 noundef %0) #0 !dbg !1906 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1908, metadata !DIExpression()), !dbg !1909
  %4 = load i32, ptr %3, align 4, !dbg !1910
  %5 = icmp sge i32 %4, 0, !dbg !1912
  br i1 %5, label %6, label %9, !dbg !1913

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !1914
  %8 = icmp sle i32 %7, 31, !dbg !1915
  br i1 %8, label %12, label %9, !dbg !1916

9:                                                ; preds = %6, %1
  %10 = load i32, ptr %3, align 4, !dbg !1917
  %11 = icmp eq i32 %10, 127, !dbg !1918
  br i1 %11, label %12, label %13, !dbg !1919

12:                                               ; preds = %9, %6
  store i32 1, ptr %2, align 4, !dbg !1920
  br label %14, !dbg !1920

13:                                               ; preds = %9
  store i32 0, ptr %2, align 4, !dbg !1922
  br label %14, !dbg !1922

14:                                               ; preds = %13, %12
  %15 = load i32, ptr %2, align 4, !dbg !1923
  ret i32 %15, !dbg !1923
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isxdigit(i32 noundef %0) #0 !dbg !1924 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1926, metadata !DIExpression()), !dbg !1927
  %4 = load i32, ptr %3, align 4, !dbg !1928
  %5 = call i32 @__fizzer_model__isdigit(i32 noundef %4), !dbg !1930
  %6 = icmp ne i32 %5, 0, !dbg !1930
  br i1 %6, label %19, label %7, !dbg !1931

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4, !dbg !1932
  %9 = icmp sge i32 %8, 65, !dbg !1933
  br i1 %9, label %10, label %13, !dbg !1934

10:                                               ; preds = %7
  %11 = load i32, ptr %3, align 4, !dbg !1935
  %12 = icmp sle i32 %11, 70, !dbg !1936
  br i1 %12, label %19, label %13, !dbg !1937

13:                                               ; preds = %10, %7
  %14 = load i32, ptr %3, align 4, !dbg !1938
  %15 = icmp sge i32 %14, 97, !dbg !1939
  br i1 %15, label %16, label %20, !dbg !1940

16:                                               ; preds = %13
  %17 = load i32, ptr %3, align 4, !dbg !1941
  %18 = icmp sle i32 %17, 102, !dbg !1942
  br i1 %18, label %19, label %20, !dbg !1943

19:                                               ; preds = %16, %10, %1
  store i32 1, ptr %2, align 4, !dbg !1944
  br label %21, !dbg !1944

20:                                               ; preds = %16, %13
  store i32 0, ptr %2, align 4, !dbg !1946
  br label %21, !dbg !1946

21:                                               ; preds = %20, %19
  %22 = load i32, ptr %2, align 4, !dbg !1947
  ret i32 %22, !dbg !1947
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isalnum(i32 noundef %0) #0 !dbg !1948 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1950, metadata !DIExpression()), !dbg !1951
  %4 = load i32, ptr %3, align 4, !dbg !1952
  %5 = call i32 @__fizzer_model__isalpha(i32 noundef %4), !dbg !1954
  %6 = icmp ne i32 %5, 0, !dbg !1954
  br i1 %6, label %11, label %7, !dbg !1955

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4, !dbg !1956
  %9 = call i32 @__fizzer_model__isdigit(i32 noundef %8), !dbg !1957
  %10 = icmp ne i32 %9, 0, !dbg !1957
  br i1 %10, label %11, label %12, !dbg !1958

11:                                               ; preds = %7, %1
  store i32 1, ptr %2, align 4, !dbg !1959
  br label %13, !dbg !1959

12:                                               ; preds = %7
  store i32 0, ptr %2, align 4, !dbg !1961
  br label %13, !dbg !1961

13:                                               ; preds = %12, %11
  %14 = load i32, ptr %2, align 4, !dbg !1962
  ret i32 %14, !dbg !1962
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isspace(i32 noundef %0) #0 !dbg !1963 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1965, metadata !DIExpression()), !dbg !1966
  %4 = load i32, ptr %3, align 4, !dbg !1967
  %5 = icmp eq i32 %4, 32, !dbg !1969
  br i1 %5, label %21, label %6, !dbg !1970

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !1971
  %8 = icmp eq i32 %7, 12, !dbg !1972
  br i1 %8, label %21, label %9, !dbg !1973

9:                                                ; preds = %6
  %10 = load i32, ptr %3, align 4, !dbg !1974
  %11 = icmp eq i32 %10, 10, !dbg !1975
  br i1 %11, label %21, label %12, !dbg !1976

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4, !dbg !1977
  %14 = icmp eq i32 %13, 13, !dbg !1978
  br i1 %14, label %21, label %15, !dbg !1979

15:                                               ; preds = %12
  %16 = load i32, ptr %3, align 4, !dbg !1980
  %17 = icmp eq i32 %16, 9, !dbg !1981
  br i1 %17, label %21, label %18, !dbg !1982

18:                                               ; preds = %15
  %19 = load i32, ptr %3, align 4, !dbg !1983
  %20 = icmp eq i32 %19, 11, !dbg !1984
  br i1 %20, label %21, label %22, !dbg !1985

21:                                               ; preds = %18, %15, %12, %9, %6, %1
  store i32 1, ptr %2, align 4, !dbg !1986
  br label %23, !dbg !1986

22:                                               ; preds = %18
  store i32 0, ptr %2, align 4, !dbg !1988
  br label %23, !dbg !1988

23:                                               ; preds = %22, %21
  %24 = load i32, ptr %2, align 4, !dbg !1989
  ret i32 %24, !dbg !1989
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isalpha(i32 noundef %0) #0 !dbg !1990 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1992, metadata !DIExpression()), !dbg !1993
  %4 = load i32, ptr %3, align 4, !dbg !1994
  %5 = icmp sge i32 %4, 65, !dbg !1996
  br i1 %5, label %6, label %9, !dbg !1997

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !1998
  %8 = icmp sle i32 %7, 90, !dbg !1999
  br i1 %8, label %15, label %9, !dbg !2000

9:                                                ; preds = %6, %1
  %10 = load i32, ptr %3, align 4, !dbg !2001
  %11 = icmp sge i32 %10, 97, !dbg !2002
  br i1 %11, label %12, label %16, !dbg !2003

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4, !dbg !2004
  %14 = icmp sle i32 %13, 122, !dbg !2005
  br i1 %14, label %15, label %16, !dbg !2006

15:                                               ; preds = %12, %6
  store i32 1, ptr %2, align 4, !dbg !2007
  br label %17, !dbg !2007

16:                                               ; preds = %12, %9
  store i32 0, ptr %2, align 4, !dbg !2009
  br label %17, !dbg !2009

17:                                               ; preds = %16, %15
  %18 = load i32, ptr %2, align 4, !dbg !2010
  ret i32 %18, !dbg !2010
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isblank(i32 noundef %0) #0 !dbg !2011 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2013, metadata !DIExpression()), !dbg !2014
  %4 = load i32, ptr %3, align 4, !dbg !2015
  %5 = icmp eq i32 %4, 32, !dbg !2017
  br i1 %5, label %9, label %6, !dbg !2018

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2019
  %8 = icmp eq i32 %7, 9, !dbg !2020
  br i1 %8, label %9, label %10, !dbg !2021

9:                                                ; preds = %6, %1
  store i32 1, ptr %2, align 4, !dbg !2022
  br label %11, !dbg !2022

10:                                               ; preds = %6
  store i32 0, ptr %2, align 4, !dbg !2024
  br label %11, !dbg !2024

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2025
  ret i32 %12, !dbg !2025
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__islower(i32 noundef %0) #0 !dbg !2026 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2028, metadata !DIExpression()), !dbg !2029
  %4 = load i32, ptr %3, align 4, !dbg !2030
  %5 = icmp sge i32 %4, 97, !dbg !2032
  br i1 %5, label %6, label %10, !dbg !2033

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2034
  %8 = icmp sle i32 %7, 122, !dbg !2035
  br i1 %8, label %9, label %10, !dbg !2036

9:                                                ; preds = %6
  store i32 1, ptr %2, align 4, !dbg !2037
  br label %11, !dbg !2037

10:                                               ; preds = %6, %1
  store i32 0, ptr %2, align 4, !dbg !2039
  br label %11, !dbg !2039

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2040
  ret i32 %12, !dbg !2040
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isdigit(i32 noundef %0) #0 !dbg !2041 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2043, metadata !DIExpression()), !dbg !2044
  %4 = load i32, ptr %3, align 4, !dbg !2045
  %5 = icmp sge i32 %4, 48, !dbg !2047
  br i1 %5, label %6, label %10, !dbg !2048

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2049
  %8 = icmp sle i32 %7, 57, !dbg !2050
  br i1 %8, label %9, label %10, !dbg !2051

9:                                                ; preds = %6
  store i32 1, ptr %2, align 4, !dbg !2052
  br label %11, !dbg !2052

10:                                               ; preds = %6, %1
  store i32 0, ptr %2, align 4, !dbg !2054
  br label %11, !dbg !2054

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2055
  ret i32 %12, !dbg !2055
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__toupper(i32 noundef %0) #0 !dbg !2056 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2058, metadata !DIExpression()), !dbg !2059
  %4 = load i32, ptr %3, align 4, !dbg !2060
  %5 = call i32 @__fizzer_model__islower(i32 noundef %4), !dbg !2062
  %6 = icmp ne i32 %5, 0, !dbg !2062
  br i1 %6, label %7, label %11, !dbg !2063

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4, !dbg !2064
  %9 = sub nsw i32 %8, 97, !dbg !2066
  %10 = add nsw i32 %9, 65, !dbg !2067
  store i32 %10, ptr %2, align 4, !dbg !2068
  br label %13, !dbg !2068

11:                                               ; preds = %1
  %12 = load i32, ptr %3, align 4, !dbg !2069
  store i32 %12, ptr %2, align 4, !dbg !2070
  br label %13, !dbg !2070

13:                                               ; preds = %11, %7
  %14 = load i32, ptr %2, align 4, !dbg !2071
  ret i32 %14, !dbg !2071
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isprint(i32 noundef %0) #0 !dbg !2072 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2074, metadata !DIExpression()), !dbg !2075
  %4 = load i32, ptr %3, align 4, !dbg !2076
  %5 = icmp sge i32 %4, 32, !dbg !2078
  br i1 %5, label %6, label %10, !dbg !2079

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2080
  %8 = icmp sle i32 %7, 126, !dbg !2081
  br i1 %8, label %9, label %10, !dbg !2082

9:                                                ; preds = %6
  store i32 1, ptr %2, align 4, !dbg !2083
  br label %11, !dbg !2083

10:                                               ; preds = %6, %1
  store i32 0, ptr %2, align 4, !dbg !2085
  br label %11, !dbg !2085

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2086
  ret i32 %12, !dbg !2086
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isupper(i32 noundef %0) #0 !dbg !2087 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2089, metadata !DIExpression()), !dbg !2090
  %4 = load i32, ptr %3, align 4, !dbg !2091
  %5 = icmp sge i32 %4, 65, !dbg !2093
  br i1 %5, label %6, label %10, !dbg !2094

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2095
  %8 = icmp sle i32 %7, 90, !dbg !2096
  br i1 %8, label %9, label %10, !dbg !2097

9:                                                ; preds = %6
  store i32 1, ptr %2, align 4, !dbg !2098
  br label %11, !dbg !2098

10:                                               ; preds = %6, %1
  store i32 0, ptr %2, align 4, !dbg !2100
  br label %11, !dbg !2100

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2101
  ret i32 %12, !dbg !2101
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__tolower(i32 noundef %0) #0 !dbg !2102 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2104, metadata !DIExpression()), !dbg !2105
  %4 = load i32, ptr %3, align 4, !dbg !2106
  %5 = call i32 @__fizzer_model__isupper(i32 noundef %4), !dbg !2108
  %6 = icmp ne i32 %5, 0, !dbg !2108
  br i1 %6, label %7, label %11, !dbg !2109

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4, !dbg !2110
  %9 = sub nsw i32 %8, 65, !dbg !2112
  %10 = add nsw i32 %9, 97, !dbg !2113
  store i32 %10, ptr %2, align 4, !dbg !2114
  br label %13, !dbg !2114

11:                                               ; preds = %1
  %12 = load i32, ptr %3, align 4, !dbg !2115
  store i32 %12, ptr %2, align 4, !dbg !2116
  br label %13, !dbg !2116

13:                                               ; preds = %11, %7
  %14 = load i32, ptr %2, align 4, !dbg !2117
  ret i32 %14, !dbg !2117
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isgraph(i32 noundef %0) #0 !dbg !2118 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2120, metadata !DIExpression()), !dbg !2121
  %4 = load i32, ptr %3, align 4, !dbg !2122
  %5 = icmp sge i32 %4, 33, !dbg !2124
  br i1 %5, label %6, label %10, !dbg !2125

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2126
  %8 = icmp sle i32 %7, 126, !dbg !2127
  br i1 %8, label %9, label %10, !dbg !2128

9:                                                ; preds = %6
  store i32 1, ptr %2, align 4, !dbg !2129
  br label %11, !dbg !2129

10:                                               ; preds = %6, %1
  store i32 0, ptr %2, align 4, !dbg !2131
  br label %11, !dbg !2131

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2132
  ret i32 %12, !dbg !2132
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__snprintf(ptr noundef %0, i32 noundef %1, ptr noundef %2, ...) #0 !dbg !2133 {
  %4 = alloca ptr, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 4
  %7 = alloca ptr, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2139, metadata !DIExpression()), !dbg !2140
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2141, metadata !DIExpression()), !dbg !2142
  store ptr %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2143, metadata !DIExpression()), !dbg !2144
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2145, metadata !DIExpression()), !dbg !2148
  call void @llvm.va_start(ptr %7), !dbg !2149
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2150, metadata !DIExpression()), !dbg !2151
  %9 = load ptr, ptr %4, align 4, !dbg !2152
  %10 = load i32, ptr %5, align 4, !dbg !2153
  %11 = load ptr, ptr %6, align 4, !dbg !2154
  %12 = load ptr, ptr %7, align 4, !dbg !2155
  %13 = call i32 @__fizzer_model__vsnprintf(ptr noundef %9, i32 noundef %10, ptr noundef %11, ptr noundef %12), !dbg !2156
  store i32 %13, ptr %8, align 4, !dbg !2151
  call void @llvm.va_end(ptr %7), !dbg !2157
  %14 = load i32, ptr %8, align 4, !dbg !2158
  ret i32 %14, !dbg !2159
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start(ptr) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end(ptr) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__sprintf(ptr noundef %0, ptr noundef %1, ...) #0 !dbg !2160 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2164, metadata !DIExpression()), !dbg !2165
  store ptr %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2166, metadata !DIExpression()), !dbg !2167
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2168, metadata !DIExpression()), !dbg !2172
  call void @llvm.va_start(ptr %5), !dbg !2173
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2174, metadata !DIExpression()), !dbg !2175
  %7 = load ptr, ptr %3, align 4, !dbg !2176
  %8 = load ptr, ptr %4, align 4, !dbg !2177
  %9 = load ptr, ptr %5, align 4, !dbg !2178
  %10 = call i32 @__fizzer_model__vsprintf(ptr noundef %7, ptr noundef %8, ptr noundef %9), !dbg !2179
  store i32 %10, ptr %6, align 4, !dbg !2175
  call void @llvm.va_end(ptr %5), !dbg !2180
  %11 = load i32, ptr %6, align 4, !dbg !2181
  ret i32 %11, !dbg !2182
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__vsprintf(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !2183 {
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  %6 = alloca ptr, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca [32 x i8], align 1
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca [32 x i8], align 1
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca [32 x i8], align 1
  %17 = alloca i32, align 4
  %18 = alloca i8, align 1
  %19 = alloca ptr, align 4
  %20 = alloca i32, align 4
  store ptr %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2190, metadata !DIExpression()), !dbg !2191
  store ptr %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2192, metadata !DIExpression()), !dbg !2193
  store ptr %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2194, metadata !DIExpression()), !dbg !2195
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2196, metadata !DIExpression()), !dbg !2198
  store i32 0, ptr %7, align 4, !dbg !2198
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2199, metadata !DIExpression()), !dbg !2200
  store i32 0, ptr %8, align 4, !dbg !2200
  br label %21, !dbg !2201

21:                                               ; preds = %216, %3
  %22 = load ptr, ptr %5, align 4, !dbg !2202
  %23 = load i32, ptr %7, align 4, !dbg !2203
  %24 = getelementptr inbounds i8, ptr %22, i32 %23, !dbg !2202
  %25 = load i8, ptr %24, align 1, !dbg !2202
  %26 = sext i8 %25 to i32, !dbg !2202
  %27 = icmp ne i32 %26, 0, !dbg !2204
  br i1 %27, label %28, label %217, !dbg !2201

28:                                               ; preds = %21
  %29 = load ptr, ptr %5, align 4, !dbg !2205
  %30 = load i32, ptr %7, align 4, !dbg !2208
  %31 = getelementptr inbounds i8, ptr %29, i32 %30, !dbg !2205
  %32 = load i8, ptr %31, align 1, !dbg !2205
  %33 = sext i8 %32 to i32, !dbg !2205
  %34 = icmp eq i32 %33, 37, !dbg !2209
  br i1 %34, label %35, label %204, !dbg !2210

35:                                               ; preds = %28
  %36 = load i32, ptr %7, align 4, !dbg !2211
  %37 = add i32 %36, 1, !dbg !2211
  store i32 %37, ptr %7, align 4, !dbg !2211
  %38 = load ptr, ptr %5, align 4, !dbg !2213
  %39 = load i32, ptr %7, align 4, !dbg !2215
  %40 = getelementptr inbounds i8, ptr %38, i32 %39, !dbg !2213
  %41 = load i8, ptr %40, align 1, !dbg !2213
  %42 = sext i8 %41 to i32, !dbg !2213
  %43 = icmp eq i32 %42, 0, !dbg !2216
  br i1 %43, label %44, label %45, !dbg !2217

44:                                               ; preds = %35
  br label %217, !dbg !2218

45:                                               ; preds = %35
  %46 = load ptr, ptr %5, align 4, !dbg !2220
  %47 = load i32, ptr %7, align 4, !dbg !2222
  %48 = getelementptr inbounds i8, ptr %46, i32 %47, !dbg !2220
  %49 = load i8, ptr %48, align 1, !dbg !2220
  %50 = sext i8 %49 to i32, !dbg !2220
  %51 = icmp eq i32 %50, 100, !dbg !2223
  br i1 %51, label %52, label %76, !dbg !2224

52:                                               ; preds = %45
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2225, metadata !DIExpression()), !dbg !2227
  %53 = load ptr, ptr %6, align 4, !dbg !2228
  %54 = getelementptr inbounds i8, ptr %53, i32 4, !dbg !2228
  store ptr %54, ptr %6, align 4, !dbg !2228
  %55 = load i32, ptr %53, align 4, !dbg !2228
  store i32 %55, ptr %9, align 4, !dbg !2227
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2229, metadata !DIExpression()), !dbg !2233
  %56 = load i32, ptr %9, align 4, !dbg !2234
  %57 = getelementptr inbounds [32 x i8], ptr %10, i32 0, i32 0, !dbg !2235
  call void @__fizzer_model__helper_itoa(i32 noundef %56, ptr noundef %57, i32 noundef 10), !dbg !2236
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2237, metadata !DIExpression()), !dbg !2238
  store i32 0, ptr %11, align 4, !dbg !2238
  br label %58, !dbg !2239

58:                                               ; preds = %64, %52
  %59 = load i32, ptr %11, align 4, !dbg !2240
  %60 = getelementptr inbounds [32 x i8], ptr %10, i32 0, i32 %59, !dbg !2241
  %61 = load i8, ptr %60, align 1, !dbg !2241
  %62 = sext i8 %61 to i32, !dbg !2241
  %63 = icmp ne i32 %62, 0, !dbg !2242
  br i1 %63, label %64, label %75, !dbg !2239

64:                                               ; preds = %58
  %65 = load i32, ptr %11, align 4, !dbg !2243
  %66 = getelementptr inbounds [32 x i8], ptr %10, i32 0, i32 %65, !dbg !2245
  %67 = load i8, ptr %66, align 1, !dbg !2245
  %68 = load ptr, ptr %4, align 4, !dbg !2246
  %69 = load i32, ptr %8, align 4, !dbg !2247
  %70 = getelementptr inbounds i8, ptr %68, i32 %69, !dbg !2246
  store i8 %67, ptr %70, align 1, !dbg !2248
  %71 = load i32, ptr %8, align 4, !dbg !2249
  %72 = add i32 %71, 1, !dbg !2249
  store i32 %72, ptr %8, align 4, !dbg !2249
  %73 = load i32, ptr %11, align 4, !dbg !2250
  %74 = add i32 %73, 1, !dbg !2250
  store i32 %74, ptr %11, align 4, !dbg !2250
  br label %58, !dbg !2239, !llvm.loop !2251

75:                                               ; preds = %58
  br label %201, !dbg !2253

76:                                               ; preds = %45
  %77 = load ptr, ptr %5, align 4, !dbg !2254
  %78 = load i32, ptr %7, align 4, !dbg !2256
  %79 = getelementptr inbounds i8, ptr %77, i32 %78, !dbg !2254
  %80 = load i8, ptr %79, align 1, !dbg !2254
  %81 = sext i8 %80 to i32, !dbg !2254
  %82 = icmp eq i32 %81, 117, !dbg !2257
  br i1 %82, label %83, label %107, !dbg !2258

83:                                               ; preds = %76
  call void @llvm.dbg.declare(metadata ptr %12, metadata !2259, metadata !DIExpression()), !dbg !2261
  %84 = load ptr, ptr %6, align 4, !dbg !2262
  %85 = getelementptr inbounds i8, ptr %84, i32 4, !dbg !2262
  store ptr %85, ptr %6, align 4, !dbg !2262
  %86 = load i32, ptr %84, align 4, !dbg !2262
  store i32 %86, ptr %12, align 4, !dbg !2261
  call void @llvm.dbg.declare(metadata ptr %13, metadata !2263, metadata !DIExpression()), !dbg !2264
  %87 = load i32, ptr %12, align 4, !dbg !2265
  %88 = getelementptr inbounds [32 x i8], ptr %13, i32 0, i32 0, !dbg !2266
  call void @__fizzer_model__helper_itoa(i32 noundef %87, ptr noundef %88, i32 noundef 10), !dbg !2267
  call void @llvm.dbg.declare(metadata ptr %14, metadata !2268, metadata !DIExpression()), !dbg !2269
  store i32 0, ptr %14, align 4, !dbg !2269
  br label %89, !dbg !2270

89:                                               ; preds = %95, %83
  %90 = load i32, ptr %14, align 4, !dbg !2271
  %91 = getelementptr inbounds [32 x i8], ptr %13, i32 0, i32 %90, !dbg !2272
  %92 = load i8, ptr %91, align 1, !dbg !2272
  %93 = sext i8 %92 to i32, !dbg !2272
  %94 = icmp ne i32 %93, 0, !dbg !2273
  br i1 %94, label %95, label %106, !dbg !2270

95:                                               ; preds = %89
  %96 = load i32, ptr %14, align 4, !dbg !2274
  %97 = getelementptr inbounds [32 x i8], ptr %13, i32 0, i32 %96, !dbg !2276
  %98 = load i8, ptr %97, align 1, !dbg !2276
  %99 = load ptr, ptr %4, align 4, !dbg !2277
  %100 = load i32, ptr %8, align 4, !dbg !2278
  %101 = getelementptr inbounds i8, ptr %99, i32 %100, !dbg !2277
  store i8 %98, ptr %101, align 1, !dbg !2279
  %102 = load i32, ptr %8, align 4, !dbg !2280
  %103 = add i32 %102, 1, !dbg !2280
  store i32 %103, ptr %8, align 4, !dbg !2280
  %104 = load i32, ptr %14, align 4, !dbg !2281
  %105 = add i32 %104, 1, !dbg !2281
  store i32 %105, ptr %14, align 4, !dbg !2281
  br label %89, !dbg !2270, !llvm.loop !2282

106:                                              ; preds = %89
  br label %200, !dbg !2284

107:                                              ; preds = %76
  %108 = load ptr, ptr %5, align 4, !dbg !2285
  %109 = load i32, ptr %7, align 4, !dbg !2287
  %110 = getelementptr inbounds i8, ptr %108, i32 %109, !dbg !2285
  %111 = load i8, ptr %110, align 1, !dbg !2285
  %112 = sext i8 %111 to i32, !dbg !2285
  %113 = icmp eq i32 %112, 120, !dbg !2288
  br i1 %113, label %114, label %138, !dbg !2289

114:                                              ; preds = %107
  call void @llvm.dbg.declare(metadata ptr %15, metadata !2290, metadata !DIExpression()), !dbg !2292
  %115 = load ptr, ptr %6, align 4, !dbg !2293
  %116 = getelementptr inbounds i8, ptr %115, i32 4, !dbg !2293
  store ptr %116, ptr %6, align 4, !dbg !2293
  %117 = load i32, ptr %115, align 4, !dbg !2293
  store i32 %117, ptr %15, align 4, !dbg !2292
  call void @llvm.dbg.declare(metadata ptr %16, metadata !2294, metadata !DIExpression()), !dbg !2295
  %118 = load i32, ptr %15, align 4, !dbg !2296
  %119 = getelementptr inbounds [32 x i8], ptr %16, i32 0, i32 0, !dbg !2297
  call void @__fizzer_model__helper_itoa(i32 noundef %118, ptr noundef %119, i32 noundef 16), !dbg !2298
  call void @llvm.dbg.declare(metadata ptr %17, metadata !2299, metadata !DIExpression()), !dbg !2300
  store i32 0, ptr %17, align 4, !dbg !2300
  br label %120, !dbg !2301

120:                                              ; preds = %126, %114
  %121 = load i32, ptr %17, align 4, !dbg !2302
  %122 = getelementptr inbounds [32 x i8], ptr %16, i32 0, i32 %121, !dbg !2303
  %123 = load i8, ptr %122, align 1, !dbg !2303
  %124 = sext i8 %123 to i32, !dbg !2303
  %125 = icmp ne i32 %124, 0, !dbg !2304
  br i1 %125, label %126, label %137, !dbg !2301

126:                                              ; preds = %120
  %127 = load i32, ptr %17, align 4, !dbg !2305
  %128 = getelementptr inbounds [32 x i8], ptr %16, i32 0, i32 %127, !dbg !2307
  %129 = load i8, ptr %128, align 1, !dbg !2307
  %130 = load ptr, ptr %4, align 4, !dbg !2308
  %131 = load i32, ptr %8, align 4, !dbg !2309
  %132 = getelementptr inbounds i8, ptr %130, i32 %131, !dbg !2308
  store i8 %129, ptr %132, align 1, !dbg !2310
  %133 = load i32, ptr %8, align 4, !dbg !2311
  %134 = add i32 %133, 1, !dbg !2311
  store i32 %134, ptr %8, align 4, !dbg !2311
  %135 = load i32, ptr %17, align 4, !dbg !2312
  %136 = add i32 %135, 1, !dbg !2312
  store i32 %136, ptr %17, align 4, !dbg !2312
  br label %120, !dbg !2301, !llvm.loop !2313

137:                                              ; preds = %120
  br label %199, !dbg !2315

138:                                              ; preds = %107
  %139 = load ptr, ptr %5, align 4, !dbg !2316
  %140 = load i32, ptr %7, align 4, !dbg !2318
  %141 = getelementptr inbounds i8, ptr %139, i32 %140, !dbg !2316
  %142 = load i8, ptr %141, align 1, !dbg !2316
  %143 = sext i8 %142 to i32, !dbg !2316
  %144 = icmp eq i32 %143, 99, !dbg !2319
  br i1 %144, label %145, label %156, !dbg !2320

145:                                              ; preds = %138
  call void @llvm.dbg.declare(metadata ptr %18, metadata !2321, metadata !DIExpression()), !dbg !2323
  %146 = load ptr, ptr %6, align 4, !dbg !2324
  %147 = getelementptr inbounds i8, ptr %146, i32 4, !dbg !2324
  store ptr %147, ptr %6, align 4, !dbg !2324
  %148 = load i32, ptr %146, align 4, !dbg !2324
  %149 = trunc i32 %148 to i8, !dbg !2325
  store i8 %149, ptr %18, align 1, !dbg !2323
  %150 = load i8, ptr %18, align 1, !dbg !2326
  %151 = load ptr, ptr %4, align 4, !dbg !2327
  %152 = load i32, ptr %8, align 4, !dbg !2328
  %153 = getelementptr inbounds i8, ptr %151, i32 %152, !dbg !2327
  store i8 %150, ptr %153, align 1, !dbg !2329
  %154 = load i32, ptr %8, align 4, !dbg !2330
  %155 = add i32 %154, 1, !dbg !2330
  store i32 %155, ptr %8, align 4, !dbg !2330
  br label %198, !dbg !2331

156:                                              ; preds = %138
  %157 = load ptr, ptr %5, align 4, !dbg !2332
  %158 = load i32, ptr %7, align 4, !dbg !2334
  %159 = getelementptr inbounds i8, ptr %157, i32 %158, !dbg !2332
  %160 = load i8, ptr %159, align 1, !dbg !2332
  %161 = sext i8 %160 to i32, !dbg !2332
  %162 = icmp eq i32 %161, 115, !dbg !2335
  br i1 %162, label %163, label %187, !dbg !2336

163:                                              ; preds = %156
  call void @llvm.dbg.declare(metadata ptr %19, metadata !2337, metadata !DIExpression()), !dbg !2339
  %164 = load ptr, ptr %6, align 4, !dbg !2340
  %165 = getelementptr inbounds i8, ptr %164, i32 4, !dbg !2340
  store ptr %165, ptr %6, align 4, !dbg !2340
  %166 = load ptr, ptr %164, align 4, !dbg !2340
  store ptr %166, ptr %19, align 4, !dbg !2339
  call void @llvm.dbg.declare(metadata ptr %20, metadata !2341, metadata !DIExpression()), !dbg !2342
  store i32 0, ptr %20, align 4, !dbg !2342
  br label %167, !dbg !2343

167:                                              ; preds = %174, %163
  %168 = load ptr, ptr %19, align 4, !dbg !2344
  %169 = load i32, ptr %20, align 4, !dbg !2345
  %170 = getelementptr inbounds i8, ptr %168, i32 %169, !dbg !2344
  %171 = load i8, ptr %170, align 1, !dbg !2344
  %172 = sext i8 %171 to i32, !dbg !2344
  %173 = icmp ne i32 %172, 0, !dbg !2346
  br i1 %173, label %174, label %186, !dbg !2343

174:                                              ; preds = %167
  %175 = load ptr, ptr %19, align 4, !dbg !2347
  %176 = load i32, ptr %20, align 4, !dbg !2349
  %177 = getelementptr inbounds i8, ptr %175, i32 %176, !dbg !2347
  %178 = load i8, ptr %177, align 1, !dbg !2347
  %179 = load ptr, ptr %4, align 4, !dbg !2350
  %180 = load i32, ptr %8, align 4, !dbg !2351
  %181 = getelementptr inbounds i8, ptr %179, i32 %180, !dbg !2350
  store i8 %178, ptr %181, align 1, !dbg !2352
  %182 = load i32, ptr %8, align 4, !dbg !2353
  %183 = add i32 %182, 1, !dbg !2353
  store i32 %183, ptr %8, align 4, !dbg !2353
  %184 = load i32, ptr %20, align 4, !dbg !2354
  %185 = add i32 %184, 1, !dbg !2354
  store i32 %185, ptr %20, align 4, !dbg !2354
  br label %167, !dbg !2343, !llvm.loop !2355

186:                                              ; preds = %167
  br label %197, !dbg !2357

187:                                              ; preds = %156
  %188 = load ptr, ptr %5, align 4, !dbg !2358
  %189 = load i32, ptr %7, align 4, !dbg !2360
  %190 = getelementptr inbounds i8, ptr %188, i32 %189, !dbg !2358
  %191 = load i8, ptr %190, align 1, !dbg !2358
  %192 = load ptr, ptr %4, align 4, !dbg !2361
  %193 = load i32, ptr %8, align 4, !dbg !2362
  %194 = getelementptr inbounds i8, ptr %192, i32 %193, !dbg !2361
  store i8 %191, ptr %194, align 1, !dbg !2363
  %195 = load i32, ptr %8, align 4, !dbg !2364
  %196 = add i32 %195, 1, !dbg !2364
  store i32 %196, ptr %8, align 4, !dbg !2364
  br label %197

197:                                              ; preds = %187, %186
  br label %198

198:                                              ; preds = %197, %145
  br label %199

199:                                              ; preds = %198, %137
  br label %200

200:                                              ; preds = %199, %106
  br label %201

201:                                              ; preds = %200, %75
  %202 = load i32, ptr %7, align 4, !dbg !2365
  %203 = add i32 %202, 1, !dbg !2365
  store i32 %203, ptr %7, align 4, !dbg !2365
  br label %216, !dbg !2366

204:                                              ; preds = %28
  %205 = load ptr, ptr %5, align 4, !dbg !2367
  %206 = load i32, ptr %7, align 4, !dbg !2369
  %207 = getelementptr inbounds i8, ptr %205, i32 %206, !dbg !2367
  %208 = load i8, ptr %207, align 1, !dbg !2367
  %209 = load ptr, ptr %4, align 4, !dbg !2370
  %210 = load i32, ptr %8, align 4, !dbg !2371
  %211 = getelementptr inbounds i8, ptr %209, i32 %210, !dbg !2370
  store i8 %208, ptr %211, align 1, !dbg !2372
  %212 = load i32, ptr %7, align 4, !dbg !2373
  %213 = add i32 %212, 1, !dbg !2373
  store i32 %213, ptr %7, align 4, !dbg !2373
  %214 = load i32, ptr %8, align 4, !dbg !2374
  %215 = add i32 %214, 1, !dbg !2374
  store i32 %215, ptr %8, align 4, !dbg !2374
  br label %216

216:                                              ; preds = %204, %201
  br label %21, !dbg !2201, !llvm.loop !2375

217:                                              ; preds = %44, %21
  %218 = load ptr, ptr %4, align 4, !dbg !2377
  %219 = load i32, ptr %8, align 4, !dbg !2378
  %220 = getelementptr inbounds i8, ptr %218, i32 %219, !dbg !2377
  store i8 0, ptr %220, align 1, !dbg !2379
  %221 = load i32, ptr %8, align 4, !dbg !2380
  ret i32 %221, !dbg !2381
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__fizzer_model__helper_itoa(i32 noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !2382 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 4
  %6 = alloca i32, align 4
  %7 = alloca [32 x i8], align 1
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2386, metadata !DIExpression()), !dbg !2387
  store ptr %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2388, metadata !DIExpression()), !dbg !2389
  store i32 %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2390, metadata !DIExpression()), !dbg !2391
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2392, metadata !DIExpression()), !dbg !2393
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2394, metadata !DIExpression()), !dbg !2395
  store i32 0, ptr %8, align 4, !dbg !2395
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2396, metadata !DIExpression()), !dbg !2397
  store i32 0, ptr %9, align 4, !dbg !2397
  %12 = load i32, ptr %4, align 4, !dbg !2398
  %13 = icmp slt i32 %12, 0, !dbg !2400
  br i1 %13, label %14, label %20, !dbg !2401

14:                                               ; preds = %3
  %15 = load i32, ptr %6, align 4, !dbg !2402
  %16 = icmp eq i32 %15, 10, !dbg !2403
  br i1 %16, label %17, label %20, !dbg !2404

17:                                               ; preds = %14
  store i32 1, ptr %9, align 4, !dbg !2405
  %18 = load i32, ptr %4, align 4, !dbg !2407
  %19 = sub nsw i32 0, %18, !dbg !2408
  store i32 %19, ptr %4, align 4, !dbg !2409
  br label %20, !dbg !2410

20:                                               ; preds = %17, %14, %3
  %21 = load i32, ptr %4, align 4, !dbg !2411
  %22 = icmp eq i32 %21, 0, !dbg !2413
  br i1 %22, label %23, label %28, !dbg !2414

23:                                               ; preds = %20
  %24 = load ptr, ptr %5, align 4, !dbg !2415
  %25 = getelementptr inbounds i8, ptr %24, i32 0, !dbg !2415
  store i8 48, ptr %25, align 1, !dbg !2417
  %26 = load ptr, ptr %5, align 4, !dbg !2418
  %27 = getelementptr inbounds i8, ptr %26, i32 1, !dbg !2418
  store i8 0, ptr %27, align 1, !dbg !2419
  br label %85, !dbg !2420

28:                                               ; preds = %20
  br label %29, !dbg !2421

29:                                               ; preds = %51, %28
  %30 = load i32, ptr %4, align 4, !dbg !2422
  %31 = icmp ne i32 %30, 0, !dbg !2423
  br i1 %31, label %32, label %57, !dbg !2421

32:                                               ; preds = %29
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2424, metadata !DIExpression()), !dbg !2426
  %33 = load i32, ptr %4, align 4, !dbg !2427
  %34 = load i32, ptr %6, align 4, !dbg !2428
  %35 = srem i32 %33, %34, !dbg !2429
  store i32 %35, ptr %10, align 4, !dbg !2426
  %36 = load i32, ptr %10, align 4, !dbg !2430
  %37 = icmp slt i32 %36, 10, !dbg !2432
  br i1 %37, label %38, label %44, !dbg !2433

38:                                               ; preds = %32
  %39 = load i32, ptr %10, align 4, !dbg !2434
  %40 = add nsw i32 48, %39, !dbg !2436
  %41 = trunc i32 %40 to i8, !dbg !2437
  %42 = load i32, ptr %8, align 4, !dbg !2438
  %43 = getelementptr inbounds [32 x i8], ptr %7, i32 0, i32 %42, !dbg !2439
  store i8 %41, ptr %43, align 1, !dbg !2440
  br label %51, !dbg !2441

44:                                               ; preds = %32
  %45 = load i32, ptr %10, align 4, !dbg !2442
  %46 = sub nsw i32 %45, 10, !dbg !2444
  %47 = add nsw i32 97, %46, !dbg !2445
  %48 = trunc i32 %47 to i8, !dbg !2446
  %49 = load i32, ptr %8, align 4, !dbg !2447
  %50 = getelementptr inbounds [32 x i8], ptr %7, i32 0, i32 %49, !dbg !2448
  store i8 %48, ptr %50, align 1, !dbg !2449
  br label %51

51:                                               ; preds = %44, %38
  %52 = load i32, ptr %4, align 4, !dbg !2450
  %53 = load i32, ptr %6, align 4, !dbg !2451
  %54 = sdiv i32 %52, %53, !dbg !2452
  store i32 %54, ptr %4, align 4, !dbg !2453
  %55 = load i32, ptr %8, align 4, !dbg !2454
  %56 = add nsw i32 %55, 1, !dbg !2454
  store i32 %56, ptr %8, align 4, !dbg !2454
  br label %29, !dbg !2421, !llvm.loop !2455

57:                                               ; preds = %29
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2457, metadata !DIExpression()), !dbg !2458
  store i32 0, ptr %11, align 4, !dbg !2458
  %58 = load i32, ptr %9, align 4, !dbg !2459
  %59 = icmp ne i32 %58, 0, !dbg !2459
  br i1 %59, label %60, label %66, !dbg !2461

60:                                               ; preds = %57
  %61 = load ptr, ptr %5, align 4, !dbg !2462
  %62 = load i32, ptr %11, align 4, !dbg !2464
  %63 = getelementptr inbounds i8, ptr %61, i32 %62, !dbg !2462
  store i8 45, ptr %63, align 1, !dbg !2465
  %64 = load i32, ptr %11, align 4, !dbg !2466
  %65 = add nsw i32 %64, 1, !dbg !2466
  store i32 %65, ptr %11, align 4, !dbg !2466
  br label %66, !dbg !2467

66:                                               ; preds = %60, %57
  br label %67, !dbg !2468

67:                                               ; preds = %70, %66
  %68 = load i32, ptr %8, align 4, !dbg !2469
  %69 = icmp sgt i32 %68, 0, !dbg !2470
  br i1 %69, label %70, label %81, !dbg !2468

70:                                               ; preds = %67
  %71 = load i32, ptr %8, align 4, !dbg !2471
  %72 = add nsw i32 %71, -1, !dbg !2471
  store i32 %72, ptr %8, align 4, !dbg !2471
  %73 = load i32, ptr %8, align 4, !dbg !2473
  %74 = getelementptr inbounds [32 x i8], ptr %7, i32 0, i32 %73, !dbg !2474
  %75 = load i8, ptr %74, align 1, !dbg !2474
  %76 = load ptr, ptr %5, align 4, !dbg !2475
  %77 = load i32, ptr %11, align 4, !dbg !2476
  %78 = getelementptr inbounds i8, ptr %76, i32 %77, !dbg !2475
  store i8 %75, ptr %78, align 1, !dbg !2477
  %79 = load i32, ptr %11, align 4, !dbg !2478
  %80 = add nsw i32 %79, 1, !dbg !2478
  store i32 %80, ptr %11, align 4, !dbg !2478
  br label %67, !dbg !2468, !llvm.loop !2479

81:                                               ; preds = %67
  %82 = load ptr, ptr %5, align 4, !dbg !2481
  %83 = load i32, ptr %11, align 4, !dbg !2482
  %84 = getelementptr inbounds i8, ptr %82, i32 %83, !dbg !2481
  store i8 0, ptr %84, align 1, !dbg !2483
  br label %85, !dbg !2484

85:                                               ; preds = %81, %23
  ret void, !dbg !2484
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__vsnprintf(ptr noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !2485 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 4
  %9 = alloca ptr, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca [32 x i8], align 1
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 4
  store ptr %0, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2493, metadata !DIExpression()), !dbg !2494
  store i32 %1, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2495, metadata !DIExpression()), !dbg !2496
  store ptr %2, ptr %8, align 4
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2497, metadata !DIExpression()), !dbg !2498
  store ptr %3, ptr %9, align 4
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2499, metadata !DIExpression()), !dbg !2500
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2501, metadata !DIExpression()), !dbg !2502
  store i32 0, ptr %10, align 4, !dbg !2502
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2503, metadata !DIExpression()), !dbg !2504
  store i32 0, ptr %11, align 4, !dbg !2504
  %18 = load i32, ptr %7, align 4, !dbg !2505
  %19 = icmp eq i32 %18, 0, !dbg !2507
  br i1 %19, label %20, label %21, !dbg !2508

20:                                               ; preds = %4
  store i32 0, ptr %5, align 4, !dbg !2509
  br label %203, !dbg !2509

21:                                               ; preds = %4
  br label %22, !dbg !2511

22:                                               ; preds = %197, %143, %21
  %23 = load ptr, ptr %8, align 4, !dbg !2512
  %24 = load i32, ptr %10, align 4, !dbg !2513
  %25 = getelementptr inbounds i8, ptr %23, i32 %24, !dbg !2512
  %26 = load i8, ptr %25, align 1, !dbg !2512
  %27 = sext i8 %26 to i32, !dbg !2512
  %28 = icmp ne i32 %27, 0, !dbg !2514
  br i1 %28, label %29, label %34, !dbg !2515

29:                                               ; preds = %22
  %30 = load i32, ptr %11, align 4, !dbg !2516
  %31 = load i32, ptr %7, align 4, !dbg !2517
  %32 = sub i32 %31, 1, !dbg !2518
  %33 = icmp ult i32 %30, %32, !dbg !2519
  br label %34

34:                                               ; preds = %29, %22
  %35 = phi i1 [ false, %22 ], [ %33, %29 ], !dbg !2520
  br i1 %35, label %36, label %198, !dbg !2511

36:                                               ; preds = %34
  %37 = load ptr, ptr %8, align 4, !dbg !2521
  %38 = load i32, ptr %10, align 4, !dbg !2524
  %39 = getelementptr inbounds i8, ptr %37, i32 %38, !dbg !2521
  %40 = load i8, ptr %39, align 1, !dbg !2521
  %41 = sext i8 %40 to i32, !dbg !2521
  %42 = icmp eq i32 %41, 37, !dbg !2525
  br i1 %42, label %43, label %185, !dbg !2526

43:                                               ; preds = %36
  %44 = load i32, ptr %10, align 4, !dbg !2527
  %45 = add i32 %44, 1, !dbg !2527
  store i32 %45, ptr %10, align 4, !dbg !2527
  %46 = load ptr, ptr %8, align 4, !dbg !2529
  %47 = load i32, ptr %10, align 4, !dbg !2531
  %48 = getelementptr inbounds i8, ptr %46, i32 %47, !dbg !2529
  %49 = load i8, ptr %48, align 1, !dbg !2529
  %50 = sext i8 %49 to i32, !dbg !2529
  %51 = icmp eq i32 %50, 0, !dbg !2532
  br i1 %51, label %52, label %53, !dbg !2533

52:                                               ; preds = %43
  br label %198, !dbg !2534

53:                                               ; preds = %43
  call void @llvm.dbg.declare(metadata ptr %12, metadata !2536, metadata !DIExpression()), !dbg !2537
  call void @llvm.dbg.declare(metadata ptr %13, metadata !2538, metadata !DIExpression()), !dbg !2539
  store i32 0, ptr %13, align 4, !dbg !2539
  %54 = load ptr, ptr %8, align 4, !dbg !2540
  %55 = load i32, ptr %10, align 4, !dbg !2542
  %56 = getelementptr inbounds i8, ptr %54, i32 %55, !dbg !2540
  %57 = load i8, ptr %56, align 1, !dbg !2540
  %58 = sext i8 %57 to i32, !dbg !2540
  %59 = icmp eq i32 %58, 100, !dbg !2543
  br i1 %59, label %60, label %66, !dbg !2544

60:                                               ; preds = %53
  call void @llvm.dbg.declare(metadata ptr %14, metadata !2545, metadata !DIExpression()), !dbg !2547
  %61 = load ptr, ptr %9, align 4, !dbg !2548
  %62 = getelementptr inbounds i8, ptr %61, i32 4, !dbg !2548
  store ptr %62, ptr %9, align 4, !dbg !2548
  %63 = load i32, ptr %61, align 4, !dbg !2548
  store i32 %63, ptr %14, align 4, !dbg !2547
  %64 = load i32, ptr %14, align 4, !dbg !2549
  %65 = getelementptr inbounds [32 x i8], ptr %12, i32 0, i32 0, !dbg !2550
  call void @__fizzer_model__helper_itoa(i32 noundef %64, ptr noundef %65, i32 noundef 10), !dbg !2551
  br label %157, !dbg !2552

66:                                               ; preds = %53
  %67 = load ptr, ptr %8, align 4, !dbg !2553
  %68 = load i32, ptr %10, align 4, !dbg !2555
  %69 = getelementptr inbounds i8, ptr %67, i32 %68, !dbg !2553
  %70 = load i8, ptr %69, align 1, !dbg !2553
  %71 = sext i8 %70 to i32, !dbg !2553
  %72 = icmp eq i32 %71, 117, !dbg !2556
  br i1 %72, label %73, label %79, !dbg !2557

73:                                               ; preds = %66
  call void @llvm.dbg.declare(metadata ptr %15, metadata !2558, metadata !DIExpression()), !dbg !2560
  %74 = load ptr, ptr %9, align 4, !dbg !2561
  %75 = getelementptr inbounds i8, ptr %74, i32 4, !dbg !2561
  store ptr %75, ptr %9, align 4, !dbg !2561
  %76 = load i32, ptr %74, align 4, !dbg !2561
  store i32 %76, ptr %15, align 4, !dbg !2560
  %77 = load i32, ptr %15, align 4, !dbg !2562
  %78 = getelementptr inbounds [32 x i8], ptr %12, i32 0, i32 0, !dbg !2563
  call void @__fizzer_model__helper_itoa(i32 noundef %77, ptr noundef %78, i32 noundef 10), !dbg !2564
  br label %156, !dbg !2565

79:                                               ; preds = %66
  %80 = load ptr, ptr %8, align 4, !dbg !2566
  %81 = load i32, ptr %10, align 4, !dbg !2568
  %82 = getelementptr inbounds i8, ptr %80, i32 %81, !dbg !2566
  %83 = load i8, ptr %82, align 1, !dbg !2566
  %84 = sext i8 %83 to i32, !dbg !2566
  %85 = icmp eq i32 %84, 120, !dbg !2569
  br i1 %85, label %86, label %92, !dbg !2570

86:                                               ; preds = %79
  call void @llvm.dbg.declare(metadata ptr %16, metadata !2571, metadata !DIExpression()), !dbg !2573
  %87 = load ptr, ptr %9, align 4, !dbg !2574
  %88 = getelementptr inbounds i8, ptr %87, i32 4, !dbg !2574
  store ptr %88, ptr %9, align 4, !dbg !2574
  %89 = load i32, ptr %87, align 4, !dbg !2574
  store i32 %89, ptr %16, align 4, !dbg !2573
  %90 = load i32, ptr %16, align 4, !dbg !2575
  %91 = getelementptr inbounds [32 x i8], ptr %12, i32 0, i32 0, !dbg !2576
  call void @__fizzer_model__helper_itoa(i32 noundef %90, ptr noundef %91, i32 noundef 16), !dbg !2577
  br label %155, !dbg !2578

92:                                               ; preds = %79
  %93 = load ptr, ptr %8, align 4, !dbg !2579
  %94 = load i32, ptr %10, align 4, !dbg !2581
  %95 = getelementptr inbounds i8, ptr %93, i32 %94, !dbg !2579
  %96 = load i8, ptr %95, align 1, !dbg !2579
  %97 = sext i8 %96 to i32, !dbg !2579
  %98 = icmp eq i32 %97, 99, !dbg !2582
  br i1 %98, label %99, label %106, !dbg !2583

99:                                               ; preds = %92
  %100 = load ptr, ptr %9, align 4, !dbg !2584
  %101 = getelementptr inbounds i8, ptr %100, i32 4, !dbg !2584
  store ptr %101, ptr %9, align 4, !dbg !2584
  %102 = load i32, ptr %100, align 4, !dbg !2584
  %103 = trunc i32 %102 to i8, !dbg !2586
  %104 = getelementptr inbounds [32 x i8], ptr %12, i32 0, i32 0, !dbg !2587
  store i8 %103, ptr %104, align 1, !dbg !2588
  %105 = getelementptr inbounds [32 x i8], ptr %12, i32 0, i32 1, !dbg !2589
  store i8 0, ptr %105, align 1, !dbg !2590
  br label %154, !dbg !2591

106:                                              ; preds = %92
  %107 = load ptr, ptr %8, align 4, !dbg !2592
  %108 = load i32, ptr %10, align 4, !dbg !2594
  %109 = getelementptr inbounds i8, ptr %107, i32 %108, !dbg !2592
  %110 = load i8, ptr %109, align 1, !dbg !2592
  %111 = sext i8 %110 to i32, !dbg !2592
  %112 = icmp eq i32 %111, 115, !dbg !2595
  br i1 %112, label %113, label %146, !dbg !2596

113:                                              ; preds = %106
  call void @llvm.dbg.declare(metadata ptr %17, metadata !2597, metadata !DIExpression()), !dbg !2599
  %114 = load ptr, ptr %9, align 4, !dbg !2600
  %115 = getelementptr inbounds i8, ptr %114, i32 4, !dbg !2600
  store ptr %115, ptr %9, align 4, !dbg !2600
  %116 = load ptr, ptr %114, align 4, !dbg !2600
  store ptr %116, ptr %17, align 4, !dbg !2599
  store i32 0, ptr %13, align 4, !dbg !2601
  br label %117, !dbg !2602

117:                                              ; preds = %131, %113
  %118 = load ptr, ptr %17, align 4, !dbg !2603
  %119 = load i32, ptr %13, align 4, !dbg !2604
  %120 = getelementptr inbounds i8, ptr %118, i32 %119, !dbg !2603
  %121 = load i8, ptr %120, align 1, !dbg !2603
  %122 = sext i8 %121 to i32, !dbg !2603
  %123 = icmp ne i32 %122, 0, !dbg !2605
  br i1 %123, label %124, label %129, !dbg !2606

124:                                              ; preds = %117
  %125 = load i32, ptr %11, align 4, !dbg !2607
  %126 = load i32, ptr %7, align 4, !dbg !2608
  %127 = sub i32 %126, 1, !dbg !2609
  %128 = icmp ult i32 %125, %127, !dbg !2610
  br label %129

129:                                              ; preds = %124, %117
  %130 = phi i1 [ false, %117 ], [ %128, %124 ], !dbg !2611
  br i1 %130, label %131, label %143, !dbg !2602

131:                                              ; preds = %129
  %132 = load ptr, ptr %17, align 4, !dbg !2612
  %133 = load i32, ptr %13, align 4, !dbg !2614
  %134 = getelementptr inbounds i8, ptr %132, i32 %133, !dbg !2612
  %135 = load i8, ptr %134, align 1, !dbg !2612
  %136 = load ptr, ptr %6, align 4, !dbg !2615
  %137 = load i32, ptr %11, align 4, !dbg !2616
  %138 = getelementptr inbounds i8, ptr %136, i32 %137, !dbg !2615
  store i8 %135, ptr %138, align 1, !dbg !2617
  %139 = load i32, ptr %11, align 4, !dbg !2618
  %140 = add i32 %139, 1, !dbg !2618
  store i32 %140, ptr %11, align 4, !dbg !2618
  %141 = load i32, ptr %13, align 4, !dbg !2619
  %142 = add i32 %141, 1, !dbg !2619
  store i32 %142, ptr %13, align 4, !dbg !2619
  br label %117, !dbg !2602, !llvm.loop !2620

143:                                              ; preds = %129
  %144 = load i32, ptr %10, align 4, !dbg !2622
  %145 = add i32 %144, 1, !dbg !2622
  store i32 %145, ptr %10, align 4, !dbg !2622
  br label %22, !dbg !2623, !llvm.loop !2624

146:                                              ; preds = %106
  %147 = load ptr, ptr %8, align 4, !dbg !2626
  %148 = load i32, ptr %10, align 4, !dbg !2628
  %149 = getelementptr inbounds i8, ptr %147, i32 %148, !dbg !2626
  %150 = load i8, ptr %149, align 1, !dbg !2626
  %151 = getelementptr inbounds [32 x i8], ptr %12, i32 0, i32 0, !dbg !2629
  store i8 %150, ptr %151, align 1, !dbg !2630
  %152 = getelementptr inbounds [32 x i8], ptr %12, i32 0, i32 1, !dbg !2631
  store i8 0, ptr %152, align 1, !dbg !2632
  br label %153

153:                                              ; preds = %146
  br label %154

154:                                              ; preds = %153, %99
  br label %155

155:                                              ; preds = %154, %86
  br label %156

156:                                              ; preds = %155, %73
  br label %157

157:                                              ; preds = %156, %60
  store i32 0, ptr %13, align 4, !dbg !2633
  br label %158, !dbg !2634

158:                                              ; preds = %171, %157
  %159 = load i32, ptr %13, align 4, !dbg !2635
  %160 = getelementptr inbounds [32 x i8], ptr %12, i32 0, i32 %159, !dbg !2636
  %161 = load i8, ptr %160, align 1, !dbg !2636
  %162 = sext i8 %161 to i32, !dbg !2636
  %163 = icmp ne i32 %162, 0, !dbg !2637
  br i1 %163, label %164, label %169, !dbg !2638

164:                                              ; preds = %158
  %165 = load i32, ptr %11, align 4, !dbg !2639
  %166 = load i32, ptr %7, align 4, !dbg !2640
  %167 = sub i32 %166, 1, !dbg !2641
  %168 = icmp ult i32 %165, %167, !dbg !2642
  br label %169

169:                                              ; preds = %164, %158
  %170 = phi i1 [ false, %158 ], [ %168, %164 ], !dbg !2643
  br i1 %170, label %171, label %182, !dbg !2634

171:                                              ; preds = %169
  %172 = load i32, ptr %13, align 4, !dbg !2644
  %173 = getelementptr inbounds [32 x i8], ptr %12, i32 0, i32 %172, !dbg !2646
  %174 = load i8, ptr %173, align 1, !dbg !2646
  %175 = load ptr, ptr %6, align 4, !dbg !2647
  %176 = load i32, ptr %11, align 4, !dbg !2648
  %177 = getelementptr inbounds i8, ptr %175, i32 %176, !dbg !2647
  store i8 %174, ptr %177, align 1, !dbg !2649
  %178 = load i32, ptr %11, align 4, !dbg !2650
  %179 = add i32 %178, 1, !dbg !2650
  store i32 %179, ptr %11, align 4, !dbg !2650
  %180 = load i32, ptr %13, align 4, !dbg !2651
  %181 = add i32 %180, 1, !dbg !2651
  store i32 %181, ptr %13, align 4, !dbg !2651
  br label %158, !dbg !2634, !llvm.loop !2652

182:                                              ; preds = %169
  %183 = load i32, ptr %10, align 4, !dbg !2654
  %184 = add i32 %183, 1, !dbg !2654
  store i32 %184, ptr %10, align 4, !dbg !2654
  br label %197, !dbg !2655

185:                                              ; preds = %36
  %186 = load ptr, ptr %8, align 4, !dbg !2656
  %187 = load i32, ptr %10, align 4, !dbg !2658
  %188 = getelementptr inbounds i8, ptr %186, i32 %187, !dbg !2656
  %189 = load i8, ptr %188, align 1, !dbg !2656
  %190 = load ptr, ptr %6, align 4, !dbg !2659
  %191 = load i32, ptr %11, align 4, !dbg !2660
  %192 = getelementptr inbounds i8, ptr %190, i32 %191, !dbg !2659
  store i8 %189, ptr %192, align 1, !dbg !2661
  %193 = load i32, ptr %10, align 4, !dbg !2662
  %194 = add i32 %193, 1, !dbg !2662
  store i32 %194, ptr %10, align 4, !dbg !2662
  %195 = load i32, ptr %11, align 4, !dbg !2663
  %196 = add i32 %195, 1, !dbg !2663
  store i32 %196, ptr %11, align 4, !dbg !2663
  br label %197

197:                                              ; preds = %185, %182
  br label %22, !dbg !2511, !llvm.loop !2624

198:                                              ; preds = %52, %34
  %199 = load ptr, ptr %6, align 4, !dbg !2664
  %200 = load i32, ptr %11, align 4, !dbg !2665
  %201 = getelementptr inbounds i8, ptr %199, i32 %200, !dbg !2664
  store i8 0, ptr %201, align 1, !dbg !2666
  %202 = load i32, ptr %11, align 4, !dbg !2667
  store i32 %202, ptr %5, align 4, !dbg !2668
  br label %203, !dbg !2668

203:                                              ; preds = %198, %20
  %204 = load i32, ptr %5, align 4, !dbg !2669
  ret i32 %204, !dbg !2669
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local x86_fp80 @__fizzer_model__fabsl(x86_fp80 noundef %0) #0 !dbg !2670 {
  %2 = alloca x86_fp80, align 4
  %3 = alloca x86_fp80, align 4
  store x86_fp80 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2675, metadata !DIExpression()), !dbg !2676
  %4 = load x86_fp80, ptr %3, align 4, !dbg !2677
  %5 = fcmp olt x86_fp80 %4, 0xK00000000000000000000, !dbg !2679
  br i1 %5, label %6, label %9, !dbg !2680

6:                                                ; preds = %1
  %7 = load x86_fp80, ptr %3, align 4, !dbg !2681
  %8 = fneg x86_fp80 %7, !dbg !2682
  store x86_fp80 %8, ptr %2, align 4, !dbg !2683
  br label %11, !dbg !2683

9:                                                ; preds = %1
  %10 = load x86_fp80, ptr %3, align 4, !dbg !2684
  store x86_fp80 %10, ptr %2, align 4, !dbg !2685
  br label %11, !dbg !2685

11:                                               ; preds = %9, %6
  %12 = load x86_fp80, ptr %2, align 4, !dbg !2686
  ret x86_fp80 %12, !dbg !2686
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @__fizzer_model__fabs(double noundef %0) #0 !dbg !2687 {
  %2 = alloca double, align 4
  %3 = alloca double, align 8
  store double %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2691, metadata !DIExpression()), !dbg !2692
  %4 = load double, ptr %3, align 8, !dbg !2693
  %5 = fcmp olt double %4, 0.000000e+00, !dbg !2695
  br i1 %5, label %6, label %9, !dbg !2696

6:                                                ; preds = %1
  %7 = load double, ptr %3, align 8, !dbg !2697
  %8 = fneg double %7, !dbg !2698
  store double %8, ptr %2, align 4, !dbg !2699
  br label %11, !dbg !2699

9:                                                ; preds = %1
  %10 = load double, ptr %3, align 8, !dbg !2700
  store double %10, ptr %2, align 4, !dbg !2701
  br label %11, !dbg !2701

11:                                               ; preds = %9, %6
  %12 = load double, ptr %2, align 4, !dbg !2702
  ret double %12, !dbg !2702
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @__fizzer_model__fabsf(float noundef %0) #0 !dbg !2703 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  store float %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2708, metadata !DIExpression()), !dbg !2709
  %4 = load float, ptr %3, align 4, !dbg !2710
  %5 = fcmp olt float %4, 0.000000e+00, !dbg !2712
  br i1 %5, label %6, label %9, !dbg !2713

6:                                                ; preds = %1
  %7 = load float, ptr %3, align 4, !dbg !2714
  %8 = fneg float %7, !dbg !2715
  store float %8, ptr %2, align 4, !dbg !2716
  br label %11, !dbg !2716

9:                                                ; preds = %1
  %10 = load float, ptr %3, align 4, !dbg !2717
  store float %10, ptr %2, align 4, !dbg !2718
  br label %11, !dbg !2718

11:                                               ; preds = %9, %6
  %12 = load float, ptr %2, align 4, !dbg !2719
  ret float %12, !dbg !2719
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strftime(ptr noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !2720 {
  %5 = alloca ptr, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 4
  %8 = alloca ptr, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca [16 x i8], align 1
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store ptr %0, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2744, metadata !DIExpression()), !dbg !2745
  store i32 %1, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2746, metadata !DIExpression()), !dbg !2747
  store ptr %2, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2748, metadata !DIExpression()), !dbg !2749
  store ptr %3, ptr %8, align 4
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2750, metadata !DIExpression()), !dbg !2751
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2752, metadata !DIExpression()), !dbg !2753
  store i32 0, ptr %9, align 4, !dbg !2753
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2754, metadata !DIExpression()), !dbg !2755
  store i32 0, ptr %10, align 4, !dbg !2755
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2756, metadata !DIExpression()), !dbg !2757
  br label %19, !dbg !2758

19:                                               ; preds = %182, %4
  %20 = load ptr, ptr %7, align 4, !dbg !2759
  %21 = load i32, ptr %9, align 4, !dbg !2760
  %22 = getelementptr inbounds i8, ptr %20, i32 %21, !dbg !2759
  %23 = load i8, ptr %22, align 1, !dbg !2759
  %24 = sext i8 %23 to i32, !dbg !2759
  %25 = icmp ne i32 %24, 0, !dbg !2761
  br i1 %25, label %26, label %31, !dbg !2762

26:                                               ; preds = %19
  %27 = load i32, ptr %10, align 4, !dbg !2763
  %28 = load i32, ptr %6, align 4, !dbg !2764
  %29 = sub i32 %28, 1, !dbg !2765
  %30 = icmp ult i32 %27, %29, !dbg !2766
  br label %31

31:                                               ; preds = %26, %19
  %32 = phi i1 [ false, %19 ], [ %30, %26 ], !dbg !2767
  br i1 %32, label %33, label %183, !dbg !2758

33:                                               ; preds = %31
  %34 = load ptr, ptr %7, align 4, !dbg !2768
  %35 = load i32, ptr %9, align 4, !dbg !2771
  %36 = getelementptr inbounds i8, ptr %34, i32 %35, !dbg !2768
  %37 = load i8, ptr %36, align 1, !dbg !2768
  %38 = sext i8 %37 to i32, !dbg !2768
  %39 = icmp eq i32 %38, 37, !dbg !2772
  br i1 %39, label %40, label %170, !dbg !2773

40:                                               ; preds = %33
  %41 = load i32, ptr %9, align 4, !dbg !2774
  %42 = add i32 %41, 1, !dbg !2774
  store i32 %42, ptr %9, align 4, !dbg !2774
  %43 = load ptr, ptr %7, align 4, !dbg !2776
  %44 = load i32, ptr %9, align 4, !dbg !2778
  %45 = getelementptr inbounds i8, ptr %43, i32 %44, !dbg !2776
  %46 = load i8, ptr %45, align 1, !dbg !2776
  %47 = sext i8 %46 to i32, !dbg !2776
  %48 = icmp eq i32 %47, 0, !dbg !2779
  br i1 %48, label %49, label %50, !dbg !2780

49:                                               ; preds = %40
  br label %183, !dbg !2781

50:                                               ; preds = %40
  call void @llvm.dbg.declare(metadata ptr %12, metadata !2783, metadata !DIExpression()), !dbg !2784
  store i32 0, ptr %12, align 4, !dbg !2784
  %51 = load ptr, ptr %7, align 4, !dbg !2785
  %52 = load i32, ptr %9, align 4, !dbg !2787
  %53 = getelementptr inbounds i8, ptr %51, i32 %52, !dbg !2785
  %54 = load i8, ptr %53, align 1, !dbg !2785
  %55 = sext i8 %54 to i32, !dbg !2785
  %56 = icmp eq i32 %55, 89, !dbg !2788
  br i1 %56, label %57, label %64, !dbg !2789

57:                                               ; preds = %50
  call void @llvm.dbg.declare(metadata ptr %13, metadata !2790, metadata !DIExpression()), !dbg !2792
  %58 = load ptr, ptr %8, align 4, !dbg !2793
  %59 = getelementptr inbounds %struct.tm, ptr %58, i32 0, i32 5, !dbg !2794
  %60 = load i32, ptr %59, align 4, !dbg !2794
  %61 = add nsw i32 1900, %60, !dbg !2795
  store i32 %61, ptr %13, align 4, !dbg !2792
  %62 = load i32, ptr %13, align 4, !dbg !2796
  %63 = getelementptr inbounds [16 x i8], ptr %11, i32 0, i32 0, !dbg !2797
  call void @__fizzer_model__helper_itoa(i32 noundef %62, ptr noundef %63, i32 noundef 10), !dbg !2798
  br label %142, !dbg !2799

64:                                               ; preds = %50
  %65 = load ptr, ptr %7, align 4, !dbg !2800
  %66 = load i32, ptr %9, align 4, !dbg !2802
  %67 = getelementptr inbounds i8, ptr %65, i32 %66, !dbg !2800
  %68 = load i8, ptr %67, align 1, !dbg !2800
  %69 = sext i8 %68 to i32, !dbg !2800
  %70 = icmp eq i32 %69, 109, !dbg !2803
  br i1 %70, label %71, label %78, !dbg !2804

71:                                               ; preds = %64
  call void @llvm.dbg.declare(metadata ptr %14, metadata !2805, metadata !DIExpression()), !dbg !2807
  %72 = load ptr, ptr %8, align 4, !dbg !2808
  %73 = getelementptr inbounds %struct.tm, ptr %72, i32 0, i32 4, !dbg !2809
  %74 = load i32, ptr %73, align 4, !dbg !2809
  %75 = add nsw i32 %74, 1, !dbg !2810
  store i32 %75, ptr %14, align 4, !dbg !2807
  %76 = load i32, ptr %14, align 4, !dbg !2811
  %77 = getelementptr inbounds [16 x i8], ptr %11, i32 0, i32 0, !dbg !2812
  call void @__fizzer_model__helper_itoa(i32 noundef %76, ptr noundef %77, i32 noundef 10), !dbg !2813
  br label %141, !dbg !2814

78:                                               ; preds = %64
  %79 = load ptr, ptr %7, align 4, !dbg !2815
  %80 = load i32, ptr %9, align 4, !dbg !2817
  %81 = getelementptr inbounds i8, ptr %79, i32 %80, !dbg !2815
  %82 = load i8, ptr %81, align 1, !dbg !2815
  %83 = sext i8 %82 to i32, !dbg !2815
  %84 = icmp eq i32 %83, 100, !dbg !2818
  br i1 %84, label %85, label %91, !dbg !2819

85:                                               ; preds = %78
  call void @llvm.dbg.declare(metadata ptr %15, metadata !2820, metadata !DIExpression()), !dbg !2822
  %86 = load ptr, ptr %8, align 4, !dbg !2823
  %87 = getelementptr inbounds %struct.tm, ptr %86, i32 0, i32 3, !dbg !2824
  %88 = load i32, ptr %87, align 4, !dbg !2824
  store i32 %88, ptr %15, align 4, !dbg !2822
  %89 = load i32, ptr %15, align 4, !dbg !2825
  %90 = getelementptr inbounds [16 x i8], ptr %11, i32 0, i32 0, !dbg !2826
  call void @__fizzer_model__helper_itoa(i32 noundef %89, ptr noundef %90, i32 noundef 10), !dbg !2827
  br label %140, !dbg !2828

91:                                               ; preds = %78
  %92 = load ptr, ptr %7, align 4, !dbg !2829
  %93 = load i32, ptr %9, align 4, !dbg !2831
  %94 = getelementptr inbounds i8, ptr %92, i32 %93, !dbg !2829
  %95 = load i8, ptr %94, align 1, !dbg !2829
  %96 = sext i8 %95 to i32, !dbg !2829
  %97 = icmp eq i32 %96, 72, !dbg !2832
  br i1 %97, label %98, label %104, !dbg !2833

98:                                               ; preds = %91
  call void @llvm.dbg.declare(metadata ptr %16, metadata !2834, metadata !DIExpression()), !dbg !2836
  %99 = load ptr, ptr %8, align 4, !dbg !2837
  %100 = getelementptr inbounds %struct.tm, ptr %99, i32 0, i32 2, !dbg !2838
  %101 = load i32, ptr %100, align 4, !dbg !2838
  store i32 %101, ptr %16, align 4, !dbg !2836
  %102 = load i32, ptr %16, align 4, !dbg !2839
  %103 = getelementptr inbounds [16 x i8], ptr %11, i32 0, i32 0, !dbg !2840
  call void @__fizzer_model__helper_itoa(i32 noundef %102, ptr noundef %103, i32 noundef 10), !dbg !2841
  br label %139, !dbg !2842

104:                                              ; preds = %91
  %105 = load ptr, ptr %7, align 4, !dbg !2843
  %106 = load i32, ptr %9, align 4, !dbg !2845
  %107 = getelementptr inbounds i8, ptr %105, i32 %106, !dbg !2843
  %108 = load i8, ptr %107, align 1, !dbg !2843
  %109 = sext i8 %108 to i32, !dbg !2843
  %110 = icmp eq i32 %109, 77, !dbg !2846
  br i1 %110, label %111, label %117, !dbg !2847

111:                                              ; preds = %104
  call void @llvm.dbg.declare(metadata ptr %17, metadata !2848, metadata !DIExpression()), !dbg !2850
  %112 = load ptr, ptr %8, align 4, !dbg !2851
  %113 = getelementptr inbounds %struct.tm, ptr %112, i32 0, i32 1, !dbg !2852
  %114 = load i32, ptr %113, align 4, !dbg !2852
  store i32 %114, ptr %17, align 4, !dbg !2850
  %115 = load i32, ptr %17, align 4, !dbg !2853
  %116 = getelementptr inbounds [16 x i8], ptr %11, i32 0, i32 0, !dbg !2854
  call void @__fizzer_model__helper_itoa(i32 noundef %115, ptr noundef %116, i32 noundef 10), !dbg !2855
  br label %138, !dbg !2856

117:                                              ; preds = %104
  %118 = load ptr, ptr %7, align 4, !dbg !2857
  %119 = load i32, ptr %9, align 4, !dbg !2859
  %120 = getelementptr inbounds i8, ptr %118, i32 %119, !dbg !2857
  %121 = load i8, ptr %120, align 1, !dbg !2857
  %122 = sext i8 %121 to i32, !dbg !2857
  %123 = icmp eq i32 %122, 83, !dbg !2860
  br i1 %123, label %124, label %130, !dbg !2861

124:                                              ; preds = %117
  call void @llvm.dbg.declare(metadata ptr %18, metadata !2862, metadata !DIExpression()), !dbg !2864
  %125 = load ptr, ptr %8, align 4, !dbg !2865
  %126 = getelementptr inbounds %struct.tm, ptr %125, i32 0, i32 0, !dbg !2866
  %127 = load i32, ptr %126, align 4, !dbg !2866
  store i32 %127, ptr %18, align 4, !dbg !2864
  %128 = load i32, ptr %18, align 4, !dbg !2867
  %129 = getelementptr inbounds [16 x i8], ptr %11, i32 0, i32 0, !dbg !2868
  call void @__fizzer_model__helper_itoa(i32 noundef %128, ptr noundef %129, i32 noundef 10), !dbg !2869
  br label %137, !dbg !2870

130:                                              ; preds = %117
  %131 = load ptr, ptr %7, align 4, !dbg !2871
  %132 = load i32, ptr %9, align 4, !dbg !2873
  %133 = getelementptr inbounds i8, ptr %131, i32 %132, !dbg !2871
  %134 = load i8, ptr %133, align 1, !dbg !2871
  %135 = getelementptr inbounds [16 x i8], ptr %11, i32 0, i32 0, !dbg !2874
  store i8 %134, ptr %135, align 1, !dbg !2875
  %136 = getelementptr inbounds [16 x i8], ptr %11, i32 0, i32 1, !dbg !2876
  store i8 0, ptr %136, align 1, !dbg !2877
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
  store i32 0, ptr %12, align 4, !dbg !2878
  br label %143, !dbg !2879

143:                                              ; preds = %156, %142
  %144 = load i32, ptr %12, align 4, !dbg !2880
  %145 = getelementptr inbounds [16 x i8], ptr %11, i32 0, i32 %144, !dbg !2881
  %146 = load i8, ptr %145, align 1, !dbg !2881
  %147 = sext i8 %146 to i32, !dbg !2881
  %148 = icmp ne i32 %147, 0, !dbg !2882
  br i1 %148, label %149, label %154, !dbg !2883

149:                                              ; preds = %143
  %150 = load i32, ptr %10, align 4, !dbg !2884
  %151 = load i32, ptr %6, align 4, !dbg !2885
  %152 = sub i32 %151, 1, !dbg !2886
  %153 = icmp ult i32 %150, %152, !dbg !2887
  br label %154

154:                                              ; preds = %149, %143
  %155 = phi i1 [ false, %143 ], [ %153, %149 ], !dbg !2888
  br i1 %155, label %156, label %167, !dbg !2879

156:                                              ; preds = %154
  %157 = load i32, ptr %12, align 4, !dbg !2889
  %158 = getelementptr inbounds [16 x i8], ptr %11, i32 0, i32 %157, !dbg !2891
  %159 = load i8, ptr %158, align 1, !dbg !2891
  %160 = load ptr, ptr %5, align 4, !dbg !2892
  %161 = load i32, ptr %10, align 4, !dbg !2893
  %162 = getelementptr inbounds i8, ptr %160, i32 %161, !dbg !2892
  store i8 %159, ptr %162, align 1, !dbg !2894
  %163 = load i32, ptr %10, align 4, !dbg !2895
  %164 = add i32 %163, 1, !dbg !2895
  store i32 %164, ptr %10, align 4, !dbg !2895
  %165 = load i32, ptr %12, align 4, !dbg !2896
  %166 = add nsw i32 %165, 1, !dbg !2896
  store i32 %166, ptr %12, align 4, !dbg !2896
  br label %143, !dbg !2879, !llvm.loop !2897

167:                                              ; preds = %154
  %168 = load i32, ptr %9, align 4, !dbg !2899
  %169 = add i32 %168, 1, !dbg !2899
  store i32 %169, ptr %9, align 4, !dbg !2899
  br label %182, !dbg !2900

170:                                              ; preds = %33
  %171 = load ptr, ptr %7, align 4, !dbg !2901
  %172 = load i32, ptr %9, align 4, !dbg !2903
  %173 = getelementptr inbounds i8, ptr %171, i32 %172, !dbg !2901
  %174 = load i8, ptr %173, align 1, !dbg !2901
  %175 = load ptr, ptr %5, align 4, !dbg !2904
  %176 = load i32, ptr %10, align 4, !dbg !2905
  %177 = getelementptr inbounds i8, ptr %175, i32 %176, !dbg !2904
  store i8 %174, ptr %177, align 1, !dbg !2906
  %178 = load i32, ptr %9, align 4, !dbg !2907
  %179 = add i32 %178, 1, !dbg !2907
  store i32 %179, ptr %9, align 4, !dbg !2907
  %180 = load i32, ptr %10, align 4, !dbg !2908
  %181 = add i32 %180, 1, !dbg !2908
  store i32 %181, ptr %10, align 4, !dbg !2908
  br label %182

182:                                              ; preds = %170, %167
  br label %19, !dbg !2758, !llvm.loop !2909

183:                                              ; preds = %49, %31
  %184 = load ptr, ptr %5, align 4, !dbg !2911
  %185 = load i32, ptr %10, align 4, !dbg !2912
  %186 = getelementptr inbounds i8, ptr %184, i32 %185, !dbg !2911
  store i8 0, ptr %186, align 1, !dbg !2913
  %187 = load i32, ptr %10, align 4, !dbg !2914
  ret i32 %187, !dbg !2915
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__ctime(ptr noundef %0, ptr noundef %1) #0 !dbg !2916 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca [26 x i8], align 1
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2924, metadata !DIExpression()), !dbg !2925
  store ptr %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2926, metadata !DIExpression()), !dbg !2927
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2928, metadata !DIExpression()), !dbg !2930
  call void @llvm.memcpy.p0.p0.i32(ptr align 1 %5, ptr align 1 @__const.__fizzer_model__ctime.template, i32 26, i1 false), !dbg !2930
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2931, metadata !DIExpression()), !dbg !2933
  store i32 0, ptr %6, align 4, !dbg !2933
  br label %7, !dbg !2934

7:                                                ; preds = %13, %2
  %8 = load i32, ptr %6, align 4, !dbg !2935
  %9 = getelementptr inbounds [26 x i8], ptr %5, i32 0, i32 %8, !dbg !2936
  %10 = load i8, ptr %9, align 1, !dbg !2936
  %11 = sext i8 %10 to i32, !dbg !2936
  %12 = icmp ne i32 %11, 0, !dbg !2937
  br i1 %12, label %13, label %22, !dbg !2934

13:                                               ; preds = %7
  %14 = load i32, ptr %6, align 4, !dbg !2938
  %15 = getelementptr inbounds [26 x i8], ptr %5, i32 0, i32 %14, !dbg !2940
  %16 = load i8, ptr %15, align 1, !dbg !2940
  %17 = load ptr, ptr %4, align 4, !dbg !2941
  %18 = load i32, ptr %6, align 4, !dbg !2942
  %19 = getelementptr inbounds i8, ptr %17, i32 %18, !dbg !2941
  store i8 %16, ptr %19, align 1, !dbg !2943
  %20 = load i32, ptr %6, align 4, !dbg !2944
  %21 = add i32 %20, 1, !dbg !2944
  store i32 %21, ptr %6, align 4, !dbg !2944
  br label %7, !dbg !2934, !llvm.loop !2945

22:                                               ; preds = %7
  %23 = load ptr, ptr %4, align 4, !dbg !2947
  %24 = load i32, ptr %6, align 4, !dbg !2948
  %25 = getelementptr inbounds i8, ptr %23, i32 %24, !dbg !2947
  store i8 0, ptr %25, align 1, !dbg !2949
  %26 = load ptr, ptr %4, align 4, !dbg !2950
  ret ptr %26, !dbg !2951
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i32, i1 immarg) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="i686" "target-features"="+cmov,+cx8,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.dbg.cu = !{!2, !78, !9, !81, !17, !23, !83, !85, !89, !91, !93, !95, !98, !100, !102, !104, !106, !108, !110, !112, !114, !118, !120, !123, !126, !128, !130, !132, !33, !134, !140, !75, !142, !144, !146, !148, !150, !152, !154, !156, !158, !160, !162, !164, !166, !168, !170, !172, !174, !177, !179, !181, !183, !185, !187, !189}
!llvm.module.flags = !{!191, !192, !193, !194, !195, !196, !197, !198}
!llvm.ident = !{!199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199, !199}

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
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 32)
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
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 32)
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
!137 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !138, size: 32)
!138 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !117)
!139 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 32)
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
!191 = !{i32 1, !"NumRegisterParameters", i32 0}
!192 = !{i32 7, !"Dwarf Version", i32 5}
!193 = !{i32 2, !"Debug Info Version", i32 3}
!194 = !{i32 1, !"wchar_size", i32 4}
!195 = !{i32 8, !"PIC Level", i32 2}
!196 = !{i32 7, !"PIE Level", i32 2}
!197 = !{i32 7, !"uwtable", i32 2}
!198 = !{i32 7, !"frame-pointer", i32 2}
!199 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!200 = distinct !DISubprogram(name: "__fizzer_model__getopt_long", scope: !201, file: !201, line: 3, type: !202, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !78, retainedNodes: !63)
!201 = !DIFile(filename: "data/models/c/posix/getopt_long.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "de123133f6a530da5006cce09eb75639")
!202 = !DISubroutineType(types: !203)
!203 = !{!6, !6, !204, !73, !206, !214}
!204 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !205, size: 32)
!205 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!206 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !207, size: 32)
!207 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !208)
!208 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "option", file: !209, line: 50, size: 128, elements: !210)
!209 = !DIFile(filename: "/usr/include/bits/getopt_ext.h", directory: "", checksumkind: CSK_MD5, checksum: "3b9516601798e99ca8a1ad9f5208e7ec")
!210 = !{!211, !212, !213, !215}
!211 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !208, file: !209, line: 52, baseType: !73, size: 32)
!212 = !DIDerivedType(tag: DW_TAG_member, name: "has_arg", scope: !208, file: !209, line: 55, baseType: !6, size: 32, offset: 32)
!213 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !208, file: !209, line: 56, baseType: !214, size: 32, offset: 64)
!214 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 32)
!215 = !DIDerivedType(tag: DW_TAG_member, name: "val", scope: !208, file: !209, line: 57, baseType: !6, size: 32, offset: 96)
!216 = !DILocalVariable(name: "argc", arg: 1, scope: !200, file: !201, line: 3, type: !6)
!217 = !DILocation(line: 3, column: 37, scope: !200)
!218 = !DILocalVariable(name: "argv", arg: 2, scope: !200, file: !201, line: 3, type: !204)
!219 = !DILocation(line: 3, column: 56, scope: !200)
!220 = !DILocalVariable(name: "optstring", arg: 3, scope: !200, file: !201, line: 3, type: !73)
!221 = !DILocation(line: 3, column: 76, scope: !200)
!222 = !DILocalVariable(name: "longopts", arg: 4, scope: !200, file: !201, line: 4, type: !206)
!223 = !DILocation(line: 4, column: 54, scope: !200)
!224 = !DILocalVariable(name: "longindex", arg: 5, scope: !200, file: !201, line: 4, type: !214)
!225 = !DILocation(line: 4, column: 69, scope: !200)
!226 = !DILocation(line: 6, column: 9, scope: !227)
!227 = distinct !DILexicalBlock(scope: !200, file: !201, line: 6, column: 9)
!228 = !DILocation(line: 6, column: 35, scope: !227)
!229 = !DILocation(line: 6, column: 32, scope: !227)
!230 = !DILocation(line: 6, column: 9, scope: !200)
!231 = !DILocation(line: 8, column: 9, scope: !232)
!232 = distinct !DILexicalBlock(scope: !227, file: !201, line: 7, column: 5)
!233 = !DILocalVariable(name: "current", scope: !200, file: !201, line: 11, type: !13)
!234 = !DILocation(line: 11, column: 11, scope: !200)
!235 = !DILocation(line: 11, column: 21, scope: !200)
!236 = !DILocation(line: 11, column: 26, scope: !200)
!237 = !DILocation(line: 13, column: 9, scope: !238)
!238 = distinct !DILexicalBlock(scope: !200, file: !201, line: 13, column: 9)
!239 = !DILocation(line: 13, column: 20, scope: !238)
!240 = !DILocation(line: 13, column: 27, scope: !238)
!241 = !DILocation(line: 13, column: 30, scope: !238)
!242 = !DILocation(line: 13, column: 41, scope: !238)
!243 = !DILocation(line: 13, column: 9, scope: !200)
!244 = !DILocation(line: 15, column: 39, scope: !245)
!245 = distinct !DILexicalBlock(scope: !238, file: !201, line: 14, column: 5)
!246 = !DILocation(line: 15, column: 45, scope: !245)
!247 = !DILocation(line: 15, column: 51, scope: !245)
!248 = !DILocation(line: 15, column: 16, scope: !245)
!249 = !DILocation(line: 15, column: 9, scope: !245)
!250 = !DILocalVariable(name: "i", scope: !200, file: !201, line: 18, type: !251)
!251 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !252, line: 8, baseType: !253)
!252 = !DIFile(filename: "data/models/c/posix/getopt_long.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "df33a0efdb11040b8d720c7550c383ff")
!253 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!254 = !DILocation(line: 18, column: 12, scope: !200)
!255 = !DILocation(line: 19, column: 5, scope: !200)
!256 = !DILocation(line: 19, column: 12, scope: !200)
!257 = !DILocation(line: 19, column: 21, scope: !200)
!258 = !DILocation(line: 19, column: 24, scope: !200)
!259 = !DILocation(line: 19, column: 29, scope: !200)
!260 = !DILocalVariable(name: "j", scope: !261, file: !201, line: 21, type: !251)
!261 = distinct !DILexicalBlock(scope: !200, file: !201, line: 20, column: 5)
!262 = !DILocation(line: 21, column: 16, scope: !261)
!263 = !DILocalVariable(name: "match", scope: !261, file: !201, line: 22, type: !6)
!264 = !DILocation(line: 22, column: 13, scope: !261)
!265 = !DILocation(line: 24, column: 9, scope: !261)
!266 = !DILocation(line: 24, column: 16, scope: !261)
!267 = !DILocation(line: 24, column: 25, scope: !261)
!268 = !DILocation(line: 24, column: 28, scope: !261)
!269 = !DILocation(line: 24, column: 33, scope: !261)
!270 = !DILocation(line: 24, column: 36, scope: !261)
!271 = !DILocation(line: 24, column: 41, scope: !261)
!272 = !DILocation(line: 24, column: 44, scope: !261)
!273 = !DILocation(line: 24, column: 56, scope: !261)
!274 = !DILocation(line: 24, column: 54, scope: !261)
!275 = !DILocation(line: 24, column: 59, scope: !261)
!276 = !DILocation(line: 0, scope: !261)
!277 = !DILocation(line: 26, column: 17, scope: !278)
!278 = distinct !DILexicalBlock(scope: !279, file: !201, line: 26, column: 17)
!279 = distinct !DILexicalBlock(scope: !261, file: !201, line: 25, column: 9)
!280 = !DILocation(line: 26, column: 26, scope: !278)
!281 = !DILocation(line: 26, column: 29, scope: !278)
!282 = !DILocation(line: 26, column: 34, scope: !278)
!283 = !DILocation(line: 26, column: 40, scope: !278)
!284 = !DILocation(line: 26, column: 52, scope: !278)
!285 = !DILocation(line: 26, column: 50, scope: !278)
!286 = !DILocation(line: 26, column: 37, scope: !278)
!287 = !DILocation(line: 26, column: 17, scope: !279)
!288 = !DILocation(line: 28, column: 23, scope: !289)
!289 = distinct !DILexicalBlock(scope: !278, file: !201, line: 27, column: 13)
!290 = !DILocation(line: 29, column: 17, scope: !289)
!291 = !DILocation(line: 31, column: 14, scope: !279)
!292 = distinct !{!292, !265, !293, !294}
!293 = !DILocation(line: 32, column: 9, scope: !261)
!294 = !{!"llvm.loop.mustprogress"}
!295 = !DILocation(line: 34, column: 13, scope: !296)
!296 = distinct !DILexicalBlock(scope: !261, file: !201, line: 34, column: 13)
!297 = !DILocation(line: 34, column: 19, scope: !296)
!298 = !DILocation(line: 34, column: 22, scope: !296)
!299 = !DILocation(line: 34, column: 31, scope: !296)
!300 = !DILocation(line: 34, column: 34, scope: !296)
!301 = !DILocation(line: 34, column: 39, scope: !296)
!302 = !DILocation(line: 34, column: 42, scope: !296)
!303 = !DILocation(line: 34, column: 47, scope: !296)
!304 = !DILocation(line: 34, column: 50, scope: !296)
!305 = !DILocation(line: 34, column: 62, scope: !296)
!306 = !DILocation(line: 34, column: 60, scope: !296)
!307 = !DILocation(line: 34, column: 65, scope: !296)
!308 = !DILocation(line: 34, column: 13, scope: !261)
!309 = !DILocation(line: 36, column: 17, scope: !310)
!310 = distinct !DILexicalBlock(scope: !311, file: !201, line: 36, column: 17)
!311 = distinct !DILexicalBlock(scope: !296, file: !201, line: 35, column: 9)
!312 = !DILocation(line: 36, column: 27, scope: !310)
!313 = !DILocation(line: 36, column: 17, scope: !311)
!314 = !DILocation(line: 38, column: 35, scope: !315)
!315 = distinct !DILexicalBlock(scope: !310, file: !201, line: 37, column: 13)
!316 = !DILocation(line: 38, column: 18, scope: !315)
!317 = !DILocation(line: 38, column: 28, scope: !315)
!318 = !DILocation(line: 39, column: 13, scope: !315)
!319 = !DILocation(line: 41, column: 17, scope: !320)
!320 = distinct !DILexicalBlock(scope: !311, file: !201, line: 41, column: 17)
!321 = !DILocation(line: 41, column: 26, scope: !320)
!322 = !DILocation(line: 41, column: 29, scope: !320)
!323 = !DILocation(line: 41, column: 37, scope: !320)
!324 = !DILocation(line: 41, column: 17, scope: !311)
!325 = !DILocation(line: 43, column: 21, scope: !326)
!326 = distinct !DILexicalBlock(scope: !327, file: !201, line: 43, column: 21)
!327 = distinct !DILexicalBlock(scope: !320, file: !201, line: 42, column: 13)
!328 = !DILocation(line: 43, column: 44, scope: !326)
!329 = !DILocation(line: 43, column: 50, scope: !326)
!330 = !DILocation(line: 43, column: 48, scope: !326)
!331 = !DILocation(line: 43, column: 21, scope: !327)
!332 = !DILocation(line: 45, column: 46, scope: !333)
!333 = distinct !DILexicalBlock(scope: !326, file: !201, line: 44, column: 17)
!334 = !DILocation(line: 45, column: 51, scope: !333)
!335 = !DILocation(line: 45, column: 74, scope: !333)
!336 = !DILocation(line: 45, column: 44, scope: !333)
!337 = !DILocation(line: 46, column: 44, scope: !333)
!338 = !DILocation(line: 47, column: 17, scope: !333)
!339 = !DILocation(line: 50, column: 44, scope: !340)
!340 = distinct !DILexicalBlock(scope: !326, file: !201, line: 49, column: 17)
!341 = !DILocation(line: 51, column: 43, scope: !340)
!342 = !DILocation(line: 53, column: 13, scope: !327)
!343 = !DILocation(line: 56, column: 40, scope: !344)
!344 = distinct !DILexicalBlock(scope: !320, file: !201, line: 55, column: 13)
!345 = !DILocation(line: 57, column: 39, scope: !344)
!346 = !DILocation(line: 60, column: 17, scope: !347)
!347 = distinct !DILexicalBlock(scope: !311, file: !201, line: 60, column: 17)
!348 = !DILocation(line: 60, column: 26, scope: !347)
!349 = !DILocation(line: 60, column: 29, scope: !347)
!350 = !DILocation(line: 60, column: 34, scope: !347)
!351 = !DILocation(line: 60, column: 17, scope: !311)
!352 = !DILocation(line: 62, column: 37, scope: !353)
!353 = distinct !DILexicalBlock(scope: !347, file: !201, line: 61, column: 13)
!354 = !DILocation(line: 62, column: 46, scope: !353)
!355 = !DILocation(line: 62, column: 49, scope: !353)
!356 = !DILocation(line: 62, column: 18, scope: !353)
!357 = !DILocation(line: 62, column: 27, scope: !353)
!358 = !DILocation(line: 62, column: 30, scope: !353)
!359 = !DILocation(line: 62, column: 35, scope: !353)
!360 = !DILocation(line: 63, column: 17, scope: !353)
!361 = !DILocation(line: 66, column: 20, scope: !311)
!362 = !DILocation(line: 66, column: 29, scope: !311)
!363 = !DILocation(line: 66, column: 32, scope: !311)
!364 = !DILocation(line: 66, column: 13, scope: !311)
!365 = !DILocation(line: 69, column: 10, scope: !261)
!366 = distinct !{!366, !255, !367, !294}
!367 = !DILocation(line: 70, column: 5, scope: !200)
!368 = !DILocation(line: 72, column: 27, scope: !200)
!369 = !DILocation(line: 73, column: 5, scope: !200)
!370 = !DILocation(line: 74, column: 1, scope: !200)
!371 = distinct !DISubprogram(name: "__fizzer_model__getopt", scope: !372, file: !372, line: 2, type: !373, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !81, retainedNodes: !63)
!372 = !DIFile(filename: "data/models/c/posix/getopt.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "f654b476831f33a28b3fae574c027426")
!373 = !DISubroutineType(types: !374)
!374 = !{!6, !6, !204, !73}
!375 = !DILocalVariable(name: "argc", arg: 1, scope: !371, file: !372, line: 2, type: !6)
!376 = !DILocation(line: 2, column: 32, scope: !371)
!377 = !DILocalVariable(name: "argv", arg: 2, scope: !371, file: !372, line: 2, type: !204)
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
!405 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !406, line: 8, baseType: !253)
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
!425 = distinct !{!425, !410, !426, !294}
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
!491 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !492, line: 8, baseType: !253)
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
!505 = distinct !{!505, !494, !506, !294}
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
!542 = distinct !{!542, !524, !543, !294}
!543 = !DILocation(line: 27, column: 5, scope: !479)
!544 = !DILocation(line: 29, column: 12, scope: !479)
!545 = !DILocation(line: 29, column: 19, scope: !479)
!546 = !DILocation(line: 29, column: 17, scope: !479)
!547 = !DILocation(line: 29, column: 5, scope: !479)
!548 = distinct !DISubprogram(name: "__fizzer_model__strtod", scope: !549, file: !549, line: 2, type: !550, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !85, retainedNodes: !63)
!549 = !DIFile(filename: "data/models/c/std/stdlib/strtod.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "8af3db33fabf3d592277f51247d76438")
!550 = !DISubroutineType(types: !551)
!551 = !{!88, !73, !552}
!552 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 32)
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
!570 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !571, line: 8, baseType: !253)
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
!584 = distinct !{!584, !573, !585, !294}
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
!620 = distinct !{!620, !603, !621, !294}
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
!650 = distinct !{!650, !629, !651, !294}
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
!706 = distinct !{!706, !688, !707, !294}
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
!738 = distinct !{!738, !730, !739, !294}
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
!779 = !DIBasicType(name: "long", size: 32, encoding: DW_ATE_signed)
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
!823 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !824, line: 8, baseType: !253)
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
!852 = distinct !{!852, !841, !853, !294}
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
!888 = !DILocation(line: 37, column: 30, scope: !883)
!889 = !DILocation(line: 37, column: 16, scope: !883)
!890 = !DILocation(line: 38, column: 10, scope: !883)
!891 = distinct !{!891, !874, !892, !294}
!892 = !DILocation(line: 39, column: 5, scope: !808)
!893 = !DILocation(line: 41, column: 9, scope: !894)
!894 = distinct !DILexicalBlock(scope: !808, file: !809, line: 41, column: 9)
!895 = !DILocation(line: 41, column: 16, scope: !894)
!896 = !DILocation(line: 41, column: 9, scope: !808)
!897 = !DILocation(line: 43, column: 28, scope: !898)
!898 = distinct !DILexicalBlock(scope: !894, file: !809, line: 42, column: 5)
!899 = !DILocation(line: 43, column: 35, scope: !898)
!900 = !DILocation(line: 43, column: 33, scope: !898)
!901 = !DILocation(line: 43, column: 10, scope: !898)
!902 = !DILocation(line: 43, column: 17, scope: !898)
!903 = !DILocation(line: 44, column: 5, scope: !898)
!904 = !DILocation(line: 46, column: 12, scope: !808)
!905 = !DILocation(line: 46, column: 19, scope: !808)
!906 = !DILocation(line: 46, column: 17, scope: !808)
!907 = !DILocation(line: 46, column: 5, scope: !808)
!908 = !DILocation(line: 47, column: 1, scope: !808)
!909 = distinct !DISubprogram(name: "__fizzer_model__atol", scope: !910, file: !910, line: 2, type: !911, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !98, retainedNodes: !63)
!910 = !DIFile(filename: "data/models/c/std/stdlib/atol.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "130864a3e56f877c17dbd6cd172158db")
!911 = !DISubroutineType(types: !912)
!912 = !{!779, !73}
!913 = !DILocalVariable(name: "nptr", arg: 1, scope: !909, file: !910, line: 2, type: !73)
!914 = !DILocation(line: 2, column: 39, scope: !909)
!915 = !DILocalVariable(name: "result", scope: !909, file: !910, line: 4, type: !779)
!916 = !DILocation(line: 4, column: 10, scope: !909)
!917 = !DILocalVariable(name: "sign", scope: !909, file: !910, line: 5, type: !6)
!918 = !DILocation(line: 5, column: 9, scope: !909)
!919 = !DILocalVariable(name: "i", scope: !909, file: !910, line: 6, type: !920)
!920 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !921, line: 8, baseType: !253)
!921 = !DIFile(filename: "data/models/c/std/stdlib/atol.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "1fd40bbb4fabb448cf5666fb2ad7f378")
!922 = !DILocation(line: 6, column: 12, scope: !909)
!923 = !DILocation(line: 8, column: 5, scope: !909)
!924 = !DILocation(line: 8, column: 12, scope: !909)
!925 = !DILocation(line: 8, column: 17, scope: !909)
!926 = !DILocation(line: 8, column: 20, scope: !909)
!927 = !DILocation(line: 8, column: 25, scope: !909)
!928 = !DILocation(line: 8, column: 52, scope: !909)
!929 = !DILocation(line: 8, column: 57, scope: !909)
!930 = !DILocation(line: 8, column: 28, scope: !909)
!931 = !DILocation(line: 0, scope: !909)
!932 = !DILocation(line: 10, column: 10, scope: !933)
!933 = distinct !DILexicalBlock(scope: !909, file: !910, line: 9, column: 5)
!934 = distinct !{!934, !923, !935, !294}
!935 = !DILocation(line: 11, column: 5, scope: !909)
!936 = !DILocation(line: 13, column: 9, scope: !937)
!937 = distinct !DILexicalBlock(scope: !909, file: !910, line: 13, column: 9)
!938 = !DILocation(line: 13, column: 14, scope: !937)
!939 = !DILocation(line: 13, column: 17, scope: !937)
!940 = !DILocation(line: 13, column: 9, scope: !909)
!941 = !DILocation(line: 15, column: 10, scope: !942)
!942 = distinct !DILexicalBlock(scope: !937, file: !910, line: 14, column: 5)
!943 = !DILocation(line: 16, column: 5, scope: !942)
!944 = !DILocation(line: 17, column: 14, scope: !945)
!945 = distinct !DILexicalBlock(scope: !937, file: !910, line: 17, column: 14)
!946 = !DILocation(line: 17, column: 19, scope: !945)
!947 = !DILocation(line: 17, column: 22, scope: !945)
!948 = !DILocation(line: 17, column: 14, scope: !937)
!949 = !DILocation(line: 19, column: 14, scope: !950)
!950 = distinct !DILexicalBlock(scope: !945, file: !910, line: 18, column: 5)
!951 = !DILocation(line: 20, column: 10, scope: !950)
!952 = !DILocation(line: 21, column: 5, scope: !950)
!953 = !DILocation(line: 23, column: 5, scope: !909)
!954 = !DILocation(line: 23, column: 12, scope: !909)
!955 = !DILocation(line: 23, column: 17, scope: !909)
!956 = !DILocation(line: 23, column: 20, scope: !909)
!957 = !DILocation(line: 23, column: 25, scope: !909)
!958 = !DILocation(line: 23, column: 52, scope: !909)
!959 = !DILocation(line: 23, column: 57, scope: !909)
!960 = !DILocation(line: 23, column: 28, scope: !909)
!961 = !DILocation(line: 25, column: 18, scope: !962)
!962 = distinct !DILexicalBlock(scope: !909, file: !910, line: 24, column: 5)
!963 = !DILocation(line: 25, column: 25, scope: !962)
!964 = !DILocation(line: 25, column: 33, scope: !962)
!965 = !DILocation(line: 25, column: 38, scope: !962)
!966 = !DILocation(line: 25, column: 41, scope: !962)
!967 = !DILocation(line: 25, column: 30, scope: !962)
!968 = !DILocation(line: 25, column: 16, scope: !962)
!969 = !DILocation(line: 26, column: 10, scope: !962)
!970 = distinct !{!970, !953, !971, !294}
!971 = !DILocation(line: 27, column: 5, scope: !909)
!972 = !DILocation(line: 29, column: 12, scope: !909)
!973 = !DILocation(line: 29, column: 19, scope: !909)
!974 = !DILocation(line: 29, column: 17, scope: !909)
!975 = !DILocation(line: 29, column: 5, scope: !909)
!976 = distinct !DISubprogram(name: "__fizzer_model__strtoul", scope: !977, file: !977, line: 2, type: !978, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !63)
!977 = !DIFile(filename: "data/models/c/std/stdlib/strtoul.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "edaf3dbca4ae2e5ae7dd393d65e176da")
!978 = !DISubroutineType(types: !979)
!979 = !{!980, !73, !552, !6}
!980 = !DIBasicType(name: "unsigned long", size: 32, encoding: DW_ATE_unsigned)
!981 = !DILocalVariable(name: "nptr", arg: 1, scope: !976, file: !977, line: 2, type: !73)
!982 = !DILocation(line: 2, column: 51, scope: !976)
!983 = !DILocalVariable(name: "endptr", arg: 2, scope: !976, file: !977, line: 2, type: !552)
!984 = !DILocation(line: 2, column: 64, scope: !976)
!985 = !DILocalVariable(name: "base", arg: 3, scope: !976, file: !977, line: 2, type: !6)
!986 = !DILocation(line: 2, column: 76, scope: !976)
!987 = !DILocalVariable(name: "result", scope: !976, file: !977, line: 4, type: !980)
!988 = !DILocation(line: 4, column: 19, scope: !976)
!989 = !DILocalVariable(name: "i", scope: !976, file: !977, line: 5, type: !990)
!990 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !991, line: 8, baseType: !253)
!991 = !DIFile(filename: "data/models/c/std/stdlib/strtoul.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "34874f151f8ea8334fcbf34c096cdb20")
!992 = !DILocation(line: 5, column: 12, scope: !976)
!993 = !DILocation(line: 7, column: 9, scope: !994)
!994 = distinct !DILexicalBlock(scope: !976, file: !977, line: 7, column: 9)
!995 = !DILocation(line: 7, column: 14, scope: !994)
!996 = !DILocation(line: 7, column: 9, scope: !976)
!997 = !DILocation(line: 9, column: 13, scope: !998)
!998 = distinct !DILexicalBlock(scope: !999, file: !977, line: 9, column: 13)
!999 = distinct !DILexicalBlock(scope: !994, file: !977, line: 8, column: 5)
!1000 = !DILocation(line: 9, column: 20, scope: !998)
!1001 = !DILocation(line: 9, column: 13, scope: !999)
!1002 = !DILocation(line: 11, column: 31, scope: !1003)
!1003 = distinct !DILexicalBlock(scope: !998, file: !977, line: 10, column: 9)
!1004 = !DILocation(line: 11, column: 14, scope: !1003)
!1005 = !DILocation(line: 11, column: 21, scope: !1003)
!1006 = !DILocation(line: 12, column: 9, scope: !1003)
!1007 = !DILocation(line: 13, column: 9, scope: !999)
!1008 = !DILocation(line: 16, column: 5, scope: !976)
!1009 = !DILocation(line: 16, column: 12, scope: !976)
!1010 = !DILocation(line: 16, column: 17, scope: !976)
!1011 = !DILocation(line: 16, column: 20, scope: !976)
!1012 = !DILocation(line: 16, column: 25, scope: !976)
!1013 = !DILocation(line: 16, column: 52, scope: !976)
!1014 = !DILocation(line: 16, column: 57, scope: !976)
!1015 = !DILocation(line: 16, column: 28, scope: !976)
!1016 = !DILocation(line: 0, scope: !976)
!1017 = !DILocation(line: 18, column: 10, scope: !1018)
!1018 = distinct !DILexicalBlock(scope: !976, file: !977, line: 17, column: 5)
!1019 = distinct !{!1019, !1008, !1020, !294}
!1020 = !DILocation(line: 19, column: 5, scope: !976)
!1021 = !DILocation(line: 22, column: 9, scope: !1022)
!1022 = distinct !DILexicalBlock(scope: !976, file: !977, line: 22, column: 9)
!1023 = !DILocation(line: 22, column: 14, scope: !1022)
!1024 = !DILocation(line: 22, column: 17, scope: !1022)
!1025 = !DILocation(line: 22, column: 9, scope: !976)
!1026 = !DILocation(line: 24, column: 10, scope: !1027)
!1027 = distinct !DILexicalBlock(scope: !1022, file: !977, line: 23, column: 5)
!1028 = !DILocation(line: 25, column: 5, scope: !1027)
!1029 = !DILocalVariable(name: "start", scope: !976, file: !977, line: 27, type: !990)
!1030 = !DILocation(line: 27, column: 12, scope: !976)
!1031 = !DILocation(line: 27, column: 20, scope: !976)
!1032 = !DILocation(line: 29, column: 5, scope: !976)
!1033 = !DILocation(line: 29, column: 12, scope: !976)
!1034 = !DILocation(line: 29, column: 17, scope: !976)
!1035 = !DILocation(line: 29, column: 20, scope: !976)
!1036 = !DILocation(line: 29, column: 25, scope: !976)
!1037 = !DILocation(line: 29, column: 52, scope: !976)
!1038 = !DILocation(line: 29, column: 57, scope: !976)
!1039 = !DILocation(line: 29, column: 28, scope: !976)
!1040 = !DILocation(line: 31, column: 18, scope: !1041)
!1041 = distinct !DILexicalBlock(scope: !976, file: !977, line: 30, column: 5)
!1042 = !DILocation(line: 31, column: 25, scope: !1041)
!1043 = !DILocation(line: 31, column: 33, scope: !1041)
!1044 = !DILocation(line: 31, column: 38, scope: !1041)
!1045 = !DILocation(line: 31, column: 41, scope: !1041)
!1046 = !DILocation(line: 31, column: 30, scope: !1041)
!1047 = !DILocation(line: 31, column: 16, scope: !1041)
!1048 = !DILocation(line: 32, column: 10, scope: !1041)
!1049 = distinct !{!1049, !1032, !1050, !294}
!1050 = !DILocation(line: 33, column: 5, scope: !976)
!1051 = !DILocation(line: 35, column: 9, scope: !1052)
!1052 = distinct !DILexicalBlock(scope: !976, file: !977, line: 35, column: 9)
!1053 = !DILocation(line: 35, column: 16, scope: !1052)
!1054 = !DILocation(line: 35, column: 9, scope: !976)
!1055 = !DILocation(line: 37, column: 28, scope: !1056)
!1056 = distinct !DILexicalBlock(scope: !1052, file: !977, line: 36, column: 5)
!1057 = !DILocation(line: 37, column: 35, scope: !1056)
!1058 = !DILocation(line: 37, column: 33, scope: !1056)
!1059 = !DILocation(line: 37, column: 10, scope: !1056)
!1060 = !DILocation(line: 37, column: 17, scope: !1056)
!1061 = !DILocation(line: 38, column: 5, scope: !1056)
!1062 = !DILocation(line: 40, column: 12, scope: !976)
!1063 = !DILocation(line: 40, column: 5, scope: !976)
!1064 = !DILocation(line: 41, column: 1, scope: !976)
!1065 = distinct !DISubprogram(name: "__fizzer_model__atoi", scope: !1066, file: !1066, line: 2, type: !1067, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !102, retainedNodes: !63)
!1066 = !DIFile(filename: "data/models/c/std/stdlib/atoi.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "25ff8cf0c3b1eb16133d1fa2f6f4599f")
!1067 = !DISubroutineType(types: !1068)
!1068 = !{!6, !73}
!1069 = !DILocalVariable(name: "nptr", arg: 1, scope: !1065, file: !1066, line: 2, type: !73)
!1070 = !DILocation(line: 2, column: 38, scope: !1065)
!1071 = !DILocalVariable(name: "result", scope: !1065, file: !1066, line: 4, type: !6)
!1072 = !DILocation(line: 4, column: 9, scope: !1065)
!1073 = !DILocalVariable(name: "sign", scope: !1065, file: !1066, line: 5, type: !6)
!1074 = !DILocation(line: 5, column: 9, scope: !1065)
!1075 = !DILocalVariable(name: "i", scope: !1065, file: !1066, line: 6, type: !1076)
!1076 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1077, line: 8, baseType: !253)
!1077 = !DIFile(filename: "data/models/c/std/stdlib/atoi.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "7570ed2f727a93bc5429216171743e1c")
!1078 = !DILocation(line: 6, column: 12, scope: !1065)
!1079 = !DILocation(line: 9, column: 5, scope: !1065)
!1080 = !DILocation(line: 9, column: 12, scope: !1065)
!1081 = !DILocation(line: 9, column: 17, scope: !1065)
!1082 = !DILocation(line: 9, column: 20, scope: !1065)
!1083 = !DILocation(line: 9, column: 25, scope: !1065)
!1084 = !DILocation(line: 9, column: 52, scope: !1065)
!1085 = !DILocation(line: 9, column: 57, scope: !1065)
!1086 = !DILocation(line: 9, column: 28, scope: !1065)
!1087 = !DILocation(line: 0, scope: !1065)
!1088 = !DILocation(line: 11, column: 10, scope: !1089)
!1089 = distinct !DILexicalBlock(scope: !1065, file: !1066, line: 10, column: 5)
!1090 = distinct !{!1090, !1079, !1091, !294}
!1091 = !DILocation(line: 12, column: 5, scope: !1065)
!1092 = !DILocation(line: 15, column: 9, scope: !1093)
!1093 = distinct !DILexicalBlock(scope: !1065, file: !1066, line: 15, column: 9)
!1094 = !DILocation(line: 15, column: 14, scope: !1093)
!1095 = !DILocation(line: 15, column: 17, scope: !1093)
!1096 = !DILocation(line: 15, column: 9, scope: !1065)
!1097 = !DILocation(line: 17, column: 10, scope: !1098)
!1098 = distinct !DILexicalBlock(scope: !1093, file: !1066, line: 16, column: 5)
!1099 = !DILocation(line: 18, column: 5, scope: !1098)
!1100 = !DILocation(line: 19, column: 14, scope: !1101)
!1101 = distinct !DILexicalBlock(scope: !1093, file: !1066, line: 19, column: 14)
!1102 = !DILocation(line: 19, column: 19, scope: !1101)
!1103 = !DILocation(line: 19, column: 22, scope: !1101)
!1104 = !DILocation(line: 19, column: 14, scope: !1093)
!1105 = !DILocation(line: 21, column: 14, scope: !1106)
!1106 = distinct !DILexicalBlock(scope: !1101, file: !1066, line: 20, column: 5)
!1107 = !DILocation(line: 22, column: 10, scope: !1106)
!1108 = !DILocation(line: 23, column: 5, scope: !1106)
!1109 = !DILocation(line: 26, column: 5, scope: !1065)
!1110 = !DILocation(line: 26, column: 12, scope: !1065)
!1111 = !DILocation(line: 26, column: 17, scope: !1065)
!1112 = !DILocation(line: 26, column: 20, scope: !1065)
!1113 = !DILocation(line: 26, column: 25, scope: !1065)
!1114 = !DILocation(line: 26, column: 52, scope: !1065)
!1115 = !DILocation(line: 26, column: 57, scope: !1065)
!1116 = !DILocation(line: 26, column: 28, scope: !1065)
!1117 = !DILocation(line: 28, column: 18, scope: !1118)
!1118 = distinct !DILexicalBlock(scope: !1065, file: !1066, line: 27, column: 5)
!1119 = !DILocation(line: 28, column: 25, scope: !1118)
!1120 = !DILocation(line: 28, column: 33, scope: !1118)
!1121 = !DILocation(line: 28, column: 38, scope: !1118)
!1122 = !DILocation(line: 28, column: 41, scope: !1118)
!1123 = !DILocation(line: 28, column: 30, scope: !1118)
!1124 = !DILocation(line: 28, column: 16, scope: !1118)
!1125 = !DILocation(line: 29, column: 10, scope: !1118)
!1126 = distinct !{!1126, !1109, !1127, !294}
!1127 = !DILocation(line: 30, column: 5, scope: !1065)
!1128 = !DILocation(line: 32, column: 12, scope: !1065)
!1129 = !DILocation(line: 32, column: 19, scope: !1065)
!1130 = !DILocation(line: 32, column: 17, scope: !1065)
!1131 = !DILocation(line: 32, column: 5, scope: !1065)
!1132 = distinct !DISubprogram(name: "__fizzer_model__strstr", scope: !1133, file: !1133, line: 2, type: !1134, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !104, retainedNodes: !63)
!1133 = !DIFile(filename: "data/models/c/std/string/strstr.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "88fd7ab45b37086df2d2f42655100238")
!1134 = !DISubroutineType(types: !1135)
!1135 = !{!13, !73, !73}
!1136 = !DILocalVariable(name: "haystack", arg: 1, scope: !1132, file: !1133, line: 2, type: !73)
!1137 = !DILocation(line: 2, column: 42, scope: !1132)
!1138 = !DILocalVariable(name: "needle", arg: 2, scope: !1132, file: !1133, line: 2, type: !73)
!1139 = !DILocation(line: 2, column: 64, scope: !1132)
!1140 = !DILocation(line: 4, column: 10, scope: !1141)
!1141 = distinct !DILexicalBlock(scope: !1132, file: !1133, line: 4, column: 9)
!1142 = !DILocation(line: 4, column: 9, scope: !1141)
!1143 = !DILocation(line: 4, column: 17, scope: !1141)
!1144 = !DILocation(line: 4, column: 9, scope: !1132)
!1145 = !DILocation(line: 6, column: 24, scope: !1146)
!1146 = distinct !DILexicalBlock(scope: !1141, file: !1133, line: 5, column: 5)
!1147 = !DILocation(line: 6, column: 9, scope: !1146)
!1148 = !DILocation(line: 8, column: 5, scope: !1132)
!1149 = !DILocation(line: 8, column: 13, scope: !1132)
!1150 = !DILocation(line: 8, column: 12, scope: !1132)
!1151 = !DILocation(line: 8, column: 22, scope: !1132)
!1152 = !DILocalVariable(name: "h", scope: !1153, file: !1133, line: 10, type: !73)
!1153 = distinct !DILexicalBlock(scope: !1132, file: !1133, line: 9, column: 5)
!1154 = !DILocation(line: 10, column: 21, scope: !1153)
!1155 = !DILocation(line: 10, column: 25, scope: !1153)
!1156 = !DILocalVariable(name: "n", scope: !1153, file: !1133, line: 11, type: !73)
!1157 = !DILocation(line: 11, column: 21, scope: !1153)
!1158 = !DILocation(line: 11, column: 25, scope: !1153)
!1159 = !DILocation(line: 12, column: 9, scope: !1153)
!1160 = !DILocation(line: 12, column: 17, scope: !1153)
!1161 = !DILocation(line: 12, column: 16, scope: !1153)
!1162 = !DILocation(line: 12, column: 19, scope: !1153)
!1163 = !DILocation(line: 12, column: 24, scope: !1153)
!1164 = !DILocation(line: 12, column: 28, scope: !1153)
!1165 = !DILocation(line: 12, column: 27, scope: !1153)
!1166 = !DILocation(line: 12, column: 30, scope: !1153)
!1167 = !DILocation(line: 12, column: 35, scope: !1153)
!1168 = !DILocation(line: 12, column: 39, scope: !1153)
!1169 = !DILocation(line: 12, column: 38, scope: !1153)
!1170 = !DILocation(line: 12, column: 45, scope: !1153)
!1171 = !DILocation(line: 12, column: 44, scope: !1153)
!1172 = !DILocation(line: 12, column: 41, scope: !1153)
!1173 = !DILocation(line: 0, scope: !1153)
!1174 = !DILocation(line: 14, column: 14, scope: !1175)
!1175 = distinct !DILexicalBlock(scope: !1153, file: !1133, line: 13, column: 9)
!1176 = !DILocation(line: 15, column: 14, scope: !1175)
!1177 = distinct !{!1177, !1159, !1178, !294}
!1178 = !DILocation(line: 16, column: 9, scope: !1153)
!1179 = !DILocation(line: 17, column: 14, scope: !1180)
!1180 = distinct !DILexicalBlock(scope: !1153, file: !1133, line: 17, column: 13)
!1181 = !DILocation(line: 17, column: 13, scope: !1180)
!1182 = !DILocation(line: 17, column: 16, scope: !1180)
!1183 = !DILocation(line: 17, column: 13, scope: !1153)
!1184 = !DILocation(line: 19, column: 28, scope: !1185)
!1185 = distinct !DILexicalBlock(scope: !1180, file: !1133, line: 18, column: 9)
!1186 = !DILocation(line: 19, column: 13, scope: !1185)
!1187 = !DILocation(line: 21, column: 17, scope: !1153)
!1188 = distinct !{!1188, !1148, !1189, !294}
!1189 = !DILocation(line: 22, column: 5, scope: !1132)
!1190 = !DILocation(line: 23, column: 5, scope: !1132)
!1191 = !DILocation(line: 24, column: 1, scope: !1132)
!1192 = distinct !DISubprogram(name: "__fizzer_model__strpbrk", scope: !1193, file: !1193, line: 2, type: !1134, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !106, retainedNodes: !63)
!1193 = !DIFile(filename: "data/models/c/std/string/strpbrk.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "f90ee9e8ce652e3236917e969fe7e0af")
!1194 = !DILocalVariable(name: "s", arg: 1, scope: !1192, file: !1193, line: 2, type: !73)
!1195 = !DILocation(line: 2, column: 43, scope: !1192)
!1196 = !DILocalVariable(name: "accept", arg: 2, scope: !1192, file: !1193, line: 2, type: !73)
!1197 = !DILocation(line: 2, column: 58, scope: !1192)
!1198 = !DILocation(line: 4, column: 5, scope: !1192)
!1199 = !DILocation(line: 4, column: 13, scope: !1192)
!1200 = !DILocation(line: 4, column: 12, scope: !1192)
!1201 = !DILocation(line: 4, column: 15, scope: !1192)
!1202 = !DILocalVariable(name: "a", scope: !1203, file: !1193, line: 6, type: !73)
!1203 = distinct !DILexicalBlock(scope: !1192, file: !1193, line: 5, column: 5)
!1204 = !DILocation(line: 6, column: 21, scope: !1203)
!1205 = !DILocation(line: 6, column: 25, scope: !1203)
!1206 = !DILocation(line: 7, column: 9, scope: !1203)
!1207 = !DILocation(line: 7, column: 17, scope: !1203)
!1208 = !DILocation(line: 7, column: 16, scope: !1203)
!1209 = !DILocation(line: 7, column: 19, scope: !1203)
!1210 = !DILocation(line: 9, column: 18, scope: !1211)
!1211 = distinct !DILexicalBlock(scope: !1212, file: !1193, line: 9, column: 17)
!1212 = distinct !DILexicalBlock(scope: !1203, file: !1193, line: 8, column: 9)
!1213 = !DILocation(line: 9, column: 17, scope: !1211)
!1214 = !DILocation(line: 9, column: 24, scope: !1211)
!1215 = !DILocation(line: 9, column: 23, scope: !1211)
!1216 = !DILocation(line: 9, column: 20, scope: !1211)
!1217 = !DILocation(line: 9, column: 17, scope: !1212)
!1218 = !DILocation(line: 11, column: 32, scope: !1219)
!1219 = distinct !DILexicalBlock(scope: !1211, file: !1193, line: 10, column: 13)
!1220 = !DILocation(line: 11, column: 17, scope: !1219)
!1221 = !DILocation(line: 13, column: 14, scope: !1212)
!1222 = distinct !{!1222, !1206, !1223, !294}
!1223 = !DILocation(line: 14, column: 9, scope: !1203)
!1224 = !DILocation(line: 15, column: 10, scope: !1203)
!1225 = distinct !{!1225, !1198, !1226, !294}
!1226 = !DILocation(line: 16, column: 5, scope: !1192)
!1227 = !DILocation(line: 17, column: 5, scope: !1192)
!1228 = !DILocation(line: 18, column: 1, scope: !1192)
!1229 = distinct !DISubprogram(name: "__fizzer_model__strcpy", scope: !1230, file: !1230, line: 2, type: !71, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !108, retainedNodes: !63)
!1230 = !DIFile(filename: "data/models/c/std/string/strcpy.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "a9d5e5946be9d668420164bcb8d1da5f")
!1231 = !DILocalVariable(name: "dest", arg: 1, scope: !1229, file: !1230, line: 2, type: !13)
!1232 = !DILocation(line: 2, column: 36, scope: !1229)
!1233 = !DILocalVariable(name: "src", arg: 2, scope: !1229, file: !1230, line: 2, type: !73)
!1234 = !DILocation(line: 2, column: 54, scope: !1229)
!1235 = !DILocalVariable(name: "d", scope: !1229, file: !1230, line: 4, type: !13)
!1236 = !DILocation(line: 4, column: 11, scope: !1229)
!1237 = !DILocation(line: 4, column: 15, scope: !1229)
!1238 = !DILocation(line: 5, column: 5, scope: !1229)
!1239 = !DILocation(line: 5, column: 13, scope: !1229)
!1240 = !DILocation(line: 5, column: 12, scope: !1229)
!1241 = !DILocation(line: 5, column: 17, scope: !1229)
!1242 = !DILocation(line: 7, column: 15, scope: !1243)
!1243 = distinct !DILexicalBlock(scope: !1229, file: !1230, line: 6, column: 5)
!1244 = !DILocation(line: 7, column: 14, scope: !1243)
!1245 = !DILocation(line: 7, column: 10, scope: !1243)
!1246 = !DILocation(line: 7, column: 12, scope: !1243)
!1247 = !DILocation(line: 8, column: 10, scope: !1243)
!1248 = !DILocation(line: 9, column: 12, scope: !1243)
!1249 = distinct !{!1249, !1238, !1250, !294}
!1250 = !DILocation(line: 10, column: 5, scope: !1229)
!1251 = !DILocation(line: 11, column: 6, scope: !1229)
!1252 = !DILocation(line: 11, column: 8, scope: !1229)
!1253 = !DILocation(line: 12, column: 12, scope: !1229)
!1254 = !DILocation(line: 12, column: 5, scope: !1229)
!1255 = distinct !DISubprogram(name: "__fizzer_model__strncat", scope: !1256, file: !1256, line: 2, type: !1257, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !110, retainedNodes: !63)
!1256 = !DIFile(filename: "data/models/c/std/string/strncat.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "1734f838e35184e8c456b32046d1ee07")
!1257 = !DISubroutineType(types: !1258)
!1258 = !{!13, !13, !73, !1259}
!1259 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1260, line: 8, baseType: !253)
!1260 = !DIFile(filename: "data/models/c/std/string/strncat.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "c3654096277bccf248969a0055808a98")
!1261 = !DILocalVariable(name: "dest", arg: 1, scope: !1255, file: !1256, line: 2, type: !13)
!1262 = !DILocation(line: 2, column: 37, scope: !1255)
!1263 = !DILocalVariable(name: "src", arg: 2, scope: !1255, file: !1256, line: 2, type: !73)
!1264 = !DILocation(line: 2, column: 55, scope: !1255)
!1265 = !DILocalVariable(name: "n", arg: 3, scope: !1255, file: !1256, line: 2, type: !1259)
!1266 = !DILocation(line: 2, column: 67, scope: !1255)
!1267 = !DILocalVariable(name: "d", scope: !1255, file: !1256, line: 4, type: !13)
!1268 = !DILocation(line: 4, column: 11, scope: !1255)
!1269 = !DILocation(line: 4, column: 15, scope: !1255)
!1270 = !DILocation(line: 5, column: 5, scope: !1255)
!1271 = !DILocation(line: 5, column: 13, scope: !1255)
!1272 = !DILocation(line: 5, column: 12, scope: !1255)
!1273 = !DILocation(line: 5, column: 15, scope: !1255)
!1274 = !DILocation(line: 7, column: 10, scope: !1275)
!1275 = distinct !DILexicalBlock(scope: !1255, file: !1256, line: 6, column: 5)
!1276 = distinct !{!1276, !1270, !1277, !294}
!1277 = !DILocation(line: 8, column: 5, scope: !1255)
!1278 = !DILocalVariable(name: "i", scope: !1255, file: !1256, line: 9, type: !1259)
!1279 = !DILocation(line: 9, column: 12, scope: !1255)
!1280 = !DILocation(line: 10, column: 5, scope: !1255)
!1281 = !DILocation(line: 10, column: 12, scope: !1255)
!1282 = !DILocation(line: 10, column: 16, scope: !1255)
!1283 = !DILocation(line: 10, column: 14, scope: !1255)
!1284 = !DILocation(line: 10, column: 18, scope: !1255)
!1285 = !DILocation(line: 10, column: 22, scope: !1255)
!1286 = !DILocation(line: 10, column: 21, scope: !1255)
!1287 = !DILocation(line: 10, column: 26, scope: !1255)
!1288 = !DILocation(line: 0, scope: !1255)
!1289 = !DILocation(line: 12, column: 15, scope: !1290)
!1290 = distinct !DILexicalBlock(scope: !1255, file: !1256, line: 11, column: 5)
!1291 = !DILocation(line: 12, column: 14, scope: !1290)
!1292 = !DILocation(line: 12, column: 10, scope: !1290)
!1293 = !DILocation(line: 12, column: 12, scope: !1290)
!1294 = !DILocation(line: 13, column: 10, scope: !1290)
!1295 = !DILocation(line: 14, column: 12, scope: !1290)
!1296 = !DILocation(line: 15, column: 10, scope: !1290)
!1297 = distinct !{!1297, !1280, !1298, !294}
!1298 = !DILocation(line: 16, column: 5, scope: !1255)
!1299 = !DILocation(line: 17, column: 6, scope: !1255)
!1300 = !DILocation(line: 17, column: 8, scope: !1255)
!1301 = !DILocation(line: 18, column: 12, scope: !1255)
!1302 = !DILocation(line: 18, column: 5, scope: !1255)
!1303 = distinct !DISubprogram(name: "__fizzer_model__strcspn", scope: !1304, file: !1304, line: 2, type: !1305, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !112, retainedNodes: !63)
!1304 = !DIFile(filename: "data/models/c/std/string/strcspn.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "2f7cd216c9e6f8edb02d5afb4ea11b44")
!1305 = !DISubroutineType(types: !1306)
!1306 = !{!1307, !73, !73}
!1307 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1308, line: 8, baseType: !253)
!1308 = !DIFile(filename: "data/models/c/std/string/strcspn.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "14201ac4b9600306ae68639f4954a548")
!1309 = !DILocalVariable(name: "s", arg: 1, scope: !1303, file: !1304, line: 2, type: !73)
!1310 = !DILocation(line: 2, column: 44, scope: !1303)
!1311 = !DILocalVariable(name: "reject", arg: 2, scope: !1303, file: !1304, line: 2, type: !73)
!1312 = !DILocation(line: 2, column: 59, scope: !1303)
!1313 = !DILocalVariable(name: "count", scope: !1303, file: !1304, line: 4, type: !1307)
!1314 = !DILocation(line: 4, column: 12, scope: !1303)
!1315 = !DILocation(line: 5, column: 5, scope: !1303)
!1316 = !DILocation(line: 5, column: 13, scope: !1303)
!1317 = !DILocation(line: 5, column: 12, scope: !1303)
!1318 = !DILocation(line: 5, column: 15, scope: !1303)
!1319 = !DILocalVariable(name: "r", scope: !1320, file: !1304, line: 7, type: !73)
!1320 = distinct !DILexicalBlock(scope: !1303, file: !1304, line: 6, column: 5)
!1321 = !DILocation(line: 7, column: 21, scope: !1320)
!1322 = !DILocation(line: 7, column: 25, scope: !1320)
!1323 = !DILocation(line: 8, column: 9, scope: !1320)
!1324 = !DILocation(line: 8, column: 17, scope: !1320)
!1325 = !DILocation(line: 8, column: 16, scope: !1320)
!1326 = !DILocation(line: 8, column: 19, scope: !1320)
!1327 = !DILocation(line: 8, column: 24, scope: !1320)
!1328 = !DILocation(line: 8, column: 28, scope: !1320)
!1329 = !DILocation(line: 8, column: 27, scope: !1320)
!1330 = !DILocation(line: 8, column: 34, scope: !1320)
!1331 = !DILocation(line: 8, column: 33, scope: !1320)
!1332 = !DILocation(line: 8, column: 30, scope: !1320)
!1333 = !DILocation(line: 0, scope: !1320)
!1334 = !DILocation(line: 10, column: 14, scope: !1335)
!1335 = distinct !DILexicalBlock(scope: !1320, file: !1304, line: 9, column: 9)
!1336 = distinct !{!1336, !1323, !1337, !294}
!1337 = !DILocation(line: 11, column: 9, scope: !1320)
!1338 = !DILocation(line: 12, column: 14, scope: !1339)
!1339 = distinct !DILexicalBlock(scope: !1320, file: !1304, line: 12, column: 13)
!1340 = !DILocation(line: 12, column: 13, scope: !1339)
!1341 = !DILocation(line: 12, column: 16, scope: !1339)
!1342 = !DILocation(line: 12, column: 13, scope: !1320)
!1343 = !DILocation(line: 14, column: 13, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1339, file: !1304, line: 13, column: 9)
!1345 = !DILocation(line: 16, column: 14, scope: !1320)
!1346 = !DILocation(line: 17, column: 10, scope: !1320)
!1347 = distinct !{!1347, !1315, !1348, !294}
!1348 = !DILocation(line: 18, column: 5, scope: !1303)
!1349 = !DILocation(line: 19, column: 12, scope: !1303)
!1350 = !DILocation(line: 19, column: 5, scope: !1303)
!1351 = distinct !DISubprogram(name: "__fizzer_model__strcoll", scope: !1352, file: !1352, line: 2, type: !1353, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !114, retainedNodes: !63)
!1352 = !DIFile(filename: "data/models/c/std/string/strcoll.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "594081383e127900a617071ac71187f1")
!1353 = !DISubroutineType(types: !1354)
!1354 = !{!6, !73, !73}
!1355 = !DILocalVariable(name: "s1", arg: 1, scope: !1351, file: !1352, line: 2, type: !73)
!1356 = !DILocation(line: 2, column: 41, scope: !1351)
!1357 = !DILocalVariable(name: "s2", arg: 2, scope: !1351, file: !1352, line: 2, type: !73)
!1358 = !DILocation(line: 2, column: 57, scope: !1351)
!1359 = !DILocation(line: 4, column: 5, scope: !1351)
!1360 = !DILocation(line: 4, column: 13, scope: !1351)
!1361 = !DILocation(line: 4, column: 12, scope: !1351)
!1362 = !DILocation(line: 4, column: 16, scope: !1351)
!1363 = !DILocation(line: 4, column: 21, scope: !1351)
!1364 = !DILocation(line: 4, column: 25, scope: !1351)
!1365 = !DILocation(line: 4, column: 24, scope: !1351)
!1366 = !DILocation(line: 4, column: 32, scope: !1351)
!1367 = !DILocation(line: 4, column: 31, scope: !1351)
!1368 = !DILocation(line: 4, column: 28, scope: !1351)
!1369 = !DILocation(line: 0, scope: !1351)
!1370 = !DILocation(line: 6, column: 11, scope: !1371)
!1371 = distinct !DILexicalBlock(scope: !1351, file: !1352, line: 5, column: 5)
!1372 = !DILocation(line: 7, column: 11, scope: !1371)
!1373 = distinct !{!1373, !1359, !1374, !294}
!1374 = !DILocation(line: 8, column: 5, scope: !1351)
!1375 = !DILocation(line: 9, column: 34, scope: !1351)
!1376 = !DILocation(line: 9, column: 33, scope: !1351)
!1377 = !DILocation(line: 9, column: 18, scope: !1351)
!1378 = !DILocation(line: 9, column: 55, scope: !1351)
!1379 = !DILocation(line: 9, column: 54, scope: !1351)
!1380 = !DILocation(line: 9, column: 39, scope: !1351)
!1381 = !DILocation(line: 9, column: 37, scope: !1351)
!1382 = !DILocation(line: 9, column: 5, scope: !1351)
!1383 = distinct !DISubprogram(name: "__fizzer_model__strcmp", scope: !1384, file: !1384, line: 2, type: !1353, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !118, retainedNodes: !63)
!1384 = !DIFile(filename: "data/models/c/std/string/strcmp.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "e8d614ef53fc1f2814b3a79a1909aaf7")
!1385 = !DILocalVariable(name: "s1", arg: 1, scope: !1383, file: !1384, line: 2, type: !73)
!1386 = !DILocation(line: 2, column: 40, scope: !1383)
!1387 = !DILocalVariable(name: "s2", arg: 2, scope: !1383, file: !1384, line: 2, type: !73)
!1388 = !DILocation(line: 2, column: 56, scope: !1383)
!1389 = !DILocation(line: 4, column: 5, scope: !1383)
!1390 = !DILocation(line: 4, column: 13, scope: !1383)
!1391 = !DILocation(line: 4, column: 12, scope: !1383)
!1392 = !DILocation(line: 4, column: 16, scope: !1383)
!1393 = !DILocation(line: 4, column: 21, scope: !1383)
!1394 = !DILocation(line: 4, column: 25, scope: !1383)
!1395 = !DILocation(line: 4, column: 24, scope: !1383)
!1396 = !DILocation(line: 4, column: 32, scope: !1383)
!1397 = !DILocation(line: 4, column: 31, scope: !1383)
!1398 = !DILocation(line: 4, column: 28, scope: !1383)
!1399 = !DILocation(line: 0, scope: !1383)
!1400 = !DILocation(line: 6, column: 11, scope: !1401)
!1401 = distinct !DILexicalBlock(scope: !1383, file: !1384, line: 5, column: 5)
!1402 = !DILocation(line: 7, column: 11, scope: !1401)
!1403 = distinct !{!1403, !1389, !1404, !294}
!1404 = !DILocation(line: 8, column: 5, scope: !1383)
!1405 = !DILocation(line: 9, column: 34, scope: !1383)
!1406 = !DILocation(line: 9, column: 33, scope: !1383)
!1407 = !DILocation(line: 9, column: 18, scope: !1383)
!1408 = !DILocation(line: 9, column: 55, scope: !1383)
!1409 = !DILocation(line: 9, column: 54, scope: !1383)
!1410 = !DILocation(line: 9, column: 39, scope: !1383)
!1411 = !DILocation(line: 9, column: 37, scope: !1383)
!1412 = !DILocation(line: 9, column: 5, scope: !1383)
!1413 = distinct !DISubprogram(name: "__fizzer_model__strncmp", scope: !1414, file: !1414, line: 2, type: !1415, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !120, retainedNodes: !63)
!1414 = !DIFile(filename: "data/models/c/std/string/strncmp.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "e275f67b87d7e3da1256de4308f1f1ce")
!1415 = !DISubroutineType(types: !1416)
!1416 = !{!6, !73, !73, !1417}
!1417 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1418, line: 8, baseType: !253)
!1418 = !DIFile(filename: "data/models/c/std/string/strncmp.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "d722468f3764edd1057fdc528e8c267d")
!1419 = !DILocalVariable(name: "s1", arg: 1, scope: !1413, file: !1414, line: 2, type: !73)
!1420 = !DILocation(line: 2, column: 41, scope: !1413)
!1421 = !DILocalVariable(name: "s2", arg: 2, scope: !1413, file: !1414, line: 2, type: !73)
!1422 = !DILocation(line: 2, column: 57, scope: !1413)
!1423 = !DILocalVariable(name: "n", arg: 3, scope: !1413, file: !1414, line: 2, type: !1417)
!1424 = !DILocation(line: 2, column: 68, scope: !1413)
!1425 = !DILocalVariable(name: "i", scope: !1413, file: !1414, line: 4, type: !1417)
!1426 = !DILocation(line: 4, column: 12, scope: !1413)
!1427 = !DILocation(line: 5, column: 5, scope: !1413)
!1428 = !DILocation(line: 5, column: 12, scope: !1413)
!1429 = !DILocation(line: 5, column: 16, scope: !1413)
!1430 = !DILocation(line: 5, column: 14, scope: !1413)
!1431 = !DILocalVariable(name: "c1", scope: !1432, file: !1414, line: 7, type: !117)
!1432 = distinct !DILexicalBlock(scope: !1413, file: !1414, line: 6, column: 5)
!1433 = !DILocation(line: 7, column: 23, scope: !1432)
!1434 = !DILocation(line: 7, column: 43, scope: !1432)
!1435 = !DILocation(line: 7, column: 46, scope: !1432)
!1436 = !DILocalVariable(name: "c2", scope: !1432, file: !1414, line: 8, type: !117)
!1437 = !DILocation(line: 8, column: 23, scope: !1432)
!1438 = !DILocation(line: 8, column: 43, scope: !1432)
!1439 = !DILocation(line: 8, column: 46, scope: !1432)
!1440 = !DILocation(line: 9, column: 13, scope: !1441)
!1441 = distinct !DILexicalBlock(scope: !1432, file: !1414, line: 9, column: 13)
!1442 = !DILocation(line: 9, column: 19, scope: !1441)
!1443 = !DILocation(line: 9, column: 16, scope: !1441)
!1444 = !DILocation(line: 9, column: 22, scope: !1441)
!1445 = !DILocation(line: 9, column: 25, scope: !1441)
!1446 = !DILocation(line: 9, column: 28, scope: !1441)
!1447 = !DILocation(line: 9, column: 33, scope: !1441)
!1448 = !DILocation(line: 9, column: 36, scope: !1441)
!1449 = !DILocation(line: 9, column: 39, scope: !1441)
!1450 = !DILocation(line: 9, column: 13, scope: !1432)
!1451 = !DILocation(line: 11, column: 26, scope: !1452)
!1452 = distinct !DILexicalBlock(scope: !1441, file: !1414, line: 10, column: 9)
!1453 = !DILocation(line: 11, column: 31, scope: !1452)
!1454 = !DILocation(line: 11, column: 29, scope: !1452)
!1455 = !DILocation(line: 11, column: 13, scope: !1452)
!1456 = !DILocation(line: 13, column: 10, scope: !1432)
!1457 = distinct !{!1457, !1427, !1458, !294}
!1458 = !DILocation(line: 14, column: 5, scope: !1413)
!1459 = !DILocation(line: 15, column: 5, scope: !1413)
!1460 = !DILocation(line: 16, column: 1, scope: !1413)
!1461 = distinct !DISubprogram(name: "__fizzer_model__strrchr", scope: !1462, file: !1462, line: 2, type: !1463, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !63)
!1462 = !DIFile(filename: "data/models/c/std/string/strrchr.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "44079aea5c31caec0e42d813448f707f")
!1463 = !DISubroutineType(types: !1464)
!1464 = !{!13, !73, !6}
!1465 = !DILocalVariable(name: "s", arg: 1, scope: !1461, file: !1462, line: 2, type: !73)
!1466 = !DILocation(line: 2, column: 43, scope: !1461)
!1467 = !DILocalVariable(name: "c", arg: 2, scope: !1461, file: !1462, line: 2, type: !6)
!1468 = !DILocation(line: 2, column: 50, scope: !1461)
!1469 = !DILocalVariable(name: "last", scope: !1461, file: !1462, line: 4, type: !73)
!1470 = !DILocation(line: 4, column: 17, scope: !1461)
!1471 = !DILocation(line: 5, column: 5, scope: !1461)
!1472 = !DILocation(line: 5, column: 13, scope: !1461)
!1473 = !DILocation(line: 5, column: 12, scope: !1461)
!1474 = !DILocation(line: 5, column: 15, scope: !1461)
!1475 = !DILocation(line: 7, column: 14, scope: !1476)
!1476 = distinct !DILexicalBlock(scope: !1477, file: !1462, line: 7, column: 13)
!1477 = distinct !DILexicalBlock(scope: !1461, file: !1462, line: 6, column: 5)
!1478 = !DILocation(line: 7, column: 13, scope: !1476)
!1479 = !DILocation(line: 7, column: 25, scope: !1476)
!1480 = !DILocation(line: 7, column: 19, scope: !1476)
!1481 = !DILocation(line: 7, column: 16, scope: !1476)
!1482 = !DILocation(line: 7, column: 13, scope: !1477)
!1483 = !DILocation(line: 9, column: 20, scope: !1484)
!1484 = distinct !DILexicalBlock(scope: !1476, file: !1462, line: 8, column: 9)
!1485 = !DILocation(line: 9, column: 18, scope: !1484)
!1486 = !DILocation(line: 10, column: 9, scope: !1484)
!1487 = !DILocation(line: 11, column: 10, scope: !1477)
!1488 = distinct !{!1488, !1471, !1489, !294}
!1489 = !DILocation(line: 12, column: 5, scope: !1461)
!1490 = !DILocation(line: 13, column: 15, scope: !1491)
!1491 = distinct !DILexicalBlock(scope: !1461, file: !1462, line: 13, column: 9)
!1492 = !DILocation(line: 13, column: 9, scope: !1491)
!1493 = !DILocation(line: 13, column: 17, scope: !1491)
!1494 = !DILocation(line: 13, column: 9, scope: !1461)
!1495 = !DILocation(line: 15, column: 24, scope: !1496)
!1496 = distinct !DILexicalBlock(scope: !1491, file: !1462, line: 14, column: 5)
!1497 = !DILocation(line: 15, column: 9, scope: !1496)
!1498 = !DILocation(line: 17, column: 20, scope: !1461)
!1499 = !DILocation(line: 17, column: 5, scope: !1461)
!1500 = !DILocation(line: 18, column: 1, scope: !1461)
!1501 = distinct !DISubprogram(name: "__fizzer_model__strcat", scope: !1502, file: !1502, line: 2, type: !71, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !126, retainedNodes: !63)
!1502 = !DIFile(filename: "data/models/c/std/string/strcat.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "8970d2710d3c40f59dab15e8fb2774f9")
!1503 = !DILocalVariable(name: "dest", arg: 1, scope: !1501, file: !1502, line: 2, type: !13)
!1504 = !DILocation(line: 2, column: 36, scope: !1501)
!1505 = !DILocalVariable(name: "src", arg: 2, scope: !1501, file: !1502, line: 2, type: !73)
!1506 = !DILocation(line: 2, column: 54, scope: !1501)
!1507 = !DILocalVariable(name: "d", scope: !1501, file: !1502, line: 4, type: !13)
!1508 = !DILocation(line: 4, column: 11, scope: !1501)
!1509 = !DILocation(line: 4, column: 15, scope: !1501)
!1510 = !DILocation(line: 5, column: 5, scope: !1501)
!1511 = !DILocation(line: 5, column: 13, scope: !1501)
!1512 = !DILocation(line: 5, column: 12, scope: !1501)
!1513 = !DILocation(line: 5, column: 15, scope: !1501)
!1514 = !DILocation(line: 7, column: 10, scope: !1515)
!1515 = distinct !DILexicalBlock(scope: !1501, file: !1502, line: 6, column: 5)
!1516 = distinct !{!1516, !1510, !1517, !294}
!1517 = !DILocation(line: 8, column: 5, scope: !1501)
!1518 = !DILocation(line: 9, column: 5, scope: !1501)
!1519 = !DILocation(line: 9, column: 13, scope: !1501)
!1520 = !DILocation(line: 9, column: 12, scope: !1501)
!1521 = !DILocation(line: 9, column: 17, scope: !1501)
!1522 = !DILocation(line: 11, column: 15, scope: !1523)
!1523 = distinct !DILexicalBlock(scope: !1501, file: !1502, line: 10, column: 5)
!1524 = !DILocation(line: 11, column: 14, scope: !1523)
!1525 = !DILocation(line: 11, column: 10, scope: !1523)
!1526 = !DILocation(line: 11, column: 12, scope: !1523)
!1527 = !DILocation(line: 12, column: 10, scope: !1523)
!1528 = !DILocation(line: 13, column: 12, scope: !1523)
!1529 = distinct !{!1529, !1518, !1530, !294}
!1530 = !DILocation(line: 14, column: 5, scope: !1501)
!1531 = !DILocation(line: 15, column: 6, scope: !1501)
!1532 = !DILocation(line: 15, column: 8, scope: !1501)
!1533 = !DILocation(line: 16, column: 12, scope: !1501)
!1534 = !DILocation(line: 16, column: 5, scope: !1501)
!1535 = distinct !DISubprogram(name: "__fizzer_model__strspn", scope: !1536, file: !1536, line: 2, type: !1537, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !128, retainedNodes: !63)
!1536 = !DIFile(filename: "data/models/c/std/string/strspn.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "093bc709c553b9ccbb1565b54017ff4e")
!1537 = !DISubroutineType(types: !1538)
!1538 = !{!1539, !73, !73}
!1539 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1540, line: 8, baseType: !253)
!1540 = !DIFile(filename: "data/models/c/std/string/strspn.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "e204dc773920ac8c268dc68093e93bcb")
!1541 = !DILocalVariable(name: "s", arg: 1, scope: !1535, file: !1536, line: 2, type: !73)
!1542 = !DILocation(line: 2, column: 43, scope: !1535)
!1543 = !DILocalVariable(name: "accept", arg: 2, scope: !1535, file: !1536, line: 2, type: !73)
!1544 = !DILocation(line: 2, column: 58, scope: !1535)
!1545 = !DILocalVariable(name: "count", scope: !1535, file: !1536, line: 4, type: !1539)
!1546 = !DILocation(line: 4, column: 12, scope: !1535)
!1547 = !DILocation(line: 5, column: 5, scope: !1535)
!1548 = !DILocation(line: 5, column: 13, scope: !1535)
!1549 = !DILocation(line: 5, column: 12, scope: !1535)
!1550 = !DILocation(line: 5, column: 15, scope: !1535)
!1551 = !DILocalVariable(name: "a", scope: !1552, file: !1536, line: 7, type: !73)
!1552 = distinct !DILexicalBlock(scope: !1535, file: !1536, line: 6, column: 5)
!1553 = !DILocation(line: 7, column: 21, scope: !1552)
!1554 = !DILocation(line: 7, column: 25, scope: !1552)
!1555 = !DILocation(line: 8, column: 9, scope: !1552)
!1556 = !DILocation(line: 8, column: 17, scope: !1552)
!1557 = !DILocation(line: 8, column: 16, scope: !1552)
!1558 = !DILocation(line: 8, column: 19, scope: !1552)
!1559 = !DILocation(line: 8, column: 24, scope: !1552)
!1560 = !DILocation(line: 8, column: 28, scope: !1552)
!1561 = !DILocation(line: 8, column: 27, scope: !1552)
!1562 = !DILocation(line: 8, column: 34, scope: !1552)
!1563 = !DILocation(line: 8, column: 33, scope: !1552)
!1564 = !DILocation(line: 8, column: 30, scope: !1552)
!1565 = !DILocation(line: 0, scope: !1552)
!1566 = !DILocation(line: 10, column: 14, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1552, file: !1536, line: 9, column: 9)
!1568 = distinct !{!1568, !1555, !1569, !294}
!1569 = !DILocation(line: 11, column: 9, scope: !1552)
!1570 = !DILocation(line: 12, column: 14, scope: !1571)
!1571 = distinct !DILexicalBlock(scope: !1552, file: !1536, line: 12, column: 13)
!1572 = !DILocation(line: 12, column: 13, scope: !1571)
!1573 = !DILocation(line: 12, column: 16, scope: !1571)
!1574 = !DILocation(line: 12, column: 13, scope: !1552)
!1575 = !DILocation(line: 14, column: 13, scope: !1576)
!1576 = distinct !DILexicalBlock(scope: !1571, file: !1536, line: 13, column: 9)
!1577 = !DILocation(line: 16, column: 14, scope: !1552)
!1578 = !DILocation(line: 17, column: 10, scope: !1552)
!1579 = distinct !{!1579, !1547, !1580, !294}
!1580 = !DILocation(line: 18, column: 5, scope: !1535)
!1581 = !DILocation(line: 19, column: 12, scope: !1535)
!1582 = !DILocation(line: 19, column: 5, scope: !1535)
!1583 = distinct !DISubprogram(name: "__fizzer_model__strncpy", scope: !1584, file: !1584, line: 2, type: !1585, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !130, retainedNodes: !63)
!1584 = !DIFile(filename: "data/models/c/std/string/strncpy.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "4b1e33fa2c1188492810829cb7ad397c")
!1585 = !DISubroutineType(types: !1586)
!1586 = !{!13, !13, !73, !1587}
!1587 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1588, line: 8, baseType: !253)
!1588 = !DIFile(filename: "data/models/c/std/string/strncpy.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "05e0494f8da850b7625fd57dcdc37446")
!1589 = !DILocalVariable(name: "dest", arg: 1, scope: !1583, file: !1584, line: 2, type: !13)
!1590 = !DILocation(line: 2, column: 37, scope: !1583)
!1591 = !DILocalVariable(name: "src", arg: 2, scope: !1583, file: !1584, line: 2, type: !73)
!1592 = !DILocation(line: 2, column: 55, scope: !1583)
!1593 = !DILocalVariable(name: "n", arg: 3, scope: !1583, file: !1584, line: 2, type: !1587)
!1594 = !DILocation(line: 2, column: 67, scope: !1583)
!1595 = !DILocalVariable(name: "i", scope: !1583, file: !1584, line: 4, type: !1587)
!1596 = !DILocation(line: 4, column: 12, scope: !1583)
!1597 = !DILocation(line: 5, column: 5, scope: !1583)
!1598 = !DILocation(line: 5, column: 12, scope: !1583)
!1599 = !DILocation(line: 5, column: 16, scope: !1583)
!1600 = !DILocation(line: 5, column: 14, scope: !1583)
!1601 = !DILocation(line: 5, column: 18, scope: !1583)
!1602 = !DILocation(line: 5, column: 21, scope: !1583)
!1603 = !DILocation(line: 5, column: 25, scope: !1583)
!1604 = !DILocation(line: 5, column: 28, scope: !1583)
!1605 = !DILocation(line: 0, scope: !1583)
!1606 = !DILocation(line: 7, column: 19, scope: !1607)
!1607 = distinct !DILexicalBlock(scope: !1583, file: !1584, line: 6, column: 5)
!1608 = !DILocation(line: 7, column: 23, scope: !1607)
!1609 = !DILocation(line: 7, column: 9, scope: !1607)
!1610 = !DILocation(line: 7, column: 14, scope: !1607)
!1611 = !DILocation(line: 7, column: 17, scope: !1607)
!1612 = !DILocation(line: 8, column: 10, scope: !1607)
!1613 = distinct !{!1613, !1597, !1614, !294}
!1614 = !DILocation(line: 9, column: 5, scope: !1583)
!1615 = !DILocation(line: 10, column: 5, scope: !1583)
!1616 = !DILocation(line: 10, column: 12, scope: !1583)
!1617 = !DILocation(line: 10, column: 16, scope: !1583)
!1618 = !DILocation(line: 10, column: 14, scope: !1583)
!1619 = !DILocation(line: 12, column: 9, scope: !1620)
!1620 = distinct !DILexicalBlock(scope: !1583, file: !1584, line: 11, column: 5)
!1621 = !DILocation(line: 12, column: 14, scope: !1620)
!1622 = !DILocation(line: 12, column: 17, scope: !1620)
!1623 = !DILocation(line: 13, column: 10, scope: !1620)
!1624 = distinct !{!1624, !1615, !1625, !294}
!1625 = !DILocation(line: 14, column: 5, scope: !1583)
!1626 = !DILocation(line: 15, column: 12, scope: !1583)
!1627 = !DILocation(line: 15, column: 5, scope: !1583)
!1628 = distinct !DISubprogram(name: "__fizzer_model__strchr", scope: !1629, file: !1629, line: 2, type: !1463, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !132, retainedNodes: !63)
!1629 = !DIFile(filename: "data/models/c/std/string/strchr.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "be78f81f7eb8078306a1616593746c64")
!1630 = !DILocalVariable(name: "s", arg: 1, scope: !1628, file: !1629, line: 2, type: !73)
!1631 = !DILocation(line: 2, column: 42, scope: !1628)
!1632 = !DILocalVariable(name: "c", arg: 2, scope: !1628, file: !1629, line: 2, type: !6)
!1633 = !DILocation(line: 2, column: 49, scope: !1628)
!1634 = !DILocation(line: 4, column: 5, scope: !1628)
!1635 = !DILocation(line: 4, column: 13, scope: !1628)
!1636 = !DILocation(line: 4, column: 12, scope: !1628)
!1637 = !DILocation(line: 4, column: 15, scope: !1628)
!1638 = !DILocation(line: 6, column: 14, scope: !1639)
!1639 = distinct !DILexicalBlock(scope: !1640, file: !1629, line: 6, column: 13)
!1640 = distinct !DILexicalBlock(scope: !1628, file: !1629, line: 5, column: 5)
!1641 = !DILocation(line: 6, column: 13, scope: !1639)
!1642 = !DILocation(line: 6, column: 25, scope: !1639)
!1643 = !DILocation(line: 6, column: 19, scope: !1639)
!1644 = !DILocation(line: 6, column: 16, scope: !1639)
!1645 = !DILocation(line: 6, column: 13, scope: !1640)
!1646 = !DILocation(line: 8, column: 28, scope: !1647)
!1647 = distinct !DILexicalBlock(scope: !1639, file: !1629, line: 7, column: 9)
!1648 = !DILocation(line: 8, column: 13, scope: !1647)
!1649 = !DILocation(line: 10, column: 10, scope: !1640)
!1650 = distinct !{!1650, !1634, !1651, !294}
!1651 = !DILocation(line: 11, column: 5, scope: !1628)
!1652 = !DILocation(line: 12, column: 15, scope: !1653)
!1653 = distinct !DILexicalBlock(scope: !1628, file: !1629, line: 12, column: 9)
!1654 = !DILocation(line: 12, column: 9, scope: !1653)
!1655 = !DILocation(line: 12, column: 17, scope: !1653)
!1656 = !DILocation(line: 12, column: 9, scope: !1628)
!1657 = !DILocation(line: 14, column: 24, scope: !1658)
!1658 = distinct !DILexicalBlock(scope: !1653, file: !1629, line: 13, column: 5)
!1659 = !DILocation(line: 14, column: 9, scope: !1658)
!1660 = !DILocation(line: 16, column: 5, scope: !1628)
!1661 = !DILocation(line: 17, column: 1, scope: !1628)
!1662 = !DILocalVariable(name: "errnum", arg: 1, scope: !29, file: !30, line: 2, type: !6)
!1663 = !DILocation(line: 2, column: 36, scope: !29)
!1664 = !DILocation(line: 8, column: 13, scope: !29)
!1665 = !DILocation(line: 8, column: 5, scope: !29)
!1666 = !DILocation(line: 11, column: 13, scope: !1667)
!1667 = distinct !DILexicalBlock(scope: !29, file: !30, line: 9, column: 5)
!1668 = !DILocation(line: 13, column: 13, scope: !1667)
!1669 = !DILocation(line: 15, column: 13, scope: !1667)
!1670 = !DILocation(line: 17, column: 13, scope: !1667)
!1671 = !DILocation(line: 19, column: 13, scope: !1667)
!1672 = !DILocation(line: 21, column: 13, scope: !1667)
!1673 = !DILocation(line: 23, column: 13, scope: !1667)
!1674 = !DILocation(line: 25, column: 1, scope: !29)
!1675 = distinct !DISubprogram(name: "__fizzer_model__memchr", scope: !1676, file: !1676, line: 2, type: !1677, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !134, retainedNodes: !63)
!1676 = !DIFile(filename: "data/models/c/std/string/memchr.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "eb41c2475f9bcc7c01385e05d30fa3e5")
!1677 = !DISubroutineType(types: !1678)
!1678 = !{!139, !1679, !6, !1681}
!1679 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1680, size: 32)
!1680 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!1681 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1682, line: 8, baseType: !253)
!1682 = !DIFile(filename: "data/models/c/std/string/memchr.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "af02b37770d7a7765f9edfc9d8d94d59")
!1683 = !DILocalVariable(name: "s", arg: 1, scope: !1675, file: !1676, line: 2, type: !1679)
!1684 = !DILocation(line: 2, column: 42, scope: !1675)
!1685 = !DILocalVariable(name: "c", arg: 2, scope: !1675, file: !1676, line: 2, type: !6)
!1686 = !DILocation(line: 2, column: 49, scope: !1675)
!1687 = !DILocalVariable(name: "n", arg: 3, scope: !1675, file: !1676, line: 2, type: !1681)
!1688 = !DILocation(line: 2, column: 59, scope: !1675)
!1689 = !DILocalVariable(name: "p", scope: !1675, file: !1676, line: 4, type: !137)
!1690 = !DILocation(line: 4, column: 26, scope: !1675)
!1691 = !DILocation(line: 4, column: 53, scope: !1675)
!1692 = !DILocalVariable(name: "i", scope: !1675, file: !1676, line: 5, type: !1681)
!1693 = !DILocation(line: 5, column: 12, scope: !1675)
!1694 = !DILocation(line: 7, column: 5, scope: !1675)
!1695 = !DILocation(line: 7, column: 12, scope: !1675)
!1696 = !DILocation(line: 7, column: 16, scope: !1675)
!1697 = !DILocation(line: 7, column: 14, scope: !1675)
!1698 = !DILocation(line: 9, column: 13, scope: !1699)
!1699 = distinct !DILexicalBlock(scope: !1700, file: !1676, line: 9, column: 13)
!1700 = distinct !DILexicalBlock(scope: !1675, file: !1676, line: 8, column: 5)
!1701 = !DILocation(line: 9, column: 15, scope: !1699)
!1702 = !DILocation(line: 9, column: 36, scope: !1699)
!1703 = !DILocation(line: 9, column: 21, scope: !1699)
!1704 = !DILocation(line: 9, column: 18, scope: !1699)
!1705 = !DILocation(line: 9, column: 13, scope: !1700)
!1706 = !DILocation(line: 11, column: 29, scope: !1707)
!1707 = distinct !DILexicalBlock(scope: !1699, file: !1676, line: 10, column: 9)
!1708 = !DILocation(line: 11, column: 33, scope: !1707)
!1709 = !DILocation(line: 11, column: 31, scope: !1707)
!1710 = !DILocation(line: 11, column: 13, scope: !1707)
!1711 = !DILocation(line: 13, column: 10, scope: !1700)
!1712 = distinct !{!1712, !1694, !1713, !294}
!1713 = !DILocation(line: 14, column: 5, scope: !1675)
!1714 = !DILocation(line: 15, column: 5, scope: !1675)
!1715 = !DILocation(line: 16, column: 1, scope: !1675)
!1716 = distinct !DISubprogram(name: "__fizzer_model__strlen", scope: !1717, file: !1717, line: 2, type: !1718, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !140, retainedNodes: !63)
!1717 = !DIFile(filename: "data/models/c/std/string/strlen.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "02927e422ac203a0e84c9a608c987af4")
!1718 = !DISubroutineType(types: !1719)
!1719 = !{!1720, !73}
!1720 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1721, line: 8, baseType: !253)
!1721 = !DIFile(filename: "data/models/c/std/string/strlen.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "b08c6e51a3e99f12523321dfde78fc5e")
!1722 = !DILocalVariable(name: "s", arg: 1, scope: !1716, file: !1717, line: 2, type: !73)
!1723 = !DILocation(line: 2, column: 43, scope: !1716)
!1724 = !DILocalVariable(name: "n", scope: !1716, file: !1717, line: 4, type: !1720)
!1725 = !DILocation(line: 4, column: 12, scope: !1716)
!1726 = !DILocation(line: 5, column: 5, scope: !1716)
!1727 = !DILocation(line: 5, column: 12, scope: !1716)
!1728 = !DILocation(line: 5, column: 14, scope: !1716)
!1729 = !DILocation(line: 5, column: 17, scope: !1716)
!1730 = !DILocation(line: 7, column: 10, scope: !1731)
!1731 = distinct !DILexicalBlock(scope: !1716, file: !1717, line: 6, column: 5)
!1732 = distinct !{!1732, !1726, !1733, !294}
!1733 = !DILocation(line: 8, column: 5, scope: !1716)
!1734 = !DILocation(line: 9, column: 12, scope: !1716)
!1735 = !DILocation(line: 9, column: 5, scope: !1716)
!1736 = !DILocalVariable(name: "s", arg: 1, scope: !69, file: !70, line: 2, type: !13)
!1737 = !DILocation(line: 2, column: 36, scope: !69)
!1738 = !DILocalVariable(name: "delim", arg: 2, scope: !69, file: !70, line: 2, type: !73)
!1739 = !DILocation(line: 2, column: 51, scope: !69)
!1740 = !DILocation(line: 6, column: 9, scope: !1741)
!1741 = distinct !DILexicalBlock(scope: !69, file: !70, line: 6, column: 9)
!1742 = !DILocation(line: 6, column: 11, scope: !1741)
!1743 = !DILocation(line: 6, column: 9, scope: !69)
!1744 = !DILocation(line: 8, column: 13, scope: !1745)
!1745 = distinct !DILexicalBlock(scope: !1741, file: !70, line: 7, column: 5)
!1746 = !DILocation(line: 8, column: 11, scope: !1745)
!1747 = !DILocation(line: 9, column: 5, scope: !1745)
!1748 = !DILocation(line: 11, column: 9, scope: !1749)
!1749 = distinct !DILexicalBlock(scope: !69, file: !70, line: 11, column: 9)
!1750 = !DILocation(line: 11, column: 11, scope: !1749)
!1751 = !DILocation(line: 11, column: 9, scope: !69)
!1752 = !DILocation(line: 13, column: 9, scope: !1753)
!1753 = distinct !DILexicalBlock(scope: !1749, file: !70, line: 12, column: 5)
!1754 = !DILocation(line: 17, column: 5, scope: !69)
!1755 = !DILocation(line: 17, column: 13, scope: !69)
!1756 = !DILocation(line: 17, column: 12, scope: !69)
!1757 = !DILocation(line: 17, column: 15, scope: !69)
!1758 = !DILocalVariable(name: "d", scope: !1759, file: !70, line: 19, type: !73)
!1759 = distinct !DILexicalBlock(scope: !69, file: !70, line: 18, column: 5)
!1760 = !DILocation(line: 19, column: 21, scope: !1759)
!1761 = !DILocation(line: 19, column: 25, scope: !1759)
!1762 = !DILocation(line: 20, column: 9, scope: !1759)
!1763 = !DILocation(line: 20, column: 17, scope: !1759)
!1764 = !DILocation(line: 20, column: 16, scope: !1759)
!1765 = !DILocation(line: 20, column: 19, scope: !1759)
!1766 = !DILocation(line: 20, column: 24, scope: !1759)
!1767 = !DILocation(line: 20, column: 28, scope: !1759)
!1768 = !DILocation(line: 20, column: 27, scope: !1759)
!1769 = !DILocation(line: 20, column: 34, scope: !1759)
!1770 = !DILocation(line: 20, column: 33, scope: !1759)
!1771 = !DILocation(line: 20, column: 30, scope: !1759)
!1772 = !DILocation(line: 0, scope: !1759)
!1773 = !DILocation(line: 22, column: 14, scope: !1774)
!1774 = distinct !DILexicalBlock(scope: !1759, file: !70, line: 21, column: 9)
!1775 = distinct !{!1775, !1762, !1776, !294}
!1776 = !DILocation(line: 23, column: 9, scope: !1759)
!1777 = !DILocation(line: 24, column: 14, scope: !1778)
!1778 = distinct !DILexicalBlock(scope: !1759, file: !70, line: 24, column: 13)
!1779 = !DILocation(line: 24, column: 13, scope: !1778)
!1780 = !DILocation(line: 24, column: 16, scope: !1778)
!1781 = !DILocation(line: 24, column: 13, scope: !1759)
!1782 = !DILocation(line: 26, column: 13, scope: !1783)
!1783 = distinct !DILexicalBlock(scope: !1778, file: !70, line: 25, column: 9)
!1784 = !DILocation(line: 28, column: 10, scope: !1759)
!1785 = distinct !{!1785, !1754, !1786, !294}
!1786 = !DILocation(line: 29, column: 5, scope: !69)
!1787 = !DILocation(line: 31, column: 10, scope: !1788)
!1788 = distinct !DILexicalBlock(scope: !69, file: !70, line: 31, column: 9)
!1789 = !DILocation(line: 31, column: 9, scope: !1788)
!1790 = !DILocation(line: 31, column: 12, scope: !1788)
!1791 = !DILocation(line: 31, column: 9, scope: !69)
!1792 = !DILocation(line: 33, column: 14, scope: !1793)
!1793 = distinct !DILexicalBlock(scope: !1788, file: !70, line: 32, column: 5)
!1794 = !DILocation(line: 34, column: 9, scope: !1793)
!1795 = !DILocalVariable(name: "token", scope: !69, file: !70, line: 37, type: !13)
!1796 = !DILocation(line: 37, column: 11, scope: !69)
!1797 = !DILocation(line: 37, column: 19, scope: !69)
!1798 = !DILocation(line: 40, column: 5, scope: !69)
!1799 = !DILocation(line: 40, column: 13, scope: !69)
!1800 = !DILocation(line: 40, column: 12, scope: !69)
!1801 = !DILocation(line: 40, column: 15, scope: !69)
!1802 = !DILocalVariable(name: "d", scope: !1803, file: !70, line: 42, type: !73)
!1803 = distinct !DILexicalBlock(scope: !69, file: !70, line: 41, column: 5)
!1804 = !DILocation(line: 42, column: 21, scope: !1803)
!1805 = !DILocation(line: 42, column: 25, scope: !1803)
!1806 = !DILocation(line: 43, column: 9, scope: !1803)
!1807 = !DILocation(line: 43, column: 17, scope: !1803)
!1808 = !DILocation(line: 43, column: 16, scope: !1803)
!1809 = !DILocation(line: 43, column: 19, scope: !1803)
!1810 = !DILocation(line: 43, column: 24, scope: !1803)
!1811 = !DILocation(line: 43, column: 28, scope: !1803)
!1812 = !DILocation(line: 43, column: 27, scope: !1803)
!1813 = !DILocation(line: 43, column: 34, scope: !1803)
!1814 = !DILocation(line: 43, column: 33, scope: !1803)
!1815 = !DILocation(line: 43, column: 30, scope: !1803)
!1816 = !DILocation(line: 0, scope: !1803)
!1817 = !DILocation(line: 45, column: 14, scope: !1818)
!1818 = distinct !DILexicalBlock(scope: !1803, file: !70, line: 44, column: 9)
!1819 = distinct !{!1819, !1806, !1820, !294}
!1820 = !DILocation(line: 46, column: 9, scope: !1803)
!1821 = !DILocation(line: 47, column: 14, scope: !1822)
!1822 = distinct !DILexicalBlock(scope: !1803, file: !70, line: 47, column: 13)
!1823 = !DILocation(line: 47, column: 13, scope: !1822)
!1824 = !DILocation(line: 47, column: 16, scope: !1822)
!1825 = !DILocation(line: 47, column: 13, scope: !1803)
!1826 = !DILocation(line: 49, column: 13, scope: !1827)
!1827 = distinct !DILexicalBlock(scope: !1822, file: !70, line: 48, column: 9)
!1828 = !DILocation(line: 51, column: 10, scope: !1803)
!1829 = distinct !{!1829, !1798, !1830, !294}
!1830 = !DILocation(line: 52, column: 5, scope: !69)
!1831 = !DILocation(line: 54, column: 10, scope: !1832)
!1832 = distinct !DILexicalBlock(scope: !69, file: !70, line: 54, column: 9)
!1833 = !DILocation(line: 54, column: 9, scope: !1832)
!1834 = !DILocation(line: 54, column: 12, scope: !1832)
!1835 = !DILocation(line: 54, column: 9, scope: !69)
!1836 = !DILocation(line: 56, column: 10, scope: !1837)
!1837 = distinct !DILexicalBlock(scope: !1832, file: !70, line: 55, column: 5)
!1838 = !DILocation(line: 56, column: 12, scope: !1837)
!1839 = !DILocation(line: 57, column: 10, scope: !1837)
!1840 = !DILocation(line: 58, column: 16, scope: !1837)
!1841 = !DILocation(line: 58, column: 14, scope: !1837)
!1842 = !DILocation(line: 59, column: 5, scope: !1837)
!1843 = !DILocation(line: 62, column: 14, scope: !1844)
!1844 = distinct !DILexicalBlock(scope: !1832, file: !70, line: 61, column: 5)
!1845 = !DILocation(line: 65, column: 12, scope: !69)
!1846 = !DILocation(line: 65, column: 5, scope: !69)
!1847 = !DILocation(line: 66, column: 1, scope: !69)
!1848 = distinct !DISubprogram(name: "__fizzer_model__strxfrm", scope: !1849, file: !1849, line: 2, type: !1850, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !142, retainedNodes: !63)
!1849 = !DIFile(filename: "data/models/c/std/string/strxfrm.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "989278973572eb57b2d093785a278add")
!1850 = !DISubroutineType(types: !1851)
!1851 = !{!1852, !13, !73, !1852}
!1852 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1853, line: 8, baseType: !253)
!1853 = !DIFile(filename: "data/models/c/std/string/strxfrm.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "710e97a829760447cb50814df00571f8")
!1854 = !DILocalVariable(name: "dest", arg: 1, scope: !1848, file: !1849, line: 2, type: !13)
!1855 = !DILocation(line: 2, column: 38, scope: !1848)
!1856 = !DILocalVariable(name: "src", arg: 2, scope: !1848, file: !1849, line: 2, type: !73)
!1857 = !DILocation(line: 2, column: 56, scope: !1848)
!1858 = !DILocalVariable(name: "n", arg: 3, scope: !1848, file: !1849, line: 2, type: !1852)
!1859 = !DILocation(line: 2, column: 68, scope: !1848)
!1860 = !DILocalVariable(name: "len", scope: !1848, file: !1849, line: 4, type: !1852)
!1861 = !DILocation(line: 4, column: 12, scope: !1848)
!1862 = !DILocalVariable(name: "s", scope: !1848, file: !1849, line: 5, type: !73)
!1863 = !DILocation(line: 5, column: 17, scope: !1848)
!1864 = !DILocation(line: 5, column: 21, scope: !1848)
!1865 = !DILocation(line: 8, column: 5, scope: !1848)
!1866 = !DILocation(line: 8, column: 13, scope: !1848)
!1867 = !DILocation(line: 8, column: 12, scope: !1848)
!1868 = !DILocation(line: 8, column: 15, scope: !1848)
!1869 = !DILocation(line: 10, column: 12, scope: !1870)
!1870 = distinct !DILexicalBlock(scope: !1848, file: !1849, line: 9, column: 5)
!1871 = !DILocation(line: 11, column: 10, scope: !1870)
!1872 = distinct !{!1872, !1865, !1873, !294}
!1873 = !DILocation(line: 12, column: 5, scope: !1848)
!1874 = !DILocation(line: 15, column: 9, scope: !1875)
!1875 = distinct !DILexicalBlock(scope: !1848, file: !1849, line: 15, column: 9)
!1876 = !DILocation(line: 15, column: 11, scope: !1875)
!1877 = !DILocation(line: 15, column: 9, scope: !1848)
!1878 = !DILocalVariable(name: "i", scope: !1879, file: !1849, line: 17, type: !1852)
!1879 = distinct !DILexicalBlock(scope: !1875, file: !1849, line: 16, column: 5)
!1880 = !DILocation(line: 17, column: 16, scope: !1879)
!1881 = !DILocation(line: 18, column: 9, scope: !1879)
!1882 = !DILocation(line: 18, column: 16, scope: !1879)
!1883 = !DILocation(line: 18, column: 20, scope: !1879)
!1884 = !DILocation(line: 18, column: 22, scope: !1879)
!1885 = !DILocation(line: 18, column: 18, scope: !1879)
!1886 = !DILocation(line: 18, column: 26, scope: !1879)
!1887 = !DILocation(line: 18, column: 29, scope: !1879)
!1888 = !DILocation(line: 18, column: 33, scope: !1879)
!1889 = !DILocation(line: 18, column: 36, scope: !1879)
!1890 = !DILocation(line: 0, scope: !1879)
!1891 = !DILocation(line: 20, column: 23, scope: !1892)
!1892 = distinct !DILexicalBlock(scope: !1879, file: !1849, line: 19, column: 9)
!1893 = !DILocation(line: 20, column: 27, scope: !1892)
!1894 = !DILocation(line: 20, column: 13, scope: !1892)
!1895 = !DILocation(line: 20, column: 18, scope: !1892)
!1896 = !DILocation(line: 20, column: 21, scope: !1892)
!1897 = !DILocation(line: 21, column: 14, scope: !1892)
!1898 = distinct !{!1898, !1881, !1899, !294}
!1899 = !DILocation(line: 22, column: 9, scope: !1879)
!1900 = !DILocation(line: 23, column: 9, scope: !1879)
!1901 = !DILocation(line: 23, column: 14, scope: !1879)
!1902 = !DILocation(line: 23, column: 17, scope: !1879)
!1903 = !DILocation(line: 24, column: 5, scope: !1879)
!1904 = !DILocation(line: 26, column: 12, scope: !1848)
!1905 = !DILocation(line: 26, column: 5, scope: !1848)
!1906 = distinct !DISubprogram(name: "__fizzer_model__iscntrl", scope: !1907, file: !1907, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !144, retainedNodes: !63)
!1907 = !DIFile(filename: "data/models/c/std/ctype/iscntrl.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "1d16fabd886360902b60cd5383ecd536")
!1908 = !DILocalVariable(name: "c", arg: 1, scope: !1906, file: !1907, line: 2, type: !6)
!1909 = !DILocation(line: 2, column: 33, scope: !1906)
!1910 = !DILocation(line: 4, column: 10, scope: !1911)
!1911 = distinct !DILexicalBlock(scope: !1906, file: !1907, line: 4, column: 9)
!1912 = !DILocation(line: 4, column: 12, scope: !1911)
!1913 = !DILocation(line: 4, column: 17, scope: !1911)
!1914 = !DILocation(line: 4, column: 20, scope: !1911)
!1915 = !DILocation(line: 4, column: 22, scope: !1911)
!1916 = !DILocation(line: 4, column: 29, scope: !1911)
!1917 = !DILocation(line: 4, column: 32, scope: !1911)
!1918 = !DILocation(line: 4, column: 34, scope: !1911)
!1919 = !DILocation(line: 4, column: 9, scope: !1906)
!1920 = !DILocation(line: 6, column: 9, scope: !1921)
!1921 = distinct !DILexicalBlock(scope: !1911, file: !1907, line: 5, column: 5)
!1922 = !DILocation(line: 8, column: 5, scope: !1906)
!1923 = !DILocation(line: 9, column: 1, scope: !1906)
!1924 = distinct !DISubprogram(name: "__fizzer_model__isxdigit", scope: !1925, file: !1925, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !146, retainedNodes: !63)
!1925 = !DIFile(filename: "data/models/c/std/ctype/isxdigit.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "0abf049bb725434344eee06d1063bde8")
!1926 = !DILocalVariable(name: "c", arg: 1, scope: !1924, file: !1925, line: 2, type: !6)
!1927 = !DILocation(line: 2, column: 34, scope: !1924)
!1928 = !DILocation(line: 4, column: 34, scope: !1929)
!1929 = distinct !DILexicalBlock(scope: !1924, file: !1925, line: 4, column: 9)
!1930 = !DILocation(line: 4, column: 10, scope: !1929)
!1931 = !DILocation(line: 4, column: 38, scope: !1929)
!1932 = !DILocation(line: 5, column: 10, scope: !1929)
!1933 = !DILocation(line: 5, column: 12, scope: !1929)
!1934 = !DILocation(line: 5, column: 19, scope: !1929)
!1935 = !DILocation(line: 5, column: 22, scope: !1929)
!1936 = !DILocation(line: 5, column: 24, scope: !1929)
!1937 = !DILocation(line: 5, column: 32, scope: !1929)
!1938 = !DILocation(line: 6, column: 10, scope: !1929)
!1939 = !DILocation(line: 6, column: 12, scope: !1929)
!1940 = !DILocation(line: 6, column: 19, scope: !1929)
!1941 = !DILocation(line: 6, column: 22, scope: !1929)
!1942 = !DILocation(line: 6, column: 24, scope: !1929)
!1943 = !DILocation(line: 4, column: 9, scope: !1924)
!1944 = !DILocation(line: 8, column: 9, scope: !1945)
!1945 = distinct !DILexicalBlock(scope: !1929, file: !1925, line: 7, column: 5)
!1946 = !DILocation(line: 10, column: 5, scope: !1924)
!1947 = !DILocation(line: 11, column: 1, scope: !1924)
!1948 = distinct !DISubprogram(name: "__fizzer_model__isalnum", scope: !1949, file: !1949, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !148, retainedNodes: !63)
!1949 = !DIFile(filename: "data/models/c/std/ctype/isalnum.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "6bbe9a062fcf4ea45225490b0c0403ef")
!1950 = !DILocalVariable(name: "c", arg: 1, scope: !1948, file: !1949, line: 2, type: !6)
!1951 = !DILocation(line: 2, column: 33, scope: !1948)
!1952 = !DILocation(line: 4, column: 33, scope: !1953)
!1953 = distinct !DILexicalBlock(scope: !1948, file: !1949, line: 4, column: 9)
!1954 = !DILocation(line: 4, column: 9, scope: !1953)
!1955 = !DILocation(line: 4, column: 36, scope: !1953)
!1956 = !DILocation(line: 4, column: 63, scope: !1953)
!1957 = !DILocation(line: 4, column: 39, scope: !1953)
!1958 = !DILocation(line: 4, column: 9, scope: !1948)
!1959 = !DILocation(line: 6, column: 9, scope: !1960)
!1960 = distinct !DILexicalBlock(scope: !1953, file: !1949, line: 5, column: 5)
!1961 = !DILocation(line: 8, column: 5, scope: !1948)
!1962 = !DILocation(line: 9, column: 1, scope: !1948)
!1963 = distinct !DISubprogram(name: "__fizzer_model__isspace", scope: !1964, file: !1964, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !150, retainedNodes: !63)
!1964 = !DIFile(filename: "data/models/c/std/ctype/isspace.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "9ab9a851c14ac485b9c69b251ca4421f")
!1965 = !DILocalVariable(name: "c", arg: 1, scope: !1963, file: !1964, line: 2, type: !6)
!1966 = !DILocation(line: 2, column: 33, scope: !1963)
!1967 = !DILocation(line: 4, column: 9, scope: !1968)
!1968 = distinct !DILexicalBlock(scope: !1963, file: !1964, line: 4, column: 9)
!1969 = !DILocation(line: 4, column: 11, scope: !1968)
!1970 = !DILocation(line: 4, column: 18, scope: !1968)
!1971 = !DILocation(line: 4, column: 21, scope: !1968)
!1972 = !DILocation(line: 4, column: 23, scope: !1968)
!1973 = !DILocation(line: 4, column: 31, scope: !1968)
!1974 = !DILocation(line: 4, column: 34, scope: !1968)
!1975 = !DILocation(line: 4, column: 36, scope: !1968)
!1976 = !DILocation(line: 4, column: 44, scope: !1968)
!1977 = !DILocation(line: 4, column: 47, scope: !1968)
!1978 = !DILocation(line: 4, column: 49, scope: !1968)
!1979 = !DILocation(line: 4, column: 57, scope: !1968)
!1980 = !DILocation(line: 4, column: 60, scope: !1968)
!1981 = !DILocation(line: 4, column: 62, scope: !1968)
!1982 = !DILocation(line: 4, column: 70, scope: !1968)
!1983 = !DILocation(line: 4, column: 73, scope: !1968)
!1984 = !DILocation(line: 4, column: 75, scope: !1968)
!1985 = !DILocation(line: 4, column: 9, scope: !1963)
!1986 = !DILocation(line: 6, column: 9, scope: !1987)
!1987 = distinct !DILexicalBlock(scope: !1968, file: !1964, line: 5, column: 5)
!1988 = !DILocation(line: 8, column: 5, scope: !1963)
!1989 = !DILocation(line: 9, column: 1, scope: !1963)
!1990 = distinct !DISubprogram(name: "__fizzer_model__isalpha", scope: !1991, file: !1991, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !152, retainedNodes: !63)
!1991 = !DIFile(filename: "data/models/c/std/ctype/isalpha.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "ec45d1a23298cf8353ee76bfbe3010f4")
!1992 = !DILocalVariable(name: "c", arg: 1, scope: !1990, file: !1991, line: 2, type: !6)
!1993 = !DILocation(line: 2, column: 33, scope: !1990)
!1994 = !DILocation(line: 4, column: 10, scope: !1995)
!1995 = distinct !DILexicalBlock(scope: !1990, file: !1991, line: 4, column: 9)
!1996 = !DILocation(line: 4, column: 12, scope: !1995)
!1997 = !DILocation(line: 4, column: 19, scope: !1995)
!1998 = !DILocation(line: 4, column: 22, scope: !1995)
!1999 = !DILocation(line: 4, column: 24, scope: !1995)
!2000 = !DILocation(line: 4, column: 32, scope: !1995)
!2001 = !DILocation(line: 4, column: 36, scope: !1995)
!2002 = !DILocation(line: 4, column: 38, scope: !1995)
!2003 = !DILocation(line: 4, column: 45, scope: !1995)
!2004 = !DILocation(line: 4, column: 48, scope: !1995)
!2005 = !DILocation(line: 4, column: 50, scope: !1995)
!2006 = !DILocation(line: 4, column: 9, scope: !1990)
!2007 = !DILocation(line: 6, column: 9, scope: !2008)
!2008 = distinct !DILexicalBlock(scope: !1995, file: !1991, line: 5, column: 5)
!2009 = !DILocation(line: 8, column: 5, scope: !1990)
!2010 = !DILocation(line: 9, column: 1, scope: !1990)
!2011 = distinct !DISubprogram(name: "__fizzer_model__isblank", scope: !2012, file: !2012, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !154, retainedNodes: !63)
!2012 = !DIFile(filename: "data/models/c/std/ctype/isblank.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "4469204b656f7c8f7e1807d1f4e59567")
!2013 = !DILocalVariable(name: "c", arg: 1, scope: !2011, file: !2012, line: 2, type: !6)
!2014 = !DILocation(line: 2, column: 33, scope: !2011)
!2015 = !DILocation(line: 4, column: 9, scope: !2016)
!2016 = distinct !DILexicalBlock(scope: !2011, file: !2012, line: 4, column: 9)
!2017 = !DILocation(line: 4, column: 11, scope: !2016)
!2018 = !DILocation(line: 4, column: 18, scope: !2016)
!2019 = !DILocation(line: 4, column: 21, scope: !2016)
!2020 = !DILocation(line: 4, column: 23, scope: !2016)
!2021 = !DILocation(line: 4, column: 9, scope: !2011)
!2022 = !DILocation(line: 6, column: 9, scope: !2023)
!2023 = distinct !DILexicalBlock(scope: !2016, file: !2012, line: 5, column: 5)
!2024 = !DILocation(line: 8, column: 5, scope: !2011)
!2025 = !DILocation(line: 9, column: 1, scope: !2011)
!2026 = distinct !DISubprogram(name: "__fizzer_model__islower", scope: !2027, file: !2027, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !156, retainedNodes: !63)
!2027 = !DIFile(filename: "data/models/c/std/ctype/islower.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "7f0db237b2957c408137ff19b95b9f37")
!2028 = !DILocalVariable(name: "c", arg: 1, scope: !2026, file: !2027, line: 2, type: !6)
!2029 = !DILocation(line: 2, column: 33, scope: !2026)
!2030 = !DILocation(line: 4, column: 9, scope: !2031)
!2031 = distinct !DILexicalBlock(scope: !2026, file: !2027, line: 4, column: 9)
!2032 = !DILocation(line: 4, column: 11, scope: !2031)
!2033 = !DILocation(line: 4, column: 18, scope: !2031)
!2034 = !DILocation(line: 4, column: 21, scope: !2031)
!2035 = !DILocation(line: 4, column: 23, scope: !2031)
!2036 = !DILocation(line: 4, column: 9, scope: !2026)
!2037 = !DILocation(line: 6, column: 9, scope: !2038)
!2038 = distinct !DILexicalBlock(scope: !2031, file: !2027, line: 5, column: 5)
!2039 = !DILocation(line: 8, column: 5, scope: !2026)
!2040 = !DILocation(line: 9, column: 1, scope: !2026)
!2041 = distinct !DISubprogram(name: "__fizzer_model__isdigit", scope: !2042, file: !2042, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !158, retainedNodes: !63)
!2042 = !DIFile(filename: "data/models/c/std/ctype/isdigit.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "9967dfc55f3c5b9e8a34a1c12ab51128")
!2043 = !DILocalVariable(name: "c", arg: 1, scope: !2041, file: !2042, line: 2, type: !6)
!2044 = !DILocation(line: 2, column: 33, scope: !2041)
!2045 = !DILocation(line: 4, column: 9, scope: !2046)
!2046 = distinct !DILexicalBlock(scope: !2041, file: !2042, line: 4, column: 9)
!2047 = !DILocation(line: 4, column: 11, scope: !2046)
!2048 = !DILocation(line: 4, column: 18, scope: !2046)
!2049 = !DILocation(line: 4, column: 21, scope: !2046)
!2050 = !DILocation(line: 4, column: 23, scope: !2046)
!2051 = !DILocation(line: 4, column: 9, scope: !2041)
!2052 = !DILocation(line: 6, column: 9, scope: !2053)
!2053 = distinct !DILexicalBlock(scope: !2046, file: !2042, line: 5, column: 5)
!2054 = !DILocation(line: 8, column: 5, scope: !2041)
!2055 = !DILocation(line: 9, column: 1, scope: !2041)
!2056 = distinct !DISubprogram(name: "__fizzer_model__toupper", scope: !2057, file: !2057, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !160, retainedNodes: !63)
!2057 = !DIFile(filename: "data/models/c/std/ctype/toupper.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "35ae67ebdb17b245d732ce3603fdfa64")
!2058 = !DILocalVariable(name: "c", arg: 1, scope: !2056, file: !2057, line: 2, type: !6)
!2059 = !DILocation(line: 2, column: 33, scope: !2056)
!2060 = !DILocation(line: 4, column: 33, scope: !2061)
!2061 = distinct !DILexicalBlock(scope: !2056, file: !2057, line: 4, column: 9)
!2062 = !DILocation(line: 4, column: 9, scope: !2061)
!2063 = !DILocation(line: 4, column: 9, scope: !2056)
!2064 = !DILocation(line: 6, column: 16, scope: !2065)
!2065 = distinct !DILexicalBlock(scope: !2061, file: !2057, line: 5, column: 5)
!2066 = !DILocation(line: 6, column: 18, scope: !2065)
!2067 = !DILocation(line: 6, column: 24, scope: !2065)
!2068 = !DILocation(line: 6, column: 9, scope: !2065)
!2069 = !DILocation(line: 8, column: 12, scope: !2056)
!2070 = !DILocation(line: 8, column: 5, scope: !2056)
!2071 = !DILocation(line: 9, column: 1, scope: !2056)
!2072 = distinct !DISubprogram(name: "__fizzer_model__isprint", scope: !2073, file: !2073, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !162, retainedNodes: !63)
!2073 = !DIFile(filename: "data/models/c/std/ctype/isprint.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "d8538a5b382a98a36fe86b916256fcc7")
!2074 = !DILocalVariable(name: "c", arg: 1, scope: !2072, file: !2073, line: 2, type: !6)
!2075 = !DILocation(line: 2, column: 33, scope: !2072)
!2076 = !DILocation(line: 4, column: 9, scope: !2077)
!2077 = distinct !DILexicalBlock(scope: !2072, file: !2073, line: 4, column: 9)
!2078 = !DILocation(line: 4, column: 11, scope: !2077)
!2079 = !DILocation(line: 4, column: 17, scope: !2077)
!2080 = !DILocation(line: 4, column: 20, scope: !2077)
!2081 = !DILocation(line: 4, column: 22, scope: !2077)
!2082 = !DILocation(line: 4, column: 9, scope: !2072)
!2083 = !DILocation(line: 6, column: 9, scope: !2084)
!2084 = distinct !DILexicalBlock(scope: !2077, file: !2073, line: 5, column: 5)
!2085 = !DILocation(line: 8, column: 5, scope: !2072)
!2086 = !DILocation(line: 9, column: 1, scope: !2072)
!2087 = distinct !DISubprogram(name: "__fizzer_model__isupper", scope: !2088, file: !2088, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !164, retainedNodes: !63)
!2088 = !DIFile(filename: "data/models/c/std/ctype/isupper.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "c2334b5acdb0a1b26cc08f11cf47c244")
!2089 = !DILocalVariable(name: "c", arg: 1, scope: !2087, file: !2088, line: 2, type: !6)
!2090 = !DILocation(line: 2, column: 33, scope: !2087)
!2091 = !DILocation(line: 4, column: 9, scope: !2092)
!2092 = distinct !DILexicalBlock(scope: !2087, file: !2088, line: 4, column: 9)
!2093 = !DILocation(line: 4, column: 11, scope: !2092)
!2094 = !DILocation(line: 4, column: 18, scope: !2092)
!2095 = !DILocation(line: 4, column: 21, scope: !2092)
!2096 = !DILocation(line: 4, column: 23, scope: !2092)
!2097 = !DILocation(line: 4, column: 9, scope: !2087)
!2098 = !DILocation(line: 6, column: 9, scope: !2099)
!2099 = distinct !DILexicalBlock(scope: !2092, file: !2088, line: 5, column: 5)
!2100 = !DILocation(line: 8, column: 5, scope: !2087)
!2101 = !DILocation(line: 9, column: 1, scope: !2087)
!2102 = distinct !DISubprogram(name: "__fizzer_model__tolower", scope: !2103, file: !2103, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !166, retainedNodes: !63)
!2103 = !DIFile(filename: "data/models/c/std/ctype/tolower.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "7faecd1bd1600a814e6c8b43347332c3")
!2104 = !DILocalVariable(name: "c", arg: 1, scope: !2102, file: !2103, line: 2, type: !6)
!2105 = !DILocation(line: 2, column: 33, scope: !2102)
!2106 = !DILocation(line: 4, column: 33, scope: !2107)
!2107 = distinct !DILexicalBlock(scope: !2102, file: !2103, line: 4, column: 9)
!2108 = !DILocation(line: 4, column: 9, scope: !2107)
!2109 = !DILocation(line: 4, column: 9, scope: !2102)
!2110 = !DILocation(line: 6, column: 16, scope: !2111)
!2111 = distinct !DILexicalBlock(scope: !2107, file: !2103, line: 5, column: 5)
!2112 = !DILocation(line: 6, column: 18, scope: !2111)
!2113 = !DILocation(line: 6, column: 24, scope: !2111)
!2114 = !DILocation(line: 6, column: 9, scope: !2111)
!2115 = !DILocation(line: 8, column: 12, scope: !2102)
!2116 = !DILocation(line: 8, column: 5, scope: !2102)
!2117 = !DILocation(line: 9, column: 1, scope: !2102)
!2118 = distinct !DISubprogram(name: "__fizzer_model__isgraph", scope: !2119, file: !2119, line: 2, type: !761, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !168, retainedNodes: !63)
!2119 = !DIFile(filename: "data/models/c/std/ctype/isgraph.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "53707fda19088bc8e89fad78f4c3a13f")
!2120 = !DILocalVariable(name: "c", arg: 1, scope: !2118, file: !2119, line: 2, type: !6)
!2121 = !DILocation(line: 2, column: 33, scope: !2118)
!2122 = !DILocation(line: 4, column: 9, scope: !2123)
!2123 = distinct !DILexicalBlock(scope: !2118, file: !2119, line: 4, column: 9)
!2124 = !DILocation(line: 4, column: 11, scope: !2123)
!2125 = !DILocation(line: 4, column: 17, scope: !2123)
!2126 = !DILocation(line: 4, column: 20, scope: !2123)
!2127 = !DILocation(line: 4, column: 22, scope: !2123)
!2128 = !DILocation(line: 4, column: 9, scope: !2118)
!2129 = !DILocation(line: 6, column: 9, scope: !2130)
!2130 = distinct !DILexicalBlock(scope: !2123, file: !2119, line: 5, column: 5)
!2131 = !DILocation(line: 8, column: 5, scope: !2118)
!2132 = !DILocation(line: 9, column: 1, scope: !2118)
!2133 = distinct !DISubprogram(name: "__fizzer_model__snprintf", scope: !2134, file: !2134, line: 2, type: !2135, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !170, retainedNodes: !63)
!2134 = !DIFile(filename: "data/models/c/std/stdio/snprintf.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "76bc06d30e021e08fbd62dcb20d50aff")
!2135 = !DISubroutineType(types: !2136)
!2136 = !{!6, !13, !2137, !73, null}
!2137 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2138, line: 8, baseType: !253)
!2138 = !DIFile(filename: "data/models/c/std/stdio/snprintf.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "3041458efcb1c5564be86cab3319404a")
!2139 = !DILocalVariable(name: "str", arg: 1, scope: !2133, file: !2134, line: 2, type: !13)
!2140 = !DILocation(line: 2, column: 36, scope: !2133)
!2141 = !DILocalVariable(name: "size", arg: 2, scope: !2133, file: !2134, line: 2, type: !2137)
!2142 = !DILocation(line: 2, column: 48, scope: !2133)
!2143 = !DILocalVariable(name: "format", arg: 3, scope: !2133, file: !2134, line: 2, type: !73)
!2144 = !DILocation(line: 2, column: 66, scope: !2133)
!2145 = !DILocalVariable(name: "ap", scope: !2133, file: !2134, line: 4, type: !2146)
!2146 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !2138, line: 14, baseType: !2147)
!2147 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !2134, baseType: !13)
!2148 = !DILocation(line: 4, column: 13, scope: !2133)
!2149 = !DILocation(line: 5, column: 5, scope: !2133)
!2150 = !DILocalVariable(name: "result", scope: !2133, file: !2134, line: 6, type: !6)
!2151 = !DILocation(line: 6, column: 9, scope: !2133)
!2152 = !DILocation(line: 6, column: 44, scope: !2133)
!2153 = !DILocation(line: 6, column: 49, scope: !2133)
!2154 = !DILocation(line: 6, column: 55, scope: !2133)
!2155 = !DILocation(line: 6, column: 63, scope: !2133)
!2156 = !DILocation(line: 6, column: 18, scope: !2133)
!2157 = !DILocation(line: 7, column: 5, scope: !2133)
!2158 = !DILocation(line: 8, column: 12, scope: !2133)
!2159 = !DILocation(line: 8, column: 5, scope: !2133)
!2160 = distinct !DISubprogram(name: "__fizzer_model__sprintf", scope: !2161, file: !2161, line: 2, type: !2162, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !172, retainedNodes: !63)
!2161 = !DIFile(filename: "data/models/c/std/stdio/sprintf.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "56f45916c6775fca737b2a248636b9a4")
!2162 = !DISubroutineType(types: !2163)
!2163 = !{!6, !13, !73, null}
!2164 = !DILocalVariable(name: "str", arg: 1, scope: !2160, file: !2161, line: 2, type: !13)
!2165 = !DILocation(line: 2, column: 35, scope: !2160)
!2166 = !DILocalVariable(name: "format", arg: 2, scope: !2160, file: !2161, line: 2, type: !73)
!2167 = !DILocation(line: 2, column: 52, scope: !2160)
!2168 = !DILocalVariable(name: "ap", scope: !2160, file: !2161, line: 4, type: !2169)
!2169 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !2170, line: 4, baseType: !2171)
!2170 = !DIFile(filename: "data/models/c/std/stdio/sprintf.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "d6124a58b9c67c791cdec6fe4c5e48a1")
!2171 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !2161, baseType: !13)
!2172 = !DILocation(line: 4, column: 13, scope: !2160)
!2173 = !DILocation(line: 5, column: 5, scope: !2160)
!2174 = !DILocalVariable(name: "result", scope: !2160, file: !2161, line: 6, type: !6)
!2175 = !DILocation(line: 6, column: 9, scope: !2160)
!2176 = !DILocation(line: 6, column: 43, scope: !2160)
!2177 = !DILocation(line: 6, column: 48, scope: !2160)
!2178 = !DILocation(line: 6, column: 56, scope: !2160)
!2179 = !DILocation(line: 6, column: 18, scope: !2160)
!2180 = !DILocation(line: 7, column: 5, scope: !2160)
!2181 = !DILocation(line: 8, column: 12, scope: !2160)
!2182 = !DILocation(line: 8, column: 5, scope: !2160)
!2183 = distinct !DISubprogram(name: "__fizzer_model__vsprintf", scope: !2184, file: !2184, line: 2, type: !2185, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !174, retainedNodes: !63)
!2184 = !DIFile(filename: "data/models/c/std/stdio/vsprintf.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "108c7547e9301a0fdafaac5451fdb696")
!2185 = !DISubroutineType(types: !2186)
!2186 = !{!6, !13, !73, !2187}
!2187 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !2188, line: 14, baseType: !2189)
!2188 = !DIFile(filename: "data/models/c/std/stdio/vsprintf.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "22dc0c17cd450f7813777d9af49e0ce8")
!2189 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !2184, baseType: !13)
!2190 = !DILocalVariable(name: "str", arg: 1, scope: !2183, file: !2184, line: 2, type: !13)
!2191 = !DILocation(line: 2, column: 36, scope: !2183)
!2192 = !DILocalVariable(name: "format", arg: 2, scope: !2183, file: !2184, line: 2, type: !73)
!2193 = !DILocation(line: 2, column: 53, scope: !2183)
!2194 = !DILocalVariable(name: "ap", arg: 3, scope: !2183, file: !2184, line: 2, type: !2187)
!2195 = !DILocation(line: 2, column: 69, scope: !2183)
!2196 = !DILocalVariable(name: "i", scope: !2183, file: !2184, line: 4, type: !2197)
!2197 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2188, line: 8, baseType: !253)
!2198 = !DILocation(line: 4, column: 12, scope: !2183)
!2199 = !DILocalVariable(name: "j", scope: !2183, file: !2184, line: 5, type: !2197)
!2200 = !DILocation(line: 5, column: 12, scope: !2183)
!2201 = !DILocation(line: 7, column: 5, scope: !2183)
!2202 = !DILocation(line: 7, column: 12, scope: !2183)
!2203 = !DILocation(line: 7, column: 19, scope: !2183)
!2204 = !DILocation(line: 7, column: 22, scope: !2183)
!2205 = !DILocation(line: 9, column: 13, scope: !2206)
!2206 = distinct !DILexicalBlock(scope: !2207, file: !2184, line: 9, column: 13)
!2207 = distinct !DILexicalBlock(scope: !2183, file: !2184, line: 8, column: 5)
!2208 = !DILocation(line: 9, column: 20, scope: !2206)
!2209 = !DILocation(line: 9, column: 23, scope: !2206)
!2210 = !DILocation(line: 9, column: 13, scope: !2207)
!2211 = !DILocation(line: 11, column: 14, scope: !2212)
!2212 = distinct !DILexicalBlock(scope: !2206, file: !2184, line: 10, column: 9)
!2213 = !DILocation(line: 12, column: 17, scope: !2214)
!2214 = distinct !DILexicalBlock(scope: !2212, file: !2184, line: 12, column: 17)
!2215 = !DILocation(line: 12, column: 24, scope: !2214)
!2216 = !DILocation(line: 12, column: 27, scope: !2214)
!2217 = !DILocation(line: 12, column: 17, scope: !2212)
!2218 = !DILocation(line: 14, column: 17, scope: !2219)
!2219 = distinct !DILexicalBlock(scope: !2214, file: !2184, line: 13, column: 13)
!2220 = !DILocation(line: 17, column: 17, scope: !2221)
!2221 = distinct !DILexicalBlock(scope: !2212, file: !2184, line: 17, column: 17)
!2222 = !DILocation(line: 17, column: 24, scope: !2221)
!2223 = !DILocation(line: 17, column: 27, scope: !2221)
!2224 = !DILocation(line: 17, column: 17, scope: !2212)
!2225 = !DILocalVariable(name: "val", scope: !2226, file: !2184, line: 19, type: !6)
!2226 = distinct !DILexicalBlock(scope: !2221, file: !2184, line: 18, column: 13)
!2227 = !DILocation(line: 19, column: 21, scope: !2226)
!2228 = !DILocation(line: 19, column: 27, scope: !2226)
!2229 = !DILocalVariable(name: "buf", scope: !2226, file: !2184, line: 20, type: !2230)
!2230 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 256, elements: !2231)
!2231 = !{!2232}
!2232 = !DISubrange(count: 32)
!2233 = !DILocation(line: 20, column: 22, scope: !2226)
!2234 = !DILocation(line: 21, column: 45, scope: !2226)
!2235 = !DILocation(line: 21, column: 50, scope: !2226)
!2236 = !DILocation(line: 21, column: 17, scope: !2226)
!2237 = !DILocalVariable(name: "k", scope: !2226, file: !2184, line: 22, type: !2197)
!2238 = !DILocation(line: 22, column: 24, scope: !2226)
!2239 = !DILocation(line: 23, column: 17, scope: !2226)
!2240 = !DILocation(line: 23, column: 28, scope: !2226)
!2241 = !DILocation(line: 23, column: 24, scope: !2226)
!2242 = !DILocation(line: 23, column: 31, scope: !2226)
!2243 = !DILocation(line: 25, column: 34, scope: !2244)
!2244 = distinct !DILexicalBlock(scope: !2226, file: !2184, line: 24, column: 17)
!2245 = !DILocation(line: 25, column: 30, scope: !2244)
!2246 = !DILocation(line: 25, column: 21, scope: !2244)
!2247 = !DILocation(line: 25, column: 25, scope: !2244)
!2248 = !DILocation(line: 25, column: 28, scope: !2244)
!2249 = !DILocation(line: 26, column: 22, scope: !2244)
!2250 = !DILocation(line: 27, column: 22, scope: !2244)
!2251 = distinct !{!2251, !2239, !2252, !294}
!2252 = !DILocation(line: 28, column: 17, scope: !2226)
!2253 = !DILocation(line: 29, column: 13, scope: !2226)
!2254 = !DILocation(line: 30, column: 22, scope: !2255)
!2255 = distinct !DILexicalBlock(scope: !2221, file: !2184, line: 30, column: 22)
!2256 = !DILocation(line: 30, column: 29, scope: !2255)
!2257 = !DILocation(line: 30, column: 32, scope: !2255)
!2258 = !DILocation(line: 30, column: 22, scope: !2221)
!2259 = !DILocalVariable(name: "val", scope: !2260, file: !2184, line: 32, type: !253)
!2260 = distinct !DILexicalBlock(scope: !2255, file: !2184, line: 31, column: 13)
!2261 = !DILocation(line: 32, column: 30, scope: !2260)
!2262 = !DILocation(line: 32, column: 36, scope: !2260)
!2263 = !DILocalVariable(name: "buf", scope: !2260, file: !2184, line: 33, type: !2230)
!2264 = !DILocation(line: 33, column: 22, scope: !2260)
!2265 = !DILocation(line: 34, column: 50, scope: !2260)
!2266 = !DILocation(line: 34, column: 55, scope: !2260)
!2267 = !DILocation(line: 34, column: 17, scope: !2260)
!2268 = !DILocalVariable(name: "k", scope: !2260, file: !2184, line: 35, type: !2197)
!2269 = !DILocation(line: 35, column: 24, scope: !2260)
!2270 = !DILocation(line: 36, column: 17, scope: !2260)
!2271 = !DILocation(line: 36, column: 28, scope: !2260)
!2272 = !DILocation(line: 36, column: 24, scope: !2260)
!2273 = !DILocation(line: 36, column: 31, scope: !2260)
!2274 = !DILocation(line: 38, column: 34, scope: !2275)
!2275 = distinct !DILexicalBlock(scope: !2260, file: !2184, line: 37, column: 17)
!2276 = !DILocation(line: 38, column: 30, scope: !2275)
!2277 = !DILocation(line: 38, column: 21, scope: !2275)
!2278 = !DILocation(line: 38, column: 25, scope: !2275)
!2279 = !DILocation(line: 38, column: 28, scope: !2275)
!2280 = !DILocation(line: 39, column: 22, scope: !2275)
!2281 = !DILocation(line: 40, column: 22, scope: !2275)
!2282 = distinct !{!2282, !2270, !2283, !294}
!2283 = !DILocation(line: 41, column: 17, scope: !2260)
!2284 = !DILocation(line: 42, column: 13, scope: !2260)
!2285 = !DILocation(line: 43, column: 22, scope: !2286)
!2286 = distinct !DILexicalBlock(scope: !2255, file: !2184, line: 43, column: 22)
!2287 = !DILocation(line: 43, column: 29, scope: !2286)
!2288 = !DILocation(line: 43, column: 32, scope: !2286)
!2289 = !DILocation(line: 43, column: 22, scope: !2255)
!2290 = !DILocalVariable(name: "val", scope: !2291, file: !2184, line: 45, type: !253)
!2291 = distinct !DILexicalBlock(scope: !2286, file: !2184, line: 44, column: 13)
!2292 = !DILocation(line: 45, column: 30, scope: !2291)
!2293 = !DILocation(line: 45, column: 36, scope: !2291)
!2294 = !DILocalVariable(name: "buf", scope: !2291, file: !2184, line: 46, type: !2230)
!2295 = !DILocation(line: 46, column: 22, scope: !2291)
!2296 = !DILocation(line: 47, column: 50, scope: !2291)
!2297 = !DILocation(line: 47, column: 55, scope: !2291)
!2298 = !DILocation(line: 47, column: 17, scope: !2291)
!2299 = !DILocalVariable(name: "k", scope: !2291, file: !2184, line: 48, type: !2197)
!2300 = !DILocation(line: 48, column: 24, scope: !2291)
!2301 = !DILocation(line: 49, column: 17, scope: !2291)
!2302 = !DILocation(line: 49, column: 28, scope: !2291)
!2303 = !DILocation(line: 49, column: 24, scope: !2291)
!2304 = !DILocation(line: 49, column: 31, scope: !2291)
!2305 = !DILocation(line: 51, column: 34, scope: !2306)
!2306 = distinct !DILexicalBlock(scope: !2291, file: !2184, line: 50, column: 17)
!2307 = !DILocation(line: 51, column: 30, scope: !2306)
!2308 = !DILocation(line: 51, column: 21, scope: !2306)
!2309 = !DILocation(line: 51, column: 25, scope: !2306)
!2310 = !DILocation(line: 51, column: 28, scope: !2306)
!2311 = !DILocation(line: 52, column: 22, scope: !2306)
!2312 = !DILocation(line: 53, column: 22, scope: !2306)
!2313 = distinct !{!2313, !2301, !2314, !294}
!2314 = !DILocation(line: 54, column: 17, scope: !2291)
!2315 = !DILocation(line: 55, column: 13, scope: !2291)
!2316 = !DILocation(line: 56, column: 22, scope: !2317)
!2317 = distinct !DILexicalBlock(scope: !2286, file: !2184, line: 56, column: 22)
!2318 = !DILocation(line: 56, column: 29, scope: !2317)
!2319 = !DILocation(line: 56, column: 32, scope: !2317)
!2320 = !DILocation(line: 56, column: 22, scope: !2286)
!2321 = !DILocalVariable(name: "c", scope: !2322, file: !2184, line: 58, type: !14)
!2322 = distinct !DILexicalBlock(scope: !2317, file: !2184, line: 57, column: 13)
!2323 = !DILocation(line: 58, column: 22, scope: !2322)
!2324 = !DILocation(line: 58, column: 32, scope: !2322)
!2325 = !DILocation(line: 58, column: 26, scope: !2322)
!2326 = !DILocation(line: 59, column: 26, scope: !2322)
!2327 = !DILocation(line: 59, column: 17, scope: !2322)
!2328 = !DILocation(line: 59, column: 21, scope: !2322)
!2329 = !DILocation(line: 59, column: 24, scope: !2322)
!2330 = !DILocation(line: 60, column: 18, scope: !2322)
!2331 = !DILocation(line: 61, column: 13, scope: !2322)
!2332 = !DILocation(line: 62, column: 22, scope: !2333)
!2333 = distinct !DILexicalBlock(scope: !2317, file: !2184, line: 62, column: 22)
!2334 = !DILocation(line: 62, column: 29, scope: !2333)
!2335 = !DILocation(line: 62, column: 32, scope: !2333)
!2336 = !DILocation(line: 62, column: 22, scope: !2317)
!2337 = !DILocalVariable(name: "s", scope: !2338, file: !2184, line: 64, type: !13)
!2338 = distinct !DILexicalBlock(scope: !2333, file: !2184, line: 63, column: 13)
!2339 = !DILocation(line: 64, column: 23, scope: !2338)
!2340 = !DILocation(line: 64, column: 27, scope: !2338)
!2341 = !DILocalVariable(name: "k", scope: !2338, file: !2184, line: 65, type: !2197)
!2342 = !DILocation(line: 65, column: 24, scope: !2338)
!2343 = !DILocation(line: 66, column: 17, scope: !2338)
!2344 = !DILocation(line: 66, column: 24, scope: !2338)
!2345 = !DILocation(line: 66, column: 26, scope: !2338)
!2346 = !DILocation(line: 66, column: 29, scope: !2338)
!2347 = !DILocation(line: 68, column: 30, scope: !2348)
!2348 = distinct !DILexicalBlock(scope: !2338, file: !2184, line: 67, column: 17)
!2349 = !DILocation(line: 68, column: 32, scope: !2348)
!2350 = !DILocation(line: 68, column: 21, scope: !2348)
!2351 = !DILocation(line: 68, column: 25, scope: !2348)
!2352 = !DILocation(line: 68, column: 28, scope: !2348)
!2353 = !DILocation(line: 69, column: 22, scope: !2348)
!2354 = !DILocation(line: 70, column: 22, scope: !2348)
!2355 = distinct !{!2355, !2343, !2356, !294}
!2356 = !DILocation(line: 71, column: 17, scope: !2338)
!2357 = !DILocation(line: 72, column: 13, scope: !2338)
!2358 = !DILocation(line: 75, column: 26, scope: !2359)
!2359 = distinct !DILexicalBlock(scope: !2333, file: !2184, line: 74, column: 13)
!2360 = !DILocation(line: 75, column: 33, scope: !2359)
!2361 = !DILocation(line: 75, column: 17, scope: !2359)
!2362 = !DILocation(line: 75, column: 21, scope: !2359)
!2363 = !DILocation(line: 75, column: 24, scope: !2359)
!2364 = !DILocation(line: 76, column: 18, scope: !2359)
!2365 = !DILocation(line: 79, column: 14, scope: !2212)
!2366 = !DILocation(line: 80, column: 9, scope: !2212)
!2367 = !DILocation(line: 83, column: 22, scope: !2368)
!2368 = distinct !DILexicalBlock(scope: !2206, file: !2184, line: 82, column: 9)
!2369 = !DILocation(line: 83, column: 29, scope: !2368)
!2370 = !DILocation(line: 83, column: 13, scope: !2368)
!2371 = !DILocation(line: 83, column: 17, scope: !2368)
!2372 = !DILocation(line: 83, column: 20, scope: !2368)
!2373 = !DILocation(line: 84, column: 14, scope: !2368)
!2374 = !DILocation(line: 85, column: 14, scope: !2368)
!2375 = distinct !{!2375, !2201, !2376, !294}
!2376 = !DILocation(line: 87, column: 5, scope: !2183)
!2377 = !DILocation(line: 89, column: 5, scope: !2183)
!2378 = !DILocation(line: 89, column: 9, scope: !2183)
!2379 = !DILocation(line: 89, column: 12, scope: !2183)
!2380 = !DILocation(line: 91, column: 17, scope: !2183)
!2381 = !DILocation(line: 91, column: 5, scope: !2183)
!2382 = distinct !DISubprogram(name: "__fizzer_model__helper_itoa", scope: !2383, file: !2383, line: 2, type: !2384, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !177, retainedNodes: !63)
!2383 = !DIFile(filename: "data/models/c/std/stdio/helper_itoa.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "20d31603d5d66432f19663f52fc24b10")
!2384 = !DISubroutineType(types: !2385)
!2385 = !{null, !6, !13, !6}
!2386 = !DILocalVariable(name: "value", arg: 1, scope: !2382, file: !2383, line: 2, type: !6)
!2387 = !DILocation(line: 2, column: 38, scope: !2382)
!2388 = !DILocalVariable(name: "buffer", arg: 2, scope: !2382, file: !2383, line: 2, type: !13)
!2389 = !DILocation(line: 2, column: 51, scope: !2382)
!2390 = !DILocalVariable(name: "base", arg: 3, scope: !2382, file: !2383, line: 2, type: !6)
!2391 = !DILocation(line: 2, column: 63, scope: !2382)
!2392 = !DILocalVariable(name: "temp", scope: !2382, file: !2383, line: 4, type: !2230)
!2393 = !DILocation(line: 4, column: 10, scope: !2382)
!2394 = !DILocalVariable(name: "i", scope: !2382, file: !2383, line: 5, type: !6)
!2395 = !DILocation(line: 5, column: 9, scope: !2382)
!2396 = !DILocalVariable(name: "is_negative", scope: !2382, file: !2383, line: 6, type: !6)
!2397 = !DILocation(line: 6, column: 9, scope: !2382)
!2398 = !DILocation(line: 8, column: 9, scope: !2399)
!2399 = distinct !DILexicalBlock(scope: !2382, file: !2383, line: 8, column: 9)
!2400 = !DILocation(line: 8, column: 15, scope: !2399)
!2401 = !DILocation(line: 8, column: 19, scope: !2399)
!2402 = !DILocation(line: 8, column: 22, scope: !2399)
!2403 = !DILocation(line: 8, column: 27, scope: !2399)
!2404 = !DILocation(line: 8, column: 9, scope: !2382)
!2405 = !DILocation(line: 10, column: 21, scope: !2406)
!2406 = distinct !DILexicalBlock(scope: !2399, file: !2383, line: 9, column: 5)
!2407 = !DILocation(line: 11, column: 18, scope: !2406)
!2408 = !DILocation(line: 11, column: 17, scope: !2406)
!2409 = !DILocation(line: 11, column: 15, scope: !2406)
!2410 = !DILocation(line: 12, column: 5, scope: !2406)
!2411 = !DILocation(line: 14, column: 9, scope: !2412)
!2412 = distinct !DILexicalBlock(scope: !2382, file: !2383, line: 14, column: 9)
!2413 = !DILocation(line: 14, column: 15, scope: !2412)
!2414 = !DILocation(line: 14, column: 9, scope: !2382)
!2415 = !DILocation(line: 16, column: 9, scope: !2416)
!2416 = distinct !DILexicalBlock(scope: !2412, file: !2383, line: 15, column: 5)
!2417 = !DILocation(line: 16, column: 19, scope: !2416)
!2418 = !DILocation(line: 17, column: 9, scope: !2416)
!2419 = !DILocation(line: 17, column: 19, scope: !2416)
!2420 = !DILocation(line: 18, column: 9, scope: !2416)
!2421 = !DILocation(line: 21, column: 5, scope: !2382)
!2422 = !DILocation(line: 21, column: 12, scope: !2382)
!2423 = !DILocation(line: 21, column: 18, scope: !2382)
!2424 = !DILocalVariable(name: "rem", scope: !2425, file: !2383, line: 23, type: !6)
!2425 = distinct !DILexicalBlock(scope: !2382, file: !2383, line: 22, column: 5)
!2426 = !DILocation(line: 23, column: 13, scope: !2425)
!2427 = !DILocation(line: 23, column: 19, scope: !2425)
!2428 = !DILocation(line: 23, column: 27, scope: !2425)
!2429 = !DILocation(line: 23, column: 25, scope: !2425)
!2430 = !DILocation(line: 24, column: 13, scope: !2431)
!2431 = distinct !DILexicalBlock(scope: !2425, file: !2383, line: 24, column: 13)
!2432 = !DILocation(line: 24, column: 17, scope: !2431)
!2433 = !DILocation(line: 24, column: 13, scope: !2425)
!2434 = !DILocation(line: 26, column: 29, scope: !2435)
!2435 = distinct !DILexicalBlock(scope: !2431, file: !2383, line: 25, column: 9)
!2436 = !DILocation(line: 26, column: 27, scope: !2435)
!2437 = !DILocation(line: 26, column: 23, scope: !2435)
!2438 = !DILocation(line: 26, column: 18, scope: !2435)
!2439 = !DILocation(line: 26, column: 13, scope: !2435)
!2440 = !DILocation(line: 26, column: 21, scope: !2435)
!2441 = !DILocation(line: 27, column: 9, scope: !2435)
!2442 = !DILocation(line: 30, column: 30, scope: !2443)
!2443 = distinct !DILexicalBlock(scope: !2431, file: !2383, line: 29, column: 9)
!2444 = !DILocation(line: 30, column: 34, scope: !2443)
!2445 = !DILocation(line: 30, column: 27, scope: !2443)
!2446 = !DILocation(line: 30, column: 23, scope: !2443)
!2447 = !DILocation(line: 30, column: 18, scope: !2443)
!2448 = !DILocation(line: 30, column: 13, scope: !2443)
!2449 = !DILocation(line: 30, column: 21, scope: !2443)
!2450 = !DILocation(line: 32, column: 17, scope: !2425)
!2451 = !DILocation(line: 32, column: 25, scope: !2425)
!2452 = !DILocation(line: 32, column: 23, scope: !2425)
!2453 = !DILocation(line: 32, column: 15, scope: !2425)
!2454 = !DILocation(line: 33, column: 10, scope: !2425)
!2455 = distinct !{!2455, !2421, !2456, !294}
!2456 = !DILocation(line: 34, column: 5, scope: !2382)
!2457 = !DILocalVariable(name: "j", scope: !2382, file: !2383, line: 36, type: !6)
!2458 = !DILocation(line: 36, column: 9, scope: !2382)
!2459 = !DILocation(line: 37, column: 9, scope: !2460)
!2460 = distinct !DILexicalBlock(scope: !2382, file: !2383, line: 37, column: 9)
!2461 = !DILocation(line: 37, column: 9, scope: !2382)
!2462 = !DILocation(line: 39, column: 9, scope: !2463)
!2463 = distinct !DILexicalBlock(scope: !2460, file: !2383, line: 38, column: 5)
!2464 = !DILocation(line: 39, column: 16, scope: !2463)
!2465 = !DILocation(line: 39, column: 19, scope: !2463)
!2466 = !DILocation(line: 40, column: 10, scope: !2463)
!2467 = !DILocation(line: 41, column: 5, scope: !2463)
!2468 = !DILocation(line: 43, column: 5, scope: !2382)
!2469 = !DILocation(line: 43, column: 12, scope: !2382)
!2470 = !DILocation(line: 43, column: 14, scope: !2382)
!2471 = !DILocation(line: 45, column: 10, scope: !2472)
!2472 = distinct !DILexicalBlock(scope: !2382, file: !2383, line: 44, column: 5)
!2473 = !DILocation(line: 46, column: 26, scope: !2472)
!2474 = !DILocation(line: 46, column: 21, scope: !2472)
!2475 = !DILocation(line: 46, column: 9, scope: !2472)
!2476 = !DILocation(line: 46, column: 16, scope: !2472)
!2477 = !DILocation(line: 46, column: 19, scope: !2472)
!2478 = !DILocation(line: 47, column: 10, scope: !2472)
!2479 = distinct !{!2479, !2468, !2480, !294}
!2480 = !DILocation(line: 48, column: 5, scope: !2382)
!2481 = !DILocation(line: 50, column: 5, scope: !2382)
!2482 = !DILocation(line: 50, column: 12, scope: !2382)
!2483 = !DILocation(line: 50, column: 15, scope: !2382)
!2484 = !DILocation(line: 51, column: 1, scope: !2382)
!2485 = distinct !DISubprogram(name: "__fizzer_model__vsnprintf", scope: !2486, file: !2486, line: 2, type: !2487, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !179, retainedNodes: !63)
!2486 = !DIFile(filename: "data/models/c/std/stdio/vsnprintf.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "97ba02a558780981a4df185c06cf20d5")
!2487 = !DISubroutineType(types: !2488)
!2488 = !{!6, !13, !2489, !73, !2491}
!2489 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2490, line: 8, baseType: !253)
!2490 = !DIFile(filename: "data/models/c/std/stdio/vsnprintf.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "811d6d74b8b56631aab99e8a3863ea0c")
!2491 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !2490, line: 14, baseType: !2492)
!2492 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !2486, baseType: !13)
!2493 = !DILocalVariable(name: "str", arg: 1, scope: !2485, file: !2486, line: 2, type: !13)
!2494 = !DILocation(line: 2, column: 37, scope: !2485)
!2495 = !DILocalVariable(name: "size", arg: 2, scope: !2485, file: !2486, line: 2, type: !2489)
!2496 = !DILocation(line: 2, column: 49, scope: !2485)
!2497 = !DILocalVariable(name: "format", arg: 3, scope: !2485, file: !2486, line: 2, type: !73)
!2498 = !DILocation(line: 2, column: 67, scope: !2485)
!2499 = !DILocalVariable(name: "ap", arg: 4, scope: !2485, file: !2486, line: 2, type: !2491)
!2500 = !DILocation(line: 2, column: 83, scope: !2485)
!2501 = !DILocalVariable(name: "i", scope: !2485, file: !2486, line: 4, type: !2489)
!2502 = !DILocation(line: 4, column: 12, scope: !2485)
!2503 = !DILocalVariable(name: "j", scope: !2485, file: !2486, line: 5, type: !2489)
!2504 = !DILocation(line: 5, column: 12, scope: !2485)
!2505 = !DILocation(line: 7, column: 9, scope: !2506)
!2506 = distinct !DILexicalBlock(scope: !2485, file: !2486, line: 7, column: 9)
!2507 = !DILocation(line: 7, column: 14, scope: !2506)
!2508 = !DILocation(line: 7, column: 9, scope: !2485)
!2509 = !DILocation(line: 9, column: 9, scope: !2510)
!2510 = distinct !DILexicalBlock(scope: !2506, file: !2486, line: 8, column: 5)
!2511 = !DILocation(line: 12, column: 5, scope: !2485)
!2512 = !DILocation(line: 12, column: 12, scope: !2485)
!2513 = !DILocation(line: 12, column: 19, scope: !2485)
!2514 = !DILocation(line: 12, column: 22, scope: !2485)
!2515 = !DILocation(line: 12, column: 27, scope: !2485)
!2516 = !DILocation(line: 12, column: 30, scope: !2485)
!2517 = !DILocation(line: 12, column: 34, scope: !2485)
!2518 = !DILocation(line: 12, column: 39, scope: !2485)
!2519 = !DILocation(line: 12, column: 32, scope: !2485)
!2520 = !DILocation(line: 0, scope: !2485)
!2521 = !DILocation(line: 14, column: 13, scope: !2522)
!2522 = distinct !DILexicalBlock(scope: !2523, file: !2486, line: 14, column: 13)
!2523 = distinct !DILexicalBlock(scope: !2485, file: !2486, line: 13, column: 5)
!2524 = !DILocation(line: 14, column: 20, scope: !2522)
!2525 = !DILocation(line: 14, column: 23, scope: !2522)
!2526 = !DILocation(line: 14, column: 13, scope: !2523)
!2527 = !DILocation(line: 16, column: 14, scope: !2528)
!2528 = distinct !DILexicalBlock(scope: !2522, file: !2486, line: 15, column: 9)
!2529 = !DILocation(line: 17, column: 17, scope: !2530)
!2530 = distinct !DILexicalBlock(scope: !2528, file: !2486, line: 17, column: 17)
!2531 = !DILocation(line: 17, column: 24, scope: !2530)
!2532 = !DILocation(line: 17, column: 27, scope: !2530)
!2533 = !DILocation(line: 17, column: 17, scope: !2528)
!2534 = !DILocation(line: 19, column: 17, scope: !2535)
!2535 = distinct !DILexicalBlock(scope: !2530, file: !2486, line: 18, column: 13)
!2536 = !DILocalVariable(name: "buf", scope: !2528, file: !2486, line: 22, type: !2230)
!2537 = !DILocation(line: 22, column: 18, scope: !2528)
!2538 = !DILocalVariable(name: "k", scope: !2528, file: !2486, line: 23, type: !2489)
!2539 = !DILocation(line: 23, column: 20, scope: !2528)
!2540 = !DILocation(line: 25, column: 17, scope: !2541)
!2541 = distinct !DILexicalBlock(scope: !2528, file: !2486, line: 25, column: 17)
!2542 = !DILocation(line: 25, column: 24, scope: !2541)
!2543 = !DILocation(line: 25, column: 27, scope: !2541)
!2544 = !DILocation(line: 25, column: 17, scope: !2528)
!2545 = !DILocalVariable(name: "val", scope: !2546, file: !2486, line: 27, type: !6)
!2546 = distinct !DILexicalBlock(scope: !2541, file: !2486, line: 26, column: 13)
!2547 = !DILocation(line: 27, column: 21, scope: !2546)
!2548 = !DILocation(line: 27, column: 27, scope: !2546)
!2549 = !DILocation(line: 28, column: 45, scope: !2546)
!2550 = !DILocation(line: 28, column: 50, scope: !2546)
!2551 = !DILocation(line: 28, column: 17, scope: !2546)
!2552 = !DILocation(line: 29, column: 13, scope: !2546)
!2553 = !DILocation(line: 30, column: 22, scope: !2554)
!2554 = distinct !DILexicalBlock(scope: !2541, file: !2486, line: 30, column: 22)
!2555 = !DILocation(line: 30, column: 29, scope: !2554)
!2556 = !DILocation(line: 30, column: 32, scope: !2554)
!2557 = !DILocation(line: 30, column: 22, scope: !2541)
!2558 = !DILocalVariable(name: "val", scope: !2559, file: !2486, line: 32, type: !253)
!2559 = distinct !DILexicalBlock(scope: !2554, file: !2486, line: 31, column: 13)
!2560 = !DILocation(line: 32, column: 30, scope: !2559)
!2561 = !DILocation(line: 32, column: 36, scope: !2559)
!2562 = !DILocation(line: 33, column: 50, scope: !2559)
!2563 = !DILocation(line: 33, column: 55, scope: !2559)
!2564 = !DILocation(line: 33, column: 17, scope: !2559)
!2565 = !DILocation(line: 34, column: 13, scope: !2559)
!2566 = !DILocation(line: 35, column: 22, scope: !2567)
!2567 = distinct !DILexicalBlock(scope: !2554, file: !2486, line: 35, column: 22)
!2568 = !DILocation(line: 35, column: 29, scope: !2567)
!2569 = !DILocation(line: 35, column: 32, scope: !2567)
!2570 = !DILocation(line: 35, column: 22, scope: !2554)
!2571 = !DILocalVariable(name: "val", scope: !2572, file: !2486, line: 37, type: !253)
!2572 = distinct !DILexicalBlock(scope: !2567, file: !2486, line: 36, column: 13)
!2573 = !DILocation(line: 37, column: 30, scope: !2572)
!2574 = !DILocation(line: 37, column: 36, scope: !2572)
!2575 = !DILocation(line: 38, column: 50, scope: !2572)
!2576 = !DILocation(line: 38, column: 55, scope: !2572)
!2577 = !DILocation(line: 38, column: 17, scope: !2572)
!2578 = !DILocation(line: 39, column: 13, scope: !2572)
!2579 = !DILocation(line: 40, column: 22, scope: !2580)
!2580 = distinct !DILexicalBlock(scope: !2567, file: !2486, line: 40, column: 22)
!2581 = !DILocation(line: 40, column: 29, scope: !2580)
!2582 = !DILocation(line: 40, column: 32, scope: !2580)
!2583 = !DILocation(line: 40, column: 22, scope: !2567)
!2584 = !DILocation(line: 42, column: 32, scope: !2585)
!2585 = distinct !DILexicalBlock(scope: !2580, file: !2486, line: 41, column: 13)
!2586 = !DILocation(line: 42, column: 26, scope: !2585)
!2587 = !DILocation(line: 42, column: 17, scope: !2585)
!2588 = !DILocation(line: 42, column: 24, scope: !2585)
!2589 = !DILocation(line: 43, column: 17, scope: !2585)
!2590 = !DILocation(line: 43, column: 24, scope: !2585)
!2591 = !DILocation(line: 44, column: 13, scope: !2585)
!2592 = !DILocation(line: 45, column: 22, scope: !2593)
!2593 = distinct !DILexicalBlock(scope: !2580, file: !2486, line: 45, column: 22)
!2594 = !DILocation(line: 45, column: 29, scope: !2593)
!2595 = !DILocation(line: 45, column: 32, scope: !2593)
!2596 = !DILocation(line: 45, column: 22, scope: !2580)
!2597 = !DILocalVariable(name: "s", scope: !2598, file: !2486, line: 47, type: !13)
!2598 = distinct !DILexicalBlock(scope: !2593, file: !2486, line: 46, column: 13)
!2599 = !DILocation(line: 47, column: 23, scope: !2598)
!2600 = !DILocation(line: 47, column: 27, scope: !2598)
!2601 = !DILocation(line: 48, column: 19, scope: !2598)
!2602 = !DILocation(line: 49, column: 17, scope: !2598)
!2603 = !DILocation(line: 49, column: 24, scope: !2598)
!2604 = !DILocation(line: 49, column: 26, scope: !2598)
!2605 = !DILocation(line: 49, column: 29, scope: !2598)
!2606 = !DILocation(line: 49, column: 34, scope: !2598)
!2607 = !DILocation(line: 49, column: 37, scope: !2598)
!2608 = !DILocation(line: 49, column: 41, scope: !2598)
!2609 = !DILocation(line: 49, column: 46, scope: !2598)
!2610 = !DILocation(line: 49, column: 39, scope: !2598)
!2611 = !DILocation(line: 0, scope: !2598)
!2612 = !DILocation(line: 51, column: 30, scope: !2613)
!2613 = distinct !DILexicalBlock(scope: !2598, file: !2486, line: 50, column: 17)
!2614 = !DILocation(line: 51, column: 32, scope: !2613)
!2615 = !DILocation(line: 51, column: 21, scope: !2613)
!2616 = !DILocation(line: 51, column: 25, scope: !2613)
!2617 = !DILocation(line: 51, column: 28, scope: !2613)
!2618 = !DILocation(line: 52, column: 22, scope: !2613)
!2619 = !DILocation(line: 53, column: 22, scope: !2613)
!2620 = distinct !{!2620, !2602, !2621, !294}
!2621 = !DILocation(line: 54, column: 17, scope: !2598)
!2622 = !DILocation(line: 55, column: 18, scope: !2598)
!2623 = !DILocation(line: 56, column: 17, scope: !2598)
!2624 = distinct !{!2624, !2511, !2625, !294}
!2625 = !DILocation(line: 80, column: 5, scope: !2485)
!2626 = !DILocation(line: 60, column: 26, scope: !2627)
!2627 = distinct !DILexicalBlock(scope: !2593, file: !2486, line: 59, column: 13)
!2628 = !DILocation(line: 60, column: 33, scope: !2627)
!2629 = !DILocation(line: 60, column: 17, scope: !2627)
!2630 = !DILocation(line: 60, column: 24, scope: !2627)
!2631 = !DILocation(line: 61, column: 17, scope: !2627)
!2632 = !DILocation(line: 61, column: 24, scope: !2627)
!2633 = !DILocation(line: 64, column: 15, scope: !2528)
!2634 = !DILocation(line: 65, column: 13, scope: !2528)
!2635 = !DILocation(line: 65, column: 24, scope: !2528)
!2636 = !DILocation(line: 65, column: 20, scope: !2528)
!2637 = !DILocation(line: 65, column: 27, scope: !2528)
!2638 = !DILocation(line: 65, column: 32, scope: !2528)
!2639 = !DILocation(line: 65, column: 35, scope: !2528)
!2640 = !DILocation(line: 65, column: 39, scope: !2528)
!2641 = !DILocation(line: 65, column: 44, scope: !2528)
!2642 = !DILocation(line: 65, column: 37, scope: !2528)
!2643 = !DILocation(line: 0, scope: !2528)
!2644 = !DILocation(line: 67, column: 30, scope: !2645)
!2645 = distinct !DILexicalBlock(scope: !2528, file: !2486, line: 66, column: 13)
!2646 = !DILocation(line: 67, column: 26, scope: !2645)
!2647 = !DILocation(line: 67, column: 17, scope: !2645)
!2648 = !DILocation(line: 67, column: 21, scope: !2645)
!2649 = !DILocation(line: 67, column: 24, scope: !2645)
!2650 = !DILocation(line: 68, column: 18, scope: !2645)
!2651 = !DILocation(line: 69, column: 18, scope: !2645)
!2652 = distinct !{!2652, !2634, !2653, !294}
!2653 = !DILocation(line: 70, column: 13, scope: !2528)
!2654 = !DILocation(line: 72, column: 14, scope: !2528)
!2655 = !DILocation(line: 73, column: 9, scope: !2528)
!2656 = !DILocation(line: 76, column: 22, scope: !2657)
!2657 = distinct !DILexicalBlock(scope: !2522, file: !2486, line: 75, column: 9)
!2658 = !DILocation(line: 76, column: 29, scope: !2657)
!2659 = !DILocation(line: 76, column: 13, scope: !2657)
!2660 = !DILocation(line: 76, column: 17, scope: !2657)
!2661 = !DILocation(line: 76, column: 20, scope: !2657)
!2662 = !DILocation(line: 77, column: 14, scope: !2657)
!2663 = !DILocation(line: 78, column: 14, scope: !2657)
!2664 = !DILocation(line: 82, column: 5, scope: !2485)
!2665 = !DILocation(line: 82, column: 9, scope: !2485)
!2666 = !DILocation(line: 82, column: 12, scope: !2485)
!2667 = !DILocation(line: 83, column: 17, scope: !2485)
!2668 = !DILocation(line: 83, column: 5, scope: !2485)
!2669 = !DILocation(line: 84, column: 1, scope: !2485)
!2670 = distinct !DISubprogram(name: "__fizzer_model__fabsl", scope: !2671, file: !2671, line: 2, type: !2672, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !181, retainedNodes: !63)
!2671 = !DIFile(filename: "data/models/c/std/math/fabsl.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "5c5076ae740114377af63cf033329357")
!2672 = !DISubroutineType(types: !2673)
!2673 = !{!2674, !2674}
!2674 = !DIBasicType(name: "long double", size: 96, encoding: DW_ATE_float)
!2675 = !DILocalVariable(name: "x", arg: 1, scope: !2670, file: !2671, line: 2, type: !2674)
!2676 = !DILocation(line: 2, column: 47, scope: !2670)
!2677 = !DILocation(line: 4, column: 9, scope: !2678)
!2678 = distinct !DILexicalBlock(scope: !2670, file: !2671, line: 4, column: 9)
!2679 = !DILocation(line: 4, column: 11, scope: !2678)
!2680 = !DILocation(line: 4, column: 9, scope: !2670)
!2681 = !DILocation(line: 5, column: 17, scope: !2678)
!2682 = !DILocation(line: 5, column: 16, scope: !2678)
!2683 = !DILocation(line: 5, column: 9, scope: !2678)
!2684 = !DILocation(line: 7, column: 16, scope: !2678)
!2685 = !DILocation(line: 7, column: 9, scope: !2678)
!2686 = !DILocation(line: 8, column: 1, scope: !2670)
!2687 = distinct !DISubprogram(name: "__fizzer_model__fabs", scope: !2688, file: !2688, line: 2, type: !2689, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !183, retainedNodes: !63)
!2688 = !DIFile(filename: "data/models/c/std/math/fabs.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "8c49c577f21ca028a8a9f5afb48aacbb")
!2689 = !DISubroutineType(types: !2690)
!2690 = !{!88, !88}
!2691 = !DILocalVariable(name: "x", arg: 1, scope: !2687, file: !2688, line: 2, type: !88)
!2692 = !DILocation(line: 2, column: 36, scope: !2687)
!2693 = !DILocation(line: 4, column: 9, scope: !2694)
!2694 = distinct !DILexicalBlock(scope: !2687, file: !2688, line: 4, column: 9)
!2695 = !DILocation(line: 4, column: 11, scope: !2694)
!2696 = !DILocation(line: 4, column: 9, scope: !2687)
!2697 = !DILocation(line: 5, column: 17, scope: !2694)
!2698 = !DILocation(line: 5, column: 16, scope: !2694)
!2699 = !DILocation(line: 5, column: 9, scope: !2694)
!2700 = !DILocation(line: 7, column: 16, scope: !2694)
!2701 = !DILocation(line: 7, column: 9, scope: !2694)
!2702 = !DILocation(line: 8, column: 1, scope: !2687)
!2703 = distinct !DISubprogram(name: "__fizzer_model__fabsf", scope: !2704, file: !2704, line: 2, type: !2705, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !185, retainedNodes: !63)
!2704 = !DIFile(filename: "data/models/c/std/math/fabsf.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "b084fca80d77cc63411b9d4b3fe450c4")
!2705 = !DISubroutineType(types: !2706)
!2706 = !{!2707, !2707}
!2707 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!2708 = !DILocalVariable(name: "x", arg: 1, scope: !2703, file: !2704, line: 2, type: !2707)
!2709 = !DILocation(line: 2, column: 35, scope: !2703)
!2710 = !DILocation(line: 4, column: 9, scope: !2711)
!2711 = distinct !DILexicalBlock(scope: !2703, file: !2704, line: 4, column: 9)
!2712 = !DILocation(line: 4, column: 11, scope: !2711)
!2713 = !DILocation(line: 4, column: 9, scope: !2703)
!2714 = !DILocation(line: 5, column: 17, scope: !2711)
!2715 = !DILocation(line: 5, column: 16, scope: !2711)
!2716 = !DILocation(line: 5, column: 9, scope: !2711)
!2717 = !DILocation(line: 7, column: 16, scope: !2711)
!2718 = !DILocation(line: 7, column: 9, scope: !2711)
!2719 = !DILocation(line: 8, column: 1, scope: !2703)
!2720 = distinct !DISubprogram(name: "__fizzer_model__strftime", scope: !2721, file: !2721, line: 3, type: !2722, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !187, retainedNodes: !63)
!2721 = !DIFile(filename: "data/models/c/std/time/strftime.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "60233b54b62040efdc56806d7e2f5c85")
!2722 = !DISubroutineType(types: !2723)
!2723 = !{!2724, !13, !2726, !73, !2728}
!2724 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2725, line: 8, baseType: !253)
!2725 = !DIFile(filename: "data/models/c/std/time/strftime.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "0140443382a318fb7fcf42588cda3812")
!2726 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2727, line: 18, baseType: !253)
!2727 = !DIFile(filename: "/usr/lib/llvm-18/lib/clang/18/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!2728 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2729, size: 32)
!2729 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2730)
!2730 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !2731, line: 7, size: 352, elements: !2732)
!2731 = !DIFile(filename: "/usr/include/bits/types/struct_tm.h", directory: "", checksumkind: CSK_MD5, checksum: "9e5545b565ef031c4cd0faf90b69386f")
!2732 = !{!2733, !2734, !2735, !2736, !2737, !2738, !2739, !2740, !2741, !2742, !2743}
!2733 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !2730, file: !2731, line: 9, baseType: !6, size: 32)
!2734 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !2730, file: !2731, line: 10, baseType: !6, size: 32, offset: 32)
!2735 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !2730, file: !2731, line: 11, baseType: !6, size: 32, offset: 64)
!2736 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !2730, file: !2731, line: 12, baseType: !6, size: 32, offset: 96)
!2737 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !2730, file: !2731, line: 13, baseType: !6, size: 32, offset: 128)
!2738 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !2730, file: !2731, line: 14, baseType: !6, size: 32, offset: 160)
!2739 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !2730, file: !2731, line: 15, baseType: !6, size: 32, offset: 192)
!2740 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !2730, file: !2731, line: 16, baseType: !6, size: 32, offset: 224)
!2741 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !2730, file: !2731, line: 17, baseType: !6, size: 32, offset: 256)
!2742 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !2730, file: !2731, line: 20, baseType: !779, size: 32, offset: 288)
!2743 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !2730, file: !2731, line: 21, baseType: !73, size: 32, offset: 320)
!2744 = !DILocalVariable(name: "s", arg: 1, scope: !2720, file: !2721, line: 3, type: !13)
!2745 = !DILocation(line: 3, column: 39, scope: !2720)
!2746 = !DILocalVariable(name: "max", arg: 2, scope: !2720, file: !2721, line: 3, type: !2726)
!2747 = !DILocation(line: 3, column: 49, scope: !2720)
!2748 = !DILocalVariable(name: "format", arg: 3, scope: !2720, file: !2721, line: 3, type: !73)
!2749 = !DILocation(line: 3, column: 66, scope: !2720)
!2750 = !DILocalVariable(name: "tm", arg: 4, scope: !2720, file: !2721, line: 3, type: !2728)
!2751 = !DILocation(line: 3, column: 91, scope: !2720)
!2752 = !DILocalVariable(name: "i", scope: !2720, file: !2721, line: 5, type: !2726)
!2753 = !DILocation(line: 5, column: 12, scope: !2720)
!2754 = !DILocalVariable(name: "j", scope: !2720, file: !2721, line: 6, type: !2726)
!2755 = !DILocation(line: 6, column: 12, scope: !2720)
!2756 = !DILocalVariable(name: "buf", scope: !2720, file: !2721, line: 8, type: !53)
!2757 = !DILocation(line: 8, column: 10, scope: !2720)
!2758 = !DILocation(line: 10, column: 5, scope: !2720)
!2759 = !DILocation(line: 10, column: 12, scope: !2720)
!2760 = !DILocation(line: 10, column: 19, scope: !2720)
!2761 = !DILocation(line: 10, column: 22, scope: !2720)
!2762 = !DILocation(line: 10, column: 27, scope: !2720)
!2763 = !DILocation(line: 10, column: 30, scope: !2720)
!2764 = !DILocation(line: 10, column: 34, scope: !2720)
!2765 = !DILocation(line: 10, column: 38, scope: !2720)
!2766 = !DILocation(line: 10, column: 32, scope: !2720)
!2767 = !DILocation(line: 0, scope: !2720)
!2768 = !DILocation(line: 12, column: 13, scope: !2769)
!2769 = distinct !DILexicalBlock(scope: !2770, file: !2721, line: 12, column: 13)
!2770 = distinct !DILexicalBlock(scope: !2720, file: !2721, line: 11, column: 5)
!2771 = !DILocation(line: 12, column: 20, scope: !2769)
!2772 = !DILocation(line: 12, column: 23, scope: !2769)
!2773 = !DILocation(line: 12, column: 13, scope: !2770)
!2774 = !DILocation(line: 14, column: 14, scope: !2775)
!2775 = distinct !DILexicalBlock(scope: !2769, file: !2721, line: 13, column: 9)
!2776 = !DILocation(line: 15, column: 17, scope: !2777)
!2777 = distinct !DILexicalBlock(scope: !2775, file: !2721, line: 15, column: 17)
!2778 = !DILocation(line: 15, column: 24, scope: !2777)
!2779 = !DILocation(line: 15, column: 27, scope: !2777)
!2780 = !DILocation(line: 15, column: 17, scope: !2775)
!2781 = !DILocation(line: 17, column: 17, scope: !2782)
!2782 = distinct !DILexicalBlock(scope: !2777, file: !2721, line: 16, column: 13)
!2783 = !DILocalVariable(name: "k", scope: !2775, file: !2721, line: 20, type: !6)
!2784 = !DILocation(line: 20, column: 17, scope: !2775)
!2785 = !DILocation(line: 21, column: 17, scope: !2786)
!2786 = distinct !DILexicalBlock(scope: !2775, file: !2721, line: 21, column: 17)
!2787 = !DILocation(line: 21, column: 24, scope: !2786)
!2788 = !DILocation(line: 21, column: 27, scope: !2786)
!2789 = !DILocation(line: 21, column: 17, scope: !2775)
!2790 = !DILocalVariable(name: "year", scope: !2791, file: !2721, line: 23, type: !6)
!2791 = distinct !DILexicalBlock(scope: !2786, file: !2721, line: 22, column: 13)
!2792 = !DILocation(line: 23, column: 21, scope: !2791)
!2793 = !DILocation(line: 23, column: 35, scope: !2791)
!2794 = !DILocation(line: 23, column: 39, scope: !2791)
!2795 = !DILocation(line: 23, column: 33, scope: !2791)
!2796 = !DILocation(line: 24, column: 45, scope: !2791)
!2797 = !DILocation(line: 24, column: 51, scope: !2791)
!2798 = !DILocation(line: 24, column: 17, scope: !2791)
!2799 = !DILocation(line: 25, column: 13, scope: !2791)
!2800 = !DILocation(line: 26, column: 22, scope: !2801)
!2801 = distinct !DILexicalBlock(scope: !2786, file: !2721, line: 26, column: 22)
!2802 = !DILocation(line: 26, column: 29, scope: !2801)
!2803 = !DILocation(line: 26, column: 32, scope: !2801)
!2804 = !DILocation(line: 26, column: 22, scope: !2786)
!2805 = !DILocalVariable(name: "month", scope: !2806, file: !2721, line: 28, type: !6)
!2806 = distinct !DILexicalBlock(scope: !2801, file: !2721, line: 27, column: 13)
!2807 = !DILocation(line: 28, column: 21, scope: !2806)
!2808 = !DILocation(line: 28, column: 29, scope: !2806)
!2809 = !DILocation(line: 28, column: 33, scope: !2806)
!2810 = !DILocation(line: 28, column: 40, scope: !2806)
!2811 = !DILocation(line: 29, column: 45, scope: !2806)
!2812 = !DILocation(line: 29, column: 52, scope: !2806)
!2813 = !DILocation(line: 29, column: 17, scope: !2806)
!2814 = !DILocation(line: 30, column: 13, scope: !2806)
!2815 = !DILocation(line: 31, column: 22, scope: !2816)
!2816 = distinct !DILexicalBlock(scope: !2801, file: !2721, line: 31, column: 22)
!2817 = !DILocation(line: 31, column: 29, scope: !2816)
!2818 = !DILocation(line: 31, column: 32, scope: !2816)
!2819 = !DILocation(line: 31, column: 22, scope: !2801)
!2820 = !DILocalVariable(name: "day", scope: !2821, file: !2721, line: 33, type: !6)
!2821 = distinct !DILexicalBlock(scope: !2816, file: !2721, line: 32, column: 13)
!2822 = !DILocation(line: 33, column: 21, scope: !2821)
!2823 = !DILocation(line: 33, column: 27, scope: !2821)
!2824 = !DILocation(line: 33, column: 31, scope: !2821)
!2825 = !DILocation(line: 34, column: 45, scope: !2821)
!2826 = !DILocation(line: 34, column: 50, scope: !2821)
!2827 = !DILocation(line: 34, column: 17, scope: !2821)
!2828 = !DILocation(line: 35, column: 13, scope: !2821)
!2829 = !DILocation(line: 36, column: 22, scope: !2830)
!2830 = distinct !DILexicalBlock(scope: !2816, file: !2721, line: 36, column: 22)
!2831 = !DILocation(line: 36, column: 29, scope: !2830)
!2832 = !DILocation(line: 36, column: 32, scope: !2830)
!2833 = !DILocation(line: 36, column: 22, scope: !2816)
!2834 = !DILocalVariable(name: "hour", scope: !2835, file: !2721, line: 38, type: !6)
!2835 = distinct !DILexicalBlock(scope: !2830, file: !2721, line: 37, column: 13)
!2836 = !DILocation(line: 38, column: 21, scope: !2835)
!2837 = !DILocation(line: 38, column: 28, scope: !2835)
!2838 = !DILocation(line: 38, column: 32, scope: !2835)
!2839 = !DILocation(line: 39, column: 45, scope: !2835)
!2840 = !DILocation(line: 39, column: 51, scope: !2835)
!2841 = !DILocation(line: 39, column: 17, scope: !2835)
!2842 = !DILocation(line: 40, column: 13, scope: !2835)
!2843 = !DILocation(line: 41, column: 22, scope: !2844)
!2844 = distinct !DILexicalBlock(scope: !2830, file: !2721, line: 41, column: 22)
!2845 = !DILocation(line: 41, column: 29, scope: !2844)
!2846 = !DILocation(line: 41, column: 32, scope: !2844)
!2847 = !DILocation(line: 41, column: 22, scope: !2830)
!2848 = !DILocalVariable(name: "minute", scope: !2849, file: !2721, line: 43, type: !6)
!2849 = distinct !DILexicalBlock(scope: !2844, file: !2721, line: 42, column: 13)
!2850 = !DILocation(line: 43, column: 21, scope: !2849)
!2851 = !DILocation(line: 43, column: 30, scope: !2849)
!2852 = !DILocation(line: 43, column: 34, scope: !2849)
!2853 = !DILocation(line: 44, column: 45, scope: !2849)
!2854 = !DILocation(line: 44, column: 53, scope: !2849)
!2855 = !DILocation(line: 44, column: 17, scope: !2849)
!2856 = !DILocation(line: 45, column: 13, scope: !2849)
!2857 = !DILocation(line: 46, column: 22, scope: !2858)
!2858 = distinct !DILexicalBlock(scope: !2844, file: !2721, line: 46, column: 22)
!2859 = !DILocation(line: 46, column: 29, scope: !2858)
!2860 = !DILocation(line: 46, column: 32, scope: !2858)
!2861 = !DILocation(line: 46, column: 22, scope: !2844)
!2862 = !DILocalVariable(name: "second", scope: !2863, file: !2721, line: 48, type: !6)
!2863 = distinct !DILexicalBlock(scope: !2858, file: !2721, line: 47, column: 13)
!2864 = !DILocation(line: 48, column: 21, scope: !2863)
!2865 = !DILocation(line: 48, column: 30, scope: !2863)
!2866 = !DILocation(line: 48, column: 34, scope: !2863)
!2867 = !DILocation(line: 49, column: 45, scope: !2863)
!2868 = !DILocation(line: 49, column: 53, scope: !2863)
!2869 = !DILocation(line: 49, column: 17, scope: !2863)
!2870 = !DILocation(line: 50, column: 13, scope: !2863)
!2871 = !DILocation(line: 53, column: 26, scope: !2872)
!2872 = distinct !DILexicalBlock(scope: !2858, file: !2721, line: 52, column: 13)
!2873 = !DILocation(line: 53, column: 33, scope: !2872)
!2874 = !DILocation(line: 53, column: 17, scope: !2872)
!2875 = !DILocation(line: 53, column: 24, scope: !2872)
!2876 = !DILocation(line: 54, column: 17, scope: !2872)
!2877 = !DILocation(line: 54, column: 24, scope: !2872)
!2878 = !DILocation(line: 57, column: 15, scope: !2775)
!2879 = !DILocation(line: 58, column: 13, scope: !2775)
!2880 = !DILocation(line: 58, column: 24, scope: !2775)
!2881 = !DILocation(line: 58, column: 20, scope: !2775)
!2882 = !DILocation(line: 58, column: 27, scope: !2775)
!2883 = !DILocation(line: 58, column: 32, scope: !2775)
!2884 = !DILocation(line: 58, column: 35, scope: !2775)
!2885 = !DILocation(line: 58, column: 39, scope: !2775)
!2886 = !DILocation(line: 58, column: 43, scope: !2775)
!2887 = !DILocation(line: 58, column: 37, scope: !2775)
!2888 = !DILocation(line: 0, scope: !2775)
!2889 = !DILocation(line: 60, column: 28, scope: !2890)
!2890 = distinct !DILexicalBlock(scope: !2775, file: !2721, line: 59, column: 13)
!2891 = !DILocation(line: 60, column: 24, scope: !2890)
!2892 = !DILocation(line: 60, column: 17, scope: !2890)
!2893 = !DILocation(line: 60, column: 19, scope: !2890)
!2894 = !DILocation(line: 60, column: 22, scope: !2890)
!2895 = !DILocation(line: 61, column: 18, scope: !2890)
!2896 = !DILocation(line: 62, column: 18, scope: !2890)
!2897 = distinct !{!2897, !2879, !2898, !294}
!2898 = !DILocation(line: 63, column: 13, scope: !2775)
!2899 = !DILocation(line: 65, column: 14, scope: !2775)
!2900 = !DILocation(line: 66, column: 9, scope: !2775)
!2901 = !DILocation(line: 69, column: 20, scope: !2902)
!2902 = distinct !DILexicalBlock(scope: !2769, file: !2721, line: 68, column: 9)
!2903 = !DILocation(line: 69, column: 27, scope: !2902)
!2904 = !DILocation(line: 69, column: 13, scope: !2902)
!2905 = !DILocation(line: 69, column: 15, scope: !2902)
!2906 = !DILocation(line: 69, column: 18, scope: !2902)
!2907 = !DILocation(line: 70, column: 14, scope: !2902)
!2908 = !DILocation(line: 71, column: 14, scope: !2902)
!2909 = distinct !{!2909, !2758, !2910, !294}
!2910 = !DILocation(line: 73, column: 5, scope: !2720)
!2911 = !DILocation(line: 75, column: 5, scope: !2720)
!2912 = !DILocation(line: 75, column: 7, scope: !2720)
!2913 = !DILocation(line: 75, column: 10, scope: !2720)
!2914 = !DILocation(line: 76, column: 12, scope: !2720)
!2915 = !DILocation(line: 76, column: 5, scope: !2720)
!2916 = distinct !DISubprogram(name: "__fizzer_model__ctime", scope: !2917, file: !2917, line: 2, type: !2918, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !189, retainedNodes: !63)
!2917 = !DIFile(filename: "data/models/c/std/time/ctime.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "a911ddebb345e08702cf6c685c49baca")
!2918 = !DISubroutineType(types: !2919)
!2919 = !{!13, !2920, !13}
!2920 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2921, size: 32)
!2921 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2922)
!2922 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !2923, line: 14, baseType: !779)
!2923 = !DIFile(filename: "data/models/c/std/time/ctime.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "fa159fd5097e337914b2eb75fc3ffc16")
!2924 = !DILocalVariable(name: "timep", arg: 1, scope: !2916, file: !2917, line: 2, type: !2920)
!2925 = !DILocation(line: 2, column: 43, scope: !2916)
!2926 = !DILocalVariable(name: "buffer", arg: 2, scope: !2916, file: !2917, line: 2, type: !13)
!2927 = !DILocation(line: 2, column: 56, scope: !2916)
!2928 = !DILocalVariable(name: "template", scope: !2916, file: !2917, line: 4, type: !2929)
!2929 = !DICompositeType(tag: DW_TAG_array_type, baseType: !74, size: 208, elements: !49)
!2930 = !DILocation(line: 4, column: 16, scope: !2916)
!2931 = !DILocalVariable(name: "i", scope: !2916, file: !2917, line: 5, type: !2932)
!2932 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2923, line: 8, baseType: !253)
!2933 = !DILocation(line: 5, column: 12, scope: !2916)
!2934 = !DILocation(line: 7, column: 5, scope: !2916)
!2935 = !DILocation(line: 7, column: 21, scope: !2916)
!2936 = !DILocation(line: 7, column: 12, scope: !2916)
!2937 = !DILocation(line: 7, column: 24, scope: !2916)
!2938 = !DILocation(line: 9, column: 30, scope: !2939)
!2939 = distinct !DILexicalBlock(scope: !2916, file: !2917, line: 8, column: 5)
!2940 = !DILocation(line: 9, column: 21, scope: !2939)
!2941 = !DILocation(line: 9, column: 9, scope: !2939)
!2942 = !DILocation(line: 9, column: 16, scope: !2939)
!2943 = !DILocation(line: 9, column: 19, scope: !2939)
!2944 = !DILocation(line: 10, column: 10, scope: !2939)
!2945 = distinct !{!2945, !2934, !2946, !294}
!2946 = !DILocation(line: 11, column: 5, scope: !2916)
!2947 = !DILocation(line: 13, column: 5, scope: !2916)
!2948 = !DILocation(line: 13, column: 12, scope: !2916)
!2949 = !DILocation(line: 13, column: 15, scope: !2916)
!2950 = !DILocation(line: 14, column: 12, scope: !2916)
!2951 = !DILocation(line: 14, column: 5, scope: !2916)
