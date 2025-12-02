; ModuleID = '/home/marek/root/fizzer/dist/output/models/c/testcomp/nondet.ll'
source_filename = "/home/marek/root/fizzer/dist/data/models/c/testcomp/nondet.c"
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
define dso_local void @__fizzer_model____VERIFIER_nondet_memory(ptr noundef %0, i32 noundef %1) #0 !dbg !204 {
  %3 = alloca ptr, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 4
  %6 = alloca ptr, align 4
  store ptr %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !211, metadata !DIExpression()), !dbg !212
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !213, metadata !DIExpression()), !dbg !214
  call void @llvm.dbg.declare(metadata ptr %5, metadata !215, metadata !DIExpression()), !dbg !216
  %7 = load ptr, ptr %3, align 4, !dbg !217
  store ptr %7, ptr %5, align 4, !dbg !216
  call void @llvm.dbg.declare(metadata ptr %6, metadata !218, metadata !DIExpression()), !dbg !219
  %8 = load ptr, ptr %5, align 4, !dbg !220
  %9 = load i32, ptr %4, align 4, !dbg !221
  %10 = getelementptr inbounds i8, ptr %8, i32 %9, !dbg !222
  store ptr %10, ptr %6, align 4, !dbg !219
  br label %11, !dbg !223

11:                                               ; preds = %18, %2
  %12 = load ptr, ptr %5, align 4, !dbg !224
  %13 = load ptr, ptr %6, align 4, !dbg !227
  %14 = icmp ne ptr %12, %13, !dbg !228
  br i1 %14, label %15, label %21, !dbg !229

15:                                               ; preds = %11
  %16 = call signext i8 @__VERIFIER_nondet_uchar(), !dbg !230
  %17 = load ptr, ptr %5, align 4, !dbg !231
  store i8 %16, ptr %17, align 1, !dbg !232
  br label %18, !dbg !233

18:                                               ; preds = %15
  %19 = load ptr, ptr %5, align 4, !dbg !234
  %20 = getelementptr inbounds i8, ptr %19, i32 1, !dbg !234
  store ptr %20, ptr %5, align 4, !dbg !234
  br label %11, !dbg !235, !llvm.loop !236

21:                                               ; preds = %11
  ret void, !dbg !239
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare signext i8 @__VERIFIER_nondet_uchar() #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__getopt_long(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #0 !dbg !240 {
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
  call void @llvm.dbg.declare(metadata ptr %7, metadata !256, metadata !DIExpression()), !dbg !257
  store ptr %1, ptr %8, align 4
  call void @llvm.dbg.declare(metadata ptr %8, metadata !258, metadata !DIExpression()), !dbg !259
  store ptr %2, ptr %9, align 4
  call void @llvm.dbg.declare(metadata ptr %9, metadata !260, metadata !DIExpression()), !dbg !261
  store ptr %3, ptr %10, align 4
  call void @llvm.dbg.declare(metadata ptr %10, metadata !262, metadata !DIExpression()), !dbg !263
  store ptr %4, ptr %11, align 4
  call void @llvm.dbg.declare(metadata ptr %11, metadata !264, metadata !DIExpression()), !dbg !265
  %16 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !266
  %17 = load i32, ptr %7, align 4, !dbg !268
  %18 = icmp sge i32 %16, %17, !dbg !269
  br i1 %18, label %19, label %20, !dbg !270

19:                                               ; preds = %5
  store i32 -1, ptr %6, align 4, !dbg !271
  br label %177, !dbg !271

20:                                               ; preds = %5
  call void @llvm.dbg.declare(metadata ptr %12, metadata !273, metadata !DIExpression()), !dbg !274
  %21 = load ptr, ptr %8, align 4, !dbg !275
  %22 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !276
  %23 = getelementptr inbounds ptr, ptr %21, i32 %22, !dbg !275
  %24 = load ptr, ptr %23, align 4, !dbg !275
  store ptr %24, ptr %12, align 4, !dbg !274
  %25 = load ptr, ptr %12, align 4, !dbg !277
  %26 = getelementptr inbounds i8, ptr %25, i32 0, !dbg !277
  %27 = load i8, ptr %26, align 1, !dbg !277
  %28 = sext i8 %27 to i32, !dbg !277
  %29 = icmp ne i32 %28, 45, !dbg !279
  br i1 %29, label %36, label %30, !dbg !280

30:                                               ; preds = %20
  %31 = load ptr, ptr %12, align 4, !dbg !281
  %32 = getelementptr inbounds i8, ptr %31, i32 1, !dbg !281
  %33 = load i8, ptr %32, align 1, !dbg !281
  %34 = sext i8 %33 to i32, !dbg !281
  %35 = icmp ne i32 %34, 45, !dbg !282
  br i1 %35, label %36, label %41, !dbg !283

36:                                               ; preds = %30, %20
  %37 = load i32, ptr %7, align 4, !dbg !284
  %38 = load ptr, ptr %8, align 4, !dbg !286
  %39 = load ptr, ptr %9, align 4, !dbg !287
  %40 = call i32 @__fizzer_model__getopt(i32 noundef %37, ptr noundef %38, ptr noundef %39), !dbg !288
  store i32 %40, ptr %6, align 4, !dbg !289
  br label %177, !dbg !289

41:                                               ; preds = %30
  call void @llvm.dbg.declare(metadata ptr %13, metadata !290, metadata !DIExpression()), !dbg !293
  store i32 0, ptr %13, align 4, !dbg !293
  br label %42, !dbg !294

42:                                               ; preds = %171, %41
  %43 = load ptr, ptr %10, align 4, !dbg !295
  %44 = load i32, ptr %13, align 4, !dbg !296
  %45 = getelementptr inbounds %struct.option, ptr %43, i32 %44, !dbg !295
  %46 = getelementptr inbounds %struct.option, ptr %45, i32 0, i32 0, !dbg !297
  %47 = load ptr, ptr %46, align 4, !dbg !297
  %48 = icmp ne ptr %47, null, !dbg !298
  br i1 %48, label %49, label %174, !dbg !294

49:                                               ; preds = %42
  call void @llvm.dbg.declare(metadata ptr %14, metadata !299, metadata !DIExpression()), !dbg !301
  store i32 0, ptr %14, align 4, !dbg !301
  call void @llvm.dbg.declare(metadata ptr %15, metadata !302, metadata !DIExpression()), !dbg !303
  store i32 1, ptr %15, align 4, !dbg !303
  br label %50, !dbg !304

50:                                               ; preds = %89, %49
  %51 = load ptr, ptr %10, align 4, !dbg !305
  %52 = load i32, ptr %13, align 4, !dbg !306
  %53 = getelementptr inbounds %struct.option, ptr %51, i32 %52, !dbg !305
  %54 = getelementptr inbounds %struct.option, ptr %53, i32 0, i32 0, !dbg !307
  %55 = load ptr, ptr %54, align 4, !dbg !307
  %56 = load i32, ptr %14, align 4, !dbg !308
  %57 = getelementptr inbounds i8, ptr %55, i32 %56, !dbg !305
  %58 = load i8, ptr %57, align 1, !dbg !305
  %59 = sext i8 %58 to i32, !dbg !305
  %60 = icmp ne i32 %59, 0, !dbg !309
  br i1 %60, label %61, label %69, !dbg !310

61:                                               ; preds = %50
  %62 = load ptr, ptr %12, align 4, !dbg !311
  %63 = load i32, ptr %14, align 4, !dbg !312
  %64 = add i32 2, %63, !dbg !313
  %65 = getelementptr inbounds i8, ptr %62, i32 %64, !dbg !311
  %66 = load i8, ptr %65, align 1, !dbg !311
  %67 = sext i8 %66 to i32, !dbg !311
  %68 = icmp ne i32 %67, 0, !dbg !314
  br label %69

69:                                               ; preds = %61, %50
  %70 = phi i1 [ false, %50 ], [ %68, %61 ], !dbg !315
  br i1 %70, label %71, label %92, !dbg !304

71:                                               ; preds = %69
  %72 = load ptr, ptr %10, align 4, !dbg !316
  %73 = load i32, ptr %13, align 4, !dbg !319
  %74 = getelementptr inbounds %struct.option, ptr %72, i32 %73, !dbg !316
  %75 = getelementptr inbounds %struct.option, ptr %74, i32 0, i32 0, !dbg !320
  %76 = load ptr, ptr %75, align 4, !dbg !320
  %77 = load i32, ptr %14, align 4, !dbg !321
  %78 = getelementptr inbounds i8, ptr %76, i32 %77, !dbg !316
  %79 = load i8, ptr %78, align 1, !dbg !316
  %80 = sext i8 %79 to i32, !dbg !316
  %81 = load ptr, ptr %12, align 4, !dbg !322
  %82 = load i32, ptr %14, align 4, !dbg !323
  %83 = add i32 2, %82, !dbg !324
  %84 = getelementptr inbounds i8, ptr %81, i32 %83, !dbg !322
  %85 = load i8, ptr %84, align 1, !dbg !322
  %86 = sext i8 %85 to i32, !dbg !322
  %87 = icmp ne i32 %80, %86, !dbg !325
  br i1 %87, label %88, label %89, !dbg !326

88:                                               ; preds = %71
  store i32 0, ptr %15, align 4, !dbg !327
  br label %92, !dbg !329

89:                                               ; preds = %71
  %90 = load i32, ptr %14, align 4, !dbg !330
  %91 = add i32 %90, 1, !dbg !330
  store i32 %91, ptr %14, align 4, !dbg !330
  br label %50, !dbg !304, !llvm.loop !331

92:                                               ; preds = %88, %69
  %93 = load i32, ptr %15, align 4, !dbg !333
  %94 = icmp ne i32 %93, 0, !dbg !333
  br i1 %94, label %95, label %171, !dbg !335

95:                                               ; preds = %92
  %96 = load ptr, ptr %10, align 4, !dbg !336
  %97 = load i32, ptr %13, align 4, !dbg !337
  %98 = getelementptr inbounds %struct.option, ptr %96, i32 %97, !dbg !336
  %99 = getelementptr inbounds %struct.option, ptr %98, i32 0, i32 0, !dbg !338
  %100 = load ptr, ptr %99, align 4, !dbg !338
  %101 = load i32, ptr %14, align 4, !dbg !339
  %102 = getelementptr inbounds i8, ptr %100, i32 %101, !dbg !336
  %103 = load i8, ptr %102, align 1, !dbg !336
  %104 = sext i8 %103 to i32, !dbg !336
  %105 = icmp eq i32 %104, 0, !dbg !340
  br i1 %105, label %106, label %171, !dbg !341

106:                                              ; preds = %95
  %107 = load ptr, ptr %12, align 4, !dbg !342
  %108 = load i32, ptr %14, align 4, !dbg !343
  %109 = add i32 2, %108, !dbg !344
  %110 = getelementptr inbounds i8, ptr %107, i32 %109, !dbg !342
  %111 = load i8, ptr %110, align 1, !dbg !342
  %112 = sext i8 %111 to i32, !dbg !342
  %113 = icmp eq i32 %112, 0, !dbg !345
  br i1 %113, label %114, label %171, !dbg !346

114:                                              ; preds = %106
  %115 = load ptr, ptr %11, align 4, !dbg !347
  %116 = icmp ne ptr %115, null, !dbg !350
  br i1 %116, label %117, label %120, !dbg !351

117:                                              ; preds = %114
  %118 = load i32, ptr %13, align 4, !dbg !352
  %119 = load ptr, ptr %11, align 4, !dbg !354
  store i32 %118, ptr %119, align 4, !dbg !355
  br label %120, !dbg !356

120:                                              ; preds = %117, %114
  %121 = load ptr, ptr %10, align 4, !dbg !357
  %122 = load i32, ptr %13, align 4, !dbg !359
  %123 = getelementptr inbounds %struct.option, ptr %121, i32 %122, !dbg !357
  %124 = getelementptr inbounds %struct.option, ptr %123, i32 0, i32 1, !dbg !360
  %125 = load i32, ptr %124, align 4, !dbg !360
  %126 = icmp eq i32 %125, 1, !dbg !361
  br i1 %126, label %127, label %144, !dbg !362

127:                                              ; preds = %120
  %128 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !363
  %129 = add nsw i32 %128, 1, !dbg !366
  %130 = load i32, ptr %7, align 4, !dbg !367
  %131 = icmp slt i32 %129, %130, !dbg !368
  br i1 %131, label %132, label %140, !dbg !369

132:                                              ; preds = %127
  %133 = load ptr, ptr %8, align 4, !dbg !370
  %134 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !372
  %135 = add nsw i32 %134, 1, !dbg !373
  %136 = getelementptr inbounds ptr, ptr %133, i32 %135, !dbg !370
  %137 = load ptr, ptr %136, align 4, !dbg !370
  store ptr %137, ptr @__fizzer_model__optarg, align 4, !dbg !374
  %138 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !375
  %139 = add nsw i32 %138, 2, !dbg !375
  store i32 %139, ptr @__fizzer_model__optind, align 4, !dbg !375
  br label %143, !dbg !376

140:                                              ; preds = %127
  store ptr null, ptr @__fizzer_model__optarg, align 4, !dbg !377
  %141 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !379
  %142 = add nsw i32 %141, 1, !dbg !379
  store i32 %142, ptr @__fizzer_model__optind, align 4, !dbg !379
  br label %143

143:                                              ; preds = %140, %132
  br label %147, !dbg !380

144:                                              ; preds = %120
  store ptr null, ptr @__fizzer_model__optarg, align 4, !dbg !381
  %145 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !383
  %146 = add nsw i32 %145, 1, !dbg !383
  store i32 %146, ptr @__fizzer_model__optind, align 4, !dbg !383
  br label %147

147:                                              ; preds = %144, %143
  %148 = load ptr, ptr %10, align 4, !dbg !384
  %149 = load i32, ptr %13, align 4, !dbg !386
  %150 = getelementptr inbounds %struct.option, ptr %148, i32 %149, !dbg !384
  %151 = getelementptr inbounds %struct.option, ptr %150, i32 0, i32 2, !dbg !387
  %152 = load ptr, ptr %151, align 4, !dbg !387
  %153 = icmp ne ptr %152, null, !dbg !388
  br i1 %153, label %154, label %165, !dbg !389

154:                                              ; preds = %147
  %155 = load ptr, ptr %10, align 4, !dbg !390
  %156 = load i32, ptr %13, align 4, !dbg !392
  %157 = getelementptr inbounds %struct.option, ptr %155, i32 %156, !dbg !390
  %158 = getelementptr inbounds %struct.option, ptr %157, i32 0, i32 3, !dbg !393
  %159 = load i32, ptr %158, align 4, !dbg !393
  %160 = load ptr, ptr %10, align 4, !dbg !394
  %161 = load i32, ptr %13, align 4, !dbg !395
  %162 = getelementptr inbounds %struct.option, ptr %160, i32 %161, !dbg !394
  %163 = getelementptr inbounds %struct.option, ptr %162, i32 0, i32 2, !dbg !396
  %164 = load ptr, ptr %163, align 4, !dbg !396
  store i32 %159, ptr %164, align 4, !dbg !397
  store i32 0, ptr %6, align 4, !dbg !398
  br label %177, !dbg !398

165:                                              ; preds = %147
  %166 = load ptr, ptr %10, align 4, !dbg !399
  %167 = load i32, ptr %13, align 4, !dbg !400
  %168 = getelementptr inbounds %struct.option, ptr %166, i32 %167, !dbg !399
  %169 = getelementptr inbounds %struct.option, ptr %168, i32 0, i32 3, !dbg !401
  %170 = load i32, ptr %169, align 4, !dbg !401
  store i32 %170, ptr %6, align 4, !dbg !402
  br label %177, !dbg !402

171:                                              ; preds = %106, %95, %92
  %172 = load i32, ptr %13, align 4, !dbg !403
  %173 = add i32 %172, 1, !dbg !403
  store i32 %173, ptr %13, align 4, !dbg !403
  br label %42, !dbg !294, !llvm.loop !404

174:                                              ; preds = %42
  %175 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !406
  %176 = add nsw i32 %175, 1, !dbg !406
  store i32 %176, ptr @__fizzer_model__optind, align 4, !dbg !406
  store i32 63, ptr %6, align 4, !dbg !407
  br label %177, !dbg !407

177:                                              ; preds = %174, %165, %154, %36, %19
  %178 = load i32, ptr %6, align 4, !dbg !408
  ret i32 %178, !dbg !408
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__getopt(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !409 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 4
  %7 = alloca ptr, align 4
  %8 = alloca ptr, align 4
  %9 = alloca i8, align 1
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !413, metadata !DIExpression()), !dbg !414
  store ptr %1, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !415, metadata !DIExpression()), !dbg !416
  store ptr %2, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !417, metadata !DIExpression()), !dbg !418
  %12 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !419
  %13 = load i32, ptr %5, align 4, !dbg !421
  %14 = icmp sge i32 %12, %13, !dbg !422
  br i1 %14, label %15, label %16, !dbg !423

15:                                               ; preds = %3
  store i32 -1, ptr %4, align 4, !dbg !424
  br label %111, !dbg !424

16:                                               ; preds = %3
  call void @llvm.dbg.declare(metadata ptr %8, metadata !426, metadata !DIExpression()), !dbg !427
  %17 = load ptr, ptr %6, align 4, !dbg !428
  %18 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !429
  %19 = getelementptr inbounds ptr, ptr %17, i32 %18, !dbg !428
  %20 = load ptr, ptr %19, align 4, !dbg !428
  store ptr %20, ptr %8, align 4, !dbg !427
  %21 = load ptr, ptr %8, align 4, !dbg !430
  %22 = getelementptr inbounds i8, ptr %21, i32 0, !dbg !430
  %23 = load i8, ptr %22, align 1, !dbg !430
  %24 = sext i8 %23 to i32, !dbg !430
  %25 = icmp ne i32 %24, 45, !dbg !432
  br i1 %25, label %32, label %26, !dbg !433

26:                                               ; preds = %16
  %27 = load ptr, ptr %8, align 4, !dbg !434
  %28 = getelementptr inbounds i8, ptr %27, i32 1, !dbg !434
  %29 = load i8, ptr %28, align 1, !dbg !434
  %30 = sext i8 %29 to i32, !dbg !434
  %31 = icmp eq i32 %30, 0, !dbg !435
  br i1 %31, label %32, label %33, !dbg !436

32:                                               ; preds = %26, %16
  store i32 -1, ptr %4, align 4, !dbg !437
  br label %111, !dbg !437

33:                                               ; preds = %26
  call void @llvm.dbg.declare(metadata ptr %9, metadata !439, metadata !DIExpression()), !dbg !440
  %34 = load ptr, ptr %8, align 4, !dbg !441
  %35 = getelementptr inbounds i8, ptr %34, i32 1, !dbg !441
  %36 = load i8, ptr %35, align 1, !dbg !441
  store i8 %36, ptr %9, align 1, !dbg !440
  call void @llvm.dbg.declare(metadata ptr %10, metadata !442, metadata !DIExpression()), !dbg !445
  store i32 0, ptr %10, align 4, !dbg !445
  call void @llvm.dbg.declare(metadata ptr %11, metadata !446, metadata !DIExpression()), !dbg !447
  store i32 0, ptr %11, align 4, !dbg !447
  br label %37, !dbg !448

37:                                               ; preds = %54, %33
  %38 = load ptr, ptr %7, align 4, !dbg !449
  %39 = load i32, ptr %10, align 4, !dbg !450
  %40 = getelementptr inbounds i8, ptr %38, i32 %39, !dbg !449
  %41 = load i8, ptr %40, align 1, !dbg !449
  %42 = sext i8 %41 to i32, !dbg !449
  %43 = icmp ne i32 %42, 0, !dbg !451
  br i1 %43, label %44, label %57, !dbg !448

44:                                               ; preds = %37
  %45 = load ptr, ptr %7, align 4, !dbg !452
  %46 = load i32, ptr %10, align 4, !dbg !455
  %47 = getelementptr inbounds i8, ptr %45, i32 %46, !dbg !452
  %48 = load i8, ptr %47, align 1, !dbg !452
  %49 = sext i8 %48 to i32, !dbg !452
  %50 = load i8, ptr %9, align 1, !dbg !456
  %51 = sext i8 %50 to i32, !dbg !456
  %52 = icmp eq i32 %49, %51, !dbg !457
  br i1 %52, label %53, label %54, !dbg !458

53:                                               ; preds = %44
  store i32 1, ptr %11, align 4, !dbg !459
  br label %57, !dbg !461

54:                                               ; preds = %44
  %55 = load i32, ptr %10, align 4, !dbg !462
  %56 = add i32 %55, 1, !dbg !462
  store i32 %56, ptr %10, align 4, !dbg !462
  br label %37, !dbg !448, !llvm.loop !463

57:                                               ; preds = %53, %37
  %58 = load i32, ptr %11, align 4, !dbg !465
  %59 = icmp ne i32 %58, 0, !dbg !465
  br i1 %59, label %65, label %60, !dbg !467

60:                                               ; preds = %57
  %61 = load i8, ptr %9, align 1, !dbg !468
  %62 = sext i8 %61 to i32, !dbg !468
  store i32 %62, ptr @__fizzer_model__optopt, align 4, !dbg !470
  %63 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !471
  %64 = add nsw i32 %63, 1, !dbg !471
  store i32 %64, ptr @__fizzer_model__optind, align 4, !dbg !471
  store i32 63, ptr %4, align 4, !dbg !472
  br label %111, !dbg !472

65:                                               ; preds = %57
  %66 = load ptr, ptr %7, align 4, !dbg !473
  %67 = load i32, ptr %10, align 4, !dbg !475
  %68 = add i32 %67, 1, !dbg !476
  %69 = getelementptr inbounds i8, ptr %66, i32 %68, !dbg !473
  %70 = load i8, ptr %69, align 1, !dbg !473
  %71 = sext i8 %70 to i32, !dbg !473
  %72 = icmp eq i32 %71, 58, !dbg !477
  br i1 %72, label %73, label %105, !dbg !478

73:                                               ; preds = %65
  %74 = load ptr, ptr %8, align 4, !dbg !479
  %75 = getelementptr inbounds i8, ptr %74, i32 2, !dbg !479
  %76 = load i8, ptr %75, align 1, !dbg !479
  %77 = sext i8 %76 to i32, !dbg !479
  %78 = icmp ne i32 %77, 0, !dbg !482
  br i1 %78, label %79, label %82, !dbg !483

79:                                               ; preds = %73
  %80 = load ptr, ptr %8, align 4, !dbg !484
  %81 = getelementptr inbounds i8, ptr %80, i32 2, !dbg !484
  store ptr %81, ptr @__fizzer_model__optarg, align 4, !dbg !486
  br label %102, !dbg !487

82:                                               ; preds = %73
  %83 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !488
  %84 = add nsw i32 %83, 1, !dbg !490
  %85 = load i32, ptr %5, align 4, !dbg !491
  %86 = icmp slt i32 %84, %85, !dbg !492
  br i1 %86, label %87, label %94, !dbg !493

87:                                               ; preds = %82
  %88 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !494
  %89 = add nsw i32 %88, 1, !dbg !494
  store i32 %89, ptr @__fizzer_model__optind, align 4, !dbg !494
  %90 = load ptr, ptr %6, align 4, !dbg !496
  %91 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !497
  %92 = getelementptr inbounds ptr, ptr %90, i32 %91, !dbg !496
  %93 = load ptr, ptr %92, align 4, !dbg !496
  store ptr %93, ptr @__fizzer_model__optarg, align 4, !dbg !498
  br label %101, !dbg !499

94:                                               ; preds = %82
  store ptr null, ptr @__fizzer_model__optarg, align 4, !dbg !500
  %95 = load i32, ptr @__fizzer_model__opterr, align 4, !dbg !502
  %96 = icmp ne i32 %95, 0, !dbg !502
  br i1 %96, label %97, label %98, !dbg !504

97:                                               ; preds = %94
  br label %98, !dbg !505

98:                                               ; preds = %97, %94
  %99 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !507
  %100 = add nsw i32 %99, 1, !dbg !507
  store i32 %100, ptr @__fizzer_model__optind, align 4, !dbg !507
  store i32 58, ptr %4, align 4, !dbg !508
  br label %111, !dbg !508

101:                                              ; preds = %87
  br label %102

102:                                              ; preds = %101, %79
  %103 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !509
  %104 = add nsw i32 %103, 1, !dbg !509
  store i32 %104, ptr @__fizzer_model__optind, align 4, !dbg !509
  br label %108, !dbg !510

105:                                              ; preds = %65
  store ptr null, ptr @__fizzer_model__optarg, align 4, !dbg !511
  %106 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !513
  %107 = add nsw i32 %106, 1, !dbg !513
  store i32 %107, ptr @__fizzer_model__optind, align 4, !dbg !513
  br label %108

108:                                              ; preds = %105, %102
  %109 = load i8, ptr %9, align 1, !dbg !514
  %110 = sext i8 %109 to i32, !dbg !514
  store i32 %110, ptr %4, align 4, !dbg !515
  br label %111, !dbg !515

111:                                              ; preds = %108, %98, %60, %32, %15
  %112 = load i32, ptr %4, align 4, !dbg !516
  ret i32 %112, !dbg !516
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__atoll(ptr noundef %0) #0 !dbg !517 {
  %2 = alloca ptr, align 4
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !522, metadata !DIExpression()), !dbg !523
  call void @llvm.dbg.declare(metadata ptr %3, metadata !524, metadata !DIExpression()), !dbg !525
  store i64 0, ptr %3, align 8, !dbg !525
  call void @llvm.dbg.declare(metadata ptr %4, metadata !526, metadata !DIExpression()), !dbg !527
  store i32 1, ptr %4, align 4, !dbg !527
  call void @llvm.dbg.declare(metadata ptr %5, metadata !528, metadata !DIExpression()), !dbg !531
  store i32 0, ptr %5, align 4, !dbg !531
  br label %6, !dbg !532

6:                                                ; preds = %23, %1
  %7 = load ptr, ptr %2, align 4, !dbg !533
  %8 = load i32, ptr %5, align 4, !dbg !534
  %9 = getelementptr inbounds i8, ptr %7, i32 %8, !dbg !533
  %10 = load i8, ptr %9, align 1, !dbg !533
  %11 = sext i8 %10 to i32, !dbg !533
  %12 = icmp ne i32 %11, 0, !dbg !535
  br i1 %12, label %13, label %21, !dbg !536

13:                                               ; preds = %6
  %14 = load ptr, ptr %2, align 4, !dbg !537
  %15 = load i32, ptr %5, align 4, !dbg !538
  %16 = getelementptr inbounds i8, ptr %14, i32 %15, !dbg !537
  %17 = load i8, ptr %16, align 1, !dbg !537
  %18 = sext i8 %17 to i32, !dbg !537
  %19 = call i32 @__fizzer_model__isspace(i32 noundef %18), !dbg !539
  %20 = icmp ne i32 %19, 0, !dbg !536
  br label %21

21:                                               ; preds = %13, %6
  %22 = phi i1 [ false, %6 ], [ %20, %13 ], !dbg !540
  br i1 %22, label %23, label %26, !dbg !532

23:                                               ; preds = %21
  %24 = load i32, ptr %5, align 4, !dbg !541
  %25 = add i32 %24, 1, !dbg !541
  store i32 %25, ptr %5, align 4, !dbg !541
  br label %6, !dbg !532, !llvm.loop !543

26:                                               ; preds = %21
  %27 = load ptr, ptr %2, align 4, !dbg !545
  %28 = load i32, ptr %5, align 4, !dbg !547
  %29 = getelementptr inbounds i8, ptr %27, i32 %28, !dbg !545
  %30 = load i8, ptr %29, align 1, !dbg !545
  %31 = sext i8 %30 to i32, !dbg !545
  %32 = icmp eq i32 %31, 43, !dbg !548
  br i1 %32, label %33, label %36, !dbg !549

33:                                               ; preds = %26
  %34 = load i32, ptr %5, align 4, !dbg !550
  %35 = add i32 %34, 1, !dbg !550
  store i32 %35, ptr %5, align 4, !dbg !550
  br label %47, !dbg !552

36:                                               ; preds = %26
  %37 = load ptr, ptr %2, align 4, !dbg !553
  %38 = load i32, ptr %5, align 4, !dbg !555
  %39 = getelementptr inbounds i8, ptr %37, i32 %38, !dbg !553
  %40 = load i8, ptr %39, align 1, !dbg !553
  %41 = sext i8 %40 to i32, !dbg !553
  %42 = icmp eq i32 %41, 45, !dbg !556
  br i1 %42, label %43, label %46, !dbg !557

43:                                               ; preds = %36
  store i32 -1, ptr %4, align 4, !dbg !558
  %44 = load i32, ptr %5, align 4, !dbg !560
  %45 = add i32 %44, 1, !dbg !560
  store i32 %45, ptr %5, align 4, !dbg !560
  br label %46, !dbg !561

46:                                               ; preds = %43, %36
  br label %47

47:                                               ; preds = %46, %33
  br label %48, !dbg !562

48:                                               ; preds = %65, %47
  %49 = load ptr, ptr %2, align 4, !dbg !563
  %50 = load i32, ptr %5, align 4, !dbg !564
  %51 = getelementptr inbounds i8, ptr %49, i32 %50, !dbg !563
  %52 = load i8, ptr %51, align 1, !dbg !563
  %53 = sext i8 %52 to i32, !dbg !563
  %54 = icmp ne i32 %53, 0, !dbg !565
  br i1 %54, label %55, label %63, !dbg !566

55:                                               ; preds = %48
  %56 = load ptr, ptr %2, align 4, !dbg !567
  %57 = load i32, ptr %5, align 4, !dbg !568
  %58 = getelementptr inbounds i8, ptr %56, i32 %57, !dbg !567
  %59 = load i8, ptr %58, align 1, !dbg !567
  %60 = sext i8 %59 to i32, !dbg !567
  %61 = call i32 @__fizzer_model__isdigit(i32 noundef %60), !dbg !569
  %62 = icmp ne i32 %61, 0, !dbg !566
  br label %63

63:                                               ; preds = %55, %48
  %64 = phi i1 [ false, %48 ], [ %62, %55 ], !dbg !540
  br i1 %64, label %65, label %78, !dbg !562

65:                                               ; preds = %63
  %66 = load i64, ptr %3, align 8, !dbg !570
  %67 = mul nsw i64 %66, 10, !dbg !572
  %68 = load ptr, ptr %2, align 4, !dbg !573
  %69 = load i32, ptr %5, align 4, !dbg !574
  %70 = getelementptr inbounds i8, ptr %68, i32 %69, !dbg !573
  %71 = load i8, ptr %70, align 1, !dbg !573
  %72 = sext i8 %71 to i32, !dbg !573
  %73 = sub nsw i32 %72, 48, !dbg !575
  %74 = sext i32 %73 to i64, !dbg !576
  %75 = add nsw i64 %67, %74, !dbg !577
  store i64 %75, ptr %3, align 8, !dbg !578
  %76 = load i32, ptr %5, align 4, !dbg !579
  %77 = add i32 %76, 1, !dbg !579
  store i32 %77, ptr %5, align 4, !dbg !579
  br label %48, !dbg !562, !llvm.loop !580

78:                                               ; preds = %63
  %79 = load i32, ptr %4, align 4, !dbg !582
  %80 = sext i32 %79 to i64, !dbg !582
  %81 = load i64, ptr %3, align 8, !dbg !583
  %82 = mul nsw i64 %80, %81, !dbg !584
  ret i64 %82, !dbg !585
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @__fizzer_model__strtod(ptr noundef %0, ptr noundef %1) #0 !dbg !586 {
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
  call void @llvm.dbg.declare(metadata ptr %3, metadata !591, metadata !DIExpression()), !dbg !592
  store ptr %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !593, metadata !DIExpression()), !dbg !594
  call void @llvm.dbg.declare(metadata ptr %5, metadata !595, metadata !DIExpression()), !dbg !596
  store double 0.000000e+00, ptr %5, align 8, !dbg !596
  call void @llvm.dbg.declare(metadata ptr %6, metadata !597, metadata !DIExpression()), !dbg !598
  store double 0.000000e+00, ptr %6, align 8, !dbg !598
  call void @llvm.dbg.declare(metadata ptr %7, metadata !599, metadata !DIExpression()), !dbg !600
  store i32 1, ptr %7, align 4, !dbg !600
  call void @llvm.dbg.declare(metadata ptr %8, metadata !601, metadata !DIExpression()), !dbg !602
  store i32 1, ptr %8, align 4, !dbg !602
  call void @llvm.dbg.declare(metadata ptr %9, metadata !603, metadata !DIExpression()), !dbg !604
  store i32 1, ptr %9, align 4, !dbg !604
  call void @llvm.dbg.declare(metadata ptr %10, metadata !605, metadata !DIExpression()), !dbg !606
  store i32 0, ptr %10, align 4, !dbg !606
  call void @llvm.dbg.declare(metadata ptr %11, metadata !607, metadata !DIExpression()), !dbg !610
  store i32 0, ptr %11, align 4, !dbg !610
  br label %14, !dbg !611

14:                                               ; preds = %31, %2
  %15 = load ptr, ptr %3, align 4, !dbg !612
  %16 = load i32, ptr %11, align 4, !dbg !613
  %17 = getelementptr inbounds i8, ptr %15, i32 %16, !dbg !612
  %18 = load i8, ptr %17, align 1, !dbg !612
  %19 = sext i8 %18 to i32, !dbg !612
  %20 = icmp ne i32 %19, 0, !dbg !614
  br i1 %20, label %21, label %29, !dbg !615

21:                                               ; preds = %14
  %22 = load ptr, ptr %3, align 4, !dbg !616
  %23 = load i32, ptr %11, align 4, !dbg !617
  %24 = getelementptr inbounds i8, ptr %22, i32 %23, !dbg !616
  %25 = load i8, ptr %24, align 1, !dbg !616
  %26 = sext i8 %25 to i32, !dbg !616
  %27 = call i32 @__fizzer_model__isspace(i32 noundef %26), !dbg !618
  %28 = icmp ne i32 %27, 0, !dbg !615
  br label %29

29:                                               ; preds = %21, %14
  %30 = phi i1 [ false, %14 ], [ %28, %21 ], !dbg !619
  br i1 %30, label %31, label %34, !dbg !611

31:                                               ; preds = %29
  %32 = load i32, ptr %11, align 4, !dbg !620
  %33 = add i32 %32, 1, !dbg !620
  store i32 %33, ptr %11, align 4, !dbg !620
  br label %14, !dbg !611, !llvm.loop !622

34:                                               ; preds = %29
  %35 = load ptr, ptr %3, align 4, !dbg !624
  %36 = load i32, ptr %11, align 4, !dbg !626
  %37 = getelementptr inbounds i8, ptr %35, i32 %36, !dbg !624
  %38 = load i8, ptr %37, align 1, !dbg !624
  %39 = sext i8 %38 to i32, !dbg !624
  %40 = icmp eq i32 %39, 43, !dbg !627
  br i1 %40, label %41, label %44, !dbg !628

41:                                               ; preds = %34
  %42 = load i32, ptr %11, align 4, !dbg !629
  %43 = add i32 %42, 1, !dbg !629
  store i32 %43, ptr %11, align 4, !dbg !629
  br label %55, !dbg !631

44:                                               ; preds = %34
  %45 = load ptr, ptr %3, align 4, !dbg !632
  %46 = load i32, ptr %11, align 4, !dbg !634
  %47 = getelementptr inbounds i8, ptr %45, i32 %46, !dbg !632
  %48 = load i8, ptr %47, align 1, !dbg !632
  %49 = sext i8 %48 to i32, !dbg !632
  %50 = icmp eq i32 %49, 45, !dbg !635
  br i1 %50, label %51, label %54, !dbg !636

51:                                               ; preds = %44
  store i32 -1, ptr %7, align 4, !dbg !637
  %52 = load i32, ptr %11, align 4, !dbg !639
  %53 = add i32 %52, 1, !dbg !639
  store i32 %53, ptr %11, align 4, !dbg !639
  br label %54, !dbg !640

54:                                               ; preds = %51, %44
  br label %55

55:                                               ; preds = %54, %41
  br label %56, !dbg !641

56:                                               ; preds = %73, %55
  %57 = load ptr, ptr %3, align 4, !dbg !642
  %58 = load i32, ptr %11, align 4, !dbg !643
  %59 = getelementptr inbounds i8, ptr %57, i32 %58, !dbg !642
  %60 = load i8, ptr %59, align 1, !dbg !642
  %61 = sext i8 %60 to i32, !dbg !642
  %62 = icmp ne i32 %61, 0, !dbg !644
  br i1 %62, label %63, label %71, !dbg !645

63:                                               ; preds = %56
  %64 = load ptr, ptr %3, align 4, !dbg !646
  %65 = load i32, ptr %11, align 4, !dbg !647
  %66 = getelementptr inbounds i8, ptr %64, i32 %65, !dbg !646
  %67 = load i8, ptr %66, align 1, !dbg !646
  %68 = sext i8 %67 to i32, !dbg !646
  %69 = call i32 @__fizzer_model__isdigit(i32 noundef %68), !dbg !648
  %70 = icmp ne i32 %69, 0, !dbg !645
  br label %71

71:                                               ; preds = %63, %56
  %72 = phi i1 [ false, %56 ], [ %70, %63 ], !dbg !619
  br i1 %72, label %73, label %85, !dbg !641

73:                                               ; preds = %71
  %74 = load double, ptr %5, align 8, !dbg !649
  %75 = load ptr, ptr %3, align 4, !dbg !651
  %76 = load i32, ptr %11, align 4, !dbg !652
  %77 = getelementptr inbounds i8, ptr %75, i32 %76, !dbg !651
  %78 = load i8, ptr %77, align 1, !dbg !651
  %79 = sext i8 %78 to i32, !dbg !651
  %80 = sub nsw i32 %79, 48, !dbg !653
  %81 = sitofp i32 %80 to double, !dbg !654
  %82 = call double @llvm.fmuladd.f64(double %74, double 1.000000e+01, double %81), !dbg !655
  store double %82, ptr %5, align 8, !dbg !656
  %83 = load i32, ptr %11, align 4, !dbg !657
  %84 = add i32 %83, 1, !dbg !657
  store i32 %84, ptr %11, align 4, !dbg !657
  br label %56, !dbg !641, !llvm.loop !658

85:                                               ; preds = %71
  %86 = load ptr, ptr %3, align 4, !dbg !660
  %87 = load i32, ptr %11, align 4, !dbg !662
  %88 = getelementptr inbounds i8, ptr %86, i32 %87, !dbg !660
  %89 = load i8, ptr %88, align 1, !dbg !660
  %90 = sext i8 %89 to i32, !dbg !660
  %91 = icmp eq i32 %90, 46, !dbg !663
  br i1 %91, label %92, label %133, !dbg !664

92:                                               ; preds = %85
  %93 = load i32, ptr %11, align 4, !dbg !665
  %94 = add i32 %93, 1, !dbg !665
  store i32 %94, ptr %11, align 4, !dbg !665
  br label %95, !dbg !667

95:                                               ; preds = %112, %92
  %96 = load ptr, ptr %3, align 4, !dbg !668
  %97 = load i32, ptr %11, align 4, !dbg !669
  %98 = getelementptr inbounds i8, ptr %96, i32 %97, !dbg !668
  %99 = load i8, ptr %98, align 1, !dbg !668
  %100 = sext i8 %99 to i32, !dbg !668
  %101 = icmp ne i32 %100, 0, !dbg !670
  br i1 %101, label %102, label %110, !dbg !671

102:                                              ; preds = %95
  %103 = load ptr, ptr %3, align 4, !dbg !672
  %104 = load i32, ptr %11, align 4, !dbg !673
  %105 = getelementptr inbounds i8, ptr %103, i32 %104, !dbg !672
  %106 = load i8, ptr %105, align 1, !dbg !672
  %107 = sext i8 %106 to i32, !dbg !672
  %108 = call i32 @__fizzer_model__isdigit(i32 noundef %107), !dbg !674
  %109 = icmp ne i32 %108, 0, !dbg !671
  br label %110

110:                                              ; preds = %102, %95
  %111 = phi i1 [ false, %95 ], [ %109, %102 ], !dbg !675
  br i1 %111, label %112, label %126, !dbg !667

112:                                              ; preds = %110
  %113 = load double, ptr %6, align 8, !dbg !676
  %114 = load ptr, ptr %3, align 4, !dbg !678
  %115 = load i32, ptr %11, align 4, !dbg !679
  %116 = getelementptr inbounds i8, ptr %114, i32 %115, !dbg !678
  %117 = load i8, ptr %116, align 1, !dbg !678
  %118 = sext i8 %117 to i32, !dbg !678
  %119 = sub nsw i32 %118, 48, !dbg !680
  %120 = sitofp i32 %119 to double, !dbg !681
  %121 = call double @llvm.fmuladd.f64(double %113, double 1.000000e+01, double %120), !dbg !682
  store double %121, ptr %6, align 8, !dbg !683
  %122 = load i32, ptr %8, align 4, !dbg !684
  %123 = mul nsw i32 %122, 10, !dbg !685
  store i32 %123, ptr %8, align 4, !dbg !686
  %124 = load i32, ptr %11, align 4, !dbg !687
  %125 = add i32 %124, 1, !dbg !687
  store i32 %125, ptr %11, align 4, !dbg !687
  br label %95, !dbg !667, !llvm.loop !688

126:                                              ; preds = %110
  %127 = load double, ptr %5, align 8, !dbg !690
  %128 = load double, ptr %6, align 8, !dbg !691
  %129 = load i32, ptr %8, align 4, !dbg !692
  %130 = sitofp i32 %129 to double, !dbg !693
  %131 = fdiv double %128, %130, !dbg !694
  %132 = fadd double %127, %131, !dbg !695
  store double %132, ptr %5, align 8, !dbg !696
  br label %133, !dbg !697

133:                                              ; preds = %126, %85
  %134 = load ptr, ptr %3, align 4, !dbg !698
  %135 = load i32, ptr %11, align 4, !dbg !700
  %136 = getelementptr inbounds i8, ptr %134, i32 %135, !dbg !698
  %137 = load i8, ptr %136, align 1, !dbg !698
  %138 = sext i8 %137 to i32, !dbg !698
  %139 = icmp eq i32 %138, 101, !dbg !701
  br i1 %139, label %147, label %140, !dbg !702

140:                                              ; preds = %133
  %141 = load ptr, ptr %3, align 4, !dbg !703
  %142 = load i32, ptr %11, align 4, !dbg !704
  %143 = getelementptr inbounds i8, ptr %141, i32 %142, !dbg !703
  %144 = load i8, ptr %143, align 1, !dbg !703
  %145 = sext i8 %144 to i32, !dbg !703
  %146 = icmp eq i32 %145, 69, !dbg !705
  br i1 %146, label %147, label %201, !dbg !706

147:                                              ; preds = %140, %133
  %148 = load i32, ptr %11, align 4, !dbg !707
  %149 = add i32 %148, 1, !dbg !707
  store i32 %149, ptr %11, align 4, !dbg !707
  %150 = load ptr, ptr %3, align 4, !dbg !709
  %151 = load i32, ptr %11, align 4, !dbg !711
  %152 = getelementptr inbounds i8, ptr %150, i32 %151, !dbg !709
  %153 = load i8, ptr %152, align 1, !dbg !709
  %154 = sext i8 %153 to i32, !dbg !709
  %155 = icmp eq i32 %154, 43, !dbg !712
  br i1 %155, label %156, label %159, !dbg !713

156:                                              ; preds = %147
  %157 = load i32, ptr %11, align 4, !dbg !714
  %158 = add i32 %157, 1, !dbg !714
  store i32 %158, ptr %11, align 4, !dbg !714
  br label %170, !dbg !716

159:                                              ; preds = %147
  %160 = load ptr, ptr %3, align 4, !dbg !717
  %161 = load i32, ptr %11, align 4, !dbg !719
  %162 = getelementptr inbounds i8, ptr %160, i32 %161, !dbg !717
  %163 = load i8, ptr %162, align 1, !dbg !717
  %164 = sext i8 %163 to i32, !dbg !717
  %165 = icmp eq i32 %164, 45, !dbg !720
  br i1 %165, label %166, label %169, !dbg !721

166:                                              ; preds = %159
  store i32 -1, ptr %9, align 4, !dbg !722
  %167 = load i32, ptr %11, align 4, !dbg !724
  %168 = add i32 %167, 1, !dbg !724
  store i32 %168, ptr %11, align 4, !dbg !724
  br label %169, !dbg !725

169:                                              ; preds = %166, %159
  br label %170

170:                                              ; preds = %169, %156
  br label %171, !dbg !726

171:                                              ; preds = %188, %170
  %172 = load ptr, ptr %3, align 4, !dbg !727
  %173 = load i32, ptr %11, align 4, !dbg !728
  %174 = getelementptr inbounds i8, ptr %172, i32 %173, !dbg !727
  %175 = load i8, ptr %174, align 1, !dbg !727
  %176 = sext i8 %175 to i32, !dbg !727
  %177 = icmp ne i32 %176, 0, !dbg !729
  br i1 %177, label %178, label %186, !dbg !730

178:                                              ; preds = %171
  %179 = load ptr, ptr %3, align 4, !dbg !731
  %180 = load i32, ptr %11, align 4, !dbg !732
  %181 = getelementptr inbounds i8, ptr %179, i32 %180, !dbg !731
  %182 = load i8, ptr %181, align 1, !dbg !731
  %183 = sext i8 %182 to i32, !dbg !731
  %184 = call i32 @__fizzer_model__isdigit(i32 noundef %183), !dbg !733
  %185 = icmp ne i32 %184, 0, !dbg !730
  br label %186

186:                                              ; preds = %178, %171
  %187 = phi i1 [ false, %171 ], [ %185, %178 ], !dbg !734
  br i1 %187, label %188, label %200, !dbg !726

188:                                              ; preds = %186
  %189 = load i32, ptr %10, align 4, !dbg !735
  %190 = mul nsw i32 %189, 10, !dbg !737
  %191 = load ptr, ptr %3, align 4, !dbg !738
  %192 = load i32, ptr %11, align 4, !dbg !739
  %193 = getelementptr inbounds i8, ptr %191, i32 %192, !dbg !738
  %194 = load i8, ptr %193, align 1, !dbg !738
  %195 = sext i8 %194 to i32, !dbg !738
  %196 = sub nsw i32 %195, 48, !dbg !740
  %197 = add nsw i32 %190, %196, !dbg !741
  store i32 %197, ptr %10, align 4, !dbg !742
  %198 = load i32, ptr %11, align 4, !dbg !743
  %199 = add i32 %198, 1, !dbg !743
  store i32 %199, ptr %11, align 4, !dbg !743
  br label %171, !dbg !726, !llvm.loop !744

200:                                              ; preds = %186
  br label %201, !dbg !746

201:                                              ; preds = %200, %140
  %202 = load ptr, ptr %4, align 4, !dbg !747
  %203 = icmp ne ptr %202, null, !dbg !749
  br i1 %203, label %204, label %209, !dbg !750

204:                                              ; preds = %201
  %205 = load ptr, ptr %3, align 4, !dbg !751
  %206 = load i32, ptr %11, align 4, !dbg !753
  %207 = getelementptr inbounds i8, ptr %205, i32 %206, !dbg !754
  %208 = load ptr, ptr %4, align 4, !dbg !755
  store ptr %207, ptr %208, align 4, !dbg !756
  br label %209, !dbg !757

209:                                              ; preds = %204, %201
  call void @llvm.dbg.declare(metadata ptr %12, metadata !758, metadata !DIExpression()), !dbg !759
  store double 1.000000e+00, ptr %12, align 8, !dbg !759
  call void @llvm.dbg.declare(metadata ptr %13, metadata !760, metadata !DIExpression()), !dbg !762
  store i32 0, ptr %13, align 4, !dbg !762
  br label %210, !dbg !763

210:                                              ; preds = %217, %209
  %211 = load i32, ptr %13, align 4, !dbg !764
  %212 = load i32, ptr %10, align 4, !dbg !766
  %213 = icmp slt i32 %211, %212, !dbg !767
  br i1 %213, label %214, label %220, !dbg !768

214:                                              ; preds = %210
  %215 = load double, ptr %12, align 8, !dbg !769
  %216 = fmul double %215, 1.000000e+01, !dbg !771
  store double %216, ptr %12, align 8, !dbg !772
  br label %217, !dbg !773

217:                                              ; preds = %214
  %218 = load i32, ptr %13, align 4, !dbg !774
  %219 = add nsw i32 %218, 1, !dbg !774
  store i32 %219, ptr %13, align 4, !dbg !774
  br label %210, !dbg !775, !llvm.loop !776

220:                                              ; preds = %210
  %221 = load i32, ptr %9, align 4, !dbg !778
  %222 = icmp slt i32 %221, 0, !dbg !780
  br i1 %222, label %223, label %227, !dbg !781

223:                                              ; preds = %220
  %224 = load double, ptr %5, align 8, !dbg !782
  %225 = load double, ptr %12, align 8, !dbg !784
  %226 = fdiv double %224, %225, !dbg !785
  store double %226, ptr %5, align 8, !dbg !786
  br label %231, !dbg !787

227:                                              ; preds = %220
  %228 = load double, ptr %5, align 8, !dbg !788
  %229 = load double, ptr %12, align 8, !dbg !790
  %230 = fmul double %228, %229, !dbg !791
  store double %230, ptr %5, align 8, !dbg !792
  br label %231

231:                                              ; preds = %227, %223
  %232 = load i32, ptr %7, align 4, !dbg !793
  %233 = sitofp i32 %232 to double, !dbg !793
  %234 = load double, ptr %5, align 8, !dbg !794
  %235 = fmul double %233, %234, !dbg !795
  ret double %235, !dbg !796
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__abs(i32 noundef %0) #0 !dbg !797 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !801, metadata !DIExpression()), !dbg !802
  %4 = load i32, ptr %3, align 4, !dbg !803
  %5 = icmp slt i32 %4, 0, !dbg !805
  br i1 %5, label %6, label %9, !dbg !806

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !807
  %8 = sub nsw i32 0, %7, !dbg !808
  store i32 %8, ptr %2, align 4, !dbg !809
  br label %11, !dbg !809

9:                                                ; preds = %1
  %10 = load i32, ptr %3, align 4, !dbg !810
  store i32 %10, ptr %2, align 4, !dbg !811
  br label %11, !dbg !811

11:                                               ; preds = %9, %6
  %12 = load i32, ptr %2, align 4, !dbg !812
  ret i32 %12, !dbg !812
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__labs(i32 noundef %0) #0 !dbg !813 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !818, metadata !DIExpression()), !dbg !819
  %4 = load i32, ptr %3, align 4, !dbg !820
  %5 = icmp slt i32 %4, 0, !dbg !822
  br i1 %5, label %6, label %9, !dbg !823

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !824
  %8 = sub nsw i32 0, %7, !dbg !825
  store i32 %8, ptr %2, align 4, !dbg !826
  br label %11, !dbg !826

9:                                                ; preds = %1
  %10 = load i32, ptr %3, align 4, !dbg !827
  store i32 %10, ptr %2, align 4, !dbg !828
  br label %11, !dbg !828

11:                                               ; preds = %9, %6
  %12 = load i32, ptr %2, align 4, !dbg !829
  ret i32 %12, !dbg !829
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__llabs(i64 noundef %0) #0 !dbg !830 {
  %2 = alloca i64, align 4
  %3 = alloca i64, align 8
  store i64 %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !834, metadata !DIExpression()), !dbg !835
  %4 = load i64, ptr %3, align 8, !dbg !836
  %5 = icmp slt i64 %4, 0, !dbg !838
  br i1 %5, label %6, label %9, !dbg !839

6:                                                ; preds = %1
  %7 = load i64, ptr %3, align 8, !dbg !840
  %8 = sub nsw i64 0, %7, !dbg !841
  store i64 %8, ptr %2, align 4, !dbg !842
  br label %11, !dbg !842

9:                                                ; preds = %1
  %10 = load i64, ptr %3, align 8, !dbg !843
  store i64 %10, ptr %2, align 4, !dbg !844
  br label %11, !dbg !844

11:                                               ; preds = %9, %6
  %12 = load i64, ptr %2, align 4, !dbg !845
  ret i64 %12, !dbg !845
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strtol(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !846 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 4
  %6 = alloca ptr, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !850, metadata !DIExpression()), !dbg !851
  store ptr %1, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !852, metadata !DIExpression()), !dbg !853
  store i32 %2, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !854, metadata !DIExpression()), !dbg !855
  call void @llvm.dbg.declare(metadata ptr %8, metadata !856, metadata !DIExpression()), !dbg !857
  store i32 0, ptr %8, align 4, !dbg !857
  call void @llvm.dbg.declare(metadata ptr %9, metadata !858, metadata !DIExpression()), !dbg !859
  store i32 1, ptr %9, align 4, !dbg !859
  call void @llvm.dbg.declare(metadata ptr %10, metadata !860, metadata !DIExpression()), !dbg !863
  store i32 0, ptr %10, align 4, !dbg !863
  %12 = load i32, ptr %7, align 4, !dbg !864
  %13 = icmp ne i32 %12, 10, !dbg !866
  br i1 %13, label %14, label %21, !dbg !867

14:                                               ; preds = %3
  %15 = load ptr, ptr %6, align 4, !dbg !868
  %16 = icmp ne ptr %15, null, !dbg !871
  br i1 %16, label %17, label %20, !dbg !872

17:                                               ; preds = %14
  %18 = load ptr, ptr %5, align 4, !dbg !873
  %19 = load ptr, ptr %6, align 4, !dbg !875
  store ptr %18, ptr %19, align 4, !dbg !876
  br label %20, !dbg !877

20:                                               ; preds = %17, %14
  store i32 0, ptr %4, align 4, !dbg !878
  br label %106, !dbg !878

21:                                               ; preds = %3
  br label %22, !dbg !879

22:                                               ; preds = %39, %21
  %23 = load ptr, ptr %5, align 4, !dbg !880
  %24 = load i32, ptr %10, align 4, !dbg !881
  %25 = getelementptr inbounds i8, ptr %23, i32 %24, !dbg !880
  %26 = load i8, ptr %25, align 1, !dbg !880
  %27 = sext i8 %26 to i32, !dbg !880
  %28 = icmp ne i32 %27, 0, !dbg !882
  br i1 %28, label %29, label %37, !dbg !883

29:                                               ; preds = %22
  %30 = load ptr, ptr %5, align 4, !dbg !884
  %31 = load i32, ptr %10, align 4, !dbg !885
  %32 = getelementptr inbounds i8, ptr %30, i32 %31, !dbg !884
  %33 = load i8, ptr %32, align 1, !dbg !884
  %34 = sext i8 %33 to i32, !dbg !884
  %35 = call i32 @__fizzer_model__isspace(i32 noundef %34), !dbg !886
  %36 = icmp ne i32 %35, 0, !dbg !883
  br label %37

37:                                               ; preds = %29, %22
  %38 = phi i1 [ false, %22 ], [ %36, %29 ], !dbg !887
  br i1 %38, label %39, label %42, !dbg !879

39:                                               ; preds = %37
  %40 = load i32, ptr %10, align 4, !dbg !888
  %41 = add i32 %40, 1, !dbg !888
  store i32 %41, ptr %10, align 4, !dbg !888
  br label %22, !dbg !879, !llvm.loop !890

42:                                               ; preds = %37
  %43 = load ptr, ptr %5, align 4, !dbg !892
  %44 = load i32, ptr %10, align 4, !dbg !894
  %45 = getelementptr inbounds i8, ptr %43, i32 %44, !dbg !892
  %46 = load i8, ptr %45, align 1, !dbg !892
  %47 = sext i8 %46 to i32, !dbg !892
  %48 = icmp eq i32 %47, 43, !dbg !895
  br i1 %48, label %49, label %52, !dbg !896

49:                                               ; preds = %42
  %50 = load i32, ptr %10, align 4, !dbg !897
  %51 = add i32 %50, 1, !dbg !897
  store i32 %51, ptr %10, align 4, !dbg !897
  br label %63, !dbg !899

52:                                               ; preds = %42
  %53 = load ptr, ptr %5, align 4, !dbg !900
  %54 = load i32, ptr %10, align 4, !dbg !902
  %55 = getelementptr inbounds i8, ptr %53, i32 %54, !dbg !900
  %56 = load i8, ptr %55, align 1, !dbg !900
  %57 = sext i8 %56 to i32, !dbg !900
  %58 = icmp eq i32 %57, 45, !dbg !903
  br i1 %58, label %59, label %62, !dbg !904

59:                                               ; preds = %52
  store i32 -1, ptr %9, align 4, !dbg !905
  %60 = load i32, ptr %10, align 4, !dbg !907
  %61 = add i32 %60, 1, !dbg !907
  store i32 %61, ptr %10, align 4, !dbg !907
  br label %62, !dbg !908

62:                                               ; preds = %59, %52
  br label %63

63:                                               ; preds = %62, %49
  call void @llvm.dbg.declare(metadata ptr %11, metadata !909, metadata !DIExpression()), !dbg !910
  %64 = load i32, ptr %10, align 4, !dbg !911
  store i32 %64, ptr %11, align 4, !dbg !910
  br label %65, !dbg !912

65:                                               ; preds = %82, %63
  %66 = load ptr, ptr %5, align 4, !dbg !913
  %67 = load i32, ptr %10, align 4, !dbg !914
  %68 = getelementptr inbounds i8, ptr %66, i32 %67, !dbg !913
  %69 = load i8, ptr %68, align 1, !dbg !913
  %70 = sext i8 %69 to i32, !dbg !913
  %71 = icmp ne i32 %70, 0, !dbg !915
  br i1 %71, label %72, label %80, !dbg !916

72:                                               ; preds = %65
  %73 = load ptr, ptr %5, align 4, !dbg !917
  %74 = load i32, ptr %10, align 4, !dbg !918
  %75 = getelementptr inbounds i8, ptr %73, i32 %74, !dbg !917
  %76 = load i8, ptr %75, align 1, !dbg !917
  %77 = sext i8 %76 to i32, !dbg !917
  %78 = call i32 @__fizzer_model__isdigit(i32 noundef %77), !dbg !919
  %79 = icmp ne i32 %78, 0, !dbg !916
  br label %80

80:                                               ; preds = %72, %65
  %81 = phi i1 [ false, %65 ], [ %79, %72 ], !dbg !887
  br i1 %81, label %82, label %94, !dbg !912

82:                                               ; preds = %80
  %83 = load i32, ptr %8, align 4, !dbg !920
  %84 = mul nsw i32 %83, 10, !dbg !922
  %85 = load ptr, ptr %5, align 4, !dbg !923
  %86 = load i32, ptr %10, align 4, !dbg !924
  %87 = getelementptr inbounds i8, ptr %85, i32 %86, !dbg !923
  %88 = load i8, ptr %87, align 1, !dbg !923
  %89 = sext i8 %88 to i32, !dbg !923
  %90 = sub nsw i32 %89, 48, !dbg !925
  %91 = add nsw i32 %84, %90, !dbg !926
  store i32 %91, ptr %8, align 4, !dbg !927
  %92 = load i32, ptr %10, align 4, !dbg !928
  %93 = add i32 %92, 1, !dbg !928
  store i32 %93, ptr %10, align 4, !dbg !928
  br label %65, !dbg !912, !llvm.loop !929

94:                                               ; preds = %80
  %95 = load ptr, ptr %6, align 4, !dbg !931
  %96 = icmp ne ptr %95, null, !dbg !933
  br i1 %96, label %97, label %102, !dbg !934

97:                                               ; preds = %94
  %98 = load ptr, ptr %5, align 4, !dbg !935
  %99 = load i32, ptr %10, align 4, !dbg !937
  %100 = getelementptr inbounds i8, ptr %98, i32 %99, !dbg !938
  %101 = load ptr, ptr %6, align 4, !dbg !939
  store ptr %100, ptr %101, align 4, !dbg !940
  br label %102, !dbg !941

102:                                              ; preds = %97, %94
  %103 = load i32, ptr %9, align 4, !dbg !942
  %104 = load i32, ptr %8, align 4, !dbg !943
  %105 = mul nsw i32 %103, %104, !dbg !944
  store i32 %105, ptr %4, align 4, !dbg !945
  br label %106, !dbg !945

106:                                              ; preds = %102, %20
  %107 = load i32, ptr %4, align 4, !dbg !946
  ret i32 %107, !dbg !946
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__atol(ptr noundef %0) #0 !dbg !947 {
  %2 = alloca ptr, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !951, metadata !DIExpression()), !dbg !952
  call void @llvm.dbg.declare(metadata ptr %3, metadata !953, metadata !DIExpression()), !dbg !954
  store i32 0, ptr %3, align 4, !dbg !954
  call void @llvm.dbg.declare(metadata ptr %4, metadata !955, metadata !DIExpression()), !dbg !956
  store i32 1, ptr %4, align 4, !dbg !956
  call void @llvm.dbg.declare(metadata ptr %5, metadata !957, metadata !DIExpression()), !dbg !960
  store i32 0, ptr %5, align 4, !dbg !960
  br label %6, !dbg !961

6:                                                ; preds = %23, %1
  %7 = load ptr, ptr %2, align 4, !dbg !962
  %8 = load i32, ptr %5, align 4, !dbg !963
  %9 = getelementptr inbounds i8, ptr %7, i32 %8, !dbg !962
  %10 = load i8, ptr %9, align 1, !dbg !962
  %11 = sext i8 %10 to i32, !dbg !962
  %12 = icmp ne i32 %11, 0, !dbg !964
  br i1 %12, label %13, label %21, !dbg !965

13:                                               ; preds = %6
  %14 = load ptr, ptr %2, align 4, !dbg !966
  %15 = load i32, ptr %5, align 4, !dbg !967
  %16 = getelementptr inbounds i8, ptr %14, i32 %15, !dbg !966
  %17 = load i8, ptr %16, align 1, !dbg !966
  %18 = sext i8 %17 to i32, !dbg !966
  %19 = call i32 @__fizzer_model__isspace(i32 noundef %18), !dbg !968
  %20 = icmp ne i32 %19, 0, !dbg !965
  br label %21

21:                                               ; preds = %13, %6
  %22 = phi i1 [ false, %6 ], [ %20, %13 ], !dbg !969
  br i1 %22, label %23, label %26, !dbg !961

23:                                               ; preds = %21
  %24 = load i32, ptr %5, align 4, !dbg !970
  %25 = add i32 %24, 1, !dbg !970
  store i32 %25, ptr %5, align 4, !dbg !970
  br label %6, !dbg !961, !llvm.loop !972

26:                                               ; preds = %21
  %27 = load ptr, ptr %2, align 4, !dbg !974
  %28 = load i32, ptr %5, align 4, !dbg !976
  %29 = getelementptr inbounds i8, ptr %27, i32 %28, !dbg !974
  %30 = load i8, ptr %29, align 1, !dbg !974
  %31 = sext i8 %30 to i32, !dbg !974
  %32 = icmp eq i32 %31, 43, !dbg !977
  br i1 %32, label %33, label %36, !dbg !978

33:                                               ; preds = %26
  %34 = load i32, ptr %5, align 4, !dbg !979
  %35 = add i32 %34, 1, !dbg !979
  store i32 %35, ptr %5, align 4, !dbg !979
  br label %47, !dbg !981

36:                                               ; preds = %26
  %37 = load ptr, ptr %2, align 4, !dbg !982
  %38 = load i32, ptr %5, align 4, !dbg !984
  %39 = getelementptr inbounds i8, ptr %37, i32 %38, !dbg !982
  %40 = load i8, ptr %39, align 1, !dbg !982
  %41 = sext i8 %40 to i32, !dbg !982
  %42 = icmp eq i32 %41, 45, !dbg !985
  br i1 %42, label %43, label %46, !dbg !986

43:                                               ; preds = %36
  store i32 -1, ptr %4, align 4, !dbg !987
  %44 = load i32, ptr %5, align 4, !dbg !989
  %45 = add i32 %44, 1, !dbg !989
  store i32 %45, ptr %5, align 4, !dbg !989
  br label %46, !dbg !990

46:                                               ; preds = %43, %36
  br label %47

47:                                               ; preds = %46, %33
  br label %48, !dbg !991

48:                                               ; preds = %65, %47
  %49 = load ptr, ptr %2, align 4, !dbg !992
  %50 = load i32, ptr %5, align 4, !dbg !993
  %51 = getelementptr inbounds i8, ptr %49, i32 %50, !dbg !992
  %52 = load i8, ptr %51, align 1, !dbg !992
  %53 = sext i8 %52 to i32, !dbg !992
  %54 = icmp ne i32 %53, 0, !dbg !994
  br i1 %54, label %55, label %63, !dbg !995

55:                                               ; preds = %48
  %56 = load ptr, ptr %2, align 4, !dbg !996
  %57 = load i32, ptr %5, align 4, !dbg !997
  %58 = getelementptr inbounds i8, ptr %56, i32 %57, !dbg !996
  %59 = load i8, ptr %58, align 1, !dbg !996
  %60 = sext i8 %59 to i32, !dbg !996
  %61 = call i32 @__fizzer_model__isdigit(i32 noundef %60), !dbg !998
  %62 = icmp ne i32 %61, 0, !dbg !995
  br label %63

63:                                               ; preds = %55, %48
  %64 = phi i1 [ false, %48 ], [ %62, %55 ], !dbg !969
  br i1 %64, label %65, label %77, !dbg !991

65:                                               ; preds = %63
  %66 = load i32, ptr %3, align 4, !dbg !999
  %67 = mul nsw i32 %66, 10, !dbg !1001
  %68 = load ptr, ptr %2, align 4, !dbg !1002
  %69 = load i32, ptr %5, align 4, !dbg !1003
  %70 = getelementptr inbounds i8, ptr %68, i32 %69, !dbg !1002
  %71 = load i8, ptr %70, align 1, !dbg !1002
  %72 = sext i8 %71 to i32, !dbg !1002
  %73 = sub nsw i32 %72, 48, !dbg !1004
  %74 = add nsw i32 %67, %73, !dbg !1005
  store i32 %74, ptr %3, align 4, !dbg !1006
  %75 = load i32, ptr %5, align 4, !dbg !1007
  %76 = add i32 %75, 1, !dbg !1007
  store i32 %76, ptr %5, align 4, !dbg !1007
  br label %48, !dbg !991, !llvm.loop !1008

77:                                               ; preds = %63
  %78 = load i32, ptr %4, align 4, !dbg !1010
  %79 = load i32, ptr %3, align 4, !dbg !1011
  %80 = mul nsw i32 %78, %79, !dbg !1012
  ret i32 %80, !dbg !1013
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strtoul(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !1014 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 4
  %6 = alloca ptr, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1019, metadata !DIExpression()), !dbg !1020
  store ptr %1, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1021, metadata !DIExpression()), !dbg !1022
  store i32 %2, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1023, metadata !DIExpression()), !dbg !1024
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1025, metadata !DIExpression()), !dbg !1026
  store i32 0, ptr %8, align 4, !dbg !1026
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1027, metadata !DIExpression()), !dbg !1030
  store i32 0, ptr %9, align 4, !dbg !1030
  %11 = load i32, ptr %7, align 4, !dbg !1031
  %12 = icmp ne i32 %11, 10, !dbg !1033
  br i1 %12, label %13, label %20, !dbg !1034

13:                                               ; preds = %3
  %14 = load ptr, ptr %6, align 4, !dbg !1035
  %15 = icmp ne ptr %14, null, !dbg !1038
  br i1 %15, label %16, label %19, !dbg !1039

16:                                               ; preds = %13
  %17 = load ptr, ptr %5, align 4, !dbg !1040
  %18 = load ptr, ptr %6, align 4, !dbg !1042
  store ptr %17, ptr %18, align 4, !dbg !1043
  br label %19, !dbg !1044

19:                                               ; preds = %16, %13
  store i32 0, ptr %4, align 4, !dbg !1045
  br label %92, !dbg !1045

20:                                               ; preds = %3
  br label %21, !dbg !1046

21:                                               ; preds = %38, %20
  %22 = load ptr, ptr %5, align 4, !dbg !1047
  %23 = load i32, ptr %9, align 4, !dbg !1048
  %24 = getelementptr inbounds i8, ptr %22, i32 %23, !dbg !1047
  %25 = load i8, ptr %24, align 1, !dbg !1047
  %26 = sext i8 %25 to i32, !dbg !1047
  %27 = icmp ne i32 %26, 0, !dbg !1049
  br i1 %27, label %28, label %36, !dbg !1050

28:                                               ; preds = %21
  %29 = load ptr, ptr %5, align 4, !dbg !1051
  %30 = load i32, ptr %9, align 4, !dbg !1052
  %31 = getelementptr inbounds i8, ptr %29, i32 %30, !dbg !1051
  %32 = load i8, ptr %31, align 1, !dbg !1051
  %33 = sext i8 %32 to i32, !dbg !1051
  %34 = call i32 @__fizzer_model__isspace(i32 noundef %33), !dbg !1053
  %35 = icmp ne i32 %34, 0, !dbg !1050
  br label %36

36:                                               ; preds = %28, %21
  %37 = phi i1 [ false, %21 ], [ %35, %28 ], !dbg !1054
  br i1 %37, label %38, label %41, !dbg !1046

38:                                               ; preds = %36
  %39 = load i32, ptr %9, align 4, !dbg !1055
  %40 = add i32 %39, 1, !dbg !1055
  store i32 %40, ptr %9, align 4, !dbg !1055
  br label %21, !dbg !1046, !llvm.loop !1057

41:                                               ; preds = %36
  %42 = load ptr, ptr %5, align 4, !dbg !1059
  %43 = load i32, ptr %9, align 4, !dbg !1061
  %44 = getelementptr inbounds i8, ptr %42, i32 %43, !dbg !1059
  %45 = load i8, ptr %44, align 1, !dbg !1059
  %46 = sext i8 %45 to i32, !dbg !1059
  %47 = icmp eq i32 %46, 43, !dbg !1062
  br i1 %47, label %48, label %51, !dbg !1063

48:                                               ; preds = %41
  %49 = load i32, ptr %9, align 4, !dbg !1064
  %50 = add i32 %49, 1, !dbg !1064
  store i32 %50, ptr %9, align 4, !dbg !1064
  br label %51, !dbg !1066

51:                                               ; preds = %48, %41
  call void @llvm.dbg.declare(metadata ptr %10, metadata !1067, metadata !DIExpression()), !dbg !1068
  %52 = load i32, ptr %9, align 4, !dbg !1069
  store i32 %52, ptr %10, align 4, !dbg !1068
  br label %53, !dbg !1070

53:                                               ; preds = %70, %51
  %54 = load ptr, ptr %5, align 4, !dbg !1071
  %55 = load i32, ptr %9, align 4, !dbg !1072
  %56 = getelementptr inbounds i8, ptr %54, i32 %55, !dbg !1071
  %57 = load i8, ptr %56, align 1, !dbg !1071
  %58 = sext i8 %57 to i32, !dbg !1071
  %59 = icmp ne i32 %58, 0, !dbg !1073
  br i1 %59, label %60, label %68, !dbg !1074

60:                                               ; preds = %53
  %61 = load ptr, ptr %5, align 4, !dbg !1075
  %62 = load i32, ptr %9, align 4, !dbg !1076
  %63 = getelementptr inbounds i8, ptr %61, i32 %62, !dbg !1075
  %64 = load i8, ptr %63, align 1, !dbg !1075
  %65 = sext i8 %64 to i32, !dbg !1075
  %66 = call i32 @__fizzer_model__isdigit(i32 noundef %65), !dbg !1077
  %67 = icmp ne i32 %66, 0, !dbg !1074
  br label %68

68:                                               ; preds = %60, %53
  %69 = phi i1 [ false, %53 ], [ %67, %60 ], !dbg !1054
  br i1 %69, label %70, label %82, !dbg !1070

70:                                               ; preds = %68
  %71 = load i32, ptr %8, align 4, !dbg !1078
  %72 = mul i32 %71, 10, !dbg !1080
  %73 = load ptr, ptr %5, align 4, !dbg !1081
  %74 = load i32, ptr %9, align 4, !dbg !1082
  %75 = getelementptr inbounds i8, ptr %73, i32 %74, !dbg !1081
  %76 = load i8, ptr %75, align 1, !dbg !1081
  %77 = sext i8 %76 to i32, !dbg !1081
  %78 = sub nsw i32 %77, 48, !dbg !1083
  %79 = add i32 %72, %78, !dbg !1084
  store i32 %79, ptr %8, align 4, !dbg !1085
  %80 = load i32, ptr %9, align 4, !dbg !1086
  %81 = add i32 %80, 1, !dbg !1086
  store i32 %81, ptr %9, align 4, !dbg !1086
  br label %53, !dbg !1070, !llvm.loop !1087

82:                                               ; preds = %68
  %83 = load ptr, ptr %6, align 4, !dbg !1089
  %84 = icmp ne ptr %83, null, !dbg !1091
  br i1 %84, label %85, label %90, !dbg !1092

85:                                               ; preds = %82
  %86 = load ptr, ptr %5, align 4, !dbg !1093
  %87 = load i32, ptr %9, align 4, !dbg !1095
  %88 = getelementptr inbounds i8, ptr %86, i32 %87, !dbg !1096
  %89 = load ptr, ptr %6, align 4, !dbg !1097
  store ptr %88, ptr %89, align 4, !dbg !1098
  br label %90, !dbg !1099

90:                                               ; preds = %85, %82
  %91 = load i32, ptr %8, align 4, !dbg !1100
  store i32 %91, ptr %4, align 4, !dbg !1101
  br label %92, !dbg !1101

92:                                               ; preds = %90, %19
  %93 = load i32, ptr %4, align 4, !dbg !1102
  ret i32 %93, !dbg !1102
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__atoi(ptr noundef %0) #0 !dbg !1103 {
  %2 = alloca ptr, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1107, metadata !DIExpression()), !dbg !1108
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1109, metadata !DIExpression()), !dbg !1110
  store i32 0, ptr %3, align 4, !dbg !1110
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1111, metadata !DIExpression()), !dbg !1112
  store i32 1, ptr %4, align 4, !dbg !1112
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1113, metadata !DIExpression()), !dbg !1116
  store i32 0, ptr %5, align 4, !dbg !1116
  br label %6, !dbg !1117

6:                                                ; preds = %23, %1
  %7 = load ptr, ptr %2, align 4, !dbg !1118
  %8 = load i32, ptr %5, align 4, !dbg !1119
  %9 = getelementptr inbounds i8, ptr %7, i32 %8, !dbg !1118
  %10 = load i8, ptr %9, align 1, !dbg !1118
  %11 = sext i8 %10 to i32, !dbg !1118
  %12 = icmp ne i32 %11, 0, !dbg !1120
  br i1 %12, label %13, label %21, !dbg !1121

13:                                               ; preds = %6
  %14 = load ptr, ptr %2, align 4, !dbg !1122
  %15 = load i32, ptr %5, align 4, !dbg !1123
  %16 = getelementptr inbounds i8, ptr %14, i32 %15, !dbg !1122
  %17 = load i8, ptr %16, align 1, !dbg !1122
  %18 = sext i8 %17 to i32, !dbg !1122
  %19 = call i32 @__fizzer_model__isspace(i32 noundef %18), !dbg !1124
  %20 = icmp ne i32 %19, 0, !dbg !1121
  br label %21

21:                                               ; preds = %13, %6
  %22 = phi i1 [ false, %6 ], [ %20, %13 ], !dbg !1125
  br i1 %22, label %23, label %26, !dbg !1117

23:                                               ; preds = %21
  %24 = load i32, ptr %5, align 4, !dbg !1126
  %25 = add i32 %24, 1, !dbg !1126
  store i32 %25, ptr %5, align 4, !dbg !1126
  br label %6, !dbg !1117, !llvm.loop !1128

26:                                               ; preds = %21
  %27 = load ptr, ptr %2, align 4, !dbg !1130
  %28 = load i32, ptr %5, align 4, !dbg !1132
  %29 = getelementptr inbounds i8, ptr %27, i32 %28, !dbg !1130
  %30 = load i8, ptr %29, align 1, !dbg !1130
  %31 = sext i8 %30 to i32, !dbg !1130
  %32 = icmp eq i32 %31, 43, !dbg !1133
  br i1 %32, label %33, label %36, !dbg !1134

33:                                               ; preds = %26
  %34 = load i32, ptr %5, align 4, !dbg !1135
  %35 = add i32 %34, 1, !dbg !1135
  store i32 %35, ptr %5, align 4, !dbg !1135
  br label %47, !dbg !1137

36:                                               ; preds = %26
  %37 = load ptr, ptr %2, align 4, !dbg !1138
  %38 = load i32, ptr %5, align 4, !dbg !1140
  %39 = getelementptr inbounds i8, ptr %37, i32 %38, !dbg !1138
  %40 = load i8, ptr %39, align 1, !dbg !1138
  %41 = sext i8 %40 to i32, !dbg !1138
  %42 = icmp eq i32 %41, 45, !dbg !1141
  br i1 %42, label %43, label %46, !dbg !1142

43:                                               ; preds = %36
  store i32 -1, ptr %4, align 4, !dbg !1143
  %44 = load i32, ptr %5, align 4, !dbg !1145
  %45 = add i32 %44, 1, !dbg !1145
  store i32 %45, ptr %5, align 4, !dbg !1145
  br label %46, !dbg !1146

46:                                               ; preds = %43, %36
  br label %47

47:                                               ; preds = %46, %33
  br label %48, !dbg !1147

48:                                               ; preds = %65, %47
  %49 = load ptr, ptr %2, align 4, !dbg !1148
  %50 = load i32, ptr %5, align 4, !dbg !1149
  %51 = getelementptr inbounds i8, ptr %49, i32 %50, !dbg !1148
  %52 = load i8, ptr %51, align 1, !dbg !1148
  %53 = sext i8 %52 to i32, !dbg !1148
  %54 = icmp ne i32 %53, 0, !dbg !1150
  br i1 %54, label %55, label %63, !dbg !1151

55:                                               ; preds = %48
  %56 = load ptr, ptr %2, align 4, !dbg !1152
  %57 = load i32, ptr %5, align 4, !dbg !1153
  %58 = getelementptr inbounds i8, ptr %56, i32 %57, !dbg !1152
  %59 = load i8, ptr %58, align 1, !dbg !1152
  %60 = sext i8 %59 to i32, !dbg !1152
  %61 = call i32 @__fizzer_model__isdigit(i32 noundef %60), !dbg !1154
  %62 = icmp ne i32 %61, 0, !dbg !1151
  br label %63

63:                                               ; preds = %55, %48
  %64 = phi i1 [ false, %48 ], [ %62, %55 ], !dbg !1125
  br i1 %64, label %65, label %77, !dbg !1147

65:                                               ; preds = %63
  %66 = load i32, ptr %3, align 4, !dbg !1155
  %67 = mul nsw i32 %66, 10, !dbg !1157
  %68 = load ptr, ptr %2, align 4, !dbg !1158
  %69 = load i32, ptr %5, align 4, !dbg !1159
  %70 = getelementptr inbounds i8, ptr %68, i32 %69, !dbg !1158
  %71 = load i8, ptr %70, align 1, !dbg !1158
  %72 = sext i8 %71 to i32, !dbg !1158
  %73 = sub nsw i32 %72, 48, !dbg !1160
  %74 = add nsw i32 %67, %73, !dbg !1161
  store i32 %74, ptr %3, align 4, !dbg !1162
  %75 = load i32, ptr %5, align 4, !dbg !1163
  %76 = add i32 %75, 1, !dbg !1163
  store i32 %76, ptr %5, align 4, !dbg !1163
  br label %48, !dbg !1147, !llvm.loop !1164

77:                                               ; preds = %63
  %78 = load i32, ptr %4, align 4, !dbg !1166
  %79 = load i32, ptr %3, align 4, !dbg !1167
  %80 = mul nsw i32 %78, %79, !dbg !1168
  ret i32 %80, !dbg !1169
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strstr(ptr noundef %0, ptr noundef %1) #0 !dbg !1170 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  %6 = alloca ptr, align 4
  %7 = alloca ptr, align 4
  store ptr %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1174, metadata !DIExpression()), !dbg !1175
  store ptr %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1176, metadata !DIExpression()), !dbg !1177
  %8 = load ptr, ptr %5, align 4, !dbg !1178
  %9 = load i8, ptr %8, align 1, !dbg !1180
  %10 = sext i8 %9 to i32, !dbg !1180
  %11 = icmp eq i32 %10, 0, !dbg !1181
  br i1 %11, label %12, label %14, !dbg !1182

12:                                               ; preds = %2
  %13 = load ptr, ptr %4, align 4, !dbg !1183
  store ptr %13, ptr %3, align 4, !dbg !1185
  br label %59, !dbg !1185

14:                                               ; preds = %2
  br label %15, !dbg !1186

15:                                               ; preds = %55, %14
  %16 = load ptr, ptr %4, align 4, !dbg !1187
  %17 = load i8, ptr %16, align 1, !dbg !1188
  %18 = sext i8 %17 to i32, !dbg !1188
  %19 = icmp ne i32 %18, 0, !dbg !1189
  br i1 %19, label %20, label %58, !dbg !1186

20:                                               ; preds = %15
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1190, metadata !DIExpression()), !dbg !1192
  %21 = load ptr, ptr %4, align 4, !dbg !1193
  store ptr %21, ptr %6, align 4, !dbg !1192
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1194, metadata !DIExpression()), !dbg !1195
  %22 = load ptr, ptr %5, align 4, !dbg !1196
  store ptr %22, ptr %7, align 4, !dbg !1195
  br label %23, !dbg !1197

23:                                               ; preds = %43, %20
  %24 = load ptr, ptr %6, align 4, !dbg !1198
  %25 = load i8, ptr %24, align 1, !dbg !1199
  %26 = sext i8 %25 to i32, !dbg !1199
  %27 = icmp ne i32 %26, 0, !dbg !1200
  br i1 %27, label %28, label %41, !dbg !1201

28:                                               ; preds = %23
  %29 = load ptr, ptr %7, align 4, !dbg !1202
  %30 = load i8, ptr %29, align 1, !dbg !1203
  %31 = sext i8 %30 to i32, !dbg !1203
  %32 = icmp ne i32 %31, 0, !dbg !1204
  br i1 %32, label %33, label %41, !dbg !1205

33:                                               ; preds = %28
  %34 = load ptr, ptr %6, align 4, !dbg !1206
  %35 = load i8, ptr %34, align 1, !dbg !1207
  %36 = sext i8 %35 to i32, !dbg !1207
  %37 = load ptr, ptr %7, align 4, !dbg !1208
  %38 = load i8, ptr %37, align 1, !dbg !1209
  %39 = sext i8 %38 to i32, !dbg !1209
  %40 = icmp eq i32 %36, %39, !dbg !1210
  br label %41

41:                                               ; preds = %33, %28, %23
  %42 = phi i1 [ false, %28 ], [ false, %23 ], [ %40, %33 ], !dbg !1211
  br i1 %42, label %43, label %48, !dbg !1197

43:                                               ; preds = %41
  %44 = load ptr, ptr %6, align 4, !dbg !1212
  %45 = getelementptr inbounds i8, ptr %44, i32 1, !dbg !1212
  store ptr %45, ptr %6, align 4, !dbg !1212
  %46 = load ptr, ptr %7, align 4, !dbg !1214
  %47 = getelementptr inbounds i8, ptr %46, i32 1, !dbg !1214
  store ptr %47, ptr %7, align 4, !dbg !1214
  br label %23, !dbg !1197, !llvm.loop !1215

48:                                               ; preds = %41
  %49 = load ptr, ptr %7, align 4, !dbg !1217
  %50 = load i8, ptr %49, align 1, !dbg !1219
  %51 = sext i8 %50 to i32, !dbg !1219
  %52 = icmp eq i32 %51, 0, !dbg !1220
  br i1 %52, label %53, label %55, !dbg !1221

53:                                               ; preds = %48
  %54 = load ptr, ptr %4, align 4, !dbg !1222
  store ptr %54, ptr %3, align 4, !dbg !1224
  br label %59, !dbg !1224

55:                                               ; preds = %48
  %56 = load ptr, ptr %4, align 4, !dbg !1225
  %57 = getelementptr inbounds i8, ptr %56, i32 1, !dbg !1225
  store ptr %57, ptr %4, align 4, !dbg !1225
  br label %15, !dbg !1186, !llvm.loop !1226

58:                                               ; preds = %15
  store ptr null, ptr %3, align 4, !dbg !1228
  br label %59, !dbg !1228

59:                                               ; preds = %58, %53, %12
  %60 = load ptr, ptr %3, align 4, !dbg !1229
  ret ptr %60, !dbg !1229
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strpbrk(ptr noundef %0, ptr noundef %1) #0 !dbg !1230 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  %6 = alloca ptr, align 4
  store ptr %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1232, metadata !DIExpression()), !dbg !1233
  store ptr %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1234, metadata !DIExpression()), !dbg !1235
  br label %7, !dbg !1236

7:                                                ; preds = %32, %2
  %8 = load ptr, ptr %4, align 4, !dbg !1237
  %9 = load i8, ptr %8, align 1, !dbg !1238
  %10 = sext i8 %9 to i32, !dbg !1238
  %11 = icmp ne i32 %10, 0, !dbg !1239
  br i1 %11, label %12, label %35, !dbg !1236

12:                                               ; preds = %7
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1240, metadata !DIExpression()), !dbg !1242
  %13 = load ptr, ptr %5, align 4, !dbg !1243
  store ptr %13, ptr %6, align 4, !dbg !1242
  br label %14, !dbg !1244

14:                                               ; preds = %29, %12
  %15 = load ptr, ptr %6, align 4, !dbg !1245
  %16 = load i8, ptr %15, align 1, !dbg !1246
  %17 = sext i8 %16 to i32, !dbg !1246
  %18 = icmp ne i32 %17, 0, !dbg !1247
  br i1 %18, label %19, label %32, !dbg !1244

19:                                               ; preds = %14
  %20 = load ptr, ptr %6, align 4, !dbg !1248
  %21 = load i8, ptr %20, align 1, !dbg !1251
  %22 = sext i8 %21 to i32, !dbg !1251
  %23 = load ptr, ptr %4, align 4, !dbg !1252
  %24 = load i8, ptr %23, align 1, !dbg !1253
  %25 = sext i8 %24 to i32, !dbg !1253
  %26 = icmp eq i32 %22, %25, !dbg !1254
  br i1 %26, label %27, label %29, !dbg !1255

27:                                               ; preds = %19
  %28 = load ptr, ptr %4, align 4, !dbg !1256
  store ptr %28, ptr %3, align 4, !dbg !1258
  br label %36, !dbg !1258

29:                                               ; preds = %19
  %30 = load ptr, ptr %6, align 4, !dbg !1259
  %31 = getelementptr inbounds i8, ptr %30, i32 1, !dbg !1259
  store ptr %31, ptr %6, align 4, !dbg !1259
  br label %14, !dbg !1244, !llvm.loop !1260

32:                                               ; preds = %14
  %33 = load ptr, ptr %4, align 4, !dbg !1262
  %34 = getelementptr inbounds i8, ptr %33, i32 1, !dbg !1262
  store ptr %34, ptr %4, align 4, !dbg !1262
  br label %7, !dbg !1236, !llvm.loop !1263

35:                                               ; preds = %7
  store ptr null, ptr %3, align 4, !dbg !1265
  br label %36, !dbg !1265

36:                                               ; preds = %35, %27
  %37 = load ptr, ptr %3, align 4, !dbg !1266
  ret ptr %37, !dbg !1266
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strcpy(ptr noundef %0, ptr noundef %1) #0 !dbg !1267 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  store ptr %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1269, metadata !DIExpression()), !dbg !1270
  store ptr %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1271, metadata !DIExpression()), !dbg !1272
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1273, metadata !DIExpression()), !dbg !1274
  %6 = load ptr, ptr %3, align 4, !dbg !1275
  store ptr %6, ptr %5, align 4, !dbg !1274
  br label %7, !dbg !1276

7:                                                ; preds = %12, %2
  %8 = load ptr, ptr %4, align 4, !dbg !1277
  %9 = load i8, ptr %8, align 1, !dbg !1278
  %10 = sext i8 %9 to i32, !dbg !1278
  %11 = icmp ne i32 %10, 0, !dbg !1279
  br i1 %11, label %12, label %20, !dbg !1276

12:                                               ; preds = %7
  %13 = load ptr, ptr %4, align 4, !dbg !1280
  %14 = load i8, ptr %13, align 1, !dbg !1282
  %15 = load ptr, ptr %5, align 4, !dbg !1283
  store i8 %14, ptr %15, align 1, !dbg !1284
  %16 = load ptr, ptr %5, align 4, !dbg !1285
  %17 = getelementptr inbounds i8, ptr %16, i32 1, !dbg !1285
  store ptr %17, ptr %5, align 4, !dbg !1285
  %18 = load ptr, ptr %4, align 4, !dbg !1286
  %19 = getelementptr inbounds i8, ptr %18, i32 1, !dbg !1286
  store ptr %19, ptr %4, align 4, !dbg !1286
  br label %7, !dbg !1276, !llvm.loop !1287

20:                                               ; preds = %7
  %21 = load ptr, ptr %5, align 4, !dbg !1289
  store i8 0, ptr %21, align 1, !dbg !1290
  %22 = load ptr, ptr %3, align 4, !dbg !1291
  ret ptr %22, !dbg !1292
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strncat(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !1293 {
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1299, metadata !DIExpression()), !dbg !1300
  store ptr %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1301, metadata !DIExpression()), !dbg !1302
  store i32 %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1303, metadata !DIExpression()), !dbg !1304
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1305, metadata !DIExpression()), !dbg !1306
  %9 = load ptr, ptr %4, align 4, !dbg !1307
  store ptr %9, ptr %7, align 4, !dbg !1306
  br label %10, !dbg !1308

10:                                               ; preds = %15, %3
  %11 = load ptr, ptr %7, align 4, !dbg !1309
  %12 = load i8, ptr %11, align 1, !dbg !1310
  %13 = sext i8 %12 to i32, !dbg !1310
  %14 = icmp ne i32 %13, 0, !dbg !1311
  br i1 %14, label %15, label %18, !dbg !1308

15:                                               ; preds = %10
  %16 = load ptr, ptr %7, align 4, !dbg !1312
  %17 = getelementptr inbounds i8, ptr %16, i32 1, !dbg !1312
  store ptr %17, ptr %7, align 4, !dbg !1312
  br label %10, !dbg !1308, !llvm.loop !1314

18:                                               ; preds = %10
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1316, metadata !DIExpression()), !dbg !1317
  store i32 0, ptr %8, align 4, !dbg !1317
  br label %19, !dbg !1318

19:                                               ; preds = %30, %18
  %20 = load i32, ptr %8, align 4, !dbg !1319
  %21 = load i32, ptr %6, align 4, !dbg !1320
  %22 = icmp ult i32 %20, %21, !dbg !1321
  br i1 %22, label %23, label %28, !dbg !1322

23:                                               ; preds = %19
  %24 = load ptr, ptr %5, align 4, !dbg !1323
  %25 = load i8, ptr %24, align 1, !dbg !1324
  %26 = sext i8 %25 to i32, !dbg !1324
  %27 = icmp ne i32 %26, 0, !dbg !1325
  br label %28

28:                                               ; preds = %23, %19
  %29 = phi i1 [ false, %19 ], [ %27, %23 ], !dbg !1326
  br i1 %29, label %30, label %40, !dbg !1318

30:                                               ; preds = %28
  %31 = load ptr, ptr %5, align 4, !dbg !1327
  %32 = load i8, ptr %31, align 1, !dbg !1329
  %33 = load ptr, ptr %7, align 4, !dbg !1330
  store i8 %32, ptr %33, align 1, !dbg !1331
  %34 = load ptr, ptr %7, align 4, !dbg !1332
  %35 = getelementptr inbounds i8, ptr %34, i32 1, !dbg !1332
  store ptr %35, ptr %7, align 4, !dbg !1332
  %36 = load ptr, ptr %5, align 4, !dbg !1333
  %37 = getelementptr inbounds i8, ptr %36, i32 1, !dbg !1333
  store ptr %37, ptr %5, align 4, !dbg !1333
  %38 = load i32, ptr %8, align 4, !dbg !1334
  %39 = add i32 %38, 1, !dbg !1334
  store i32 %39, ptr %8, align 4, !dbg !1334
  br label %19, !dbg !1318, !llvm.loop !1335

40:                                               ; preds = %28
  %41 = load ptr, ptr %7, align 4, !dbg !1337
  store i8 0, ptr %41, align 1, !dbg !1338
  %42 = load ptr, ptr %4, align 4, !dbg !1339
  ret ptr %42, !dbg !1340
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strcspn(ptr noundef %0, ptr noundef %1) #0 !dbg !1341 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 4
  store ptr %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1347, metadata !DIExpression()), !dbg !1348
  store ptr %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1349, metadata !DIExpression()), !dbg !1350
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1351, metadata !DIExpression()), !dbg !1352
  store i32 0, ptr %5, align 4, !dbg !1352
  br label %7, !dbg !1353

7:                                                ; preds = %38, %2
  %8 = load ptr, ptr %3, align 4, !dbg !1354
  %9 = load i8, ptr %8, align 1, !dbg !1355
  %10 = sext i8 %9 to i32, !dbg !1355
  %11 = icmp ne i32 %10, 0, !dbg !1356
  br i1 %11, label %12, label %43, !dbg !1353

12:                                               ; preds = %7
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1357, metadata !DIExpression()), !dbg !1359
  %13 = load ptr, ptr %4, align 4, !dbg !1360
  store ptr %13, ptr %6, align 4, !dbg !1359
  br label %14, !dbg !1361

14:                                               ; preds = %29, %12
  %15 = load ptr, ptr %6, align 4, !dbg !1362
  %16 = load i8, ptr %15, align 1, !dbg !1363
  %17 = sext i8 %16 to i32, !dbg !1363
  %18 = icmp ne i32 %17, 0, !dbg !1364
  br i1 %18, label %19, label %27, !dbg !1365

19:                                               ; preds = %14
  %20 = load ptr, ptr %6, align 4, !dbg !1366
  %21 = load i8, ptr %20, align 1, !dbg !1367
  %22 = sext i8 %21 to i32, !dbg !1367
  %23 = load ptr, ptr %3, align 4, !dbg !1368
  %24 = load i8, ptr %23, align 1, !dbg !1369
  %25 = sext i8 %24 to i32, !dbg !1369
  %26 = icmp ne i32 %22, %25, !dbg !1370
  br label %27

27:                                               ; preds = %19, %14
  %28 = phi i1 [ false, %14 ], [ %26, %19 ], !dbg !1371
  br i1 %28, label %29, label %32, !dbg !1361

29:                                               ; preds = %27
  %30 = load ptr, ptr %6, align 4, !dbg !1372
  %31 = getelementptr inbounds i8, ptr %30, i32 1, !dbg !1372
  store ptr %31, ptr %6, align 4, !dbg !1372
  br label %14, !dbg !1361, !llvm.loop !1374

32:                                               ; preds = %27
  %33 = load ptr, ptr %6, align 4, !dbg !1376
  %34 = load i8, ptr %33, align 1, !dbg !1378
  %35 = sext i8 %34 to i32, !dbg !1378
  %36 = icmp ne i32 %35, 0, !dbg !1379
  br i1 %36, label %37, label %38, !dbg !1380

37:                                               ; preds = %32
  br label %43, !dbg !1381

38:                                               ; preds = %32
  %39 = load i32, ptr %5, align 4, !dbg !1383
  %40 = add i32 %39, 1, !dbg !1383
  store i32 %40, ptr %5, align 4, !dbg !1383
  %41 = load ptr, ptr %3, align 4, !dbg !1384
  %42 = getelementptr inbounds i8, ptr %41, i32 1, !dbg !1384
  store ptr %42, ptr %3, align 4, !dbg !1384
  br label %7, !dbg !1353, !llvm.loop !1385

43:                                               ; preds = %37, %7
  %44 = load i32, ptr %5, align 4, !dbg !1387
  ret i32 %44, !dbg !1388
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strcoll(ptr noundef %0, ptr noundef %1) #0 !dbg !1389 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  store ptr %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1393, metadata !DIExpression()), !dbg !1394
  store ptr %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1395, metadata !DIExpression()), !dbg !1396
  br label %5, !dbg !1397

5:                                                ; preds = %20, %2
  %6 = load ptr, ptr %3, align 4, !dbg !1398
  %7 = load i8, ptr %6, align 1, !dbg !1399
  %8 = sext i8 %7 to i32, !dbg !1399
  %9 = icmp ne i32 %8, 0, !dbg !1400
  br i1 %9, label %10, label %18, !dbg !1401

10:                                               ; preds = %5
  %11 = load ptr, ptr %3, align 4, !dbg !1402
  %12 = load i8, ptr %11, align 1, !dbg !1403
  %13 = sext i8 %12 to i32, !dbg !1403
  %14 = load ptr, ptr %4, align 4, !dbg !1404
  %15 = load i8, ptr %14, align 1, !dbg !1405
  %16 = sext i8 %15 to i32, !dbg !1405
  %17 = icmp eq i32 %13, %16, !dbg !1406
  br label %18

18:                                               ; preds = %10, %5
  %19 = phi i1 [ false, %5 ], [ %17, %10 ], !dbg !1407
  br i1 %19, label %20, label %25, !dbg !1397

20:                                               ; preds = %18
  %21 = load ptr, ptr %3, align 4, !dbg !1408
  %22 = getelementptr inbounds i8, ptr %21, i32 1, !dbg !1408
  store ptr %22, ptr %3, align 4, !dbg !1408
  %23 = load ptr, ptr %4, align 4, !dbg !1410
  %24 = getelementptr inbounds i8, ptr %23, i32 1, !dbg !1410
  store ptr %24, ptr %4, align 4, !dbg !1410
  br label %5, !dbg !1397, !llvm.loop !1411

25:                                               ; preds = %18
  %26 = load ptr, ptr %3, align 4, !dbg !1413
  %27 = load i8, ptr %26, align 1, !dbg !1414
  %28 = zext i8 %27 to i32, !dbg !1415
  %29 = load ptr, ptr %4, align 4, !dbg !1416
  %30 = load i8, ptr %29, align 1, !dbg !1417
  %31 = zext i8 %30 to i32, !dbg !1418
  %32 = sub nsw i32 %28, %31, !dbg !1419
  ret i32 %32, !dbg !1420
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strcmp(ptr noundef %0, ptr noundef %1) #0 !dbg !1421 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  store ptr %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1423, metadata !DIExpression()), !dbg !1424
  store ptr %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1425, metadata !DIExpression()), !dbg !1426
  br label %5, !dbg !1427

5:                                                ; preds = %20, %2
  %6 = load ptr, ptr %3, align 4, !dbg !1428
  %7 = load i8, ptr %6, align 1, !dbg !1429
  %8 = sext i8 %7 to i32, !dbg !1429
  %9 = icmp ne i32 %8, 0, !dbg !1430
  br i1 %9, label %10, label %18, !dbg !1431

10:                                               ; preds = %5
  %11 = load ptr, ptr %3, align 4, !dbg !1432
  %12 = load i8, ptr %11, align 1, !dbg !1433
  %13 = sext i8 %12 to i32, !dbg !1433
  %14 = load ptr, ptr %4, align 4, !dbg !1434
  %15 = load i8, ptr %14, align 1, !dbg !1435
  %16 = sext i8 %15 to i32, !dbg !1435
  %17 = icmp eq i32 %13, %16, !dbg !1436
  br label %18

18:                                               ; preds = %10, %5
  %19 = phi i1 [ false, %5 ], [ %17, %10 ], !dbg !1437
  br i1 %19, label %20, label %25, !dbg !1427

20:                                               ; preds = %18
  %21 = load ptr, ptr %3, align 4, !dbg !1438
  %22 = getelementptr inbounds i8, ptr %21, i32 1, !dbg !1438
  store ptr %22, ptr %3, align 4, !dbg !1438
  %23 = load ptr, ptr %4, align 4, !dbg !1440
  %24 = getelementptr inbounds i8, ptr %23, i32 1, !dbg !1440
  store ptr %24, ptr %4, align 4, !dbg !1440
  br label %5, !dbg !1427, !llvm.loop !1441

25:                                               ; preds = %18
  %26 = load ptr, ptr %3, align 4, !dbg !1443
  %27 = load i8, ptr %26, align 1, !dbg !1444
  %28 = zext i8 %27 to i32, !dbg !1445
  %29 = load ptr, ptr %4, align 4, !dbg !1446
  %30 = load i8, ptr %29, align 1, !dbg !1447
  %31 = zext i8 %30 to i32, !dbg !1448
  %32 = sub nsw i32 %28, %31, !dbg !1449
  ret i32 %32, !dbg !1450
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strncmp(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !1451 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 4
  %6 = alloca ptr, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8, align 1
  %10 = alloca i8, align 1
  store ptr %0, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1457, metadata !DIExpression()), !dbg !1458
  store ptr %1, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1459, metadata !DIExpression()), !dbg !1460
  store i32 %2, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1461, metadata !DIExpression()), !dbg !1462
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1463, metadata !DIExpression()), !dbg !1464
  store i32 0, ptr %8, align 4, !dbg !1464
  br label %11, !dbg !1465

11:                                               ; preds = %43, %3
  %12 = load i32, ptr %8, align 4, !dbg !1466
  %13 = load i32, ptr %7, align 4, !dbg !1467
  %14 = icmp ult i32 %12, %13, !dbg !1468
  br i1 %14, label %15, label %46, !dbg !1465

15:                                               ; preds = %11
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1469, metadata !DIExpression()), !dbg !1471
  %16 = load ptr, ptr %5, align 4, !dbg !1472
  %17 = load i32, ptr %8, align 4, !dbg !1473
  %18 = getelementptr inbounds i8, ptr %16, i32 %17, !dbg !1472
  %19 = load i8, ptr %18, align 1, !dbg !1472
  store i8 %19, ptr %9, align 1, !dbg !1471
  call void @llvm.dbg.declare(metadata ptr %10, metadata !1474, metadata !DIExpression()), !dbg !1475
  %20 = load ptr, ptr %6, align 4, !dbg !1476
  %21 = load i32, ptr %8, align 4, !dbg !1477
  %22 = getelementptr inbounds i8, ptr %20, i32 %21, !dbg !1476
  %23 = load i8, ptr %22, align 1, !dbg !1476
  store i8 %23, ptr %10, align 1, !dbg !1475
  %24 = load i8, ptr %9, align 1, !dbg !1478
  %25 = zext i8 %24 to i32, !dbg !1478
  %26 = load i8, ptr %10, align 1, !dbg !1480
  %27 = zext i8 %26 to i32, !dbg !1480
  %28 = icmp ne i32 %25, %27, !dbg !1481
  br i1 %28, label %37, label %29, !dbg !1482

29:                                               ; preds = %15
  %30 = load i8, ptr %9, align 1, !dbg !1483
  %31 = zext i8 %30 to i32, !dbg !1483
  %32 = icmp eq i32 %31, 0, !dbg !1484
  br i1 %32, label %37, label %33, !dbg !1485

33:                                               ; preds = %29
  %34 = load i8, ptr %10, align 1, !dbg !1486
  %35 = zext i8 %34 to i32, !dbg !1486
  %36 = icmp eq i32 %35, 0, !dbg !1487
  br i1 %36, label %37, label %43, !dbg !1488

37:                                               ; preds = %33, %29, %15
  %38 = load i8, ptr %9, align 1, !dbg !1489
  %39 = zext i8 %38 to i32, !dbg !1489
  %40 = load i8, ptr %10, align 1, !dbg !1491
  %41 = zext i8 %40 to i32, !dbg !1491
  %42 = sub nsw i32 %39, %41, !dbg !1492
  store i32 %42, ptr %4, align 4, !dbg !1493
  br label %47, !dbg !1493

43:                                               ; preds = %33
  %44 = load i32, ptr %8, align 4, !dbg !1494
  %45 = add i32 %44, 1, !dbg !1494
  store i32 %45, ptr %8, align 4, !dbg !1494
  br label %11, !dbg !1465, !llvm.loop !1495

46:                                               ; preds = %11
  store i32 0, ptr %4, align 4, !dbg !1497
  br label %47, !dbg !1497

47:                                               ; preds = %46, %37
  %48 = load i32, ptr %4, align 4, !dbg !1498
  ret i32 %48, !dbg !1498
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strrchr(ptr noundef %0, i32 noundef %1) #0 !dbg !1499 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 4
  store ptr %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1503, metadata !DIExpression()), !dbg !1504
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1505, metadata !DIExpression()), !dbg !1506
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1507, metadata !DIExpression()), !dbg !1508
  store ptr null, ptr %6, align 4, !dbg !1508
  br label %7, !dbg !1509

7:                                                ; preds = %22, %2
  %8 = load ptr, ptr %4, align 4, !dbg !1510
  %9 = load i8, ptr %8, align 1, !dbg !1511
  %10 = sext i8 %9 to i32, !dbg !1511
  %11 = icmp ne i32 %10, 0, !dbg !1512
  br i1 %11, label %12, label %25, !dbg !1509

12:                                               ; preds = %7
  %13 = load ptr, ptr %4, align 4, !dbg !1513
  %14 = load i8, ptr %13, align 1, !dbg !1516
  %15 = sext i8 %14 to i32, !dbg !1516
  %16 = load i32, ptr %5, align 4, !dbg !1517
  %17 = trunc i32 %16 to i8, !dbg !1518
  %18 = sext i8 %17 to i32, !dbg !1518
  %19 = icmp eq i32 %15, %18, !dbg !1519
  br i1 %19, label %20, label %22, !dbg !1520

20:                                               ; preds = %12
  %21 = load ptr, ptr %4, align 4, !dbg !1521
  store ptr %21, ptr %6, align 4, !dbg !1523
  br label %22, !dbg !1524

22:                                               ; preds = %20, %12
  %23 = load ptr, ptr %4, align 4, !dbg !1525
  %24 = getelementptr inbounds i8, ptr %23, i32 1, !dbg !1525
  store ptr %24, ptr %4, align 4, !dbg !1525
  br label %7, !dbg !1509, !llvm.loop !1526

25:                                               ; preds = %7
  %26 = load i32, ptr %5, align 4, !dbg !1528
  %27 = trunc i32 %26 to i8, !dbg !1530
  %28 = sext i8 %27 to i32, !dbg !1530
  %29 = icmp eq i32 %28, 0, !dbg !1531
  br i1 %29, label %30, label %32, !dbg !1532

30:                                               ; preds = %25
  %31 = load ptr, ptr %4, align 4, !dbg !1533
  store ptr %31, ptr %3, align 4, !dbg !1535
  br label %34, !dbg !1535

32:                                               ; preds = %25
  %33 = load ptr, ptr %6, align 4, !dbg !1536
  store ptr %33, ptr %3, align 4, !dbg !1537
  br label %34, !dbg !1537

34:                                               ; preds = %32, %30
  %35 = load ptr, ptr %3, align 4, !dbg !1538
  ret ptr %35, !dbg !1538
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strcat(ptr noundef %0, ptr noundef %1) #0 !dbg !1539 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  store ptr %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1541, metadata !DIExpression()), !dbg !1542
  store ptr %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1543, metadata !DIExpression()), !dbg !1544
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1545, metadata !DIExpression()), !dbg !1546
  %6 = load ptr, ptr %3, align 4, !dbg !1547
  store ptr %6, ptr %5, align 4, !dbg !1546
  br label %7, !dbg !1548

7:                                                ; preds = %12, %2
  %8 = load ptr, ptr %5, align 4, !dbg !1549
  %9 = load i8, ptr %8, align 1, !dbg !1550
  %10 = sext i8 %9 to i32, !dbg !1550
  %11 = icmp ne i32 %10, 0, !dbg !1551
  br i1 %11, label %12, label %15, !dbg !1548

12:                                               ; preds = %7
  %13 = load ptr, ptr %5, align 4, !dbg !1552
  %14 = getelementptr inbounds i8, ptr %13, i32 1, !dbg !1552
  store ptr %14, ptr %5, align 4, !dbg !1552
  br label %7, !dbg !1548, !llvm.loop !1554

15:                                               ; preds = %7
  br label %16, !dbg !1556

16:                                               ; preds = %21, %15
  %17 = load ptr, ptr %4, align 4, !dbg !1557
  %18 = load i8, ptr %17, align 1, !dbg !1558
  %19 = sext i8 %18 to i32, !dbg !1558
  %20 = icmp ne i32 %19, 0, !dbg !1559
  br i1 %20, label %21, label %29, !dbg !1556

21:                                               ; preds = %16
  %22 = load ptr, ptr %4, align 4, !dbg !1560
  %23 = load i8, ptr %22, align 1, !dbg !1562
  %24 = load ptr, ptr %5, align 4, !dbg !1563
  store i8 %23, ptr %24, align 1, !dbg !1564
  %25 = load ptr, ptr %5, align 4, !dbg !1565
  %26 = getelementptr inbounds i8, ptr %25, i32 1, !dbg !1565
  store ptr %26, ptr %5, align 4, !dbg !1565
  %27 = load ptr, ptr %4, align 4, !dbg !1566
  %28 = getelementptr inbounds i8, ptr %27, i32 1, !dbg !1566
  store ptr %28, ptr %4, align 4, !dbg !1566
  br label %16, !dbg !1556, !llvm.loop !1567

29:                                               ; preds = %16
  %30 = load ptr, ptr %5, align 4, !dbg !1569
  store i8 0, ptr %30, align 1, !dbg !1570
  %31 = load ptr, ptr %3, align 4, !dbg !1571
  ret ptr %31, !dbg !1572
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strspn(ptr noundef %0, ptr noundef %1) #0 !dbg !1573 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 4
  store ptr %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1579, metadata !DIExpression()), !dbg !1580
  store ptr %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1581, metadata !DIExpression()), !dbg !1582
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1583, metadata !DIExpression()), !dbg !1584
  store i32 0, ptr %5, align 4, !dbg !1584
  br label %7, !dbg !1585

7:                                                ; preds = %38, %2
  %8 = load ptr, ptr %3, align 4, !dbg !1586
  %9 = load i8, ptr %8, align 1, !dbg !1587
  %10 = sext i8 %9 to i32, !dbg !1587
  %11 = icmp ne i32 %10, 0, !dbg !1588
  br i1 %11, label %12, label %43, !dbg !1585

12:                                               ; preds = %7
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1589, metadata !DIExpression()), !dbg !1591
  %13 = load ptr, ptr %4, align 4, !dbg !1592
  store ptr %13, ptr %6, align 4, !dbg !1591
  br label %14, !dbg !1593

14:                                               ; preds = %29, %12
  %15 = load ptr, ptr %6, align 4, !dbg !1594
  %16 = load i8, ptr %15, align 1, !dbg !1595
  %17 = sext i8 %16 to i32, !dbg !1595
  %18 = icmp ne i32 %17, 0, !dbg !1596
  br i1 %18, label %19, label %27, !dbg !1597

19:                                               ; preds = %14
  %20 = load ptr, ptr %6, align 4, !dbg !1598
  %21 = load i8, ptr %20, align 1, !dbg !1599
  %22 = sext i8 %21 to i32, !dbg !1599
  %23 = load ptr, ptr %3, align 4, !dbg !1600
  %24 = load i8, ptr %23, align 1, !dbg !1601
  %25 = sext i8 %24 to i32, !dbg !1601
  %26 = icmp ne i32 %22, %25, !dbg !1602
  br label %27

27:                                               ; preds = %19, %14
  %28 = phi i1 [ false, %14 ], [ %26, %19 ], !dbg !1603
  br i1 %28, label %29, label %32, !dbg !1593

29:                                               ; preds = %27
  %30 = load ptr, ptr %6, align 4, !dbg !1604
  %31 = getelementptr inbounds i8, ptr %30, i32 1, !dbg !1604
  store ptr %31, ptr %6, align 4, !dbg !1604
  br label %14, !dbg !1593, !llvm.loop !1606

32:                                               ; preds = %27
  %33 = load ptr, ptr %6, align 4, !dbg !1608
  %34 = load i8, ptr %33, align 1, !dbg !1610
  %35 = sext i8 %34 to i32, !dbg !1610
  %36 = icmp eq i32 %35, 0, !dbg !1611
  br i1 %36, label %37, label %38, !dbg !1612

37:                                               ; preds = %32
  br label %43, !dbg !1613

38:                                               ; preds = %32
  %39 = load i32, ptr %5, align 4, !dbg !1615
  %40 = add i32 %39, 1, !dbg !1615
  store i32 %40, ptr %5, align 4, !dbg !1615
  %41 = load ptr, ptr %3, align 4, !dbg !1616
  %42 = getelementptr inbounds i8, ptr %41, i32 1, !dbg !1616
  store ptr %42, ptr %3, align 4, !dbg !1616
  br label %7, !dbg !1585, !llvm.loop !1617

43:                                               ; preds = %37, %7
  %44 = load i32, ptr %5, align 4, !dbg !1619
  ret i32 %44, !dbg !1620
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strncpy(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !1621 {
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1627, metadata !DIExpression()), !dbg !1628
  store ptr %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1629, metadata !DIExpression()), !dbg !1630
  store i32 %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1631, metadata !DIExpression()), !dbg !1632
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1633, metadata !DIExpression()), !dbg !1634
  store i32 0, ptr %7, align 4, !dbg !1634
  br label %8, !dbg !1635

8:                                                ; preds = %21, %3
  %9 = load i32, ptr %7, align 4, !dbg !1636
  %10 = load i32, ptr %6, align 4, !dbg !1637
  %11 = icmp ult i32 %9, %10, !dbg !1638
  br i1 %11, label %12, label %19, !dbg !1639

12:                                               ; preds = %8
  %13 = load ptr, ptr %5, align 4, !dbg !1640
  %14 = load i32, ptr %7, align 4, !dbg !1641
  %15 = getelementptr inbounds i8, ptr %13, i32 %14, !dbg !1640
  %16 = load i8, ptr %15, align 1, !dbg !1640
  %17 = sext i8 %16 to i32, !dbg !1640
  %18 = icmp ne i32 %17, 0, !dbg !1642
  br label %19

19:                                               ; preds = %12, %8
  %20 = phi i1 [ false, %8 ], [ %18, %12 ], !dbg !1643
  br i1 %20, label %21, label %31, !dbg !1635

21:                                               ; preds = %19
  %22 = load ptr, ptr %5, align 4, !dbg !1644
  %23 = load i32, ptr %7, align 4, !dbg !1646
  %24 = getelementptr inbounds i8, ptr %22, i32 %23, !dbg !1644
  %25 = load i8, ptr %24, align 1, !dbg !1644
  %26 = load ptr, ptr %4, align 4, !dbg !1647
  %27 = load i32, ptr %7, align 4, !dbg !1648
  %28 = getelementptr inbounds i8, ptr %26, i32 %27, !dbg !1647
  store i8 %25, ptr %28, align 1, !dbg !1649
  %29 = load i32, ptr %7, align 4, !dbg !1650
  %30 = add i32 %29, 1, !dbg !1650
  store i32 %30, ptr %7, align 4, !dbg !1650
  br label %8, !dbg !1635, !llvm.loop !1651

31:                                               ; preds = %19
  br label %32, !dbg !1653

32:                                               ; preds = %36, %31
  %33 = load i32, ptr %7, align 4, !dbg !1654
  %34 = load i32, ptr %6, align 4, !dbg !1655
  %35 = icmp ult i32 %33, %34, !dbg !1656
  br i1 %35, label %36, label %42, !dbg !1653

36:                                               ; preds = %32
  %37 = load ptr, ptr %4, align 4, !dbg !1657
  %38 = load i32, ptr %7, align 4, !dbg !1659
  %39 = getelementptr inbounds i8, ptr %37, i32 %38, !dbg !1657
  store i8 0, ptr %39, align 1, !dbg !1660
  %40 = load i32, ptr %7, align 4, !dbg !1661
  %41 = add i32 %40, 1, !dbg !1661
  store i32 %41, ptr %7, align 4, !dbg !1661
  br label %32, !dbg !1653, !llvm.loop !1662

42:                                               ; preds = %32
  %43 = load ptr, ptr %4, align 4, !dbg !1664
  ret ptr %43, !dbg !1665
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strchr(ptr noundef %0, i32 noundef %1) #0 !dbg !1666 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1668, metadata !DIExpression()), !dbg !1669
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1670, metadata !DIExpression()), !dbg !1671
  br label %6, !dbg !1672

6:                                                ; preds = %21, %2
  %7 = load ptr, ptr %4, align 4, !dbg !1673
  %8 = load i8, ptr %7, align 1, !dbg !1674
  %9 = sext i8 %8 to i32, !dbg !1674
  %10 = icmp ne i32 %9, 0, !dbg !1675
  br i1 %10, label %11, label %24, !dbg !1672

11:                                               ; preds = %6
  %12 = load ptr, ptr %4, align 4, !dbg !1676
  %13 = load i8, ptr %12, align 1, !dbg !1679
  %14 = sext i8 %13 to i32, !dbg !1679
  %15 = load i32, ptr %5, align 4, !dbg !1680
  %16 = trunc i32 %15 to i8, !dbg !1681
  %17 = sext i8 %16 to i32, !dbg !1681
  %18 = icmp eq i32 %14, %17, !dbg !1682
  br i1 %18, label %19, label %21, !dbg !1683

19:                                               ; preds = %11
  %20 = load ptr, ptr %4, align 4, !dbg !1684
  store ptr %20, ptr %3, align 4, !dbg !1686
  br label %32, !dbg !1686

21:                                               ; preds = %11
  %22 = load ptr, ptr %4, align 4, !dbg !1687
  %23 = getelementptr inbounds i8, ptr %22, i32 1, !dbg !1687
  store ptr %23, ptr %4, align 4, !dbg !1687
  br label %6, !dbg !1672, !llvm.loop !1688

24:                                               ; preds = %6
  %25 = load i32, ptr %5, align 4, !dbg !1690
  %26 = trunc i32 %25 to i8, !dbg !1692
  %27 = sext i8 %26 to i32, !dbg !1692
  %28 = icmp eq i32 %27, 0, !dbg !1693
  br i1 %28, label %29, label %31, !dbg !1694

29:                                               ; preds = %24
  %30 = load ptr, ptr %4, align 4, !dbg !1695
  store ptr %30, ptr %3, align 4, !dbg !1697
  br label %32, !dbg !1697

31:                                               ; preds = %24
  store ptr null, ptr %3, align 4, !dbg !1698
  br label %32, !dbg !1698

32:                                               ; preds = %31, %29, %19
  %33 = load ptr, ptr %3, align 4, !dbg !1699
  ret ptr %33, !dbg !1699
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strerror(i32 noundef %0) #0 !dbg !29 {
  %2 = alloca ptr, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1700, metadata !DIExpression()), !dbg !1701
  %4 = load i32, ptr %3, align 4, !dbg !1702
  switch i32 %4, label %11 [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %7
    i32 3, label %8
    i32 4, label %9
    i32 5, label %10
  ], !dbg !1703

5:                                                ; preds = %1
  store ptr @.str, ptr %2, align 4, !dbg !1704
  br label %12, !dbg !1704

6:                                                ; preds = %1
  store ptr @.str.1, ptr %2, align 4, !dbg !1706
  br label %12, !dbg !1706

7:                                                ; preds = %1
  store ptr @.str.2, ptr %2, align 4, !dbg !1707
  br label %12, !dbg !1707

8:                                                ; preds = %1
  store ptr @.str.3, ptr %2, align 4, !dbg !1708
  br label %12, !dbg !1708

9:                                                ; preds = %1
  store ptr @.str.4, ptr %2, align 4, !dbg !1709
  br label %12, !dbg !1709

10:                                               ; preds = %1
  store ptr @.str.5, ptr %2, align 4, !dbg !1710
  br label %12, !dbg !1710

11:                                               ; preds = %1
  store ptr @__fizzer_model__strerror.unknown, ptr %2, align 4, !dbg !1711
  br label %12, !dbg !1711

12:                                               ; preds = %11, %10, %9, %8, %7, %6, %5
  %13 = load ptr, ptr %2, align 4, !dbg !1712
  ret ptr %13, !dbg !1712
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__memchr(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !1713 {
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1721, metadata !DIExpression()), !dbg !1722
  store i32 %1, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1723, metadata !DIExpression()), !dbg !1724
  store i32 %2, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1725, metadata !DIExpression()), !dbg !1726
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1727, metadata !DIExpression()), !dbg !1728
  %10 = load ptr, ptr %5, align 4, !dbg !1729
  store ptr %10, ptr %8, align 4, !dbg !1728
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1730, metadata !DIExpression()), !dbg !1731
  store i32 0, ptr %9, align 4, !dbg !1731
  br label %11, !dbg !1732

11:                                               ; preds = %29, %3
  %12 = load i32, ptr %9, align 4, !dbg !1733
  %13 = load i32, ptr %7, align 4, !dbg !1734
  %14 = icmp ult i32 %12, %13, !dbg !1735
  br i1 %14, label %15, label %32, !dbg !1732

15:                                               ; preds = %11
  %16 = load ptr, ptr %8, align 4, !dbg !1736
  %17 = load i32, ptr %9, align 4, !dbg !1739
  %18 = getelementptr inbounds i8, ptr %16, i32 %17, !dbg !1736
  %19 = load i8, ptr %18, align 1, !dbg !1736
  %20 = zext i8 %19 to i32, !dbg !1736
  %21 = load i32, ptr %6, align 4, !dbg !1740
  %22 = trunc i32 %21 to i8, !dbg !1741
  %23 = zext i8 %22 to i32, !dbg !1741
  %24 = icmp eq i32 %20, %23, !dbg !1742
  br i1 %24, label %25, label %29, !dbg !1743

25:                                               ; preds = %15
  %26 = load ptr, ptr %8, align 4, !dbg !1744
  %27 = load i32, ptr %9, align 4, !dbg !1746
  %28 = getelementptr inbounds i8, ptr %26, i32 %27, !dbg !1747
  store ptr %28, ptr %4, align 4, !dbg !1748
  br label %33, !dbg !1748

29:                                               ; preds = %15
  %30 = load i32, ptr %9, align 4, !dbg !1749
  %31 = add i32 %30, 1, !dbg !1749
  store i32 %31, ptr %9, align 4, !dbg !1749
  br label %11, !dbg !1732, !llvm.loop !1750

32:                                               ; preds = %11
  store ptr null, ptr %4, align 4, !dbg !1752
  br label %33, !dbg !1752

33:                                               ; preds = %32, %25
  %34 = load ptr, ptr %4, align 4, !dbg !1753
  ret ptr %34, !dbg !1753
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strlen(ptr noundef %0) #0 !dbg !1754 {
  %2 = alloca ptr, align 4
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1760, metadata !DIExpression()), !dbg !1761
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1762, metadata !DIExpression()), !dbg !1763
  store i32 0, ptr %3, align 4, !dbg !1763
  br label %4, !dbg !1764

4:                                                ; preds = %11, %1
  %5 = load ptr, ptr %2, align 4, !dbg !1765
  %6 = load i32, ptr %3, align 4, !dbg !1766
  %7 = getelementptr inbounds i8, ptr %5, i32 %6, !dbg !1765
  %8 = load i8, ptr %7, align 1, !dbg !1765
  %9 = sext i8 %8 to i32, !dbg !1765
  %10 = icmp ne i32 %9, 0, !dbg !1767
  br i1 %10, label %11, label %14, !dbg !1764

11:                                               ; preds = %4
  %12 = load i32, ptr %3, align 4, !dbg !1768
  %13 = add i32 %12, 1, !dbg !1768
  store i32 %13, ptr %3, align 4, !dbg !1768
  br label %4, !dbg !1764, !llvm.loop !1770

14:                                               ; preds = %4
  %15 = load i32, ptr %3, align 4, !dbg !1772
  ret i32 %15, !dbg !1773
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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1774, metadata !DIExpression()), !dbg !1775
  store ptr %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1776, metadata !DIExpression()), !dbg !1777
  %9 = load ptr, ptr %4, align 4, !dbg !1778
  %10 = icmp eq ptr %9, null, !dbg !1780
  br i1 %10, label %11, label %13, !dbg !1781

11:                                               ; preds = %2
  %12 = load ptr, ptr @__fizzer_model__strtok.next, align 4, !dbg !1782
  store ptr %12, ptr %4, align 4, !dbg !1784
  br label %13, !dbg !1785

13:                                               ; preds = %11, %2
  %14 = load ptr, ptr %4, align 4, !dbg !1786
  %15 = icmp eq ptr %14, null, !dbg !1788
  br i1 %15, label %16, label %17, !dbg !1789

16:                                               ; preds = %13
  store ptr null, ptr %3, align 4, !dbg !1790
  br label %107, !dbg !1790

17:                                               ; preds = %13
  br label %18, !dbg !1792

18:                                               ; preds = %49, %17
  %19 = load ptr, ptr %4, align 4, !dbg !1793
  %20 = load i8, ptr %19, align 1, !dbg !1794
  %21 = sext i8 %20 to i32, !dbg !1794
  %22 = icmp ne i32 %21, 0, !dbg !1795
  br i1 %22, label %23, label %52, !dbg !1792

23:                                               ; preds = %18
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1796, metadata !DIExpression()), !dbg !1798
  %24 = load ptr, ptr %5, align 4, !dbg !1799
  store ptr %24, ptr %6, align 4, !dbg !1798
  br label %25, !dbg !1800

25:                                               ; preds = %40, %23
  %26 = load ptr, ptr %6, align 4, !dbg !1801
  %27 = load i8, ptr %26, align 1, !dbg !1802
  %28 = sext i8 %27 to i32, !dbg !1802
  %29 = icmp ne i32 %28, 0, !dbg !1803
  br i1 %29, label %30, label %38, !dbg !1804

30:                                               ; preds = %25
  %31 = load ptr, ptr %6, align 4, !dbg !1805
  %32 = load i8, ptr %31, align 1, !dbg !1806
  %33 = sext i8 %32 to i32, !dbg !1806
  %34 = load ptr, ptr %4, align 4, !dbg !1807
  %35 = load i8, ptr %34, align 1, !dbg !1808
  %36 = sext i8 %35 to i32, !dbg !1808
  %37 = icmp ne i32 %33, %36, !dbg !1809
  br label %38

38:                                               ; preds = %30, %25
  %39 = phi i1 [ false, %25 ], [ %37, %30 ], !dbg !1810
  br i1 %39, label %40, label %43, !dbg !1800

40:                                               ; preds = %38
  %41 = load ptr, ptr %6, align 4, !dbg !1811
  %42 = getelementptr inbounds i8, ptr %41, i32 1, !dbg !1811
  store ptr %42, ptr %6, align 4, !dbg !1811
  br label %25, !dbg !1800, !llvm.loop !1813

43:                                               ; preds = %38
  %44 = load ptr, ptr %6, align 4, !dbg !1815
  %45 = load i8, ptr %44, align 1, !dbg !1817
  %46 = sext i8 %45 to i32, !dbg !1817
  %47 = icmp eq i32 %46, 0, !dbg !1818
  br i1 %47, label %48, label %49, !dbg !1819

48:                                               ; preds = %43
  br label %52, !dbg !1820

49:                                               ; preds = %43
  %50 = load ptr, ptr %4, align 4, !dbg !1822
  %51 = getelementptr inbounds i8, ptr %50, i32 1, !dbg !1822
  store ptr %51, ptr %4, align 4, !dbg !1822
  br label %18, !dbg !1792, !llvm.loop !1823

52:                                               ; preds = %48, %18
  %53 = load ptr, ptr %4, align 4, !dbg !1825
  %54 = load i8, ptr %53, align 1, !dbg !1827
  %55 = sext i8 %54 to i32, !dbg !1827
  %56 = icmp eq i32 %55, 0, !dbg !1828
  br i1 %56, label %57, label %58, !dbg !1829

57:                                               ; preds = %52
  store ptr null, ptr @__fizzer_model__strtok.next, align 4, !dbg !1830
  store ptr null, ptr %3, align 4, !dbg !1832
  br label %107, !dbg !1832

58:                                               ; preds = %52
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1833, metadata !DIExpression()), !dbg !1834
  %59 = load ptr, ptr %4, align 4, !dbg !1835
  store ptr %59, ptr %7, align 4, !dbg !1834
  br label %60, !dbg !1836

60:                                               ; preds = %91, %58
  %61 = load ptr, ptr %4, align 4, !dbg !1837
  %62 = load i8, ptr %61, align 1, !dbg !1838
  %63 = sext i8 %62 to i32, !dbg !1838
  %64 = icmp ne i32 %63, 0, !dbg !1839
  br i1 %64, label %65, label %94, !dbg !1836

65:                                               ; preds = %60
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1840, metadata !DIExpression()), !dbg !1842
  %66 = load ptr, ptr %5, align 4, !dbg !1843
  store ptr %66, ptr %8, align 4, !dbg !1842
  br label %67, !dbg !1844

67:                                               ; preds = %82, %65
  %68 = load ptr, ptr %8, align 4, !dbg !1845
  %69 = load i8, ptr %68, align 1, !dbg !1846
  %70 = sext i8 %69 to i32, !dbg !1846
  %71 = icmp ne i32 %70, 0, !dbg !1847
  br i1 %71, label %72, label %80, !dbg !1848

72:                                               ; preds = %67
  %73 = load ptr, ptr %8, align 4, !dbg !1849
  %74 = load i8, ptr %73, align 1, !dbg !1850
  %75 = sext i8 %74 to i32, !dbg !1850
  %76 = load ptr, ptr %4, align 4, !dbg !1851
  %77 = load i8, ptr %76, align 1, !dbg !1852
  %78 = sext i8 %77 to i32, !dbg !1852
  %79 = icmp ne i32 %75, %78, !dbg !1853
  br label %80

80:                                               ; preds = %72, %67
  %81 = phi i1 [ false, %67 ], [ %79, %72 ], !dbg !1854
  br i1 %81, label %82, label %85, !dbg !1844

82:                                               ; preds = %80
  %83 = load ptr, ptr %8, align 4, !dbg !1855
  %84 = getelementptr inbounds i8, ptr %83, i32 1, !dbg !1855
  store ptr %84, ptr %8, align 4, !dbg !1855
  br label %67, !dbg !1844, !llvm.loop !1857

85:                                               ; preds = %80
  %86 = load ptr, ptr %8, align 4, !dbg !1859
  %87 = load i8, ptr %86, align 1, !dbg !1861
  %88 = sext i8 %87 to i32, !dbg !1861
  %89 = icmp ne i32 %88, 0, !dbg !1862
  br i1 %89, label %90, label %91, !dbg !1863

90:                                               ; preds = %85
  br label %94, !dbg !1864

91:                                               ; preds = %85
  %92 = load ptr, ptr %4, align 4, !dbg !1866
  %93 = getelementptr inbounds i8, ptr %92, i32 1, !dbg !1866
  store ptr %93, ptr %4, align 4, !dbg !1866
  br label %60, !dbg !1836, !llvm.loop !1867

94:                                               ; preds = %90, %60
  %95 = load ptr, ptr %4, align 4, !dbg !1869
  %96 = load i8, ptr %95, align 1, !dbg !1871
  %97 = sext i8 %96 to i32, !dbg !1871
  %98 = icmp ne i32 %97, 0, !dbg !1872
  br i1 %98, label %99, label %104, !dbg !1873

99:                                               ; preds = %94
  %100 = load ptr, ptr %4, align 4, !dbg !1874
  store i8 0, ptr %100, align 1, !dbg !1876
  %101 = load ptr, ptr %4, align 4, !dbg !1877
  %102 = getelementptr inbounds i8, ptr %101, i32 1, !dbg !1877
  store ptr %102, ptr %4, align 4, !dbg !1877
  %103 = load ptr, ptr %4, align 4, !dbg !1878
  store ptr %103, ptr @__fizzer_model__strtok.next, align 4, !dbg !1879
  br label %105, !dbg !1880

104:                                              ; preds = %94
  store ptr null, ptr @__fizzer_model__strtok.next, align 4, !dbg !1881
  br label %105

105:                                              ; preds = %104, %99
  %106 = load ptr, ptr %7, align 4, !dbg !1883
  store ptr %106, ptr %3, align 4, !dbg !1884
  br label %107, !dbg !1884

107:                                              ; preds = %105, %57, %16
  %108 = load ptr, ptr %3, align 4, !dbg !1885
  ret ptr %108, !dbg !1885
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strxfrm(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !1886 {
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1892, metadata !DIExpression()), !dbg !1893
  store ptr %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1894, metadata !DIExpression()), !dbg !1895
  store i32 %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1896, metadata !DIExpression()), !dbg !1897
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1898, metadata !DIExpression()), !dbg !1899
  store i32 0, ptr %7, align 4, !dbg !1899
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1900, metadata !DIExpression()), !dbg !1901
  %10 = load ptr, ptr %5, align 4, !dbg !1902
  store ptr %10, ptr %8, align 4, !dbg !1901
  br label %11, !dbg !1903

11:                                               ; preds = %16, %3
  %12 = load ptr, ptr %8, align 4, !dbg !1904
  %13 = load i8, ptr %12, align 1, !dbg !1905
  %14 = sext i8 %13 to i32, !dbg !1905
  %15 = icmp ne i32 %14, 0, !dbg !1906
  br i1 %15, label %16, label %21, !dbg !1903

16:                                               ; preds = %11
  %17 = load i32, ptr %7, align 4, !dbg !1907
  %18 = add i32 %17, 1, !dbg !1907
  store i32 %18, ptr %7, align 4, !dbg !1907
  %19 = load ptr, ptr %8, align 4, !dbg !1909
  %20 = getelementptr inbounds i8, ptr %19, i32 1, !dbg !1909
  store ptr %20, ptr %8, align 4, !dbg !1909
  br label %11, !dbg !1903, !llvm.loop !1910

21:                                               ; preds = %11
  %22 = load i32, ptr %6, align 4, !dbg !1912
  %23 = icmp ugt i32 %22, 0, !dbg !1914
  br i1 %23, label %24, label %53, !dbg !1915

24:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1916, metadata !DIExpression()), !dbg !1918
  store i32 0, ptr %9, align 4, !dbg !1918
  br label %25, !dbg !1919

25:                                               ; preds = %39, %24
  %26 = load i32, ptr %9, align 4, !dbg !1920
  %27 = load i32, ptr %6, align 4, !dbg !1921
  %28 = sub i32 %27, 1, !dbg !1922
  %29 = icmp ult i32 %26, %28, !dbg !1923
  br i1 %29, label %30, label %37, !dbg !1924

30:                                               ; preds = %25
  %31 = load ptr, ptr %5, align 4, !dbg !1925
  %32 = load i32, ptr %9, align 4, !dbg !1926
  %33 = getelementptr inbounds i8, ptr %31, i32 %32, !dbg !1925
  %34 = load i8, ptr %33, align 1, !dbg !1925
  %35 = sext i8 %34 to i32, !dbg !1925
  %36 = icmp ne i32 %35, 0, !dbg !1927
  br label %37

37:                                               ; preds = %30, %25
  %38 = phi i1 [ false, %25 ], [ %36, %30 ], !dbg !1928
  br i1 %38, label %39, label %49, !dbg !1919

39:                                               ; preds = %37
  %40 = load ptr, ptr %5, align 4, !dbg !1929
  %41 = load i32, ptr %9, align 4, !dbg !1931
  %42 = getelementptr inbounds i8, ptr %40, i32 %41, !dbg !1929
  %43 = load i8, ptr %42, align 1, !dbg !1929
  %44 = load ptr, ptr %4, align 4, !dbg !1932
  %45 = load i32, ptr %9, align 4, !dbg !1933
  %46 = getelementptr inbounds i8, ptr %44, i32 %45, !dbg !1932
  store i8 %43, ptr %46, align 1, !dbg !1934
  %47 = load i32, ptr %9, align 4, !dbg !1935
  %48 = add i32 %47, 1, !dbg !1935
  store i32 %48, ptr %9, align 4, !dbg !1935
  br label %25, !dbg !1919, !llvm.loop !1936

49:                                               ; preds = %37
  %50 = load ptr, ptr %4, align 4, !dbg !1938
  %51 = load i32, ptr %9, align 4, !dbg !1939
  %52 = getelementptr inbounds i8, ptr %50, i32 %51, !dbg !1938
  store i8 0, ptr %52, align 1, !dbg !1940
  br label %53, !dbg !1941

53:                                               ; preds = %49, %21
  %54 = load i32, ptr %7, align 4, !dbg !1942
  ret i32 %54, !dbg !1943
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__iscntrl(i32 noundef %0) #0 !dbg !1944 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1946, metadata !DIExpression()), !dbg !1947
  %4 = load i32, ptr %3, align 4, !dbg !1948
  %5 = icmp sge i32 %4, 0, !dbg !1950
  br i1 %5, label %6, label %9, !dbg !1951

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !1952
  %8 = icmp sle i32 %7, 31, !dbg !1953
  br i1 %8, label %12, label %9, !dbg !1954

9:                                                ; preds = %6, %1
  %10 = load i32, ptr %3, align 4, !dbg !1955
  %11 = icmp eq i32 %10, 127, !dbg !1956
  br i1 %11, label %12, label %13, !dbg !1957

12:                                               ; preds = %9, %6
  store i32 1, ptr %2, align 4, !dbg !1958
  br label %14, !dbg !1958

13:                                               ; preds = %9
  store i32 0, ptr %2, align 4, !dbg !1960
  br label %14, !dbg !1960

14:                                               ; preds = %13, %12
  %15 = load i32, ptr %2, align 4, !dbg !1961
  ret i32 %15, !dbg !1961
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isxdigit(i32 noundef %0) #0 !dbg !1962 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1964, metadata !DIExpression()), !dbg !1965
  %4 = load i32, ptr %3, align 4, !dbg !1966
  %5 = call i32 @__fizzer_model__isdigit(i32 noundef %4), !dbg !1968
  %6 = icmp ne i32 %5, 0, !dbg !1968
  br i1 %6, label %19, label %7, !dbg !1969

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4, !dbg !1970
  %9 = icmp sge i32 %8, 65, !dbg !1971
  br i1 %9, label %10, label %13, !dbg !1972

10:                                               ; preds = %7
  %11 = load i32, ptr %3, align 4, !dbg !1973
  %12 = icmp sle i32 %11, 70, !dbg !1974
  br i1 %12, label %19, label %13, !dbg !1975

13:                                               ; preds = %10, %7
  %14 = load i32, ptr %3, align 4, !dbg !1976
  %15 = icmp sge i32 %14, 97, !dbg !1977
  br i1 %15, label %16, label %20, !dbg !1978

16:                                               ; preds = %13
  %17 = load i32, ptr %3, align 4, !dbg !1979
  %18 = icmp sle i32 %17, 102, !dbg !1980
  br i1 %18, label %19, label %20, !dbg !1981

19:                                               ; preds = %16, %10, %1
  store i32 1, ptr %2, align 4, !dbg !1982
  br label %21, !dbg !1982

20:                                               ; preds = %16, %13
  store i32 0, ptr %2, align 4, !dbg !1984
  br label %21, !dbg !1984

21:                                               ; preds = %20, %19
  %22 = load i32, ptr %2, align 4, !dbg !1985
  ret i32 %22, !dbg !1985
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isalnum(i32 noundef %0) #0 !dbg !1986 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1988, metadata !DIExpression()), !dbg !1989
  %4 = load i32, ptr %3, align 4, !dbg !1990
  %5 = call i32 @__fizzer_model__isalpha(i32 noundef %4), !dbg !1992
  %6 = icmp ne i32 %5, 0, !dbg !1992
  br i1 %6, label %11, label %7, !dbg !1993

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4, !dbg !1994
  %9 = call i32 @__fizzer_model__isdigit(i32 noundef %8), !dbg !1995
  %10 = icmp ne i32 %9, 0, !dbg !1995
  br i1 %10, label %11, label %12, !dbg !1996

11:                                               ; preds = %7, %1
  store i32 1, ptr %2, align 4, !dbg !1997
  br label %13, !dbg !1997

12:                                               ; preds = %7
  store i32 0, ptr %2, align 4, !dbg !1999
  br label %13, !dbg !1999

13:                                               ; preds = %12, %11
  %14 = load i32, ptr %2, align 4, !dbg !2000
  ret i32 %14, !dbg !2000
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isspace(i32 noundef %0) #0 !dbg !2001 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2003, metadata !DIExpression()), !dbg !2004
  %4 = load i32, ptr %3, align 4, !dbg !2005
  %5 = icmp eq i32 %4, 32, !dbg !2007
  br i1 %5, label %21, label %6, !dbg !2008

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2009
  %8 = icmp eq i32 %7, 12, !dbg !2010
  br i1 %8, label %21, label %9, !dbg !2011

9:                                                ; preds = %6
  %10 = load i32, ptr %3, align 4, !dbg !2012
  %11 = icmp eq i32 %10, 10, !dbg !2013
  br i1 %11, label %21, label %12, !dbg !2014

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4, !dbg !2015
  %14 = icmp eq i32 %13, 13, !dbg !2016
  br i1 %14, label %21, label %15, !dbg !2017

15:                                               ; preds = %12
  %16 = load i32, ptr %3, align 4, !dbg !2018
  %17 = icmp eq i32 %16, 9, !dbg !2019
  br i1 %17, label %21, label %18, !dbg !2020

18:                                               ; preds = %15
  %19 = load i32, ptr %3, align 4, !dbg !2021
  %20 = icmp eq i32 %19, 11, !dbg !2022
  br i1 %20, label %21, label %22, !dbg !2023

21:                                               ; preds = %18, %15, %12, %9, %6, %1
  store i32 1, ptr %2, align 4, !dbg !2024
  br label %23, !dbg !2024

22:                                               ; preds = %18
  store i32 0, ptr %2, align 4, !dbg !2026
  br label %23, !dbg !2026

23:                                               ; preds = %22, %21
  %24 = load i32, ptr %2, align 4, !dbg !2027
  ret i32 %24, !dbg !2027
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isalpha(i32 noundef %0) #0 !dbg !2028 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2030, metadata !DIExpression()), !dbg !2031
  %4 = load i32, ptr %3, align 4, !dbg !2032
  %5 = icmp sge i32 %4, 65, !dbg !2034
  br i1 %5, label %6, label %9, !dbg !2035

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2036
  %8 = icmp sle i32 %7, 90, !dbg !2037
  br i1 %8, label %15, label %9, !dbg !2038

9:                                                ; preds = %6, %1
  %10 = load i32, ptr %3, align 4, !dbg !2039
  %11 = icmp sge i32 %10, 97, !dbg !2040
  br i1 %11, label %12, label %16, !dbg !2041

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4, !dbg !2042
  %14 = icmp sle i32 %13, 122, !dbg !2043
  br i1 %14, label %15, label %16, !dbg !2044

15:                                               ; preds = %12, %6
  store i32 1, ptr %2, align 4, !dbg !2045
  br label %17, !dbg !2045

16:                                               ; preds = %12, %9
  store i32 0, ptr %2, align 4, !dbg !2047
  br label %17, !dbg !2047

17:                                               ; preds = %16, %15
  %18 = load i32, ptr %2, align 4, !dbg !2048
  ret i32 %18, !dbg !2048
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isblank(i32 noundef %0) #0 !dbg !2049 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2051, metadata !DIExpression()), !dbg !2052
  %4 = load i32, ptr %3, align 4, !dbg !2053
  %5 = icmp eq i32 %4, 32, !dbg !2055
  br i1 %5, label %9, label %6, !dbg !2056

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2057
  %8 = icmp eq i32 %7, 9, !dbg !2058
  br i1 %8, label %9, label %10, !dbg !2059

9:                                                ; preds = %6, %1
  store i32 1, ptr %2, align 4, !dbg !2060
  br label %11, !dbg !2060

10:                                               ; preds = %6
  store i32 0, ptr %2, align 4, !dbg !2062
  br label %11, !dbg !2062

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2063
  ret i32 %12, !dbg !2063
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__islower(i32 noundef %0) #0 !dbg !2064 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2066, metadata !DIExpression()), !dbg !2067
  %4 = load i32, ptr %3, align 4, !dbg !2068
  %5 = icmp sge i32 %4, 97, !dbg !2070
  br i1 %5, label %6, label %10, !dbg !2071

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2072
  %8 = icmp sle i32 %7, 122, !dbg !2073
  br i1 %8, label %9, label %10, !dbg !2074

9:                                                ; preds = %6
  store i32 1, ptr %2, align 4, !dbg !2075
  br label %11, !dbg !2075

10:                                               ; preds = %6, %1
  store i32 0, ptr %2, align 4, !dbg !2077
  br label %11, !dbg !2077

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2078
  ret i32 %12, !dbg !2078
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isdigit(i32 noundef %0) #0 !dbg !2079 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2081, metadata !DIExpression()), !dbg !2082
  %4 = load i32, ptr %3, align 4, !dbg !2083
  %5 = icmp sge i32 %4, 48, !dbg !2085
  br i1 %5, label %6, label %10, !dbg !2086

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2087
  %8 = icmp sle i32 %7, 57, !dbg !2088
  br i1 %8, label %9, label %10, !dbg !2089

9:                                                ; preds = %6
  store i32 1, ptr %2, align 4, !dbg !2090
  br label %11, !dbg !2090

10:                                               ; preds = %6, %1
  store i32 0, ptr %2, align 4, !dbg !2092
  br label %11, !dbg !2092

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2093
  ret i32 %12, !dbg !2093
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__toupper(i32 noundef %0) #0 !dbg !2094 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2096, metadata !DIExpression()), !dbg !2097
  %4 = load i32, ptr %3, align 4, !dbg !2098
  %5 = call i32 @__fizzer_model__islower(i32 noundef %4), !dbg !2100
  %6 = icmp ne i32 %5, 0, !dbg !2100
  br i1 %6, label %7, label %11, !dbg !2101

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4, !dbg !2102
  %9 = sub nsw i32 %8, 97, !dbg !2104
  %10 = add nsw i32 %9, 65, !dbg !2105
  store i32 %10, ptr %2, align 4, !dbg !2106
  br label %13, !dbg !2106

11:                                               ; preds = %1
  %12 = load i32, ptr %3, align 4, !dbg !2107
  store i32 %12, ptr %2, align 4, !dbg !2108
  br label %13, !dbg !2108

13:                                               ; preds = %11, %7
  %14 = load i32, ptr %2, align 4, !dbg !2109
  ret i32 %14, !dbg !2109
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isprint(i32 noundef %0) #0 !dbg !2110 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2112, metadata !DIExpression()), !dbg !2113
  %4 = load i32, ptr %3, align 4, !dbg !2114
  %5 = icmp sge i32 %4, 32, !dbg !2116
  br i1 %5, label %6, label %10, !dbg !2117

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2118
  %8 = icmp sle i32 %7, 126, !dbg !2119
  br i1 %8, label %9, label %10, !dbg !2120

9:                                                ; preds = %6
  store i32 1, ptr %2, align 4, !dbg !2121
  br label %11, !dbg !2121

10:                                               ; preds = %6, %1
  store i32 0, ptr %2, align 4, !dbg !2123
  br label %11, !dbg !2123

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2124
  ret i32 %12, !dbg !2124
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isupper(i32 noundef %0) #0 !dbg !2125 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2127, metadata !DIExpression()), !dbg !2128
  %4 = load i32, ptr %3, align 4, !dbg !2129
  %5 = icmp sge i32 %4, 65, !dbg !2131
  br i1 %5, label %6, label %10, !dbg !2132

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2133
  %8 = icmp sle i32 %7, 90, !dbg !2134
  br i1 %8, label %9, label %10, !dbg !2135

9:                                                ; preds = %6
  store i32 1, ptr %2, align 4, !dbg !2136
  br label %11, !dbg !2136

10:                                               ; preds = %6, %1
  store i32 0, ptr %2, align 4, !dbg !2138
  br label %11, !dbg !2138

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2139
  ret i32 %12, !dbg !2139
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__tolower(i32 noundef %0) #0 !dbg !2140 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2142, metadata !DIExpression()), !dbg !2143
  %4 = load i32, ptr %3, align 4, !dbg !2144
  %5 = call i32 @__fizzer_model__isupper(i32 noundef %4), !dbg !2146
  %6 = icmp ne i32 %5, 0, !dbg !2146
  br i1 %6, label %7, label %11, !dbg !2147

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4, !dbg !2148
  %9 = sub nsw i32 %8, 65, !dbg !2150
  %10 = add nsw i32 %9, 97, !dbg !2151
  store i32 %10, ptr %2, align 4, !dbg !2152
  br label %13, !dbg !2152

11:                                               ; preds = %1
  %12 = load i32, ptr %3, align 4, !dbg !2153
  store i32 %12, ptr %2, align 4, !dbg !2154
  br label %13, !dbg !2154

13:                                               ; preds = %11, %7
  %14 = load i32, ptr %2, align 4, !dbg !2155
  ret i32 %14, !dbg !2155
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isgraph(i32 noundef %0) #0 !dbg !2156 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2158, metadata !DIExpression()), !dbg !2159
  %4 = load i32, ptr %3, align 4, !dbg !2160
  %5 = icmp sge i32 %4, 33, !dbg !2162
  br i1 %5, label %6, label %10, !dbg !2163

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2164
  %8 = icmp sle i32 %7, 126, !dbg !2165
  br i1 %8, label %9, label %10, !dbg !2166

9:                                                ; preds = %6
  store i32 1, ptr %2, align 4, !dbg !2167
  br label %11, !dbg !2167

10:                                               ; preds = %6, %1
  store i32 0, ptr %2, align 4, !dbg !2169
  br label %11, !dbg !2169

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2170
  ret i32 %12, !dbg !2170
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__snprintf(ptr noundef %0, i32 noundef %1, ptr noundef %2, ...) #0 !dbg !2171 {
  %4 = alloca ptr, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 4
  %7 = alloca ptr, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2177, metadata !DIExpression()), !dbg !2178
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2179, metadata !DIExpression()), !dbg !2180
  store ptr %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2181, metadata !DIExpression()), !dbg !2182
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2183, metadata !DIExpression()), !dbg !2186
  call void @llvm.va_start(ptr %7), !dbg !2187
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2188, metadata !DIExpression()), !dbg !2189
  %9 = load ptr, ptr %4, align 4, !dbg !2190
  %10 = load i32, ptr %5, align 4, !dbg !2191
  %11 = load ptr, ptr %6, align 4, !dbg !2192
  %12 = load ptr, ptr %7, align 4, !dbg !2193
  %13 = call i32 @__fizzer_model__vsnprintf(ptr noundef %9, i32 noundef %10, ptr noundef %11, ptr noundef %12), !dbg !2194
  store i32 %13, ptr %8, align 4, !dbg !2189
  call void @llvm.va_end(ptr %7), !dbg !2195
  %14 = load i32, ptr %8, align 4, !dbg !2196
  ret i32 %14, !dbg !2197
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start(ptr) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end(ptr) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__sprintf(ptr noundef %0, ptr noundef %1, ...) #0 !dbg !2198 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca ptr, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2202, metadata !DIExpression()), !dbg !2203
  store ptr %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2204, metadata !DIExpression()), !dbg !2205
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2206, metadata !DIExpression()), !dbg !2210
  call void @llvm.va_start(ptr %5), !dbg !2211
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2212, metadata !DIExpression()), !dbg !2213
  %7 = load ptr, ptr %3, align 4, !dbg !2214
  %8 = load ptr, ptr %4, align 4, !dbg !2215
  %9 = load ptr, ptr %5, align 4, !dbg !2216
  %10 = call i32 @__fizzer_model__vsprintf(ptr noundef %7, ptr noundef %8, ptr noundef %9), !dbg !2217
  store i32 %10, ptr %6, align 4, !dbg !2213
  call void @llvm.va_end(ptr %5), !dbg !2218
  %11 = load i32, ptr %6, align 4, !dbg !2219
  ret i32 %11, !dbg !2220
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__vsprintf(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !2221 {
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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2228, metadata !DIExpression()), !dbg !2229
  store ptr %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2230, metadata !DIExpression()), !dbg !2231
  store ptr %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2232, metadata !DIExpression()), !dbg !2233
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2234, metadata !DIExpression()), !dbg !2236
  store i32 0, ptr %7, align 4, !dbg !2236
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2237, metadata !DIExpression()), !dbg !2238
  store i32 0, ptr %8, align 4, !dbg !2238
  br label %21, !dbg !2239

21:                                               ; preds = %216, %3
  %22 = load ptr, ptr %5, align 4, !dbg !2240
  %23 = load i32, ptr %7, align 4, !dbg !2241
  %24 = getelementptr inbounds i8, ptr %22, i32 %23, !dbg !2240
  %25 = load i8, ptr %24, align 1, !dbg !2240
  %26 = sext i8 %25 to i32, !dbg !2240
  %27 = icmp ne i32 %26, 0, !dbg !2242
  br i1 %27, label %28, label %217, !dbg !2239

28:                                               ; preds = %21
  %29 = load ptr, ptr %5, align 4, !dbg !2243
  %30 = load i32, ptr %7, align 4, !dbg !2246
  %31 = getelementptr inbounds i8, ptr %29, i32 %30, !dbg !2243
  %32 = load i8, ptr %31, align 1, !dbg !2243
  %33 = sext i8 %32 to i32, !dbg !2243
  %34 = icmp eq i32 %33, 37, !dbg !2247
  br i1 %34, label %35, label %204, !dbg !2248

35:                                               ; preds = %28
  %36 = load i32, ptr %7, align 4, !dbg !2249
  %37 = add i32 %36, 1, !dbg !2249
  store i32 %37, ptr %7, align 4, !dbg !2249
  %38 = load ptr, ptr %5, align 4, !dbg !2251
  %39 = load i32, ptr %7, align 4, !dbg !2253
  %40 = getelementptr inbounds i8, ptr %38, i32 %39, !dbg !2251
  %41 = load i8, ptr %40, align 1, !dbg !2251
  %42 = sext i8 %41 to i32, !dbg !2251
  %43 = icmp eq i32 %42, 0, !dbg !2254
  br i1 %43, label %44, label %45, !dbg !2255

44:                                               ; preds = %35
  br label %217, !dbg !2256

45:                                               ; preds = %35
  %46 = load ptr, ptr %5, align 4, !dbg !2258
  %47 = load i32, ptr %7, align 4, !dbg !2260
  %48 = getelementptr inbounds i8, ptr %46, i32 %47, !dbg !2258
  %49 = load i8, ptr %48, align 1, !dbg !2258
  %50 = sext i8 %49 to i32, !dbg !2258
  %51 = icmp eq i32 %50, 100, !dbg !2261
  br i1 %51, label %52, label %76, !dbg !2262

52:                                               ; preds = %45
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2263, metadata !DIExpression()), !dbg !2265
  %53 = load ptr, ptr %6, align 4, !dbg !2266
  %54 = getelementptr inbounds i8, ptr %53, i32 4, !dbg !2266
  store ptr %54, ptr %6, align 4, !dbg !2266
  %55 = load i32, ptr %53, align 4, !dbg !2266
  store i32 %55, ptr %9, align 4, !dbg !2265
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2267, metadata !DIExpression()), !dbg !2271
  %56 = load i32, ptr %9, align 4, !dbg !2272
  %57 = getelementptr inbounds [32 x i8], ptr %10, i32 0, i32 0, !dbg !2273
  call void @__fizzer_model__helper_itoa(i32 noundef %56, ptr noundef %57, i32 noundef 10), !dbg !2274
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2275, metadata !DIExpression()), !dbg !2276
  store i32 0, ptr %11, align 4, !dbg !2276
  br label %58, !dbg !2277

58:                                               ; preds = %64, %52
  %59 = load i32, ptr %11, align 4, !dbg !2278
  %60 = getelementptr inbounds [32 x i8], ptr %10, i32 0, i32 %59, !dbg !2279
  %61 = load i8, ptr %60, align 1, !dbg !2279
  %62 = sext i8 %61 to i32, !dbg !2279
  %63 = icmp ne i32 %62, 0, !dbg !2280
  br i1 %63, label %64, label %75, !dbg !2277

64:                                               ; preds = %58
  %65 = load i32, ptr %11, align 4, !dbg !2281
  %66 = getelementptr inbounds [32 x i8], ptr %10, i32 0, i32 %65, !dbg !2283
  %67 = load i8, ptr %66, align 1, !dbg !2283
  %68 = load ptr, ptr %4, align 4, !dbg !2284
  %69 = load i32, ptr %8, align 4, !dbg !2285
  %70 = getelementptr inbounds i8, ptr %68, i32 %69, !dbg !2284
  store i8 %67, ptr %70, align 1, !dbg !2286
  %71 = load i32, ptr %8, align 4, !dbg !2287
  %72 = add i32 %71, 1, !dbg !2287
  store i32 %72, ptr %8, align 4, !dbg !2287
  %73 = load i32, ptr %11, align 4, !dbg !2288
  %74 = add i32 %73, 1, !dbg !2288
  store i32 %74, ptr %11, align 4, !dbg !2288
  br label %58, !dbg !2277, !llvm.loop !2289

75:                                               ; preds = %58
  br label %201, !dbg !2291

76:                                               ; preds = %45
  %77 = load ptr, ptr %5, align 4, !dbg !2292
  %78 = load i32, ptr %7, align 4, !dbg !2294
  %79 = getelementptr inbounds i8, ptr %77, i32 %78, !dbg !2292
  %80 = load i8, ptr %79, align 1, !dbg !2292
  %81 = sext i8 %80 to i32, !dbg !2292
  %82 = icmp eq i32 %81, 117, !dbg !2295
  br i1 %82, label %83, label %107, !dbg !2296

83:                                               ; preds = %76
  call void @llvm.dbg.declare(metadata ptr %12, metadata !2297, metadata !DIExpression()), !dbg !2299
  %84 = load ptr, ptr %6, align 4, !dbg !2300
  %85 = getelementptr inbounds i8, ptr %84, i32 4, !dbg !2300
  store ptr %85, ptr %6, align 4, !dbg !2300
  %86 = load i32, ptr %84, align 4, !dbg !2300
  store i32 %86, ptr %12, align 4, !dbg !2299
  call void @llvm.dbg.declare(metadata ptr %13, metadata !2301, metadata !DIExpression()), !dbg !2302
  %87 = load i32, ptr %12, align 4, !dbg !2303
  %88 = getelementptr inbounds [32 x i8], ptr %13, i32 0, i32 0, !dbg !2304
  call void @__fizzer_model__helper_itoa(i32 noundef %87, ptr noundef %88, i32 noundef 10), !dbg !2305
  call void @llvm.dbg.declare(metadata ptr %14, metadata !2306, metadata !DIExpression()), !dbg !2307
  store i32 0, ptr %14, align 4, !dbg !2307
  br label %89, !dbg !2308

89:                                               ; preds = %95, %83
  %90 = load i32, ptr %14, align 4, !dbg !2309
  %91 = getelementptr inbounds [32 x i8], ptr %13, i32 0, i32 %90, !dbg !2310
  %92 = load i8, ptr %91, align 1, !dbg !2310
  %93 = sext i8 %92 to i32, !dbg !2310
  %94 = icmp ne i32 %93, 0, !dbg !2311
  br i1 %94, label %95, label %106, !dbg !2308

95:                                               ; preds = %89
  %96 = load i32, ptr %14, align 4, !dbg !2312
  %97 = getelementptr inbounds [32 x i8], ptr %13, i32 0, i32 %96, !dbg !2314
  %98 = load i8, ptr %97, align 1, !dbg !2314
  %99 = load ptr, ptr %4, align 4, !dbg !2315
  %100 = load i32, ptr %8, align 4, !dbg !2316
  %101 = getelementptr inbounds i8, ptr %99, i32 %100, !dbg !2315
  store i8 %98, ptr %101, align 1, !dbg !2317
  %102 = load i32, ptr %8, align 4, !dbg !2318
  %103 = add i32 %102, 1, !dbg !2318
  store i32 %103, ptr %8, align 4, !dbg !2318
  %104 = load i32, ptr %14, align 4, !dbg !2319
  %105 = add i32 %104, 1, !dbg !2319
  store i32 %105, ptr %14, align 4, !dbg !2319
  br label %89, !dbg !2308, !llvm.loop !2320

106:                                              ; preds = %89
  br label %200, !dbg !2322

107:                                              ; preds = %76
  %108 = load ptr, ptr %5, align 4, !dbg !2323
  %109 = load i32, ptr %7, align 4, !dbg !2325
  %110 = getelementptr inbounds i8, ptr %108, i32 %109, !dbg !2323
  %111 = load i8, ptr %110, align 1, !dbg !2323
  %112 = sext i8 %111 to i32, !dbg !2323
  %113 = icmp eq i32 %112, 120, !dbg !2326
  br i1 %113, label %114, label %138, !dbg !2327

114:                                              ; preds = %107
  call void @llvm.dbg.declare(metadata ptr %15, metadata !2328, metadata !DIExpression()), !dbg !2330
  %115 = load ptr, ptr %6, align 4, !dbg !2331
  %116 = getelementptr inbounds i8, ptr %115, i32 4, !dbg !2331
  store ptr %116, ptr %6, align 4, !dbg !2331
  %117 = load i32, ptr %115, align 4, !dbg !2331
  store i32 %117, ptr %15, align 4, !dbg !2330
  call void @llvm.dbg.declare(metadata ptr %16, metadata !2332, metadata !DIExpression()), !dbg !2333
  %118 = load i32, ptr %15, align 4, !dbg !2334
  %119 = getelementptr inbounds [32 x i8], ptr %16, i32 0, i32 0, !dbg !2335
  call void @__fizzer_model__helper_itoa(i32 noundef %118, ptr noundef %119, i32 noundef 16), !dbg !2336
  call void @llvm.dbg.declare(metadata ptr %17, metadata !2337, metadata !DIExpression()), !dbg !2338
  store i32 0, ptr %17, align 4, !dbg !2338
  br label %120, !dbg !2339

120:                                              ; preds = %126, %114
  %121 = load i32, ptr %17, align 4, !dbg !2340
  %122 = getelementptr inbounds [32 x i8], ptr %16, i32 0, i32 %121, !dbg !2341
  %123 = load i8, ptr %122, align 1, !dbg !2341
  %124 = sext i8 %123 to i32, !dbg !2341
  %125 = icmp ne i32 %124, 0, !dbg !2342
  br i1 %125, label %126, label %137, !dbg !2339

126:                                              ; preds = %120
  %127 = load i32, ptr %17, align 4, !dbg !2343
  %128 = getelementptr inbounds [32 x i8], ptr %16, i32 0, i32 %127, !dbg !2345
  %129 = load i8, ptr %128, align 1, !dbg !2345
  %130 = load ptr, ptr %4, align 4, !dbg !2346
  %131 = load i32, ptr %8, align 4, !dbg !2347
  %132 = getelementptr inbounds i8, ptr %130, i32 %131, !dbg !2346
  store i8 %129, ptr %132, align 1, !dbg !2348
  %133 = load i32, ptr %8, align 4, !dbg !2349
  %134 = add i32 %133, 1, !dbg !2349
  store i32 %134, ptr %8, align 4, !dbg !2349
  %135 = load i32, ptr %17, align 4, !dbg !2350
  %136 = add i32 %135, 1, !dbg !2350
  store i32 %136, ptr %17, align 4, !dbg !2350
  br label %120, !dbg !2339, !llvm.loop !2351

137:                                              ; preds = %120
  br label %199, !dbg !2353

138:                                              ; preds = %107
  %139 = load ptr, ptr %5, align 4, !dbg !2354
  %140 = load i32, ptr %7, align 4, !dbg !2356
  %141 = getelementptr inbounds i8, ptr %139, i32 %140, !dbg !2354
  %142 = load i8, ptr %141, align 1, !dbg !2354
  %143 = sext i8 %142 to i32, !dbg !2354
  %144 = icmp eq i32 %143, 99, !dbg !2357
  br i1 %144, label %145, label %156, !dbg !2358

145:                                              ; preds = %138
  call void @llvm.dbg.declare(metadata ptr %18, metadata !2359, metadata !DIExpression()), !dbg !2361
  %146 = load ptr, ptr %6, align 4, !dbg !2362
  %147 = getelementptr inbounds i8, ptr %146, i32 4, !dbg !2362
  store ptr %147, ptr %6, align 4, !dbg !2362
  %148 = load i32, ptr %146, align 4, !dbg !2362
  %149 = trunc i32 %148 to i8, !dbg !2363
  store i8 %149, ptr %18, align 1, !dbg !2361
  %150 = load i8, ptr %18, align 1, !dbg !2364
  %151 = load ptr, ptr %4, align 4, !dbg !2365
  %152 = load i32, ptr %8, align 4, !dbg !2366
  %153 = getelementptr inbounds i8, ptr %151, i32 %152, !dbg !2365
  store i8 %150, ptr %153, align 1, !dbg !2367
  %154 = load i32, ptr %8, align 4, !dbg !2368
  %155 = add i32 %154, 1, !dbg !2368
  store i32 %155, ptr %8, align 4, !dbg !2368
  br label %198, !dbg !2369

156:                                              ; preds = %138
  %157 = load ptr, ptr %5, align 4, !dbg !2370
  %158 = load i32, ptr %7, align 4, !dbg !2372
  %159 = getelementptr inbounds i8, ptr %157, i32 %158, !dbg !2370
  %160 = load i8, ptr %159, align 1, !dbg !2370
  %161 = sext i8 %160 to i32, !dbg !2370
  %162 = icmp eq i32 %161, 115, !dbg !2373
  br i1 %162, label %163, label %187, !dbg !2374

163:                                              ; preds = %156
  call void @llvm.dbg.declare(metadata ptr %19, metadata !2375, metadata !DIExpression()), !dbg !2377
  %164 = load ptr, ptr %6, align 4, !dbg !2378
  %165 = getelementptr inbounds i8, ptr %164, i32 4, !dbg !2378
  store ptr %165, ptr %6, align 4, !dbg !2378
  %166 = load ptr, ptr %164, align 4, !dbg !2378
  store ptr %166, ptr %19, align 4, !dbg !2377
  call void @llvm.dbg.declare(metadata ptr %20, metadata !2379, metadata !DIExpression()), !dbg !2380
  store i32 0, ptr %20, align 4, !dbg !2380
  br label %167, !dbg !2381

167:                                              ; preds = %174, %163
  %168 = load ptr, ptr %19, align 4, !dbg !2382
  %169 = load i32, ptr %20, align 4, !dbg !2383
  %170 = getelementptr inbounds i8, ptr %168, i32 %169, !dbg !2382
  %171 = load i8, ptr %170, align 1, !dbg !2382
  %172 = sext i8 %171 to i32, !dbg !2382
  %173 = icmp ne i32 %172, 0, !dbg !2384
  br i1 %173, label %174, label %186, !dbg !2381

174:                                              ; preds = %167
  %175 = load ptr, ptr %19, align 4, !dbg !2385
  %176 = load i32, ptr %20, align 4, !dbg !2387
  %177 = getelementptr inbounds i8, ptr %175, i32 %176, !dbg !2385
  %178 = load i8, ptr %177, align 1, !dbg !2385
  %179 = load ptr, ptr %4, align 4, !dbg !2388
  %180 = load i32, ptr %8, align 4, !dbg !2389
  %181 = getelementptr inbounds i8, ptr %179, i32 %180, !dbg !2388
  store i8 %178, ptr %181, align 1, !dbg !2390
  %182 = load i32, ptr %8, align 4, !dbg !2391
  %183 = add i32 %182, 1, !dbg !2391
  store i32 %183, ptr %8, align 4, !dbg !2391
  %184 = load i32, ptr %20, align 4, !dbg !2392
  %185 = add i32 %184, 1, !dbg !2392
  store i32 %185, ptr %20, align 4, !dbg !2392
  br label %167, !dbg !2381, !llvm.loop !2393

186:                                              ; preds = %167
  br label %197, !dbg !2395

187:                                              ; preds = %156
  %188 = load ptr, ptr %5, align 4, !dbg !2396
  %189 = load i32, ptr %7, align 4, !dbg !2398
  %190 = getelementptr inbounds i8, ptr %188, i32 %189, !dbg !2396
  %191 = load i8, ptr %190, align 1, !dbg !2396
  %192 = load ptr, ptr %4, align 4, !dbg !2399
  %193 = load i32, ptr %8, align 4, !dbg !2400
  %194 = getelementptr inbounds i8, ptr %192, i32 %193, !dbg !2399
  store i8 %191, ptr %194, align 1, !dbg !2401
  %195 = load i32, ptr %8, align 4, !dbg !2402
  %196 = add i32 %195, 1, !dbg !2402
  store i32 %196, ptr %8, align 4, !dbg !2402
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
  %202 = load i32, ptr %7, align 4, !dbg !2403
  %203 = add i32 %202, 1, !dbg !2403
  store i32 %203, ptr %7, align 4, !dbg !2403
  br label %216, !dbg !2404

204:                                              ; preds = %28
  %205 = load ptr, ptr %5, align 4, !dbg !2405
  %206 = load i32, ptr %7, align 4, !dbg !2407
  %207 = getelementptr inbounds i8, ptr %205, i32 %206, !dbg !2405
  %208 = load i8, ptr %207, align 1, !dbg !2405
  %209 = load ptr, ptr %4, align 4, !dbg !2408
  %210 = load i32, ptr %8, align 4, !dbg !2409
  %211 = getelementptr inbounds i8, ptr %209, i32 %210, !dbg !2408
  store i8 %208, ptr %211, align 1, !dbg !2410
  %212 = load i32, ptr %7, align 4, !dbg !2411
  %213 = add i32 %212, 1, !dbg !2411
  store i32 %213, ptr %7, align 4, !dbg !2411
  %214 = load i32, ptr %8, align 4, !dbg !2412
  %215 = add i32 %214, 1, !dbg !2412
  store i32 %215, ptr %8, align 4, !dbg !2412
  br label %216

216:                                              ; preds = %204, %201
  br label %21, !dbg !2239, !llvm.loop !2413

217:                                              ; preds = %44, %21
  %218 = load ptr, ptr %4, align 4, !dbg !2415
  %219 = load i32, ptr %8, align 4, !dbg !2416
  %220 = getelementptr inbounds i8, ptr %218, i32 %219, !dbg !2415
  store i8 0, ptr %220, align 1, !dbg !2417
  %221 = load i32, ptr %8, align 4, !dbg !2418
  ret i32 %221, !dbg !2419
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__fizzer_model__helper_itoa(i32 noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !2420 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 4
  %6 = alloca i32, align 4
  %7 = alloca [32 x i8], align 1
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2424, metadata !DIExpression()), !dbg !2425
  store ptr %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2426, metadata !DIExpression()), !dbg !2427
  store i32 %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2428, metadata !DIExpression()), !dbg !2429
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2430, metadata !DIExpression()), !dbg !2431
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2432, metadata !DIExpression()), !dbg !2433
  store i32 0, ptr %8, align 4, !dbg !2433
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2434, metadata !DIExpression()), !dbg !2435
  store i32 0, ptr %9, align 4, !dbg !2435
  %12 = load i32, ptr %4, align 4, !dbg !2436
  %13 = icmp slt i32 %12, 0, !dbg !2438
  br i1 %13, label %14, label %20, !dbg !2439

14:                                               ; preds = %3
  %15 = load i32, ptr %6, align 4, !dbg !2440
  %16 = icmp eq i32 %15, 10, !dbg !2441
  br i1 %16, label %17, label %20, !dbg !2442

17:                                               ; preds = %14
  store i32 1, ptr %9, align 4, !dbg !2443
  %18 = load i32, ptr %4, align 4, !dbg !2445
  %19 = sub nsw i32 0, %18, !dbg !2446
  store i32 %19, ptr %4, align 4, !dbg !2447
  br label %20, !dbg !2448

20:                                               ; preds = %17, %14, %3
  %21 = load i32, ptr %4, align 4, !dbg !2449
  %22 = icmp eq i32 %21, 0, !dbg !2451
  br i1 %22, label %23, label %28, !dbg !2452

23:                                               ; preds = %20
  %24 = load ptr, ptr %5, align 4, !dbg !2453
  %25 = getelementptr inbounds i8, ptr %24, i32 0, !dbg !2453
  store i8 48, ptr %25, align 1, !dbg !2455
  %26 = load ptr, ptr %5, align 4, !dbg !2456
  %27 = getelementptr inbounds i8, ptr %26, i32 1, !dbg !2456
  store i8 0, ptr %27, align 1, !dbg !2457
  br label %85, !dbg !2458

28:                                               ; preds = %20
  br label %29, !dbg !2459

29:                                               ; preds = %51, %28
  %30 = load i32, ptr %4, align 4, !dbg !2460
  %31 = icmp ne i32 %30, 0, !dbg !2461
  br i1 %31, label %32, label %57, !dbg !2459

32:                                               ; preds = %29
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2462, metadata !DIExpression()), !dbg !2464
  %33 = load i32, ptr %4, align 4, !dbg !2465
  %34 = load i32, ptr %6, align 4, !dbg !2466
  %35 = srem i32 %33, %34, !dbg !2467
  store i32 %35, ptr %10, align 4, !dbg !2464
  %36 = load i32, ptr %10, align 4, !dbg !2468
  %37 = icmp slt i32 %36, 10, !dbg !2470
  br i1 %37, label %38, label %44, !dbg !2471

38:                                               ; preds = %32
  %39 = load i32, ptr %10, align 4, !dbg !2472
  %40 = add nsw i32 48, %39, !dbg !2474
  %41 = trunc i32 %40 to i8, !dbg !2475
  %42 = load i32, ptr %8, align 4, !dbg !2476
  %43 = getelementptr inbounds [32 x i8], ptr %7, i32 0, i32 %42, !dbg !2477
  store i8 %41, ptr %43, align 1, !dbg !2478
  br label %51, !dbg !2479

44:                                               ; preds = %32
  %45 = load i32, ptr %10, align 4, !dbg !2480
  %46 = sub nsw i32 %45, 10, !dbg !2482
  %47 = add nsw i32 97, %46, !dbg !2483
  %48 = trunc i32 %47 to i8, !dbg !2484
  %49 = load i32, ptr %8, align 4, !dbg !2485
  %50 = getelementptr inbounds [32 x i8], ptr %7, i32 0, i32 %49, !dbg !2486
  store i8 %48, ptr %50, align 1, !dbg !2487
  br label %51

51:                                               ; preds = %44, %38
  %52 = load i32, ptr %4, align 4, !dbg !2488
  %53 = load i32, ptr %6, align 4, !dbg !2489
  %54 = sdiv i32 %52, %53, !dbg !2490
  store i32 %54, ptr %4, align 4, !dbg !2491
  %55 = load i32, ptr %8, align 4, !dbg !2492
  %56 = add nsw i32 %55, 1, !dbg !2492
  store i32 %56, ptr %8, align 4, !dbg !2492
  br label %29, !dbg !2459, !llvm.loop !2493

57:                                               ; preds = %29
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2495, metadata !DIExpression()), !dbg !2496
  store i32 0, ptr %11, align 4, !dbg !2496
  %58 = load i32, ptr %9, align 4, !dbg !2497
  %59 = icmp ne i32 %58, 0, !dbg !2497
  br i1 %59, label %60, label %66, !dbg !2499

60:                                               ; preds = %57
  %61 = load ptr, ptr %5, align 4, !dbg !2500
  %62 = load i32, ptr %11, align 4, !dbg !2502
  %63 = getelementptr inbounds i8, ptr %61, i32 %62, !dbg !2500
  store i8 45, ptr %63, align 1, !dbg !2503
  %64 = load i32, ptr %11, align 4, !dbg !2504
  %65 = add nsw i32 %64, 1, !dbg !2504
  store i32 %65, ptr %11, align 4, !dbg !2504
  br label %66, !dbg !2505

66:                                               ; preds = %60, %57
  br label %67, !dbg !2506

67:                                               ; preds = %70, %66
  %68 = load i32, ptr %8, align 4, !dbg !2507
  %69 = icmp sgt i32 %68, 0, !dbg !2508
  br i1 %69, label %70, label %81, !dbg !2506

70:                                               ; preds = %67
  %71 = load i32, ptr %8, align 4, !dbg !2509
  %72 = add nsw i32 %71, -1, !dbg !2509
  store i32 %72, ptr %8, align 4, !dbg !2509
  %73 = load i32, ptr %8, align 4, !dbg !2511
  %74 = getelementptr inbounds [32 x i8], ptr %7, i32 0, i32 %73, !dbg !2512
  %75 = load i8, ptr %74, align 1, !dbg !2512
  %76 = load ptr, ptr %5, align 4, !dbg !2513
  %77 = load i32, ptr %11, align 4, !dbg !2514
  %78 = getelementptr inbounds i8, ptr %76, i32 %77, !dbg !2513
  store i8 %75, ptr %78, align 1, !dbg !2515
  %79 = load i32, ptr %11, align 4, !dbg !2516
  %80 = add nsw i32 %79, 1, !dbg !2516
  store i32 %80, ptr %11, align 4, !dbg !2516
  br label %67, !dbg !2506, !llvm.loop !2517

81:                                               ; preds = %67
  %82 = load ptr, ptr %5, align 4, !dbg !2519
  %83 = load i32, ptr %11, align 4, !dbg !2520
  %84 = getelementptr inbounds i8, ptr %82, i32 %83, !dbg !2519
  store i8 0, ptr %84, align 1, !dbg !2521
  br label %85, !dbg !2522

85:                                               ; preds = %81, %23
  ret void, !dbg !2522
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__vsnprintf(ptr noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !2523 {
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
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2531, metadata !DIExpression()), !dbg !2532
  store i32 %1, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2533, metadata !DIExpression()), !dbg !2534
  store ptr %2, ptr %8, align 4
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2535, metadata !DIExpression()), !dbg !2536
  store ptr %3, ptr %9, align 4
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2537, metadata !DIExpression()), !dbg !2538
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2539, metadata !DIExpression()), !dbg !2540
  store i32 0, ptr %10, align 4, !dbg !2540
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2541, metadata !DIExpression()), !dbg !2542
  store i32 0, ptr %11, align 4, !dbg !2542
  %18 = load i32, ptr %7, align 4, !dbg !2543
  %19 = icmp eq i32 %18, 0, !dbg !2545
  br i1 %19, label %20, label %21, !dbg !2546

20:                                               ; preds = %4
  store i32 0, ptr %5, align 4, !dbg !2547
  br label %203, !dbg !2547

21:                                               ; preds = %4
  br label %22, !dbg !2549

22:                                               ; preds = %197, %143, %21
  %23 = load ptr, ptr %8, align 4, !dbg !2550
  %24 = load i32, ptr %10, align 4, !dbg !2551
  %25 = getelementptr inbounds i8, ptr %23, i32 %24, !dbg !2550
  %26 = load i8, ptr %25, align 1, !dbg !2550
  %27 = sext i8 %26 to i32, !dbg !2550
  %28 = icmp ne i32 %27, 0, !dbg !2552
  br i1 %28, label %29, label %34, !dbg !2553

29:                                               ; preds = %22
  %30 = load i32, ptr %11, align 4, !dbg !2554
  %31 = load i32, ptr %7, align 4, !dbg !2555
  %32 = sub i32 %31, 1, !dbg !2556
  %33 = icmp ult i32 %30, %32, !dbg !2557
  br label %34

34:                                               ; preds = %29, %22
  %35 = phi i1 [ false, %22 ], [ %33, %29 ], !dbg !2558
  br i1 %35, label %36, label %198, !dbg !2549

36:                                               ; preds = %34
  %37 = load ptr, ptr %8, align 4, !dbg !2559
  %38 = load i32, ptr %10, align 4, !dbg !2562
  %39 = getelementptr inbounds i8, ptr %37, i32 %38, !dbg !2559
  %40 = load i8, ptr %39, align 1, !dbg !2559
  %41 = sext i8 %40 to i32, !dbg !2559
  %42 = icmp eq i32 %41, 37, !dbg !2563
  br i1 %42, label %43, label %185, !dbg !2564

43:                                               ; preds = %36
  %44 = load i32, ptr %10, align 4, !dbg !2565
  %45 = add i32 %44, 1, !dbg !2565
  store i32 %45, ptr %10, align 4, !dbg !2565
  %46 = load ptr, ptr %8, align 4, !dbg !2567
  %47 = load i32, ptr %10, align 4, !dbg !2569
  %48 = getelementptr inbounds i8, ptr %46, i32 %47, !dbg !2567
  %49 = load i8, ptr %48, align 1, !dbg !2567
  %50 = sext i8 %49 to i32, !dbg !2567
  %51 = icmp eq i32 %50, 0, !dbg !2570
  br i1 %51, label %52, label %53, !dbg !2571

52:                                               ; preds = %43
  br label %198, !dbg !2572

53:                                               ; preds = %43
  call void @llvm.dbg.declare(metadata ptr %12, metadata !2574, metadata !DIExpression()), !dbg !2575
  call void @llvm.dbg.declare(metadata ptr %13, metadata !2576, metadata !DIExpression()), !dbg !2577
  store i32 0, ptr %13, align 4, !dbg !2577
  %54 = load ptr, ptr %8, align 4, !dbg !2578
  %55 = load i32, ptr %10, align 4, !dbg !2580
  %56 = getelementptr inbounds i8, ptr %54, i32 %55, !dbg !2578
  %57 = load i8, ptr %56, align 1, !dbg !2578
  %58 = sext i8 %57 to i32, !dbg !2578
  %59 = icmp eq i32 %58, 100, !dbg !2581
  br i1 %59, label %60, label %66, !dbg !2582

60:                                               ; preds = %53
  call void @llvm.dbg.declare(metadata ptr %14, metadata !2583, metadata !DIExpression()), !dbg !2585
  %61 = load ptr, ptr %9, align 4, !dbg !2586
  %62 = getelementptr inbounds i8, ptr %61, i32 4, !dbg !2586
  store ptr %62, ptr %9, align 4, !dbg !2586
  %63 = load i32, ptr %61, align 4, !dbg !2586
  store i32 %63, ptr %14, align 4, !dbg !2585
  %64 = load i32, ptr %14, align 4, !dbg !2587
  %65 = getelementptr inbounds [32 x i8], ptr %12, i32 0, i32 0, !dbg !2588
  call void @__fizzer_model__helper_itoa(i32 noundef %64, ptr noundef %65, i32 noundef 10), !dbg !2589
  br label %157, !dbg !2590

66:                                               ; preds = %53
  %67 = load ptr, ptr %8, align 4, !dbg !2591
  %68 = load i32, ptr %10, align 4, !dbg !2593
  %69 = getelementptr inbounds i8, ptr %67, i32 %68, !dbg !2591
  %70 = load i8, ptr %69, align 1, !dbg !2591
  %71 = sext i8 %70 to i32, !dbg !2591
  %72 = icmp eq i32 %71, 117, !dbg !2594
  br i1 %72, label %73, label %79, !dbg !2595

73:                                               ; preds = %66
  call void @llvm.dbg.declare(metadata ptr %15, metadata !2596, metadata !DIExpression()), !dbg !2598
  %74 = load ptr, ptr %9, align 4, !dbg !2599
  %75 = getelementptr inbounds i8, ptr %74, i32 4, !dbg !2599
  store ptr %75, ptr %9, align 4, !dbg !2599
  %76 = load i32, ptr %74, align 4, !dbg !2599
  store i32 %76, ptr %15, align 4, !dbg !2598
  %77 = load i32, ptr %15, align 4, !dbg !2600
  %78 = getelementptr inbounds [32 x i8], ptr %12, i32 0, i32 0, !dbg !2601
  call void @__fizzer_model__helper_itoa(i32 noundef %77, ptr noundef %78, i32 noundef 10), !dbg !2602
  br label %156, !dbg !2603

79:                                               ; preds = %66
  %80 = load ptr, ptr %8, align 4, !dbg !2604
  %81 = load i32, ptr %10, align 4, !dbg !2606
  %82 = getelementptr inbounds i8, ptr %80, i32 %81, !dbg !2604
  %83 = load i8, ptr %82, align 1, !dbg !2604
  %84 = sext i8 %83 to i32, !dbg !2604
  %85 = icmp eq i32 %84, 120, !dbg !2607
  br i1 %85, label %86, label %92, !dbg !2608

86:                                               ; preds = %79
  call void @llvm.dbg.declare(metadata ptr %16, metadata !2609, metadata !DIExpression()), !dbg !2611
  %87 = load ptr, ptr %9, align 4, !dbg !2612
  %88 = getelementptr inbounds i8, ptr %87, i32 4, !dbg !2612
  store ptr %88, ptr %9, align 4, !dbg !2612
  %89 = load i32, ptr %87, align 4, !dbg !2612
  store i32 %89, ptr %16, align 4, !dbg !2611
  %90 = load i32, ptr %16, align 4, !dbg !2613
  %91 = getelementptr inbounds [32 x i8], ptr %12, i32 0, i32 0, !dbg !2614
  call void @__fizzer_model__helper_itoa(i32 noundef %90, ptr noundef %91, i32 noundef 16), !dbg !2615
  br label %155, !dbg !2616

92:                                               ; preds = %79
  %93 = load ptr, ptr %8, align 4, !dbg !2617
  %94 = load i32, ptr %10, align 4, !dbg !2619
  %95 = getelementptr inbounds i8, ptr %93, i32 %94, !dbg !2617
  %96 = load i8, ptr %95, align 1, !dbg !2617
  %97 = sext i8 %96 to i32, !dbg !2617
  %98 = icmp eq i32 %97, 99, !dbg !2620
  br i1 %98, label %99, label %106, !dbg !2621

99:                                               ; preds = %92
  %100 = load ptr, ptr %9, align 4, !dbg !2622
  %101 = getelementptr inbounds i8, ptr %100, i32 4, !dbg !2622
  store ptr %101, ptr %9, align 4, !dbg !2622
  %102 = load i32, ptr %100, align 4, !dbg !2622
  %103 = trunc i32 %102 to i8, !dbg !2624
  %104 = getelementptr inbounds [32 x i8], ptr %12, i32 0, i32 0, !dbg !2625
  store i8 %103, ptr %104, align 1, !dbg !2626
  %105 = getelementptr inbounds [32 x i8], ptr %12, i32 0, i32 1, !dbg !2627
  store i8 0, ptr %105, align 1, !dbg !2628
  br label %154, !dbg !2629

106:                                              ; preds = %92
  %107 = load ptr, ptr %8, align 4, !dbg !2630
  %108 = load i32, ptr %10, align 4, !dbg !2632
  %109 = getelementptr inbounds i8, ptr %107, i32 %108, !dbg !2630
  %110 = load i8, ptr %109, align 1, !dbg !2630
  %111 = sext i8 %110 to i32, !dbg !2630
  %112 = icmp eq i32 %111, 115, !dbg !2633
  br i1 %112, label %113, label %146, !dbg !2634

113:                                              ; preds = %106
  call void @llvm.dbg.declare(metadata ptr %17, metadata !2635, metadata !DIExpression()), !dbg !2637
  %114 = load ptr, ptr %9, align 4, !dbg !2638
  %115 = getelementptr inbounds i8, ptr %114, i32 4, !dbg !2638
  store ptr %115, ptr %9, align 4, !dbg !2638
  %116 = load ptr, ptr %114, align 4, !dbg !2638
  store ptr %116, ptr %17, align 4, !dbg !2637
  store i32 0, ptr %13, align 4, !dbg !2639
  br label %117, !dbg !2640

117:                                              ; preds = %131, %113
  %118 = load ptr, ptr %17, align 4, !dbg !2641
  %119 = load i32, ptr %13, align 4, !dbg !2642
  %120 = getelementptr inbounds i8, ptr %118, i32 %119, !dbg !2641
  %121 = load i8, ptr %120, align 1, !dbg !2641
  %122 = sext i8 %121 to i32, !dbg !2641
  %123 = icmp ne i32 %122, 0, !dbg !2643
  br i1 %123, label %124, label %129, !dbg !2644

124:                                              ; preds = %117
  %125 = load i32, ptr %11, align 4, !dbg !2645
  %126 = load i32, ptr %7, align 4, !dbg !2646
  %127 = sub i32 %126, 1, !dbg !2647
  %128 = icmp ult i32 %125, %127, !dbg !2648
  br label %129

129:                                              ; preds = %124, %117
  %130 = phi i1 [ false, %117 ], [ %128, %124 ], !dbg !2649
  br i1 %130, label %131, label %143, !dbg !2640

131:                                              ; preds = %129
  %132 = load ptr, ptr %17, align 4, !dbg !2650
  %133 = load i32, ptr %13, align 4, !dbg !2652
  %134 = getelementptr inbounds i8, ptr %132, i32 %133, !dbg !2650
  %135 = load i8, ptr %134, align 1, !dbg !2650
  %136 = load ptr, ptr %6, align 4, !dbg !2653
  %137 = load i32, ptr %11, align 4, !dbg !2654
  %138 = getelementptr inbounds i8, ptr %136, i32 %137, !dbg !2653
  store i8 %135, ptr %138, align 1, !dbg !2655
  %139 = load i32, ptr %11, align 4, !dbg !2656
  %140 = add i32 %139, 1, !dbg !2656
  store i32 %140, ptr %11, align 4, !dbg !2656
  %141 = load i32, ptr %13, align 4, !dbg !2657
  %142 = add i32 %141, 1, !dbg !2657
  store i32 %142, ptr %13, align 4, !dbg !2657
  br label %117, !dbg !2640, !llvm.loop !2658

143:                                              ; preds = %129
  %144 = load i32, ptr %10, align 4, !dbg !2660
  %145 = add i32 %144, 1, !dbg !2660
  store i32 %145, ptr %10, align 4, !dbg !2660
  br label %22, !dbg !2661, !llvm.loop !2662

146:                                              ; preds = %106
  %147 = load ptr, ptr %8, align 4, !dbg !2664
  %148 = load i32, ptr %10, align 4, !dbg !2666
  %149 = getelementptr inbounds i8, ptr %147, i32 %148, !dbg !2664
  %150 = load i8, ptr %149, align 1, !dbg !2664
  %151 = getelementptr inbounds [32 x i8], ptr %12, i32 0, i32 0, !dbg !2667
  store i8 %150, ptr %151, align 1, !dbg !2668
  %152 = getelementptr inbounds [32 x i8], ptr %12, i32 0, i32 1, !dbg !2669
  store i8 0, ptr %152, align 1, !dbg !2670
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
  store i32 0, ptr %13, align 4, !dbg !2671
  br label %158, !dbg !2672

158:                                              ; preds = %171, %157
  %159 = load i32, ptr %13, align 4, !dbg !2673
  %160 = getelementptr inbounds [32 x i8], ptr %12, i32 0, i32 %159, !dbg !2674
  %161 = load i8, ptr %160, align 1, !dbg !2674
  %162 = sext i8 %161 to i32, !dbg !2674
  %163 = icmp ne i32 %162, 0, !dbg !2675
  br i1 %163, label %164, label %169, !dbg !2676

164:                                              ; preds = %158
  %165 = load i32, ptr %11, align 4, !dbg !2677
  %166 = load i32, ptr %7, align 4, !dbg !2678
  %167 = sub i32 %166, 1, !dbg !2679
  %168 = icmp ult i32 %165, %167, !dbg !2680
  br label %169

169:                                              ; preds = %164, %158
  %170 = phi i1 [ false, %158 ], [ %168, %164 ], !dbg !2681
  br i1 %170, label %171, label %182, !dbg !2672

171:                                              ; preds = %169
  %172 = load i32, ptr %13, align 4, !dbg !2682
  %173 = getelementptr inbounds [32 x i8], ptr %12, i32 0, i32 %172, !dbg !2684
  %174 = load i8, ptr %173, align 1, !dbg !2684
  %175 = load ptr, ptr %6, align 4, !dbg !2685
  %176 = load i32, ptr %11, align 4, !dbg !2686
  %177 = getelementptr inbounds i8, ptr %175, i32 %176, !dbg !2685
  store i8 %174, ptr %177, align 1, !dbg !2687
  %178 = load i32, ptr %11, align 4, !dbg !2688
  %179 = add i32 %178, 1, !dbg !2688
  store i32 %179, ptr %11, align 4, !dbg !2688
  %180 = load i32, ptr %13, align 4, !dbg !2689
  %181 = add i32 %180, 1, !dbg !2689
  store i32 %181, ptr %13, align 4, !dbg !2689
  br label %158, !dbg !2672, !llvm.loop !2690

182:                                              ; preds = %169
  %183 = load i32, ptr %10, align 4, !dbg !2692
  %184 = add i32 %183, 1, !dbg !2692
  store i32 %184, ptr %10, align 4, !dbg !2692
  br label %197, !dbg !2693

185:                                              ; preds = %36
  %186 = load ptr, ptr %8, align 4, !dbg !2694
  %187 = load i32, ptr %10, align 4, !dbg !2696
  %188 = getelementptr inbounds i8, ptr %186, i32 %187, !dbg !2694
  %189 = load i8, ptr %188, align 1, !dbg !2694
  %190 = load ptr, ptr %6, align 4, !dbg !2697
  %191 = load i32, ptr %11, align 4, !dbg !2698
  %192 = getelementptr inbounds i8, ptr %190, i32 %191, !dbg !2697
  store i8 %189, ptr %192, align 1, !dbg !2699
  %193 = load i32, ptr %10, align 4, !dbg !2700
  %194 = add i32 %193, 1, !dbg !2700
  store i32 %194, ptr %10, align 4, !dbg !2700
  %195 = load i32, ptr %11, align 4, !dbg !2701
  %196 = add i32 %195, 1, !dbg !2701
  store i32 %196, ptr %11, align 4, !dbg !2701
  br label %197

197:                                              ; preds = %185, %182
  br label %22, !dbg !2549, !llvm.loop !2662

198:                                              ; preds = %52, %34
  %199 = load ptr, ptr %6, align 4, !dbg !2702
  %200 = load i32, ptr %11, align 4, !dbg !2703
  %201 = getelementptr inbounds i8, ptr %199, i32 %200, !dbg !2702
  store i8 0, ptr %201, align 1, !dbg !2704
  %202 = load i32, ptr %11, align 4, !dbg !2705
  store i32 %202, ptr %5, align 4, !dbg !2706
  br label %203, !dbg !2706

203:                                              ; preds = %198, %20
  %204 = load i32, ptr %5, align 4, !dbg !2707
  ret i32 %204, !dbg !2707
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local x86_fp80 @__fizzer_model__fabsl(x86_fp80 noundef %0) #0 !dbg !2708 {
  %2 = alloca x86_fp80, align 4
  %3 = alloca x86_fp80, align 4
  store x86_fp80 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2713, metadata !DIExpression()), !dbg !2714
  %4 = load x86_fp80, ptr %3, align 4, !dbg !2715
  %5 = fcmp olt x86_fp80 %4, 0xK00000000000000000000, !dbg !2717
  br i1 %5, label %6, label %9, !dbg !2718

6:                                                ; preds = %1
  %7 = load x86_fp80, ptr %3, align 4, !dbg !2719
  %8 = fneg x86_fp80 %7, !dbg !2720
  store x86_fp80 %8, ptr %2, align 4, !dbg !2721
  br label %11, !dbg !2721

9:                                                ; preds = %1
  %10 = load x86_fp80, ptr %3, align 4, !dbg !2722
  store x86_fp80 %10, ptr %2, align 4, !dbg !2723
  br label %11, !dbg !2723

11:                                               ; preds = %9, %6
  %12 = load x86_fp80, ptr %2, align 4, !dbg !2724
  ret x86_fp80 %12, !dbg !2724
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @__fizzer_model__fabs(double noundef %0) #0 !dbg !2725 {
  %2 = alloca double, align 4
  %3 = alloca double, align 8
  store double %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2729, metadata !DIExpression()), !dbg !2730
  %4 = load double, ptr %3, align 8, !dbg !2731
  %5 = fcmp olt double %4, 0.000000e+00, !dbg !2733
  br i1 %5, label %6, label %9, !dbg !2734

6:                                                ; preds = %1
  %7 = load double, ptr %3, align 8, !dbg !2735
  %8 = fneg double %7, !dbg !2736
  store double %8, ptr %2, align 4, !dbg !2737
  br label %11, !dbg !2737

9:                                                ; preds = %1
  %10 = load double, ptr %3, align 8, !dbg !2738
  store double %10, ptr %2, align 4, !dbg !2739
  br label %11, !dbg !2739

11:                                               ; preds = %9, %6
  %12 = load double, ptr %2, align 4, !dbg !2740
  ret double %12, !dbg !2740
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @__fizzer_model__fabsf(float noundef %0) #0 !dbg !2741 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  store float %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2746, metadata !DIExpression()), !dbg !2747
  %4 = load float, ptr %3, align 4, !dbg !2748
  %5 = fcmp olt float %4, 0.000000e+00, !dbg !2750
  br i1 %5, label %6, label %9, !dbg !2751

6:                                                ; preds = %1
  %7 = load float, ptr %3, align 4, !dbg !2752
  %8 = fneg float %7, !dbg !2753
  store float %8, ptr %2, align 4, !dbg !2754
  br label %11, !dbg !2754

9:                                                ; preds = %1
  %10 = load float, ptr %3, align 4, !dbg !2755
  store float %10, ptr %2, align 4, !dbg !2756
  br label %11, !dbg !2756

11:                                               ; preds = %9, %6
  %12 = load float, ptr %2, align 4, !dbg !2757
  ret float %12, !dbg !2757
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strftime(ptr noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !2758 {
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
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2782, metadata !DIExpression()), !dbg !2783
  store i32 %1, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2784, metadata !DIExpression()), !dbg !2785
  store ptr %2, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2786, metadata !DIExpression()), !dbg !2787
  store ptr %3, ptr %8, align 4
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2788, metadata !DIExpression()), !dbg !2789
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2790, metadata !DIExpression()), !dbg !2791
  store i32 0, ptr %9, align 4, !dbg !2791
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2792, metadata !DIExpression()), !dbg !2793
  store i32 0, ptr %10, align 4, !dbg !2793
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2794, metadata !DIExpression()), !dbg !2795
  br label %19, !dbg !2796

19:                                               ; preds = %182, %4
  %20 = load ptr, ptr %7, align 4, !dbg !2797
  %21 = load i32, ptr %9, align 4, !dbg !2798
  %22 = getelementptr inbounds i8, ptr %20, i32 %21, !dbg !2797
  %23 = load i8, ptr %22, align 1, !dbg !2797
  %24 = sext i8 %23 to i32, !dbg !2797
  %25 = icmp ne i32 %24, 0, !dbg !2799
  br i1 %25, label %26, label %31, !dbg !2800

26:                                               ; preds = %19
  %27 = load i32, ptr %10, align 4, !dbg !2801
  %28 = load i32, ptr %6, align 4, !dbg !2802
  %29 = sub i32 %28, 1, !dbg !2803
  %30 = icmp ult i32 %27, %29, !dbg !2804
  br label %31

31:                                               ; preds = %26, %19
  %32 = phi i1 [ false, %19 ], [ %30, %26 ], !dbg !2805
  br i1 %32, label %33, label %183, !dbg !2796

33:                                               ; preds = %31
  %34 = load ptr, ptr %7, align 4, !dbg !2806
  %35 = load i32, ptr %9, align 4, !dbg !2809
  %36 = getelementptr inbounds i8, ptr %34, i32 %35, !dbg !2806
  %37 = load i8, ptr %36, align 1, !dbg !2806
  %38 = sext i8 %37 to i32, !dbg !2806
  %39 = icmp eq i32 %38, 37, !dbg !2810
  br i1 %39, label %40, label %170, !dbg !2811

40:                                               ; preds = %33
  %41 = load i32, ptr %9, align 4, !dbg !2812
  %42 = add i32 %41, 1, !dbg !2812
  store i32 %42, ptr %9, align 4, !dbg !2812
  %43 = load ptr, ptr %7, align 4, !dbg !2814
  %44 = load i32, ptr %9, align 4, !dbg !2816
  %45 = getelementptr inbounds i8, ptr %43, i32 %44, !dbg !2814
  %46 = load i8, ptr %45, align 1, !dbg !2814
  %47 = sext i8 %46 to i32, !dbg !2814
  %48 = icmp eq i32 %47, 0, !dbg !2817
  br i1 %48, label %49, label %50, !dbg !2818

49:                                               ; preds = %40
  br label %183, !dbg !2819

50:                                               ; preds = %40
  call void @llvm.dbg.declare(metadata ptr %12, metadata !2821, metadata !DIExpression()), !dbg !2822
  store i32 0, ptr %12, align 4, !dbg !2822
  %51 = load ptr, ptr %7, align 4, !dbg !2823
  %52 = load i32, ptr %9, align 4, !dbg !2825
  %53 = getelementptr inbounds i8, ptr %51, i32 %52, !dbg !2823
  %54 = load i8, ptr %53, align 1, !dbg !2823
  %55 = sext i8 %54 to i32, !dbg !2823
  %56 = icmp eq i32 %55, 89, !dbg !2826
  br i1 %56, label %57, label %64, !dbg !2827

57:                                               ; preds = %50
  call void @llvm.dbg.declare(metadata ptr %13, metadata !2828, metadata !DIExpression()), !dbg !2830
  %58 = load ptr, ptr %8, align 4, !dbg !2831
  %59 = getelementptr inbounds %struct.tm, ptr %58, i32 0, i32 5, !dbg !2832
  %60 = load i32, ptr %59, align 4, !dbg !2832
  %61 = add nsw i32 1900, %60, !dbg !2833
  store i32 %61, ptr %13, align 4, !dbg !2830
  %62 = load i32, ptr %13, align 4, !dbg !2834
  %63 = getelementptr inbounds [16 x i8], ptr %11, i32 0, i32 0, !dbg !2835
  call void @__fizzer_model__helper_itoa(i32 noundef %62, ptr noundef %63, i32 noundef 10), !dbg !2836
  br label %142, !dbg !2837

64:                                               ; preds = %50
  %65 = load ptr, ptr %7, align 4, !dbg !2838
  %66 = load i32, ptr %9, align 4, !dbg !2840
  %67 = getelementptr inbounds i8, ptr %65, i32 %66, !dbg !2838
  %68 = load i8, ptr %67, align 1, !dbg !2838
  %69 = sext i8 %68 to i32, !dbg !2838
  %70 = icmp eq i32 %69, 109, !dbg !2841
  br i1 %70, label %71, label %78, !dbg !2842

71:                                               ; preds = %64
  call void @llvm.dbg.declare(metadata ptr %14, metadata !2843, metadata !DIExpression()), !dbg !2845
  %72 = load ptr, ptr %8, align 4, !dbg !2846
  %73 = getelementptr inbounds %struct.tm, ptr %72, i32 0, i32 4, !dbg !2847
  %74 = load i32, ptr %73, align 4, !dbg !2847
  %75 = add nsw i32 %74, 1, !dbg !2848
  store i32 %75, ptr %14, align 4, !dbg !2845
  %76 = load i32, ptr %14, align 4, !dbg !2849
  %77 = getelementptr inbounds [16 x i8], ptr %11, i32 0, i32 0, !dbg !2850
  call void @__fizzer_model__helper_itoa(i32 noundef %76, ptr noundef %77, i32 noundef 10), !dbg !2851
  br label %141, !dbg !2852

78:                                               ; preds = %64
  %79 = load ptr, ptr %7, align 4, !dbg !2853
  %80 = load i32, ptr %9, align 4, !dbg !2855
  %81 = getelementptr inbounds i8, ptr %79, i32 %80, !dbg !2853
  %82 = load i8, ptr %81, align 1, !dbg !2853
  %83 = sext i8 %82 to i32, !dbg !2853
  %84 = icmp eq i32 %83, 100, !dbg !2856
  br i1 %84, label %85, label %91, !dbg !2857

85:                                               ; preds = %78
  call void @llvm.dbg.declare(metadata ptr %15, metadata !2858, metadata !DIExpression()), !dbg !2860
  %86 = load ptr, ptr %8, align 4, !dbg !2861
  %87 = getelementptr inbounds %struct.tm, ptr %86, i32 0, i32 3, !dbg !2862
  %88 = load i32, ptr %87, align 4, !dbg !2862
  store i32 %88, ptr %15, align 4, !dbg !2860
  %89 = load i32, ptr %15, align 4, !dbg !2863
  %90 = getelementptr inbounds [16 x i8], ptr %11, i32 0, i32 0, !dbg !2864
  call void @__fizzer_model__helper_itoa(i32 noundef %89, ptr noundef %90, i32 noundef 10), !dbg !2865
  br label %140, !dbg !2866

91:                                               ; preds = %78
  %92 = load ptr, ptr %7, align 4, !dbg !2867
  %93 = load i32, ptr %9, align 4, !dbg !2869
  %94 = getelementptr inbounds i8, ptr %92, i32 %93, !dbg !2867
  %95 = load i8, ptr %94, align 1, !dbg !2867
  %96 = sext i8 %95 to i32, !dbg !2867
  %97 = icmp eq i32 %96, 72, !dbg !2870
  br i1 %97, label %98, label %104, !dbg !2871

98:                                               ; preds = %91
  call void @llvm.dbg.declare(metadata ptr %16, metadata !2872, metadata !DIExpression()), !dbg !2874
  %99 = load ptr, ptr %8, align 4, !dbg !2875
  %100 = getelementptr inbounds %struct.tm, ptr %99, i32 0, i32 2, !dbg !2876
  %101 = load i32, ptr %100, align 4, !dbg !2876
  store i32 %101, ptr %16, align 4, !dbg !2874
  %102 = load i32, ptr %16, align 4, !dbg !2877
  %103 = getelementptr inbounds [16 x i8], ptr %11, i32 0, i32 0, !dbg !2878
  call void @__fizzer_model__helper_itoa(i32 noundef %102, ptr noundef %103, i32 noundef 10), !dbg !2879
  br label %139, !dbg !2880

104:                                              ; preds = %91
  %105 = load ptr, ptr %7, align 4, !dbg !2881
  %106 = load i32, ptr %9, align 4, !dbg !2883
  %107 = getelementptr inbounds i8, ptr %105, i32 %106, !dbg !2881
  %108 = load i8, ptr %107, align 1, !dbg !2881
  %109 = sext i8 %108 to i32, !dbg !2881
  %110 = icmp eq i32 %109, 77, !dbg !2884
  br i1 %110, label %111, label %117, !dbg !2885

111:                                              ; preds = %104
  call void @llvm.dbg.declare(metadata ptr %17, metadata !2886, metadata !DIExpression()), !dbg !2888
  %112 = load ptr, ptr %8, align 4, !dbg !2889
  %113 = getelementptr inbounds %struct.tm, ptr %112, i32 0, i32 1, !dbg !2890
  %114 = load i32, ptr %113, align 4, !dbg !2890
  store i32 %114, ptr %17, align 4, !dbg !2888
  %115 = load i32, ptr %17, align 4, !dbg !2891
  %116 = getelementptr inbounds [16 x i8], ptr %11, i32 0, i32 0, !dbg !2892
  call void @__fizzer_model__helper_itoa(i32 noundef %115, ptr noundef %116, i32 noundef 10), !dbg !2893
  br label %138, !dbg !2894

117:                                              ; preds = %104
  %118 = load ptr, ptr %7, align 4, !dbg !2895
  %119 = load i32, ptr %9, align 4, !dbg !2897
  %120 = getelementptr inbounds i8, ptr %118, i32 %119, !dbg !2895
  %121 = load i8, ptr %120, align 1, !dbg !2895
  %122 = sext i8 %121 to i32, !dbg !2895
  %123 = icmp eq i32 %122, 83, !dbg !2898
  br i1 %123, label %124, label %130, !dbg !2899

124:                                              ; preds = %117
  call void @llvm.dbg.declare(metadata ptr %18, metadata !2900, metadata !DIExpression()), !dbg !2902
  %125 = load ptr, ptr %8, align 4, !dbg !2903
  %126 = getelementptr inbounds %struct.tm, ptr %125, i32 0, i32 0, !dbg !2904
  %127 = load i32, ptr %126, align 4, !dbg !2904
  store i32 %127, ptr %18, align 4, !dbg !2902
  %128 = load i32, ptr %18, align 4, !dbg !2905
  %129 = getelementptr inbounds [16 x i8], ptr %11, i32 0, i32 0, !dbg !2906
  call void @__fizzer_model__helper_itoa(i32 noundef %128, ptr noundef %129, i32 noundef 10), !dbg !2907
  br label %137, !dbg !2908

130:                                              ; preds = %117
  %131 = load ptr, ptr %7, align 4, !dbg !2909
  %132 = load i32, ptr %9, align 4, !dbg !2911
  %133 = getelementptr inbounds i8, ptr %131, i32 %132, !dbg !2909
  %134 = load i8, ptr %133, align 1, !dbg !2909
  %135 = getelementptr inbounds [16 x i8], ptr %11, i32 0, i32 0, !dbg !2912
  store i8 %134, ptr %135, align 1, !dbg !2913
  %136 = getelementptr inbounds [16 x i8], ptr %11, i32 0, i32 1, !dbg !2914
  store i8 0, ptr %136, align 1, !dbg !2915
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
  store i32 0, ptr %12, align 4, !dbg !2916
  br label %143, !dbg !2917

143:                                              ; preds = %156, %142
  %144 = load i32, ptr %12, align 4, !dbg !2918
  %145 = getelementptr inbounds [16 x i8], ptr %11, i32 0, i32 %144, !dbg !2919
  %146 = load i8, ptr %145, align 1, !dbg !2919
  %147 = sext i8 %146 to i32, !dbg !2919
  %148 = icmp ne i32 %147, 0, !dbg !2920
  br i1 %148, label %149, label %154, !dbg !2921

149:                                              ; preds = %143
  %150 = load i32, ptr %10, align 4, !dbg !2922
  %151 = load i32, ptr %6, align 4, !dbg !2923
  %152 = sub i32 %151, 1, !dbg !2924
  %153 = icmp ult i32 %150, %152, !dbg !2925
  br label %154

154:                                              ; preds = %149, %143
  %155 = phi i1 [ false, %143 ], [ %153, %149 ], !dbg !2926
  br i1 %155, label %156, label %167, !dbg !2917

156:                                              ; preds = %154
  %157 = load i32, ptr %12, align 4, !dbg !2927
  %158 = getelementptr inbounds [16 x i8], ptr %11, i32 0, i32 %157, !dbg !2929
  %159 = load i8, ptr %158, align 1, !dbg !2929
  %160 = load ptr, ptr %5, align 4, !dbg !2930
  %161 = load i32, ptr %10, align 4, !dbg !2931
  %162 = getelementptr inbounds i8, ptr %160, i32 %161, !dbg !2930
  store i8 %159, ptr %162, align 1, !dbg !2932
  %163 = load i32, ptr %10, align 4, !dbg !2933
  %164 = add i32 %163, 1, !dbg !2933
  store i32 %164, ptr %10, align 4, !dbg !2933
  %165 = load i32, ptr %12, align 4, !dbg !2934
  %166 = add nsw i32 %165, 1, !dbg !2934
  store i32 %166, ptr %12, align 4, !dbg !2934
  br label %143, !dbg !2917, !llvm.loop !2935

167:                                              ; preds = %154
  %168 = load i32, ptr %9, align 4, !dbg !2937
  %169 = add i32 %168, 1, !dbg !2937
  store i32 %169, ptr %9, align 4, !dbg !2937
  br label %182, !dbg !2938

170:                                              ; preds = %33
  %171 = load ptr, ptr %7, align 4, !dbg !2939
  %172 = load i32, ptr %9, align 4, !dbg !2941
  %173 = getelementptr inbounds i8, ptr %171, i32 %172, !dbg !2939
  %174 = load i8, ptr %173, align 1, !dbg !2939
  %175 = load ptr, ptr %5, align 4, !dbg !2942
  %176 = load i32, ptr %10, align 4, !dbg !2943
  %177 = getelementptr inbounds i8, ptr %175, i32 %176, !dbg !2942
  store i8 %174, ptr %177, align 1, !dbg !2944
  %178 = load i32, ptr %9, align 4, !dbg !2945
  %179 = add i32 %178, 1, !dbg !2945
  store i32 %179, ptr %9, align 4, !dbg !2945
  %180 = load i32, ptr %10, align 4, !dbg !2946
  %181 = add i32 %180, 1, !dbg !2946
  store i32 %181, ptr %10, align 4, !dbg !2946
  br label %182

182:                                              ; preds = %170, %167
  br label %19, !dbg !2796, !llvm.loop !2947

183:                                              ; preds = %49, %31
  %184 = load ptr, ptr %5, align 4, !dbg !2949
  %185 = load i32, ptr %10, align 4, !dbg !2950
  %186 = getelementptr inbounds i8, ptr %184, i32 %185, !dbg !2949
  store i8 0, ptr %186, align 1, !dbg !2951
  %187 = load i32, ptr %10, align 4, !dbg !2952
  ret i32 %187, !dbg !2953
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__ctime(ptr noundef %0, ptr noundef %1) #0 !dbg !2954 {
  %3 = alloca ptr, align 4
  %4 = alloca ptr, align 4
  %5 = alloca [26 x i8], align 1
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2962, metadata !DIExpression()), !dbg !2963
  store ptr %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2964, metadata !DIExpression()), !dbg !2965
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2966, metadata !DIExpression()), !dbg !2968
  call void @llvm.memcpy.p0.p0.i32(ptr align 1 %5, ptr align 1 @__const.__fizzer_model__ctime.template, i32 26, i1 false), !dbg !2968
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2969, metadata !DIExpression()), !dbg !2971
  store i32 0, ptr %6, align 4, !dbg !2971
  br label %7, !dbg !2972

7:                                                ; preds = %13, %2
  %8 = load i32, ptr %6, align 4, !dbg !2973
  %9 = getelementptr inbounds [26 x i8], ptr %5, i32 0, i32 %8, !dbg !2974
  %10 = load i8, ptr %9, align 1, !dbg !2974
  %11 = sext i8 %10 to i32, !dbg !2974
  %12 = icmp ne i32 %11, 0, !dbg !2975
  br i1 %12, label %13, label %22, !dbg !2972

13:                                               ; preds = %7
  %14 = load i32, ptr %6, align 4, !dbg !2976
  %15 = getelementptr inbounds [26 x i8], ptr %5, i32 0, i32 %14, !dbg !2978
  %16 = load i8, ptr %15, align 1, !dbg !2978
  %17 = load ptr, ptr %4, align 4, !dbg !2979
  %18 = load i32, ptr %6, align 4, !dbg !2980
  %19 = getelementptr inbounds i8, ptr %17, i32 %18, !dbg !2979
  store i8 %16, ptr %19, align 1, !dbg !2981
  %20 = load i32, ptr %6, align 4, !dbg !2982
  %21 = add i32 %20, 1, !dbg !2982
  store i32 %21, ptr %6, align 4, !dbg !2982
  br label %7, !dbg !2972, !llvm.loop !2983

22:                                               ; preds = %7
  %23 = load ptr, ptr %4, align 4, !dbg !2985
  %24 = load i32, ptr %6, align 4, !dbg !2986
  %25 = getelementptr inbounds i8, ptr %23, i32 %24, !dbg !2985
  store i8 0, ptr %25, align 1, !dbg !2987
  %26 = load ptr, ptr %4, align 4, !dbg !2988
  ret ptr %26, !dbg !2989
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i32, i1 immarg) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="i686" "target-features"="+cmov,+cx8,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="i686" "target-features"="+cmov,+cx8,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind willreturn }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.dbg.cu = !{!78, !2, !83, !9, !86, !17, !23, !88, !90, !94, !96, !98, !100, !103, !105, !107, !109, !111, !113, !115, !117, !119, !122, !124, !127, !130, !132, !134, !136, !33, !138, !144, !75, !146, !148, !150, !152, !154, !156, !158, !160, !162, !164, !166, !168, !170, !172, !174, !176, !178, !181, !183, !185, !187, !189, !191, !193}
!llvm.module.flags = !{!195, !196, !197, !198, !199, !200, !201, !202}
!llvm.ident = !{!203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203, !203}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__fizzer_model__optind", scope: !2, file: !5, line: 2, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/posix/optind.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "945fcb2626293b869626e4030b5152b8")
!4 = !{!0}
!5 = !DIFile(filename: "data/models/c/posix/optind.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "945fcb2626293b869626e4030b5152b8")
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "__fizzer_model__optarg", scope: !9, file: !12, line: 2, type: !13, isLocal: false, isDefinition: true)
!9 = distinct !DICompileUnit(language: DW_LANG_C11, file: !10, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !11, splitDebugInlining: false, nameTableKind: None)
!10 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/posix/optarg.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "86f072807e2e2c68c2fb011600ba3f42")
!11 = !{!7}
!12 = !DIFile(filename: "data/models/c/posix/optarg.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "86f072807e2e2c68c2fb011600ba3f42")
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 32)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "__fizzer_model__opterr", scope: !17, file: !20, line: 2, type: !6, isLocal: false, isDefinition: true)
!17 = distinct !DICompileUnit(language: DW_LANG_C11, file: !18, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !19, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/posix/opterr.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "57845018c21837129253ce8b28765272")
!19 = !{!15}
!20 = !DIFile(filename: "data/models/c/posix/opterr.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "57845018c21837129253ce8b28765272")
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "__fizzer_model__optopt", scope: !23, file: !26, line: 2, type: !6, isLocal: false, isDefinition: true)
!23 = distinct !DICompileUnit(language: DW_LANG_C11, file: !24, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !25, splitDebugInlining: false, nameTableKind: None)
!24 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/posix/optopt.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "6320db8dd870df7aa889229ce0d9119f")
!25 = !{!21}
!26 = !DIFile(filename: "data/models/c/posix/optopt.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "6320db8dd870df7aa889229ce0d9119f")
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "unknown", scope: !29, file: !30, line: 5, type: !64, isLocal: true, isDefinition: true)
!29 = distinct !DISubprogram(name: "__fizzer_model__strerror", scope: !30, file: !30, line: 2, type: !31, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !33, retainedNodes: !63)
!30 = !DIFile(filename: "data/models/c/std/string/strerror.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "cbe05e12c04cb8edbc875d57698a462d")
!31 = !DISubroutineType(types: !32)
!32 = !{!13, !6}
!33 = distinct !DICompileUnit(language: DW_LANG_C11, file: !34, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !35, splitDebugInlining: false, nameTableKind: None)
!34 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/string/strerror.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "cbe05e12c04cb8edbc875d57698a462d")
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
!76 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/string/strtok.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "d6aa346c784ed4f2c46282113e65161d")
!77 = !{!67}
!78 = distinct !DICompileUnit(language: DW_LANG_C11, file: !79, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !80, splitDebugInlining: false, nameTableKind: None)
!79 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/testcomp/nondet.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "949c31f0da7b279f40bfbf3ec7cfdee3")
!80 = !{!81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 32)
!82 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!83 = distinct !DICompileUnit(language: DW_LANG_C11, file: !84, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !85, splitDebugInlining: false, nameTableKind: None)
!84 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/posix/getopt_long.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "de123133f6a530da5006cce09eb75639")
!85 = !{!6}
!86 = distinct !DICompileUnit(language: DW_LANG_C11, file: !87, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!87 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/posix/getopt.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "f654b476831f33a28b3fae574c027426")
!88 = distinct !DICompileUnit(language: DW_LANG_C11, file: !89, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!89 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/stdlib/atoll.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "a20eee9a7568d583fd9ee7193391622b")
!90 = distinct !DICompileUnit(language: DW_LANG_C11, file: !91, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !92, splitDebugInlining: false, nameTableKind: None)
!91 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/stdlib/strtod.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "8af3db33fabf3d592277f51247d76438")
!92 = !{!93, !13}
!93 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!94 = distinct !DICompileUnit(language: DW_LANG_C11, file: !95, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!95 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/stdlib/abs.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "5dc98c96c5261907ed11f631ce472103")
!96 = distinct !DICompileUnit(language: DW_LANG_C11, file: !97, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!97 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/stdlib/labs.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "d0625b0698f9d1196d0b119b4fc84b2d")
!98 = distinct !DICompileUnit(language: DW_LANG_C11, file: !99, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!99 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/stdlib/llabs.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "8095d5dd9527583f176d5d9342463eec")
!100 = distinct !DICompileUnit(language: DW_LANG_C11, file: !101, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !102, splitDebugInlining: false, nameTableKind: None)
!101 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/stdlib/strtol.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "7bd701710373e339d62a1da5b0831766")
!102 = !{!13}
!103 = distinct !DICompileUnit(language: DW_LANG_C11, file: !104, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!104 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/stdlib/atol.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "130864a3e56f877c17dbd6cd172158db")
!105 = distinct !DICompileUnit(language: DW_LANG_C11, file: !106, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !102, splitDebugInlining: false, nameTableKind: None)
!106 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/stdlib/strtoul.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "edaf3dbca4ae2e5ae7dd393d65e176da")
!107 = distinct !DICompileUnit(language: DW_LANG_C11, file: !108, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!108 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/stdlib/atoi.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "25ff8cf0c3b1eb16133d1fa2f6f4599f")
!109 = distinct !DICompileUnit(language: DW_LANG_C11, file: !110, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !102, splitDebugInlining: false, nameTableKind: None)
!110 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/string/strstr.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "88fd7ab45b37086df2d2f42655100238")
!111 = distinct !DICompileUnit(language: DW_LANG_C11, file: !112, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !102, splitDebugInlining: false, nameTableKind: None)
!112 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/string/strpbrk.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "f90ee9e8ce652e3236917e969fe7e0af")
!113 = distinct !DICompileUnit(language: DW_LANG_C11, file: !114, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!114 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/string/strcpy.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "a9d5e5946be9d668420164bcb8d1da5f")
!115 = distinct !DICompileUnit(language: DW_LANG_C11, file: !116, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!116 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/string/strncat.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "1734f838e35184e8c456b32046d1ee07")
!117 = distinct !DICompileUnit(language: DW_LANG_C11, file: !118, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!118 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/string/strcspn.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "2f7cd216c9e6f8edb02d5afb4ea11b44")
!119 = distinct !DICompileUnit(language: DW_LANG_C11, file: !120, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !121, splitDebugInlining: false, nameTableKind: None)
!120 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/string/strcoll.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "594081383e127900a617071ac71187f1")
!121 = !{!6, !82}
!122 = distinct !DICompileUnit(language: DW_LANG_C11, file: !123, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !121, splitDebugInlining: false, nameTableKind: None)
!123 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/string/strcmp.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "e8d614ef53fc1f2814b3a79a1909aaf7")
!124 = distinct !DICompileUnit(language: DW_LANG_C11, file: !125, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !126, splitDebugInlining: false, nameTableKind: None)
!125 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/string/strncmp.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "e275f67b87d7e3da1256de4308f1f1ce")
!126 = !{!82, !6}
!127 = distinct !DICompileUnit(language: DW_LANG_C11, file: !128, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !129, splitDebugInlining: false, nameTableKind: None)
!128 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/string/strrchr.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "44079aea5c31caec0e42d813448f707f")
!129 = !{!14, !13}
!130 = distinct !DICompileUnit(language: DW_LANG_C11, file: !131, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!131 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/string/strcat.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "8970d2710d3c40f59dab15e8fb2774f9")
!132 = distinct !DICompileUnit(language: DW_LANG_C11, file: !133, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!133 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/string/strspn.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "093bc709c553b9ccbb1565b54017ff4e")
!134 = distinct !DICompileUnit(language: DW_LANG_C11, file: !135, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!135 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/string/strncpy.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "4b1e33fa2c1188492810829cb7ad397c")
!136 = distinct !DICompileUnit(language: DW_LANG_C11, file: !137, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !129, splitDebugInlining: false, nameTableKind: None)
!137 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/string/strchr.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "be78f81f7eb8078306a1616593746c64")
!138 = distinct !DICompileUnit(language: DW_LANG_C11, file: !139, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !140, splitDebugInlining: false, nameTableKind: None)
!139 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/string/memchr.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "eb41c2475f9bcc7c01385e05d30fa3e5")
!140 = !{!141, !82, !143}
!141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !142, size: 32)
!142 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !82)
!143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 32)
!144 = distinct !DICompileUnit(language: DW_LANG_C11, file: !145, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!145 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/string/strlen.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "02927e422ac203a0e84c9a608c987af4")
!146 = distinct !DICompileUnit(language: DW_LANG_C11, file: !147, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!147 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/string/strxfrm.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "989278973572eb57b2d093785a278add")
!148 = distinct !DICompileUnit(language: DW_LANG_C11, file: !149, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!149 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/ctype/iscntrl.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "1d16fabd886360902b60cd5383ecd536")
!150 = distinct !DICompileUnit(language: DW_LANG_C11, file: !151, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!151 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/ctype/isxdigit.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "0abf049bb725434344eee06d1063bde8")
!152 = distinct !DICompileUnit(language: DW_LANG_C11, file: !153, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!153 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/ctype/isalnum.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "6bbe9a062fcf4ea45225490b0c0403ef")
!154 = distinct !DICompileUnit(language: DW_LANG_C11, file: !155, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!155 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/ctype/isspace.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "9ab9a851c14ac485b9c69b251ca4421f")
!156 = distinct !DICompileUnit(language: DW_LANG_C11, file: !157, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!157 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/ctype/isalpha.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "ec45d1a23298cf8353ee76bfbe3010f4")
!158 = distinct !DICompileUnit(language: DW_LANG_C11, file: !159, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!159 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/ctype/isblank.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "4469204b656f7c8f7e1807d1f4e59567")
!160 = distinct !DICompileUnit(language: DW_LANG_C11, file: !161, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!161 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/ctype/islower.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "7f0db237b2957c408137ff19b95b9f37")
!162 = distinct !DICompileUnit(language: DW_LANG_C11, file: !163, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!163 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/ctype/isdigit.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "9967dfc55f3c5b9e8a34a1c12ab51128")
!164 = distinct !DICompileUnit(language: DW_LANG_C11, file: !165, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!165 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/ctype/toupper.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "35ae67ebdb17b245d732ce3603fdfa64")
!166 = distinct !DICompileUnit(language: DW_LANG_C11, file: !167, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!167 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/ctype/isprint.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "d8538a5b382a98a36fe86b916256fcc7")
!168 = distinct !DICompileUnit(language: DW_LANG_C11, file: !169, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!169 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/ctype/isupper.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "c2334b5acdb0a1b26cc08f11cf47c244")
!170 = distinct !DICompileUnit(language: DW_LANG_C11, file: !171, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!171 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/ctype/tolower.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "7faecd1bd1600a814e6c8b43347332c3")
!172 = distinct !DICompileUnit(language: DW_LANG_C11, file: !173, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!173 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/ctype/isgraph.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "53707fda19088bc8e89fad78f4c3a13f")
!174 = distinct !DICompileUnit(language: DW_LANG_C11, file: !175, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!175 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/stdio/snprintf.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "76bc06d30e021e08fbd62dcb20d50aff")
!176 = distinct !DICompileUnit(language: DW_LANG_C11, file: !177, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!177 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/stdio/sprintf.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "56f45916c6775fca737b2a248636b9a4")
!178 = distinct !DICompileUnit(language: DW_LANG_C11, file: !179, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !180, splitDebugInlining: false, nameTableKind: None)
!179 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/stdio/vsprintf.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "108c7547e9301a0fdafaac5451fdb696")
!180 = !{!6, !14}
!181 = distinct !DICompileUnit(language: DW_LANG_C11, file: !182, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!182 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/stdio/helper_itoa.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "20d31603d5d66432f19663f52fc24b10")
!183 = distinct !DICompileUnit(language: DW_LANG_C11, file: !184, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !180, splitDebugInlining: false, nameTableKind: None)
!184 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/stdio/vsnprintf.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "97ba02a558780981a4df185c06cf20d5")
!185 = distinct !DICompileUnit(language: DW_LANG_C11, file: !186, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!186 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/math/fabsl.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "5c5076ae740114377af63cf033329357")
!187 = distinct !DICompileUnit(language: DW_LANG_C11, file: !188, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!188 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/math/fabs.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "8c49c577f21ca028a8a9f5afb48aacbb")
!189 = distinct !DICompileUnit(language: DW_LANG_C11, file: !190, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!190 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/math/fabsf.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "b084fca80d77cc63411b9d4b3fe450c4")
!191 = distinct !DICompileUnit(language: DW_LANG_C11, file: !192, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!192 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/time/strftime.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "60233b54b62040efdc56806d7e2f5c85")
!193 = distinct !DICompileUnit(language: DW_LANG_C11, file: !194, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!194 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/time/ctime.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "a911ddebb345e08702cf6c685c49baca")
!195 = !{i32 1, !"NumRegisterParameters", i32 0}
!196 = !{i32 7, !"Dwarf Version", i32 5}
!197 = !{i32 2, !"Debug Info Version", i32 3}
!198 = !{i32 1, !"wchar_size", i32 4}
!199 = !{i32 8, !"PIC Level", i32 2}
!200 = !{i32 7, !"PIE Level", i32 2}
!201 = !{i32 7, !"uwtable", i32 2}
!202 = !{i32 7, !"frame-pointer", i32 2}
!203 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!204 = distinct !DISubprogram(name: "__fizzer_model____VERIFIER_nondet_memory", scope: !205, file: !205, line: 4, type: !206, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !78, retainedNodes: !63)
!205 = !DIFile(filename: "data/models/c/testcomp/nondet.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "949c31f0da7b279f40bfbf3ec7cfdee3")
!206 = !DISubroutineType(types: !207)
!207 = !{null, !143, !208}
!208 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !209, line: 8, baseType: !210)
!209 = !DIFile(filename: "data/models/c/testcomp/nondet.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "fd37181ed1f1cdda8e171f77fdc042bf")
!210 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!211 = !DILocalVariable(name: "mem", arg: 1, scope: !204, file: !205, line: 4, type: !143)
!212 = !DILocation(line: 4, column: 53, scope: !204)
!213 = !DILocalVariable(name: "size", arg: 2, scope: !204, file: !205, line: 4, type: !208)
!214 = !DILocation(line: 4, column: 65, scope: !204)
!215 = !DILocalVariable(name: "p", scope: !204, file: !205, line: 6, type: !81)
!216 = !DILocation(line: 6, column: 20, scope: !204)
!217 = !DILocation(line: 6, column: 40, scope: !204)
!218 = !DILocalVariable(name: "e", scope: !204, file: !205, line: 7, type: !81)
!219 = !DILocation(line: 7, column: 20, scope: !204)
!220 = !DILocation(line: 7, column: 24, scope: !204)
!221 = !DILocation(line: 7, column: 28, scope: !204)
!222 = !DILocation(line: 7, column: 26, scope: !204)
!223 = !DILocation(line: 8, column: 5, scope: !204)
!224 = !DILocation(line: 8, column: 13, scope: !225)
!225 = distinct !DILexicalBlock(scope: !226, file: !205, line: 8, column: 5)
!226 = distinct !DILexicalBlock(scope: !204, file: !205, line: 8, column: 5)
!227 = !DILocation(line: 8, column: 18, scope: !225)
!228 = !DILocation(line: 8, column: 15, scope: !225)
!229 = !DILocation(line: 8, column: 5, scope: !226)
!230 = !DILocation(line: 9, column: 14, scope: !225)
!231 = !DILocation(line: 9, column: 10, scope: !225)
!232 = !DILocation(line: 9, column: 12, scope: !225)
!233 = !DILocation(line: 9, column: 9, scope: !225)
!234 = !DILocation(line: 8, column: 21, scope: !225)
!235 = !DILocation(line: 8, column: 5, scope: !225)
!236 = distinct !{!236, !229, !237, !238}
!237 = !DILocation(line: 9, column: 38, scope: !226)
!238 = !{!"llvm.loop.mustprogress"}
!239 = !DILocation(line: 10, column: 1, scope: !204)
!240 = distinct !DISubprogram(name: "__fizzer_model__getopt_long", scope: !241, file: !241, line: 3, type: !242, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !63)
!241 = !DIFile(filename: "data/models/c/posix/getopt_long.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "de123133f6a530da5006cce09eb75639")
!242 = !DISubroutineType(types: !243)
!243 = !{!6, !6, !244, !73, !246, !254}
!244 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !245, size: 32)
!245 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!246 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !247, size: 32)
!247 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !248)
!248 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "option", file: !249, line: 50, size: 128, elements: !250)
!249 = !DIFile(filename: "/usr/include/bits/getopt_ext.h", directory: "", checksumkind: CSK_MD5, checksum: "3b9516601798e99ca8a1ad9f5208e7ec")
!250 = !{!251, !252, !253, !255}
!251 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !248, file: !249, line: 52, baseType: !73, size: 32)
!252 = !DIDerivedType(tag: DW_TAG_member, name: "has_arg", scope: !248, file: !249, line: 55, baseType: !6, size: 32, offset: 32)
!253 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !248, file: !249, line: 56, baseType: !254, size: 32, offset: 64)
!254 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 32)
!255 = !DIDerivedType(tag: DW_TAG_member, name: "val", scope: !248, file: !249, line: 57, baseType: !6, size: 32, offset: 96)
!256 = !DILocalVariable(name: "argc", arg: 1, scope: !240, file: !241, line: 3, type: !6)
!257 = !DILocation(line: 3, column: 37, scope: !240)
!258 = !DILocalVariable(name: "argv", arg: 2, scope: !240, file: !241, line: 3, type: !244)
!259 = !DILocation(line: 3, column: 56, scope: !240)
!260 = !DILocalVariable(name: "optstring", arg: 3, scope: !240, file: !241, line: 3, type: !73)
!261 = !DILocation(line: 3, column: 76, scope: !240)
!262 = !DILocalVariable(name: "longopts", arg: 4, scope: !240, file: !241, line: 4, type: !246)
!263 = !DILocation(line: 4, column: 54, scope: !240)
!264 = !DILocalVariable(name: "longindex", arg: 5, scope: !240, file: !241, line: 4, type: !254)
!265 = !DILocation(line: 4, column: 69, scope: !240)
!266 = !DILocation(line: 6, column: 9, scope: !267)
!267 = distinct !DILexicalBlock(scope: !240, file: !241, line: 6, column: 9)
!268 = !DILocation(line: 6, column: 35, scope: !267)
!269 = !DILocation(line: 6, column: 32, scope: !267)
!270 = !DILocation(line: 6, column: 9, scope: !240)
!271 = !DILocation(line: 8, column: 9, scope: !272)
!272 = distinct !DILexicalBlock(scope: !267, file: !241, line: 7, column: 5)
!273 = !DILocalVariable(name: "current", scope: !240, file: !241, line: 11, type: !13)
!274 = !DILocation(line: 11, column: 11, scope: !240)
!275 = !DILocation(line: 11, column: 21, scope: !240)
!276 = !DILocation(line: 11, column: 26, scope: !240)
!277 = !DILocation(line: 13, column: 9, scope: !278)
!278 = distinct !DILexicalBlock(scope: !240, file: !241, line: 13, column: 9)
!279 = !DILocation(line: 13, column: 20, scope: !278)
!280 = !DILocation(line: 13, column: 27, scope: !278)
!281 = !DILocation(line: 13, column: 30, scope: !278)
!282 = !DILocation(line: 13, column: 41, scope: !278)
!283 = !DILocation(line: 13, column: 9, scope: !240)
!284 = !DILocation(line: 15, column: 39, scope: !285)
!285 = distinct !DILexicalBlock(scope: !278, file: !241, line: 14, column: 5)
!286 = !DILocation(line: 15, column: 45, scope: !285)
!287 = !DILocation(line: 15, column: 51, scope: !285)
!288 = !DILocation(line: 15, column: 16, scope: !285)
!289 = !DILocation(line: 15, column: 9, scope: !285)
!290 = !DILocalVariable(name: "i", scope: !240, file: !241, line: 18, type: !291)
!291 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !292, line: 8, baseType: !210)
!292 = !DIFile(filename: "data/models/c/posix/getopt_long.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "df33a0efdb11040b8d720c7550c383ff")
!293 = !DILocation(line: 18, column: 12, scope: !240)
!294 = !DILocation(line: 19, column: 5, scope: !240)
!295 = !DILocation(line: 19, column: 12, scope: !240)
!296 = !DILocation(line: 19, column: 21, scope: !240)
!297 = !DILocation(line: 19, column: 24, scope: !240)
!298 = !DILocation(line: 19, column: 29, scope: !240)
!299 = !DILocalVariable(name: "j", scope: !300, file: !241, line: 21, type: !291)
!300 = distinct !DILexicalBlock(scope: !240, file: !241, line: 20, column: 5)
!301 = !DILocation(line: 21, column: 16, scope: !300)
!302 = !DILocalVariable(name: "match", scope: !300, file: !241, line: 22, type: !6)
!303 = !DILocation(line: 22, column: 13, scope: !300)
!304 = !DILocation(line: 24, column: 9, scope: !300)
!305 = !DILocation(line: 24, column: 16, scope: !300)
!306 = !DILocation(line: 24, column: 25, scope: !300)
!307 = !DILocation(line: 24, column: 28, scope: !300)
!308 = !DILocation(line: 24, column: 33, scope: !300)
!309 = !DILocation(line: 24, column: 36, scope: !300)
!310 = !DILocation(line: 24, column: 41, scope: !300)
!311 = !DILocation(line: 24, column: 44, scope: !300)
!312 = !DILocation(line: 24, column: 56, scope: !300)
!313 = !DILocation(line: 24, column: 54, scope: !300)
!314 = !DILocation(line: 24, column: 59, scope: !300)
!315 = !DILocation(line: 0, scope: !300)
!316 = !DILocation(line: 26, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !318, file: !241, line: 26, column: 17)
!318 = distinct !DILexicalBlock(scope: !300, file: !241, line: 25, column: 9)
!319 = !DILocation(line: 26, column: 26, scope: !317)
!320 = !DILocation(line: 26, column: 29, scope: !317)
!321 = !DILocation(line: 26, column: 34, scope: !317)
!322 = !DILocation(line: 26, column: 40, scope: !317)
!323 = !DILocation(line: 26, column: 52, scope: !317)
!324 = !DILocation(line: 26, column: 50, scope: !317)
!325 = !DILocation(line: 26, column: 37, scope: !317)
!326 = !DILocation(line: 26, column: 17, scope: !318)
!327 = !DILocation(line: 28, column: 23, scope: !328)
!328 = distinct !DILexicalBlock(scope: !317, file: !241, line: 27, column: 13)
!329 = !DILocation(line: 29, column: 17, scope: !328)
!330 = !DILocation(line: 31, column: 14, scope: !318)
!331 = distinct !{!331, !304, !332, !238}
!332 = !DILocation(line: 32, column: 9, scope: !300)
!333 = !DILocation(line: 34, column: 13, scope: !334)
!334 = distinct !DILexicalBlock(scope: !300, file: !241, line: 34, column: 13)
!335 = !DILocation(line: 34, column: 19, scope: !334)
!336 = !DILocation(line: 34, column: 22, scope: !334)
!337 = !DILocation(line: 34, column: 31, scope: !334)
!338 = !DILocation(line: 34, column: 34, scope: !334)
!339 = !DILocation(line: 34, column: 39, scope: !334)
!340 = !DILocation(line: 34, column: 42, scope: !334)
!341 = !DILocation(line: 34, column: 47, scope: !334)
!342 = !DILocation(line: 34, column: 50, scope: !334)
!343 = !DILocation(line: 34, column: 62, scope: !334)
!344 = !DILocation(line: 34, column: 60, scope: !334)
!345 = !DILocation(line: 34, column: 65, scope: !334)
!346 = !DILocation(line: 34, column: 13, scope: !300)
!347 = !DILocation(line: 36, column: 17, scope: !348)
!348 = distinct !DILexicalBlock(scope: !349, file: !241, line: 36, column: 17)
!349 = distinct !DILexicalBlock(scope: !334, file: !241, line: 35, column: 9)
!350 = !DILocation(line: 36, column: 27, scope: !348)
!351 = !DILocation(line: 36, column: 17, scope: !349)
!352 = !DILocation(line: 38, column: 35, scope: !353)
!353 = distinct !DILexicalBlock(scope: !348, file: !241, line: 37, column: 13)
!354 = !DILocation(line: 38, column: 18, scope: !353)
!355 = !DILocation(line: 38, column: 28, scope: !353)
!356 = !DILocation(line: 39, column: 13, scope: !353)
!357 = !DILocation(line: 41, column: 17, scope: !358)
!358 = distinct !DILexicalBlock(scope: !349, file: !241, line: 41, column: 17)
!359 = !DILocation(line: 41, column: 26, scope: !358)
!360 = !DILocation(line: 41, column: 29, scope: !358)
!361 = !DILocation(line: 41, column: 37, scope: !358)
!362 = !DILocation(line: 41, column: 17, scope: !349)
!363 = !DILocation(line: 43, column: 21, scope: !364)
!364 = distinct !DILexicalBlock(scope: !365, file: !241, line: 43, column: 21)
!365 = distinct !DILexicalBlock(scope: !358, file: !241, line: 42, column: 13)
!366 = !DILocation(line: 43, column: 44, scope: !364)
!367 = !DILocation(line: 43, column: 50, scope: !364)
!368 = !DILocation(line: 43, column: 48, scope: !364)
!369 = !DILocation(line: 43, column: 21, scope: !365)
!370 = !DILocation(line: 45, column: 46, scope: !371)
!371 = distinct !DILexicalBlock(scope: !364, file: !241, line: 44, column: 17)
!372 = !DILocation(line: 45, column: 51, scope: !371)
!373 = !DILocation(line: 45, column: 74, scope: !371)
!374 = !DILocation(line: 45, column: 44, scope: !371)
!375 = !DILocation(line: 46, column: 44, scope: !371)
!376 = !DILocation(line: 47, column: 17, scope: !371)
!377 = !DILocation(line: 50, column: 44, scope: !378)
!378 = distinct !DILexicalBlock(scope: !364, file: !241, line: 49, column: 17)
!379 = !DILocation(line: 51, column: 43, scope: !378)
!380 = !DILocation(line: 53, column: 13, scope: !365)
!381 = !DILocation(line: 56, column: 40, scope: !382)
!382 = distinct !DILexicalBlock(scope: !358, file: !241, line: 55, column: 13)
!383 = !DILocation(line: 57, column: 39, scope: !382)
!384 = !DILocation(line: 60, column: 17, scope: !385)
!385 = distinct !DILexicalBlock(scope: !349, file: !241, line: 60, column: 17)
!386 = !DILocation(line: 60, column: 26, scope: !385)
!387 = !DILocation(line: 60, column: 29, scope: !385)
!388 = !DILocation(line: 60, column: 34, scope: !385)
!389 = !DILocation(line: 60, column: 17, scope: !349)
!390 = !DILocation(line: 62, column: 37, scope: !391)
!391 = distinct !DILexicalBlock(scope: !385, file: !241, line: 61, column: 13)
!392 = !DILocation(line: 62, column: 46, scope: !391)
!393 = !DILocation(line: 62, column: 49, scope: !391)
!394 = !DILocation(line: 62, column: 18, scope: !391)
!395 = !DILocation(line: 62, column: 27, scope: !391)
!396 = !DILocation(line: 62, column: 30, scope: !391)
!397 = !DILocation(line: 62, column: 35, scope: !391)
!398 = !DILocation(line: 63, column: 17, scope: !391)
!399 = !DILocation(line: 66, column: 20, scope: !349)
!400 = !DILocation(line: 66, column: 29, scope: !349)
!401 = !DILocation(line: 66, column: 32, scope: !349)
!402 = !DILocation(line: 66, column: 13, scope: !349)
!403 = !DILocation(line: 69, column: 10, scope: !300)
!404 = distinct !{!404, !294, !405, !238}
!405 = !DILocation(line: 70, column: 5, scope: !240)
!406 = !DILocation(line: 72, column: 27, scope: !240)
!407 = !DILocation(line: 73, column: 5, scope: !240)
!408 = !DILocation(line: 74, column: 1, scope: !240)
!409 = distinct !DISubprogram(name: "__fizzer_model__getopt", scope: !410, file: !410, line: 2, type: !411, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !86, retainedNodes: !63)
!410 = !DIFile(filename: "data/models/c/posix/getopt.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "f654b476831f33a28b3fae574c027426")
!411 = !DISubroutineType(types: !412)
!412 = !{!6, !6, !244, !73}
!413 = !DILocalVariable(name: "argc", arg: 1, scope: !409, file: !410, line: 2, type: !6)
!414 = !DILocation(line: 2, column: 32, scope: !409)
!415 = !DILocalVariable(name: "argv", arg: 2, scope: !409, file: !410, line: 2, type: !244)
!416 = !DILocation(line: 2, column: 51, scope: !409)
!417 = !DILocalVariable(name: "optstring", arg: 3, scope: !409, file: !410, line: 2, type: !73)
!418 = !DILocation(line: 2, column: 71, scope: !409)
!419 = !DILocation(line: 4, column: 9, scope: !420)
!420 = distinct !DILexicalBlock(scope: !409, file: !410, line: 4, column: 9)
!421 = !DILocation(line: 4, column: 35, scope: !420)
!422 = !DILocation(line: 4, column: 32, scope: !420)
!423 = !DILocation(line: 4, column: 9, scope: !409)
!424 = !DILocation(line: 6, column: 9, scope: !425)
!425 = distinct !DILexicalBlock(scope: !420, file: !410, line: 5, column: 5)
!426 = !DILocalVariable(name: "current", scope: !409, file: !410, line: 9, type: !13)
!427 = !DILocation(line: 9, column: 11, scope: !409)
!428 = !DILocation(line: 9, column: 21, scope: !409)
!429 = !DILocation(line: 9, column: 26, scope: !409)
!430 = !DILocation(line: 11, column: 9, scope: !431)
!431 = distinct !DILexicalBlock(scope: !409, file: !410, line: 11, column: 9)
!432 = !DILocation(line: 11, column: 20, scope: !431)
!433 = !DILocation(line: 11, column: 27, scope: !431)
!434 = !DILocation(line: 11, column: 30, scope: !431)
!435 = !DILocation(line: 11, column: 41, scope: !431)
!436 = !DILocation(line: 11, column: 9, scope: !409)
!437 = !DILocation(line: 13, column: 9, scope: !438)
!438 = distinct !DILexicalBlock(scope: !431, file: !410, line: 12, column: 5)
!439 = !DILocalVariable(name: "opt", scope: !409, file: !410, line: 16, type: !14)
!440 = !DILocation(line: 16, column: 10, scope: !409)
!441 = !DILocation(line: 16, column: 16, scope: !409)
!442 = !DILocalVariable(name: "i", scope: !409, file: !410, line: 17, type: !443)
!443 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !444, line: 8, baseType: !210)
!444 = !DIFile(filename: "data/models/c/posix/getopt.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "e9a8dd2397db46be8d234080af23f4e9")
!445 = !DILocation(line: 17, column: 12, scope: !409)
!446 = !DILocalVariable(name: "found", scope: !409, file: !410, line: 18, type: !6)
!447 = !DILocation(line: 18, column: 9, scope: !409)
!448 = !DILocation(line: 20, column: 5, scope: !409)
!449 = !DILocation(line: 20, column: 12, scope: !409)
!450 = !DILocation(line: 20, column: 22, scope: !409)
!451 = !DILocation(line: 20, column: 25, scope: !409)
!452 = !DILocation(line: 22, column: 13, scope: !453)
!453 = distinct !DILexicalBlock(scope: !454, file: !410, line: 22, column: 13)
!454 = distinct !DILexicalBlock(scope: !409, file: !410, line: 21, column: 5)
!455 = !DILocation(line: 22, column: 23, scope: !453)
!456 = !DILocation(line: 22, column: 29, scope: !453)
!457 = !DILocation(line: 22, column: 26, scope: !453)
!458 = !DILocation(line: 22, column: 13, scope: !454)
!459 = !DILocation(line: 24, column: 19, scope: !460)
!460 = distinct !DILexicalBlock(scope: !453, file: !410, line: 23, column: 9)
!461 = !DILocation(line: 25, column: 13, scope: !460)
!462 = !DILocation(line: 27, column: 10, scope: !454)
!463 = distinct !{!463, !448, !464, !238}
!464 = !DILocation(line: 28, column: 5, scope: !409)
!465 = !DILocation(line: 30, column: 10, scope: !466)
!466 = distinct !DILexicalBlock(scope: !409, file: !410, line: 30, column: 9)
!467 = !DILocation(line: 30, column: 9, scope: !409)
!468 = !DILocation(line: 32, column: 34, scope: !469)
!469 = distinct !DILexicalBlock(scope: !466, file: !410, line: 31, column: 5)
!470 = !DILocation(line: 32, column: 32, scope: !469)
!471 = !DILocation(line: 33, column: 31, scope: !469)
!472 = !DILocation(line: 34, column: 9, scope: !469)
!473 = !DILocation(line: 38, column: 9, scope: !474)
!474 = distinct !DILexicalBlock(scope: !409, file: !410, line: 38, column: 9)
!475 = !DILocation(line: 38, column: 19, scope: !474)
!476 = !DILocation(line: 38, column: 21, scope: !474)
!477 = !DILocation(line: 38, column: 26, scope: !474)
!478 = !DILocation(line: 38, column: 9, scope: !409)
!479 = !DILocation(line: 40, column: 13, scope: !480)
!480 = distinct !DILexicalBlock(scope: !481, file: !410, line: 40, column: 13)
!481 = distinct !DILexicalBlock(scope: !474, file: !410, line: 39, column: 5)
!482 = !DILocation(line: 40, column: 24, scope: !480)
!483 = !DILocation(line: 40, column: 13, scope: !481)
!484 = !DILocation(line: 42, column: 39, scope: !485)
!485 = distinct !DILexicalBlock(scope: !480, file: !410, line: 41, column: 9)
!486 = !DILocation(line: 42, column: 36, scope: !485)
!487 = !DILocation(line: 43, column: 9, scope: !485)
!488 = !DILocation(line: 44, column: 18, scope: !489)
!489 = distinct !DILexicalBlock(scope: !480, file: !410, line: 44, column: 18)
!490 = !DILocation(line: 44, column: 41, scope: !489)
!491 = !DILocation(line: 44, column: 47, scope: !489)
!492 = !DILocation(line: 44, column: 45, scope: !489)
!493 = !DILocation(line: 44, column: 18, scope: !480)
!494 = !DILocation(line: 46, column: 35, scope: !495)
!495 = distinct !DILexicalBlock(scope: !489, file: !410, line: 45, column: 9)
!496 = !DILocation(line: 47, column: 38, scope: !495)
!497 = !DILocation(line: 47, column: 43, scope: !495)
!498 = !DILocation(line: 47, column: 36, scope: !495)
!499 = !DILocation(line: 48, column: 9, scope: !495)
!500 = !DILocation(line: 51, column: 36, scope: !501)
!501 = distinct !DILexicalBlock(scope: !489, file: !410, line: 50, column: 9)
!502 = !DILocation(line: 52, column: 17, scope: !503)
!503 = distinct !DILexicalBlock(scope: !501, file: !410, line: 52, column: 17)
!504 = !DILocation(line: 52, column: 17, scope: !501)
!505 = !DILocation(line: 55, column: 13, scope: !506)
!506 = distinct !DILexicalBlock(scope: !503, file: !410, line: 53, column: 13)
!507 = !DILocation(line: 56, column: 35, scope: !501)
!508 = !DILocation(line: 57, column: 13, scope: !501)
!509 = !DILocation(line: 59, column: 31, scope: !481)
!510 = !DILocation(line: 60, column: 5, scope: !481)
!511 = !DILocation(line: 63, column: 32, scope: !512)
!512 = distinct !DILexicalBlock(scope: !474, file: !410, line: 62, column: 5)
!513 = !DILocation(line: 64, column: 31, scope: !512)
!514 = !DILocation(line: 67, column: 12, scope: !409)
!515 = !DILocation(line: 67, column: 5, scope: !409)
!516 = !DILocation(line: 68, column: 1, scope: !409)
!517 = distinct !DISubprogram(name: "__fizzer_model__atoll", scope: !518, file: !518, line: 2, type: !519, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !88, retainedNodes: !63)
!518 = !DIFile(filename: "data/models/c/std/stdlib/atoll.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "a20eee9a7568d583fd9ee7193391622b")
!519 = !DISubroutineType(types: !520)
!520 = !{!521, !73}
!521 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!522 = !DILocalVariable(name: "nptr", arg: 1, scope: !517, file: !518, line: 2, type: !73)
!523 = !DILocation(line: 2, column: 45, scope: !517)
!524 = !DILocalVariable(name: "result", scope: !517, file: !518, line: 4, type: !521)
!525 = !DILocation(line: 4, column: 15, scope: !517)
!526 = !DILocalVariable(name: "sign", scope: !517, file: !518, line: 5, type: !6)
!527 = !DILocation(line: 5, column: 9, scope: !517)
!528 = !DILocalVariable(name: "i", scope: !517, file: !518, line: 6, type: !529)
!529 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !530, line: 8, baseType: !210)
!530 = !DIFile(filename: "data/models/c/std/stdlib/atoll.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "9741b0e725109815faf588d300e73d9a")
!531 = !DILocation(line: 6, column: 12, scope: !517)
!532 = !DILocation(line: 8, column: 5, scope: !517)
!533 = !DILocation(line: 8, column: 12, scope: !517)
!534 = !DILocation(line: 8, column: 17, scope: !517)
!535 = !DILocation(line: 8, column: 20, scope: !517)
!536 = !DILocation(line: 8, column: 25, scope: !517)
!537 = !DILocation(line: 8, column: 52, scope: !517)
!538 = !DILocation(line: 8, column: 57, scope: !517)
!539 = !DILocation(line: 8, column: 28, scope: !517)
!540 = !DILocation(line: 0, scope: !517)
!541 = !DILocation(line: 10, column: 10, scope: !542)
!542 = distinct !DILexicalBlock(scope: !517, file: !518, line: 9, column: 5)
!543 = distinct !{!543, !532, !544, !238}
!544 = !DILocation(line: 11, column: 5, scope: !517)
!545 = !DILocation(line: 13, column: 9, scope: !546)
!546 = distinct !DILexicalBlock(scope: !517, file: !518, line: 13, column: 9)
!547 = !DILocation(line: 13, column: 14, scope: !546)
!548 = !DILocation(line: 13, column: 17, scope: !546)
!549 = !DILocation(line: 13, column: 9, scope: !517)
!550 = !DILocation(line: 15, column: 10, scope: !551)
!551 = distinct !DILexicalBlock(scope: !546, file: !518, line: 14, column: 5)
!552 = !DILocation(line: 16, column: 5, scope: !551)
!553 = !DILocation(line: 17, column: 14, scope: !554)
!554 = distinct !DILexicalBlock(scope: !546, file: !518, line: 17, column: 14)
!555 = !DILocation(line: 17, column: 19, scope: !554)
!556 = !DILocation(line: 17, column: 22, scope: !554)
!557 = !DILocation(line: 17, column: 14, scope: !546)
!558 = !DILocation(line: 19, column: 14, scope: !559)
!559 = distinct !DILexicalBlock(scope: !554, file: !518, line: 18, column: 5)
!560 = !DILocation(line: 20, column: 10, scope: !559)
!561 = !DILocation(line: 21, column: 5, scope: !559)
!562 = !DILocation(line: 23, column: 5, scope: !517)
!563 = !DILocation(line: 23, column: 12, scope: !517)
!564 = !DILocation(line: 23, column: 17, scope: !517)
!565 = !DILocation(line: 23, column: 20, scope: !517)
!566 = !DILocation(line: 23, column: 25, scope: !517)
!567 = !DILocation(line: 23, column: 52, scope: !517)
!568 = !DILocation(line: 23, column: 57, scope: !517)
!569 = !DILocation(line: 23, column: 28, scope: !517)
!570 = !DILocation(line: 25, column: 18, scope: !571)
!571 = distinct !DILexicalBlock(scope: !517, file: !518, line: 24, column: 5)
!572 = !DILocation(line: 25, column: 25, scope: !571)
!573 = !DILocation(line: 25, column: 33, scope: !571)
!574 = !DILocation(line: 25, column: 38, scope: !571)
!575 = !DILocation(line: 25, column: 41, scope: !571)
!576 = !DILocation(line: 25, column: 32, scope: !571)
!577 = !DILocation(line: 25, column: 30, scope: !571)
!578 = !DILocation(line: 25, column: 16, scope: !571)
!579 = !DILocation(line: 26, column: 10, scope: !571)
!580 = distinct !{!580, !562, !581, !238}
!581 = !DILocation(line: 27, column: 5, scope: !517)
!582 = !DILocation(line: 29, column: 12, scope: !517)
!583 = !DILocation(line: 29, column: 19, scope: !517)
!584 = !DILocation(line: 29, column: 17, scope: !517)
!585 = !DILocation(line: 29, column: 5, scope: !517)
!586 = distinct !DISubprogram(name: "__fizzer_model__strtod", scope: !587, file: !587, line: 2, type: !588, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !90, retainedNodes: !63)
!587 = !DIFile(filename: "data/models/c/std/stdlib/strtod.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "8af3db33fabf3d592277f51247d76438")
!588 = !DISubroutineType(types: !589)
!589 = !{!93, !73, !590}
!590 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 32)
!591 = !DILocalVariable(name: "nptr", arg: 1, scope: !586, file: !587, line: 2, type: !73)
!592 = !DILocation(line: 2, column: 43, scope: !586)
!593 = !DILocalVariable(name: "endptr", arg: 2, scope: !586, file: !587, line: 2, type: !590)
!594 = !DILocation(line: 2, column: 56, scope: !586)
!595 = !DILocalVariable(name: "result", scope: !586, file: !587, line: 4, type: !93)
!596 = !DILocation(line: 4, column: 12, scope: !586)
!597 = !DILocalVariable(name: "fraction", scope: !586, file: !587, line: 5, type: !93)
!598 = !DILocation(line: 5, column: 12, scope: !586)
!599 = !DILocalVariable(name: "sign", scope: !586, file: !587, line: 6, type: !6)
!600 = !DILocation(line: 6, column: 9, scope: !586)
!601 = !DILocalVariable(name: "frac_div", scope: !586, file: !587, line: 7, type: !6)
!602 = !DILocation(line: 7, column: 9, scope: !586)
!603 = !DILocalVariable(name: "exp_sign", scope: !586, file: !587, line: 8, type: !6)
!604 = !DILocation(line: 8, column: 9, scope: !586)
!605 = !DILocalVariable(name: "exponent", scope: !586, file: !587, line: 9, type: !6)
!606 = !DILocation(line: 9, column: 9, scope: !586)
!607 = !DILocalVariable(name: "i", scope: !586, file: !587, line: 10, type: !608)
!608 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !609, line: 8, baseType: !210)
!609 = !DIFile(filename: "data/models/c/std/stdlib/strtod.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "6a00107a07643da7bae7e93112654d20")
!610 = !DILocation(line: 10, column: 12, scope: !586)
!611 = !DILocation(line: 13, column: 5, scope: !586)
!612 = !DILocation(line: 13, column: 12, scope: !586)
!613 = !DILocation(line: 13, column: 17, scope: !586)
!614 = !DILocation(line: 13, column: 20, scope: !586)
!615 = !DILocation(line: 13, column: 25, scope: !586)
!616 = !DILocation(line: 13, column: 52, scope: !586)
!617 = !DILocation(line: 13, column: 57, scope: !586)
!618 = !DILocation(line: 13, column: 28, scope: !586)
!619 = !DILocation(line: 0, scope: !586)
!620 = !DILocation(line: 15, column: 10, scope: !621)
!621 = distinct !DILexicalBlock(scope: !586, file: !587, line: 14, column: 5)
!622 = distinct !{!622, !611, !623, !238}
!623 = !DILocation(line: 16, column: 5, scope: !586)
!624 = !DILocation(line: 19, column: 9, scope: !625)
!625 = distinct !DILexicalBlock(scope: !586, file: !587, line: 19, column: 9)
!626 = !DILocation(line: 19, column: 14, scope: !625)
!627 = !DILocation(line: 19, column: 17, scope: !625)
!628 = !DILocation(line: 19, column: 9, scope: !586)
!629 = !DILocation(line: 21, column: 10, scope: !630)
!630 = distinct !DILexicalBlock(scope: !625, file: !587, line: 20, column: 5)
!631 = !DILocation(line: 22, column: 5, scope: !630)
!632 = !DILocation(line: 23, column: 14, scope: !633)
!633 = distinct !DILexicalBlock(scope: !625, file: !587, line: 23, column: 14)
!634 = !DILocation(line: 23, column: 19, scope: !633)
!635 = !DILocation(line: 23, column: 22, scope: !633)
!636 = !DILocation(line: 23, column: 14, scope: !625)
!637 = !DILocation(line: 25, column: 14, scope: !638)
!638 = distinct !DILexicalBlock(scope: !633, file: !587, line: 24, column: 5)
!639 = !DILocation(line: 26, column: 10, scope: !638)
!640 = !DILocation(line: 27, column: 5, scope: !638)
!641 = !DILocation(line: 30, column: 5, scope: !586)
!642 = !DILocation(line: 30, column: 12, scope: !586)
!643 = !DILocation(line: 30, column: 17, scope: !586)
!644 = !DILocation(line: 30, column: 20, scope: !586)
!645 = !DILocation(line: 30, column: 25, scope: !586)
!646 = !DILocation(line: 30, column: 52, scope: !586)
!647 = !DILocation(line: 30, column: 57, scope: !586)
!648 = !DILocation(line: 30, column: 28, scope: !586)
!649 = !DILocation(line: 32, column: 18, scope: !650)
!650 = distinct !DILexicalBlock(scope: !586, file: !587, line: 31, column: 5)
!651 = !DILocation(line: 32, column: 43, scope: !650)
!652 = !DILocation(line: 32, column: 48, scope: !650)
!653 = !DILocation(line: 32, column: 51, scope: !650)
!654 = !DILocation(line: 32, column: 34, scope: !650)
!655 = !DILocation(line: 32, column: 32, scope: !650)
!656 = !DILocation(line: 32, column: 16, scope: !650)
!657 = !DILocation(line: 33, column: 10, scope: !650)
!658 = distinct !{!658, !641, !659, !238}
!659 = !DILocation(line: 34, column: 5, scope: !586)
!660 = !DILocation(line: 37, column: 9, scope: !661)
!661 = distinct !DILexicalBlock(scope: !586, file: !587, line: 37, column: 9)
!662 = !DILocation(line: 37, column: 14, scope: !661)
!663 = !DILocation(line: 37, column: 17, scope: !661)
!664 = !DILocation(line: 37, column: 9, scope: !586)
!665 = !DILocation(line: 39, column: 10, scope: !666)
!666 = distinct !DILexicalBlock(scope: !661, file: !587, line: 38, column: 5)
!667 = !DILocation(line: 40, column: 9, scope: !666)
!668 = !DILocation(line: 40, column: 16, scope: !666)
!669 = !DILocation(line: 40, column: 21, scope: !666)
!670 = !DILocation(line: 40, column: 24, scope: !666)
!671 = !DILocation(line: 40, column: 29, scope: !666)
!672 = !DILocation(line: 40, column: 56, scope: !666)
!673 = !DILocation(line: 40, column: 61, scope: !666)
!674 = !DILocation(line: 40, column: 32, scope: !666)
!675 = !DILocation(line: 0, scope: !666)
!676 = !DILocation(line: 42, column: 24, scope: !677)
!677 = distinct !DILexicalBlock(scope: !666, file: !587, line: 41, column: 9)
!678 = !DILocation(line: 42, column: 51, scope: !677)
!679 = !DILocation(line: 42, column: 56, scope: !677)
!680 = !DILocation(line: 42, column: 59, scope: !677)
!681 = !DILocation(line: 42, column: 42, scope: !677)
!682 = !DILocation(line: 42, column: 40, scope: !677)
!683 = !DILocation(line: 42, column: 22, scope: !677)
!684 = !DILocation(line: 43, column: 24, scope: !677)
!685 = !DILocation(line: 43, column: 33, scope: !677)
!686 = !DILocation(line: 43, column: 22, scope: !677)
!687 = !DILocation(line: 44, column: 14, scope: !677)
!688 = distinct !{!688, !667, !689, !238}
!689 = !DILocation(line: 45, column: 9, scope: !666)
!690 = !DILocation(line: 46, column: 18, scope: !666)
!691 = !DILocation(line: 46, column: 27, scope: !666)
!692 = !DILocation(line: 46, column: 46, scope: !666)
!693 = !DILocation(line: 46, column: 38, scope: !666)
!694 = !DILocation(line: 46, column: 36, scope: !666)
!695 = !DILocation(line: 46, column: 25, scope: !666)
!696 = !DILocation(line: 46, column: 16, scope: !666)
!697 = !DILocation(line: 47, column: 5, scope: !666)
!698 = !DILocation(line: 50, column: 9, scope: !699)
!699 = distinct !DILexicalBlock(scope: !586, file: !587, line: 50, column: 9)
!700 = !DILocation(line: 50, column: 14, scope: !699)
!701 = !DILocation(line: 50, column: 17, scope: !699)
!702 = !DILocation(line: 50, column: 24, scope: !699)
!703 = !DILocation(line: 50, column: 27, scope: !699)
!704 = !DILocation(line: 50, column: 32, scope: !699)
!705 = !DILocation(line: 50, column: 35, scope: !699)
!706 = !DILocation(line: 50, column: 9, scope: !586)
!707 = !DILocation(line: 52, column: 10, scope: !708)
!708 = distinct !DILexicalBlock(scope: !699, file: !587, line: 51, column: 5)
!709 = !DILocation(line: 54, column: 13, scope: !710)
!710 = distinct !DILexicalBlock(scope: !708, file: !587, line: 54, column: 13)
!711 = !DILocation(line: 54, column: 18, scope: !710)
!712 = !DILocation(line: 54, column: 21, scope: !710)
!713 = !DILocation(line: 54, column: 13, scope: !708)
!714 = !DILocation(line: 56, column: 14, scope: !715)
!715 = distinct !DILexicalBlock(scope: !710, file: !587, line: 55, column: 9)
!716 = !DILocation(line: 57, column: 9, scope: !715)
!717 = !DILocation(line: 58, column: 18, scope: !718)
!718 = distinct !DILexicalBlock(scope: !710, file: !587, line: 58, column: 18)
!719 = !DILocation(line: 58, column: 23, scope: !718)
!720 = !DILocation(line: 58, column: 26, scope: !718)
!721 = !DILocation(line: 58, column: 18, scope: !710)
!722 = !DILocation(line: 60, column: 22, scope: !723)
!723 = distinct !DILexicalBlock(scope: !718, file: !587, line: 59, column: 9)
!724 = !DILocation(line: 61, column: 14, scope: !723)
!725 = !DILocation(line: 62, column: 9, scope: !723)
!726 = !DILocation(line: 64, column: 9, scope: !708)
!727 = !DILocation(line: 64, column: 16, scope: !708)
!728 = !DILocation(line: 64, column: 21, scope: !708)
!729 = !DILocation(line: 64, column: 24, scope: !708)
!730 = !DILocation(line: 64, column: 29, scope: !708)
!731 = !DILocation(line: 64, column: 56, scope: !708)
!732 = !DILocation(line: 64, column: 61, scope: !708)
!733 = !DILocation(line: 64, column: 32, scope: !708)
!734 = !DILocation(line: 0, scope: !708)
!735 = !DILocation(line: 66, column: 24, scope: !736)
!736 = distinct !DILexicalBlock(scope: !708, file: !587, line: 65, column: 9)
!737 = !DILocation(line: 66, column: 33, scope: !736)
!738 = !DILocation(line: 66, column: 41, scope: !736)
!739 = !DILocation(line: 66, column: 46, scope: !736)
!740 = !DILocation(line: 66, column: 49, scope: !736)
!741 = !DILocation(line: 66, column: 38, scope: !736)
!742 = !DILocation(line: 66, column: 22, scope: !736)
!743 = !DILocation(line: 67, column: 14, scope: !736)
!744 = distinct !{!744, !726, !745, !238}
!745 = !DILocation(line: 68, column: 9, scope: !708)
!746 = !DILocation(line: 69, column: 5, scope: !708)
!747 = !DILocation(line: 71, column: 9, scope: !748)
!748 = distinct !DILexicalBlock(scope: !586, file: !587, line: 71, column: 9)
!749 = !DILocation(line: 71, column: 16, scope: !748)
!750 = !DILocation(line: 71, column: 9, scope: !586)
!751 = !DILocation(line: 73, column: 28, scope: !752)
!752 = distinct !DILexicalBlock(scope: !748, file: !587, line: 72, column: 5)
!753 = !DILocation(line: 73, column: 35, scope: !752)
!754 = !DILocation(line: 73, column: 33, scope: !752)
!755 = !DILocation(line: 73, column: 10, scope: !752)
!756 = !DILocation(line: 73, column: 17, scope: !752)
!757 = !DILocation(line: 74, column: 5, scope: !752)
!758 = !DILocalVariable(name: "exp_multiplier", scope: !586, file: !587, line: 77, type: !93)
!759 = !DILocation(line: 77, column: 12, scope: !586)
!760 = !DILocalVariable(name: "j", scope: !761, file: !587, line: 78, type: !6)
!761 = distinct !DILexicalBlock(scope: !586, file: !587, line: 78, column: 5)
!762 = !DILocation(line: 78, column: 14, scope: !761)
!763 = !DILocation(line: 78, column: 10, scope: !761)
!764 = !DILocation(line: 78, column: 21, scope: !765)
!765 = distinct !DILexicalBlock(scope: !761, file: !587, line: 78, column: 5)
!766 = !DILocation(line: 78, column: 25, scope: !765)
!767 = !DILocation(line: 78, column: 23, scope: !765)
!768 = !DILocation(line: 78, column: 5, scope: !761)
!769 = !DILocation(line: 80, column: 26, scope: !770)
!770 = distinct !DILexicalBlock(scope: !765, file: !587, line: 79, column: 5)
!771 = !DILocation(line: 80, column: 41, scope: !770)
!772 = !DILocation(line: 80, column: 24, scope: !770)
!773 = !DILocation(line: 81, column: 5, scope: !770)
!774 = !DILocation(line: 78, column: 36, scope: !765)
!775 = !DILocation(line: 78, column: 5, scope: !765)
!776 = distinct !{!776, !768, !777, !238}
!777 = !DILocation(line: 81, column: 5, scope: !761)
!778 = !DILocation(line: 83, column: 9, scope: !779)
!779 = distinct !DILexicalBlock(scope: !586, file: !587, line: 83, column: 9)
!780 = !DILocation(line: 83, column: 18, scope: !779)
!781 = !DILocation(line: 83, column: 9, scope: !586)
!782 = !DILocation(line: 85, column: 18, scope: !783)
!783 = distinct !DILexicalBlock(scope: !779, file: !587, line: 84, column: 5)
!784 = !DILocation(line: 85, column: 27, scope: !783)
!785 = !DILocation(line: 85, column: 25, scope: !783)
!786 = !DILocation(line: 85, column: 16, scope: !783)
!787 = !DILocation(line: 86, column: 5, scope: !783)
!788 = !DILocation(line: 89, column: 18, scope: !789)
!789 = distinct !DILexicalBlock(scope: !779, file: !587, line: 88, column: 5)
!790 = !DILocation(line: 89, column: 27, scope: !789)
!791 = !DILocation(line: 89, column: 25, scope: !789)
!792 = !DILocation(line: 89, column: 16, scope: !789)
!793 = !DILocation(line: 92, column: 12, scope: !586)
!794 = !DILocation(line: 92, column: 19, scope: !586)
!795 = !DILocation(line: 92, column: 17, scope: !586)
!796 = !DILocation(line: 92, column: 5, scope: !586)
!797 = distinct !DISubprogram(name: "__fizzer_model__abs", scope: !798, file: !798, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !94, retainedNodes: !63)
!798 = !DIFile(filename: "data/models/c/std/stdlib/abs.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "5dc98c96c5261907ed11f631ce472103")
!799 = !DISubroutineType(types: !800)
!800 = !{!6, !6}
!801 = !DILocalVariable(name: "x", arg: 1, scope: !797, file: !798, line: 2, type: !6)
!802 = !DILocation(line: 2, column: 29, scope: !797)
!803 = !DILocation(line: 4, column: 9, scope: !804)
!804 = distinct !DILexicalBlock(scope: !797, file: !798, line: 4, column: 9)
!805 = !DILocation(line: 4, column: 11, scope: !804)
!806 = !DILocation(line: 4, column: 9, scope: !797)
!807 = !DILocation(line: 5, column: 17, scope: !804)
!808 = !DILocation(line: 5, column: 16, scope: !804)
!809 = !DILocation(line: 5, column: 9, scope: !804)
!810 = !DILocation(line: 7, column: 16, scope: !804)
!811 = !DILocation(line: 7, column: 9, scope: !804)
!812 = !DILocation(line: 8, column: 1, scope: !797)
!813 = distinct !DISubprogram(name: "__fizzer_model__labs", scope: !814, file: !814, line: 2, type: !815, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !96, retainedNodes: !63)
!814 = !DIFile(filename: "data/models/c/std/stdlib/labs.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "d0625b0698f9d1196d0b119b4fc84b2d")
!815 = !DISubroutineType(types: !816)
!816 = !{!817, !817}
!817 = !DIBasicType(name: "long", size: 32, encoding: DW_ATE_signed)
!818 = !DILocalVariable(name: "x", arg: 1, scope: !813, file: !814, line: 2, type: !817)
!819 = !DILocation(line: 2, column: 40, scope: !813)
!820 = !DILocation(line: 4, column: 9, scope: !821)
!821 = distinct !DILexicalBlock(scope: !813, file: !814, line: 4, column: 9)
!822 = !DILocation(line: 4, column: 11, scope: !821)
!823 = !DILocation(line: 4, column: 9, scope: !813)
!824 = !DILocation(line: 5, column: 17, scope: !821)
!825 = !DILocation(line: 5, column: 16, scope: !821)
!826 = !DILocation(line: 5, column: 9, scope: !821)
!827 = !DILocation(line: 7, column: 16, scope: !821)
!828 = !DILocation(line: 7, column: 9, scope: !821)
!829 = !DILocation(line: 8, column: 1, scope: !813)
!830 = distinct !DISubprogram(name: "__fizzer_model__llabs", scope: !831, file: !831, line: 2, type: !832, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !98, retainedNodes: !63)
!831 = !DIFile(filename: "data/models/c/std/stdlib/llabs.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "8095d5dd9527583f176d5d9342463eec")
!832 = !DISubroutineType(types: !833)
!833 = !{!521, !521}
!834 = !DILocalVariable(name: "x", arg: 1, scope: !830, file: !831, line: 2, type: !521)
!835 = !DILocation(line: 2, column: 51, scope: !830)
!836 = !DILocation(line: 4, column: 9, scope: !837)
!837 = distinct !DILexicalBlock(scope: !830, file: !831, line: 4, column: 9)
!838 = !DILocation(line: 4, column: 11, scope: !837)
!839 = !DILocation(line: 4, column: 9, scope: !830)
!840 = !DILocation(line: 5, column: 17, scope: !837)
!841 = !DILocation(line: 5, column: 16, scope: !837)
!842 = !DILocation(line: 5, column: 9, scope: !837)
!843 = !DILocation(line: 7, column: 16, scope: !837)
!844 = !DILocation(line: 7, column: 9, scope: !837)
!845 = !DILocation(line: 8, column: 1, scope: !830)
!846 = distinct !DISubprogram(name: "__fizzer_model__strtol", scope: !847, file: !847, line: 2, type: !848, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !63)
!847 = !DIFile(filename: "data/models/c/std/stdlib/strtol.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "7bd701710373e339d62a1da5b0831766")
!848 = !DISubroutineType(types: !849)
!849 = !{!817, !73, !590, !6}
!850 = !DILocalVariable(name: "nptr", arg: 1, scope: !846, file: !847, line: 2, type: !73)
!851 = !DILocation(line: 2, column: 41, scope: !846)
!852 = !DILocalVariable(name: "endptr", arg: 2, scope: !846, file: !847, line: 2, type: !590)
!853 = !DILocation(line: 2, column: 54, scope: !846)
!854 = !DILocalVariable(name: "base", arg: 3, scope: !846, file: !847, line: 2, type: !6)
!855 = !DILocation(line: 2, column: 66, scope: !846)
!856 = !DILocalVariable(name: "result", scope: !846, file: !847, line: 4, type: !817)
!857 = !DILocation(line: 4, column: 10, scope: !846)
!858 = !DILocalVariable(name: "sign", scope: !846, file: !847, line: 5, type: !6)
!859 = !DILocation(line: 5, column: 9, scope: !846)
!860 = !DILocalVariable(name: "i", scope: !846, file: !847, line: 6, type: !861)
!861 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !862, line: 8, baseType: !210)
!862 = !DIFile(filename: "data/models/c/std/stdlib/strtol.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "47e12629a1c37bef079652283e66cf67")
!863 = !DILocation(line: 6, column: 12, scope: !846)
!864 = !DILocation(line: 8, column: 9, scope: !865)
!865 = distinct !DILexicalBlock(scope: !846, file: !847, line: 8, column: 9)
!866 = !DILocation(line: 8, column: 14, scope: !865)
!867 = !DILocation(line: 8, column: 9, scope: !846)
!868 = !DILocation(line: 11, column: 13, scope: !869)
!869 = distinct !DILexicalBlock(scope: !870, file: !847, line: 11, column: 13)
!870 = distinct !DILexicalBlock(scope: !865, file: !847, line: 9, column: 5)
!871 = !DILocation(line: 11, column: 20, scope: !869)
!872 = !DILocation(line: 11, column: 13, scope: !870)
!873 = !DILocation(line: 13, column: 31, scope: !874)
!874 = distinct !DILexicalBlock(scope: !869, file: !847, line: 12, column: 9)
!875 = !DILocation(line: 13, column: 14, scope: !874)
!876 = !DILocation(line: 13, column: 21, scope: !874)
!877 = !DILocation(line: 14, column: 9, scope: !874)
!878 = !DILocation(line: 15, column: 9, scope: !870)
!879 = !DILocation(line: 18, column: 5, scope: !846)
!880 = !DILocation(line: 18, column: 12, scope: !846)
!881 = !DILocation(line: 18, column: 17, scope: !846)
!882 = !DILocation(line: 18, column: 20, scope: !846)
!883 = !DILocation(line: 18, column: 25, scope: !846)
!884 = !DILocation(line: 18, column: 52, scope: !846)
!885 = !DILocation(line: 18, column: 57, scope: !846)
!886 = !DILocation(line: 18, column: 28, scope: !846)
!887 = !DILocation(line: 0, scope: !846)
!888 = !DILocation(line: 20, column: 10, scope: !889)
!889 = distinct !DILexicalBlock(scope: !846, file: !847, line: 19, column: 5)
!890 = distinct !{!890, !879, !891, !238}
!891 = !DILocation(line: 21, column: 5, scope: !846)
!892 = !DILocation(line: 23, column: 9, scope: !893)
!893 = distinct !DILexicalBlock(scope: !846, file: !847, line: 23, column: 9)
!894 = !DILocation(line: 23, column: 14, scope: !893)
!895 = !DILocation(line: 23, column: 17, scope: !893)
!896 = !DILocation(line: 23, column: 9, scope: !846)
!897 = !DILocation(line: 25, column: 10, scope: !898)
!898 = distinct !DILexicalBlock(scope: !893, file: !847, line: 24, column: 5)
!899 = !DILocation(line: 26, column: 5, scope: !898)
!900 = !DILocation(line: 27, column: 14, scope: !901)
!901 = distinct !DILexicalBlock(scope: !893, file: !847, line: 27, column: 14)
!902 = !DILocation(line: 27, column: 19, scope: !901)
!903 = !DILocation(line: 27, column: 22, scope: !901)
!904 = !DILocation(line: 27, column: 14, scope: !893)
!905 = !DILocation(line: 29, column: 14, scope: !906)
!906 = distinct !DILexicalBlock(scope: !901, file: !847, line: 28, column: 5)
!907 = !DILocation(line: 30, column: 10, scope: !906)
!908 = !DILocation(line: 31, column: 5, scope: !906)
!909 = !DILocalVariable(name: "start", scope: !846, file: !847, line: 33, type: !861)
!910 = !DILocation(line: 33, column: 12, scope: !846)
!911 = !DILocation(line: 33, column: 20, scope: !846)
!912 = !DILocation(line: 35, column: 5, scope: !846)
!913 = !DILocation(line: 35, column: 12, scope: !846)
!914 = !DILocation(line: 35, column: 17, scope: !846)
!915 = !DILocation(line: 35, column: 20, scope: !846)
!916 = !DILocation(line: 35, column: 25, scope: !846)
!917 = !DILocation(line: 35, column: 52, scope: !846)
!918 = !DILocation(line: 35, column: 57, scope: !846)
!919 = !DILocation(line: 35, column: 28, scope: !846)
!920 = !DILocation(line: 37, column: 18, scope: !921)
!921 = distinct !DILexicalBlock(scope: !846, file: !847, line: 36, column: 5)
!922 = !DILocation(line: 37, column: 25, scope: !921)
!923 = !DILocation(line: 37, column: 33, scope: !921)
!924 = !DILocation(line: 37, column: 38, scope: !921)
!925 = !DILocation(line: 37, column: 41, scope: !921)
!926 = !DILocation(line: 37, column: 30, scope: !921)
!927 = !DILocation(line: 37, column: 16, scope: !921)
!928 = !DILocation(line: 38, column: 10, scope: !921)
!929 = distinct !{!929, !912, !930, !238}
!930 = !DILocation(line: 39, column: 5, scope: !846)
!931 = !DILocation(line: 41, column: 9, scope: !932)
!932 = distinct !DILexicalBlock(scope: !846, file: !847, line: 41, column: 9)
!933 = !DILocation(line: 41, column: 16, scope: !932)
!934 = !DILocation(line: 41, column: 9, scope: !846)
!935 = !DILocation(line: 43, column: 28, scope: !936)
!936 = distinct !DILexicalBlock(scope: !932, file: !847, line: 42, column: 5)
!937 = !DILocation(line: 43, column: 35, scope: !936)
!938 = !DILocation(line: 43, column: 33, scope: !936)
!939 = !DILocation(line: 43, column: 10, scope: !936)
!940 = !DILocation(line: 43, column: 17, scope: !936)
!941 = !DILocation(line: 44, column: 5, scope: !936)
!942 = !DILocation(line: 46, column: 12, scope: !846)
!943 = !DILocation(line: 46, column: 19, scope: !846)
!944 = !DILocation(line: 46, column: 17, scope: !846)
!945 = !DILocation(line: 46, column: 5, scope: !846)
!946 = !DILocation(line: 47, column: 1, scope: !846)
!947 = distinct !DISubprogram(name: "__fizzer_model__atol", scope: !948, file: !948, line: 2, type: !949, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !103, retainedNodes: !63)
!948 = !DIFile(filename: "data/models/c/std/stdlib/atol.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "130864a3e56f877c17dbd6cd172158db")
!949 = !DISubroutineType(types: !950)
!950 = !{!817, !73}
!951 = !DILocalVariable(name: "nptr", arg: 1, scope: !947, file: !948, line: 2, type: !73)
!952 = !DILocation(line: 2, column: 39, scope: !947)
!953 = !DILocalVariable(name: "result", scope: !947, file: !948, line: 4, type: !817)
!954 = !DILocation(line: 4, column: 10, scope: !947)
!955 = !DILocalVariable(name: "sign", scope: !947, file: !948, line: 5, type: !6)
!956 = !DILocation(line: 5, column: 9, scope: !947)
!957 = !DILocalVariable(name: "i", scope: !947, file: !948, line: 6, type: !958)
!958 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !959, line: 8, baseType: !210)
!959 = !DIFile(filename: "data/models/c/std/stdlib/atol.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "1fd40bbb4fabb448cf5666fb2ad7f378")
!960 = !DILocation(line: 6, column: 12, scope: !947)
!961 = !DILocation(line: 8, column: 5, scope: !947)
!962 = !DILocation(line: 8, column: 12, scope: !947)
!963 = !DILocation(line: 8, column: 17, scope: !947)
!964 = !DILocation(line: 8, column: 20, scope: !947)
!965 = !DILocation(line: 8, column: 25, scope: !947)
!966 = !DILocation(line: 8, column: 52, scope: !947)
!967 = !DILocation(line: 8, column: 57, scope: !947)
!968 = !DILocation(line: 8, column: 28, scope: !947)
!969 = !DILocation(line: 0, scope: !947)
!970 = !DILocation(line: 10, column: 10, scope: !971)
!971 = distinct !DILexicalBlock(scope: !947, file: !948, line: 9, column: 5)
!972 = distinct !{!972, !961, !973, !238}
!973 = !DILocation(line: 11, column: 5, scope: !947)
!974 = !DILocation(line: 13, column: 9, scope: !975)
!975 = distinct !DILexicalBlock(scope: !947, file: !948, line: 13, column: 9)
!976 = !DILocation(line: 13, column: 14, scope: !975)
!977 = !DILocation(line: 13, column: 17, scope: !975)
!978 = !DILocation(line: 13, column: 9, scope: !947)
!979 = !DILocation(line: 15, column: 10, scope: !980)
!980 = distinct !DILexicalBlock(scope: !975, file: !948, line: 14, column: 5)
!981 = !DILocation(line: 16, column: 5, scope: !980)
!982 = !DILocation(line: 17, column: 14, scope: !983)
!983 = distinct !DILexicalBlock(scope: !975, file: !948, line: 17, column: 14)
!984 = !DILocation(line: 17, column: 19, scope: !983)
!985 = !DILocation(line: 17, column: 22, scope: !983)
!986 = !DILocation(line: 17, column: 14, scope: !975)
!987 = !DILocation(line: 19, column: 14, scope: !988)
!988 = distinct !DILexicalBlock(scope: !983, file: !948, line: 18, column: 5)
!989 = !DILocation(line: 20, column: 10, scope: !988)
!990 = !DILocation(line: 21, column: 5, scope: !988)
!991 = !DILocation(line: 23, column: 5, scope: !947)
!992 = !DILocation(line: 23, column: 12, scope: !947)
!993 = !DILocation(line: 23, column: 17, scope: !947)
!994 = !DILocation(line: 23, column: 20, scope: !947)
!995 = !DILocation(line: 23, column: 25, scope: !947)
!996 = !DILocation(line: 23, column: 52, scope: !947)
!997 = !DILocation(line: 23, column: 57, scope: !947)
!998 = !DILocation(line: 23, column: 28, scope: !947)
!999 = !DILocation(line: 25, column: 18, scope: !1000)
!1000 = distinct !DILexicalBlock(scope: !947, file: !948, line: 24, column: 5)
!1001 = !DILocation(line: 25, column: 25, scope: !1000)
!1002 = !DILocation(line: 25, column: 33, scope: !1000)
!1003 = !DILocation(line: 25, column: 38, scope: !1000)
!1004 = !DILocation(line: 25, column: 41, scope: !1000)
!1005 = !DILocation(line: 25, column: 30, scope: !1000)
!1006 = !DILocation(line: 25, column: 16, scope: !1000)
!1007 = !DILocation(line: 26, column: 10, scope: !1000)
!1008 = distinct !{!1008, !991, !1009, !238}
!1009 = !DILocation(line: 27, column: 5, scope: !947)
!1010 = !DILocation(line: 29, column: 12, scope: !947)
!1011 = !DILocation(line: 29, column: 19, scope: !947)
!1012 = !DILocation(line: 29, column: 17, scope: !947)
!1013 = !DILocation(line: 29, column: 5, scope: !947)
!1014 = distinct !DISubprogram(name: "__fizzer_model__strtoul", scope: !1015, file: !1015, line: 2, type: !1016, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !105, retainedNodes: !63)
!1015 = !DIFile(filename: "data/models/c/std/stdlib/strtoul.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "edaf3dbca4ae2e5ae7dd393d65e176da")
!1016 = !DISubroutineType(types: !1017)
!1017 = !{!1018, !73, !590, !6}
!1018 = !DIBasicType(name: "unsigned long", size: 32, encoding: DW_ATE_unsigned)
!1019 = !DILocalVariable(name: "nptr", arg: 1, scope: !1014, file: !1015, line: 2, type: !73)
!1020 = !DILocation(line: 2, column: 51, scope: !1014)
!1021 = !DILocalVariable(name: "endptr", arg: 2, scope: !1014, file: !1015, line: 2, type: !590)
!1022 = !DILocation(line: 2, column: 64, scope: !1014)
!1023 = !DILocalVariable(name: "base", arg: 3, scope: !1014, file: !1015, line: 2, type: !6)
!1024 = !DILocation(line: 2, column: 76, scope: !1014)
!1025 = !DILocalVariable(name: "result", scope: !1014, file: !1015, line: 4, type: !1018)
!1026 = !DILocation(line: 4, column: 19, scope: !1014)
!1027 = !DILocalVariable(name: "i", scope: !1014, file: !1015, line: 5, type: !1028)
!1028 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1029, line: 8, baseType: !210)
!1029 = !DIFile(filename: "data/models/c/std/stdlib/strtoul.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "34874f151f8ea8334fcbf34c096cdb20")
!1030 = !DILocation(line: 5, column: 12, scope: !1014)
!1031 = !DILocation(line: 7, column: 9, scope: !1032)
!1032 = distinct !DILexicalBlock(scope: !1014, file: !1015, line: 7, column: 9)
!1033 = !DILocation(line: 7, column: 14, scope: !1032)
!1034 = !DILocation(line: 7, column: 9, scope: !1014)
!1035 = !DILocation(line: 9, column: 13, scope: !1036)
!1036 = distinct !DILexicalBlock(scope: !1037, file: !1015, line: 9, column: 13)
!1037 = distinct !DILexicalBlock(scope: !1032, file: !1015, line: 8, column: 5)
!1038 = !DILocation(line: 9, column: 20, scope: !1036)
!1039 = !DILocation(line: 9, column: 13, scope: !1037)
!1040 = !DILocation(line: 11, column: 31, scope: !1041)
!1041 = distinct !DILexicalBlock(scope: !1036, file: !1015, line: 10, column: 9)
!1042 = !DILocation(line: 11, column: 14, scope: !1041)
!1043 = !DILocation(line: 11, column: 21, scope: !1041)
!1044 = !DILocation(line: 12, column: 9, scope: !1041)
!1045 = !DILocation(line: 13, column: 9, scope: !1037)
!1046 = !DILocation(line: 16, column: 5, scope: !1014)
!1047 = !DILocation(line: 16, column: 12, scope: !1014)
!1048 = !DILocation(line: 16, column: 17, scope: !1014)
!1049 = !DILocation(line: 16, column: 20, scope: !1014)
!1050 = !DILocation(line: 16, column: 25, scope: !1014)
!1051 = !DILocation(line: 16, column: 52, scope: !1014)
!1052 = !DILocation(line: 16, column: 57, scope: !1014)
!1053 = !DILocation(line: 16, column: 28, scope: !1014)
!1054 = !DILocation(line: 0, scope: !1014)
!1055 = !DILocation(line: 18, column: 10, scope: !1056)
!1056 = distinct !DILexicalBlock(scope: !1014, file: !1015, line: 17, column: 5)
!1057 = distinct !{!1057, !1046, !1058, !238}
!1058 = !DILocation(line: 19, column: 5, scope: !1014)
!1059 = !DILocation(line: 22, column: 9, scope: !1060)
!1060 = distinct !DILexicalBlock(scope: !1014, file: !1015, line: 22, column: 9)
!1061 = !DILocation(line: 22, column: 14, scope: !1060)
!1062 = !DILocation(line: 22, column: 17, scope: !1060)
!1063 = !DILocation(line: 22, column: 9, scope: !1014)
!1064 = !DILocation(line: 24, column: 10, scope: !1065)
!1065 = distinct !DILexicalBlock(scope: !1060, file: !1015, line: 23, column: 5)
!1066 = !DILocation(line: 25, column: 5, scope: !1065)
!1067 = !DILocalVariable(name: "start", scope: !1014, file: !1015, line: 27, type: !1028)
!1068 = !DILocation(line: 27, column: 12, scope: !1014)
!1069 = !DILocation(line: 27, column: 20, scope: !1014)
!1070 = !DILocation(line: 29, column: 5, scope: !1014)
!1071 = !DILocation(line: 29, column: 12, scope: !1014)
!1072 = !DILocation(line: 29, column: 17, scope: !1014)
!1073 = !DILocation(line: 29, column: 20, scope: !1014)
!1074 = !DILocation(line: 29, column: 25, scope: !1014)
!1075 = !DILocation(line: 29, column: 52, scope: !1014)
!1076 = !DILocation(line: 29, column: 57, scope: !1014)
!1077 = !DILocation(line: 29, column: 28, scope: !1014)
!1078 = !DILocation(line: 31, column: 18, scope: !1079)
!1079 = distinct !DILexicalBlock(scope: !1014, file: !1015, line: 30, column: 5)
!1080 = !DILocation(line: 31, column: 25, scope: !1079)
!1081 = !DILocation(line: 31, column: 33, scope: !1079)
!1082 = !DILocation(line: 31, column: 38, scope: !1079)
!1083 = !DILocation(line: 31, column: 41, scope: !1079)
!1084 = !DILocation(line: 31, column: 30, scope: !1079)
!1085 = !DILocation(line: 31, column: 16, scope: !1079)
!1086 = !DILocation(line: 32, column: 10, scope: !1079)
!1087 = distinct !{!1087, !1070, !1088, !238}
!1088 = !DILocation(line: 33, column: 5, scope: !1014)
!1089 = !DILocation(line: 35, column: 9, scope: !1090)
!1090 = distinct !DILexicalBlock(scope: !1014, file: !1015, line: 35, column: 9)
!1091 = !DILocation(line: 35, column: 16, scope: !1090)
!1092 = !DILocation(line: 35, column: 9, scope: !1014)
!1093 = !DILocation(line: 37, column: 28, scope: !1094)
!1094 = distinct !DILexicalBlock(scope: !1090, file: !1015, line: 36, column: 5)
!1095 = !DILocation(line: 37, column: 35, scope: !1094)
!1096 = !DILocation(line: 37, column: 33, scope: !1094)
!1097 = !DILocation(line: 37, column: 10, scope: !1094)
!1098 = !DILocation(line: 37, column: 17, scope: !1094)
!1099 = !DILocation(line: 38, column: 5, scope: !1094)
!1100 = !DILocation(line: 40, column: 12, scope: !1014)
!1101 = !DILocation(line: 40, column: 5, scope: !1014)
!1102 = !DILocation(line: 41, column: 1, scope: !1014)
!1103 = distinct !DISubprogram(name: "__fizzer_model__atoi", scope: !1104, file: !1104, line: 2, type: !1105, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !107, retainedNodes: !63)
!1104 = !DIFile(filename: "data/models/c/std/stdlib/atoi.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "25ff8cf0c3b1eb16133d1fa2f6f4599f")
!1105 = !DISubroutineType(types: !1106)
!1106 = !{!6, !73}
!1107 = !DILocalVariable(name: "nptr", arg: 1, scope: !1103, file: !1104, line: 2, type: !73)
!1108 = !DILocation(line: 2, column: 38, scope: !1103)
!1109 = !DILocalVariable(name: "result", scope: !1103, file: !1104, line: 4, type: !6)
!1110 = !DILocation(line: 4, column: 9, scope: !1103)
!1111 = !DILocalVariable(name: "sign", scope: !1103, file: !1104, line: 5, type: !6)
!1112 = !DILocation(line: 5, column: 9, scope: !1103)
!1113 = !DILocalVariable(name: "i", scope: !1103, file: !1104, line: 6, type: !1114)
!1114 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1115, line: 8, baseType: !210)
!1115 = !DIFile(filename: "data/models/c/std/stdlib/atoi.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "7570ed2f727a93bc5429216171743e1c")
!1116 = !DILocation(line: 6, column: 12, scope: !1103)
!1117 = !DILocation(line: 9, column: 5, scope: !1103)
!1118 = !DILocation(line: 9, column: 12, scope: !1103)
!1119 = !DILocation(line: 9, column: 17, scope: !1103)
!1120 = !DILocation(line: 9, column: 20, scope: !1103)
!1121 = !DILocation(line: 9, column: 25, scope: !1103)
!1122 = !DILocation(line: 9, column: 52, scope: !1103)
!1123 = !DILocation(line: 9, column: 57, scope: !1103)
!1124 = !DILocation(line: 9, column: 28, scope: !1103)
!1125 = !DILocation(line: 0, scope: !1103)
!1126 = !DILocation(line: 11, column: 10, scope: !1127)
!1127 = distinct !DILexicalBlock(scope: !1103, file: !1104, line: 10, column: 5)
!1128 = distinct !{!1128, !1117, !1129, !238}
!1129 = !DILocation(line: 12, column: 5, scope: !1103)
!1130 = !DILocation(line: 15, column: 9, scope: !1131)
!1131 = distinct !DILexicalBlock(scope: !1103, file: !1104, line: 15, column: 9)
!1132 = !DILocation(line: 15, column: 14, scope: !1131)
!1133 = !DILocation(line: 15, column: 17, scope: !1131)
!1134 = !DILocation(line: 15, column: 9, scope: !1103)
!1135 = !DILocation(line: 17, column: 10, scope: !1136)
!1136 = distinct !DILexicalBlock(scope: !1131, file: !1104, line: 16, column: 5)
!1137 = !DILocation(line: 18, column: 5, scope: !1136)
!1138 = !DILocation(line: 19, column: 14, scope: !1139)
!1139 = distinct !DILexicalBlock(scope: !1131, file: !1104, line: 19, column: 14)
!1140 = !DILocation(line: 19, column: 19, scope: !1139)
!1141 = !DILocation(line: 19, column: 22, scope: !1139)
!1142 = !DILocation(line: 19, column: 14, scope: !1131)
!1143 = !DILocation(line: 21, column: 14, scope: !1144)
!1144 = distinct !DILexicalBlock(scope: !1139, file: !1104, line: 20, column: 5)
!1145 = !DILocation(line: 22, column: 10, scope: !1144)
!1146 = !DILocation(line: 23, column: 5, scope: !1144)
!1147 = !DILocation(line: 26, column: 5, scope: !1103)
!1148 = !DILocation(line: 26, column: 12, scope: !1103)
!1149 = !DILocation(line: 26, column: 17, scope: !1103)
!1150 = !DILocation(line: 26, column: 20, scope: !1103)
!1151 = !DILocation(line: 26, column: 25, scope: !1103)
!1152 = !DILocation(line: 26, column: 52, scope: !1103)
!1153 = !DILocation(line: 26, column: 57, scope: !1103)
!1154 = !DILocation(line: 26, column: 28, scope: !1103)
!1155 = !DILocation(line: 28, column: 18, scope: !1156)
!1156 = distinct !DILexicalBlock(scope: !1103, file: !1104, line: 27, column: 5)
!1157 = !DILocation(line: 28, column: 25, scope: !1156)
!1158 = !DILocation(line: 28, column: 33, scope: !1156)
!1159 = !DILocation(line: 28, column: 38, scope: !1156)
!1160 = !DILocation(line: 28, column: 41, scope: !1156)
!1161 = !DILocation(line: 28, column: 30, scope: !1156)
!1162 = !DILocation(line: 28, column: 16, scope: !1156)
!1163 = !DILocation(line: 29, column: 10, scope: !1156)
!1164 = distinct !{!1164, !1147, !1165, !238}
!1165 = !DILocation(line: 30, column: 5, scope: !1103)
!1166 = !DILocation(line: 32, column: 12, scope: !1103)
!1167 = !DILocation(line: 32, column: 19, scope: !1103)
!1168 = !DILocation(line: 32, column: 17, scope: !1103)
!1169 = !DILocation(line: 32, column: 5, scope: !1103)
!1170 = distinct !DISubprogram(name: "__fizzer_model__strstr", scope: !1171, file: !1171, line: 2, type: !1172, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !109, retainedNodes: !63)
!1171 = !DIFile(filename: "data/models/c/std/string/strstr.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "88fd7ab45b37086df2d2f42655100238")
!1172 = !DISubroutineType(types: !1173)
!1173 = !{!13, !73, !73}
!1174 = !DILocalVariable(name: "haystack", arg: 1, scope: !1170, file: !1171, line: 2, type: !73)
!1175 = !DILocation(line: 2, column: 42, scope: !1170)
!1176 = !DILocalVariable(name: "needle", arg: 2, scope: !1170, file: !1171, line: 2, type: !73)
!1177 = !DILocation(line: 2, column: 64, scope: !1170)
!1178 = !DILocation(line: 4, column: 10, scope: !1179)
!1179 = distinct !DILexicalBlock(scope: !1170, file: !1171, line: 4, column: 9)
!1180 = !DILocation(line: 4, column: 9, scope: !1179)
!1181 = !DILocation(line: 4, column: 17, scope: !1179)
!1182 = !DILocation(line: 4, column: 9, scope: !1170)
!1183 = !DILocation(line: 6, column: 24, scope: !1184)
!1184 = distinct !DILexicalBlock(scope: !1179, file: !1171, line: 5, column: 5)
!1185 = !DILocation(line: 6, column: 9, scope: !1184)
!1186 = !DILocation(line: 8, column: 5, scope: !1170)
!1187 = !DILocation(line: 8, column: 13, scope: !1170)
!1188 = !DILocation(line: 8, column: 12, scope: !1170)
!1189 = !DILocation(line: 8, column: 22, scope: !1170)
!1190 = !DILocalVariable(name: "h", scope: !1191, file: !1171, line: 10, type: !73)
!1191 = distinct !DILexicalBlock(scope: !1170, file: !1171, line: 9, column: 5)
!1192 = !DILocation(line: 10, column: 21, scope: !1191)
!1193 = !DILocation(line: 10, column: 25, scope: !1191)
!1194 = !DILocalVariable(name: "n", scope: !1191, file: !1171, line: 11, type: !73)
!1195 = !DILocation(line: 11, column: 21, scope: !1191)
!1196 = !DILocation(line: 11, column: 25, scope: !1191)
!1197 = !DILocation(line: 12, column: 9, scope: !1191)
!1198 = !DILocation(line: 12, column: 17, scope: !1191)
!1199 = !DILocation(line: 12, column: 16, scope: !1191)
!1200 = !DILocation(line: 12, column: 19, scope: !1191)
!1201 = !DILocation(line: 12, column: 24, scope: !1191)
!1202 = !DILocation(line: 12, column: 28, scope: !1191)
!1203 = !DILocation(line: 12, column: 27, scope: !1191)
!1204 = !DILocation(line: 12, column: 30, scope: !1191)
!1205 = !DILocation(line: 12, column: 35, scope: !1191)
!1206 = !DILocation(line: 12, column: 39, scope: !1191)
!1207 = !DILocation(line: 12, column: 38, scope: !1191)
!1208 = !DILocation(line: 12, column: 45, scope: !1191)
!1209 = !DILocation(line: 12, column: 44, scope: !1191)
!1210 = !DILocation(line: 12, column: 41, scope: !1191)
!1211 = !DILocation(line: 0, scope: !1191)
!1212 = !DILocation(line: 14, column: 14, scope: !1213)
!1213 = distinct !DILexicalBlock(scope: !1191, file: !1171, line: 13, column: 9)
!1214 = !DILocation(line: 15, column: 14, scope: !1213)
!1215 = distinct !{!1215, !1197, !1216, !238}
!1216 = !DILocation(line: 16, column: 9, scope: !1191)
!1217 = !DILocation(line: 17, column: 14, scope: !1218)
!1218 = distinct !DILexicalBlock(scope: !1191, file: !1171, line: 17, column: 13)
!1219 = !DILocation(line: 17, column: 13, scope: !1218)
!1220 = !DILocation(line: 17, column: 16, scope: !1218)
!1221 = !DILocation(line: 17, column: 13, scope: !1191)
!1222 = !DILocation(line: 19, column: 28, scope: !1223)
!1223 = distinct !DILexicalBlock(scope: !1218, file: !1171, line: 18, column: 9)
!1224 = !DILocation(line: 19, column: 13, scope: !1223)
!1225 = !DILocation(line: 21, column: 17, scope: !1191)
!1226 = distinct !{!1226, !1186, !1227, !238}
!1227 = !DILocation(line: 22, column: 5, scope: !1170)
!1228 = !DILocation(line: 23, column: 5, scope: !1170)
!1229 = !DILocation(line: 24, column: 1, scope: !1170)
!1230 = distinct !DISubprogram(name: "__fizzer_model__strpbrk", scope: !1231, file: !1231, line: 2, type: !1172, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !111, retainedNodes: !63)
!1231 = !DIFile(filename: "data/models/c/std/string/strpbrk.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "f90ee9e8ce652e3236917e969fe7e0af")
!1232 = !DILocalVariable(name: "s", arg: 1, scope: !1230, file: !1231, line: 2, type: !73)
!1233 = !DILocation(line: 2, column: 43, scope: !1230)
!1234 = !DILocalVariable(name: "accept", arg: 2, scope: !1230, file: !1231, line: 2, type: !73)
!1235 = !DILocation(line: 2, column: 58, scope: !1230)
!1236 = !DILocation(line: 4, column: 5, scope: !1230)
!1237 = !DILocation(line: 4, column: 13, scope: !1230)
!1238 = !DILocation(line: 4, column: 12, scope: !1230)
!1239 = !DILocation(line: 4, column: 15, scope: !1230)
!1240 = !DILocalVariable(name: "a", scope: !1241, file: !1231, line: 6, type: !73)
!1241 = distinct !DILexicalBlock(scope: !1230, file: !1231, line: 5, column: 5)
!1242 = !DILocation(line: 6, column: 21, scope: !1241)
!1243 = !DILocation(line: 6, column: 25, scope: !1241)
!1244 = !DILocation(line: 7, column: 9, scope: !1241)
!1245 = !DILocation(line: 7, column: 17, scope: !1241)
!1246 = !DILocation(line: 7, column: 16, scope: !1241)
!1247 = !DILocation(line: 7, column: 19, scope: !1241)
!1248 = !DILocation(line: 9, column: 18, scope: !1249)
!1249 = distinct !DILexicalBlock(scope: !1250, file: !1231, line: 9, column: 17)
!1250 = distinct !DILexicalBlock(scope: !1241, file: !1231, line: 8, column: 9)
!1251 = !DILocation(line: 9, column: 17, scope: !1249)
!1252 = !DILocation(line: 9, column: 24, scope: !1249)
!1253 = !DILocation(line: 9, column: 23, scope: !1249)
!1254 = !DILocation(line: 9, column: 20, scope: !1249)
!1255 = !DILocation(line: 9, column: 17, scope: !1250)
!1256 = !DILocation(line: 11, column: 32, scope: !1257)
!1257 = distinct !DILexicalBlock(scope: !1249, file: !1231, line: 10, column: 13)
!1258 = !DILocation(line: 11, column: 17, scope: !1257)
!1259 = !DILocation(line: 13, column: 14, scope: !1250)
!1260 = distinct !{!1260, !1244, !1261, !238}
!1261 = !DILocation(line: 14, column: 9, scope: !1241)
!1262 = !DILocation(line: 15, column: 10, scope: !1241)
!1263 = distinct !{!1263, !1236, !1264, !238}
!1264 = !DILocation(line: 16, column: 5, scope: !1230)
!1265 = !DILocation(line: 17, column: 5, scope: !1230)
!1266 = !DILocation(line: 18, column: 1, scope: !1230)
!1267 = distinct !DISubprogram(name: "__fizzer_model__strcpy", scope: !1268, file: !1268, line: 2, type: !71, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !113, retainedNodes: !63)
!1268 = !DIFile(filename: "data/models/c/std/string/strcpy.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "a9d5e5946be9d668420164bcb8d1da5f")
!1269 = !DILocalVariable(name: "dest", arg: 1, scope: !1267, file: !1268, line: 2, type: !13)
!1270 = !DILocation(line: 2, column: 36, scope: !1267)
!1271 = !DILocalVariable(name: "src", arg: 2, scope: !1267, file: !1268, line: 2, type: !73)
!1272 = !DILocation(line: 2, column: 54, scope: !1267)
!1273 = !DILocalVariable(name: "d", scope: !1267, file: !1268, line: 4, type: !13)
!1274 = !DILocation(line: 4, column: 11, scope: !1267)
!1275 = !DILocation(line: 4, column: 15, scope: !1267)
!1276 = !DILocation(line: 5, column: 5, scope: !1267)
!1277 = !DILocation(line: 5, column: 13, scope: !1267)
!1278 = !DILocation(line: 5, column: 12, scope: !1267)
!1279 = !DILocation(line: 5, column: 17, scope: !1267)
!1280 = !DILocation(line: 7, column: 15, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1267, file: !1268, line: 6, column: 5)
!1282 = !DILocation(line: 7, column: 14, scope: !1281)
!1283 = !DILocation(line: 7, column: 10, scope: !1281)
!1284 = !DILocation(line: 7, column: 12, scope: !1281)
!1285 = !DILocation(line: 8, column: 10, scope: !1281)
!1286 = !DILocation(line: 9, column: 12, scope: !1281)
!1287 = distinct !{!1287, !1276, !1288, !238}
!1288 = !DILocation(line: 10, column: 5, scope: !1267)
!1289 = !DILocation(line: 11, column: 6, scope: !1267)
!1290 = !DILocation(line: 11, column: 8, scope: !1267)
!1291 = !DILocation(line: 12, column: 12, scope: !1267)
!1292 = !DILocation(line: 12, column: 5, scope: !1267)
!1293 = distinct !DISubprogram(name: "__fizzer_model__strncat", scope: !1294, file: !1294, line: 2, type: !1295, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !115, retainedNodes: !63)
!1294 = !DIFile(filename: "data/models/c/std/string/strncat.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "1734f838e35184e8c456b32046d1ee07")
!1295 = !DISubroutineType(types: !1296)
!1296 = !{!13, !13, !73, !1297}
!1297 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1298, line: 8, baseType: !210)
!1298 = !DIFile(filename: "data/models/c/std/string/strncat.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "c3654096277bccf248969a0055808a98")
!1299 = !DILocalVariable(name: "dest", arg: 1, scope: !1293, file: !1294, line: 2, type: !13)
!1300 = !DILocation(line: 2, column: 37, scope: !1293)
!1301 = !DILocalVariable(name: "src", arg: 2, scope: !1293, file: !1294, line: 2, type: !73)
!1302 = !DILocation(line: 2, column: 55, scope: !1293)
!1303 = !DILocalVariable(name: "n", arg: 3, scope: !1293, file: !1294, line: 2, type: !1297)
!1304 = !DILocation(line: 2, column: 67, scope: !1293)
!1305 = !DILocalVariable(name: "d", scope: !1293, file: !1294, line: 4, type: !13)
!1306 = !DILocation(line: 4, column: 11, scope: !1293)
!1307 = !DILocation(line: 4, column: 15, scope: !1293)
!1308 = !DILocation(line: 5, column: 5, scope: !1293)
!1309 = !DILocation(line: 5, column: 13, scope: !1293)
!1310 = !DILocation(line: 5, column: 12, scope: !1293)
!1311 = !DILocation(line: 5, column: 15, scope: !1293)
!1312 = !DILocation(line: 7, column: 10, scope: !1313)
!1313 = distinct !DILexicalBlock(scope: !1293, file: !1294, line: 6, column: 5)
!1314 = distinct !{!1314, !1308, !1315, !238}
!1315 = !DILocation(line: 8, column: 5, scope: !1293)
!1316 = !DILocalVariable(name: "i", scope: !1293, file: !1294, line: 9, type: !1297)
!1317 = !DILocation(line: 9, column: 12, scope: !1293)
!1318 = !DILocation(line: 10, column: 5, scope: !1293)
!1319 = !DILocation(line: 10, column: 12, scope: !1293)
!1320 = !DILocation(line: 10, column: 16, scope: !1293)
!1321 = !DILocation(line: 10, column: 14, scope: !1293)
!1322 = !DILocation(line: 10, column: 18, scope: !1293)
!1323 = !DILocation(line: 10, column: 22, scope: !1293)
!1324 = !DILocation(line: 10, column: 21, scope: !1293)
!1325 = !DILocation(line: 10, column: 26, scope: !1293)
!1326 = !DILocation(line: 0, scope: !1293)
!1327 = !DILocation(line: 12, column: 15, scope: !1328)
!1328 = distinct !DILexicalBlock(scope: !1293, file: !1294, line: 11, column: 5)
!1329 = !DILocation(line: 12, column: 14, scope: !1328)
!1330 = !DILocation(line: 12, column: 10, scope: !1328)
!1331 = !DILocation(line: 12, column: 12, scope: !1328)
!1332 = !DILocation(line: 13, column: 10, scope: !1328)
!1333 = !DILocation(line: 14, column: 12, scope: !1328)
!1334 = !DILocation(line: 15, column: 10, scope: !1328)
!1335 = distinct !{!1335, !1318, !1336, !238}
!1336 = !DILocation(line: 16, column: 5, scope: !1293)
!1337 = !DILocation(line: 17, column: 6, scope: !1293)
!1338 = !DILocation(line: 17, column: 8, scope: !1293)
!1339 = !DILocation(line: 18, column: 12, scope: !1293)
!1340 = !DILocation(line: 18, column: 5, scope: !1293)
!1341 = distinct !DISubprogram(name: "__fizzer_model__strcspn", scope: !1342, file: !1342, line: 2, type: !1343, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !117, retainedNodes: !63)
!1342 = !DIFile(filename: "data/models/c/std/string/strcspn.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "2f7cd216c9e6f8edb02d5afb4ea11b44")
!1343 = !DISubroutineType(types: !1344)
!1344 = !{!1345, !73, !73}
!1345 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1346, line: 8, baseType: !210)
!1346 = !DIFile(filename: "data/models/c/std/string/strcspn.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "14201ac4b9600306ae68639f4954a548")
!1347 = !DILocalVariable(name: "s", arg: 1, scope: !1341, file: !1342, line: 2, type: !73)
!1348 = !DILocation(line: 2, column: 44, scope: !1341)
!1349 = !DILocalVariable(name: "reject", arg: 2, scope: !1341, file: !1342, line: 2, type: !73)
!1350 = !DILocation(line: 2, column: 59, scope: !1341)
!1351 = !DILocalVariable(name: "count", scope: !1341, file: !1342, line: 4, type: !1345)
!1352 = !DILocation(line: 4, column: 12, scope: !1341)
!1353 = !DILocation(line: 5, column: 5, scope: !1341)
!1354 = !DILocation(line: 5, column: 13, scope: !1341)
!1355 = !DILocation(line: 5, column: 12, scope: !1341)
!1356 = !DILocation(line: 5, column: 15, scope: !1341)
!1357 = !DILocalVariable(name: "r", scope: !1358, file: !1342, line: 7, type: !73)
!1358 = distinct !DILexicalBlock(scope: !1341, file: !1342, line: 6, column: 5)
!1359 = !DILocation(line: 7, column: 21, scope: !1358)
!1360 = !DILocation(line: 7, column: 25, scope: !1358)
!1361 = !DILocation(line: 8, column: 9, scope: !1358)
!1362 = !DILocation(line: 8, column: 17, scope: !1358)
!1363 = !DILocation(line: 8, column: 16, scope: !1358)
!1364 = !DILocation(line: 8, column: 19, scope: !1358)
!1365 = !DILocation(line: 8, column: 24, scope: !1358)
!1366 = !DILocation(line: 8, column: 28, scope: !1358)
!1367 = !DILocation(line: 8, column: 27, scope: !1358)
!1368 = !DILocation(line: 8, column: 34, scope: !1358)
!1369 = !DILocation(line: 8, column: 33, scope: !1358)
!1370 = !DILocation(line: 8, column: 30, scope: !1358)
!1371 = !DILocation(line: 0, scope: !1358)
!1372 = !DILocation(line: 10, column: 14, scope: !1373)
!1373 = distinct !DILexicalBlock(scope: !1358, file: !1342, line: 9, column: 9)
!1374 = distinct !{!1374, !1361, !1375, !238}
!1375 = !DILocation(line: 11, column: 9, scope: !1358)
!1376 = !DILocation(line: 12, column: 14, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1358, file: !1342, line: 12, column: 13)
!1378 = !DILocation(line: 12, column: 13, scope: !1377)
!1379 = !DILocation(line: 12, column: 16, scope: !1377)
!1380 = !DILocation(line: 12, column: 13, scope: !1358)
!1381 = !DILocation(line: 14, column: 13, scope: !1382)
!1382 = distinct !DILexicalBlock(scope: !1377, file: !1342, line: 13, column: 9)
!1383 = !DILocation(line: 16, column: 14, scope: !1358)
!1384 = !DILocation(line: 17, column: 10, scope: !1358)
!1385 = distinct !{!1385, !1353, !1386, !238}
!1386 = !DILocation(line: 18, column: 5, scope: !1341)
!1387 = !DILocation(line: 19, column: 12, scope: !1341)
!1388 = !DILocation(line: 19, column: 5, scope: !1341)
!1389 = distinct !DISubprogram(name: "__fizzer_model__strcoll", scope: !1390, file: !1390, line: 2, type: !1391, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !119, retainedNodes: !63)
!1390 = !DIFile(filename: "data/models/c/std/string/strcoll.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "594081383e127900a617071ac71187f1")
!1391 = !DISubroutineType(types: !1392)
!1392 = !{!6, !73, !73}
!1393 = !DILocalVariable(name: "s1", arg: 1, scope: !1389, file: !1390, line: 2, type: !73)
!1394 = !DILocation(line: 2, column: 41, scope: !1389)
!1395 = !DILocalVariable(name: "s2", arg: 2, scope: !1389, file: !1390, line: 2, type: !73)
!1396 = !DILocation(line: 2, column: 57, scope: !1389)
!1397 = !DILocation(line: 4, column: 5, scope: !1389)
!1398 = !DILocation(line: 4, column: 13, scope: !1389)
!1399 = !DILocation(line: 4, column: 12, scope: !1389)
!1400 = !DILocation(line: 4, column: 16, scope: !1389)
!1401 = !DILocation(line: 4, column: 21, scope: !1389)
!1402 = !DILocation(line: 4, column: 25, scope: !1389)
!1403 = !DILocation(line: 4, column: 24, scope: !1389)
!1404 = !DILocation(line: 4, column: 32, scope: !1389)
!1405 = !DILocation(line: 4, column: 31, scope: !1389)
!1406 = !DILocation(line: 4, column: 28, scope: !1389)
!1407 = !DILocation(line: 0, scope: !1389)
!1408 = !DILocation(line: 6, column: 11, scope: !1409)
!1409 = distinct !DILexicalBlock(scope: !1389, file: !1390, line: 5, column: 5)
!1410 = !DILocation(line: 7, column: 11, scope: !1409)
!1411 = distinct !{!1411, !1397, !1412, !238}
!1412 = !DILocation(line: 8, column: 5, scope: !1389)
!1413 = !DILocation(line: 9, column: 34, scope: !1389)
!1414 = !DILocation(line: 9, column: 33, scope: !1389)
!1415 = !DILocation(line: 9, column: 18, scope: !1389)
!1416 = !DILocation(line: 9, column: 55, scope: !1389)
!1417 = !DILocation(line: 9, column: 54, scope: !1389)
!1418 = !DILocation(line: 9, column: 39, scope: !1389)
!1419 = !DILocation(line: 9, column: 37, scope: !1389)
!1420 = !DILocation(line: 9, column: 5, scope: !1389)
!1421 = distinct !DISubprogram(name: "__fizzer_model__strcmp", scope: !1422, file: !1422, line: 2, type: !1391, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !122, retainedNodes: !63)
!1422 = !DIFile(filename: "data/models/c/std/string/strcmp.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "e8d614ef53fc1f2814b3a79a1909aaf7")
!1423 = !DILocalVariable(name: "s1", arg: 1, scope: !1421, file: !1422, line: 2, type: !73)
!1424 = !DILocation(line: 2, column: 40, scope: !1421)
!1425 = !DILocalVariable(name: "s2", arg: 2, scope: !1421, file: !1422, line: 2, type: !73)
!1426 = !DILocation(line: 2, column: 56, scope: !1421)
!1427 = !DILocation(line: 4, column: 5, scope: !1421)
!1428 = !DILocation(line: 4, column: 13, scope: !1421)
!1429 = !DILocation(line: 4, column: 12, scope: !1421)
!1430 = !DILocation(line: 4, column: 16, scope: !1421)
!1431 = !DILocation(line: 4, column: 21, scope: !1421)
!1432 = !DILocation(line: 4, column: 25, scope: !1421)
!1433 = !DILocation(line: 4, column: 24, scope: !1421)
!1434 = !DILocation(line: 4, column: 32, scope: !1421)
!1435 = !DILocation(line: 4, column: 31, scope: !1421)
!1436 = !DILocation(line: 4, column: 28, scope: !1421)
!1437 = !DILocation(line: 0, scope: !1421)
!1438 = !DILocation(line: 6, column: 11, scope: !1439)
!1439 = distinct !DILexicalBlock(scope: !1421, file: !1422, line: 5, column: 5)
!1440 = !DILocation(line: 7, column: 11, scope: !1439)
!1441 = distinct !{!1441, !1427, !1442, !238}
!1442 = !DILocation(line: 8, column: 5, scope: !1421)
!1443 = !DILocation(line: 9, column: 34, scope: !1421)
!1444 = !DILocation(line: 9, column: 33, scope: !1421)
!1445 = !DILocation(line: 9, column: 18, scope: !1421)
!1446 = !DILocation(line: 9, column: 55, scope: !1421)
!1447 = !DILocation(line: 9, column: 54, scope: !1421)
!1448 = !DILocation(line: 9, column: 39, scope: !1421)
!1449 = !DILocation(line: 9, column: 37, scope: !1421)
!1450 = !DILocation(line: 9, column: 5, scope: !1421)
!1451 = distinct !DISubprogram(name: "__fizzer_model__strncmp", scope: !1452, file: !1452, line: 2, type: !1453, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !124, retainedNodes: !63)
!1452 = !DIFile(filename: "data/models/c/std/string/strncmp.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "e275f67b87d7e3da1256de4308f1f1ce")
!1453 = !DISubroutineType(types: !1454)
!1454 = !{!6, !73, !73, !1455}
!1455 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1456, line: 8, baseType: !210)
!1456 = !DIFile(filename: "data/models/c/std/string/strncmp.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "d722468f3764edd1057fdc528e8c267d")
!1457 = !DILocalVariable(name: "s1", arg: 1, scope: !1451, file: !1452, line: 2, type: !73)
!1458 = !DILocation(line: 2, column: 41, scope: !1451)
!1459 = !DILocalVariable(name: "s2", arg: 2, scope: !1451, file: !1452, line: 2, type: !73)
!1460 = !DILocation(line: 2, column: 57, scope: !1451)
!1461 = !DILocalVariable(name: "n", arg: 3, scope: !1451, file: !1452, line: 2, type: !1455)
!1462 = !DILocation(line: 2, column: 68, scope: !1451)
!1463 = !DILocalVariable(name: "i", scope: !1451, file: !1452, line: 4, type: !1455)
!1464 = !DILocation(line: 4, column: 12, scope: !1451)
!1465 = !DILocation(line: 5, column: 5, scope: !1451)
!1466 = !DILocation(line: 5, column: 12, scope: !1451)
!1467 = !DILocation(line: 5, column: 16, scope: !1451)
!1468 = !DILocation(line: 5, column: 14, scope: !1451)
!1469 = !DILocalVariable(name: "c1", scope: !1470, file: !1452, line: 7, type: !82)
!1470 = distinct !DILexicalBlock(scope: !1451, file: !1452, line: 6, column: 5)
!1471 = !DILocation(line: 7, column: 23, scope: !1470)
!1472 = !DILocation(line: 7, column: 43, scope: !1470)
!1473 = !DILocation(line: 7, column: 46, scope: !1470)
!1474 = !DILocalVariable(name: "c2", scope: !1470, file: !1452, line: 8, type: !82)
!1475 = !DILocation(line: 8, column: 23, scope: !1470)
!1476 = !DILocation(line: 8, column: 43, scope: !1470)
!1477 = !DILocation(line: 8, column: 46, scope: !1470)
!1478 = !DILocation(line: 9, column: 13, scope: !1479)
!1479 = distinct !DILexicalBlock(scope: !1470, file: !1452, line: 9, column: 13)
!1480 = !DILocation(line: 9, column: 19, scope: !1479)
!1481 = !DILocation(line: 9, column: 16, scope: !1479)
!1482 = !DILocation(line: 9, column: 22, scope: !1479)
!1483 = !DILocation(line: 9, column: 25, scope: !1479)
!1484 = !DILocation(line: 9, column: 28, scope: !1479)
!1485 = !DILocation(line: 9, column: 33, scope: !1479)
!1486 = !DILocation(line: 9, column: 36, scope: !1479)
!1487 = !DILocation(line: 9, column: 39, scope: !1479)
!1488 = !DILocation(line: 9, column: 13, scope: !1470)
!1489 = !DILocation(line: 11, column: 26, scope: !1490)
!1490 = distinct !DILexicalBlock(scope: !1479, file: !1452, line: 10, column: 9)
!1491 = !DILocation(line: 11, column: 31, scope: !1490)
!1492 = !DILocation(line: 11, column: 29, scope: !1490)
!1493 = !DILocation(line: 11, column: 13, scope: !1490)
!1494 = !DILocation(line: 13, column: 10, scope: !1470)
!1495 = distinct !{!1495, !1465, !1496, !238}
!1496 = !DILocation(line: 14, column: 5, scope: !1451)
!1497 = !DILocation(line: 15, column: 5, scope: !1451)
!1498 = !DILocation(line: 16, column: 1, scope: !1451)
!1499 = distinct !DISubprogram(name: "__fizzer_model__strrchr", scope: !1500, file: !1500, line: 2, type: !1501, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !127, retainedNodes: !63)
!1500 = !DIFile(filename: "data/models/c/std/string/strrchr.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "44079aea5c31caec0e42d813448f707f")
!1501 = !DISubroutineType(types: !1502)
!1502 = !{!13, !73, !6}
!1503 = !DILocalVariable(name: "s", arg: 1, scope: !1499, file: !1500, line: 2, type: !73)
!1504 = !DILocation(line: 2, column: 43, scope: !1499)
!1505 = !DILocalVariable(name: "c", arg: 2, scope: !1499, file: !1500, line: 2, type: !6)
!1506 = !DILocation(line: 2, column: 50, scope: !1499)
!1507 = !DILocalVariable(name: "last", scope: !1499, file: !1500, line: 4, type: !73)
!1508 = !DILocation(line: 4, column: 17, scope: !1499)
!1509 = !DILocation(line: 5, column: 5, scope: !1499)
!1510 = !DILocation(line: 5, column: 13, scope: !1499)
!1511 = !DILocation(line: 5, column: 12, scope: !1499)
!1512 = !DILocation(line: 5, column: 15, scope: !1499)
!1513 = !DILocation(line: 7, column: 14, scope: !1514)
!1514 = distinct !DILexicalBlock(scope: !1515, file: !1500, line: 7, column: 13)
!1515 = distinct !DILexicalBlock(scope: !1499, file: !1500, line: 6, column: 5)
!1516 = !DILocation(line: 7, column: 13, scope: !1514)
!1517 = !DILocation(line: 7, column: 25, scope: !1514)
!1518 = !DILocation(line: 7, column: 19, scope: !1514)
!1519 = !DILocation(line: 7, column: 16, scope: !1514)
!1520 = !DILocation(line: 7, column: 13, scope: !1515)
!1521 = !DILocation(line: 9, column: 20, scope: !1522)
!1522 = distinct !DILexicalBlock(scope: !1514, file: !1500, line: 8, column: 9)
!1523 = !DILocation(line: 9, column: 18, scope: !1522)
!1524 = !DILocation(line: 10, column: 9, scope: !1522)
!1525 = !DILocation(line: 11, column: 10, scope: !1515)
!1526 = distinct !{!1526, !1509, !1527, !238}
!1527 = !DILocation(line: 12, column: 5, scope: !1499)
!1528 = !DILocation(line: 13, column: 15, scope: !1529)
!1529 = distinct !DILexicalBlock(scope: !1499, file: !1500, line: 13, column: 9)
!1530 = !DILocation(line: 13, column: 9, scope: !1529)
!1531 = !DILocation(line: 13, column: 17, scope: !1529)
!1532 = !DILocation(line: 13, column: 9, scope: !1499)
!1533 = !DILocation(line: 15, column: 24, scope: !1534)
!1534 = distinct !DILexicalBlock(scope: !1529, file: !1500, line: 14, column: 5)
!1535 = !DILocation(line: 15, column: 9, scope: !1534)
!1536 = !DILocation(line: 17, column: 20, scope: !1499)
!1537 = !DILocation(line: 17, column: 5, scope: !1499)
!1538 = !DILocation(line: 18, column: 1, scope: !1499)
!1539 = distinct !DISubprogram(name: "__fizzer_model__strcat", scope: !1540, file: !1540, line: 2, type: !71, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !130, retainedNodes: !63)
!1540 = !DIFile(filename: "data/models/c/std/string/strcat.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "8970d2710d3c40f59dab15e8fb2774f9")
!1541 = !DILocalVariable(name: "dest", arg: 1, scope: !1539, file: !1540, line: 2, type: !13)
!1542 = !DILocation(line: 2, column: 36, scope: !1539)
!1543 = !DILocalVariable(name: "src", arg: 2, scope: !1539, file: !1540, line: 2, type: !73)
!1544 = !DILocation(line: 2, column: 54, scope: !1539)
!1545 = !DILocalVariable(name: "d", scope: !1539, file: !1540, line: 4, type: !13)
!1546 = !DILocation(line: 4, column: 11, scope: !1539)
!1547 = !DILocation(line: 4, column: 15, scope: !1539)
!1548 = !DILocation(line: 5, column: 5, scope: !1539)
!1549 = !DILocation(line: 5, column: 13, scope: !1539)
!1550 = !DILocation(line: 5, column: 12, scope: !1539)
!1551 = !DILocation(line: 5, column: 15, scope: !1539)
!1552 = !DILocation(line: 7, column: 10, scope: !1553)
!1553 = distinct !DILexicalBlock(scope: !1539, file: !1540, line: 6, column: 5)
!1554 = distinct !{!1554, !1548, !1555, !238}
!1555 = !DILocation(line: 8, column: 5, scope: !1539)
!1556 = !DILocation(line: 9, column: 5, scope: !1539)
!1557 = !DILocation(line: 9, column: 13, scope: !1539)
!1558 = !DILocation(line: 9, column: 12, scope: !1539)
!1559 = !DILocation(line: 9, column: 17, scope: !1539)
!1560 = !DILocation(line: 11, column: 15, scope: !1561)
!1561 = distinct !DILexicalBlock(scope: !1539, file: !1540, line: 10, column: 5)
!1562 = !DILocation(line: 11, column: 14, scope: !1561)
!1563 = !DILocation(line: 11, column: 10, scope: !1561)
!1564 = !DILocation(line: 11, column: 12, scope: !1561)
!1565 = !DILocation(line: 12, column: 10, scope: !1561)
!1566 = !DILocation(line: 13, column: 12, scope: !1561)
!1567 = distinct !{!1567, !1556, !1568, !238}
!1568 = !DILocation(line: 14, column: 5, scope: !1539)
!1569 = !DILocation(line: 15, column: 6, scope: !1539)
!1570 = !DILocation(line: 15, column: 8, scope: !1539)
!1571 = !DILocation(line: 16, column: 12, scope: !1539)
!1572 = !DILocation(line: 16, column: 5, scope: !1539)
!1573 = distinct !DISubprogram(name: "__fizzer_model__strspn", scope: !1574, file: !1574, line: 2, type: !1575, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !132, retainedNodes: !63)
!1574 = !DIFile(filename: "data/models/c/std/string/strspn.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "093bc709c553b9ccbb1565b54017ff4e")
!1575 = !DISubroutineType(types: !1576)
!1576 = !{!1577, !73, !73}
!1577 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1578, line: 8, baseType: !210)
!1578 = !DIFile(filename: "data/models/c/std/string/strspn.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "e204dc773920ac8c268dc68093e93bcb")
!1579 = !DILocalVariable(name: "s", arg: 1, scope: !1573, file: !1574, line: 2, type: !73)
!1580 = !DILocation(line: 2, column: 43, scope: !1573)
!1581 = !DILocalVariable(name: "accept", arg: 2, scope: !1573, file: !1574, line: 2, type: !73)
!1582 = !DILocation(line: 2, column: 58, scope: !1573)
!1583 = !DILocalVariable(name: "count", scope: !1573, file: !1574, line: 4, type: !1577)
!1584 = !DILocation(line: 4, column: 12, scope: !1573)
!1585 = !DILocation(line: 5, column: 5, scope: !1573)
!1586 = !DILocation(line: 5, column: 13, scope: !1573)
!1587 = !DILocation(line: 5, column: 12, scope: !1573)
!1588 = !DILocation(line: 5, column: 15, scope: !1573)
!1589 = !DILocalVariable(name: "a", scope: !1590, file: !1574, line: 7, type: !73)
!1590 = distinct !DILexicalBlock(scope: !1573, file: !1574, line: 6, column: 5)
!1591 = !DILocation(line: 7, column: 21, scope: !1590)
!1592 = !DILocation(line: 7, column: 25, scope: !1590)
!1593 = !DILocation(line: 8, column: 9, scope: !1590)
!1594 = !DILocation(line: 8, column: 17, scope: !1590)
!1595 = !DILocation(line: 8, column: 16, scope: !1590)
!1596 = !DILocation(line: 8, column: 19, scope: !1590)
!1597 = !DILocation(line: 8, column: 24, scope: !1590)
!1598 = !DILocation(line: 8, column: 28, scope: !1590)
!1599 = !DILocation(line: 8, column: 27, scope: !1590)
!1600 = !DILocation(line: 8, column: 34, scope: !1590)
!1601 = !DILocation(line: 8, column: 33, scope: !1590)
!1602 = !DILocation(line: 8, column: 30, scope: !1590)
!1603 = !DILocation(line: 0, scope: !1590)
!1604 = !DILocation(line: 10, column: 14, scope: !1605)
!1605 = distinct !DILexicalBlock(scope: !1590, file: !1574, line: 9, column: 9)
!1606 = distinct !{!1606, !1593, !1607, !238}
!1607 = !DILocation(line: 11, column: 9, scope: !1590)
!1608 = !DILocation(line: 12, column: 14, scope: !1609)
!1609 = distinct !DILexicalBlock(scope: !1590, file: !1574, line: 12, column: 13)
!1610 = !DILocation(line: 12, column: 13, scope: !1609)
!1611 = !DILocation(line: 12, column: 16, scope: !1609)
!1612 = !DILocation(line: 12, column: 13, scope: !1590)
!1613 = !DILocation(line: 14, column: 13, scope: !1614)
!1614 = distinct !DILexicalBlock(scope: !1609, file: !1574, line: 13, column: 9)
!1615 = !DILocation(line: 16, column: 14, scope: !1590)
!1616 = !DILocation(line: 17, column: 10, scope: !1590)
!1617 = distinct !{!1617, !1585, !1618, !238}
!1618 = !DILocation(line: 18, column: 5, scope: !1573)
!1619 = !DILocation(line: 19, column: 12, scope: !1573)
!1620 = !DILocation(line: 19, column: 5, scope: !1573)
!1621 = distinct !DISubprogram(name: "__fizzer_model__strncpy", scope: !1622, file: !1622, line: 2, type: !1623, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !134, retainedNodes: !63)
!1622 = !DIFile(filename: "data/models/c/std/string/strncpy.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "4b1e33fa2c1188492810829cb7ad397c")
!1623 = !DISubroutineType(types: !1624)
!1624 = !{!13, !13, !73, !1625}
!1625 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1626, line: 8, baseType: !210)
!1626 = !DIFile(filename: "data/models/c/std/string/strncpy.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "05e0494f8da850b7625fd57dcdc37446")
!1627 = !DILocalVariable(name: "dest", arg: 1, scope: !1621, file: !1622, line: 2, type: !13)
!1628 = !DILocation(line: 2, column: 37, scope: !1621)
!1629 = !DILocalVariable(name: "src", arg: 2, scope: !1621, file: !1622, line: 2, type: !73)
!1630 = !DILocation(line: 2, column: 55, scope: !1621)
!1631 = !DILocalVariable(name: "n", arg: 3, scope: !1621, file: !1622, line: 2, type: !1625)
!1632 = !DILocation(line: 2, column: 67, scope: !1621)
!1633 = !DILocalVariable(name: "i", scope: !1621, file: !1622, line: 4, type: !1625)
!1634 = !DILocation(line: 4, column: 12, scope: !1621)
!1635 = !DILocation(line: 5, column: 5, scope: !1621)
!1636 = !DILocation(line: 5, column: 12, scope: !1621)
!1637 = !DILocation(line: 5, column: 16, scope: !1621)
!1638 = !DILocation(line: 5, column: 14, scope: !1621)
!1639 = !DILocation(line: 5, column: 18, scope: !1621)
!1640 = !DILocation(line: 5, column: 21, scope: !1621)
!1641 = !DILocation(line: 5, column: 25, scope: !1621)
!1642 = !DILocation(line: 5, column: 28, scope: !1621)
!1643 = !DILocation(line: 0, scope: !1621)
!1644 = !DILocation(line: 7, column: 19, scope: !1645)
!1645 = distinct !DILexicalBlock(scope: !1621, file: !1622, line: 6, column: 5)
!1646 = !DILocation(line: 7, column: 23, scope: !1645)
!1647 = !DILocation(line: 7, column: 9, scope: !1645)
!1648 = !DILocation(line: 7, column: 14, scope: !1645)
!1649 = !DILocation(line: 7, column: 17, scope: !1645)
!1650 = !DILocation(line: 8, column: 10, scope: !1645)
!1651 = distinct !{!1651, !1635, !1652, !238}
!1652 = !DILocation(line: 9, column: 5, scope: !1621)
!1653 = !DILocation(line: 10, column: 5, scope: !1621)
!1654 = !DILocation(line: 10, column: 12, scope: !1621)
!1655 = !DILocation(line: 10, column: 16, scope: !1621)
!1656 = !DILocation(line: 10, column: 14, scope: !1621)
!1657 = !DILocation(line: 12, column: 9, scope: !1658)
!1658 = distinct !DILexicalBlock(scope: !1621, file: !1622, line: 11, column: 5)
!1659 = !DILocation(line: 12, column: 14, scope: !1658)
!1660 = !DILocation(line: 12, column: 17, scope: !1658)
!1661 = !DILocation(line: 13, column: 10, scope: !1658)
!1662 = distinct !{!1662, !1653, !1663, !238}
!1663 = !DILocation(line: 14, column: 5, scope: !1621)
!1664 = !DILocation(line: 15, column: 12, scope: !1621)
!1665 = !DILocation(line: 15, column: 5, scope: !1621)
!1666 = distinct !DISubprogram(name: "__fizzer_model__strchr", scope: !1667, file: !1667, line: 2, type: !1501, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !136, retainedNodes: !63)
!1667 = !DIFile(filename: "data/models/c/std/string/strchr.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "be78f81f7eb8078306a1616593746c64")
!1668 = !DILocalVariable(name: "s", arg: 1, scope: !1666, file: !1667, line: 2, type: !73)
!1669 = !DILocation(line: 2, column: 42, scope: !1666)
!1670 = !DILocalVariable(name: "c", arg: 2, scope: !1666, file: !1667, line: 2, type: !6)
!1671 = !DILocation(line: 2, column: 49, scope: !1666)
!1672 = !DILocation(line: 4, column: 5, scope: !1666)
!1673 = !DILocation(line: 4, column: 13, scope: !1666)
!1674 = !DILocation(line: 4, column: 12, scope: !1666)
!1675 = !DILocation(line: 4, column: 15, scope: !1666)
!1676 = !DILocation(line: 6, column: 14, scope: !1677)
!1677 = distinct !DILexicalBlock(scope: !1678, file: !1667, line: 6, column: 13)
!1678 = distinct !DILexicalBlock(scope: !1666, file: !1667, line: 5, column: 5)
!1679 = !DILocation(line: 6, column: 13, scope: !1677)
!1680 = !DILocation(line: 6, column: 25, scope: !1677)
!1681 = !DILocation(line: 6, column: 19, scope: !1677)
!1682 = !DILocation(line: 6, column: 16, scope: !1677)
!1683 = !DILocation(line: 6, column: 13, scope: !1678)
!1684 = !DILocation(line: 8, column: 28, scope: !1685)
!1685 = distinct !DILexicalBlock(scope: !1677, file: !1667, line: 7, column: 9)
!1686 = !DILocation(line: 8, column: 13, scope: !1685)
!1687 = !DILocation(line: 10, column: 10, scope: !1678)
!1688 = distinct !{!1688, !1672, !1689, !238}
!1689 = !DILocation(line: 11, column: 5, scope: !1666)
!1690 = !DILocation(line: 12, column: 15, scope: !1691)
!1691 = distinct !DILexicalBlock(scope: !1666, file: !1667, line: 12, column: 9)
!1692 = !DILocation(line: 12, column: 9, scope: !1691)
!1693 = !DILocation(line: 12, column: 17, scope: !1691)
!1694 = !DILocation(line: 12, column: 9, scope: !1666)
!1695 = !DILocation(line: 14, column: 24, scope: !1696)
!1696 = distinct !DILexicalBlock(scope: !1691, file: !1667, line: 13, column: 5)
!1697 = !DILocation(line: 14, column: 9, scope: !1696)
!1698 = !DILocation(line: 16, column: 5, scope: !1666)
!1699 = !DILocation(line: 17, column: 1, scope: !1666)
!1700 = !DILocalVariable(name: "errnum", arg: 1, scope: !29, file: !30, line: 2, type: !6)
!1701 = !DILocation(line: 2, column: 36, scope: !29)
!1702 = !DILocation(line: 8, column: 13, scope: !29)
!1703 = !DILocation(line: 8, column: 5, scope: !29)
!1704 = !DILocation(line: 11, column: 13, scope: !1705)
!1705 = distinct !DILexicalBlock(scope: !29, file: !30, line: 9, column: 5)
!1706 = !DILocation(line: 13, column: 13, scope: !1705)
!1707 = !DILocation(line: 15, column: 13, scope: !1705)
!1708 = !DILocation(line: 17, column: 13, scope: !1705)
!1709 = !DILocation(line: 19, column: 13, scope: !1705)
!1710 = !DILocation(line: 21, column: 13, scope: !1705)
!1711 = !DILocation(line: 23, column: 13, scope: !1705)
!1712 = !DILocation(line: 25, column: 1, scope: !29)
!1713 = distinct !DISubprogram(name: "__fizzer_model__memchr", scope: !1714, file: !1714, line: 2, type: !1715, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !138, retainedNodes: !63)
!1714 = !DIFile(filename: "data/models/c/std/string/memchr.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "eb41c2475f9bcc7c01385e05d30fa3e5")
!1715 = !DISubroutineType(types: !1716)
!1716 = !{!143, !1717, !6, !1719}
!1717 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1718, size: 32)
!1718 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!1719 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1720, line: 8, baseType: !210)
!1720 = !DIFile(filename: "data/models/c/std/string/memchr.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "af02b37770d7a7765f9edfc9d8d94d59")
!1721 = !DILocalVariable(name: "s", arg: 1, scope: !1713, file: !1714, line: 2, type: !1717)
!1722 = !DILocation(line: 2, column: 42, scope: !1713)
!1723 = !DILocalVariable(name: "c", arg: 2, scope: !1713, file: !1714, line: 2, type: !6)
!1724 = !DILocation(line: 2, column: 49, scope: !1713)
!1725 = !DILocalVariable(name: "n", arg: 3, scope: !1713, file: !1714, line: 2, type: !1719)
!1726 = !DILocation(line: 2, column: 59, scope: !1713)
!1727 = !DILocalVariable(name: "p", scope: !1713, file: !1714, line: 4, type: !141)
!1728 = !DILocation(line: 4, column: 26, scope: !1713)
!1729 = !DILocation(line: 4, column: 53, scope: !1713)
!1730 = !DILocalVariable(name: "i", scope: !1713, file: !1714, line: 5, type: !1719)
!1731 = !DILocation(line: 5, column: 12, scope: !1713)
!1732 = !DILocation(line: 7, column: 5, scope: !1713)
!1733 = !DILocation(line: 7, column: 12, scope: !1713)
!1734 = !DILocation(line: 7, column: 16, scope: !1713)
!1735 = !DILocation(line: 7, column: 14, scope: !1713)
!1736 = !DILocation(line: 9, column: 13, scope: !1737)
!1737 = distinct !DILexicalBlock(scope: !1738, file: !1714, line: 9, column: 13)
!1738 = distinct !DILexicalBlock(scope: !1713, file: !1714, line: 8, column: 5)
!1739 = !DILocation(line: 9, column: 15, scope: !1737)
!1740 = !DILocation(line: 9, column: 36, scope: !1737)
!1741 = !DILocation(line: 9, column: 21, scope: !1737)
!1742 = !DILocation(line: 9, column: 18, scope: !1737)
!1743 = !DILocation(line: 9, column: 13, scope: !1738)
!1744 = !DILocation(line: 11, column: 29, scope: !1745)
!1745 = distinct !DILexicalBlock(scope: !1737, file: !1714, line: 10, column: 9)
!1746 = !DILocation(line: 11, column: 33, scope: !1745)
!1747 = !DILocation(line: 11, column: 31, scope: !1745)
!1748 = !DILocation(line: 11, column: 13, scope: !1745)
!1749 = !DILocation(line: 13, column: 10, scope: !1738)
!1750 = distinct !{!1750, !1732, !1751, !238}
!1751 = !DILocation(line: 14, column: 5, scope: !1713)
!1752 = !DILocation(line: 15, column: 5, scope: !1713)
!1753 = !DILocation(line: 16, column: 1, scope: !1713)
!1754 = distinct !DISubprogram(name: "__fizzer_model__strlen", scope: !1755, file: !1755, line: 2, type: !1756, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !144, retainedNodes: !63)
!1755 = !DIFile(filename: "data/models/c/std/string/strlen.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "02927e422ac203a0e84c9a608c987af4")
!1756 = !DISubroutineType(types: !1757)
!1757 = !{!1758, !73}
!1758 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1759, line: 8, baseType: !210)
!1759 = !DIFile(filename: "data/models/c/std/string/strlen.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "b08c6e51a3e99f12523321dfde78fc5e")
!1760 = !DILocalVariable(name: "s", arg: 1, scope: !1754, file: !1755, line: 2, type: !73)
!1761 = !DILocation(line: 2, column: 43, scope: !1754)
!1762 = !DILocalVariable(name: "n", scope: !1754, file: !1755, line: 4, type: !1758)
!1763 = !DILocation(line: 4, column: 12, scope: !1754)
!1764 = !DILocation(line: 5, column: 5, scope: !1754)
!1765 = !DILocation(line: 5, column: 12, scope: !1754)
!1766 = !DILocation(line: 5, column: 14, scope: !1754)
!1767 = !DILocation(line: 5, column: 17, scope: !1754)
!1768 = !DILocation(line: 7, column: 10, scope: !1769)
!1769 = distinct !DILexicalBlock(scope: !1754, file: !1755, line: 6, column: 5)
!1770 = distinct !{!1770, !1764, !1771, !238}
!1771 = !DILocation(line: 8, column: 5, scope: !1754)
!1772 = !DILocation(line: 9, column: 12, scope: !1754)
!1773 = !DILocation(line: 9, column: 5, scope: !1754)
!1774 = !DILocalVariable(name: "s", arg: 1, scope: !69, file: !70, line: 2, type: !13)
!1775 = !DILocation(line: 2, column: 36, scope: !69)
!1776 = !DILocalVariable(name: "delim", arg: 2, scope: !69, file: !70, line: 2, type: !73)
!1777 = !DILocation(line: 2, column: 51, scope: !69)
!1778 = !DILocation(line: 6, column: 9, scope: !1779)
!1779 = distinct !DILexicalBlock(scope: !69, file: !70, line: 6, column: 9)
!1780 = !DILocation(line: 6, column: 11, scope: !1779)
!1781 = !DILocation(line: 6, column: 9, scope: !69)
!1782 = !DILocation(line: 8, column: 13, scope: !1783)
!1783 = distinct !DILexicalBlock(scope: !1779, file: !70, line: 7, column: 5)
!1784 = !DILocation(line: 8, column: 11, scope: !1783)
!1785 = !DILocation(line: 9, column: 5, scope: !1783)
!1786 = !DILocation(line: 11, column: 9, scope: !1787)
!1787 = distinct !DILexicalBlock(scope: !69, file: !70, line: 11, column: 9)
!1788 = !DILocation(line: 11, column: 11, scope: !1787)
!1789 = !DILocation(line: 11, column: 9, scope: !69)
!1790 = !DILocation(line: 13, column: 9, scope: !1791)
!1791 = distinct !DILexicalBlock(scope: !1787, file: !70, line: 12, column: 5)
!1792 = !DILocation(line: 17, column: 5, scope: !69)
!1793 = !DILocation(line: 17, column: 13, scope: !69)
!1794 = !DILocation(line: 17, column: 12, scope: !69)
!1795 = !DILocation(line: 17, column: 15, scope: !69)
!1796 = !DILocalVariable(name: "d", scope: !1797, file: !70, line: 19, type: !73)
!1797 = distinct !DILexicalBlock(scope: !69, file: !70, line: 18, column: 5)
!1798 = !DILocation(line: 19, column: 21, scope: !1797)
!1799 = !DILocation(line: 19, column: 25, scope: !1797)
!1800 = !DILocation(line: 20, column: 9, scope: !1797)
!1801 = !DILocation(line: 20, column: 17, scope: !1797)
!1802 = !DILocation(line: 20, column: 16, scope: !1797)
!1803 = !DILocation(line: 20, column: 19, scope: !1797)
!1804 = !DILocation(line: 20, column: 24, scope: !1797)
!1805 = !DILocation(line: 20, column: 28, scope: !1797)
!1806 = !DILocation(line: 20, column: 27, scope: !1797)
!1807 = !DILocation(line: 20, column: 34, scope: !1797)
!1808 = !DILocation(line: 20, column: 33, scope: !1797)
!1809 = !DILocation(line: 20, column: 30, scope: !1797)
!1810 = !DILocation(line: 0, scope: !1797)
!1811 = !DILocation(line: 22, column: 14, scope: !1812)
!1812 = distinct !DILexicalBlock(scope: !1797, file: !70, line: 21, column: 9)
!1813 = distinct !{!1813, !1800, !1814, !238}
!1814 = !DILocation(line: 23, column: 9, scope: !1797)
!1815 = !DILocation(line: 24, column: 14, scope: !1816)
!1816 = distinct !DILexicalBlock(scope: !1797, file: !70, line: 24, column: 13)
!1817 = !DILocation(line: 24, column: 13, scope: !1816)
!1818 = !DILocation(line: 24, column: 16, scope: !1816)
!1819 = !DILocation(line: 24, column: 13, scope: !1797)
!1820 = !DILocation(line: 26, column: 13, scope: !1821)
!1821 = distinct !DILexicalBlock(scope: !1816, file: !70, line: 25, column: 9)
!1822 = !DILocation(line: 28, column: 10, scope: !1797)
!1823 = distinct !{!1823, !1792, !1824, !238}
!1824 = !DILocation(line: 29, column: 5, scope: !69)
!1825 = !DILocation(line: 31, column: 10, scope: !1826)
!1826 = distinct !DILexicalBlock(scope: !69, file: !70, line: 31, column: 9)
!1827 = !DILocation(line: 31, column: 9, scope: !1826)
!1828 = !DILocation(line: 31, column: 12, scope: !1826)
!1829 = !DILocation(line: 31, column: 9, scope: !69)
!1830 = !DILocation(line: 33, column: 14, scope: !1831)
!1831 = distinct !DILexicalBlock(scope: !1826, file: !70, line: 32, column: 5)
!1832 = !DILocation(line: 34, column: 9, scope: !1831)
!1833 = !DILocalVariable(name: "token", scope: !69, file: !70, line: 37, type: !13)
!1834 = !DILocation(line: 37, column: 11, scope: !69)
!1835 = !DILocation(line: 37, column: 19, scope: !69)
!1836 = !DILocation(line: 40, column: 5, scope: !69)
!1837 = !DILocation(line: 40, column: 13, scope: !69)
!1838 = !DILocation(line: 40, column: 12, scope: !69)
!1839 = !DILocation(line: 40, column: 15, scope: !69)
!1840 = !DILocalVariable(name: "d", scope: !1841, file: !70, line: 42, type: !73)
!1841 = distinct !DILexicalBlock(scope: !69, file: !70, line: 41, column: 5)
!1842 = !DILocation(line: 42, column: 21, scope: !1841)
!1843 = !DILocation(line: 42, column: 25, scope: !1841)
!1844 = !DILocation(line: 43, column: 9, scope: !1841)
!1845 = !DILocation(line: 43, column: 17, scope: !1841)
!1846 = !DILocation(line: 43, column: 16, scope: !1841)
!1847 = !DILocation(line: 43, column: 19, scope: !1841)
!1848 = !DILocation(line: 43, column: 24, scope: !1841)
!1849 = !DILocation(line: 43, column: 28, scope: !1841)
!1850 = !DILocation(line: 43, column: 27, scope: !1841)
!1851 = !DILocation(line: 43, column: 34, scope: !1841)
!1852 = !DILocation(line: 43, column: 33, scope: !1841)
!1853 = !DILocation(line: 43, column: 30, scope: !1841)
!1854 = !DILocation(line: 0, scope: !1841)
!1855 = !DILocation(line: 45, column: 14, scope: !1856)
!1856 = distinct !DILexicalBlock(scope: !1841, file: !70, line: 44, column: 9)
!1857 = distinct !{!1857, !1844, !1858, !238}
!1858 = !DILocation(line: 46, column: 9, scope: !1841)
!1859 = !DILocation(line: 47, column: 14, scope: !1860)
!1860 = distinct !DILexicalBlock(scope: !1841, file: !70, line: 47, column: 13)
!1861 = !DILocation(line: 47, column: 13, scope: !1860)
!1862 = !DILocation(line: 47, column: 16, scope: !1860)
!1863 = !DILocation(line: 47, column: 13, scope: !1841)
!1864 = !DILocation(line: 49, column: 13, scope: !1865)
!1865 = distinct !DILexicalBlock(scope: !1860, file: !70, line: 48, column: 9)
!1866 = !DILocation(line: 51, column: 10, scope: !1841)
!1867 = distinct !{!1867, !1836, !1868, !238}
!1868 = !DILocation(line: 52, column: 5, scope: !69)
!1869 = !DILocation(line: 54, column: 10, scope: !1870)
!1870 = distinct !DILexicalBlock(scope: !69, file: !70, line: 54, column: 9)
!1871 = !DILocation(line: 54, column: 9, scope: !1870)
!1872 = !DILocation(line: 54, column: 12, scope: !1870)
!1873 = !DILocation(line: 54, column: 9, scope: !69)
!1874 = !DILocation(line: 56, column: 10, scope: !1875)
!1875 = distinct !DILexicalBlock(scope: !1870, file: !70, line: 55, column: 5)
!1876 = !DILocation(line: 56, column: 12, scope: !1875)
!1877 = !DILocation(line: 57, column: 10, scope: !1875)
!1878 = !DILocation(line: 58, column: 16, scope: !1875)
!1879 = !DILocation(line: 58, column: 14, scope: !1875)
!1880 = !DILocation(line: 59, column: 5, scope: !1875)
!1881 = !DILocation(line: 62, column: 14, scope: !1882)
!1882 = distinct !DILexicalBlock(scope: !1870, file: !70, line: 61, column: 5)
!1883 = !DILocation(line: 65, column: 12, scope: !69)
!1884 = !DILocation(line: 65, column: 5, scope: !69)
!1885 = !DILocation(line: 66, column: 1, scope: !69)
!1886 = distinct !DISubprogram(name: "__fizzer_model__strxfrm", scope: !1887, file: !1887, line: 2, type: !1888, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !146, retainedNodes: !63)
!1887 = !DIFile(filename: "data/models/c/std/string/strxfrm.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "989278973572eb57b2d093785a278add")
!1888 = !DISubroutineType(types: !1889)
!1889 = !{!1890, !13, !73, !1890}
!1890 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1891, line: 8, baseType: !210)
!1891 = !DIFile(filename: "data/models/c/std/string/strxfrm.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "710e97a829760447cb50814df00571f8")
!1892 = !DILocalVariable(name: "dest", arg: 1, scope: !1886, file: !1887, line: 2, type: !13)
!1893 = !DILocation(line: 2, column: 38, scope: !1886)
!1894 = !DILocalVariable(name: "src", arg: 2, scope: !1886, file: !1887, line: 2, type: !73)
!1895 = !DILocation(line: 2, column: 56, scope: !1886)
!1896 = !DILocalVariable(name: "n", arg: 3, scope: !1886, file: !1887, line: 2, type: !1890)
!1897 = !DILocation(line: 2, column: 68, scope: !1886)
!1898 = !DILocalVariable(name: "len", scope: !1886, file: !1887, line: 4, type: !1890)
!1899 = !DILocation(line: 4, column: 12, scope: !1886)
!1900 = !DILocalVariable(name: "s", scope: !1886, file: !1887, line: 5, type: !73)
!1901 = !DILocation(line: 5, column: 17, scope: !1886)
!1902 = !DILocation(line: 5, column: 21, scope: !1886)
!1903 = !DILocation(line: 8, column: 5, scope: !1886)
!1904 = !DILocation(line: 8, column: 13, scope: !1886)
!1905 = !DILocation(line: 8, column: 12, scope: !1886)
!1906 = !DILocation(line: 8, column: 15, scope: !1886)
!1907 = !DILocation(line: 10, column: 12, scope: !1908)
!1908 = distinct !DILexicalBlock(scope: !1886, file: !1887, line: 9, column: 5)
!1909 = !DILocation(line: 11, column: 10, scope: !1908)
!1910 = distinct !{!1910, !1903, !1911, !238}
!1911 = !DILocation(line: 12, column: 5, scope: !1886)
!1912 = !DILocation(line: 15, column: 9, scope: !1913)
!1913 = distinct !DILexicalBlock(scope: !1886, file: !1887, line: 15, column: 9)
!1914 = !DILocation(line: 15, column: 11, scope: !1913)
!1915 = !DILocation(line: 15, column: 9, scope: !1886)
!1916 = !DILocalVariable(name: "i", scope: !1917, file: !1887, line: 17, type: !1890)
!1917 = distinct !DILexicalBlock(scope: !1913, file: !1887, line: 16, column: 5)
!1918 = !DILocation(line: 17, column: 16, scope: !1917)
!1919 = !DILocation(line: 18, column: 9, scope: !1917)
!1920 = !DILocation(line: 18, column: 16, scope: !1917)
!1921 = !DILocation(line: 18, column: 20, scope: !1917)
!1922 = !DILocation(line: 18, column: 22, scope: !1917)
!1923 = !DILocation(line: 18, column: 18, scope: !1917)
!1924 = !DILocation(line: 18, column: 26, scope: !1917)
!1925 = !DILocation(line: 18, column: 29, scope: !1917)
!1926 = !DILocation(line: 18, column: 33, scope: !1917)
!1927 = !DILocation(line: 18, column: 36, scope: !1917)
!1928 = !DILocation(line: 0, scope: !1917)
!1929 = !DILocation(line: 20, column: 23, scope: !1930)
!1930 = distinct !DILexicalBlock(scope: !1917, file: !1887, line: 19, column: 9)
!1931 = !DILocation(line: 20, column: 27, scope: !1930)
!1932 = !DILocation(line: 20, column: 13, scope: !1930)
!1933 = !DILocation(line: 20, column: 18, scope: !1930)
!1934 = !DILocation(line: 20, column: 21, scope: !1930)
!1935 = !DILocation(line: 21, column: 14, scope: !1930)
!1936 = distinct !{!1936, !1919, !1937, !238}
!1937 = !DILocation(line: 22, column: 9, scope: !1917)
!1938 = !DILocation(line: 23, column: 9, scope: !1917)
!1939 = !DILocation(line: 23, column: 14, scope: !1917)
!1940 = !DILocation(line: 23, column: 17, scope: !1917)
!1941 = !DILocation(line: 24, column: 5, scope: !1917)
!1942 = !DILocation(line: 26, column: 12, scope: !1886)
!1943 = !DILocation(line: 26, column: 5, scope: !1886)
!1944 = distinct !DISubprogram(name: "__fizzer_model__iscntrl", scope: !1945, file: !1945, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !148, retainedNodes: !63)
!1945 = !DIFile(filename: "data/models/c/std/ctype/iscntrl.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "1d16fabd886360902b60cd5383ecd536")
!1946 = !DILocalVariable(name: "c", arg: 1, scope: !1944, file: !1945, line: 2, type: !6)
!1947 = !DILocation(line: 2, column: 33, scope: !1944)
!1948 = !DILocation(line: 4, column: 10, scope: !1949)
!1949 = distinct !DILexicalBlock(scope: !1944, file: !1945, line: 4, column: 9)
!1950 = !DILocation(line: 4, column: 12, scope: !1949)
!1951 = !DILocation(line: 4, column: 17, scope: !1949)
!1952 = !DILocation(line: 4, column: 20, scope: !1949)
!1953 = !DILocation(line: 4, column: 22, scope: !1949)
!1954 = !DILocation(line: 4, column: 29, scope: !1949)
!1955 = !DILocation(line: 4, column: 32, scope: !1949)
!1956 = !DILocation(line: 4, column: 34, scope: !1949)
!1957 = !DILocation(line: 4, column: 9, scope: !1944)
!1958 = !DILocation(line: 6, column: 9, scope: !1959)
!1959 = distinct !DILexicalBlock(scope: !1949, file: !1945, line: 5, column: 5)
!1960 = !DILocation(line: 8, column: 5, scope: !1944)
!1961 = !DILocation(line: 9, column: 1, scope: !1944)
!1962 = distinct !DISubprogram(name: "__fizzer_model__isxdigit", scope: !1963, file: !1963, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !150, retainedNodes: !63)
!1963 = !DIFile(filename: "data/models/c/std/ctype/isxdigit.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "0abf049bb725434344eee06d1063bde8")
!1964 = !DILocalVariable(name: "c", arg: 1, scope: !1962, file: !1963, line: 2, type: !6)
!1965 = !DILocation(line: 2, column: 34, scope: !1962)
!1966 = !DILocation(line: 4, column: 34, scope: !1967)
!1967 = distinct !DILexicalBlock(scope: !1962, file: !1963, line: 4, column: 9)
!1968 = !DILocation(line: 4, column: 10, scope: !1967)
!1969 = !DILocation(line: 4, column: 38, scope: !1967)
!1970 = !DILocation(line: 5, column: 10, scope: !1967)
!1971 = !DILocation(line: 5, column: 12, scope: !1967)
!1972 = !DILocation(line: 5, column: 19, scope: !1967)
!1973 = !DILocation(line: 5, column: 22, scope: !1967)
!1974 = !DILocation(line: 5, column: 24, scope: !1967)
!1975 = !DILocation(line: 5, column: 32, scope: !1967)
!1976 = !DILocation(line: 6, column: 10, scope: !1967)
!1977 = !DILocation(line: 6, column: 12, scope: !1967)
!1978 = !DILocation(line: 6, column: 19, scope: !1967)
!1979 = !DILocation(line: 6, column: 22, scope: !1967)
!1980 = !DILocation(line: 6, column: 24, scope: !1967)
!1981 = !DILocation(line: 4, column: 9, scope: !1962)
!1982 = !DILocation(line: 8, column: 9, scope: !1983)
!1983 = distinct !DILexicalBlock(scope: !1967, file: !1963, line: 7, column: 5)
!1984 = !DILocation(line: 10, column: 5, scope: !1962)
!1985 = !DILocation(line: 11, column: 1, scope: !1962)
!1986 = distinct !DISubprogram(name: "__fizzer_model__isalnum", scope: !1987, file: !1987, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !152, retainedNodes: !63)
!1987 = !DIFile(filename: "data/models/c/std/ctype/isalnum.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "6bbe9a062fcf4ea45225490b0c0403ef")
!1988 = !DILocalVariable(name: "c", arg: 1, scope: !1986, file: !1987, line: 2, type: !6)
!1989 = !DILocation(line: 2, column: 33, scope: !1986)
!1990 = !DILocation(line: 4, column: 33, scope: !1991)
!1991 = distinct !DILexicalBlock(scope: !1986, file: !1987, line: 4, column: 9)
!1992 = !DILocation(line: 4, column: 9, scope: !1991)
!1993 = !DILocation(line: 4, column: 36, scope: !1991)
!1994 = !DILocation(line: 4, column: 63, scope: !1991)
!1995 = !DILocation(line: 4, column: 39, scope: !1991)
!1996 = !DILocation(line: 4, column: 9, scope: !1986)
!1997 = !DILocation(line: 6, column: 9, scope: !1998)
!1998 = distinct !DILexicalBlock(scope: !1991, file: !1987, line: 5, column: 5)
!1999 = !DILocation(line: 8, column: 5, scope: !1986)
!2000 = !DILocation(line: 9, column: 1, scope: !1986)
!2001 = distinct !DISubprogram(name: "__fizzer_model__isspace", scope: !2002, file: !2002, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !154, retainedNodes: !63)
!2002 = !DIFile(filename: "data/models/c/std/ctype/isspace.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "9ab9a851c14ac485b9c69b251ca4421f")
!2003 = !DILocalVariable(name: "c", arg: 1, scope: !2001, file: !2002, line: 2, type: !6)
!2004 = !DILocation(line: 2, column: 33, scope: !2001)
!2005 = !DILocation(line: 4, column: 9, scope: !2006)
!2006 = distinct !DILexicalBlock(scope: !2001, file: !2002, line: 4, column: 9)
!2007 = !DILocation(line: 4, column: 11, scope: !2006)
!2008 = !DILocation(line: 4, column: 18, scope: !2006)
!2009 = !DILocation(line: 4, column: 21, scope: !2006)
!2010 = !DILocation(line: 4, column: 23, scope: !2006)
!2011 = !DILocation(line: 4, column: 31, scope: !2006)
!2012 = !DILocation(line: 4, column: 34, scope: !2006)
!2013 = !DILocation(line: 4, column: 36, scope: !2006)
!2014 = !DILocation(line: 4, column: 44, scope: !2006)
!2015 = !DILocation(line: 4, column: 47, scope: !2006)
!2016 = !DILocation(line: 4, column: 49, scope: !2006)
!2017 = !DILocation(line: 4, column: 57, scope: !2006)
!2018 = !DILocation(line: 4, column: 60, scope: !2006)
!2019 = !DILocation(line: 4, column: 62, scope: !2006)
!2020 = !DILocation(line: 4, column: 70, scope: !2006)
!2021 = !DILocation(line: 4, column: 73, scope: !2006)
!2022 = !DILocation(line: 4, column: 75, scope: !2006)
!2023 = !DILocation(line: 4, column: 9, scope: !2001)
!2024 = !DILocation(line: 6, column: 9, scope: !2025)
!2025 = distinct !DILexicalBlock(scope: !2006, file: !2002, line: 5, column: 5)
!2026 = !DILocation(line: 8, column: 5, scope: !2001)
!2027 = !DILocation(line: 9, column: 1, scope: !2001)
!2028 = distinct !DISubprogram(name: "__fizzer_model__isalpha", scope: !2029, file: !2029, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !156, retainedNodes: !63)
!2029 = !DIFile(filename: "data/models/c/std/ctype/isalpha.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "ec45d1a23298cf8353ee76bfbe3010f4")
!2030 = !DILocalVariable(name: "c", arg: 1, scope: !2028, file: !2029, line: 2, type: !6)
!2031 = !DILocation(line: 2, column: 33, scope: !2028)
!2032 = !DILocation(line: 4, column: 10, scope: !2033)
!2033 = distinct !DILexicalBlock(scope: !2028, file: !2029, line: 4, column: 9)
!2034 = !DILocation(line: 4, column: 12, scope: !2033)
!2035 = !DILocation(line: 4, column: 19, scope: !2033)
!2036 = !DILocation(line: 4, column: 22, scope: !2033)
!2037 = !DILocation(line: 4, column: 24, scope: !2033)
!2038 = !DILocation(line: 4, column: 32, scope: !2033)
!2039 = !DILocation(line: 4, column: 36, scope: !2033)
!2040 = !DILocation(line: 4, column: 38, scope: !2033)
!2041 = !DILocation(line: 4, column: 45, scope: !2033)
!2042 = !DILocation(line: 4, column: 48, scope: !2033)
!2043 = !DILocation(line: 4, column: 50, scope: !2033)
!2044 = !DILocation(line: 4, column: 9, scope: !2028)
!2045 = !DILocation(line: 6, column: 9, scope: !2046)
!2046 = distinct !DILexicalBlock(scope: !2033, file: !2029, line: 5, column: 5)
!2047 = !DILocation(line: 8, column: 5, scope: !2028)
!2048 = !DILocation(line: 9, column: 1, scope: !2028)
!2049 = distinct !DISubprogram(name: "__fizzer_model__isblank", scope: !2050, file: !2050, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !158, retainedNodes: !63)
!2050 = !DIFile(filename: "data/models/c/std/ctype/isblank.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "4469204b656f7c8f7e1807d1f4e59567")
!2051 = !DILocalVariable(name: "c", arg: 1, scope: !2049, file: !2050, line: 2, type: !6)
!2052 = !DILocation(line: 2, column: 33, scope: !2049)
!2053 = !DILocation(line: 4, column: 9, scope: !2054)
!2054 = distinct !DILexicalBlock(scope: !2049, file: !2050, line: 4, column: 9)
!2055 = !DILocation(line: 4, column: 11, scope: !2054)
!2056 = !DILocation(line: 4, column: 18, scope: !2054)
!2057 = !DILocation(line: 4, column: 21, scope: !2054)
!2058 = !DILocation(line: 4, column: 23, scope: !2054)
!2059 = !DILocation(line: 4, column: 9, scope: !2049)
!2060 = !DILocation(line: 6, column: 9, scope: !2061)
!2061 = distinct !DILexicalBlock(scope: !2054, file: !2050, line: 5, column: 5)
!2062 = !DILocation(line: 8, column: 5, scope: !2049)
!2063 = !DILocation(line: 9, column: 1, scope: !2049)
!2064 = distinct !DISubprogram(name: "__fizzer_model__islower", scope: !2065, file: !2065, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !160, retainedNodes: !63)
!2065 = !DIFile(filename: "data/models/c/std/ctype/islower.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "7f0db237b2957c408137ff19b95b9f37")
!2066 = !DILocalVariable(name: "c", arg: 1, scope: !2064, file: !2065, line: 2, type: !6)
!2067 = !DILocation(line: 2, column: 33, scope: !2064)
!2068 = !DILocation(line: 4, column: 9, scope: !2069)
!2069 = distinct !DILexicalBlock(scope: !2064, file: !2065, line: 4, column: 9)
!2070 = !DILocation(line: 4, column: 11, scope: !2069)
!2071 = !DILocation(line: 4, column: 18, scope: !2069)
!2072 = !DILocation(line: 4, column: 21, scope: !2069)
!2073 = !DILocation(line: 4, column: 23, scope: !2069)
!2074 = !DILocation(line: 4, column: 9, scope: !2064)
!2075 = !DILocation(line: 6, column: 9, scope: !2076)
!2076 = distinct !DILexicalBlock(scope: !2069, file: !2065, line: 5, column: 5)
!2077 = !DILocation(line: 8, column: 5, scope: !2064)
!2078 = !DILocation(line: 9, column: 1, scope: !2064)
!2079 = distinct !DISubprogram(name: "__fizzer_model__isdigit", scope: !2080, file: !2080, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !162, retainedNodes: !63)
!2080 = !DIFile(filename: "data/models/c/std/ctype/isdigit.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "9967dfc55f3c5b9e8a34a1c12ab51128")
!2081 = !DILocalVariable(name: "c", arg: 1, scope: !2079, file: !2080, line: 2, type: !6)
!2082 = !DILocation(line: 2, column: 33, scope: !2079)
!2083 = !DILocation(line: 4, column: 9, scope: !2084)
!2084 = distinct !DILexicalBlock(scope: !2079, file: !2080, line: 4, column: 9)
!2085 = !DILocation(line: 4, column: 11, scope: !2084)
!2086 = !DILocation(line: 4, column: 18, scope: !2084)
!2087 = !DILocation(line: 4, column: 21, scope: !2084)
!2088 = !DILocation(line: 4, column: 23, scope: !2084)
!2089 = !DILocation(line: 4, column: 9, scope: !2079)
!2090 = !DILocation(line: 6, column: 9, scope: !2091)
!2091 = distinct !DILexicalBlock(scope: !2084, file: !2080, line: 5, column: 5)
!2092 = !DILocation(line: 8, column: 5, scope: !2079)
!2093 = !DILocation(line: 9, column: 1, scope: !2079)
!2094 = distinct !DISubprogram(name: "__fizzer_model__toupper", scope: !2095, file: !2095, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !164, retainedNodes: !63)
!2095 = !DIFile(filename: "data/models/c/std/ctype/toupper.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "35ae67ebdb17b245d732ce3603fdfa64")
!2096 = !DILocalVariable(name: "c", arg: 1, scope: !2094, file: !2095, line: 2, type: !6)
!2097 = !DILocation(line: 2, column: 33, scope: !2094)
!2098 = !DILocation(line: 4, column: 33, scope: !2099)
!2099 = distinct !DILexicalBlock(scope: !2094, file: !2095, line: 4, column: 9)
!2100 = !DILocation(line: 4, column: 9, scope: !2099)
!2101 = !DILocation(line: 4, column: 9, scope: !2094)
!2102 = !DILocation(line: 6, column: 16, scope: !2103)
!2103 = distinct !DILexicalBlock(scope: !2099, file: !2095, line: 5, column: 5)
!2104 = !DILocation(line: 6, column: 18, scope: !2103)
!2105 = !DILocation(line: 6, column: 24, scope: !2103)
!2106 = !DILocation(line: 6, column: 9, scope: !2103)
!2107 = !DILocation(line: 8, column: 12, scope: !2094)
!2108 = !DILocation(line: 8, column: 5, scope: !2094)
!2109 = !DILocation(line: 9, column: 1, scope: !2094)
!2110 = distinct !DISubprogram(name: "__fizzer_model__isprint", scope: !2111, file: !2111, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !166, retainedNodes: !63)
!2111 = !DIFile(filename: "data/models/c/std/ctype/isprint.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "d8538a5b382a98a36fe86b916256fcc7")
!2112 = !DILocalVariable(name: "c", arg: 1, scope: !2110, file: !2111, line: 2, type: !6)
!2113 = !DILocation(line: 2, column: 33, scope: !2110)
!2114 = !DILocation(line: 4, column: 9, scope: !2115)
!2115 = distinct !DILexicalBlock(scope: !2110, file: !2111, line: 4, column: 9)
!2116 = !DILocation(line: 4, column: 11, scope: !2115)
!2117 = !DILocation(line: 4, column: 17, scope: !2115)
!2118 = !DILocation(line: 4, column: 20, scope: !2115)
!2119 = !DILocation(line: 4, column: 22, scope: !2115)
!2120 = !DILocation(line: 4, column: 9, scope: !2110)
!2121 = !DILocation(line: 6, column: 9, scope: !2122)
!2122 = distinct !DILexicalBlock(scope: !2115, file: !2111, line: 5, column: 5)
!2123 = !DILocation(line: 8, column: 5, scope: !2110)
!2124 = !DILocation(line: 9, column: 1, scope: !2110)
!2125 = distinct !DISubprogram(name: "__fizzer_model__isupper", scope: !2126, file: !2126, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !168, retainedNodes: !63)
!2126 = !DIFile(filename: "data/models/c/std/ctype/isupper.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "c2334b5acdb0a1b26cc08f11cf47c244")
!2127 = !DILocalVariable(name: "c", arg: 1, scope: !2125, file: !2126, line: 2, type: !6)
!2128 = !DILocation(line: 2, column: 33, scope: !2125)
!2129 = !DILocation(line: 4, column: 9, scope: !2130)
!2130 = distinct !DILexicalBlock(scope: !2125, file: !2126, line: 4, column: 9)
!2131 = !DILocation(line: 4, column: 11, scope: !2130)
!2132 = !DILocation(line: 4, column: 18, scope: !2130)
!2133 = !DILocation(line: 4, column: 21, scope: !2130)
!2134 = !DILocation(line: 4, column: 23, scope: !2130)
!2135 = !DILocation(line: 4, column: 9, scope: !2125)
!2136 = !DILocation(line: 6, column: 9, scope: !2137)
!2137 = distinct !DILexicalBlock(scope: !2130, file: !2126, line: 5, column: 5)
!2138 = !DILocation(line: 8, column: 5, scope: !2125)
!2139 = !DILocation(line: 9, column: 1, scope: !2125)
!2140 = distinct !DISubprogram(name: "__fizzer_model__tolower", scope: !2141, file: !2141, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !170, retainedNodes: !63)
!2141 = !DIFile(filename: "data/models/c/std/ctype/tolower.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "7faecd1bd1600a814e6c8b43347332c3")
!2142 = !DILocalVariable(name: "c", arg: 1, scope: !2140, file: !2141, line: 2, type: !6)
!2143 = !DILocation(line: 2, column: 33, scope: !2140)
!2144 = !DILocation(line: 4, column: 33, scope: !2145)
!2145 = distinct !DILexicalBlock(scope: !2140, file: !2141, line: 4, column: 9)
!2146 = !DILocation(line: 4, column: 9, scope: !2145)
!2147 = !DILocation(line: 4, column: 9, scope: !2140)
!2148 = !DILocation(line: 6, column: 16, scope: !2149)
!2149 = distinct !DILexicalBlock(scope: !2145, file: !2141, line: 5, column: 5)
!2150 = !DILocation(line: 6, column: 18, scope: !2149)
!2151 = !DILocation(line: 6, column: 24, scope: !2149)
!2152 = !DILocation(line: 6, column: 9, scope: !2149)
!2153 = !DILocation(line: 8, column: 12, scope: !2140)
!2154 = !DILocation(line: 8, column: 5, scope: !2140)
!2155 = !DILocation(line: 9, column: 1, scope: !2140)
!2156 = distinct !DISubprogram(name: "__fizzer_model__isgraph", scope: !2157, file: !2157, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !172, retainedNodes: !63)
!2157 = !DIFile(filename: "data/models/c/std/ctype/isgraph.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "53707fda19088bc8e89fad78f4c3a13f")
!2158 = !DILocalVariable(name: "c", arg: 1, scope: !2156, file: !2157, line: 2, type: !6)
!2159 = !DILocation(line: 2, column: 33, scope: !2156)
!2160 = !DILocation(line: 4, column: 9, scope: !2161)
!2161 = distinct !DILexicalBlock(scope: !2156, file: !2157, line: 4, column: 9)
!2162 = !DILocation(line: 4, column: 11, scope: !2161)
!2163 = !DILocation(line: 4, column: 17, scope: !2161)
!2164 = !DILocation(line: 4, column: 20, scope: !2161)
!2165 = !DILocation(line: 4, column: 22, scope: !2161)
!2166 = !DILocation(line: 4, column: 9, scope: !2156)
!2167 = !DILocation(line: 6, column: 9, scope: !2168)
!2168 = distinct !DILexicalBlock(scope: !2161, file: !2157, line: 5, column: 5)
!2169 = !DILocation(line: 8, column: 5, scope: !2156)
!2170 = !DILocation(line: 9, column: 1, scope: !2156)
!2171 = distinct !DISubprogram(name: "__fizzer_model__snprintf", scope: !2172, file: !2172, line: 2, type: !2173, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !174, retainedNodes: !63)
!2172 = !DIFile(filename: "data/models/c/std/stdio/snprintf.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "76bc06d30e021e08fbd62dcb20d50aff")
!2173 = !DISubroutineType(types: !2174)
!2174 = !{!6, !13, !2175, !73, null}
!2175 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2176, line: 8, baseType: !210)
!2176 = !DIFile(filename: "data/models/c/std/stdio/snprintf.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "3041458efcb1c5564be86cab3319404a")
!2177 = !DILocalVariable(name: "str", arg: 1, scope: !2171, file: !2172, line: 2, type: !13)
!2178 = !DILocation(line: 2, column: 36, scope: !2171)
!2179 = !DILocalVariable(name: "size", arg: 2, scope: !2171, file: !2172, line: 2, type: !2175)
!2180 = !DILocation(line: 2, column: 48, scope: !2171)
!2181 = !DILocalVariable(name: "format", arg: 3, scope: !2171, file: !2172, line: 2, type: !73)
!2182 = !DILocation(line: 2, column: 66, scope: !2171)
!2183 = !DILocalVariable(name: "ap", scope: !2171, file: !2172, line: 4, type: !2184)
!2184 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !2176, line: 14, baseType: !2185)
!2185 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !2172, baseType: !13)
!2186 = !DILocation(line: 4, column: 13, scope: !2171)
!2187 = !DILocation(line: 5, column: 5, scope: !2171)
!2188 = !DILocalVariable(name: "result", scope: !2171, file: !2172, line: 6, type: !6)
!2189 = !DILocation(line: 6, column: 9, scope: !2171)
!2190 = !DILocation(line: 6, column: 44, scope: !2171)
!2191 = !DILocation(line: 6, column: 49, scope: !2171)
!2192 = !DILocation(line: 6, column: 55, scope: !2171)
!2193 = !DILocation(line: 6, column: 63, scope: !2171)
!2194 = !DILocation(line: 6, column: 18, scope: !2171)
!2195 = !DILocation(line: 7, column: 5, scope: !2171)
!2196 = !DILocation(line: 8, column: 12, scope: !2171)
!2197 = !DILocation(line: 8, column: 5, scope: !2171)
!2198 = distinct !DISubprogram(name: "__fizzer_model__sprintf", scope: !2199, file: !2199, line: 2, type: !2200, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !176, retainedNodes: !63)
!2199 = !DIFile(filename: "data/models/c/std/stdio/sprintf.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "56f45916c6775fca737b2a248636b9a4")
!2200 = !DISubroutineType(types: !2201)
!2201 = !{!6, !13, !73, null}
!2202 = !DILocalVariable(name: "str", arg: 1, scope: !2198, file: !2199, line: 2, type: !13)
!2203 = !DILocation(line: 2, column: 35, scope: !2198)
!2204 = !DILocalVariable(name: "format", arg: 2, scope: !2198, file: !2199, line: 2, type: !73)
!2205 = !DILocation(line: 2, column: 52, scope: !2198)
!2206 = !DILocalVariable(name: "ap", scope: !2198, file: !2199, line: 4, type: !2207)
!2207 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !2208, line: 4, baseType: !2209)
!2208 = !DIFile(filename: "data/models/c/std/stdio/sprintf.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "d6124a58b9c67c791cdec6fe4c5e48a1")
!2209 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !2199, baseType: !13)
!2210 = !DILocation(line: 4, column: 13, scope: !2198)
!2211 = !DILocation(line: 5, column: 5, scope: !2198)
!2212 = !DILocalVariable(name: "result", scope: !2198, file: !2199, line: 6, type: !6)
!2213 = !DILocation(line: 6, column: 9, scope: !2198)
!2214 = !DILocation(line: 6, column: 43, scope: !2198)
!2215 = !DILocation(line: 6, column: 48, scope: !2198)
!2216 = !DILocation(line: 6, column: 56, scope: !2198)
!2217 = !DILocation(line: 6, column: 18, scope: !2198)
!2218 = !DILocation(line: 7, column: 5, scope: !2198)
!2219 = !DILocation(line: 8, column: 12, scope: !2198)
!2220 = !DILocation(line: 8, column: 5, scope: !2198)
!2221 = distinct !DISubprogram(name: "__fizzer_model__vsprintf", scope: !2222, file: !2222, line: 2, type: !2223, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !178, retainedNodes: !63)
!2222 = !DIFile(filename: "data/models/c/std/stdio/vsprintf.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "108c7547e9301a0fdafaac5451fdb696")
!2223 = !DISubroutineType(types: !2224)
!2224 = !{!6, !13, !73, !2225}
!2225 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !2226, line: 14, baseType: !2227)
!2226 = !DIFile(filename: "data/models/c/std/stdio/vsprintf.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "22dc0c17cd450f7813777d9af49e0ce8")
!2227 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !2222, baseType: !13)
!2228 = !DILocalVariable(name: "str", arg: 1, scope: !2221, file: !2222, line: 2, type: !13)
!2229 = !DILocation(line: 2, column: 36, scope: !2221)
!2230 = !DILocalVariable(name: "format", arg: 2, scope: !2221, file: !2222, line: 2, type: !73)
!2231 = !DILocation(line: 2, column: 53, scope: !2221)
!2232 = !DILocalVariable(name: "ap", arg: 3, scope: !2221, file: !2222, line: 2, type: !2225)
!2233 = !DILocation(line: 2, column: 69, scope: !2221)
!2234 = !DILocalVariable(name: "i", scope: !2221, file: !2222, line: 4, type: !2235)
!2235 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2226, line: 8, baseType: !210)
!2236 = !DILocation(line: 4, column: 12, scope: !2221)
!2237 = !DILocalVariable(name: "j", scope: !2221, file: !2222, line: 5, type: !2235)
!2238 = !DILocation(line: 5, column: 12, scope: !2221)
!2239 = !DILocation(line: 7, column: 5, scope: !2221)
!2240 = !DILocation(line: 7, column: 12, scope: !2221)
!2241 = !DILocation(line: 7, column: 19, scope: !2221)
!2242 = !DILocation(line: 7, column: 22, scope: !2221)
!2243 = !DILocation(line: 9, column: 13, scope: !2244)
!2244 = distinct !DILexicalBlock(scope: !2245, file: !2222, line: 9, column: 13)
!2245 = distinct !DILexicalBlock(scope: !2221, file: !2222, line: 8, column: 5)
!2246 = !DILocation(line: 9, column: 20, scope: !2244)
!2247 = !DILocation(line: 9, column: 23, scope: !2244)
!2248 = !DILocation(line: 9, column: 13, scope: !2245)
!2249 = !DILocation(line: 11, column: 14, scope: !2250)
!2250 = distinct !DILexicalBlock(scope: !2244, file: !2222, line: 10, column: 9)
!2251 = !DILocation(line: 12, column: 17, scope: !2252)
!2252 = distinct !DILexicalBlock(scope: !2250, file: !2222, line: 12, column: 17)
!2253 = !DILocation(line: 12, column: 24, scope: !2252)
!2254 = !DILocation(line: 12, column: 27, scope: !2252)
!2255 = !DILocation(line: 12, column: 17, scope: !2250)
!2256 = !DILocation(line: 14, column: 17, scope: !2257)
!2257 = distinct !DILexicalBlock(scope: !2252, file: !2222, line: 13, column: 13)
!2258 = !DILocation(line: 17, column: 17, scope: !2259)
!2259 = distinct !DILexicalBlock(scope: !2250, file: !2222, line: 17, column: 17)
!2260 = !DILocation(line: 17, column: 24, scope: !2259)
!2261 = !DILocation(line: 17, column: 27, scope: !2259)
!2262 = !DILocation(line: 17, column: 17, scope: !2250)
!2263 = !DILocalVariable(name: "val", scope: !2264, file: !2222, line: 19, type: !6)
!2264 = distinct !DILexicalBlock(scope: !2259, file: !2222, line: 18, column: 13)
!2265 = !DILocation(line: 19, column: 21, scope: !2264)
!2266 = !DILocation(line: 19, column: 27, scope: !2264)
!2267 = !DILocalVariable(name: "buf", scope: !2264, file: !2222, line: 20, type: !2268)
!2268 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 256, elements: !2269)
!2269 = !{!2270}
!2270 = !DISubrange(count: 32)
!2271 = !DILocation(line: 20, column: 22, scope: !2264)
!2272 = !DILocation(line: 21, column: 45, scope: !2264)
!2273 = !DILocation(line: 21, column: 50, scope: !2264)
!2274 = !DILocation(line: 21, column: 17, scope: !2264)
!2275 = !DILocalVariable(name: "k", scope: !2264, file: !2222, line: 22, type: !2235)
!2276 = !DILocation(line: 22, column: 24, scope: !2264)
!2277 = !DILocation(line: 23, column: 17, scope: !2264)
!2278 = !DILocation(line: 23, column: 28, scope: !2264)
!2279 = !DILocation(line: 23, column: 24, scope: !2264)
!2280 = !DILocation(line: 23, column: 31, scope: !2264)
!2281 = !DILocation(line: 25, column: 34, scope: !2282)
!2282 = distinct !DILexicalBlock(scope: !2264, file: !2222, line: 24, column: 17)
!2283 = !DILocation(line: 25, column: 30, scope: !2282)
!2284 = !DILocation(line: 25, column: 21, scope: !2282)
!2285 = !DILocation(line: 25, column: 25, scope: !2282)
!2286 = !DILocation(line: 25, column: 28, scope: !2282)
!2287 = !DILocation(line: 26, column: 22, scope: !2282)
!2288 = !DILocation(line: 27, column: 22, scope: !2282)
!2289 = distinct !{!2289, !2277, !2290, !238}
!2290 = !DILocation(line: 28, column: 17, scope: !2264)
!2291 = !DILocation(line: 29, column: 13, scope: !2264)
!2292 = !DILocation(line: 30, column: 22, scope: !2293)
!2293 = distinct !DILexicalBlock(scope: !2259, file: !2222, line: 30, column: 22)
!2294 = !DILocation(line: 30, column: 29, scope: !2293)
!2295 = !DILocation(line: 30, column: 32, scope: !2293)
!2296 = !DILocation(line: 30, column: 22, scope: !2259)
!2297 = !DILocalVariable(name: "val", scope: !2298, file: !2222, line: 32, type: !210)
!2298 = distinct !DILexicalBlock(scope: !2293, file: !2222, line: 31, column: 13)
!2299 = !DILocation(line: 32, column: 30, scope: !2298)
!2300 = !DILocation(line: 32, column: 36, scope: !2298)
!2301 = !DILocalVariable(name: "buf", scope: !2298, file: !2222, line: 33, type: !2268)
!2302 = !DILocation(line: 33, column: 22, scope: !2298)
!2303 = !DILocation(line: 34, column: 50, scope: !2298)
!2304 = !DILocation(line: 34, column: 55, scope: !2298)
!2305 = !DILocation(line: 34, column: 17, scope: !2298)
!2306 = !DILocalVariable(name: "k", scope: !2298, file: !2222, line: 35, type: !2235)
!2307 = !DILocation(line: 35, column: 24, scope: !2298)
!2308 = !DILocation(line: 36, column: 17, scope: !2298)
!2309 = !DILocation(line: 36, column: 28, scope: !2298)
!2310 = !DILocation(line: 36, column: 24, scope: !2298)
!2311 = !DILocation(line: 36, column: 31, scope: !2298)
!2312 = !DILocation(line: 38, column: 34, scope: !2313)
!2313 = distinct !DILexicalBlock(scope: !2298, file: !2222, line: 37, column: 17)
!2314 = !DILocation(line: 38, column: 30, scope: !2313)
!2315 = !DILocation(line: 38, column: 21, scope: !2313)
!2316 = !DILocation(line: 38, column: 25, scope: !2313)
!2317 = !DILocation(line: 38, column: 28, scope: !2313)
!2318 = !DILocation(line: 39, column: 22, scope: !2313)
!2319 = !DILocation(line: 40, column: 22, scope: !2313)
!2320 = distinct !{!2320, !2308, !2321, !238}
!2321 = !DILocation(line: 41, column: 17, scope: !2298)
!2322 = !DILocation(line: 42, column: 13, scope: !2298)
!2323 = !DILocation(line: 43, column: 22, scope: !2324)
!2324 = distinct !DILexicalBlock(scope: !2293, file: !2222, line: 43, column: 22)
!2325 = !DILocation(line: 43, column: 29, scope: !2324)
!2326 = !DILocation(line: 43, column: 32, scope: !2324)
!2327 = !DILocation(line: 43, column: 22, scope: !2293)
!2328 = !DILocalVariable(name: "val", scope: !2329, file: !2222, line: 45, type: !210)
!2329 = distinct !DILexicalBlock(scope: !2324, file: !2222, line: 44, column: 13)
!2330 = !DILocation(line: 45, column: 30, scope: !2329)
!2331 = !DILocation(line: 45, column: 36, scope: !2329)
!2332 = !DILocalVariable(name: "buf", scope: !2329, file: !2222, line: 46, type: !2268)
!2333 = !DILocation(line: 46, column: 22, scope: !2329)
!2334 = !DILocation(line: 47, column: 50, scope: !2329)
!2335 = !DILocation(line: 47, column: 55, scope: !2329)
!2336 = !DILocation(line: 47, column: 17, scope: !2329)
!2337 = !DILocalVariable(name: "k", scope: !2329, file: !2222, line: 48, type: !2235)
!2338 = !DILocation(line: 48, column: 24, scope: !2329)
!2339 = !DILocation(line: 49, column: 17, scope: !2329)
!2340 = !DILocation(line: 49, column: 28, scope: !2329)
!2341 = !DILocation(line: 49, column: 24, scope: !2329)
!2342 = !DILocation(line: 49, column: 31, scope: !2329)
!2343 = !DILocation(line: 51, column: 34, scope: !2344)
!2344 = distinct !DILexicalBlock(scope: !2329, file: !2222, line: 50, column: 17)
!2345 = !DILocation(line: 51, column: 30, scope: !2344)
!2346 = !DILocation(line: 51, column: 21, scope: !2344)
!2347 = !DILocation(line: 51, column: 25, scope: !2344)
!2348 = !DILocation(line: 51, column: 28, scope: !2344)
!2349 = !DILocation(line: 52, column: 22, scope: !2344)
!2350 = !DILocation(line: 53, column: 22, scope: !2344)
!2351 = distinct !{!2351, !2339, !2352, !238}
!2352 = !DILocation(line: 54, column: 17, scope: !2329)
!2353 = !DILocation(line: 55, column: 13, scope: !2329)
!2354 = !DILocation(line: 56, column: 22, scope: !2355)
!2355 = distinct !DILexicalBlock(scope: !2324, file: !2222, line: 56, column: 22)
!2356 = !DILocation(line: 56, column: 29, scope: !2355)
!2357 = !DILocation(line: 56, column: 32, scope: !2355)
!2358 = !DILocation(line: 56, column: 22, scope: !2324)
!2359 = !DILocalVariable(name: "c", scope: !2360, file: !2222, line: 58, type: !14)
!2360 = distinct !DILexicalBlock(scope: !2355, file: !2222, line: 57, column: 13)
!2361 = !DILocation(line: 58, column: 22, scope: !2360)
!2362 = !DILocation(line: 58, column: 32, scope: !2360)
!2363 = !DILocation(line: 58, column: 26, scope: !2360)
!2364 = !DILocation(line: 59, column: 26, scope: !2360)
!2365 = !DILocation(line: 59, column: 17, scope: !2360)
!2366 = !DILocation(line: 59, column: 21, scope: !2360)
!2367 = !DILocation(line: 59, column: 24, scope: !2360)
!2368 = !DILocation(line: 60, column: 18, scope: !2360)
!2369 = !DILocation(line: 61, column: 13, scope: !2360)
!2370 = !DILocation(line: 62, column: 22, scope: !2371)
!2371 = distinct !DILexicalBlock(scope: !2355, file: !2222, line: 62, column: 22)
!2372 = !DILocation(line: 62, column: 29, scope: !2371)
!2373 = !DILocation(line: 62, column: 32, scope: !2371)
!2374 = !DILocation(line: 62, column: 22, scope: !2355)
!2375 = !DILocalVariable(name: "s", scope: !2376, file: !2222, line: 64, type: !13)
!2376 = distinct !DILexicalBlock(scope: !2371, file: !2222, line: 63, column: 13)
!2377 = !DILocation(line: 64, column: 23, scope: !2376)
!2378 = !DILocation(line: 64, column: 27, scope: !2376)
!2379 = !DILocalVariable(name: "k", scope: !2376, file: !2222, line: 65, type: !2235)
!2380 = !DILocation(line: 65, column: 24, scope: !2376)
!2381 = !DILocation(line: 66, column: 17, scope: !2376)
!2382 = !DILocation(line: 66, column: 24, scope: !2376)
!2383 = !DILocation(line: 66, column: 26, scope: !2376)
!2384 = !DILocation(line: 66, column: 29, scope: !2376)
!2385 = !DILocation(line: 68, column: 30, scope: !2386)
!2386 = distinct !DILexicalBlock(scope: !2376, file: !2222, line: 67, column: 17)
!2387 = !DILocation(line: 68, column: 32, scope: !2386)
!2388 = !DILocation(line: 68, column: 21, scope: !2386)
!2389 = !DILocation(line: 68, column: 25, scope: !2386)
!2390 = !DILocation(line: 68, column: 28, scope: !2386)
!2391 = !DILocation(line: 69, column: 22, scope: !2386)
!2392 = !DILocation(line: 70, column: 22, scope: !2386)
!2393 = distinct !{!2393, !2381, !2394, !238}
!2394 = !DILocation(line: 71, column: 17, scope: !2376)
!2395 = !DILocation(line: 72, column: 13, scope: !2376)
!2396 = !DILocation(line: 75, column: 26, scope: !2397)
!2397 = distinct !DILexicalBlock(scope: !2371, file: !2222, line: 74, column: 13)
!2398 = !DILocation(line: 75, column: 33, scope: !2397)
!2399 = !DILocation(line: 75, column: 17, scope: !2397)
!2400 = !DILocation(line: 75, column: 21, scope: !2397)
!2401 = !DILocation(line: 75, column: 24, scope: !2397)
!2402 = !DILocation(line: 76, column: 18, scope: !2397)
!2403 = !DILocation(line: 79, column: 14, scope: !2250)
!2404 = !DILocation(line: 80, column: 9, scope: !2250)
!2405 = !DILocation(line: 83, column: 22, scope: !2406)
!2406 = distinct !DILexicalBlock(scope: !2244, file: !2222, line: 82, column: 9)
!2407 = !DILocation(line: 83, column: 29, scope: !2406)
!2408 = !DILocation(line: 83, column: 13, scope: !2406)
!2409 = !DILocation(line: 83, column: 17, scope: !2406)
!2410 = !DILocation(line: 83, column: 20, scope: !2406)
!2411 = !DILocation(line: 84, column: 14, scope: !2406)
!2412 = !DILocation(line: 85, column: 14, scope: !2406)
!2413 = distinct !{!2413, !2239, !2414, !238}
!2414 = !DILocation(line: 87, column: 5, scope: !2221)
!2415 = !DILocation(line: 89, column: 5, scope: !2221)
!2416 = !DILocation(line: 89, column: 9, scope: !2221)
!2417 = !DILocation(line: 89, column: 12, scope: !2221)
!2418 = !DILocation(line: 91, column: 17, scope: !2221)
!2419 = !DILocation(line: 91, column: 5, scope: !2221)
!2420 = distinct !DISubprogram(name: "__fizzer_model__helper_itoa", scope: !2421, file: !2421, line: 2, type: !2422, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !181, retainedNodes: !63)
!2421 = !DIFile(filename: "data/models/c/std/stdio/helper_itoa.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "20d31603d5d66432f19663f52fc24b10")
!2422 = !DISubroutineType(types: !2423)
!2423 = !{null, !6, !13, !6}
!2424 = !DILocalVariable(name: "value", arg: 1, scope: !2420, file: !2421, line: 2, type: !6)
!2425 = !DILocation(line: 2, column: 38, scope: !2420)
!2426 = !DILocalVariable(name: "buffer", arg: 2, scope: !2420, file: !2421, line: 2, type: !13)
!2427 = !DILocation(line: 2, column: 51, scope: !2420)
!2428 = !DILocalVariable(name: "base", arg: 3, scope: !2420, file: !2421, line: 2, type: !6)
!2429 = !DILocation(line: 2, column: 63, scope: !2420)
!2430 = !DILocalVariable(name: "temp", scope: !2420, file: !2421, line: 4, type: !2268)
!2431 = !DILocation(line: 4, column: 10, scope: !2420)
!2432 = !DILocalVariable(name: "i", scope: !2420, file: !2421, line: 5, type: !6)
!2433 = !DILocation(line: 5, column: 9, scope: !2420)
!2434 = !DILocalVariable(name: "is_negative", scope: !2420, file: !2421, line: 6, type: !6)
!2435 = !DILocation(line: 6, column: 9, scope: !2420)
!2436 = !DILocation(line: 8, column: 9, scope: !2437)
!2437 = distinct !DILexicalBlock(scope: !2420, file: !2421, line: 8, column: 9)
!2438 = !DILocation(line: 8, column: 15, scope: !2437)
!2439 = !DILocation(line: 8, column: 19, scope: !2437)
!2440 = !DILocation(line: 8, column: 22, scope: !2437)
!2441 = !DILocation(line: 8, column: 27, scope: !2437)
!2442 = !DILocation(line: 8, column: 9, scope: !2420)
!2443 = !DILocation(line: 10, column: 21, scope: !2444)
!2444 = distinct !DILexicalBlock(scope: !2437, file: !2421, line: 9, column: 5)
!2445 = !DILocation(line: 11, column: 18, scope: !2444)
!2446 = !DILocation(line: 11, column: 17, scope: !2444)
!2447 = !DILocation(line: 11, column: 15, scope: !2444)
!2448 = !DILocation(line: 12, column: 5, scope: !2444)
!2449 = !DILocation(line: 14, column: 9, scope: !2450)
!2450 = distinct !DILexicalBlock(scope: !2420, file: !2421, line: 14, column: 9)
!2451 = !DILocation(line: 14, column: 15, scope: !2450)
!2452 = !DILocation(line: 14, column: 9, scope: !2420)
!2453 = !DILocation(line: 16, column: 9, scope: !2454)
!2454 = distinct !DILexicalBlock(scope: !2450, file: !2421, line: 15, column: 5)
!2455 = !DILocation(line: 16, column: 19, scope: !2454)
!2456 = !DILocation(line: 17, column: 9, scope: !2454)
!2457 = !DILocation(line: 17, column: 19, scope: !2454)
!2458 = !DILocation(line: 18, column: 9, scope: !2454)
!2459 = !DILocation(line: 21, column: 5, scope: !2420)
!2460 = !DILocation(line: 21, column: 12, scope: !2420)
!2461 = !DILocation(line: 21, column: 18, scope: !2420)
!2462 = !DILocalVariable(name: "rem", scope: !2463, file: !2421, line: 23, type: !6)
!2463 = distinct !DILexicalBlock(scope: !2420, file: !2421, line: 22, column: 5)
!2464 = !DILocation(line: 23, column: 13, scope: !2463)
!2465 = !DILocation(line: 23, column: 19, scope: !2463)
!2466 = !DILocation(line: 23, column: 27, scope: !2463)
!2467 = !DILocation(line: 23, column: 25, scope: !2463)
!2468 = !DILocation(line: 24, column: 13, scope: !2469)
!2469 = distinct !DILexicalBlock(scope: !2463, file: !2421, line: 24, column: 13)
!2470 = !DILocation(line: 24, column: 17, scope: !2469)
!2471 = !DILocation(line: 24, column: 13, scope: !2463)
!2472 = !DILocation(line: 26, column: 29, scope: !2473)
!2473 = distinct !DILexicalBlock(scope: !2469, file: !2421, line: 25, column: 9)
!2474 = !DILocation(line: 26, column: 27, scope: !2473)
!2475 = !DILocation(line: 26, column: 23, scope: !2473)
!2476 = !DILocation(line: 26, column: 18, scope: !2473)
!2477 = !DILocation(line: 26, column: 13, scope: !2473)
!2478 = !DILocation(line: 26, column: 21, scope: !2473)
!2479 = !DILocation(line: 27, column: 9, scope: !2473)
!2480 = !DILocation(line: 30, column: 30, scope: !2481)
!2481 = distinct !DILexicalBlock(scope: !2469, file: !2421, line: 29, column: 9)
!2482 = !DILocation(line: 30, column: 34, scope: !2481)
!2483 = !DILocation(line: 30, column: 27, scope: !2481)
!2484 = !DILocation(line: 30, column: 23, scope: !2481)
!2485 = !DILocation(line: 30, column: 18, scope: !2481)
!2486 = !DILocation(line: 30, column: 13, scope: !2481)
!2487 = !DILocation(line: 30, column: 21, scope: !2481)
!2488 = !DILocation(line: 32, column: 17, scope: !2463)
!2489 = !DILocation(line: 32, column: 25, scope: !2463)
!2490 = !DILocation(line: 32, column: 23, scope: !2463)
!2491 = !DILocation(line: 32, column: 15, scope: !2463)
!2492 = !DILocation(line: 33, column: 10, scope: !2463)
!2493 = distinct !{!2493, !2459, !2494, !238}
!2494 = !DILocation(line: 34, column: 5, scope: !2420)
!2495 = !DILocalVariable(name: "j", scope: !2420, file: !2421, line: 36, type: !6)
!2496 = !DILocation(line: 36, column: 9, scope: !2420)
!2497 = !DILocation(line: 37, column: 9, scope: !2498)
!2498 = distinct !DILexicalBlock(scope: !2420, file: !2421, line: 37, column: 9)
!2499 = !DILocation(line: 37, column: 9, scope: !2420)
!2500 = !DILocation(line: 39, column: 9, scope: !2501)
!2501 = distinct !DILexicalBlock(scope: !2498, file: !2421, line: 38, column: 5)
!2502 = !DILocation(line: 39, column: 16, scope: !2501)
!2503 = !DILocation(line: 39, column: 19, scope: !2501)
!2504 = !DILocation(line: 40, column: 10, scope: !2501)
!2505 = !DILocation(line: 41, column: 5, scope: !2501)
!2506 = !DILocation(line: 43, column: 5, scope: !2420)
!2507 = !DILocation(line: 43, column: 12, scope: !2420)
!2508 = !DILocation(line: 43, column: 14, scope: !2420)
!2509 = !DILocation(line: 45, column: 10, scope: !2510)
!2510 = distinct !DILexicalBlock(scope: !2420, file: !2421, line: 44, column: 5)
!2511 = !DILocation(line: 46, column: 26, scope: !2510)
!2512 = !DILocation(line: 46, column: 21, scope: !2510)
!2513 = !DILocation(line: 46, column: 9, scope: !2510)
!2514 = !DILocation(line: 46, column: 16, scope: !2510)
!2515 = !DILocation(line: 46, column: 19, scope: !2510)
!2516 = !DILocation(line: 47, column: 10, scope: !2510)
!2517 = distinct !{!2517, !2506, !2518, !238}
!2518 = !DILocation(line: 48, column: 5, scope: !2420)
!2519 = !DILocation(line: 50, column: 5, scope: !2420)
!2520 = !DILocation(line: 50, column: 12, scope: !2420)
!2521 = !DILocation(line: 50, column: 15, scope: !2420)
!2522 = !DILocation(line: 51, column: 1, scope: !2420)
!2523 = distinct !DISubprogram(name: "__fizzer_model__vsnprintf", scope: !2524, file: !2524, line: 2, type: !2525, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !183, retainedNodes: !63)
!2524 = !DIFile(filename: "data/models/c/std/stdio/vsnprintf.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "97ba02a558780981a4df185c06cf20d5")
!2525 = !DISubroutineType(types: !2526)
!2526 = !{!6, !13, !2527, !73, !2529}
!2527 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2528, line: 8, baseType: !210)
!2528 = !DIFile(filename: "data/models/c/std/stdio/vsnprintf.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "811d6d74b8b56631aab99e8a3863ea0c")
!2529 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !2528, line: 14, baseType: !2530)
!2530 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !2524, baseType: !13)
!2531 = !DILocalVariable(name: "str", arg: 1, scope: !2523, file: !2524, line: 2, type: !13)
!2532 = !DILocation(line: 2, column: 37, scope: !2523)
!2533 = !DILocalVariable(name: "size", arg: 2, scope: !2523, file: !2524, line: 2, type: !2527)
!2534 = !DILocation(line: 2, column: 49, scope: !2523)
!2535 = !DILocalVariable(name: "format", arg: 3, scope: !2523, file: !2524, line: 2, type: !73)
!2536 = !DILocation(line: 2, column: 67, scope: !2523)
!2537 = !DILocalVariable(name: "ap", arg: 4, scope: !2523, file: !2524, line: 2, type: !2529)
!2538 = !DILocation(line: 2, column: 83, scope: !2523)
!2539 = !DILocalVariable(name: "i", scope: !2523, file: !2524, line: 4, type: !2527)
!2540 = !DILocation(line: 4, column: 12, scope: !2523)
!2541 = !DILocalVariable(name: "j", scope: !2523, file: !2524, line: 5, type: !2527)
!2542 = !DILocation(line: 5, column: 12, scope: !2523)
!2543 = !DILocation(line: 7, column: 9, scope: !2544)
!2544 = distinct !DILexicalBlock(scope: !2523, file: !2524, line: 7, column: 9)
!2545 = !DILocation(line: 7, column: 14, scope: !2544)
!2546 = !DILocation(line: 7, column: 9, scope: !2523)
!2547 = !DILocation(line: 9, column: 9, scope: !2548)
!2548 = distinct !DILexicalBlock(scope: !2544, file: !2524, line: 8, column: 5)
!2549 = !DILocation(line: 12, column: 5, scope: !2523)
!2550 = !DILocation(line: 12, column: 12, scope: !2523)
!2551 = !DILocation(line: 12, column: 19, scope: !2523)
!2552 = !DILocation(line: 12, column: 22, scope: !2523)
!2553 = !DILocation(line: 12, column: 27, scope: !2523)
!2554 = !DILocation(line: 12, column: 30, scope: !2523)
!2555 = !DILocation(line: 12, column: 34, scope: !2523)
!2556 = !DILocation(line: 12, column: 39, scope: !2523)
!2557 = !DILocation(line: 12, column: 32, scope: !2523)
!2558 = !DILocation(line: 0, scope: !2523)
!2559 = !DILocation(line: 14, column: 13, scope: !2560)
!2560 = distinct !DILexicalBlock(scope: !2561, file: !2524, line: 14, column: 13)
!2561 = distinct !DILexicalBlock(scope: !2523, file: !2524, line: 13, column: 5)
!2562 = !DILocation(line: 14, column: 20, scope: !2560)
!2563 = !DILocation(line: 14, column: 23, scope: !2560)
!2564 = !DILocation(line: 14, column: 13, scope: !2561)
!2565 = !DILocation(line: 16, column: 14, scope: !2566)
!2566 = distinct !DILexicalBlock(scope: !2560, file: !2524, line: 15, column: 9)
!2567 = !DILocation(line: 17, column: 17, scope: !2568)
!2568 = distinct !DILexicalBlock(scope: !2566, file: !2524, line: 17, column: 17)
!2569 = !DILocation(line: 17, column: 24, scope: !2568)
!2570 = !DILocation(line: 17, column: 27, scope: !2568)
!2571 = !DILocation(line: 17, column: 17, scope: !2566)
!2572 = !DILocation(line: 19, column: 17, scope: !2573)
!2573 = distinct !DILexicalBlock(scope: !2568, file: !2524, line: 18, column: 13)
!2574 = !DILocalVariable(name: "buf", scope: !2566, file: !2524, line: 22, type: !2268)
!2575 = !DILocation(line: 22, column: 18, scope: !2566)
!2576 = !DILocalVariable(name: "k", scope: !2566, file: !2524, line: 23, type: !2527)
!2577 = !DILocation(line: 23, column: 20, scope: !2566)
!2578 = !DILocation(line: 25, column: 17, scope: !2579)
!2579 = distinct !DILexicalBlock(scope: !2566, file: !2524, line: 25, column: 17)
!2580 = !DILocation(line: 25, column: 24, scope: !2579)
!2581 = !DILocation(line: 25, column: 27, scope: !2579)
!2582 = !DILocation(line: 25, column: 17, scope: !2566)
!2583 = !DILocalVariable(name: "val", scope: !2584, file: !2524, line: 27, type: !6)
!2584 = distinct !DILexicalBlock(scope: !2579, file: !2524, line: 26, column: 13)
!2585 = !DILocation(line: 27, column: 21, scope: !2584)
!2586 = !DILocation(line: 27, column: 27, scope: !2584)
!2587 = !DILocation(line: 28, column: 45, scope: !2584)
!2588 = !DILocation(line: 28, column: 50, scope: !2584)
!2589 = !DILocation(line: 28, column: 17, scope: !2584)
!2590 = !DILocation(line: 29, column: 13, scope: !2584)
!2591 = !DILocation(line: 30, column: 22, scope: !2592)
!2592 = distinct !DILexicalBlock(scope: !2579, file: !2524, line: 30, column: 22)
!2593 = !DILocation(line: 30, column: 29, scope: !2592)
!2594 = !DILocation(line: 30, column: 32, scope: !2592)
!2595 = !DILocation(line: 30, column: 22, scope: !2579)
!2596 = !DILocalVariable(name: "val", scope: !2597, file: !2524, line: 32, type: !210)
!2597 = distinct !DILexicalBlock(scope: !2592, file: !2524, line: 31, column: 13)
!2598 = !DILocation(line: 32, column: 30, scope: !2597)
!2599 = !DILocation(line: 32, column: 36, scope: !2597)
!2600 = !DILocation(line: 33, column: 50, scope: !2597)
!2601 = !DILocation(line: 33, column: 55, scope: !2597)
!2602 = !DILocation(line: 33, column: 17, scope: !2597)
!2603 = !DILocation(line: 34, column: 13, scope: !2597)
!2604 = !DILocation(line: 35, column: 22, scope: !2605)
!2605 = distinct !DILexicalBlock(scope: !2592, file: !2524, line: 35, column: 22)
!2606 = !DILocation(line: 35, column: 29, scope: !2605)
!2607 = !DILocation(line: 35, column: 32, scope: !2605)
!2608 = !DILocation(line: 35, column: 22, scope: !2592)
!2609 = !DILocalVariable(name: "val", scope: !2610, file: !2524, line: 37, type: !210)
!2610 = distinct !DILexicalBlock(scope: !2605, file: !2524, line: 36, column: 13)
!2611 = !DILocation(line: 37, column: 30, scope: !2610)
!2612 = !DILocation(line: 37, column: 36, scope: !2610)
!2613 = !DILocation(line: 38, column: 50, scope: !2610)
!2614 = !DILocation(line: 38, column: 55, scope: !2610)
!2615 = !DILocation(line: 38, column: 17, scope: !2610)
!2616 = !DILocation(line: 39, column: 13, scope: !2610)
!2617 = !DILocation(line: 40, column: 22, scope: !2618)
!2618 = distinct !DILexicalBlock(scope: !2605, file: !2524, line: 40, column: 22)
!2619 = !DILocation(line: 40, column: 29, scope: !2618)
!2620 = !DILocation(line: 40, column: 32, scope: !2618)
!2621 = !DILocation(line: 40, column: 22, scope: !2605)
!2622 = !DILocation(line: 42, column: 32, scope: !2623)
!2623 = distinct !DILexicalBlock(scope: !2618, file: !2524, line: 41, column: 13)
!2624 = !DILocation(line: 42, column: 26, scope: !2623)
!2625 = !DILocation(line: 42, column: 17, scope: !2623)
!2626 = !DILocation(line: 42, column: 24, scope: !2623)
!2627 = !DILocation(line: 43, column: 17, scope: !2623)
!2628 = !DILocation(line: 43, column: 24, scope: !2623)
!2629 = !DILocation(line: 44, column: 13, scope: !2623)
!2630 = !DILocation(line: 45, column: 22, scope: !2631)
!2631 = distinct !DILexicalBlock(scope: !2618, file: !2524, line: 45, column: 22)
!2632 = !DILocation(line: 45, column: 29, scope: !2631)
!2633 = !DILocation(line: 45, column: 32, scope: !2631)
!2634 = !DILocation(line: 45, column: 22, scope: !2618)
!2635 = !DILocalVariable(name: "s", scope: !2636, file: !2524, line: 47, type: !13)
!2636 = distinct !DILexicalBlock(scope: !2631, file: !2524, line: 46, column: 13)
!2637 = !DILocation(line: 47, column: 23, scope: !2636)
!2638 = !DILocation(line: 47, column: 27, scope: !2636)
!2639 = !DILocation(line: 48, column: 19, scope: !2636)
!2640 = !DILocation(line: 49, column: 17, scope: !2636)
!2641 = !DILocation(line: 49, column: 24, scope: !2636)
!2642 = !DILocation(line: 49, column: 26, scope: !2636)
!2643 = !DILocation(line: 49, column: 29, scope: !2636)
!2644 = !DILocation(line: 49, column: 34, scope: !2636)
!2645 = !DILocation(line: 49, column: 37, scope: !2636)
!2646 = !DILocation(line: 49, column: 41, scope: !2636)
!2647 = !DILocation(line: 49, column: 46, scope: !2636)
!2648 = !DILocation(line: 49, column: 39, scope: !2636)
!2649 = !DILocation(line: 0, scope: !2636)
!2650 = !DILocation(line: 51, column: 30, scope: !2651)
!2651 = distinct !DILexicalBlock(scope: !2636, file: !2524, line: 50, column: 17)
!2652 = !DILocation(line: 51, column: 32, scope: !2651)
!2653 = !DILocation(line: 51, column: 21, scope: !2651)
!2654 = !DILocation(line: 51, column: 25, scope: !2651)
!2655 = !DILocation(line: 51, column: 28, scope: !2651)
!2656 = !DILocation(line: 52, column: 22, scope: !2651)
!2657 = !DILocation(line: 53, column: 22, scope: !2651)
!2658 = distinct !{!2658, !2640, !2659, !238}
!2659 = !DILocation(line: 54, column: 17, scope: !2636)
!2660 = !DILocation(line: 55, column: 18, scope: !2636)
!2661 = !DILocation(line: 56, column: 17, scope: !2636)
!2662 = distinct !{!2662, !2549, !2663, !238}
!2663 = !DILocation(line: 80, column: 5, scope: !2523)
!2664 = !DILocation(line: 60, column: 26, scope: !2665)
!2665 = distinct !DILexicalBlock(scope: !2631, file: !2524, line: 59, column: 13)
!2666 = !DILocation(line: 60, column: 33, scope: !2665)
!2667 = !DILocation(line: 60, column: 17, scope: !2665)
!2668 = !DILocation(line: 60, column: 24, scope: !2665)
!2669 = !DILocation(line: 61, column: 17, scope: !2665)
!2670 = !DILocation(line: 61, column: 24, scope: !2665)
!2671 = !DILocation(line: 64, column: 15, scope: !2566)
!2672 = !DILocation(line: 65, column: 13, scope: !2566)
!2673 = !DILocation(line: 65, column: 24, scope: !2566)
!2674 = !DILocation(line: 65, column: 20, scope: !2566)
!2675 = !DILocation(line: 65, column: 27, scope: !2566)
!2676 = !DILocation(line: 65, column: 32, scope: !2566)
!2677 = !DILocation(line: 65, column: 35, scope: !2566)
!2678 = !DILocation(line: 65, column: 39, scope: !2566)
!2679 = !DILocation(line: 65, column: 44, scope: !2566)
!2680 = !DILocation(line: 65, column: 37, scope: !2566)
!2681 = !DILocation(line: 0, scope: !2566)
!2682 = !DILocation(line: 67, column: 30, scope: !2683)
!2683 = distinct !DILexicalBlock(scope: !2566, file: !2524, line: 66, column: 13)
!2684 = !DILocation(line: 67, column: 26, scope: !2683)
!2685 = !DILocation(line: 67, column: 17, scope: !2683)
!2686 = !DILocation(line: 67, column: 21, scope: !2683)
!2687 = !DILocation(line: 67, column: 24, scope: !2683)
!2688 = !DILocation(line: 68, column: 18, scope: !2683)
!2689 = !DILocation(line: 69, column: 18, scope: !2683)
!2690 = distinct !{!2690, !2672, !2691, !238}
!2691 = !DILocation(line: 70, column: 13, scope: !2566)
!2692 = !DILocation(line: 72, column: 14, scope: !2566)
!2693 = !DILocation(line: 73, column: 9, scope: !2566)
!2694 = !DILocation(line: 76, column: 22, scope: !2695)
!2695 = distinct !DILexicalBlock(scope: !2560, file: !2524, line: 75, column: 9)
!2696 = !DILocation(line: 76, column: 29, scope: !2695)
!2697 = !DILocation(line: 76, column: 13, scope: !2695)
!2698 = !DILocation(line: 76, column: 17, scope: !2695)
!2699 = !DILocation(line: 76, column: 20, scope: !2695)
!2700 = !DILocation(line: 77, column: 14, scope: !2695)
!2701 = !DILocation(line: 78, column: 14, scope: !2695)
!2702 = !DILocation(line: 82, column: 5, scope: !2523)
!2703 = !DILocation(line: 82, column: 9, scope: !2523)
!2704 = !DILocation(line: 82, column: 12, scope: !2523)
!2705 = !DILocation(line: 83, column: 17, scope: !2523)
!2706 = !DILocation(line: 83, column: 5, scope: !2523)
!2707 = !DILocation(line: 84, column: 1, scope: !2523)
!2708 = distinct !DISubprogram(name: "__fizzer_model__fabsl", scope: !2709, file: !2709, line: 2, type: !2710, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !185, retainedNodes: !63)
!2709 = !DIFile(filename: "data/models/c/std/math/fabsl.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "5c5076ae740114377af63cf033329357")
!2710 = !DISubroutineType(types: !2711)
!2711 = !{!2712, !2712}
!2712 = !DIBasicType(name: "long double", size: 96, encoding: DW_ATE_float)
!2713 = !DILocalVariable(name: "x", arg: 1, scope: !2708, file: !2709, line: 2, type: !2712)
!2714 = !DILocation(line: 2, column: 47, scope: !2708)
!2715 = !DILocation(line: 4, column: 9, scope: !2716)
!2716 = distinct !DILexicalBlock(scope: !2708, file: !2709, line: 4, column: 9)
!2717 = !DILocation(line: 4, column: 11, scope: !2716)
!2718 = !DILocation(line: 4, column: 9, scope: !2708)
!2719 = !DILocation(line: 5, column: 17, scope: !2716)
!2720 = !DILocation(line: 5, column: 16, scope: !2716)
!2721 = !DILocation(line: 5, column: 9, scope: !2716)
!2722 = !DILocation(line: 7, column: 16, scope: !2716)
!2723 = !DILocation(line: 7, column: 9, scope: !2716)
!2724 = !DILocation(line: 8, column: 1, scope: !2708)
!2725 = distinct !DISubprogram(name: "__fizzer_model__fabs", scope: !2726, file: !2726, line: 2, type: !2727, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !187, retainedNodes: !63)
!2726 = !DIFile(filename: "data/models/c/std/math/fabs.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "8c49c577f21ca028a8a9f5afb48aacbb")
!2727 = !DISubroutineType(types: !2728)
!2728 = !{!93, !93}
!2729 = !DILocalVariable(name: "x", arg: 1, scope: !2725, file: !2726, line: 2, type: !93)
!2730 = !DILocation(line: 2, column: 36, scope: !2725)
!2731 = !DILocation(line: 4, column: 9, scope: !2732)
!2732 = distinct !DILexicalBlock(scope: !2725, file: !2726, line: 4, column: 9)
!2733 = !DILocation(line: 4, column: 11, scope: !2732)
!2734 = !DILocation(line: 4, column: 9, scope: !2725)
!2735 = !DILocation(line: 5, column: 17, scope: !2732)
!2736 = !DILocation(line: 5, column: 16, scope: !2732)
!2737 = !DILocation(line: 5, column: 9, scope: !2732)
!2738 = !DILocation(line: 7, column: 16, scope: !2732)
!2739 = !DILocation(line: 7, column: 9, scope: !2732)
!2740 = !DILocation(line: 8, column: 1, scope: !2725)
!2741 = distinct !DISubprogram(name: "__fizzer_model__fabsf", scope: !2742, file: !2742, line: 2, type: !2743, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !189, retainedNodes: !63)
!2742 = !DIFile(filename: "data/models/c/std/math/fabsf.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "b084fca80d77cc63411b9d4b3fe450c4")
!2743 = !DISubroutineType(types: !2744)
!2744 = !{!2745, !2745}
!2745 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!2746 = !DILocalVariable(name: "x", arg: 1, scope: !2741, file: !2742, line: 2, type: !2745)
!2747 = !DILocation(line: 2, column: 35, scope: !2741)
!2748 = !DILocation(line: 4, column: 9, scope: !2749)
!2749 = distinct !DILexicalBlock(scope: !2741, file: !2742, line: 4, column: 9)
!2750 = !DILocation(line: 4, column: 11, scope: !2749)
!2751 = !DILocation(line: 4, column: 9, scope: !2741)
!2752 = !DILocation(line: 5, column: 17, scope: !2749)
!2753 = !DILocation(line: 5, column: 16, scope: !2749)
!2754 = !DILocation(line: 5, column: 9, scope: !2749)
!2755 = !DILocation(line: 7, column: 16, scope: !2749)
!2756 = !DILocation(line: 7, column: 9, scope: !2749)
!2757 = !DILocation(line: 8, column: 1, scope: !2741)
!2758 = distinct !DISubprogram(name: "__fizzer_model__strftime", scope: !2759, file: !2759, line: 3, type: !2760, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !191, retainedNodes: !63)
!2759 = !DIFile(filename: "data/models/c/std/time/strftime.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "60233b54b62040efdc56806d7e2f5c85")
!2760 = !DISubroutineType(types: !2761)
!2761 = !{!2762, !13, !2764, !73, !2766}
!2762 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2763, line: 8, baseType: !210)
!2763 = !DIFile(filename: "data/models/c/std/time/strftime.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "0140443382a318fb7fcf42588cda3812")
!2764 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2765, line: 18, baseType: !210)
!2765 = !DIFile(filename: "/usr/lib/llvm-18/lib/clang/18/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!2766 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2767, size: 32)
!2767 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2768)
!2768 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !2769, line: 7, size: 352, elements: !2770)
!2769 = !DIFile(filename: "/usr/include/bits/types/struct_tm.h", directory: "", checksumkind: CSK_MD5, checksum: "9e5545b565ef031c4cd0faf90b69386f")
!2770 = !{!2771, !2772, !2773, !2774, !2775, !2776, !2777, !2778, !2779, !2780, !2781}
!2771 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !2768, file: !2769, line: 9, baseType: !6, size: 32)
!2772 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !2768, file: !2769, line: 10, baseType: !6, size: 32, offset: 32)
!2773 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !2768, file: !2769, line: 11, baseType: !6, size: 32, offset: 64)
!2774 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !2768, file: !2769, line: 12, baseType: !6, size: 32, offset: 96)
!2775 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !2768, file: !2769, line: 13, baseType: !6, size: 32, offset: 128)
!2776 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !2768, file: !2769, line: 14, baseType: !6, size: 32, offset: 160)
!2777 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !2768, file: !2769, line: 15, baseType: !6, size: 32, offset: 192)
!2778 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !2768, file: !2769, line: 16, baseType: !6, size: 32, offset: 224)
!2779 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !2768, file: !2769, line: 17, baseType: !6, size: 32, offset: 256)
!2780 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !2768, file: !2769, line: 20, baseType: !817, size: 32, offset: 288)
!2781 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !2768, file: !2769, line: 21, baseType: !73, size: 32, offset: 320)
!2782 = !DILocalVariable(name: "s", arg: 1, scope: !2758, file: !2759, line: 3, type: !13)
!2783 = !DILocation(line: 3, column: 39, scope: !2758)
!2784 = !DILocalVariable(name: "max", arg: 2, scope: !2758, file: !2759, line: 3, type: !2764)
!2785 = !DILocation(line: 3, column: 49, scope: !2758)
!2786 = !DILocalVariable(name: "format", arg: 3, scope: !2758, file: !2759, line: 3, type: !73)
!2787 = !DILocation(line: 3, column: 66, scope: !2758)
!2788 = !DILocalVariable(name: "tm", arg: 4, scope: !2758, file: !2759, line: 3, type: !2766)
!2789 = !DILocation(line: 3, column: 91, scope: !2758)
!2790 = !DILocalVariable(name: "i", scope: !2758, file: !2759, line: 5, type: !2764)
!2791 = !DILocation(line: 5, column: 12, scope: !2758)
!2792 = !DILocalVariable(name: "j", scope: !2758, file: !2759, line: 6, type: !2764)
!2793 = !DILocation(line: 6, column: 12, scope: !2758)
!2794 = !DILocalVariable(name: "buf", scope: !2758, file: !2759, line: 8, type: !53)
!2795 = !DILocation(line: 8, column: 10, scope: !2758)
!2796 = !DILocation(line: 10, column: 5, scope: !2758)
!2797 = !DILocation(line: 10, column: 12, scope: !2758)
!2798 = !DILocation(line: 10, column: 19, scope: !2758)
!2799 = !DILocation(line: 10, column: 22, scope: !2758)
!2800 = !DILocation(line: 10, column: 27, scope: !2758)
!2801 = !DILocation(line: 10, column: 30, scope: !2758)
!2802 = !DILocation(line: 10, column: 34, scope: !2758)
!2803 = !DILocation(line: 10, column: 38, scope: !2758)
!2804 = !DILocation(line: 10, column: 32, scope: !2758)
!2805 = !DILocation(line: 0, scope: !2758)
!2806 = !DILocation(line: 12, column: 13, scope: !2807)
!2807 = distinct !DILexicalBlock(scope: !2808, file: !2759, line: 12, column: 13)
!2808 = distinct !DILexicalBlock(scope: !2758, file: !2759, line: 11, column: 5)
!2809 = !DILocation(line: 12, column: 20, scope: !2807)
!2810 = !DILocation(line: 12, column: 23, scope: !2807)
!2811 = !DILocation(line: 12, column: 13, scope: !2808)
!2812 = !DILocation(line: 14, column: 14, scope: !2813)
!2813 = distinct !DILexicalBlock(scope: !2807, file: !2759, line: 13, column: 9)
!2814 = !DILocation(line: 15, column: 17, scope: !2815)
!2815 = distinct !DILexicalBlock(scope: !2813, file: !2759, line: 15, column: 17)
!2816 = !DILocation(line: 15, column: 24, scope: !2815)
!2817 = !DILocation(line: 15, column: 27, scope: !2815)
!2818 = !DILocation(line: 15, column: 17, scope: !2813)
!2819 = !DILocation(line: 17, column: 17, scope: !2820)
!2820 = distinct !DILexicalBlock(scope: !2815, file: !2759, line: 16, column: 13)
!2821 = !DILocalVariable(name: "k", scope: !2813, file: !2759, line: 20, type: !6)
!2822 = !DILocation(line: 20, column: 17, scope: !2813)
!2823 = !DILocation(line: 21, column: 17, scope: !2824)
!2824 = distinct !DILexicalBlock(scope: !2813, file: !2759, line: 21, column: 17)
!2825 = !DILocation(line: 21, column: 24, scope: !2824)
!2826 = !DILocation(line: 21, column: 27, scope: !2824)
!2827 = !DILocation(line: 21, column: 17, scope: !2813)
!2828 = !DILocalVariable(name: "year", scope: !2829, file: !2759, line: 23, type: !6)
!2829 = distinct !DILexicalBlock(scope: !2824, file: !2759, line: 22, column: 13)
!2830 = !DILocation(line: 23, column: 21, scope: !2829)
!2831 = !DILocation(line: 23, column: 35, scope: !2829)
!2832 = !DILocation(line: 23, column: 39, scope: !2829)
!2833 = !DILocation(line: 23, column: 33, scope: !2829)
!2834 = !DILocation(line: 24, column: 45, scope: !2829)
!2835 = !DILocation(line: 24, column: 51, scope: !2829)
!2836 = !DILocation(line: 24, column: 17, scope: !2829)
!2837 = !DILocation(line: 25, column: 13, scope: !2829)
!2838 = !DILocation(line: 26, column: 22, scope: !2839)
!2839 = distinct !DILexicalBlock(scope: !2824, file: !2759, line: 26, column: 22)
!2840 = !DILocation(line: 26, column: 29, scope: !2839)
!2841 = !DILocation(line: 26, column: 32, scope: !2839)
!2842 = !DILocation(line: 26, column: 22, scope: !2824)
!2843 = !DILocalVariable(name: "month", scope: !2844, file: !2759, line: 28, type: !6)
!2844 = distinct !DILexicalBlock(scope: !2839, file: !2759, line: 27, column: 13)
!2845 = !DILocation(line: 28, column: 21, scope: !2844)
!2846 = !DILocation(line: 28, column: 29, scope: !2844)
!2847 = !DILocation(line: 28, column: 33, scope: !2844)
!2848 = !DILocation(line: 28, column: 40, scope: !2844)
!2849 = !DILocation(line: 29, column: 45, scope: !2844)
!2850 = !DILocation(line: 29, column: 52, scope: !2844)
!2851 = !DILocation(line: 29, column: 17, scope: !2844)
!2852 = !DILocation(line: 30, column: 13, scope: !2844)
!2853 = !DILocation(line: 31, column: 22, scope: !2854)
!2854 = distinct !DILexicalBlock(scope: !2839, file: !2759, line: 31, column: 22)
!2855 = !DILocation(line: 31, column: 29, scope: !2854)
!2856 = !DILocation(line: 31, column: 32, scope: !2854)
!2857 = !DILocation(line: 31, column: 22, scope: !2839)
!2858 = !DILocalVariable(name: "day", scope: !2859, file: !2759, line: 33, type: !6)
!2859 = distinct !DILexicalBlock(scope: !2854, file: !2759, line: 32, column: 13)
!2860 = !DILocation(line: 33, column: 21, scope: !2859)
!2861 = !DILocation(line: 33, column: 27, scope: !2859)
!2862 = !DILocation(line: 33, column: 31, scope: !2859)
!2863 = !DILocation(line: 34, column: 45, scope: !2859)
!2864 = !DILocation(line: 34, column: 50, scope: !2859)
!2865 = !DILocation(line: 34, column: 17, scope: !2859)
!2866 = !DILocation(line: 35, column: 13, scope: !2859)
!2867 = !DILocation(line: 36, column: 22, scope: !2868)
!2868 = distinct !DILexicalBlock(scope: !2854, file: !2759, line: 36, column: 22)
!2869 = !DILocation(line: 36, column: 29, scope: !2868)
!2870 = !DILocation(line: 36, column: 32, scope: !2868)
!2871 = !DILocation(line: 36, column: 22, scope: !2854)
!2872 = !DILocalVariable(name: "hour", scope: !2873, file: !2759, line: 38, type: !6)
!2873 = distinct !DILexicalBlock(scope: !2868, file: !2759, line: 37, column: 13)
!2874 = !DILocation(line: 38, column: 21, scope: !2873)
!2875 = !DILocation(line: 38, column: 28, scope: !2873)
!2876 = !DILocation(line: 38, column: 32, scope: !2873)
!2877 = !DILocation(line: 39, column: 45, scope: !2873)
!2878 = !DILocation(line: 39, column: 51, scope: !2873)
!2879 = !DILocation(line: 39, column: 17, scope: !2873)
!2880 = !DILocation(line: 40, column: 13, scope: !2873)
!2881 = !DILocation(line: 41, column: 22, scope: !2882)
!2882 = distinct !DILexicalBlock(scope: !2868, file: !2759, line: 41, column: 22)
!2883 = !DILocation(line: 41, column: 29, scope: !2882)
!2884 = !DILocation(line: 41, column: 32, scope: !2882)
!2885 = !DILocation(line: 41, column: 22, scope: !2868)
!2886 = !DILocalVariable(name: "minute", scope: !2887, file: !2759, line: 43, type: !6)
!2887 = distinct !DILexicalBlock(scope: !2882, file: !2759, line: 42, column: 13)
!2888 = !DILocation(line: 43, column: 21, scope: !2887)
!2889 = !DILocation(line: 43, column: 30, scope: !2887)
!2890 = !DILocation(line: 43, column: 34, scope: !2887)
!2891 = !DILocation(line: 44, column: 45, scope: !2887)
!2892 = !DILocation(line: 44, column: 53, scope: !2887)
!2893 = !DILocation(line: 44, column: 17, scope: !2887)
!2894 = !DILocation(line: 45, column: 13, scope: !2887)
!2895 = !DILocation(line: 46, column: 22, scope: !2896)
!2896 = distinct !DILexicalBlock(scope: !2882, file: !2759, line: 46, column: 22)
!2897 = !DILocation(line: 46, column: 29, scope: !2896)
!2898 = !DILocation(line: 46, column: 32, scope: !2896)
!2899 = !DILocation(line: 46, column: 22, scope: !2882)
!2900 = !DILocalVariable(name: "second", scope: !2901, file: !2759, line: 48, type: !6)
!2901 = distinct !DILexicalBlock(scope: !2896, file: !2759, line: 47, column: 13)
!2902 = !DILocation(line: 48, column: 21, scope: !2901)
!2903 = !DILocation(line: 48, column: 30, scope: !2901)
!2904 = !DILocation(line: 48, column: 34, scope: !2901)
!2905 = !DILocation(line: 49, column: 45, scope: !2901)
!2906 = !DILocation(line: 49, column: 53, scope: !2901)
!2907 = !DILocation(line: 49, column: 17, scope: !2901)
!2908 = !DILocation(line: 50, column: 13, scope: !2901)
!2909 = !DILocation(line: 53, column: 26, scope: !2910)
!2910 = distinct !DILexicalBlock(scope: !2896, file: !2759, line: 52, column: 13)
!2911 = !DILocation(line: 53, column: 33, scope: !2910)
!2912 = !DILocation(line: 53, column: 17, scope: !2910)
!2913 = !DILocation(line: 53, column: 24, scope: !2910)
!2914 = !DILocation(line: 54, column: 17, scope: !2910)
!2915 = !DILocation(line: 54, column: 24, scope: !2910)
!2916 = !DILocation(line: 57, column: 15, scope: !2813)
!2917 = !DILocation(line: 58, column: 13, scope: !2813)
!2918 = !DILocation(line: 58, column: 24, scope: !2813)
!2919 = !DILocation(line: 58, column: 20, scope: !2813)
!2920 = !DILocation(line: 58, column: 27, scope: !2813)
!2921 = !DILocation(line: 58, column: 32, scope: !2813)
!2922 = !DILocation(line: 58, column: 35, scope: !2813)
!2923 = !DILocation(line: 58, column: 39, scope: !2813)
!2924 = !DILocation(line: 58, column: 43, scope: !2813)
!2925 = !DILocation(line: 58, column: 37, scope: !2813)
!2926 = !DILocation(line: 0, scope: !2813)
!2927 = !DILocation(line: 60, column: 28, scope: !2928)
!2928 = distinct !DILexicalBlock(scope: !2813, file: !2759, line: 59, column: 13)
!2929 = !DILocation(line: 60, column: 24, scope: !2928)
!2930 = !DILocation(line: 60, column: 17, scope: !2928)
!2931 = !DILocation(line: 60, column: 19, scope: !2928)
!2932 = !DILocation(line: 60, column: 22, scope: !2928)
!2933 = !DILocation(line: 61, column: 18, scope: !2928)
!2934 = !DILocation(line: 62, column: 18, scope: !2928)
!2935 = distinct !{!2935, !2917, !2936, !238}
!2936 = !DILocation(line: 63, column: 13, scope: !2813)
!2937 = !DILocation(line: 65, column: 14, scope: !2813)
!2938 = !DILocation(line: 66, column: 9, scope: !2813)
!2939 = !DILocation(line: 69, column: 20, scope: !2940)
!2940 = distinct !DILexicalBlock(scope: !2807, file: !2759, line: 68, column: 9)
!2941 = !DILocation(line: 69, column: 27, scope: !2940)
!2942 = !DILocation(line: 69, column: 13, scope: !2940)
!2943 = !DILocation(line: 69, column: 15, scope: !2940)
!2944 = !DILocation(line: 69, column: 18, scope: !2940)
!2945 = !DILocation(line: 70, column: 14, scope: !2940)
!2946 = !DILocation(line: 71, column: 14, scope: !2940)
!2947 = distinct !{!2947, !2796, !2948, !238}
!2948 = !DILocation(line: 73, column: 5, scope: !2758)
!2949 = !DILocation(line: 75, column: 5, scope: !2758)
!2950 = !DILocation(line: 75, column: 7, scope: !2758)
!2951 = !DILocation(line: 75, column: 10, scope: !2758)
!2952 = !DILocation(line: 76, column: 12, scope: !2758)
!2953 = !DILocation(line: 76, column: 5, scope: !2758)
!2954 = distinct !DISubprogram(name: "__fizzer_model__ctime", scope: !2955, file: !2955, line: 2, type: !2956, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !193, retainedNodes: !63)
!2955 = !DIFile(filename: "data/models/c/std/time/ctime.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "a911ddebb345e08702cf6c685c49baca")
!2956 = !DISubroutineType(types: !2957)
!2957 = !{!13, !2958, !13}
!2958 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2959, size: 32)
!2959 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2960)
!2960 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !2961, line: 14, baseType: !817)
!2961 = !DIFile(filename: "data/models/c/std/time/ctime.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "fa159fd5097e337914b2eb75fc3ffc16")
!2962 = !DILocalVariable(name: "timep", arg: 1, scope: !2954, file: !2955, line: 2, type: !2958)
!2963 = !DILocation(line: 2, column: 43, scope: !2954)
!2964 = !DILocalVariable(name: "buffer", arg: 2, scope: !2954, file: !2955, line: 2, type: !13)
!2965 = !DILocation(line: 2, column: 56, scope: !2954)
!2966 = !DILocalVariable(name: "template", scope: !2954, file: !2955, line: 4, type: !2967)
!2967 = !DICompositeType(tag: DW_TAG_array_type, baseType: !74, size: 208, elements: !49)
!2968 = !DILocation(line: 4, column: 16, scope: !2954)
!2969 = !DILocalVariable(name: "i", scope: !2954, file: !2955, line: 5, type: !2970)
!2970 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2961, line: 8, baseType: !210)
!2971 = !DILocation(line: 5, column: 12, scope: !2954)
!2972 = !DILocation(line: 7, column: 5, scope: !2954)
!2973 = !DILocation(line: 7, column: 21, scope: !2954)
!2974 = !DILocation(line: 7, column: 12, scope: !2954)
!2975 = !DILocation(line: 7, column: 24, scope: !2954)
!2976 = !DILocation(line: 9, column: 30, scope: !2977)
!2977 = distinct !DILexicalBlock(scope: !2954, file: !2955, line: 8, column: 5)
!2978 = !DILocation(line: 9, column: 21, scope: !2977)
!2979 = !DILocation(line: 9, column: 9, scope: !2977)
!2980 = !DILocation(line: 9, column: 16, scope: !2977)
!2981 = !DILocation(line: 9, column: 19, scope: !2977)
!2982 = !DILocation(line: 10, column: 10, scope: !2977)
!2983 = distinct !{!2983, !2972, !2984, !238}
!2984 = !DILocation(line: 11, column: 5, scope: !2954)
!2985 = !DILocation(line: 13, column: 5, scope: !2954)
!2986 = !DILocation(line: 13, column: 12, scope: !2954)
!2987 = !DILocation(line: 13, column: 15, scope: !2954)
!2988 = !DILocation(line: 14, column: 12, scope: !2954)
!2989 = !DILocation(line: 14, column: 5, scope: !2954)
