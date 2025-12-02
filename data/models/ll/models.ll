; ModuleID = '/home/marek/root/fizzer/dist/output/models/c/testcomp/nondet.ll'
source_filename = "/home/marek/root/fizzer/dist/data/models/c/testcomp/nondet.c"
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
define dso_local void @__fizzer_model____VERIFIER_nondet_memory(ptr noundef %0, i64 noundef %1) #0 !dbg !203 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !210, metadata !DIExpression()), !dbg !211
  store i64 %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !212, metadata !DIExpression()), !dbg !213
  call void @llvm.dbg.declare(metadata ptr %5, metadata !214, metadata !DIExpression()), !dbg !215
  %7 = load ptr, ptr %3, align 8, !dbg !216
  store ptr %7, ptr %5, align 8, !dbg !215
  call void @llvm.dbg.declare(metadata ptr %6, metadata !217, metadata !DIExpression()), !dbg !218
  %8 = load ptr, ptr %5, align 8, !dbg !219
  %9 = load i64, ptr %4, align 8, !dbg !220
  %10 = getelementptr inbounds i8, ptr %8, i64 %9, !dbg !221
  store ptr %10, ptr %6, align 8, !dbg !218
  br label %11, !dbg !222

11:                                               ; preds = %18, %2
  %12 = load ptr, ptr %5, align 8, !dbg !223
  %13 = load ptr, ptr %6, align 8, !dbg !226
  %14 = icmp ne ptr %12, %13, !dbg !227
  br i1 %14, label %15, label %21, !dbg !228

15:                                               ; preds = %11
  %16 = call signext i8 @__VERIFIER_nondet_uchar(), !dbg !229
  %17 = load ptr, ptr %5, align 8, !dbg !230
  store i8 %16, ptr %17, align 1, !dbg !231
  br label %18, !dbg !232

18:                                               ; preds = %15
  %19 = load ptr, ptr %5, align 8, !dbg !233
  %20 = getelementptr inbounds i8, ptr %19, i32 1, !dbg !233
  store ptr %20, ptr %5, align 8, !dbg !233
  br label %11, !dbg !234, !llvm.loop !235

21:                                               ; preds = %11
  ret void, !dbg !238
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare signext i8 @__VERIFIER_nondet_uchar() #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__getopt_long(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #0 !dbg !239 {
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
  call void @llvm.dbg.declare(metadata ptr %7, metadata !255, metadata !DIExpression()), !dbg !256
  store ptr %1, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !257, metadata !DIExpression()), !dbg !258
  store ptr %2, ptr %9, align 8
  call void @llvm.dbg.declare(metadata ptr %9, metadata !259, metadata !DIExpression()), !dbg !260
  store ptr %3, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %10, metadata !261, metadata !DIExpression()), !dbg !262
  store ptr %4, ptr %11, align 8
  call void @llvm.dbg.declare(metadata ptr %11, metadata !263, metadata !DIExpression()), !dbg !264
  %16 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !265
  %17 = load i32, ptr %7, align 4, !dbg !267
  %18 = icmp sge i32 %16, %17, !dbg !268
  br i1 %18, label %19, label %20, !dbg !269

19:                                               ; preds = %5
  store i32 -1, ptr %6, align 4, !dbg !270
  br label %180, !dbg !270

20:                                               ; preds = %5
  call void @llvm.dbg.declare(metadata ptr %12, metadata !272, metadata !DIExpression()), !dbg !273
  %21 = load ptr, ptr %8, align 8, !dbg !274
  %22 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !275
  %23 = sext i32 %22 to i64, !dbg !274
  %24 = getelementptr inbounds ptr, ptr %21, i64 %23, !dbg !274
  %25 = load ptr, ptr %24, align 8, !dbg !274
  store ptr %25, ptr %12, align 8, !dbg !273
  %26 = load ptr, ptr %12, align 8, !dbg !276
  %27 = getelementptr inbounds i8, ptr %26, i64 0, !dbg !276
  %28 = load i8, ptr %27, align 1, !dbg !276
  %29 = sext i8 %28 to i32, !dbg !276
  %30 = icmp ne i32 %29, 45, !dbg !278
  br i1 %30, label %37, label %31, !dbg !279

31:                                               ; preds = %20
  %32 = load ptr, ptr %12, align 8, !dbg !280
  %33 = getelementptr inbounds i8, ptr %32, i64 1, !dbg !280
  %34 = load i8, ptr %33, align 1, !dbg !280
  %35 = sext i8 %34 to i32, !dbg !280
  %36 = icmp ne i32 %35, 45, !dbg !281
  br i1 %36, label %37, label %42, !dbg !282

37:                                               ; preds = %31, %20
  %38 = load i32, ptr %7, align 4, !dbg !283
  %39 = load ptr, ptr %8, align 8, !dbg !285
  %40 = load ptr, ptr %9, align 8, !dbg !286
  %41 = call i32 @__fizzer_model__getopt(i32 noundef %38, ptr noundef %39, ptr noundef %40), !dbg !287
  store i32 %41, ptr %6, align 4, !dbg !288
  br label %180, !dbg !288

42:                                               ; preds = %31
  call void @llvm.dbg.declare(metadata ptr %13, metadata !289, metadata !DIExpression()), !dbg !292
  store i64 0, ptr %13, align 8, !dbg !292
  br label %43, !dbg !293

43:                                               ; preds = %174, %42
  %44 = load ptr, ptr %10, align 8, !dbg !294
  %45 = load i64, ptr %13, align 8, !dbg !295
  %46 = getelementptr inbounds %struct.option, ptr %44, i64 %45, !dbg !294
  %47 = getelementptr inbounds %struct.option, ptr %46, i32 0, i32 0, !dbg !296
  %48 = load ptr, ptr %47, align 8, !dbg !296
  %49 = icmp ne ptr %48, null, !dbg !297
  br i1 %49, label %50, label %177, !dbg !293

50:                                               ; preds = %43
  call void @llvm.dbg.declare(metadata ptr %14, metadata !298, metadata !DIExpression()), !dbg !300
  store i64 0, ptr %14, align 8, !dbg !300
  call void @llvm.dbg.declare(metadata ptr %15, metadata !301, metadata !DIExpression()), !dbg !302
  store i32 1, ptr %15, align 4, !dbg !302
  br label %51, !dbg !303

51:                                               ; preds = %90, %50
  %52 = load ptr, ptr %10, align 8, !dbg !304
  %53 = load i64, ptr %13, align 8, !dbg !305
  %54 = getelementptr inbounds %struct.option, ptr %52, i64 %53, !dbg !304
  %55 = getelementptr inbounds %struct.option, ptr %54, i32 0, i32 0, !dbg !306
  %56 = load ptr, ptr %55, align 8, !dbg !306
  %57 = load i64, ptr %14, align 8, !dbg !307
  %58 = getelementptr inbounds i8, ptr %56, i64 %57, !dbg !304
  %59 = load i8, ptr %58, align 1, !dbg !304
  %60 = sext i8 %59 to i32, !dbg !304
  %61 = icmp ne i32 %60, 0, !dbg !308
  br i1 %61, label %62, label %70, !dbg !309

62:                                               ; preds = %51
  %63 = load ptr, ptr %12, align 8, !dbg !310
  %64 = load i64, ptr %14, align 8, !dbg !311
  %65 = add i64 2, %64, !dbg !312
  %66 = getelementptr inbounds i8, ptr %63, i64 %65, !dbg !310
  %67 = load i8, ptr %66, align 1, !dbg !310
  %68 = sext i8 %67 to i32, !dbg !310
  %69 = icmp ne i32 %68, 0, !dbg !313
  br label %70

70:                                               ; preds = %62, %51
  %71 = phi i1 [ false, %51 ], [ %69, %62 ], !dbg !314
  br i1 %71, label %72, label %93, !dbg !303

72:                                               ; preds = %70
  %73 = load ptr, ptr %10, align 8, !dbg !315
  %74 = load i64, ptr %13, align 8, !dbg !318
  %75 = getelementptr inbounds %struct.option, ptr %73, i64 %74, !dbg !315
  %76 = getelementptr inbounds %struct.option, ptr %75, i32 0, i32 0, !dbg !319
  %77 = load ptr, ptr %76, align 8, !dbg !319
  %78 = load i64, ptr %14, align 8, !dbg !320
  %79 = getelementptr inbounds i8, ptr %77, i64 %78, !dbg !315
  %80 = load i8, ptr %79, align 1, !dbg !315
  %81 = sext i8 %80 to i32, !dbg !315
  %82 = load ptr, ptr %12, align 8, !dbg !321
  %83 = load i64, ptr %14, align 8, !dbg !322
  %84 = add i64 2, %83, !dbg !323
  %85 = getelementptr inbounds i8, ptr %82, i64 %84, !dbg !321
  %86 = load i8, ptr %85, align 1, !dbg !321
  %87 = sext i8 %86 to i32, !dbg !321
  %88 = icmp ne i32 %81, %87, !dbg !324
  br i1 %88, label %89, label %90, !dbg !325

89:                                               ; preds = %72
  store i32 0, ptr %15, align 4, !dbg !326
  br label %93, !dbg !328

90:                                               ; preds = %72
  %91 = load i64, ptr %14, align 8, !dbg !329
  %92 = add i64 %91, 1, !dbg !329
  store i64 %92, ptr %14, align 8, !dbg !329
  br label %51, !dbg !303, !llvm.loop !330

93:                                               ; preds = %89, %70
  %94 = load i32, ptr %15, align 4, !dbg !332
  %95 = icmp ne i32 %94, 0, !dbg !332
  br i1 %95, label %96, label %174, !dbg !334

96:                                               ; preds = %93
  %97 = load ptr, ptr %10, align 8, !dbg !335
  %98 = load i64, ptr %13, align 8, !dbg !336
  %99 = getelementptr inbounds %struct.option, ptr %97, i64 %98, !dbg !335
  %100 = getelementptr inbounds %struct.option, ptr %99, i32 0, i32 0, !dbg !337
  %101 = load ptr, ptr %100, align 8, !dbg !337
  %102 = load i64, ptr %14, align 8, !dbg !338
  %103 = getelementptr inbounds i8, ptr %101, i64 %102, !dbg !335
  %104 = load i8, ptr %103, align 1, !dbg !335
  %105 = sext i8 %104 to i32, !dbg !335
  %106 = icmp eq i32 %105, 0, !dbg !339
  br i1 %106, label %107, label %174, !dbg !340

107:                                              ; preds = %96
  %108 = load ptr, ptr %12, align 8, !dbg !341
  %109 = load i64, ptr %14, align 8, !dbg !342
  %110 = add i64 2, %109, !dbg !343
  %111 = getelementptr inbounds i8, ptr %108, i64 %110, !dbg !341
  %112 = load i8, ptr %111, align 1, !dbg !341
  %113 = sext i8 %112 to i32, !dbg !341
  %114 = icmp eq i32 %113, 0, !dbg !344
  br i1 %114, label %115, label %174, !dbg !345

115:                                              ; preds = %107
  %116 = load ptr, ptr %11, align 8, !dbg !346
  %117 = icmp ne ptr %116, null, !dbg !349
  br i1 %117, label %118, label %122, !dbg !350

118:                                              ; preds = %115
  %119 = load i64, ptr %13, align 8, !dbg !351
  %120 = trunc i64 %119 to i32, !dbg !353
  %121 = load ptr, ptr %11, align 8, !dbg !354
  store i32 %120, ptr %121, align 4, !dbg !355
  br label %122, !dbg !356

122:                                              ; preds = %118, %115
  %123 = load ptr, ptr %10, align 8, !dbg !357
  %124 = load i64, ptr %13, align 8, !dbg !359
  %125 = getelementptr inbounds %struct.option, ptr %123, i64 %124, !dbg !357
  %126 = getelementptr inbounds %struct.option, ptr %125, i32 0, i32 1, !dbg !360
  %127 = load i32, ptr %126, align 8, !dbg !360
  %128 = icmp eq i32 %127, 1, !dbg !361
  br i1 %128, label %129, label %147, !dbg !362

129:                                              ; preds = %122
  %130 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !363
  %131 = add nsw i32 %130, 1, !dbg !366
  %132 = load i32, ptr %7, align 4, !dbg !367
  %133 = icmp slt i32 %131, %132, !dbg !368
  br i1 %133, label %134, label %143, !dbg !369

134:                                              ; preds = %129
  %135 = load ptr, ptr %8, align 8, !dbg !370
  %136 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !372
  %137 = add nsw i32 %136, 1, !dbg !373
  %138 = sext i32 %137 to i64, !dbg !370
  %139 = getelementptr inbounds ptr, ptr %135, i64 %138, !dbg !370
  %140 = load ptr, ptr %139, align 8, !dbg !370
  store ptr %140, ptr @__fizzer_model__optarg, align 8, !dbg !374
  %141 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !375
  %142 = add nsw i32 %141, 2, !dbg !375
  store i32 %142, ptr @__fizzer_model__optind, align 4, !dbg !375
  br label %146, !dbg !376

143:                                              ; preds = %129
  store ptr null, ptr @__fizzer_model__optarg, align 8, !dbg !377
  %144 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !379
  %145 = add nsw i32 %144, 1, !dbg !379
  store i32 %145, ptr @__fizzer_model__optind, align 4, !dbg !379
  br label %146

146:                                              ; preds = %143, %134
  br label %150, !dbg !380

147:                                              ; preds = %122
  store ptr null, ptr @__fizzer_model__optarg, align 8, !dbg !381
  %148 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !383
  %149 = add nsw i32 %148, 1, !dbg !383
  store i32 %149, ptr @__fizzer_model__optind, align 4, !dbg !383
  br label %150

150:                                              ; preds = %147, %146
  %151 = load ptr, ptr %10, align 8, !dbg !384
  %152 = load i64, ptr %13, align 8, !dbg !386
  %153 = getelementptr inbounds %struct.option, ptr %151, i64 %152, !dbg !384
  %154 = getelementptr inbounds %struct.option, ptr %153, i32 0, i32 2, !dbg !387
  %155 = load ptr, ptr %154, align 8, !dbg !387
  %156 = icmp ne ptr %155, null, !dbg !388
  br i1 %156, label %157, label %168, !dbg !389

157:                                              ; preds = %150
  %158 = load ptr, ptr %10, align 8, !dbg !390
  %159 = load i64, ptr %13, align 8, !dbg !392
  %160 = getelementptr inbounds %struct.option, ptr %158, i64 %159, !dbg !390
  %161 = getelementptr inbounds %struct.option, ptr %160, i32 0, i32 3, !dbg !393
  %162 = load i32, ptr %161, align 8, !dbg !393
  %163 = load ptr, ptr %10, align 8, !dbg !394
  %164 = load i64, ptr %13, align 8, !dbg !395
  %165 = getelementptr inbounds %struct.option, ptr %163, i64 %164, !dbg !394
  %166 = getelementptr inbounds %struct.option, ptr %165, i32 0, i32 2, !dbg !396
  %167 = load ptr, ptr %166, align 8, !dbg !396
  store i32 %162, ptr %167, align 4, !dbg !397
  store i32 0, ptr %6, align 4, !dbg !398
  br label %180, !dbg !398

168:                                              ; preds = %150
  %169 = load ptr, ptr %10, align 8, !dbg !399
  %170 = load i64, ptr %13, align 8, !dbg !400
  %171 = getelementptr inbounds %struct.option, ptr %169, i64 %170, !dbg !399
  %172 = getelementptr inbounds %struct.option, ptr %171, i32 0, i32 3, !dbg !401
  %173 = load i32, ptr %172, align 8, !dbg !401
  store i32 %173, ptr %6, align 4, !dbg !402
  br label %180, !dbg !402

174:                                              ; preds = %107, %96, %93
  %175 = load i64, ptr %13, align 8, !dbg !403
  %176 = add i64 %175, 1, !dbg !403
  store i64 %176, ptr %13, align 8, !dbg !403
  br label %43, !dbg !293, !llvm.loop !404

177:                                              ; preds = %43
  %178 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !406
  %179 = add nsw i32 %178, 1, !dbg !406
  store i32 %179, ptr @__fizzer_model__optind, align 4, !dbg !406
  store i32 63, ptr %6, align 4, !dbg !407
  br label %180, !dbg !407

180:                                              ; preds = %177, %168, %157, %37, %19
  %181 = load i32, ptr %6, align 4, !dbg !408
  ret i32 %181, !dbg !408
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__getopt(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !409 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i8, align 1
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !413, metadata !DIExpression()), !dbg !414
  store ptr %1, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !415, metadata !DIExpression()), !dbg !416
  store ptr %2, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !417, metadata !DIExpression()), !dbg !418
  %12 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !419
  %13 = load i32, ptr %5, align 4, !dbg !421
  %14 = icmp sge i32 %12, %13, !dbg !422
  br i1 %14, label %15, label %16, !dbg !423

15:                                               ; preds = %3
  store i32 -1, ptr %4, align 4, !dbg !424
  br label %113, !dbg !424

16:                                               ; preds = %3
  call void @llvm.dbg.declare(metadata ptr %8, metadata !426, metadata !DIExpression()), !dbg !427
  %17 = load ptr, ptr %6, align 8, !dbg !428
  %18 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !429
  %19 = sext i32 %18 to i64, !dbg !428
  %20 = getelementptr inbounds ptr, ptr %17, i64 %19, !dbg !428
  %21 = load ptr, ptr %20, align 8, !dbg !428
  store ptr %21, ptr %8, align 8, !dbg !427
  %22 = load ptr, ptr %8, align 8, !dbg !430
  %23 = getelementptr inbounds i8, ptr %22, i64 0, !dbg !430
  %24 = load i8, ptr %23, align 1, !dbg !430
  %25 = sext i8 %24 to i32, !dbg !430
  %26 = icmp ne i32 %25, 45, !dbg !432
  br i1 %26, label %33, label %27, !dbg !433

27:                                               ; preds = %16
  %28 = load ptr, ptr %8, align 8, !dbg !434
  %29 = getelementptr inbounds i8, ptr %28, i64 1, !dbg !434
  %30 = load i8, ptr %29, align 1, !dbg !434
  %31 = sext i8 %30 to i32, !dbg !434
  %32 = icmp eq i32 %31, 0, !dbg !435
  br i1 %32, label %33, label %34, !dbg !436

33:                                               ; preds = %27, %16
  store i32 -1, ptr %4, align 4, !dbg !437
  br label %113, !dbg !437

34:                                               ; preds = %27
  call void @llvm.dbg.declare(metadata ptr %9, metadata !439, metadata !DIExpression()), !dbg !440
  %35 = load ptr, ptr %8, align 8, !dbg !441
  %36 = getelementptr inbounds i8, ptr %35, i64 1, !dbg !441
  %37 = load i8, ptr %36, align 1, !dbg !441
  store i8 %37, ptr %9, align 1, !dbg !440
  call void @llvm.dbg.declare(metadata ptr %10, metadata !442, metadata !DIExpression()), !dbg !445
  store i64 0, ptr %10, align 8, !dbg !445
  call void @llvm.dbg.declare(metadata ptr %11, metadata !446, metadata !DIExpression()), !dbg !447
  store i32 0, ptr %11, align 4, !dbg !447
  br label %38, !dbg !448

38:                                               ; preds = %55, %34
  %39 = load ptr, ptr %7, align 8, !dbg !449
  %40 = load i64, ptr %10, align 8, !dbg !450
  %41 = getelementptr inbounds i8, ptr %39, i64 %40, !dbg !449
  %42 = load i8, ptr %41, align 1, !dbg !449
  %43 = sext i8 %42 to i32, !dbg !449
  %44 = icmp ne i32 %43, 0, !dbg !451
  br i1 %44, label %45, label %58, !dbg !448

45:                                               ; preds = %38
  %46 = load ptr, ptr %7, align 8, !dbg !452
  %47 = load i64, ptr %10, align 8, !dbg !455
  %48 = getelementptr inbounds i8, ptr %46, i64 %47, !dbg !452
  %49 = load i8, ptr %48, align 1, !dbg !452
  %50 = sext i8 %49 to i32, !dbg !452
  %51 = load i8, ptr %9, align 1, !dbg !456
  %52 = sext i8 %51 to i32, !dbg !456
  %53 = icmp eq i32 %50, %52, !dbg !457
  br i1 %53, label %54, label %55, !dbg !458

54:                                               ; preds = %45
  store i32 1, ptr %11, align 4, !dbg !459
  br label %58, !dbg !461

55:                                               ; preds = %45
  %56 = load i64, ptr %10, align 8, !dbg !462
  %57 = add i64 %56, 1, !dbg !462
  store i64 %57, ptr %10, align 8, !dbg !462
  br label %38, !dbg !448, !llvm.loop !463

58:                                               ; preds = %54, %38
  %59 = load i32, ptr %11, align 4, !dbg !465
  %60 = icmp ne i32 %59, 0, !dbg !465
  br i1 %60, label %66, label %61, !dbg !467

61:                                               ; preds = %58
  %62 = load i8, ptr %9, align 1, !dbg !468
  %63 = sext i8 %62 to i32, !dbg !468
  store i32 %63, ptr @__fizzer_model__optopt, align 4, !dbg !470
  %64 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !471
  %65 = add nsw i32 %64, 1, !dbg !471
  store i32 %65, ptr @__fizzer_model__optind, align 4, !dbg !471
  store i32 63, ptr %4, align 4, !dbg !472
  br label %113, !dbg !472

66:                                               ; preds = %58
  %67 = load ptr, ptr %7, align 8, !dbg !473
  %68 = load i64, ptr %10, align 8, !dbg !475
  %69 = add i64 %68, 1, !dbg !476
  %70 = getelementptr inbounds i8, ptr %67, i64 %69, !dbg !473
  %71 = load i8, ptr %70, align 1, !dbg !473
  %72 = sext i8 %71 to i32, !dbg !473
  %73 = icmp eq i32 %72, 58, !dbg !477
  br i1 %73, label %74, label %107, !dbg !478

74:                                               ; preds = %66
  %75 = load ptr, ptr %8, align 8, !dbg !479
  %76 = getelementptr inbounds i8, ptr %75, i64 2, !dbg !479
  %77 = load i8, ptr %76, align 1, !dbg !479
  %78 = sext i8 %77 to i32, !dbg !479
  %79 = icmp ne i32 %78, 0, !dbg !482
  br i1 %79, label %80, label %83, !dbg !483

80:                                               ; preds = %74
  %81 = load ptr, ptr %8, align 8, !dbg !484
  %82 = getelementptr inbounds i8, ptr %81, i64 2, !dbg !484
  store ptr %82, ptr @__fizzer_model__optarg, align 8, !dbg !486
  br label %104, !dbg !487

83:                                               ; preds = %74
  %84 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !488
  %85 = add nsw i32 %84, 1, !dbg !490
  %86 = load i32, ptr %5, align 4, !dbg !491
  %87 = icmp slt i32 %85, %86, !dbg !492
  br i1 %87, label %88, label %96, !dbg !493

88:                                               ; preds = %83
  %89 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !494
  %90 = add nsw i32 %89, 1, !dbg !494
  store i32 %90, ptr @__fizzer_model__optind, align 4, !dbg !494
  %91 = load ptr, ptr %6, align 8, !dbg !496
  %92 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !497
  %93 = sext i32 %92 to i64, !dbg !496
  %94 = getelementptr inbounds ptr, ptr %91, i64 %93, !dbg !496
  %95 = load ptr, ptr %94, align 8, !dbg !496
  store ptr %95, ptr @__fizzer_model__optarg, align 8, !dbg !498
  br label %103, !dbg !499

96:                                               ; preds = %83
  store ptr null, ptr @__fizzer_model__optarg, align 8, !dbg !500
  %97 = load i32, ptr @__fizzer_model__opterr, align 4, !dbg !502
  %98 = icmp ne i32 %97, 0, !dbg !502
  br i1 %98, label %99, label %100, !dbg !504

99:                                               ; preds = %96
  br label %100, !dbg !505

100:                                              ; preds = %99, %96
  %101 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !507
  %102 = add nsw i32 %101, 1, !dbg !507
  store i32 %102, ptr @__fizzer_model__optind, align 4, !dbg !507
  store i32 58, ptr %4, align 4, !dbg !508
  br label %113, !dbg !508

103:                                              ; preds = %88
  br label %104

104:                                              ; preds = %103, %80
  %105 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !509
  %106 = add nsw i32 %105, 1, !dbg !509
  store i32 %106, ptr @__fizzer_model__optind, align 4, !dbg !509
  br label %110, !dbg !510

107:                                              ; preds = %66
  store ptr null, ptr @__fizzer_model__optarg, align 8, !dbg !511
  %108 = load i32, ptr @__fizzer_model__optind, align 4, !dbg !513
  %109 = add nsw i32 %108, 1, !dbg !513
  store i32 %109, ptr @__fizzer_model__optind, align 4, !dbg !513
  br label %110

110:                                              ; preds = %107, %104
  %111 = load i8, ptr %9, align 1, !dbg !514
  %112 = sext i8 %111 to i32, !dbg !514
  store i32 %112, ptr %4, align 4, !dbg !515
  br label %113, !dbg !515

113:                                              ; preds = %110, %100, %61, %33, %15
  %114 = load i32, ptr %4, align 4, !dbg !516
  ret i32 %114, !dbg !516
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__atoll(ptr noundef %0) #0 !dbg !517 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !522, metadata !DIExpression()), !dbg !523
  call void @llvm.dbg.declare(metadata ptr %3, metadata !524, metadata !DIExpression()), !dbg !525
  store i64 0, ptr %3, align 8, !dbg !525
  call void @llvm.dbg.declare(metadata ptr %4, metadata !526, metadata !DIExpression()), !dbg !527
  store i32 1, ptr %4, align 4, !dbg !527
  call void @llvm.dbg.declare(metadata ptr %5, metadata !528, metadata !DIExpression()), !dbg !531
  store i64 0, ptr %5, align 8, !dbg !531
  br label %6, !dbg !532

6:                                                ; preds = %23, %1
  %7 = load ptr, ptr %2, align 8, !dbg !533
  %8 = load i64, ptr %5, align 8, !dbg !534
  %9 = getelementptr inbounds i8, ptr %7, i64 %8, !dbg !533
  %10 = load i8, ptr %9, align 1, !dbg !533
  %11 = sext i8 %10 to i32, !dbg !533
  %12 = icmp ne i32 %11, 0, !dbg !535
  br i1 %12, label %13, label %21, !dbg !536

13:                                               ; preds = %6
  %14 = load ptr, ptr %2, align 8, !dbg !537
  %15 = load i64, ptr %5, align 8, !dbg !538
  %16 = getelementptr inbounds i8, ptr %14, i64 %15, !dbg !537
  %17 = load i8, ptr %16, align 1, !dbg !537
  %18 = sext i8 %17 to i32, !dbg !537
  %19 = call i32 @__fizzer_model__isspace(i32 noundef %18), !dbg !539
  %20 = icmp ne i32 %19, 0, !dbg !536
  br label %21

21:                                               ; preds = %13, %6
  %22 = phi i1 [ false, %6 ], [ %20, %13 ], !dbg !540
  br i1 %22, label %23, label %26, !dbg !532

23:                                               ; preds = %21
  %24 = load i64, ptr %5, align 8, !dbg !541
  %25 = add i64 %24, 1, !dbg !541
  store i64 %25, ptr %5, align 8, !dbg !541
  br label %6, !dbg !532, !llvm.loop !543

26:                                               ; preds = %21
  %27 = load ptr, ptr %2, align 8, !dbg !545
  %28 = load i64, ptr %5, align 8, !dbg !547
  %29 = getelementptr inbounds i8, ptr %27, i64 %28, !dbg !545
  %30 = load i8, ptr %29, align 1, !dbg !545
  %31 = sext i8 %30 to i32, !dbg !545
  %32 = icmp eq i32 %31, 43, !dbg !548
  br i1 %32, label %33, label %36, !dbg !549

33:                                               ; preds = %26
  %34 = load i64, ptr %5, align 8, !dbg !550
  %35 = add i64 %34, 1, !dbg !550
  store i64 %35, ptr %5, align 8, !dbg !550
  br label %47, !dbg !552

36:                                               ; preds = %26
  %37 = load ptr, ptr %2, align 8, !dbg !553
  %38 = load i64, ptr %5, align 8, !dbg !555
  %39 = getelementptr inbounds i8, ptr %37, i64 %38, !dbg !553
  %40 = load i8, ptr %39, align 1, !dbg !553
  %41 = sext i8 %40 to i32, !dbg !553
  %42 = icmp eq i32 %41, 45, !dbg !556
  br i1 %42, label %43, label %46, !dbg !557

43:                                               ; preds = %36
  store i32 -1, ptr %4, align 4, !dbg !558
  %44 = load i64, ptr %5, align 8, !dbg !560
  %45 = add i64 %44, 1, !dbg !560
  store i64 %45, ptr %5, align 8, !dbg !560
  br label %46, !dbg !561

46:                                               ; preds = %43, %36
  br label %47

47:                                               ; preds = %46, %33
  br label %48, !dbg !562

48:                                               ; preds = %65, %47
  %49 = load ptr, ptr %2, align 8, !dbg !563
  %50 = load i64, ptr %5, align 8, !dbg !564
  %51 = getelementptr inbounds i8, ptr %49, i64 %50, !dbg !563
  %52 = load i8, ptr %51, align 1, !dbg !563
  %53 = sext i8 %52 to i32, !dbg !563
  %54 = icmp ne i32 %53, 0, !dbg !565
  br i1 %54, label %55, label %63, !dbg !566

55:                                               ; preds = %48
  %56 = load ptr, ptr %2, align 8, !dbg !567
  %57 = load i64, ptr %5, align 8, !dbg !568
  %58 = getelementptr inbounds i8, ptr %56, i64 %57, !dbg !567
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
  %68 = load ptr, ptr %2, align 8, !dbg !573
  %69 = load i64, ptr %5, align 8, !dbg !574
  %70 = getelementptr inbounds i8, ptr %68, i64 %69, !dbg !573
  %71 = load i8, ptr %70, align 1, !dbg !573
  %72 = sext i8 %71 to i32, !dbg !573
  %73 = sub nsw i32 %72, 48, !dbg !575
  %74 = sext i32 %73 to i64, !dbg !576
  %75 = add nsw i64 %67, %74, !dbg !577
  store i64 %75, ptr %3, align 8, !dbg !578
  %76 = load i64, ptr %5, align 8, !dbg !579
  %77 = add i64 %76, 1, !dbg !579
  store i64 %77, ptr %5, align 8, !dbg !579
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
  call void @llvm.dbg.declare(metadata ptr %3, metadata !591, metadata !DIExpression()), !dbg !592
  store ptr %1, ptr %4, align 8
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
  store i64 0, ptr %11, align 8, !dbg !610
  br label %14, !dbg !611

14:                                               ; preds = %31, %2
  %15 = load ptr, ptr %3, align 8, !dbg !612
  %16 = load i64, ptr %11, align 8, !dbg !613
  %17 = getelementptr inbounds i8, ptr %15, i64 %16, !dbg !612
  %18 = load i8, ptr %17, align 1, !dbg !612
  %19 = sext i8 %18 to i32, !dbg !612
  %20 = icmp ne i32 %19, 0, !dbg !614
  br i1 %20, label %21, label %29, !dbg !615

21:                                               ; preds = %14
  %22 = load ptr, ptr %3, align 8, !dbg !616
  %23 = load i64, ptr %11, align 8, !dbg !617
  %24 = getelementptr inbounds i8, ptr %22, i64 %23, !dbg !616
  %25 = load i8, ptr %24, align 1, !dbg !616
  %26 = sext i8 %25 to i32, !dbg !616
  %27 = call i32 @__fizzer_model__isspace(i32 noundef %26), !dbg !618
  %28 = icmp ne i32 %27, 0, !dbg !615
  br label %29

29:                                               ; preds = %21, %14
  %30 = phi i1 [ false, %14 ], [ %28, %21 ], !dbg !619
  br i1 %30, label %31, label %34, !dbg !611

31:                                               ; preds = %29
  %32 = load i64, ptr %11, align 8, !dbg !620
  %33 = add i64 %32, 1, !dbg !620
  store i64 %33, ptr %11, align 8, !dbg !620
  br label %14, !dbg !611, !llvm.loop !622

34:                                               ; preds = %29
  %35 = load ptr, ptr %3, align 8, !dbg !624
  %36 = load i64, ptr %11, align 8, !dbg !626
  %37 = getelementptr inbounds i8, ptr %35, i64 %36, !dbg !624
  %38 = load i8, ptr %37, align 1, !dbg !624
  %39 = sext i8 %38 to i32, !dbg !624
  %40 = icmp eq i32 %39, 43, !dbg !627
  br i1 %40, label %41, label %44, !dbg !628

41:                                               ; preds = %34
  %42 = load i64, ptr %11, align 8, !dbg !629
  %43 = add i64 %42, 1, !dbg !629
  store i64 %43, ptr %11, align 8, !dbg !629
  br label %55, !dbg !631

44:                                               ; preds = %34
  %45 = load ptr, ptr %3, align 8, !dbg !632
  %46 = load i64, ptr %11, align 8, !dbg !634
  %47 = getelementptr inbounds i8, ptr %45, i64 %46, !dbg !632
  %48 = load i8, ptr %47, align 1, !dbg !632
  %49 = sext i8 %48 to i32, !dbg !632
  %50 = icmp eq i32 %49, 45, !dbg !635
  br i1 %50, label %51, label %54, !dbg !636

51:                                               ; preds = %44
  store i32 -1, ptr %7, align 4, !dbg !637
  %52 = load i64, ptr %11, align 8, !dbg !639
  %53 = add i64 %52, 1, !dbg !639
  store i64 %53, ptr %11, align 8, !dbg !639
  br label %54, !dbg !640

54:                                               ; preds = %51, %44
  br label %55

55:                                               ; preds = %54, %41
  br label %56, !dbg !641

56:                                               ; preds = %73, %55
  %57 = load ptr, ptr %3, align 8, !dbg !642
  %58 = load i64, ptr %11, align 8, !dbg !643
  %59 = getelementptr inbounds i8, ptr %57, i64 %58, !dbg !642
  %60 = load i8, ptr %59, align 1, !dbg !642
  %61 = sext i8 %60 to i32, !dbg !642
  %62 = icmp ne i32 %61, 0, !dbg !644
  br i1 %62, label %63, label %71, !dbg !645

63:                                               ; preds = %56
  %64 = load ptr, ptr %3, align 8, !dbg !646
  %65 = load i64, ptr %11, align 8, !dbg !647
  %66 = getelementptr inbounds i8, ptr %64, i64 %65, !dbg !646
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
  %75 = load ptr, ptr %3, align 8, !dbg !651
  %76 = load i64, ptr %11, align 8, !dbg !652
  %77 = getelementptr inbounds i8, ptr %75, i64 %76, !dbg !651
  %78 = load i8, ptr %77, align 1, !dbg !651
  %79 = sext i8 %78 to i32, !dbg !651
  %80 = sub nsw i32 %79, 48, !dbg !653
  %81 = sitofp i32 %80 to double, !dbg !654
  %82 = call double @llvm.fmuladd.f64(double %74, double 1.000000e+01, double %81), !dbg !655
  store double %82, ptr %5, align 8, !dbg !656
  %83 = load i64, ptr %11, align 8, !dbg !657
  %84 = add i64 %83, 1, !dbg !657
  store i64 %84, ptr %11, align 8, !dbg !657
  br label %56, !dbg !641, !llvm.loop !658

85:                                               ; preds = %71
  %86 = load ptr, ptr %3, align 8, !dbg !660
  %87 = load i64, ptr %11, align 8, !dbg !662
  %88 = getelementptr inbounds i8, ptr %86, i64 %87, !dbg !660
  %89 = load i8, ptr %88, align 1, !dbg !660
  %90 = sext i8 %89 to i32, !dbg !660
  %91 = icmp eq i32 %90, 46, !dbg !663
  br i1 %91, label %92, label %133, !dbg !664

92:                                               ; preds = %85
  %93 = load i64, ptr %11, align 8, !dbg !665
  %94 = add i64 %93, 1, !dbg !665
  store i64 %94, ptr %11, align 8, !dbg !665
  br label %95, !dbg !667

95:                                               ; preds = %112, %92
  %96 = load ptr, ptr %3, align 8, !dbg !668
  %97 = load i64, ptr %11, align 8, !dbg !669
  %98 = getelementptr inbounds i8, ptr %96, i64 %97, !dbg !668
  %99 = load i8, ptr %98, align 1, !dbg !668
  %100 = sext i8 %99 to i32, !dbg !668
  %101 = icmp ne i32 %100, 0, !dbg !670
  br i1 %101, label %102, label %110, !dbg !671

102:                                              ; preds = %95
  %103 = load ptr, ptr %3, align 8, !dbg !672
  %104 = load i64, ptr %11, align 8, !dbg !673
  %105 = getelementptr inbounds i8, ptr %103, i64 %104, !dbg !672
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
  %114 = load ptr, ptr %3, align 8, !dbg !678
  %115 = load i64, ptr %11, align 8, !dbg !679
  %116 = getelementptr inbounds i8, ptr %114, i64 %115, !dbg !678
  %117 = load i8, ptr %116, align 1, !dbg !678
  %118 = sext i8 %117 to i32, !dbg !678
  %119 = sub nsw i32 %118, 48, !dbg !680
  %120 = sitofp i32 %119 to double, !dbg !681
  %121 = call double @llvm.fmuladd.f64(double %113, double 1.000000e+01, double %120), !dbg !682
  store double %121, ptr %6, align 8, !dbg !683
  %122 = load i32, ptr %8, align 4, !dbg !684
  %123 = mul nsw i32 %122, 10, !dbg !685
  store i32 %123, ptr %8, align 4, !dbg !686
  %124 = load i64, ptr %11, align 8, !dbg !687
  %125 = add i64 %124, 1, !dbg !687
  store i64 %125, ptr %11, align 8, !dbg !687
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
  %134 = load ptr, ptr %3, align 8, !dbg !698
  %135 = load i64, ptr %11, align 8, !dbg !700
  %136 = getelementptr inbounds i8, ptr %134, i64 %135, !dbg !698
  %137 = load i8, ptr %136, align 1, !dbg !698
  %138 = sext i8 %137 to i32, !dbg !698
  %139 = icmp eq i32 %138, 101, !dbg !701
  br i1 %139, label %147, label %140, !dbg !702

140:                                              ; preds = %133
  %141 = load ptr, ptr %3, align 8, !dbg !703
  %142 = load i64, ptr %11, align 8, !dbg !704
  %143 = getelementptr inbounds i8, ptr %141, i64 %142, !dbg !703
  %144 = load i8, ptr %143, align 1, !dbg !703
  %145 = sext i8 %144 to i32, !dbg !703
  %146 = icmp eq i32 %145, 69, !dbg !705
  br i1 %146, label %147, label %201, !dbg !706

147:                                              ; preds = %140, %133
  %148 = load i64, ptr %11, align 8, !dbg !707
  %149 = add i64 %148, 1, !dbg !707
  store i64 %149, ptr %11, align 8, !dbg !707
  %150 = load ptr, ptr %3, align 8, !dbg !709
  %151 = load i64, ptr %11, align 8, !dbg !711
  %152 = getelementptr inbounds i8, ptr %150, i64 %151, !dbg !709
  %153 = load i8, ptr %152, align 1, !dbg !709
  %154 = sext i8 %153 to i32, !dbg !709
  %155 = icmp eq i32 %154, 43, !dbg !712
  br i1 %155, label %156, label %159, !dbg !713

156:                                              ; preds = %147
  %157 = load i64, ptr %11, align 8, !dbg !714
  %158 = add i64 %157, 1, !dbg !714
  store i64 %158, ptr %11, align 8, !dbg !714
  br label %170, !dbg !716

159:                                              ; preds = %147
  %160 = load ptr, ptr %3, align 8, !dbg !717
  %161 = load i64, ptr %11, align 8, !dbg !719
  %162 = getelementptr inbounds i8, ptr %160, i64 %161, !dbg !717
  %163 = load i8, ptr %162, align 1, !dbg !717
  %164 = sext i8 %163 to i32, !dbg !717
  %165 = icmp eq i32 %164, 45, !dbg !720
  br i1 %165, label %166, label %169, !dbg !721

166:                                              ; preds = %159
  store i32 -1, ptr %9, align 4, !dbg !722
  %167 = load i64, ptr %11, align 8, !dbg !724
  %168 = add i64 %167, 1, !dbg !724
  store i64 %168, ptr %11, align 8, !dbg !724
  br label %169, !dbg !725

169:                                              ; preds = %166, %159
  br label %170

170:                                              ; preds = %169, %156
  br label %171, !dbg !726

171:                                              ; preds = %188, %170
  %172 = load ptr, ptr %3, align 8, !dbg !727
  %173 = load i64, ptr %11, align 8, !dbg !728
  %174 = getelementptr inbounds i8, ptr %172, i64 %173, !dbg !727
  %175 = load i8, ptr %174, align 1, !dbg !727
  %176 = sext i8 %175 to i32, !dbg !727
  %177 = icmp ne i32 %176, 0, !dbg !729
  br i1 %177, label %178, label %186, !dbg !730

178:                                              ; preds = %171
  %179 = load ptr, ptr %3, align 8, !dbg !731
  %180 = load i64, ptr %11, align 8, !dbg !732
  %181 = getelementptr inbounds i8, ptr %179, i64 %180, !dbg !731
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
  %191 = load ptr, ptr %3, align 8, !dbg !738
  %192 = load i64, ptr %11, align 8, !dbg !739
  %193 = getelementptr inbounds i8, ptr %191, i64 %192, !dbg !738
  %194 = load i8, ptr %193, align 1, !dbg !738
  %195 = sext i8 %194 to i32, !dbg !738
  %196 = sub nsw i32 %195, 48, !dbg !740
  %197 = add nsw i32 %190, %196, !dbg !741
  store i32 %197, ptr %10, align 4, !dbg !742
  %198 = load i64, ptr %11, align 8, !dbg !743
  %199 = add i64 %198, 1, !dbg !743
  store i64 %199, ptr %11, align 8, !dbg !743
  br label %171, !dbg !726, !llvm.loop !744

200:                                              ; preds = %186
  br label %201, !dbg !746

201:                                              ; preds = %200, %140
  %202 = load ptr, ptr %4, align 8, !dbg !747
  %203 = icmp ne ptr %202, null, !dbg !749
  br i1 %203, label %204, label %209, !dbg !750

204:                                              ; preds = %201
  %205 = load ptr, ptr %3, align 8, !dbg !751
  %206 = load i64, ptr %11, align 8, !dbg !753
  %207 = getelementptr inbounds i8, ptr %205, i64 %206, !dbg !754
  %208 = load ptr, ptr %4, align 8, !dbg !755
  store ptr %207, ptr %208, align 8, !dbg !756
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
define dso_local i64 @__fizzer_model__labs(i64 noundef %0) #0 !dbg !813 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !818, metadata !DIExpression()), !dbg !819
  %4 = load i64, ptr %3, align 8, !dbg !820
  %5 = icmp slt i64 %4, 0, !dbg !822
  br i1 %5, label %6, label %9, !dbg !823

6:                                                ; preds = %1
  %7 = load i64, ptr %3, align 8, !dbg !824
  %8 = sub nsw i64 0, %7, !dbg !825
  store i64 %8, ptr %2, align 8, !dbg !826
  br label %11, !dbg !826

9:                                                ; preds = %1
  %10 = load i64, ptr %3, align 8, !dbg !827
  store i64 %10, ptr %2, align 8, !dbg !828
  br label %11, !dbg !828

11:                                               ; preds = %9, %6
  %12 = load i64, ptr %2, align 8, !dbg !829
  ret i64 %12, !dbg !829
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__llabs(i64 noundef %0) #0 !dbg !830 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !834, metadata !DIExpression()), !dbg !835
  %4 = load i64, ptr %3, align 8, !dbg !836
  %5 = icmp slt i64 %4, 0, !dbg !838
  br i1 %5, label %6, label %9, !dbg !839

6:                                                ; preds = %1
  %7 = load i64, ptr %3, align 8, !dbg !840
  %8 = sub nsw i64 0, %7, !dbg !841
  store i64 %8, ptr %2, align 8, !dbg !842
  br label %11, !dbg !842

9:                                                ; preds = %1
  %10 = load i64, ptr %3, align 8, !dbg !843
  store i64 %10, ptr %2, align 8, !dbg !844
  br label %11, !dbg !844

11:                                               ; preds = %9, %6
  %12 = load i64, ptr %2, align 8, !dbg !845
  ret i64 %12, !dbg !845
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__strtol(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !846 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !850, metadata !DIExpression()), !dbg !851
  store ptr %1, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !852, metadata !DIExpression()), !dbg !853
  store i32 %2, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !854, metadata !DIExpression()), !dbg !855
  call void @llvm.dbg.declare(metadata ptr %8, metadata !856, metadata !DIExpression()), !dbg !857
  store i64 0, ptr %8, align 8, !dbg !857
  call void @llvm.dbg.declare(metadata ptr %9, metadata !858, metadata !DIExpression()), !dbg !859
  store i32 1, ptr %9, align 4, !dbg !859
  call void @llvm.dbg.declare(metadata ptr %10, metadata !860, metadata !DIExpression()), !dbg !863
  store i64 0, ptr %10, align 8, !dbg !863
  %12 = load i32, ptr %7, align 4, !dbg !864
  %13 = icmp ne i32 %12, 10, !dbg !866
  br i1 %13, label %14, label %21, !dbg !867

14:                                               ; preds = %3
  %15 = load ptr, ptr %6, align 8, !dbg !868
  %16 = icmp ne ptr %15, null, !dbg !871
  br i1 %16, label %17, label %20, !dbg !872

17:                                               ; preds = %14
  %18 = load ptr, ptr %5, align 8, !dbg !873
  %19 = load ptr, ptr %6, align 8, !dbg !875
  store ptr %18, ptr %19, align 8, !dbg !876
  br label %20, !dbg !877

20:                                               ; preds = %17, %14
  store i64 0, ptr %4, align 8, !dbg !878
  br label %108, !dbg !878

21:                                               ; preds = %3
  br label %22, !dbg !879

22:                                               ; preds = %39, %21
  %23 = load ptr, ptr %5, align 8, !dbg !880
  %24 = load i64, ptr %10, align 8, !dbg !881
  %25 = getelementptr inbounds i8, ptr %23, i64 %24, !dbg !880
  %26 = load i8, ptr %25, align 1, !dbg !880
  %27 = sext i8 %26 to i32, !dbg !880
  %28 = icmp ne i32 %27, 0, !dbg !882
  br i1 %28, label %29, label %37, !dbg !883

29:                                               ; preds = %22
  %30 = load ptr, ptr %5, align 8, !dbg !884
  %31 = load i64, ptr %10, align 8, !dbg !885
  %32 = getelementptr inbounds i8, ptr %30, i64 %31, !dbg !884
  %33 = load i8, ptr %32, align 1, !dbg !884
  %34 = sext i8 %33 to i32, !dbg !884
  %35 = call i32 @__fizzer_model__isspace(i32 noundef %34), !dbg !886
  %36 = icmp ne i32 %35, 0, !dbg !883
  br label %37

37:                                               ; preds = %29, %22
  %38 = phi i1 [ false, %22 ], [ %36, %29 ], !dbg !887
  br i1 %38, label %39, label %42, !dbg !879

39:                                               ; preds = %37
  %40 = load i64, ptr %10, align 8, !dbg !888
  %41 = add i64 %40, 1, !dbg !888
  store i64 %41, ptr %10, align 8, !dbg !888
  br label %22, !dbg !879, !llvm.loop !890

42:                                               ; preds = %37
  %43 = load ptr, ptr %5, align 8, !dbg !892
  %44 = load i64, ptr %10, align 8, !dbg !894
  %45 = getelementptr inbounds i8, ptr %43, i64 %44, !dbg !892
  %46 = load i8, ptr %45, align 1, !dbg !892
  %47 = sext i8 %46 to i32, !dbg !892
  %48 = icmp eq i32 %47, 43, !dbg !895
  br i1 %48, label %49, label %52, !dbg !896

49:                                               ; preds = %42
  %50 = load i64, ptr %10, align 8, !dbg !897
  %51 = add i64 %50, 1, !dbg !897
  store i64 %51, ptr %10, align 8, !dbg !897
  br label %63, !dbg !899

52:                                               ; preds = %42
  %53 = load ptr, ptr %5, align 8, !dbg !900
  %54 = load i64, ptr %10, align 8, !dbg !902
  %55 = getelementptr inbounds i8, ptr %53, i64 %54, !dbg !900
  %56 = load i8, ptr %55, align 1, !dbg !900
  %57 = sext i8 %56 to i32, !dbg !900
  %58 = icmp eq i32 %57, 45, !dbg !903
  br i1 %58, label %59, label %62, !dbg !904

59:                                               ; preds = %52
  store i32 -1, ptr %9, align 4, !dbg !905
  %60 = load i64, ptr %10, align 8, !dbg !907
  %61 = add i64 %60, 1, !dbg !907
  store i64 %61, ptr %10, align 8, !dbg !907
  br label %62, !dbg !908

62:                                               ; preds = %59, %52
  br label %63

63:                                               ; preds = %62, %49
  call void @llvm.dbg.declare(metadata ptr %11, metadata !909, metadata !DIExpression()), !dbg !910
  %64 = load i64, ptr %10, align 8, !dbg !911
  store i64 %64, ptr %11, align 8, !dbg !910
  br label %65, !dbg !912

65:                                               ; preds = %82, %63
  %66 = load ptr, ptr %5, align 8, !dbg !913
  %67 = load i64, ptr %10, align 8, !dbg !914
  %68 = getelementptr inbounds i8, ptr %66, i64 %67, !dbg !913
  %69 = load i8, ptr %68, align 1, !dbg !913
  %70 = sext i8 %69 to i32, !dbg !913
  %71 = icmp ne i32 %70, 0, !dbg !915
  br i1 %71, label %72, label %80, !dbg !916

72:                                               ; preds = %65
  %73 = load ptr, ptr %5, align 8, !dbg !917
  %74 = load i64, ptr %10, align 8, !dbg !918
  %75 = getelementptr inbounds i8, ptr %73, i64 %74, !dbg !917
  %76 = load i8, ptr %75, align 1, !dbg !917
  %77 = sext i8 %76 to i32, !dbg !917
  %78 = call i32 @__fizzer_model__isdigit(i32 noundef %77), !dbg !919
  %79 = icmp ne i32 %78, 0, !dbg !916
  br label %80

80:                                               ; preds = %72, %65
  %81 = phi i1 [ false, %65 ], [ %79, %72 ], !dbg !887
  br i1 %81, label %82, label %95, !dbg !912

82:                                               ; preds = %80
  %83 = load i64, ptr %8, align 8, !dbg !920
  %84 = mul nsw i64 %83, 10, !dbg !922
  %85 = load ptr, ptr %5, align 8, !dbg !923
  %86 = load i64, ptr %10, align 8, !dbg !924
  %87 = getelementptr inbounds i8, ptr %85, i64 %86, !dbg !923
  %88 = load i8, ptr %87, align 1, !dbg !923
  %89 = sext i8 %88 to i32, !dbg !923
  %90 = sub nsw i32 %89, 48, !dbg !925
  %91 = sext i32 %90 to i64, !dbg !926
  %92 = add nsw i64 %84, %91, !dbg !927
  store i64 %92, ptr %8, align 8, !dbg !928
  %93 = load i64, ptr %10, align 8, !dbg !929
  %94 = add i64 %93, 1, !dbg !929
  store i64 %94, ptr %10, align 8, !dbg !929
  br label %65, !dbg !912, !llvm.loop !930

95:                                               ; preds = %80
  %96 = load ptr, ptr %6, align 8, !dbg !932
  %97 = icmp ne ptr %96, null, !dbg !934
  br i1 %97, label %98, label %103, !dbg !935

98:                                               ; preds = %95
  %99 = load ptr, ptr %5, align 8, !dbg !936
  %100 = load i64, ptr %10, align 8, !dbg !938
  %101 = getelementptr inbounds i8, ptr %99, i64 %100, !dbg !939
  %102 = load ptr, ptr %6, align 8, !dbg !940
  store ptr %101, ptr %102, align 8, !dbg !941
  br label %103, !dbg !942

103:                                              ; preds = %98, %95
  %104 = load i32, ptr %9, align 4, !dbg !943
  %105 = sext i32 %104 to i64, !dbg !943
  %106 = load i64, ptr %8, align 8, !dbg !944
  %107 = mul nsw i64 %105, %106, !dbg !945
  store i64 %107, ptr %4, align 8, !dbg !946
  br label %108, !dbg !946

108:                                              ; preds = %103, %20
  %109 = load i64, ptr %4, align 8, !dbg !947
  ret i64 %109, !dbg !947
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__atol(ptr noundef %0) #0 !dbg !948 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !952, metadata !DIExpression()), !dbg !953
  call void @llvm.dbg.declare(metadata ptr %3, metadata !954, metadata !DIExpression()), !dbg !955
  store i64 0, ptr %3, align 8, !dbg !955
  call void @llvm.dbg.declare(metadata ptr %4, metadata !956, metadata !DIExpression()), !dbg !957
  store i32 1, ptr %4, align 4, !dbg !957
  call void @llvm.dbg.declare(metadata ptr %5, metadata !958, metadata !DIExpression()), !dbg !961
  store i64 0, ptr %5, align 8, !dbg !961
  br label %6, !dbg !962

6:                                                ; preds = %23, %1
  %7 = load ptr, ptr %2, align 8, !dbg !963
  %8 = load i64, ptr %5, align 8, !dbg !964
  %9 = getelementptr inbounds i8, ptr %7, i64 %8, !dbg !963
  %10 = load i8, ptr %9, align 1, !dbg !963
  %11 = sext i8 %10 to i32, !dbg !963
  %12 = icmp ne i32 %11, 0, !dbg !965
  br i1 %12, label %13, label %21, !dbg !966

13:                                               ; preds = %6
  %14 = load ptr, ptr %2, align 8, !dbg !967
  %15 = load i64, ptr %5, align 8, !dbg !968
  %16 = getelementptr inbounds i8, ptr %14, i64 %15, !dbg !967
  %17 = load i8, ptr %16, align 1, !dbg !967
  %18 = sext i8 %17 to i32, !dbg !967
  %19 = call i32 @__fizzer_model__isspace(i32 noundef %18), !dbg !969
  %20 = icmp ne i32 %19, 0, !dbg !966
  br label %21

21:                                               ; preds = %13, %6
  %22 = phi i1 [ false, %6 ], [ %20, %13 ], !dbg !970
  br i1 %22, label %23, label %26, !dbg !962

23:                                               ; preds = %21
  %24 = load i64, ptr %5, align 8, !dbg !971
  %25 = add i64 %24, 1, !dbg !971
  store i64 %25, ptr %5, align 8, !dbg !971
  br label %6, !dbg !962, !llvm.loop !973

26:                                               ; preds = %21
  %27 = load ptr, ptr %2, align 8, !dbg !975
  %28 = load i64, ptr %5, align 8, !dbg !977
  %29 = getelementptr inbounds i8, ptr %27, i64 %28, !dbg !975
  %30 = load i8, ptr %29, align 1, !dbg !975
  %31 = sext i8 %30 to i32, !dbg !975
  %32 = icmp eq i32 %31, 43, !dbg !978
  br i1 %32, label %33, label %36, !dbg !979

33:                                               ; preds = %26
  %34 = load i64, ptr %5, align 8, !dbg !980
  %35 = add i64 %34, 1, !dbg !980
  store i64 %35, ptr %5, align 8, !dbg !980
  br label %47, !dbg !982

36:                                               ; preds = %26
  %37 = load ptr, ptr %2, align 8, !dbg !983
  %38 = load i64, ptr %5, align 8, !dbg !985
  %39 = getelementptr inbounds i8, ptr %37, i64 %38, !dbg !983
  %40 = load i8, ptr %39, align 1, !dbg !983
  %41 = sext i8 %40 to i32, !dbg !983
  %42 = icmp eq i32 %41, 45, !dbg !986
  br i1 %42, label %43, label %46, !dbg !987

43:                                               ; preds = %36
  store i32 -1, ptr %4, align 4, !dbg !988
  %44 = load i64, ptr %5, align 8, !dbg !990
  %45 = add i64 %44, 1, !dbg !990
  store i64 %45, ptr %5, align 8, !dbg !990
  br label %46, !dbg !991

46:                                               ; preds = %43, %36
  br label %47

47:                                               ; preds = %46, %33
  br label %48, !dbg !992

48:                                               ; preds = %65, %47
  %49 = load ptr, ptr %2, align 8, !dbg !993
  %50 = load i64, ptr %5, align 8, !dbg !994
  %51 = getelementptr inbounds i8, ptr %49, i64 %50, !dbg !993
  %52 = load i8, ptr %51, align 1, !dbg !993
  %53 = sext i8 %52 to i32, !dbg !993
  %54 = icmp ne i32 %53, 0, !dbg !995
  br i1 %54, label %55, label %63, !dbg !996

55:                                               ; preds = %48
  %56 = load ptr, ptr %2, align 8, !dbg !997
  %57 = load i64, ptr %5, align 8, !dbg !998
  %58 = getelementptr inbounds i8, ptr %56, i64 %57, !dbg !997
  %59 = load i8, ptr %58, align 1, !dbg !997
  %60 = sext i8 %59 to i32, !dbg !997
  %61 = call i32 @__fizzer_model__isdigit(i32 noundef %60), !dbg !999
  %62 = icmp ne i32 %61, 0, !dbg !996
  br label %63

63:                                               ; preds = %55, %48
  %64 = phi i1 [ false, %48 ], [ %62, %55 ], !dbg !970
  br i1 %64, label %65, label %78, !dbg !992

65:                                               ; preds = %63
  %66 = load i64, ptr %3, align 8, !dbg !1000
  %67 = mul nsw i64 %66, 10, !dbg !1002
  %68 = load ptr, ptr %2, align 8, !dbg !1003
  %69 = load i64, ptr %5, align 8, !dbg !1004
  %70 = getelementptr inbounds i8, ptr %68, i64 %69, !dbg !1003
  %71 = load i8, ptr %70, align 1, !dbg !1003
  %72 = sext i8 %71 to i32, !dbg !1003
  %73 = sub nsw i32 %72, 48, !dbg !1005
  %74 = sext i32 %73 to i64, !dbg !1006
  %75 = add nsw i64 %67, %74, !dbg !1007
  store i64 %75, ptr %3, align 8, !dbg !1008
  %76 = load i64, ptr %5, align 8, !dbg !1009
  %77 = add i64 %76, 1, !dbg !1009
  store i64 %77, ptr %5, align 8, !dbg !1009
  br label %48, !dbg !992, !llvm.loop !1010

78:                                               ; preds = %63
  %79 = load i32, ptr %4, align 4, !dbg !1012
  %80 = sext i32 %79 to i64, !dbg !1012
  %81 = load i64, ptr %3, align 8, !dbg !1013
  %82 = mul nsw i64 %80, %81, !dbg !1014
  ret i64 %82, !dbg !1015
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__strtoul(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !1016 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1020, metadata !DIExpression()), !dbg !1021
  store ptr %1, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1022, metadata !DIExpression()), !dbg !1023
  store i32 %2, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1024, metadata !DIExpression()), !dbg !1025
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1026, metadata !DIExpression()), !dbg !1027
  store i64 0, ptr %8, align 8, !dbg !1027
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1028, metadata !DIExpression()), !dbg !1031
  store i64 0, ptr %9, align 8, !dbg !1031
  %11 = load i32, ptr %7, align 4, !dbg !1032
  %12 = icmp ne i32 %11, 10, !dbg !1034
  br i1 %12, label %13, label %20, !dbg !1035

13:                                               ; preds = %3
  %14 = load ptr, ptr %6, align 8, !dbg !1036
  %15 = icmp ne ptr %14, null, !dbg !1039
  br i1 %15, label %16, label %19, !dbg !1040

16:                                               ; preds = %13
  %17 = load ptr, ptr %5, align 8, !dbg !1041
  %18 = load ptr, ptr %6, align 8, !dbg !1043
  store ptr %17, ptr %18, align 8, !dbg !1044
  br label %19, !dbg !1045

19:                                               ; preds = %16, %13
  store i64 0, ptr %4, align 8, !dbg !1046
  br label %93, !dbg !1046

20:                                               ; preds = %3
  br label %21, !dbg !1047

21:                                               ; preds = %38, %20
  %22 = load ptr, ptr %5, align 8, !dbg !1048
  %23 = load i64, ptr %9, align 8, !dbg !1049
  %24 = getelementptr inbounds i8, ptr %22, i64 %23, !dbg !1048
  %25 = load i8, ptr %24, align 1, !dbg !1048
  %26 = sext i8 %25 to i32, !dbg !1048
  %27 = icmp ne i32 %26, 0, !dbg !1050
  br i1 %27, label %28, label %36, !dbg !1051

28:                                               ; preds = %21
  %29 = load ptr, ptr %5, align 8, !dbg !1052
  %30 = load i64, ptr %9, align 8, !dbg !1053
  %31 = getelementptr inbounds i8, ptr %29, i64 %30, !dbg !1052
  %32 = load i8, ptr %31, align 1, !dbg !1052
  %33 = sext i8 %32 to i32, !dbg !1052
  %34 = call i32 @__fizzer_model__isspace(i32 noundef %33), !dbg !1054
  %35 = icmp ne i32 %34, 0, !dbg !1051
  br label %36

36:                                               ; preds = %28, %21
  %37 = phi i1 [ false, %21 ], [ %35, %28 ], !dbg !1055
  br i1 %37, label %38, label %41, !dbg !1047

38:                                               ; preds = %36
  %39 = load i64, ptr %9, align 8, !dbg !1056
  %40 = add i64 %39, 1, !dbg !1056
  store i64 %40, ptr %9, align 8, !dbg !1056
  br label %21, !dbg !1047, !llvm.loop !1058

41:                                               ; preds = %36
  %42 = load ptr, ptr %5, align 8, !dbg !1060
  %43 = load i64, ptr %9, align 8, !dbg !1062
  %44 = getelementptr inbounds i8, ptr %42, i64 %43, !dbg !1060
  %45 = load i8, ptr %44, align 1, !dbg !1060
  %46 = sext i8 %45 to i32, !dbg !1060
  %47 = icmp eq i32 %46, 43, !dbg !1063
  br i1 %47, label %48, label %51, !dbg !1064

48:                                               ; preds = %41
  %49 = load i64, ptr %9, align 8, !dbg !1065
  %50 = add i64 %49, 1, !dbg !1065
  store i64 %50, ptr %9, align 8, !dbg !1065
  br label %51, !dbg !1067

51:                                               ; preds = %48, %41
  call void @llvm.dbg.declare(metadata ptr %10, metadata !1068, metadata !DIExpression()), !dbg !1069
  %52 = load i64, ptr %9, align 8, !dbg !1070
  store i64 %52, ptr %10, align 8, !dbg !1069
  br label %53, !dbg !1071

53:                                               ; preds = %70, %51
  %54 = load ptr, ptr %5, align 8, !dbg !1072
  %55 = load i64, ptr %9, align 8, !dbg !1073
  %56 = getelementptr inbounds i8, ptr %54, i64 %55, !dbg !1072
  %57 = load i8, ptr %56, align 1, !dbg !1072
  %58 = sext i8 %57 to i32, !dbg !1072
  %59 = icmp ne i32 %58, 0, !dbg !1074
  br i1 %59, label %60, label %68, !dbg !1075

60:                                               ; preds = %53
  %61 = load ptr, ptr %5, align 8, !dbg !1076
  %62 = load i64, ptr %9, align 8, !dbg !1077
  %63 = getelementptr inbounds i8, ptr %61, i64 %62, !dbg !1076
  %64 = load i8, ptr %63, align 1, !dbg !1076
  %65 = sext i8 %64 to i32, !dbg !1076
  %66 = call i32 @__fizzer_model__isdigit(i32 noundef %65), !dbg !1078
  %67 = icmp ne i32 %66, 0, !dbg !1075
  br label %68

68:                                               ; preds = %60, %53
  %69 = phi i1 [ false, %53 ], [ %67, %60 ], !dbg !1055
  br i1 %69, label %70, label %83, !dbg !1071

70:                                               ; preds = %68
  %71 = load i64, ptr %8, align 8, !dbg !1079
  %72 = mul i64 %71, 10, !dbg !1081
  %73 = load ptr, ptr %5, align 8, !dbg !1082
  %74 = load i64, ptr %9, align 8, !dbg !1083
  %75 = getelementptr inbounds i8, ptr %73, i64 %74, !dbg !1082
  %76 = load i8, ptr %75, align 1, !dbg !1082
  %77 = sext i8 %76 to i32, !dbg !1082
  %78 = sub nsw i32 %77, 48, !dbg !1084
  %79 = sext i32 %78 to i64, !dbg !1085
  %80 = add i64 %72, %79, !dbg !1086
  store i64 %80, ptr %8, align 8, !dbg !1087
  %81 = load i64, ptr %9, align 8, !dbg !1088
  %82 = add i64 %81, 1, !dbg !1088
  store i64 %82, ptr %9, align 8, !dbg !1088
  br label %53, !dbg !1071, !llvm.loop !1089

83:                                               ; preds = %68
  %84 = load ptr, ptr %6, align 8, !dbg !1091
  %85 = icmp ne ptr %84, null, !dbg !1093
  br i1 %85, label %86, label %91, !dbg !1094

86:                                               ; preds = %83
  %87 = load ptr, ptr %5, align 8, !dbg !1095
  %88 = load i64, ptr %9, align 8, !dbg !1097
  %89 = getelementptr inbounds i8, ptr %87, i64 %88, !dbg !1098
  %90 = load ptr, ptr %6, align 8, !dbg !1099
  store ptr %89, ptr %90, align 8, !dbg !1100
  br label %91, !dbg !1101

91:                                               ; preds = %86, %83
  %92 = load i64, ptr %8, align 8, !dbg !1102
  store i64 %92, ptr %4, align 8, !dbg !1103
  br label %93, !dbg !1103

93:                                               ; preds = %91, %19
  %94 = load i64, ptr %4, align 8, !dbg !1104
  ret i64 %94, !dbg !1104
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__atoi(ptr noundef %0) #0 !dbg !1105 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1109, metadata !DIExpression()), !dbg !1110
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1111, metadata !DIExpression()), !dbg !1112
  store i32 0, ptr %3, align 4, !dbg !1112
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1113, metadata !DIExpression()), !dbg !1114
  store i32 1, ptr %4, align 4, !dbg !1114
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1115, metadata !DIExpression()), !dbg !1118
  store i64 0, ptr %5, align 8, !dbg !1118
  br label %6, !dbg !1119

6:                                                ; preds = %23, %1
  %7 = load ptr, ptr %2, align 8, !dbg !1120
  %8 = load i64, ptr %5, align 8, !dbg !1121
  %9 = getelementptr inbounds i8, ptr %7, i64 %8, !dbg !1120
  %10 = load i8, ptr %9, align 1, !dbg !1120
  %11 = sext i8 %10 to i32, !dbg !1120
  %12 = icmp ne i32 %11, 0, !dbg !1122
  br i1 %12, label %13, label %21, !dbg !1123

13:                                               ; preds = %6
  %14 = load ptr, ptr %2, align 8, !dbg !1124
  %15 = load i64, ptr %5, align 8, !dbg !1125
  %16 = getelementptr inbounds i8, ptr %14, i64 %15, !dbg !1124
  %17 = load i8, ptr %16, align 1, !dbg !1124
  %18 = sext i8 %17 to i32, !dbg !1124
  %19 = call i32 @__fizzer_model__isspace(i32 noundef %18), !dbg !1126
  %20 = icmp ne i32 %19, 0, !dbg !1123
  br label %21

21:                                               ; preds = %13, %6
  %22 = phi i1 [ false, %6 ], [ %20, %13 ], !dbg !1127
  br i1 %22, label %23, label %26, !dbg !1119

23:                                               ; preds = %21
  %24 = load i64, ptr %5, align 8, !dbg !1128
  %25 = add i64 %24, 1, !dbg !1128
  store i64 %25, ptr %5, align 8, !dbg !1128
  br label %6, !dbg !1119, !llvm.loop !1130

26:                                               ; preds = %21
  %27 = load ptr, ptr %2, align 8, !dbg !1132
  %28 = load i64, ptr %5, align 8, !dbg !1134
  %29 = getelementptr inbounds i8, ptr %27, i64 %28, !dbg !1132
  %30 = load i8, ptr %29, align 1, !dbg !1132
  %31 = sext i8 %30 to i32, !dbg !1132
  %32 = icmp eq i32 %31, 43, !dbg !1135
  br i1 %32, label %33, label %36, !dbg !1136

33:                                               ; preds = %26
  %34 = load i64, ptr %5, align 8, !dbg !1137
  %35 = add i64 %34, 1, !dbg !1137
  store i64 %35, ptr %5, align 8, !dbg !1137
  br label %47, !dbg !1139

36:                                               ; preds = %26
  %37 = load ptr, ptr %2, align 8, !dbg !1140
  %38 = load i64, ptr %5, align 8, !dbg !1142
  %39 = getelementptr inbounds i8, ptr %37, i64 %38, !dbg !1140
  %40 = load i8, ptr %39, align 1, !dbg !1140
  %41 = sext i8 %40 to i32, !dbg !1140
  %42 = icmp eq i32 %41, 45, !dbg !1143
  br i1 %42, label %43, label %46, !dbg !1144

43:                                               ; preds = %36
  store i32 -1, ptr %4, align 4, !dbg !1145
  %44 = load i64, ptr %5, align 8, !dbg !1147
  %45 = add i64 %44, 1, !dbg !1147
  store i64 %45, ptr %5, align 8, !dbg !1147
  br label %46, !dbg !1148

46:                                               ; preds = %43, %36
  br label %47

47:                                               ; preds = %46, %33
  br label %48, !dbg !1149

48:                                               ; preds = %65, %47
  %49 = load ptr, ptr %2, align 8, !dbg !1150
  %50 = load i64, ptr %5, align 8, !dbg !1151
  %51 = getelementptr inbounds i8, ptr %49, i64 %50, !dbg !1150
  %52 = load i8, ptr %51, align 1, !dbg !1150
  %53 = sext i8 %52 to i32, !dbg !1150
  %54 = icmp ne i32 %53, 0, !dbg !1152
  br i1 %54, label %55, label %63, !dbg !1153

55:                                               ; preds = %48
  %56 = load ptr, ptr %2, align 8, !dbg !1154
  %57 = load i64, ptr %5, align 8, !dbg !1155
  %58 = getelementptr inbounds i8, ptr %56, i64 %57, !dbg !1154
  %59 = load i8, ptr %58, align 1, !dbg !1154
  %60 = sext i8 %59 to i32, !dbg !1154
  %61 = call i32 @__fizzer_model__isdigit(i32 noundef %60), !dbg !1156
  %62 = icmp ne i32 %61, 0, !dbg !1153
  br label %63

63:                                               ; preds = %55, %48
  %64 = phi i1 [ false, %48 ], [ %62, %55 ], !dbg !1127
  br i1 %64, label %65, label %77, !dbg !1149

65:                                               ; preds = %63
  %66 = load i32, ptr %3, align 4, !dbg !1157
  %67 = mul nsw i32 %66, 10, !dbg !1159
  %68 = load ptr, ptr %2, align 8, !dbg !1160
  %69 = load i64, ptr %5, align 8, !dbg !1161
  %70 = getelementptr inbounds i8, ptr %68, i64 %69, !dbg !1160
  %71 = load i8, ptr %70, align 1, !dbg !1160
  %72 = sext i8 %71 to i32, !dbg !1160
  %73 = sub nsw i32 %72, 48, !dbg !1162
  %74 = add nsw i32 %67, %73, !dbg !1163
  store i32 %74, ptr %3, align 4, !dbg !1164
  %75 = load i64, ptr %5, align 8, !dbg !1165
  %76 = add i64 %75, 1, !dbg !1165
  store i64 %76, ptr %5, align 8, !dbg !1165
  br label %48, !dbg !1149, !llvm.loop !1166

77:                                               ; preds = %63
  %78 = load i32, ptr %4, align 4, !dbg !1168
  %79 = load i32, ptr %3, align 4, !dbg !1169
  %80 = mul nsw i32 %78, %79, !dbg !1170
  ret i32 %80, !dbg !1171
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strstr(ptr noundef %0, ptr noundef %1) #0 !dbg !1172 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1176, metadata !DIExpression()), !dbg !1177
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1178, metadata !DIExpression()), !dbg !1179
  %8 = load ptr, ptr %5, align 8, !dbg !1180
  %9 = load i8, ptr %8, align 1, !dbg !1182
  %10 = sext i8 %9 to i32, !dbg !1182
  %11 = icmp eq i32 %10, 0, !dbg !1183
  br i1 %11, label %12, label %14, !dbg !1184

12:                                               ; preds = %2
  %13 = load ptr, ptr %4, align 8, !dbg !1185
  store ptr %13, ptr %3, align 8, !dbg !1187
  br label %59, !dbg !1187

14:                                               ; preds = %2
  br label %15, !dbg !1188

15:                                               ; preds = %55, %14
  %16 = load ptr, ptr %4, align 8, !dbg !1189
  %17 = load i8, ptr %16, align 1, !dbg !1190
  %18 = sext i8 %17 to i32, !dbg !1190
  %19 = icmp ne i32 %18, 0, !dbg !1191
  br i1 %19, label %20, label %58, !dbg !1188

20:                                               ; preds = %15
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1192, metadata !DIExpression()), !dbg !1194
  %21 = load ptr, ptr %4, align 8, !dbg !1195
  store ptr %21, ptr %6, align 8, !dbg !1194
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1196, metadata !DIExpression()), !dbg !1197
  %22 = load ptr, ptr %5, align 8, !dbg !1198
  store ptr %22, ptr %7, align 8, !dbg !1197
  br label %23, !dbg !1199

23:                                               ; preds = %43, %20
  %24 = load ptr, ptr %6, align 8, !dbg !1200
  %25 = load i8, ptr %24, align 1, !dbg !1201
  %26 = sext i8 %25 to i32, !dbg !1201
  %27 = icmp ne i32 %26, 0, !dbg !1202
  br i1 %27, label %28, label %41, !dbg !1203

28:                                               ; preds = %23
  %29 = load ptr, ptr %7, align 8, !dbg !1204
  %30 = load i8, ptr %29, align 1, !dbg !1205
  %31 = sext i8 %30 to i32, !dbg !1205
  %32 = icmp ne i32 %31, 0, !dbg !1206
  br i1 %32, label %33, label %41, !dbg !1207

33:                                               ; preds = %28
  %34 = load ptr, ptr %6, align 8, !dbg !1208
  %35 = load i8, ptr %34, align 1, !dbg !1209
  %36 = sext i8 %35 to i32, !dbg !1209
  %37 = load ptr, ptr %7, align 8, !dbg !1210
  %38 = load i8, ptr %37, align 1, !dbg !1211
  %39 = sext i8 %38 to i32, !dbg !1211
  %40 = icmp eq i32 %36, %39, !dbg !1212
  br label %41

41:                                               ; preds = %33, %28, %23
  %42 = phi i1 [ false, %28 ], [ false, %23 ], [ %40, %33 ], !dbg !1213
  br i1 %42, label %43, label %48, !dbg !1199

43:                                               ; preds = %41
  %44 = load ptr, ptr %6, align 8, !dbg !1214
  %45 = getelementptr inbounds i8, ptr %44, i32 1, !dbg !1214
  store ptr %45, ptr %6, align 8, !dbg !1214
  %46 = load ptr, ptr %7, align 8, !dbg !1216
  %47 = getelementptr inbounds i8, ptr %46, i32 1, !dbg !1216
  store ptr %47, ptr %7, align 8, !dbg !1216
  br label %23, !dbg !1199, !llvm.loop !1217

48:                                               ; preds = %41
  %49 = load ptr, ptr %7, align 8, !dbg !1219
  %50 = load i8, ptr %49, align 1, !dbg !1221
  %51 = sext i8 %50 to i32, !dbg !1221
  %52 = icmp eq i32 %51, 0, !dbg !1222
  br i1 %52, label %53, label %55, !dbg !1223

53:                                               ; preds = %48
  %54 = load ptr, ptr %4, align 8, !dbg !1224
  store ptr %54, ptr %3, align 8, !dbg !1226
  br label %59, !dbg !1226

55:                                               ; preds = %48
  %56 = load ptr, ptr %4, align 8, !dbg !1227
  %57 = getelementptr inbounds i8, ptr %56, i32 1, !dbg !1227
  store ptr %57, ptr %4, align 8, !dbg !1227
  br label %15, !dbg !1188, !llvm.loop !1228

58:                                               ; preds = %15
  store ptr null, ptr %3, align 8, !dbg !1230
  br label %59, !dbg !1230

59:                                               ; preds = %58, %53, %12
  %60 = load ptr, ptr %3, align 8, !dbg !1231
  ret ptr %60, !dbg !1231
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strpbrk(ptr noundef %0, ptr noundef %1) #0 !dbg !1232 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1234, metadata !DIExpression()), !dbg !1235
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1236, metadata !DIExpression()), !dbg !1237
  br label %7, !dbg !1238

7:                                                ; preds = %32, %2
  %8 = load ptr, ptr %4, align 8, !dbg !1239
  %9 = load i8, ptr %8, align 1, !dbg !1240
  %10 = sext i8 %9 to i32, !dbg !1240
  %11 = icmp ne i32 %10, 0, !dbg !1241
  br i1 %11, label %12, label %35, !dbg !1238

12:                                               ; preds = %7
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1242, metadata !DIExpression()), !dbg !1244
  %13 = load ptr, ptr %5, align 8, !dbg !1245
  store ptr %13, ptr %6, align 8, !dbg !1244
  br label %14, !dbg !1246

14:                                               ; preds = %29, %12
  %15 = load ptr, ptr %6, align 8, !dbg !1247
  %16 = load i8, ptr %15, align 1, !dbg !1248
  %17 = sext i8 %16 to i32, !dbg !1248
  %18 = icmp ne i32 %17, 0, !dbg !1249
  br i1 %18, label %19, label %32, !dbg !1246

19:                                               ; preds = %14
  %20 = load ptr, ptr %6, align 8, !dbg !1250
  %21 = load i8, ptr %20, align 1, !dbg !1253
  %22 = sext i8 %21 to i32, !dbg !1253
  %23 = load ptr, ptr %4, align 8, !dbg !1254
  %24 = load i8, ptr %23, align 1, !dbg !1255
  %25 = sext i8 %24 to i32, !dbg !1255
  %26 = icmp eq i32 %22, %25, !dbg !1256
  br i1 %26, label %27, label %29, !dbg !1257

27:                                               ; preds = %19
  %28 = load ptr, ptr %4, align 8, !dbg !1258
  store ptr %28, ptr %3, align 8, !dbg !1260
  br label %36, !dbg !1260

29:                                               ; preds = %19
  %30 = load ptr, ptr %6, align 8, !dbg !1261
  %31 = getelementptr inbounds i8, ptr %30, i32 1, !dbg !1261
  store ptr %31, ptr %6, align 8, !dbg !1261
  br label %14, !dbg !1246, !llvm.loop !1262

32:                                               ; preds = %14
  %33 = load ptr, ptr %4, align 8, !dbg !1264
  %34 = getelementptr inbounds i8, ptr %33, i32 1, !dbg !1264
  store ptr %34, ptr %4, align 8, !dbg !1264
  br label %7, !dbg !1238, !llvm.loop !1265

35:                                               ; preds = %7
  store ptr null, ptr %3, align 8, !dbg !1267
  br label %36, !dbg !1267

36:                                               ; preds = %35, %27
  %37 = load ptr, ptr %3, align 8, !dbg !1268
  ret ptr %37, !dbg !1268
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strcpy(ptr noundef %0, ptr noundef %1) #0 !dbg !1269 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1271, metadata !DIExpression()), !dbg !1272
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1273, metadata !DIExpression()), !dbg !1274
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1275, metadata !DIExpression()), !dbg !1276
  %6 = load ptr, ptr %3, align 8, !dbg !1277
  store ptr %6, ptr %5, align 8, !dbg !1276
  br label %7, !dbg !1278

7:                                                ; preds = %12, %2
  %8 = load ptr, ptr %4, align 8, !dbg !1279
  %9 = load i8, ptr %8, align 1, !dbg !1280
  %10 = sext i8 %9 to i32, !dbg !1280
  %11 = icmp ne i32 %10, 0, !dbg !1281
  br i1 %11, label %12, label %20, !dbg !1278

12:                                               ; preds = %7
  %13 = load ptr, ptr %4, align 8, !dbg !1282
  %14 = load i8, ptr %13, align 1, !dbg !1284
  %15 = load ptr, ptr %5, align 8, !dbg !1285
  store i8 %14, ptr %15, align 1, !dbg !1286
  %16 = load ptr, ptr %5, align 8, !dbg !1287
  %17 = getelementptr inbounds i8, ptr %16, i32 1, !dbg !1287
  store ptr %17, ptr %5, align 8, !dbg !1287
  %18 = load ptr, ptr %4, align 8, !dbg !1288
  %19 = getelementptr inbounds i8, ptr %18, i32 1, !dbg !1288
  store ptr %19, ptr %4, align 8, !dbg !1288
  br label %7, !dbg !1278, !llvm.loop !1289

20:                                               ; preds = %7
  %21 = load ptr, ptr %5, align 8, !dbg !1291
  store i8 0, ptr %21, align 1, !dbg !1292
  %22 = load ptr, ptr %3, align 8, !dbg !1293
  ret ptr %22, !dbg !1294
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strncat(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 !dbg !1295 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1301, metadata !DIExpression()), !dbg !1302
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1303, metadata !DIExpression()), !dbg !1304
  store i64 %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1305, metadata !DIExpression()), !dbg !1306
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1307, metadata !DIExpression()), !dbg !1308
  %9 = load ptr, ptr %4, align 8, !dbg !1309
  store ptr %9, ptr %7, align 8, !dbg !1308
  br label %10, !dbg !1310

10:                                               ; preds = %15, %3
  %11 = load ptr, ptr %7, align 8, !dbg !1311
  %12 = load i8, ptr %11, align 1, !dbg !1312
  %13 = sext i8 %12 to i32, !dbg !1312
  %14 = icmp ne i32 %13, 0, !dbg !1313
  br i1 %14, label %15, label %18, !dbg !1310

15:                                               ; preds = %10
  %16 = load ptr, ptr %7, align 8, !dbg !1314
  %17 = getelementptr inbounds i8, ptr %16, i32 1, !dbg !1314
  store ptr %17, ptr %7, align 8, !dbg !1314
  br label %10, !dbg !1310, !llvm.loop !1316

18:                                               ; preds = %10
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1318, metadata !DIExpression()), !dbg !1319
  store i64 0, ptr %8, align 8, !dbg !1319
  br label %19, !dbg !1320

19:                                               ; preds = %30, %18
  %20 = load i64, ptr %8, align 8, !dbg !1321
  %21 = load i64, ptr %6, align 8, !dbg !1322
  %22 = icmp ult i64 %20, %21, !dbg !1323
  br i1 %22, label %23, label %28, !dbg !1324

23:                                               ; preds = %19
  %24 = load ptr, ptr %5, align 8, !dbg !1325
  %25 = load i8, ptr %24, align 1, !dbg !1326
  %26 = sext i8 %25 to i32, !dbg !1326
  %27 = icmp ne i32 %26, 0, !dbg !1327
  br label %28

28:                                               ; preds = %23, %19
  %29 = phi i1 [ false, %19 ], [ %27, %23 ], !dbg !1328
  br i1 %29, label %30, label %40, !dbg !1320

30:                                               ; preds = %28
  %31 = load ptr, ptr %5, align 8, !dbg !1329
  %32 = load i8, ptr %31, align 1, !dbg !1331
  %33 = load ptr, ptr %7, align 8, !dbg !1332
  store i8 %32, ptr %33, align 1, !dbg !1333
  %34 = load ptr, ptr %7, align 8, !dbg !1334
  %35 = getelementptr inbounds i8, ptr %34, i32 1, !dbg !1334
  store ptr %35, ptr %7, align 8, !dbg !1334
  %36 = load ptr, ptr %5, align 8, !dbg !1335
  %37 = getelementptr inbounds i8, ptr %36, i32 1, !dbg !1335
  store ptr %37, ptr %5, align 8, !dbg !1335
  %38 = load i64, ptr %8, align 8, !dbg !1336
  %39 = add i64 %38, 1, !dbg !1336
  store i64 %39, ptr %8, align 8, !dbg !1336
  br label %19, !dbg !1320, !llvm.loop !1337

40:                                               ; preds = %28
  %41 = load ptr, ptr %7, align 8, !dbg !1339
  store i8 0, ptr %41, align 1, !dbg !1340
  %42 = load ptr, ptr %4, align 8, !dbg !1341
  ret ptr %42, !dbg !1342
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__strcspn(ptr noundef %0, ptr noundef %1) #0 !dbg !1343 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1349, metadata !DIExpression()), !dbg !1350
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1351, metadata !DIExpression()), !dbg !1352
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1353, metadata !DIExpression()), !dbg !1354
  store i64 0, ptr %5, align 8, !dbg !1354
  br label %7, !dbg !1355

7:                                                ; preds = %38, %2
  %8 = load ptr, ptr %3, align 8, !dbg !1356
  %9 = load i8, ptr %8, align 1, !dbg !1357
  %10 = sext i8 %9 to i32, !dbg !1357
  %11 = icmp ne i32 %10, 0, !dbg !1358
  br i1 %11, label %12, label %43, !dbg !1355

12:                                               ; preds = %7
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1359, metadata !DIExpression()), !dbg !1361
  %13 = load ptr, ptr %4, align 8, !dbg !1362
  store ptr %13, ptr %6, align 8, !dbg !1361
  br label %14, !dbg !1363

14:                                               ; preds = %29, %12
  %15 = load ptr, ptr %6, align 8, !dbg !1364
  %16 = load i8, ptr %15, align 1, !dbg !1365
  %17 = sext i8 %16 to i32, !dbg !1365
  %18 = icmp ne i32 %17, 0, !dbg !1366
  br i1 %18, label %19, label %27, !dbg !1367

19:                                               ; preds = %14
  %20 = load ptr, ptr %6, align 8, !dbg !1368
  %21 = load i8, ptr %20, align 1, !dbg !1369
  %22 = sext i8 %21 to i32, !dbg !1369
  %23 = load ptr, ptr %3, align 8, !dbg !1370
  %24 = load i8, ptr %23, align 1, !dbg !1371
  %25 = sext i8 %24 to i32, !dbg !1371
  %26 = icmp ne i32 %22, %25, !dbg !1372
  br label %27

27:                                               ; preds = %19, %14
  %28 = phi i1 [ false, %14 ], [ %26, %19 ], !dbg !1373
  br i1 %28, label %29, label %32, !dbg !1363

29:                                               ; preds = %27
  %30 = load ptr, ptr %6, align 8, !dbg !1374
  %31 = getelementptr inbounds i8, ptr %30, i32 1, !dbg !1374
  store ptr %31, ptr %6, align 8, !dbg !1374
  br label %14, !dbg !1363, !llvm.loop !1376

32:                                               ; preds = %27
  %33 = load ptr, ptr %6, align 8, !dbg !1378
  %34 = load i8, ptr %33, align 1, !dbg !1380
  %35 = sext i8 %34 to i32, !dbg !1380
  %36 = icmp ne i32 %35, 0, !dbg !1381
  br i1 %36, label %37, label %38, !dbg !1382

37:                                               ; preds = %32
  br label %43, !dbg !1383

38:                                               ; preds = %32
  %39 = load i64, ptr %5, align 8, !dbg !1385
  %40 = add i64 %39, 1, !dbg !1385
  store i64 %40, ptr %5, align 8, !dbg !1385
  %41 = load ptr, ptr %3, align 8, !dbg !1386
  %42 = getelementptr inbounds i8, ptr %41, i32 1, !dbg !1386
  store ptr %42, ptr %3, align 8, !dbg !1386
  br label %7, !dbg !1355, !llvm.loop !1387

43:                                               ; preds = %37, %7
  %44 = load i64, ptr %5, align 8, !dbg !1389
  ret i64 %44, !dbg !1390
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strcoll(ptr noundef %0, ptr noundef %1) #0 !dbg !1391 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1395, metadata !DIExpression()), !dbg !1396
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1397, metadata !DIExpression()), !dbg !1398
  br label %5, !dbg !1399

5:                                                ; preds = %20, %2
  %6 = load ptr, ptr %3, align 8, !dbg !1400
  %7 = load i8, ptr %6, align 1, !dbg !1401
  %8 = sext i8 %7 to i32, !dbg !1401
  %9 = icmp ne i32 %8, 0, !dbg !1402
  br i1 %9, label %10, label %18, !dbg !1403

10:                                               ; preds = %5
  %11 = load ptr, ptr %3, align 8, !dbg !1404
  %12 = load i8, ptr %11, align 1, !dbg !1405
  %13 = sext i8 %12 to i32, !dbg !1405
  %14 = load ptr, ptr %4, align 8, !dbg !1406
  %15 = load i8, ptr %14, align 1, !dbg !1407
  %16 = sext i8 %15 to i32, !dbg !1407
  %17 = icmp eq i32 %13, %16, !dbg !1408
  br label %18

18:                                               ; preds = %10, %5
  %19 = phi i1 [ false, %5 ], [ %17, %10 ], !dbg !1409
  br i1 %19, label %20, label %25, !dbg !1399

20:                                               ; preds = %18
  %21 = load ptr, ptr %3, align 8, !dbg !1410
  %22 = getelementptr inbounds i8, ptr %21, i32 1, !dbg !1410
  store ptr %22, ptr %3, align 8, !dbg !1410
  %23 = load ptr, ptr %4, align 8, !dbg !1412
  %24 = getelementptr inbounds i8, ptr %23, i32 1, !dbg !1412
  store ptr %24, ptr %4, align 8, !dbg !1412
  br label %5, !dbg !1399, !llvm.loop !1413

25:                                               ; preds = %18
  %26 = load ptr, ptr %3, align 8, !dbg !1415
  %27 = load i8, ptr %26, align 1, !dbg !1416
  %28 = zext i8 %27 to i32, !dbg !1417
  %29 = load ptr, ptr %4, align 8, !dbg !1418
  %30 = load i8, ptr %29, align 1, !dbg !1419
  %31 = zext i8 %30 to i32, !dbg !1420
  %32 = sub nsw i32 %28, %31, !dbg !1421
  ret i32 %32, !dbg !1422
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strcmp(ptr noundef %0, ptr noundef %1) #0 !dbg !1423 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1425, metadata !DIExpression()), !dbg !1426
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1427, metadata !DIExpression()), !dbg !1428
  br label %5, !dbg !1429

5:                                                ; preds = %20, %2
  %6 = load ptr, ptr %3, align 8, !dbg !1430
  %7 = load i8, ptr %6, align 1, !dbg !1431
  %8 = sext i8 %7 to i32, !dbg !1431
  %9 = icmp ne i32 %8, 0, !dbg !1432
  br i1 %9, label %10, label %18, !dbg !1433

10:                                               ; preds = %5
  %11 = load ptr, ptr %3, align 8, !dbg !1434
  %12 = load i8, ptr %11, align 1, !dbg !1435
  %13 = sext i8 %12 to i32, !dbg !1435
  %14 = load ptr, ptr %4, align 8, !dbg !1436
  %15 = load i8, ptr %14, align 1, !dbg !1437
  %16 = sext i8 %15 to i32, !dbg !1437
  %17 = icmp eq i32 %13, %16, !dbg !1438
  br label %18

18:                                               ; preds = %10, %5
  %19 = phi i1 [ false, %5 ], [ %17, %10 ], !dbg !1439
  br i1 %19, label %20, label %25, !dbg !1429

20:                                               ; preds = %18
  %21 = load ptr, ptr %3, align 8, !dbg !1440
  %22 = getelementptr inbounds i8, ptr %21, i32 1, !dbg !1440
  store ptr %22, ptr %3, align 8, !dbg !1440
  %23 = load ptr, ptr %4, align 8, !dbg !1442
  %24 = getelementptr inbounds i8, ptr %23, i32 1, !dbg !1442
  store ptr %24, ptr %4, align 8, !dbg !1442
  br label %5, !dbg !1429, !llvm.loop !1443

25:                                               ; preds = %18
  %26 = load ptr, ptr %3, align 8, !dbg !1445
  %27 = load i8, ptr %26, align 1, !dbg !1446
  %28 = zext i8 %27 to i32, !dbg !1447
  %29 = load ptr, ptr %4, align 8, !dbg !1448
  %30 = load i8, ptr %29, align 1, !dbg !1449
  %31 = zext i8 %30 to i32, !dbg !1450
  %32 = sub nsw i32 %28, %31, !dbg !1451
  ret i32 %32, !dbg !1452
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__strncmp(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 !dbg !1453 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i8, align 1
  %10 = alloca i8, align 1
  store ptr %0, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1459, metadata !DIExpression()), !dbg !1460
  store ptr %1, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1461, metadata !DIExpression()), !dbg !1462
  store i64 %2, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1463, metadata !DIExpression()), !dbg !1464
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1465, metadata !DIExpression()), !dbg !1466
  store i64 0, ptr %8, align 8, !dbg !1466
  br label %11, !dbg !1467

11:                                               ; preds = %43, %3
  %12 = load i64, ptr %8, align 8, !dbg !1468
  %13 = load i64, ptr %7, align 8, !dbg !1469
  %14 = icmp ult i64 %12, %13, !dbg !1470
  br i1 %14, label %15, label %46, !dbg !1467

15:                                               ; preds = %11
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1471, metadata !DIExpression()), !dbg !1473
  %16 = load ptr, ptr %5, align 8, !dbg !1474
  %17 = load i64, ptr %8, align 8, !dbg !1475
  %18 = getelementptr inbounds i8, ptr %16, i64 %17, !dbg !1474
  %19 = load i8, ptr %18, align 1, !dbg !1474
  store i8 %19, ptr %9, align 1, !dbg !1473
  call void @llvm.dbg.declare(metadata ptr %10, metadata !1476, metadata !DIExpression()), !dbg !1477
  %20 = load ptr, ptr %6, align 8, !dbg !1478
  %21 = load i64, ptr %8, align 8, !dbg !1479
  %22 = getelementptr inbounds i8, ptr %20, i64 %21, !dbg !1478
  %23 = load i8, ptr %22, align 1, !dbg !1478
  store i8 %23, ptr %10, align 1, !dbg !1477
  %24 = load i8, ptr %9, align 1, !dbg !1480
  %25 = zext i8 %24 to i32, !dbg !1480
  %26 = load i8, ptr %10, align 1, !dbg !1482
  %27 = zext i8 %26 to i32, !dbg !1482
  %28 = icmp ne i32 %25, %27, !dbg !1483
  br i1 %28, label %37, label %29, !dbg !1484

29:                                               ; preds = %15
  %30 = load i8, ptr %9, align 1, !dbg !1485
  %31 = zext i8 %30 to i32, !dbg !1485
  %32 = icmp eq i32 %31, 0, !dbg !1486
  br i1 %32, label %37, label %33, !dbg !1487

33:                                               ; preds = %29
  %34 = load i8, ptr %10, align 1, !dbg !1488
  %35 = zext i8 %34 to i32, !dbg !1488
  %36 = icmp eq i32 %35, 0, !dbg !1489
  br i1 %36, label %37, label %43, !dbg !1490

37:                                               ; preds = %33, %29, %15
  %38 = load i8, ptr %9, align 1, !dbg !1491
  %39 = zext i8 %38 to i32, !dbg !1491
  %40 = load i8, ptr %10, align 1, !dbg !1493
  %41 = zext i8 %40 to i32, !dbg !1493
  %42 = sub nsw i32 %39, %41, !dbg !1494
  store i32 %42, ptr %4, align 4, !dbg !1495
  br label %47, !dbg !1495

43:                                               ; preds = %33
  %44 = load i64, ptr %8, align 8, !dbg !1496
  %45 = add i64 %44, 1, !dbg !1496
  store i64 %45, ptr %8, align 8, !dbg !1496
  br label %11, !dbg !1467, !llvm.loop !1497

46:                                               ; preds = %11
  store i32 0, ptr %4, align 4, !dbg !1499
  br label %47, !dbg !1499

47:                                               ; preds = %46, %37
  %48 = load i32, ptr %4, align 4, !dbg !1500
  ret i32 %48, !dbg !1500
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strrchr(ptr noundef %0, i32 noundef %1) #0 !dbg !1501 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1505, metadata !DIExpression()), !dbg !1506
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1509, metadata !DIExpression()), !dbg !1510
  store ptr null, ptr %6, align 8, !dbg !1510
  br label %7, !dbg !1511

7:                                                ; preds = %22, %2
  %8 = load ptr, ptr %4, align 8, !dbg !1512
  %9 = load i8, ptr %8, align 1, !dbg !1513
  %10 = sext i8 %9 to i32, !dbg !1513
  %11 = icmp ne i32 %10, 0, !dbg !1514
  br i1 %11, label %12, label %25, !dbg !1511

12:                                               ; preds = %7
  %13 = load ptr, ptr %4, align 8, !dbg !1515
  %14 = load i8, ptr %13, align 1, !dbg !1518
  %15 = sext i8 %14 to i32, !dbg !1518
  %16 = load i32, ptr %5, align 4, !dbg !1519
  %17 = trunc i32 %16 to i8, !dbg !1520
  %18 = sext i8 %17 to i32, !dbg !1520
  %19 = icmp eq i32 %15, %18, !dbg !1521
  br i1 %19, label %20, label %22, !dbg !1522

20:                                               ; preds = %12
  %21 = load ptr, ptr %4, align 8, !dbg !1523
  store ptr %21, ptr %6, align 8, !dbg !1525
  br label %22, !dbg !1526

22:                                               ; preds = %20, %12
  %23 = load ptr, ptr %4, align 8, !dbg !1527
  %24 = getelementptr inbounds i8, ptr %23, i32 1, !dbg !1527
  store ptr %24, ptr %4, align 8, !dbg !1527
  br label %7, !dbg !1511, !llvm.loop !1528

25:                                               ; preds = %7
  %26 = load i32, ptr %5, align 4, !dbg !1530
  %27 = trunc i32 %26 to i8, !dbg !1532
  %28 = sext i8 %27 to i32, !dbg !1532
  %29 = icmp eq i32 %28, 0, !dbg !1533
  br i1 %29, label %30, label %32, !dbg !1534

30:                                               ; preds = %25
  %31 = load ptr, ptr %4, align 8, !dbg !1535
  store ptr %31, ptr %3, align 8, !dbg !1537
  br label %34, !dbg !1537

32:                                               ; preds = %25
  %33 = load ptr, ptr %6, align 8, !dbg !1538
  store ptr %33, ptr %3, align 8, !dbg !1539
  br label %34, !dbg !1539

34:                                               ; preds = %32, %30
  %35 = load ptr, ptr %3, align 8, !dbg !1540
  ret ptr %35, !dbg !1540
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strcat(ptr noundef %0, ptr noundef %1) #0 !dbg !1541 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1543, metadata !DIExpression()), !dbg !1544
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1545, metadata !DIExpression()), !dbg !1546
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1547, metadata !DIExpression()), !dbg !1548
  %6 = load ptr, ptr %3, align 8, !dbg !1549
  store ptr %6, ptr %5, align 8, !dbg !1548
  br label %7, !dbg !1550

7:                                                ; preds = %12, %2
  %8 = load ptr, ptr %5, align 8, !dbg !1551
  %9 = load i8, ptr %8, align 1, !dbg !1552
  %10 = sext i8 %9 to i32, !dbg !1552
  %11 = icmp ne i32 %10, 0, !dbg !1553
  br i1 %11, label %12, label %15, !dbg !1550

12:                                               ; preds = %7
  %13 = load ptr, ptr %5, align 8, !dbg !1554
  %14 = getelementptr inbounds i8, ptr %13, i32 1, !dbg !1554
  store ptr %14, ptr %5, align 8, !dbg !1554
  br label %7, !dbg !1550, !llvm.loop !1556

15:                                               ; preds = %7
  br label %16, !dbg !1558

16:                                               ; preds = %21, %15
  %17 = load ptr, ptr %4, align 8, !dbg !1559
  %18 = load i8, ptr %17, align 1, !dbg !1560
  %19 = sext i8 %18 to i32, !dbg !1560
  %20 = icmp ne i32 %19, 0, !dbg !1561
  br i1 %20, label %21, label %29, !dbg !1558

21:                                               ; preds = %16
  %22 = load ptr, ptr %4, align 8, !dbg !1562
  %23 = load i8, ptr %22, align 1, !dbg !1564
  %24 = load ptr, ptr %5, align 8, !dbg !1565
  store i8 %23, ptr %24, align 1, !dbg !1566
  %25 = load ptr, ptr %5, align 8, !dbg !1567
  %26 = getelementptr inbounds i8, ptr %25, i32 1, !dbg !1567
  store ptr %26, ptr %5, align 8, !dbg !1567
  %27 = load ptr, ptr %4, align 8, !dbg !1568
  %28 = getelementptr inbounds i8, ptr %27, i32 1, !dbg !1568
  store ptr %28, ptr %4, align 8, !dbg !1568
  br label %16, !dbg !1558, !llvm.loop !1569

29:                                               ; preds = %16
  %30 = load ptr, ptr %5, align 8, !dbg !1571
  store i8 0, ptr %30, align 1, !dbg !1572
  %31 = load ptr, ptr %3, align 8, !dbg !1573
  ret ptr %31, !dbg !1574
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__strspn(ptr noundef %0, ptr noundef %1) #0 !dbg !1575 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1581, metadata !DIExpression()), !dbg !1582
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1583, metadata !DIExpression()), !dbg !1584
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1585, metadata !DIExpression()), !dbg !1586
  store i64 0, ptr %5, align 8, !dbg !1586
  br label %7, !dbg !1587

7:                                                ; preds = %38, %2
  %8 = load ptr, ptr %3, align 8, !dbg !1588
  %9 = load i8, ptr %8, align 1, !dbg !1589
  %10 = sext i8 %9 to i32, !dbg !1589
  %11 = icmp ne i32 %10, 0, !dbg !1590
  br i1 %11, label %12, label %43, !dbg !1587

12:                                               ; preds = %7
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1591, metadata !DIExpression()), !dbg !1593
  %13 = load ptr, ptr %4, align 8, !dbg !1594
  store ptr %13, ptr %6, align 8, !dbg !1593
  br label %14, !dbg !1595

14:                                               ; preds = %29, %12
  %15 = load ptr, ptr %6, align 8, !dbg !1596
  %16 = load i8, ptr %15, align 1, !dbg !1597
  %17 = sext i8 %16 to i32, !dbg !1597
  %18 = icmp ne i32 %17, 0, !dbg !1598
  br i1 %18, label %19, label %27, !dbg !1599

19:                                               ; preds = %14
  %20 = load ptr, ptr %6, align 8, !dbg !1600
  %21 = load i8, ptr %20, align 1, !dbg !1601
  %22 = sext i8 %21 to i32, !dbg !1601
  %23 = load ptr, ptr %3, align 8, !dbg !1602
  %24 = load i8, ptr %23, align 1, !dbg !1603
  %25 = sext i8 %24 to i32, !dbg !1603
  %26 = icmp ne i32 %22, %25, !dbg !1604
  br label %27

27:                                               ; preds = %19, %14
  %28 = phi i1 [ false, %14 ], [ %26, %19 ], !dbg !1605
  br i1 %28, label %29, label %32, !dbg !1595

29:                                               ; preds = %27
  %30 = load ptr, ptr %6, align 8, !dbg !1606
  %31 = getelementptr inbounds i8, ptr %30, i32 1, !dbg !1606
  store ptr %31, ptr %6, align 8, !dbg !1606
  br label %14, !dbg !1595, !llvm.loop !1608

32:                                               ; preds = %27
  %33 = load ptr, ptr %6, align 8, !dbg !1610
  %34 = load i8, ptr %33, align 1, !dbg !1612
  %35 = sext i8 %34 to i32, !dbg !1612
  %36 = icmp eq i32 %35, 0, !dbg !1613
  br i1 %36, label %37, label %38, !dbg !1614

37:                                               ; preds = %32
  br label %43, !dbg !1615

38:                                               ; preds = %32
  %39 = load i64, ptr %5, align 8, !dbg !1617
  %40 = add i64 %39, 1, !dbg !1617
  store i64 %40, ptr %5, align 8, !dbg !1617
  %41 = load ptr, ptr %3, align 8, !dbg !1618
  %42 = getelementptr inbounds i8, ptr %41, i32 1, !dbg !1618
  store ptr %42, ptr %3, align 8, !dbg !1618
  br label %7, !dbg !1587, !llvm.loop !1619

43:                                               ; preds = %37, %7
  %44 = load i64, ptr %5, align 8, !dbg !1621
  ret i64 %44, !dbg !1622
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strncpy(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 !dbg !1623 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1629, metadata !DIExpression()), !dbg !1630
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1631, metadata !DIExpression()), !dbg !1632
  store i64 %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1633, metadata !DIExpression()), !dbg !1634
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1635, metadata !DIExpression()), !dbg !1636
  store i64 0, ptr %7, align 8, !dbg !1636
  br label %8, !dbg !1637

8:                                                ; preds = %21, %3
  %9 = load i64, ptr %7, align 8, !dbg !1638
  %10 = load i64, ptr %6, align 8, !dbg !1639
  %11 = icmp ult i64 %9, %10, !dbg !1640
  br i1 %11, label %12, label %19, !dbg !1641

12:                                               ; preds = %8
  %13 = load ptr, ptr %5, align 8, !dbg !1642
  %14 = load i64, ptr %7, align 8, !dbg !1643
  %15 = getelementptr inbounds i8, ptr %13, i64 %14, !dbg !1642
  %16 = load i8, ptr %15, align 1, !dbg !1642
  %17 = sext i8 %16 to i32, !dbg !1642
  %18 = icmp ne i32 %17, 0, !dbg !1644
  br label %19

19:                                               ; preds = %12, %8
  %20 = phi i1 [ false, %8 ], [ %18, %12 ], !dbg !1645
  br i1 %20, label %21, label %31, !dbg !1637

21:                                               ; preds = %19
  %22 = load ptr, ptr %5, align 8, !dbg !1646
  %23 = load i64, ptr %7, align 8, !dbg !1648
  %24 = getelementptr inbounds i8, ptr %22, i64 %23, !dbg !1646
  %25 = load i8, ptr %24, align 1, !dbg !1646
  %26 = load ptr, ptr %4, align 8, !dbg !1649
  %27 = load i64, ptr %7, align 8, !dbg !1650
  %28 = getelementptr inbounds i8, ptr %26, i64 %27, !dbg !1649
  store i8 %25, ptr %28, align 1, !dbg !1651
  %29 = load i64, ptr %7, align 8, !dbg !1652
  %30 = add i64 %29, 1, !dbg !1652
  store i64 %30, ptr %7, align 8, !dbg !1652
  br label %8, !dbg !1637, !llvm.loop !1653

31:                                               ; preds = %19
  br label %32, !dbg !1655

32:                                               ; preds = %36, %31
  %33 = load i64, ptr %7, align 8, !dbg !1656
  %34 = load i64, ptr %6, align 8, !dbg !1657
  %35 = icmp ult i64 %33, %34, !dbg !1658
  br i1 %35, label %36, label %42, !dbg !1655

36:                                               ; preds = %32
  %37 = load ptr, ptr %4, align 8, !dbg !1659
  %38 = load i64, ptr %7, align 8, !dbg !1661
  %39 = getelementptr inbounds i8, ptr %37, i64 %38, !dbg !1659
  store i8 0, ptr %39, align 1, !dbg !1662
  %40 = load i64, ptr %7, align 8, !dbg !1663
  %41 = add i64 %40, 1, !dbg !1663
  store i64 %41, ptr %7, align 8, !dbg !1663
  br label %32, !dbg !1655, !llvm.loop !1664

42:                                               ; preds = %32
  %43 = load ptr, ptr %4, align 8, !dbg !1666
  ret ptr %43, !dbg !1667
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strchr(ptr noundef %0, i32 noundef %1) #0 !dbg !1668 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1670, metadata !DIExpression()), !dbg !1671
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1672, metadata !DIExpression()), !dbg !1673
  br label %6, !dbg !1674

6:                                                ; preds = %21, %2
  %7 = load ptr, ptr %4, align 8, !dbg !1675
  %8 = load i8, ptr %7, align 1, !dbg !1676
  %9 = sext i8 %8 to i32, !dbg !1676
  %10 = icmp ne i32 %9, 0, !dbg !1677
  br i1 %10, label %11, label %24, !dbg !1674

11:                                               ; preds = %6
  %12 = load ptr, ptr %4, align 8, !dbg !1678
  %13 = load i8, ptr %12, align 1, !dbg !1681
  %14 = sext i8 %13 to i32, !dbg !1681
  %15 = load i32, ptr %5, align 4, !dbg !1682
  %16 = trunc i32 %15 to i8, !dbg !1683
  %17 = sext i8 %16 to i32, !dbg !1683
  %18 = icmp eq i32 %14, %17, !dbg !1684
  br i1 %18, label %19, label %21, !dbg !1685

19:                                               ; preds = %11
  %20 = load ptr, ptr %4, align 8, !dbg !1686
  store ptr %20, ptr %3, align 8, !dbg !1688
  br label %32, !dbg !1688

21:                                               ; preds = %11
  %22 = load ptr, ptr %4, align 8, !dbg !1689
  %23 = getelementptr inbounds i8, ptr %22, i32 1, !dbg !1689
  store ptr %23, ptr %4, align 8, !dbg !1689
  br label %6, !dbg !1674, !llvm.loop !1690

24:                                               ; preds = %6
  %25 = load i32, ptr %5, align 4, !dbg !1692
  %26 = trunc i32 %25 to i8, !dbg !1694
  %27 = sext i8 %26 to i32, !dbg !1694
  %28 = icmp eq i32 %27, 0, !dbg !1695
  br i1 %28, label %29, label %31, !dbg !1696

29:                                               ; preds = %24
  %30 = load ptr, ptr %4, align 8, !dbg !1697
  store ptr %30, ptr %3, align 8, !dbg !1699
  br label %32, !dbg !1699

31:                                               ; preds = %24
  store ptr null, ptr %3, align 8, !dbg !1700
  br label %32, !dbg !1700

32:                                               ; preds = %31, %29, %19
  %33 = load ptr, ptr %3, align 8, !dbg !1701
  ret ptr %33, !dbg !1701
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__strerror(i32 noundef %0) #0 !dbg !29 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1702, metadata !DIExpression()), !dbg !1703
  %4 = load i32, ptr %3, align 4, !dbg !1704
  switch i32 %4, label %11 [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %7
    i32 3, label %8
    i32 4, label %9
    i32 5, label %10
  ], !dbg !1705

5:                                                ; preds = %1
  store ptr @.str, ptr %2, align 8, !dbg !1706
  br label %12, !dbg !1706

6:                                                ; preds = %1
  store ptr @.str.1, ptr %2, align 8, !dbg !1708
  br label %12, !dbg !1708

7:                                                ; preds = %1
  store ptr @.str.2, ptr %2, align 8, !dbg !1709
  br label %12, !dbg !1709

8:                                                ; preds = %1
  store ptr @.str.3, ptr %2, align 8, !dbg !1710
  br label %12, !dbg !1710

9:                                                ; preds = %1
  store ptr @.str.4, ptr %2, align 8, !dbg !1711
  br label %12, !dbg !1711

10:                                               ; preds = %1
  store ptr @.str.5, ptr %2, align 8, !dbg !1712
  br label %12, !dbg !1712

11:                                               ; preds = %1
  store ptr @__fizzer_model__strerror.unknown, ptr %2, align 8, !dbg !1713
  br label %12, !dbg !1713

12:                                               ; preds = %11, %10, %9, %8, %7, %6, %5
  %13 = load ptr, ptr %2, align 8, !dbg !1714
  ret ptr %13, !dbg !1714
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__memchr(ptr noundef %0, i32 noundef %1, i64 noundef %2) #0 !dbg !1715 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1723, metadata !DIExpression()), !dbg !1724
  store i32 %1, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1725, metadata !DIExpression()), !dbg !1726
  store i64 %2, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1727, metadata !DIExpression()), !dbg !1728
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1729, metadata !DIExpression()), !dbg !1730
  %10 = load ptr, ptr %5, align 8, !dbg !1731
  store ptr %10, ptr %8, align 8, !dbg !1730
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1732, metadata !DIExpression()), !dbg !1733
  store i64 0, ptr %9, align 8, !dbg !1733
  br label %11, !dbg !1734

11:                                               ; preds = %29, %3
  %12 = load i64, ptr %9, align 8, !dbg !1735
  %13 = load i64, ptr %7, align 8, !dbg !1736
  %14 = icmp ult i64 %12, %13, !dbg !1737
  br i1 %14, label %15, label %32, !dbg !1734

15:                                               ; preds = %11
  %16 = load ptr, ptr %8, align 8, !dbg !1738
  %17 = load i64, ptr %9, align 8, !dbg !1741
  %18 = getelementptr inbounds i8, ptr %16, i64 %17, !dbg !1738
  %19 = load i8, ptr %18, align 1, !dbg !1738
  %20 = zext i8 %19 to i32, !dbg !1738
  %21 = load i32, ptr %6, align 4, !dbg !1742
  %22 = trunc i32 %21 to i8, !dbg !1743
  %23 = zext i8 %22 to i32, !dbg !1743
  %24 = icmp eq i32 %20, %23, !dbg !1744
  br i1 %24, label %25, label %29, !dbg !1745

25:                                               ; preds = %15
  %26 = load ptr, ptr %8, align 8, !dbg !1746
  %27 = load i64, ptr %9, align 8, !dbg !1748
  %28 = getelementptr inbounds i8, ptr %26, i64 %27, !dbg !1749
  store ptr %28, ptr %4, align 8, !dbg !1750
  br label %33, !dbg !1750

29:                                               ; preds = %15
  %30 = load i64, ptr %9, align 8, !dbg !1751
  %31 = add i64 %30, 1, !dbg !1751
  store i64 %31, ptr %9, align 8, !dbg !1751
  br label %11, !dbg !1734, !llvm.loop !1752

32:                                               ; preds = %11
  store ptr null, ptr %4, align 8, !dbg !1754
  br label %33, !dbg !1754

33:                                               ; preds = %32, %25
  %34 = load ptr, ptr %4, align 8, !dbg !1755
  ret ptr %34, !dbg !1755
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__strlen(ptr noundef %0) #0 !dbg !1756 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1762, metadata !DIExpression()), !dbg !1763
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1764, metadata !DIExpression()), !dbg !1765
  store i64 0, ptr %3, align 8, !dbg !1765
  br label %4, !dbg !1766

4:                                                ; preds = %11, %1
  %5 = load ptr, ptr %2, align 8, !dbg !1767
  %6 = load i64, ptr %3, align 8, !dbg !1768
  %7 = getelementptr inbounds i8, ptr %5, i64 %6, !dbg !1767
  %8 = load i8, ptr %7, align 1, !dbg !1767
  %9 = sext i8 %8 to i32, !dbg !1767
  %10 = icmp ne i32 %9, 0, !dbg !1769
  br i1 %10, label %11, label %14, !dbg !1766

11:                                               ; preds = %4
  %12 = load i64, ptr %3, align 8, !dbg !1770
  %13 = add i64 %12, 1, !dbg !1770
  store i64 %13, ptr %3, align 8, !dbg !1770
  br label %4, !dbg !1766, !llvm.loop !1772

14:                                               ; preds = %4
  %15 = load i64, ptr %3, align 8, !dbg !1774
  ret i64 %15, !dbg !1775
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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1776, metadata !DIExpression()), !dbg !1777
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1778, metadata !DIExpression()), !dbg !1779
  %9 = load ptr, ptr %4, align 8, !dbg !1780
  %10 = icmp eq ptr %9, null, !dbg !1782
  br i1 %10, label %11, label %13, !dbg !1783

11:                                               ; preds = %2
  %12 = load ptr, ptr @__fizzer_model__strtok.next, align 8, !dbg !1784
  store ptr %12, ptr %4, align 8, !dbg !1786
  br label %13, !dbg !1787

13:                                               ; preds = %11, %2
  %14 = load ptr, ptr %4, align 8, !dbg !1788
  %15 = icmp eq ptr %14, null, !dbg !1790
  br i1 %15, label %16, label %17, !dbg !1791

16:                                               ; preds = %13
  store ptr null, ptr %3, align 8, !dbg !1792
  br label %107, !dbg !1792

17:                                               ; preds = %13
  br label %18, !dbg !1794

18:                                               ; preds = %49, %17
  %19 = load ptr, ptr %4, align 8, !dbg !1795
  %20 = load i8, ptr %19, align 1, !dbg !1796
  %21 = sext i8 %20 to i32, !dbg !1796
  %22 = icmp ne i32 %21, 0, !dbg !1797
  br i1 %22, label %23, label %52, !dbg !1794

23:                                               ; preds = %18
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1798, metadata !DIExpression()), !dbg !1800
  %24 = load ptr, ptr %5, align 8, !dbg !1801
  store ptr %24, ptr %6, align 8, !dbg !1800
  br label %25, !dbg !1802

25:                                               ; preds = %40, %23
  %26 = load ptr, ptr %6, align 8, !dbg !1803
  %27 = load i8, ptr %26, align 1, !dbg !1804
  %28 = sext i8 %27 to i32, !dbg !1804
  %29 = icmp ne i32 %28, 0, !dbg !1805
  br i1 %29, label %30, label %38, !dbg !1806

30:                                               ; preds = %25
  %31 = load ptr, ptr %6, align 8, !dbg !1807
  %32 = load i8, ptr %31, align 1, !dbg !1808
  %33 = sext i8 %32 to i32, !dbg !1808
  %34 = load ptr, ptr %4, align 8, !dbg !1809
  %35 = load i8, ptr %34, align 1, !dbg !1810
  %36 = sext i8 %35 to i32, !dbg !1810
  %37 = icmp ne i32 %33, %36, !dbg !1811
  br label %38

38:                                               ; preds = %30, %25
  %39 = phi i1 [ false, %25 ], [ %37, %30 ], !dbg !1812
  br i1 %39, label %40, label %43, !dbg !1802

40:                                               ; preds = %38
  %41 = load ptr, ptr %6, align 8, !dbg !1813
  %42 = getelementptr inbounds i8, ptr %41, i32 1, !dbg !1813
  store ptr %42, ptr %6, align 8, !dbg !1813
  br label %25, !dbg !1802, !llvm.loop !1815

43:                                               ; preds = %38
  %44 = load ptr, ptr %6, align 8, !dbg !1817
  %45 = load i8, ptr %44, align 1, !dbg !1819
  %46 = sext i8 %45 to i32, !dbg !1819
  %47 = icmp eq i32 %46, 0, !dbg !1820
  br i1 %47, label %48, label %49, !dbg !1821

48:                                               ; preds = %43
  br label %52, !dbg !1822

49:                                               ; preds = %43
  %50 = load ptr, ptr %4, align 8, !dbg !1824
  %51 = getelementptr inbounds i8, ptr %50, i32 1, !dbg !1824
  store ptr %51, ptr %4, align 8, !dbg !1824
  br label %18, !dbg !1794, !llvm.loop !1825

52:                                               ; preds = %48, %18
  %53 = load ptr, ptr %4, align 8, !dbg !1827
  %54 = load i8, ptr %53, align 1, !dbg !1829
  %55 = sext i8 %54 to i32, !dbg !1829
  %56 = icmp eq i32 %55, 0, !dbg !1830
  br i1 %56, label %57, label %58, !dbg !1831

57:                                               ; preds = %52
  store ptr null, ptr @__fizzer_model__strtok.next, align 8, !dbg !1832
  store ptr null, ptr %3, align 8, !dbg !1834
  br label %107, !dbg !1834

58:                                               ; preds = %52
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1835, metadata !DIExpression()), !dbg !1836
  %59 = load ptr, ptr %4, align 8, !dbg !1837
  store ptr %59, ptr %7, align 8, !dbg !1836
  br label %60, !dbg !1838

60:                                               ; preds = %91, %58
  %61 = load ptr, ptr %4, align 8, !dbg !1839
  %62 = load i8, ptr %61, align 1, !dbg !1840
  %63 = sext i8 %62 to i32, !dbg !1840
  %64 = icmp ne i32 %63, 0, !dbg !1841
  br i1 %64, label %65, label %94, !dbg !1838

65:                                               ; preds = %60
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1842, metadata !DIExpression()), !dbg !1844
  %66 = load ptr, ptr %5, align 8, !dbg !1845
  store ptr %66, ptr %8, align 8, !dbg !1844
  br label %67, !dbg !1846

67:                                               ; preds = %82, %65
  %68 = load ptr, ptr %8, align 8, !dbg !1847
  %69 = load i8, ptr %68, align 1, !dbg !1848
  %70 = sext i8 %69 to i32, !dbg !1848
  %71 = icmp ne i32 %70, 0, !dbg !1849
  br i1 %71, label %72, label %80, !dbg !1850

72:                                               ; preds = %67
  %73 = load ptr, ptr %8, align 8, !dbg !1851
  %74 = load i8, ptr %73, align 1, !dbg !1852
  %75 = sext i8 %74 to i32, !dbg !1852
  %76 = load ptr, ptr %4, align 8, !dbg !1853
  %77 = load i8, ptr %76, align 1, !dbg !1854
  %78 = sext i8 %77 to i32, !dbg !1854
  %79 = icmp ne i32 %75, %78, !dbg !1855
  br label %80

80:                                               ; preds = %72, %67
  %81 = phi i1 [ false, %67 ], [ %79, %72 ], !dbg !1856
  br i1 %81, label %82, label %85, !dbg !1846

82:                                               ; preds = %80
  %83 = load ptr, ptr %8, align 8, !dbg !1857
  %84 = getelementptr inbounds i8, ptr %83, i32 1, !dbg !1857
  store ptr %84, ptr %8, align 8, !dbg !1857
  br label %67, !dbg !1846, !llvm.loop !1859

85:                                               ; preds = %80
  %86 = load ptr, ptr %8, align 8, !dbg !1861
  %87 = load i8, ptr %86, align 1, !dbg !1863
  %88 = sext i8 %87 to i32, !dbg !1863
  %89 = icmp ne i32 %88, 0, !dbg !1864
  br i1 %89, label %90, label %91, !dbg !1865

90:                                               ; preds = %85
  br label %94, !dbg !1866

91:                                               ; preds = %85
  %92 = load ptr, ptr %4, align 8, !dbg !1868
  %93 = getelementptr inbounds i8, ptr %92, i32 1, !dbg !1868
  store ptr %93, ptr %4, align 8, !dbg !1868
  br label %60, !dbg !1838, !llvm.loop !1869

94:                                               ; preds = %90, %60
  %95 = load ptr, ptr %4, align 8, !dbg !1871
  %96 = load i8, ptr %95, align 1, !dbg !1873
  %97 = sext i8 %96 to i32, !dbg !1873
  %98 = icmp ne i32 %97, 0, !dbg !1874
  br i1 %98, label %99, label %104, !dbg !1875

99:                                               ; preds = %94
  %100 = load ptr, ptr %4, align 8, !dbg !1876
  store i8 0, ptr %100, align 1, !dbg !1878
  %101 = load ptr, ptr %4, align 8, !dbg !1879
  %102 = getelementptr inbounds i8, ptr %101, i32 1, !dbg !1879
  store ptr %102, ptr %4, align 8, !dbg !1879
  %103 = load ptr, ptr %4, align 8, !dbg !1880
  store ptr %103, ptr @__fizzer_model__strtok.next, align 8, !dbg !1881
  br label %105, !dbg !1882

104:                                              ; preds = %94
  store ptr null, ptr @__fizzer_model__strtok.next, align 8, !dbg !1883
  br label %105

105:                                              ; preds = %104, %99
  %106 = load ptr, ptr %7, align 8, !dbg !1885
  store ptr %106, ptr %3, align 8, !dbg !1886
  br label %107, !dbg !1886

107:                                              ; preds = %105, %57, %16
  %108 = load ptr, ptr %3, align 8, !dbg !1887
  ret ptr %108, !dbg !1887
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__strxfrm(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 !dbg !1888 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1894, metadata !DIExpression()), !dbg !1895
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1896, metadata !DIExpression()), !dbg !1897
  store i64 %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1898, metadata !DIExpression()), !dbg !1899
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1900, metadata !DIExpression()), !dbg !1901
  store i64 0, ptr %7, align 8, !dbg !1901
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1902, metadata !DIExpression()), !dbg !1903
  %10 = load ptr, ptr %5, align 8, !dbg !1904
  store ptr %10, ptr %8, align 8, !dbg !1903
  br label %11, !dbg !1905

11:                                               ; preds = %16, %3
  %12 = load ptr, ptr %8, align 8, !dbg !1906
  %13 = load i8, ptr %12, align 1, !dbg !1907
  %14 = sext i8 %13 to i32, !dbg !1907
  %15 = icmp ne i32 %14, 0, !dbg !1908
  br i1 %15, label %16, label %21, !dbg !1905

16:                                               ; preds = %11
  %17 = load i64, ptr %7, align 8, !dbg !1909
  %18 = add i64 %17, 1, !dbg !1909
  store i64 %18, ptr %7, align 8, !dbg !1909
  %19 = load ptr, ptr %8, align 8, !dbg !1911
  %20 = getelementptr inbounds i8, ptr %19, i32 1, !dbg !1911
  store ptr %20, ptr %8, align 8, !dbg !1911
  br label %11, !dbg !1905, !llvm.loop !1912

21:                                               ; preds = %11
  %22 = load i64, ptr %6, align 8, !dbg !1914
  %23 = icmp ugt i64 %22, 0, !dbg !1916
  br i1 %23, label %24, label %53, !dbg !1917

24:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1918, metadata !DIExpression()), !dbg !1920
  store i64 0, ptr %9, align 8, !dbg !1920
  br label %25, !dbg !1921

25:                                               ; preds = %39, %24
  %26 = load i64, ptr %9, align 8, !dbg !1922
  %27 = load i64, ptr %6, align 8, !dbg !1923
  %28 = sub i64 %27, 1, !dbg !1924
  %29 = icmp ult i64 %26, %28, !dbg !1925
  br i1 %29, label %30, label %37, !dbg !1926

30:                                               ; preds = %25
  %31 = load ptr, ptr %5, align 8, !dbg !1927
  %32 = load i64, ptr %9, align 8, !dbg !1928
  %33 = getelementptr inbounds i8, ptr %31, i64 %32, !dbg !1927
  %34 = load i8, ptr %33, align 1, !dbg !1927
  %35 = sext i8 %34 to i32, !dbg !1927
  %36 = icmp ne i32 %35, 0, !dbg !1929
  br label %37

37:                                               ; preds = %30, %25
  %38 = phi i1 [ false, %25 ], [ %36, %30 ], !dbg !1930
  br i1 %38, label %39, label %49, !dbg !1921

39:                                               ; preds = %37
  %40 = load ptr, ptr %5, align 8, !dbg !1931
  %41 = load i64, ptr %9, align 8, !dbg !1933
  %42 = getelementptr inbounds i8, ptr %40, i64 %41, !dbg !1931
  %43 = load i8, ptr %42, align 1, !dbg !1931
  %44 = load ptr, ptr %4, align 8, !dbg !1934
  %45 = load i64, ptr %9, align 8, !dbg !1935
  %46 = getelementptr inbounds i8, ptr %44, i64 %45, !dbg !1934
  store i8 %43, ptr %46, align 1, !dbg !1936
  %47 = load i64, ptr %9, align 8, !dbg !1937
  %48 = add i64 %47, 1, !dbg !1937
  store i64 %48, ptr %9, align 8, !dbg !1937
  br label %25, !dbg !1921, !llvm.loop !1938

49:                                               ; preds = %37
  %50 = load ptr, ptr %4, align 8, !dbg !1940
  %51 = load i64, ptr %9, align 8, !dbg !1941
  %52 = getelementptr inbounds i8, ptr %50, i64 %51, !dbg !1940
  store i8 0, ptr %52, align 1, !dbg !1942
  br label %53, !dbg !1943

53:                                               ; preds = %49, %21
  %54 = load i64, ptr %7, align 8, !dbg !1944
  ret i64 %54, !dbg !1945
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__iscntrl(i32 noundef %0) #0 !dbg !1946 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1948, metadata !DIExpression()), !dbg !1949
  %4 = load i32, ptr %3, align 4, !dbg !1950
  %5 = icmp sge i32 %4, 0, !dbg !1952
  br i1 %5, label %6, label %9, !dbg !1953

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !1954
  %8 = icmp sle i32 %7, 31, !dbg !1955
  br i1 %8, label %12, label %9, !dbg !1956

9:                                                ; preds = %6, %1
  %10 = load i32, ptr %3, align 4, !dbg !1957
  %11 = icmp eq i32 %10, 127, !dbg !1958
  br i1 %11, label %12, label %13, !dbg !1959

12:                                               ; preds = %9, %6
  store i32 1, ptr %2, align 4, !dbg !1960
  br label %14, !dbg !1960

13:                                               ; preds = %9
  store i32 0, ptr %2, align 4, !dbg !1962
  br label %14, !dbg !1962

14:                                               ; preds = %13, %12
  %15 = load i32, ptr %2, align 4, !dbg !1963
  ret i32 %15, !dbg !1963
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isxdigit(i32 noundef %0) #0 !dbg !1964 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1966, metadata !DIExpression()), !dbg !1967
  %4 = load i32, ptr %3, align 4, !dbg !1968
  %5 = call i32 @__fizzer_model__isdigit(i32 noundef %4), !dbg !1970
  %6 = icmp ne i32 %5, 0, !dbg !1970
  br i1 %6, label %19, label %7, !dbg !1971

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4, !dbg !1972
  %9 = icmp sge i32 %8, 65, !dbg !1973
  br i1 %9, label %10, label %13, !dbg !1974

10:                                               ; preds = %7
  %11 = load i32, ptr %3, align 4, !dbg !1975
  %12 = icmp sle i32 %11, 70, !dbg !1976
  br i1 %12, label %19, label %13, !dbg !1977

13:                                               ; preds = %10, %7
  %14 = load i32, ptr %3, align 4, !dbg !1978
  %15 = icmp sge i32 %14, 97, !dbg !1979
  br i1 %15, label %16, label %20, !dbg !1980

16:                                               ; preds = %13
  %17 = load i32, ptr %3, align 4, !dbg !1981
  %18 = icmp sle i32 %17, 102, !dbg !1982
  br i1 %18, label %19, label %20, !dbg !1983

19:                                               ; preds = %16, %10, %1
  store i32 1, ptr %2, align 4, !dbg !1984
  br label %21, !dbg !1984

20:                                               ; preds = %16, %13
  store i32 0, ptr %2, align 4, !dbg !1986
  br label %21, !dbg !1986

21:                                               ; preds = %20, %19
  %22 = load i32, ptr %2, align 4, !dbg !1987
  ret i32 %22, !dbg !1987
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isalnum(i32 noundef %0) #0 !dbg !1988 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1990, metadata !DIExpression()), !dbg !1991
  %4 = load i32, ptr %3, align 4, !dbg !1992
  %5 = call i32 @__fizzer_model__isalpha(i32 noundef %4), !dbg !1994
  %6 = icmp ne i32 %5, 0, !dbg !1994
  br i1 %6, label %11, label %7, !dbg !1995

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4, !dbg !1996
  %9 = call i32 @__fizzer_model__isdigit(i32 noundef %8), !dbg !1997
  %10 = icmp ne i32 %9, 0, !dbg !1997
  br i1 %10, label %11, label %12, !dbg !1998

11:                                               ; preds = %7, %1
  store i32 1, ptr %2, align 4, !dbg !1999
  br label %13, !dbg !1999

12:                                               ; preds = %7
  store i32 0, ptr %2, align 4, !dbg !2001
  br label %13, !dbg !2001

13:                                               ; preds = %12, %11
  %14 = load i32, ptr %2, align 4, !dbg !2002
  ret i32 %14, !dbg !2002
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isspace(i32 noundef %0) #0 !dbg !2003 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2005, metadata !DIExpression()), !dbg !2006
  %4 = load i32, ptr %3, align 4, !dbg !2007
  %5 = icmp eq i32 %4, 32, !dbg !2009
  br i1 %5, label %21, label %6, !dbg !2010

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2011
  %8 = icmp eq i32 %7, 12, !dbg !2012
  br i1 %8, label %21, label %9, !dbg !2013

9:                                                ; preds = %6
  %10 = load i32, ptr %3, align 4, !dbg !2014
  %11 = icmp eq i32 %10, 10, !dbg !2015
  br i1 %11, label %21, label %12, !dbg !2016

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4, !dbg !2017
  %14 = icmp eq i32 %13, 13, !dbg !2018
  br i1 %14, label %21, label %15, !dbg !2019

15:                                               ; preds = %12
  %16 = load i32, ptr %3, align 4, !dbg !2020
  %17 = icmp eq i32 %16, 9, !dbg !2021
  br i1 %17, label %21, label %18, !dbg !2022

18:                                               ; preds = %15
  %19 = load i32, ptr %3, align 4, !dbg !2023
  %20 = icmp eq i32 %19, 11, !dbg !2024
  br i1 %20, label %21, label %22, !dbg !2025

21:                                               ; preds = %18, %15, %12, %9, %6, %1
  store i32 1, ptr %2, align 4, !dbg !2026
  br label %23, !dbg !2026

22:                                               ; preds = %18
  store i32 0, ptr %2, align 4, !dbg !2028
  br label %23, !dbg !2028

23:                                               ; preds = %22, %21
  %24 = load i32, ptr %2, align 4, !dbg !2029
  ret i32 %24, !dbg !2029
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isalpha(i32 noundef %0) #0 !dbg !2030 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2032, metadata !DIExpression()), !dbg !2033
  %4 = load i32, ptr %3, align 4, !dbg !2034
  %5 = icmp sge i32 %4, 65, !dbg !2036
  br i1 %5, label %6, label %9, !dbg !2037

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2038
  %8 = icmp sle i32 %7, 90, !dbg !2039
  br i1 %8, label %15, label %9, !dbg !2040

9:                                                ; preds = %6, %1
  %10 = load i32, ptr %3, align 4, !dbg !2041
  %11 = icmp sge i32 %10, 97, !dbg !2042
  br i1 %11, label %12, label %16, !dbg !2043

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4, !dbg !2044
  %14 = icmp sle i32 %13, 122, !dbg !2045
  br i1 %14, label %15, label %16, !dbg !2046

15:                                               ; preds = %12, %6
  store i32 1, ptr %2, align 4, !dbg !2047
  br label %17, !dbg !2047

16:                                               ; preds = %12, %9
  store i32 0, ptr %2, align 4, !dbg !2049
  br label %17, !dbg !2049

17:                                               ; preds = %16, %15
  %18 = load i32, ptr %2, align 4, !dbg !2050
  ret i32 %18, !dbg !2050
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isblank(i32 noundef %0) #0 !dbg !2051 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2053, metadata !DIExpression()), !dbg !2054
  %4 = load i32, ptr %3, align 4, !dbg !2055
  %5 = icmp eq i32 %4, 32, !dbg !2057
  br i1 %5, label %9, label %6, !dbg !2058

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2059
  %8 = icmp eq i32 %7, 9, !dbg !2060
  br i1 %8, label %9, label %10, !dbg !2061

9:                                                ; preds = %6, %1
  store i32 1, ptr %2, align 4, !dbg !2062
  br label %11, !dbg !2062

10:                                               ; preds = %6
  store i32 0, ptr %2, align 4, !dbg !2064
  br label %11, !dbg !2064

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2065
  ret i32 %12, !dbg !2065
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__islower(i32 noundef %0) #0 !dbg !2066 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2068, metadata !DIExpression()), !dbg !2069
  %4 = load i32, ptr %3, align 4, !dbg !2070
  %5 = icmp sge i32 %4, 97, !dbg !2072
  br i1 %5, label %6, label %10, !dbg !2073

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2074
  %8 = icmp sle i32 %7, 122, !dbg !2075
  br i1 %8, label %9, label %10, !dbg !2076

9:                                                ; preds = %6
  store i32 1, ptr %2, align 4, !dbg !2077
  br label %11, !dbg !2077

10:                                               ; preds = %6, %1
  store i32 0, ptr %2, align 4, !dbg !2079
  br label %11, !dbg !2079

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2080
  ret i32 %12, !dbg !2080
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isdigit(i32 noundef %0) #0 !dbg !2081 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2083, metadata !DIExpression()), !dbg !2084
  %4 = load i32, ptr %3, align 4, !dbg !2085
  %5 = icmp sge i32 %4, 48, !dbg !2087
  br i1 %5, label %6, label %10, !dbg !2088

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2089
  %8 = icmp sle i32 %7, 57, !dbg !2090
  br i1 %8, label %9, label %10, !dbg !2091

9:                                                ; preds = %6
  store i32 1, ptr %2, align 4, !dbg !2092
  br label %11, !dbg !2092

10:                                               ; preds = %6, %1
  store i32 0, ptr %2, align 4, !dbg !2094
  br label %11, !dbg !2094

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2095
  ret i32 %12, !dbg !2095
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__toupper(i32 noundef %0) #0 !dbg !2096 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2098, metadata !DIExpression()), !dbg !2099
  %4 = load i32, ptr %3, align 4, !dbg !2100
  %5 = call i32 @__fizzer_model__islower(i32 noundef %4), !dbg !2102
  %6 = icmp ne i32 %5, 0, !dbg !2102
  br i1 %6, label %7, label %11, !dbg !2103

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4, !dbg !2104
  %9 = sub nsw i32 %8, 97, !dbg !2106
  %10 = add nsw i32 %9, 65, !dbg !2107
  store i32 %10, ptr %2, align 4, !dbg !2108
  br label %13, !dbg !2108

11:                                               ; preds = %1
  %12 = load i32, ptr %3, align 4, !dbg !2109
  store i32 %12, ptr %2, align 4, !dbg !2110
  br label %13, !dbg !2110

13:                                               ; preds = %11, %7
  %14 = load i32, ptr %2, align 4, !dbg !2111
  ret i32 %14, !dbg !2111
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isprint(i32 noundef %0) #0 !dbg !2112 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2114, metadata !DIExpression()), !dbg !2115
  %4 = load i32, ptr %3, align 4, !dbg !2116
  %5 = icmp sge i32 %4, 32, !dbg !2118
  br i1 %5, label %6, label %10, !dbg !2119

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2120
  %8 = icmp sle i32 %7, 126, !dbg !2121
  br i1 %8, label %9, label %10, !dbg !2122

9:                                                ; preds = %6
  store i32 1, ptr %2, align 4, !dbg !2123
  br label %11, !dbg !2123

10:                                               ; preds = %6, %1
  store i32 0, ptr %2, align 4, !dbg !2125
  br label %11, !dbg !2125

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2126
  ret i32 %12, !dbg !2126
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isupper(i32 noundef %0) #0 !dbg !2127 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2129, metadata !DIExpression()), !dbg !2130
  %4 = load i32, ptr %3, align 4, !dbg !2131
  %5 = icmp sge i32 %4, 65, !dbg !2133
  br i1 %5, label %6, label %10, !dbg !2134

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2135
  %8 = icmp sle i32 %7, 90, !dbg !2136
  br i1 %8, label %9, label %10, !dbg !2137

9:                                                ; preds = %6
  store i32 1, ptr %2, align 4, !dbg !2138
  br label %11, !dbg !2138

10:                                               ; preds = %6, %1
  store i32 0, ptr %2, align 4, !dbg !2140
  br label %11, !dbg !2140

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2141
  ret i32 %12, !dbg !2141
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__tolower(i32 noundef %0) #0 !dbg !2142 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2144, metadata !DIExpression()), !dbg !2145
  %4 = load i32, ptr %3, align 4, !dbg !2146
  %5 = call i32 @__fizzer_model__isupper(i32 noundef %4), !dbg !2148
  %6 = icmp ne i32 %5, 0, !dbg !2148
  br i1 %6, label %7, label %11, !dbg !2149

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4, !dbg !2150
  %9 = sub nsw i32 %8, 65, !dbg !2152
  %10 = add nsw i32 %9, 97, !dbg !2153
  store i32 %10, ptr %2, align 4, !dbg !2154
  br label %13, !dbg !2154

11:                                               ; preds = %1
  %12 = load i32, ptr %3, align 4, !dbg !2155
  store i32 %12, ptr %2, align 4, !dbg !2156
  br label %13, !dbg !2156

13:                                               ; preds = %11, %7
  %14 = load i32, ptr %2, align 4, !dbg !2157
  ret i32 %14, !dbg !2157
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__isgraph(i32 noundef %0) #0 !dbg !2158 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2160, metadata !DIExpression()), !dbg !2161
  %4 = load i32, ptr %3, align 4, !dbg !2162
  %5 = icmp sge i32 %4, 33, !dbg !2164
  br i1 %5, label %6, label %10, !dbg !2165

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4, !dbg !2166
  %8 = icmp sle i32 %7, 126, !dbg !2167
  br i1 %8, label %9, label %10, !dbg !2168

9:                                                ; preds = %6
  store i32 1, ptr %2, align 4, !dbg !2169
  br label %11, !dbg !2169

10:                                               ; preds = %6, %1
  store i32 0, ptr %2, align 4, !dbg !2171
  br label %11, !dbg !2171

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %2, align 4, !dbg !2172
  ret i32 %12, !dbg !2172
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__snprintf(ptr noundef %0, i64 noundef %1, ptr noundef %2, ...) #0 !dbg !2173 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca [1 x %struct.__va_list_tag], align 16
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2179, metadata !DIExpression()), !dbg !2180
  store i64 %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2181, metadata !DIExpression()), !dbg !2182
  store ptr %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2183, metadata !DIExpression()), !dbg !2184
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2185, metadata !DIExpression()), !dbg !2198
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %7, i64 0, i64 0, !dbg !2199
  call void @llvm.va_start(ptr %9), !dbg !2199
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2200, metadata !DIExpression()), !dbg !2201
  %10 = load ptr, ptr %4, align 8, !dbg !2202
  %11 = load i64, ptr %5, align 8, !dbg !2203
  %12 = load ptr, ptr %6, align 8, !dbg !2204
  %13 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %7, i64 0, i64 0, !dbg !2205
  %14 = call i32 @__fizzer_model__vsnprintf(ptr noundef %10, i64 noundef %11, ptr noundef %12, ptr noundef %13), !dbg !2206
  store i32 %14, ptr %8, align 4, !dbg !2201
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %7, i64 0, i64 0, !dbg !2207
  call void @llvm.va_end(ptr %15), !dbg !2207
  %16 = load i32, ptr %8, align 4, !dbg !2208
  ret i32 %16, !dbg !2209
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start(ptr) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end(ptr) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__sprintf(ptr noundef %0, ptr noundef %1, ...) #0 !dbg !2210 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca [1 x %struct.__va_list_tag], align 16
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2214, metadata !DIExpression()), !dbg !2215
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2216, metadata !DIExpression()), !dbg !2217
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2218, metadata !DIExpression()), !dbg !2229
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %5, i64 0, i64 0, !dbg !2230
  call void @llvm.va_start(ptr %7), !dbg !2230
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2231, metadata !DIExpression()), !dbg !2232
  %8 = load ptr, ptr %3, align 8, !dbg !2233
  %9 = load ptr, ptr %4, align 8, !dbg !2234
  %10 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %5, i64 0, i64 0, !dbg !2235
  %11 = call i32 @__fizzer_model__vsprintf(ptr noundef %8, ptr noundef %9, ptr noundef %10), !dbg !2236
  store i32 %11, ptr %6, align 4, !dbg !2232
  %12 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %5, i64 0, i64 0, !dbg !2237
  call void @llvm.va_end(ptr %12), !dbg !2237
  %13 = load i32, ptr %6, align 4, !dbg !2238
  ret i32 %13, !dbg !2239
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__vsprintf(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !2240 {
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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2251, metadata !DIExpression()), !dbg !2252
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2253, metadata !DIExpression()), !dbg !2254
  store ptr %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2255, metadata !DIExpression()), !dbg !2256
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2257, metadata !DIExpression()), !dbg !2260
  store i64 0, ptr %7, align 8, !dbg !2260
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2261, metadata !DIExpression()), !dbg !2262
  store i64 0, ptr %8, align 8, !dbg !2262
  br label %21, !dbg !2263

21:                                               ; preds = %281, %3
  %22 = load ptr, ptr %5, align 8, !dbg !2264
  %23 = load i64, ptr %7, align 8, !dbg !2265
  %24 = getelementptr inbounds i8, ptr %22, i64 %23, !dbg !2264
  %25 = load i8, ptr %24, align 1, !dbg !2264
  %26 = sext i8 %25 to i32, !dbg !2264
  %27 = icmp ne i32 %26, 0, !dbg !2266
  br i1 %27, label %28, label %282, !dbg !2263

28:                                               ; preds = %21
  %29 = load ptr, ptr %5, align 8, !dbg !2267
  %30 = load i64, ptr %7, align 8, !dbg !2270
  %31 = getelementptr inbounds i8, ptr %29, i64 %30, !dbg !2267
  %32 = load i8, ptr %31, align 1, !dbg !2267
  %33 = sext i8 %32 to i32, !dbg !2267
  %34 = icmp eq i32 %33, 37, !dbg !2271
  br i1 %34, label %35, label %269, !dbg !2272

35:                                               ; preds = %28
  %36 = load i64, ptr %7, align 8, !dbg !2273
  %37 = add i64 %36, 1, !dbg !2273
  store i64 %37, ptr %7, align 8, !dbg !2273
  %38 = load ptr, ptr %5, align 8, !dbg !2275
  %39 = load i64, ptr %7, align 8, !dbg !2277
  %40 = getelementptr inbounds i8, ptr %38, i64 %39, !dbg !2275
  %41 = load i8, ptr %40, align 1, !dbg !2275
  %42 = sext i8 %41 to i32, !dbg !2275
  %43 = icmp eq i32 %42, 0, !dbg !2278
  br i1 %43, label %44, label %45, !dbg !2279

44:                                               ; preds = %35
  br label %282, !dbg !2280

45:                                               ; preds = %35
  %46 = load ptr, ptr %5, align 8, !dbg !2282
  %47 = load i64, ptr %7, align 8, !dbg !2284
  %48 = getelementptr inbounds i8, ptr %46, i64 %47, !dbg !2282
  %49 = load i8, ptr %48, align 1, !dbg !2282
  %50 = sext i8 %49 to i32, !dbg !2282
  %51 = icmp eq i32 %50, 100, !dbg !2285
  br i1 %51, label %52, label %89, !dbg !2286

52:                                               ; preds = %45
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2287, metadata !DIExpression()), !dbg !2289
  %53 = load ptr, ptr %6, align 8, !dbg !2290
  %54 = getelementptr inbounds %struct.__va_list_tag, ptr %53, i32 0, i32 0, !dbg !2290
  %55 = load i32, ptr %54, align 8, !dbg !2290
  %56 = icmp ule i32 %55, 40, !dbg !2290
  br i1 %56, label %57, label %62, !dbg !2290

57:                                               ; preds = %52
  %58 = getelementptr inbounds %struct.__va_list_tag, ptr %53, i32 0, i32 3, !dbg !2290
  %59 = load ptr, ptr %58, align 8, !dbg !2290
  %60 = getelementptr i8, ptr %59, i32 %55, !dbg !2290
  %61 = add i32 %55, 8, !dbg !2290
  store i32 %61, ptr %54, align 8, !dbg !2290
  br label %66, !dbg !2290

62:                                               ; preds = %52
  %63 = getelementptr inbounds %struct.__va_list_tag, ptr %53, i32 0, i32 2, !dbg !2290
  %64 = load ptr, ptr %63, align 8, !dbg !2290
  %65 = getelementptr i8, ptr %64, i32 8, !dbg !2290
  store ptr %65, ptr %63, align 8, !dbg !2290
  br label %66, !dbg !2290

66:                                               ; preds = %62, %57
  %67 = phi ptr [ %60, %57 ], [ %64, %62 ], !dbg !2290
  %68 = load i32, ptr %67, align 4, !dbg !2290
  store i32 %68, ptr %9, align 4, !dbg !2289
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2291, metadata !DIExpression()), !dbg !2295
  %69 = load i32, ptr %9, align 4, !dbg !2296
  %70 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0, !dbg !2297
  call void @__fizzer_model__helper_itoa(i32 noundef %69, ptr noundef %70, i32 noundef 10), !dbg !2298
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2299, metadata !DIExpression()), !dbg !2300
  store i64 0, ptr %11, align 8, !dbg !2300
  br label %71, !dbg !2301

71:                                               ; preds = %77, %66
  %72 = load i64, ptr %11, align 8, !dbg !2302
  %73 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 %72, !dbg !2303
  %74 = load i8, ptr %73, align 1, !dbg !2303
  %75 = sext i8 %74 to i32, !dbg !2303
  %76 = icmp ne i32 %75, 0, !dbg !2304
  br i1 %76, label %77, label %88, !dbg !2301

77:                                               ; preds = %71
  %78 = load i64, ptr %11, align 8, !dbg !2305
  %79 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 %78, !dbg !2307
  %80 = load i8, ptr %79, align 1, !dbg !2307
  %81 = load ptr, ptr %4, align 8, !dbg !2308
  %82 = load i64, ptr %8, align 8, !dbg !2309
  %83 = getelementptr inbounds i8, ptr %81, i64 %82, !dbg !2308
  store i8 %80, ptr %83, align 1, !dbg !2310
  %84 = load i64, ptr %8, align 8, !dbg !2311
  %85 = add i64 %84, 1, !dbg !2311
  store i64 %85, ptr %8, align 8, !dbg !2311
  %86 = load i64, ptr %11, align 8, !dbg !2312
  %87 = add i64 %86, 1, !dbg !2312
  store i64 %87, ptr %11, align 8, !dbg !2312
  br label %71, !dbg !2301, !llvm.loop !2313

88:                                               ; preds = %71
  br label %266, !dbg !2315

89:                                               ; preds = %45
  %90 = load ptr, ptr %5, align 8, !dbg !2316
  %91 = load i64, ptr %7, align 8, !dbg !2318
  %92 = getelementptr inbounds i8, ptr %90, i64 %91, !dbg !2316
  %93 = load i8, ptr %92, align 1, !dbg !2316
  %94 = sext i8 %93 to i32, !dbg !2316
  %95 = icmp eq i32 %94, 117, !dbg !2319
  br i1 %95, label %96, label %133, !dbg !2320

96:                                               ; preds = %89
  call void @llvm.dbg.declare(metadata ptr %12, metadata !2321, metadata !DIExpression()), !dbg !2323
  %97 = load ptr, ptr %6, align 8, !dbg !2324
  %98 = getelementptr inbounds %struct.__va_list_tag, ptr %97, i32 0, i32 0, !dbg !2324
  %99 = load i32, ptr %98, align 8, !dbg !2324
  %100 = icmp ule i32 %99, 40, !dbg !2324
  br i1 %100, label %101, label %106, !dbg !2324

101:                                              ; preds = %96
  %102 = getelementptr inbounds %struct.__va_list_tag, ptr %97, i32 0, i32 3, !dbg !2324
  %103 = load ptr, ptr %102, align 8, !dbg !2324
  %104 = getelementptr i8, ptr %103, i32 %99, !dbg !2324
  %105 = add i32 %99, 8, !dbg !2324
  store i32 %105, ptr %98, align 8, !dbg !2324
  br label %110, !dbg !2324

106:                                              ; preds = %96
  %107 = getelementptr inbounds %struct.__va_list_tag, ptr %97, i32 0, i32 2, !dbg !2324
  %108 = load ptr, ptr %107, align 8, !dbg !2324
  %109 = getelementptr i8, ptr %108, i32 8, !dbg !2324
  store ptr %109, ptr %107, align 8, !dbg !2324
  br label %110, !dbg !2324

110:                                              ; preds = %106, %101
  %111 = phi ptr [ %104, %101 ], [ %108, %106 ], !dbg !2324
  %112 = load i32, ptr %111, align 4, !dbg !2324
  store i32 %112, ptr %12, align 4, !dbg !2323
  call void @llvm.dbg.declare(metadata ptr %13, metadata !2325, metadata !DIExpression()), !dbg !2326
  %113 = load i32, ptr %12, align 4, !dbg !2327
  %114 = getelementptr inbounds [32 x i8], ptr %13, i64 0, i64 0, !dbg !2328
  call void @__fizzer_model__helper_itoa(i32 noundef %113, ptr noundef %114, i32 noundef 10), !dbg !2329
  call void @llvm.dbg.declare(metadata ptr %14, metadata !2330, metadata !DIExpression()), !dbg !2331
  store i64 0, ptr %14, align 8, !dbg !2331
  br label %115, !dbg !2332

115:                                              ; preds = %121, %110
  %116 = load i64, ptr %14, align 8, !dbg !2333
  %117 = getelementptr inbounds [32 x i8], ptr %13, i64 0, i64 %116, !dbg !2334
  %118 = load i8, ptr %117, align 1, !dbg !2334
  %119 = sext i8 %118 to i32, !dbg !2334
  %120 = icmp ne i32 %119, 0, !dbg !2335
  br i1 %120, label %121, label %132, !dbg !2332

121:                                              ; preds = %115
  %122 = load i64, ptr %14, align 8, !dbg !2336
  %123 = getelementptr inbounds [32 x i8], ptr %13, i64 0, i64 %122, !dbg !2338
  %124 = load i8, ptr %123, align 1, !dbg !2338
  %125 = load ptr, ptr %4, align 8, !dbg !2339
  %126 = load i64, ptr %8, align 8, !dbg !2340
  %127 = getelementptr inbounds i8, ptr %125, i64 %126, !dbg !2339
  store i8 %124, ptr %127, align 1, !dbg !2341
  %128 = load i64, ptr %8, align 8, !dbg !2342
  %129 = add i64 %128, 1, !dbg !2342
  store i64 %129, ptr %8, align 8, !dbg !2342
  %130 = load i64, ptr %14, align 8, !dbg !2343
  %131 = add i64 %130, 1, !dbg !2343
  store i64 %131, ptr %14, align 8, !dbg !2343
  br label %115, !dbg !2332, !llvm.loop !2344

132:                                              ; preds = %115
  br label %265, !dbg !2346

133:                                              ; preds = %89
  %134 = load ptr, ptr %5, align 8, !dbg !2347
  %135 = load i64, ptr %7, align 8, !dbg !2349
  %136 = getelementptr inbounds i8, ptr %134, i64 %135, !dbg !2347
  %137 = load i8, ptr %136, align 1, !dbg !2347
  %138 = sext i8 %137 to i32, !dbg !2347
  %139 = icmp eq i32 %138, 120, !dbg !2350
  br i1 %139, label %140, label %177, !dbg !2351

140:                                              ; preds = %133
  call void @llvm.dbg.declare(metadata ptr %15, metadata !2352, metadata !DIExpression()), !dbg !2354
  %141 = load ptr, ptr %6, align 8, !dbg !2355
  %142 = getelementptr inbounds %struct.__va_list_tag, ptr %141, i32 0, i32 0, !dbg !2355
  %143 = load i32, ptr %142, align 8, !dbg !2355
  %144 = icmp ule i32 %143, 40, !dbg !2355
  br i1 %144, label %145, label %150, !dbg !2355

145:                                              ; preds = %140
  %146 = getelementptr inbounds %struct.__va_list_tag, ptr %141, i32 0, i32 3, !dbg !2355
  %147 = load ptr, ptr %146, align 8, !dbg !2355
  %148 = getelementptr i8, ptr %147, i32 %143, !dbg !2355
  %149 = add i32 %143, 8, !dbg !2355
  store i32 %149, ptr %142, align 8, !dbg !2355
  br label %154, !dbg !2355

150:                                              ; preds = %140
  %151 = getelementptr inbounds %struct.__va_list_tag, ptr %141, i32 0, i32 2, !dbg !2355
  %152 = load ptr, ptr %151, align 8, !dbg !2355
  %153 = getelementptr i8, ptr %152, i32 8, !dbg !2355
  store ptr %153, ptr %151, align 8, !dbg !2355
  br label %154, !dbg !2355

154:                                              ; preds = %150, %145
  %155 = phi ptr [ %148, %145 ], [ %152, %150 ], !dbg !2355
  %156 = load i32, ptr %155, align 4, !dbg !2355
  store i32 %156, ptr %15, align 4, !dbg !2354
  call void @llvm.dbg.declare(metadata ptr %16, metadata !2356, metadata !DIExpression()), !dbg !2357
  %157 = load i32, ptr %15, align 4, !dbg !2358
  %158 = getelementptr inbounds [32 x i8], ptr %16, i64 0, i64 0, !dbg !2359
  call void @__fizzer_model__helper_itoa(i32 noundef %157, ptr noundef %158, i32 noundef 16), !dbg !2360
  call void @llvm.dbg.declare(metadata ptr %17, metadata !2361, metadata !DIExpression()), !dbg !2362
  store i64 0, ptr %17, align 8, !dbg !2362
  br label %159, !dbg !2363

159:                                              ; preds = %165, %154
  %160 = load i64, ptr %17, align 8, !dbg !2364
  %161 = getelementptr inbounds [32 x i8], ptr %16, i64 0, i64 %160, !dbg !2365
  %162 = load i8, ptr %161, align 1, !dbg !2365
  %163 = sext i8 %162 to i32, !dbg !2365
  %164 = icmp ne i32 %163, 0, !dbg !2366
  br i1 %164, label %165, label %176, !dbg !2363

165:                                              ; preds = %159
  %166 = load i64, ptr %17, align 8, !dbg !2367
  %167 = getelementptr inbounds [32 x i8], ptr %16, i64 0, i64 %166, !dbg !2369
  %168 = load i8, ptr %167, align 1, !dbg !2369
  %169 = load ptr, ptr %4, align 8, !dbg !2370
  %170 = load i64, ptr %8, align 8, !dbg !2371
  %171 = getelementptr inbounds i8, ptr %169, i64 %170, !dbg !2370
  store i8 %168, ptr %171, align 1, !dbg !2372
  %172 = load i64, ptr %8, align 8, !dbg !2373
  %173 = add i64 %172, 1, !dbg !2373
  store i64 %173, ptr %8, align 8, !dbg !2373
  %174 = load i64, ptr %17, align 8, !dbg !2374
  %175 = add i64 %174, 1, !dbg !2374
  store i64 %175, ptr %17, align 8, !dbg !2374
  br label %159, !dbg !2363, !llvm.loop !2375

176:                                              ; preds = %159
  br label %264, !dbg !2377

177:                                              ; preds = %133
  %178 = load ptr, ptr %5, align 8, !dbg !2378
  %179 = load i64, ptr %7, align 8, !dbg !2380
  %180 = getelementptr inbounds i8, ptr %178, i64 %179, !dbg !2378
  %181 = load i8, ptr %180, align 1, !dbg !2378
  %182 = sext i8 %181 to i32, !dbg !2378
  %183 = icmp eq i32 %182, 99, !dbg !2381
  br i1 %183, label %184, label %208, !dbg !2382

184:                                              ; preds = %177
  call void @llvm.dbg.declare(metadata ptr %18, metadata !2383, metadata !DIExpression()), !dbg !2385
  %185 = load ptr, ptr %6, align 8, !dbg !2386
  %186 = getelementptr inbounds %struct.__va_list_tag, ptr %185, i32 0, i32 0, !dbg !2386
  %187 = load i32, ptr %186, align 8, !dbg !2386
  %188 = icmp ule i32 %187, 40, !dbg !2386
  br i1 %188, label %189, label %194, !dbg !2386

189:                                              ; preds = %184
  %190 = getelementptr inbounds %struct.__va_list_tag, ptr %185, i32 0, i32 3, !dbg !2386
  %191 = load ptr, ptr %190, align 8, !dbg !2386
  %192 = getelementptr i8, ptr %191, i32 %187, !dbg !2386
  %193 = add i32 %187, 8, !dbg !2386
  store i32 %193, ptr %186, align 8, !dbg !2386
  br label %198, !dbg !2386

194:                                              ; preds = %184
  %195 = getelementptr inbounds %struct.__va_list_tag, ptr %185, i32 0, i32 2, !dbg !2386
  %196 = load ptr, ptr %195, align 8, !dbg !2386
  %197 = getelementptr i8, ptr %196, i32 8, !dbg !2386
  store ptr %197, ptr %195, align 8, !dbg !2386
  br label %198, !dbg !2386

198:                                              ; preds = %194, %189
  %199 = phi ptr [ %192, %189 ], [ %196, %194 ], !dbg !2386
  %200 = load i32, ptr %199, align 4, !dbg !2386
  %201 = trunc i32 %200 to i8, !dbg !2387
  store i8 %201, ptr %18, align 1, !dbg !2385
  %202 = load i8, ptr %18, align 1, !dbg !2388
  %203 = load ptr, ptr %4, align 8, !dbg !2389
  %204 = load i64, ptr %8, align 8, !dbg !2390
  %205 = getelementptr inbounds i8, ptr %203, i64 %204, !dbg !2389
  store i8 %202, ptr %205, align 1, !dbg !2391
  %206 = load i64, ptr %8, align 8, !dbg !2392
  %207 = add i64 %206, 1, !dbg !2392
  store i64 %207, ptr %8, align 8, !dbg !2392
  br label %263, !dbg !2393

208:                                              ; preds = %177
  %209 = load ptr, ptr %5, align 8, !dbg !2394
  %210 = load i64, ptr %7, align 8, !dbg !2396
  %211 = getelementptr inbounds i8, ptr %209, i64 %210, !dbg !2394
  %212 = load i8, ptr %211, align 1, !dbg !2394
  %213 = sext i8 %212 to i32, !dbg !2394
  %214 = icmp eq i32 %213, 115, !dbg !2397
  br i1 %214, label %215, label %252, !dbg !2398

215:                                              ; preds = %208
  call void @llvm.dbg.declare(metadata ptr %19, metadata !2399, metadata !DIExpression()), !dbg !2401
  %216 = load ptr, ptr %6, align 8, !dbg !2402
  %217 = getelementptr inbounds %struct.__va_list_tag, ptr %216, i32 0, i32 0, !dbg !2402
  %218 = load i32, ptr %217, align 8, !dbg !2402
  %219 = icmp ule i32 %218, 40, !dbg !2402
  br i1 %219, label %220, label %225, !dbg !2402

220:                                              ; preds = %215
  %221 = getelementptr inbounds %struct.__va_list_tag, ptr %216, i32 0, i32 3, !dbg !2402
  %222 = load ptr, ptr %221, align 8, !dbg !2402
  %223 = getelementptr i8, ptr %222, i32 %218, !dbg !2402
  %224 = add i32 %218, 8, !dbg !2402
  store i32 %224, ptr %217, align 8, !dbg !2402
  br label %229, !dbg !2402

225:                                              ; preds = %215
  %226 = getelementptr inbounds %struct.__va_list_tag, ptr %216, i32 0, i32 2, !dbg !2402
  %227 = load ptr, ptr %226, align 8, !dbg !2402
  %228 = getelementptr i8, ptr %227, i32 8, !dbg !2402
  store ptr %228, ptr %226, align 8, !dbg !2402
  br label %229, !dbg !2402

229:                                              ; preds = %225, %220
  %230 = phi ptr [ %223, %220 ], [ %227, %225 ], !dbg !2402
  %231 = load ptr, ptr %230, align 8, !dbg !2402
  store ptr %231, ptr %19, align 8, !dbg !2401
  call void @llvm.dbg.declare(metadata ptr %20, metadata !2403, metadata !DIExpression()), !dbg !2404
  store i64 0, ptr %20, align 8, !dbg !2404
  br label %232, !dbg !2405

232:                                              ; preds = %239, %229
  %233 = load ptr, ptr %19, align 8, !dbg !2406
  %234 = load i64, ptr %20, align 8, !dbg !2407
  %235 = getelementptr inbounds i8, ptr %233, i64 %234, !dbg !2406
  %236 = load i8, ptr %235, align 1, !dbg !2406
  %237 = sext i8 %236 to i32, !dbg !2406
  %238 = icmp ne i32 %237, 0, !dbg !2408
  br i1 %238, label %239, label %251, !dbg !2405

239:                                              ; preds = %232
  %240 = load ptr, ptr %19, align 8, !dbg !2409
  %241 = load i64, ptr %20, align 8, !dbg !2411
  %242 = getelementptr inbounds i8, ptr %240, i64 %241, !dbg !2409
  %243 = load i8, ptr %242, align 1, !dbg !2409
  %244 = load ptr, ptr %4, align 8, !dbg !2412
  %245 = load i64, ptr %8, align 8, !dbg !2413
  %246 = getelementptr inbounds i8, ptr %244, i64 %245, !dbg !2412
  store i8 %243, ptr %246, align 1, !dbg !2414
  %247 = load i64, ptr %8, align 8, !dbg !2415
  %248 = add i64 %247, 1, !dbg !2415
  store i64 %248, ptr %8, align 8, !dbg !2415
  %249 = load i64, ptr %20, align 8, !dbg !2416
  %250 = add i64 %249, 1, !dbg !2416
  store i64 %250, ptr %20, align 8, !dbg !2416
  br label %232, !dbg !2405, !llvm.loop !2417

251:                                              ; preds = %232
  br label %262, !dbg !2419

252:                                              ; preds = %208
  %253 = load ptr, ptr %5, align 8, !dbg !2420
  %254 = load i64, ptr %7, align 8, !dbg !2422
  %255 = getelementptr inbounds i8, ptr %253, i64 %254, !dbg !2420
  %256 = load i8, ptr %255, align 1, !dbg !2420
  %257 = load ptr, ptr %4, align 8, !dbg !2423
  %258 = load i64, ptr %8, align 8, !dbg !2424
  %259 = getelementptr inbounds i8, ptr %257, i64 %258, !dbg !2423
  store i8 %256, ptr %259, align 1, !dbg !2425
  %260 = load i64, ptr %8, align 8, !dbg !2426
  %261 = add i64 %260, 1, !dbg !2426
  store i64 %261, ptr %8, align 8, !dbg !2426
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
  %267 = load i64, ptr %7, align 8, !dbg !2427
  %268 = add i64 %267, 1, !dbg !2427
  store i64 %268, ptr %7, align 8, !dbg !2427
  br label %281, !dbg !2428

269:                                              ; preds = %28
  %270 = load ptr, ptr %5, align 8, !dbg !2429
  %271 = load i64, ptr %7, align 8, !dbg !2431
  %272 = getelementptr inbounds i8, ptr %270, i64 %271, !dbg !2429
  %273 = load i8, ptr %272, align 1, !dbg !2429
  %274 = load ptr, ptr %4, align 8, !dbg !2432
  %275 = load i64, ptr %8, align 8, !dbg !2433
  %276 = getelementptr inbounds i8, ptr %274, i64 %275, !dbg !2432
  store i8 %273, ptr %276, align 1, !dbg !2434
  %277 = load i64, ptr %7, align 8, !dbg !2435
  %278 = add i64 %277, 1, !dbg !2435
  store i64 %278, ptr %7, align 8, !dbg !2435
  %279 = load i64, ptr %8, align 8, !dbg !2436
  %280 = add i64 %279, 1, !dbg !2436
  store i64 %280, ptr %8, align 8, !dbg !2436
  br label %281

281:                                              ; preds = %269, %266
  br label %21, !dbg !2263, !llvm.loop !2437

282:                                              ; preds = %44, %21
  %283 = load ptr, ptr %4, align 8, !dbg !2439
  %284 = load i64, ptr %8, align 8, !dbg !2440
  %285 = getelementptr inbounds i8, ptr %283, i64 %284, !dbg !2439
  store i8 0, ptr %285, align 1, !dbg !2441
  %286 = load i64, ptr %8, align 8, !dbg !2442
  %287 = trunc i64 %286 to i32, !dbg !2443
  ret i32 %287, !dbg !2444
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__fizzer_model__helper_itoa(i32 noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !2445 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca [32 x i8], align 16
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2449, metadata !DIExpression()), !dbg !2450
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2451, metadata !DIExpression()), !dbg !2452
  store i32 %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2453, metadata !DIExpression()), !dbg !2454
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2455, metadata !DIExpression()), !dbg !2456
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2457, metadata !DIExpression()), !dbg !2458
  store i32 0, ptr %8, align 4, !dbg !2458
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2459, metadata !DIExpression()), !dbg !2460
  store i32 0, ptr %9, align 4, !dbg !2460
  %12 = load i32, ptr %4, align 4, !dbg !2461
  %13 = icmp slt i32 %12, 0, !dbg !2463
  br i1 %13, label %14, label %20, !dbg !2464

14:                                               ; preds = %3
  %15 = load i32, ptr %6, align 4, !dbg !2465
  %16 = icmp eq i32 %15, 10, !dbg !2466
  br i1 %16, label %17, label %20, !dbg !2467

17:                                               ; preds = %14
  store i32 1, ptr %9, align 4, !dbg !2468
  %18 = load i32, ptr %4, align 4, !dbg !2470
  %19 = sub nsw i32 0, %18, !dbg !2471
  store i32 %19, ptr %4, align 4, !dbg !2472
  br label %20, !dbg !2473

20:                                               ; preds = %17, %14, %3
  %21 = load i32, ptr %4, align 4, !dbg !2474
  %22 = icmp eq i32 %21, 0, !dbg !2476
  br i1 %22, label %23, label %28, !dbg !2477

23:                                               ; preds = %20
  %24 = load ptr, ptr %5, align 8, !dbg !2478
  %25 = getelementptr inbounds i8, ptr %24, i64 0, !dbg !2478
  store i8 48, ptr %25, align 1, !dbg !2480
  %26 = load ptr, ptr %5, align 8, !dbg !2481
  %27 = getelementptr inbounds i8, ptr %26, i64 1, !dbg !2481
  store i8 0, ptr %27, align 1, !dbg !2482
  br label %91, !dbg !2483

28:                                               ; preds = %20
  br label %29, !dbg !2484

29:                                               ; preds = %53, %28
  %30 = load i32, ptr %4, align 4, !dbg !2485
  %31 = icmp ne i32 %30, 0, !dbg !2486
  br i1 %31, label %32, label %59, !dbg !2484

32:                                               ; preds = %29
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2487, metadata !DIExpression()), !dbg !2489
  %33 = load i32, ptr %4, align 4, !dbg !2490
  %34 = load i32, ptr %6, align 4, !dbg !2491
  %35 = srem i32 %33, %34, !dbg !2492
  store i32 %35, ptr %10, align 4, !dbg !2489
  %36 = load i32, ptr %10, align 4, !dbg !2493
  %37 = icmp slt i32 %36, 10, !dbg !2495
  br i1 %37, label %38, label %45, !dbg !2496

38:                                               ; preds = %32
  %39 = load i32, ptr %10, align 4, !dbg !2497
  %40 = add nsw i32 48, %39, !dbg !2499
  %41 = trunc i32 %40 to i8, !dbg !2500
  %42 = load i32, ptr %8, align 4, !dbg !2501
  %43 = sext i32 %42 to i64, !dbg !2502
  %44 = getelementptr inbounds [32 x i8], ptr %7, i64 0, i64 %43, !dbg !2502
  store i8 %41, ptr %44, align 1, !dbg !2503
  br label %53, !dbg !2504

45:                                               ; preds = %32
  %46 = load i32, ptr %10, align 4, !dbg !2505
  %47 = sub nsw i32 %46, 10, !dbg !2507
  %48 = add nsw i32 97, %47, !dbg !2508
  %49 = trunc i32 %48 to i8, !dbg !2509
  %50 = load i32, ptr %8, align 4, !dbg !2510
  %51 = sext i32 %50 to i64, !dbg !2511
  %52 = getelementptr inbounds [32 x i8], ptr %7, i64 0, i64 %51, !dbg !2511
  store i8 %49, ptr %52, align 1, !dbg !2512
  br label %53

53:                                               ; preds = %45, %38
  %54 = load i32, ptr %4, align 4, !dbg !2513
  %55 = load i32, ptr %6, align 4, !dbg !2514
  %56 = sdiv i32 %54, %55, !dbg !2515
  store i32 %56, ptr %4, align 4, !dbg !2516
  %57 = load i32, ptr %8, align 4, !dbg !2517
  %58 = add nsw i32 %57, 1, !dbg !2517
  store i32 %58, ptr %8, align 4, !dbg !2517
  br label %29, !dbg !2484, !llvm.loop !2518

59:                                               ; preds = %29
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2520, metadata !DIExpression()), !dbg !2521
  store i32 0, ptr %11, align 4, !dbg !2521
  %60 = load i32, ptr %9, align 4, !dbg !2522
  %61 = icmp ne i32 %60, 0, !dbg !2522
  br i1 %61, label %62, label %69, !dbg !2524

62:                                               ; preds = %59
  %63 = load ptr, ptr %5, align 8, !dbg !2525
  %64 = load i32, ptr %11, align 4, !dbg !2527
  %65 = sext i32 %64 to i64, !dbg !2525
  %66 = getelementptr inbounds i8, ptr %63, i64 %65, !dbg !2525
  store i8 45, ptr %66, align 1, !dbg !2528
  %67 = load i32, ptr %11, align 4, !dbg !2529
  %68 = add nsw i32 %67, 1, !dbg !2529
  store i32 %68, ptr %11, align 4, !dbg !2529
  br label %69, !dbg !2530

69:                                               ; preds = %62, %59
  br label %70, !dbg !2531

70:                                               ; preds = %73, %69
  %71 = load i32, ptr %8, align 4, !dbg !2532
  %72 = icmp sgt i32 %71, 0, !dbg !2533
  br i1 %72, label %73, label %86, !dbg !2531

73:                                               ; preds = %70
  %74 = load i32, ptr %8, align 4, !dbg !2534
  %75 = add nsw i32 %74, -1, !dbg !2534
  store i32 %75, ptr %8, align 4, !dbg !2534
  %76 = load i32, ptr %8, align 4, !dbg !2536
  %77 = sext i32 %76 to i64, !dbg !2537
  %78 = getelementptr inbounds [32 x i8], ptr %7, i64 0, i64 %77, !dbg !2537
  %79 = load i8, ptr %78, align 1, !dbg !2537
  %80 = load ptr, ptr %5, align 8, !dbg !2538
  %81 = load i32, ptr %11, align 4, !dbg !2539
  %82 = sext i32 %81 to i64, !dbg !2538
  %83 = getelementptr inbounds i8, ptr %80, i64 %82, !dbg !2538
  store i8 %79, ptr %83, align 1, !dbg !2540
  %84 = load i32, ptr %11, align 4, !dbg !2541
  %85 = add nsw i32 %84, 1, !dbg !2541
  store i32 %85, ptr %11, align 4, !dbg !2541
  br label %70, !dbg !2531, !llvm.loop !2542

86:                                               ; preds = %70
  %87 = load ptr, ptr %5, align 8, !dbg !2544
  %88 = load i32, ptr %11, align 4, !dbg !2545
  %89 = sext i32 %88 to i64, !dbg !2544
  %90 = getelementptr inbounds i8, ptr %87, i64 %89, !dbg !2544
  store i8 0, ptr %90, align 1, !dbg !2546
  br label %91, !dbg !2547

91:                                               ; preds = %86, %23
  ret void, !dbg !2547
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_model__vsnprintf(ptr noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !2548 {
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
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2561, metadata !DIExpression()), !dbg !2562
  store i64 %1, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2563, metadata !DIExpression()), !dbg !2564
  store ptr %2, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2565, metadata !DIExpression()), !dbg !2566
  store ptr %3, ptr %9, align 8
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2567, metadata !DIExpression()), !dbg !2568
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2569, metadata !DIExpression()), !dbg !2570
  store i64 0, ptr %10, align 8, !dbg !2570
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2571, metadata !DIExpression()), !dbg !2572
  store i64 0, ptr %11, align 8, !dbg !2572
  %18 = load i64, ptr %7, align 8, !dbg !2573
  %19 = icmp eq i64 %18, 0, !dbg !2575
  br i1 %19, label %20, label %21, !dbg !2576

20:                                               ; preds = %4
  store i32 0, ptr %5, align 4, !dbg !2577
  br label %269, !dbg !2577

21:                                               ; preds = %4
  br label %22, !dbg !2579

22:                                               ; preds = %262, %208, %21
  %23 = load ptr, ptr %8, align 8, !dbg !2580
  %24 = load i64, ptr %10, align 8, !dbg !2581
  %25 = getelementptr inbounds i8, ptr %23, i64 %24, !dbg !2580
  %26 = load i8, ptr %25, align 1, !dbg !2580
  %27 = sext i8 %26 to i32, !dbg !2580
  %28 = icmp ne i32 %27, 0, !dbg !2582
  br i1 %28, label %29, label %34, !dbg !2583

29:                                               ; preds = %22
  %30 = load i64, ptr %11, align 8, !dbg !2584
  %31 = load i64, ptr %7, align 8, !dbg !2585
  %32 = sub i64 %31, 1, !dbg !2586
  %33 = icmp ult i64 %30, %32, !dbg !2587
  br label %34

34:                                               ; preds = %29, %22
  %35 = phi i1 [ false, %22 ], [ %33, %29 ], !dbg !2588
  br i1 %35, label %36, label %263, !dbg !2579

36:                                               ; preds = %34
  %37 = load ptr, ptr %8, align 8, !dbg !2589
  %38 = load i64, ptr %10, align 8, !dbg !2592
  %39 = getelementptr inbounds i8, ptr %37, i64 %38, !dbg !2589
  %40 = load i8, ptr %39, align 1, !dbg !2589
  %41 = sext i8 %40 to i32, !dbg !2589
  %42 = icmp eq i32 %41, 37, !dbg !2593
  br i1 %42, label %43, label %250, !dbg !2594

43:                                               ; preds = %36
  %44 = load i64, ptr %10, align 8, !dbg !2595
  %45 = add i64 %44, 1, !dbg !2595
  store i64 %45, ptr %10, align 8, !dbg !2595
  %46 = load ptr, ptr %8, align 8, !dbg !2597
  %47 = load i64, ptr %10, align 8, !dbg !2599
  %48 = getelementptr inbounds i8, ptr %46, i64 %47, !dbg !2597
  %49 = load i8, ptr %48, align 1, !dbg !2597
  %50 = sext i8 %49 to i32, !dbg !2597
  %51 = icmp eq i32 %50, 0, !dbg !2600
  br i1 %51, label %52, label %53, !dbg !2601

52:                                               ; preds = %43
  br label %263, !dbg !2602

53:                                               ; preds = %43
  call void @llvm.dbg.declare(metadata ptr %12, metadata !2604, metadata !DIExpression()), !dbg !2605
  call void @llvm.dbg.declare(metadata ptr %13, metadata !2606, metadata !DIExpression()), !dbg !2607
  store i64 0, ptr %13, align 8, !dbg !2607
  %54 = load ptr, ptr %8, align 8, !dbg !2608
  %55 = load i64, ptr %10, align 8, !dbg !2610
  %56 = getelementptr inbounds i8, ptr %54, i64 %55, !dbg !2608
  %57 = load i8, ptr %56, align 1, !dbg !2608
  %58 = sext i8 %57 to i32, !dbg !2608
  %59 = icmp eq i32 %58, 100, !dbg !2611
  br i1 %59, label %60, label %79, !dbg !2612

60:                                               ; preds = %53
  call void @llvm.dbg.declare(metadata ptr %14, metadata !2613, metadata !DIExpression()), !dbg !2615
  %61 = load ptr, ptr %9, align 8, !dbg !2616
  %62 = getelementptr inbounds %struct.__va_list_tag, ptr %61, i32 0, i32 0, !dbg !2616
  %63 = load i32, ptr %62, align 8, !dbg !2616
  %64 = icmp ule i32 %63, 40, !dbg !2616
  br i1 %64, label %65, label %70, !dbg !2616

65:                                               ; preds = %60
  %66 = getelementptr inbounds %struct.__va_list_tag, ptr %61, i32 0, i32 3, !dbg !2616
  %67 = load ptr, ptr %66, align 8, !dbg !2616
  %68 = getelementptr i8, ptr %67, i32 %63, !dbg !2616
  %69 = add i32 %63, 8, !dbg !2616
  store i32 %69, ptr %62, align 8, !dbg !2616
  br label %74, !dbg !2616

70:                                               ; preds = %60
  %71 = getelementptr inbounds %struct.__va_list_tag, ptr %61, i32 0, i32 2, !dbg !2616
  %72 = load ptr, ptr %71, align 8, !dbg !2616
  %73 = getelementptr i8, ptr %72, i32 8, !dbg !2616
  store ptr %73, ptr %71, align 8, !dbg !2616
  br label %74, !dbg !2616

74:                                               ; preds = %70, %65
  %75 = phi ptr [ %68, %65 ], [ %72, %70 ], !dbg !2616
  %76 = load i32, ptr %75, align 4, !dbg !2616
  store i32 %76, ptr %14, align 4, !dbg !2615
  %77 = load i32, ptr %14, align 4, !dbg !2617
  %78 = getelementptr inbounds [32 x i8], ptr %12, i64 0, i64 0, !dbg !2618
  call void @__fizzer_model__helper_itoa(i32 noundef %77, ptr noundef %78, i32 noundef 10), !dbg !2619
  br label %222, !dbg !2620

79:                                               ; preds = %53
  %80 = load ptr, ptr %8, align 8, !dbg !2621
  %81 = load i64, ptr %10, align 8, !dbg !2623
  %82 = getelementptr inbounds i8, ptr %80, i64 %81, !dbg !2621
  %83 = load i8, ptr %82, align 1, !dbg !2621
  %84 = sext i8 %83 to i32, !dbg !2621
  %85 = icmp eq i32 %84, 117, !dbg !2624
  br i1 %85, label %86, label %105, !dbg !2625

86:                                               ; preds = %79
  call void @llvm.dbg.declare(metadata ptr %15, metadata !2626, metadata !DIExpression()), !dbg !2628
  %87 = load ptr, ptr %9, align 8, !dbg !2629
  %88 = getelementptr inbounds %struct.__va_list_tag, ptr %87, i32 0, i32 0, !dbg !2629
  %89 = load i32, ptr %88, align 8, !dbg !2629
  %90 = icmp ule i32 %89, 40, !dbg !2629
  br i1 %90, label %91, label %96, !dbg !2629

91:                                               ; preds = %86
  %92 = getelementptr inbounds %struct.__va_list_tag, ptr %87, i32 0, i32 3, !dbg !2629
  %93 = load ptr, ptr %92, align 8, !dbg !2629
  %94 = getelementptr i8, ptr %93, i32 %89, !dbg !2629
  %95 = add i32 %89, 8, !dbg !2629
  store i32 %95, ptr %88, align 8, !dbg !2629
  br label %100, !dbg !2629

96:                                               ; preds = %86
  %97 = getelementptr inbounds %struct.__va_list_tag, ptr %87, i32 0, i32 2, !dbg !2629
  %98 = load ptr, ptr %97, align 8, !dbg !2629
  %99 = getelementptr i8, ptr %98, i32 8, !dbg !2629
  store ptr %99, ptr %97, align 8, !dbg !2629
  br label %100, !dbg !2629

100:                                              ; preds = %96, %91
  %101 = phi ptr [ %94, %91 ], [ %98, %96 ], !dbg !2629
  %102 = load i32, ptr %101, align 4, !dbg !2629
  store i32 %102, ptr %15, align 4, !dbg !2628
  %103 = load i32, ptr %15, align 4, !dbg !2630
  %104 = getelementptr inbounds [32 x i8], ptr %12, i64 0, i64 0, !dbg !2631
  call void @__fizzer_model__helper_itoa(i32 noundef %103, ptr noundef %104, i32 noundef 10), !dbg !2632
  br label %221, !dbg !2633

105:                                              ; preds = %79
  %106 = load ptr, ptr %8, align 8, !dbg !2634
  %107 = load i64, ptr %10, align 8, !dbg !2636
  %108 = getelementptr inbounds i8, ptr %106, i64 %107, !dbg !2634
  %109 = load i8, ptr %108, align 1, !dbg !2634
  %110 = sext i8 %109 to i32, !dbg !2634
  %111 = icmp eq i32 %110, 120, !dbg !2637
  br i1 %111, label %112, label %131, !dbg !2638

112:                                              ; preds = %105
  call void @llvm.dbg.declare(metadata ptr %16, metadata !2639, metadata !DIExpression()), !dbg !2641
  %113 = load ptr, ptr %9, align 8, !dbg !2642
  %114 = getelementptr inbounds %struct.__va_list_tag, ptr %113, i32 0, i32 0, !dbg !2642
  %115 = load i32, ptr %114, align 8, !dbg !2642
  %116 = icmp ule i32 %115, 40, !dbg !2642
  br i1 %116, label %117, label %122, !dbg !2642

117:                                              ; preds = %112
  %118 = getelementptr inbounds %struct.__va_list_tag, ptr %113, i32 0, i32 3, !dbg !2642
  %119 = load ptr, ptr %118, align 8, !dbg !2642
  %120 = getelementptr i8, ptr %119, i32 %115, !dbg !2642
  %121 = add i32 %115, 8, !dbg !2642
  store i32 %121, ptr %114, align 8, !dbg !2642
  br label %126, !dbg !2642

122:                                              ; preds = %112
  %123 = getelementptr inbounds %struct.__va_list_tag, ptr %113, i32 0, i32 2, !dbg !2642
  %124 = load ptr, ptr %123, align 8, !dbg !2642
  %125 = getelementptr i8, ptr %124, i32 8, !dbg !2642
  store ptr %125, ptr %123, align 8, !dbg !2642
  br label %126, !dbg !2642

126:                                              ; preds = %122, %117
  %127 = phi ptr [ %120, %117 ], [ %124, %122 ], !dbg !2642
  %128 = load i32, ptr %127, align 4, !dbg !2642
  store i32 %128, ptr %16, align 4, !dbg !2641
  %129 = load i32, ptr %16, align 4, !dbg !2643
  %130 = getelementptr inbounds [32 x i8], ptr %12, i64 0, i64 0, !dbg !2644
  call void @__fizzer_model__helper_itoa(i32 noundef %129, ptr noundef %130, i32 noundef 16), !dbg !2645
  br label %220, !dbg !2646

131:                                              ; preds = %105
  %132 = load ptr, ptr %8, align 8, !dbg !2647
  %133 = load i64, ptr %10, align 8, !dbg !2649
  %134 = getelementptr inbounds i8, ptr %132, i64 %133, !dbg !2647
  %135 = load i8, ptr %134, align 1, !dbg !2647
  %136 = sext i8 %135 to i32, !dbg !2647
  %137 = icmp eq i32 %136, 99, !dbg !2650
  br i1 %137, label %138, label %158, !dbg !2651

138:                                              ; preds = %131
  %139 = load ptr, ptr %9, align 8, !dbg !2652
  %140 = getelementptr inbounds %struct.__va_list_tag, ptr %139, i32 0, i32 0, !dbg !2652
  %141 = load i32, ptr %140, align 8, !dbg !2652
  %142 = icmp ule i32 %141, 40, !dbg !2652
  br i1 %142, label %143, label %148, !dbg !2652

143:                                              ; preds = %138
  %144 = getelementptr inbounds %struct.__va_list_tag, ptr %139, i32 0, i32 3, !dbg !2652
  %145 = load ptr, ptr %144, align 8, !dbg !2652
  %146 = getelementptr i8, ptr %145, i32 %141, !dbg !2652
  %147 = add i32 %141, 8, !dbg !2652
  store i32 %147, ptr %140, align 8, !dbg !2652
  br label %152, !dbg !2652

148:                                              ; preds = %138
  %149 = getelementptr inbounds %struct.__va_list_tag, ptr %139, i32 0, i32 2, !dbg !2652
  %150 = load ptr, ptr %149, align 8, !dbg !2652
  %151 = getelementptr i8, ptr %150, i32 8, !dbg !2652
  store ptr %151, ptr %149, align 8, !dbg !2652
  br label %152, !dbg !2652

152:                                              ; preds = %148, %143
  %153 = phi ptr [ %146, %143 ], [ %150, %148 ], !dbg !2652
  %154 = load i32, ptr %153, align 4, !dbg !2652
  %155 = trunc i32 %154 to i8, !dbg !2654
  %156 = getelementptr inbounds [32 x i8], ptr %12, i64 0, i64 0, !dbg !2655
  store i8 %155, ptr %156, align 16, !dbg !2656
  %157 = getelementptr inbounds [32 x i8], ptr %12, i64 0, i64 1, !dbg !2657
  store i8 0, ptr %157, align 1, !dbg !2658
  br label %219, !dbg !2659

158:                                              ; preds = %131
  %159 = load ptr, ptr %8, align 8, !dbg !2660
  %160 = load i64, ptr %10, align 8, !dbg !2662
  %161 = getelementptr inbounds i8, ptr %159, i64 %160, !dbg !2660
  %162 = load i8, ptr %161, align 1, !dbg !2660
  %163 = sext i8 %162 to i32, !dbg !2660
  %164 = icmp eq i32 %163, 115, !dbg !2663
  br i1 %164, label %165, label %211, !dbg !2664

165:                                              ; preds = %158
  call void @llvm.dbg.declare(metadata ptr %17, metadata !2665, metadata !DIExpression()), !dbg !2667
  %166 = load ptr, ptr %9, align 8, !dbg !2668
  %167 = getelementptr inbounds %struct.__va_list_tag, ptr %166, i32 0, i32 0, !dbg !2668
  %168 = load i32, ptr %167, align 8, !dbg !2668
  %169 = icmp ule i32 %168, 40, !dbg !2668
  br i1 %169, label %170, label %175, !dbg !2668

170:                                              ; preds = %165
  %171 = getelementptr inbounds %struct.__va_list_tag, ptr %166, i32 0, i32 3, !dbg !2668
  %172 = load ptr, ptr %171, align 8, !dbg !2668
  %173 = getelementptr i8, ptr %172, i32 %168, !dbg !2668
  %174 = add i32 %168, 8, !dbg !2668
  store i32 %174, ptr %167, align 8, !dbg !2668
  br label %179, !dbg !2668

175:                                              ; preds = %165
  %176 = getelementptr inbounds %struct.__va_list_tag, ptr %166, i32 0, i32 2, !dbg !2668
  %177 = load ptr, ptr %176, align 8, !dbg !2668
  %178 = getelementptr i8, ptr %177, i32 8, !dbg !2668
  store ptr %178, ptr %176, align 8, !dbg !2668
  br label %179, !dbg !2668

179:                                              ; preds = %175, %170
  %180 = phi ptr [ %173, %170 ], [ %177, %175 ], !dbg !2668
  %181 = load ptr, ptr %180, align 8, !dbg !2668
  store ptr %181, ptr %17, align 8, !dbg !2667
  store i64 0, ptr %13, align 8, !dbg !2669
  br label %182, !dbg !2670

182:                                              ; preds = %196, %179
  %183 = load ptr, ptr %17, align 8, !dbg !2671
  %184 = load i64, ptr %13, align 8, !dbg !2672
  %185 = getelementptr inbounds i8, ptr %183, i64 %184, !dbg !2671
  %186 = load i8, ptr %185, align 1, !dbg !2671
  %187 = sext i8 %186 to i32, !dbg !2671
  %188 = icmp ne i32 %187, 0, !dbg !2673
  br i1 %188, label %189, label %194, !dbg !2674

189:                                              ; preds = %182
  %190 = load i64, ptr %11, align 8, !dbg !2675
  %191 = load i64, ptr %7, align 8, !dbg !2676
  %192 = sub i64 %191, 1, !dbg !2677
  %193 = icmp ult i64 %190, %192, !dbg !2678
  br label %194

194:                                              ; preds = %189, %182
  %195 = phi i1 [ false, %182 ], [ %193, %189 ], !dbg !2679
  br i1 %195, label %196, label %208, !dbg !2670

196:                                              ; preds = %194
  %197 = load ptr, ptr %17, align 8, !dbg !2680
  %198 = load i64, ptr %13, align 8, !dbg !2682
  %199 = getelementptr inbounds i8, ptr %197, i64 %198, !dbg !2680
  %200 = load i8, ptr %199, align 1, !dbg !2680
  %201 = load ptr, ptr %6, align 8, !dbg !2683
  %202 = load i64, ptr %11, align 8, !dbg !2684
  %203 = getelementptr inbounds i8, ptr %201, i64 %202, !dbg !2683
  store i8 %200, ptr %203, align 1, !dbg !2685
  %204 = load i64, ptr %11, align 8, !dbg !2686
  %205 = add i64 %204, 1, !dbg !2686
  store i64 %205, ptr %11, align 8, !dbg !2686
  %206 = load i64, ptr %13, align 8, !dbg !2687
  %207 = add i64 %206, 1, !dbg !2687
  store i64 %207, ptr %13, align 8, !dbg !2687
  br label %182, !dbg !2670, !llvm.loop !2688

208:                                              ; preds = %194
  %209 = load i64, ptr %10, align 8, !dbg !2690
  %210 = add i64 %209, 1, !dbg !2690
  store i64 %210, ptr %10, align 8, !dbg !2690
  br label %22, !dbg !2691, !llvm.loop !2692

211:                                              ; preds = %158
  %212 = load ptr, ptr %8, align 8, !dbg !2694
  %213 = load i64, ptr %10, align 8, !dbg !2696
  %214 = getelementptr inbounds i8, ptr %212, i64 %213, !dbg !2694
  %215 = load i8, ptr %214, align 1, !dbg !2694
  %216 = getelementptr inbounds [32 x i8], ptr %12, i64 0, i64 0, !dbg !2697
  store i8 %215, ptr %216, align 16, !dbg !2698
  %217 = getelementptr inbounds [32 x i8], ptr %12, i64 0, i64 1, !dbg !2699
  store i8 0, ptr %217, align 1, !dbg !2700
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
  store i64 0, ptr %13, align 8, !dbg !2701
  br label %223, !dbg !2702

223:                                              ; preds = %236, %222
  %224 = load i64, ptr %13, align 8, !dbg !2703
  %225 = getelementptr inbounds [32 x i8], ptr %12, i64 0, i64 %224, !dbg !2704
  %226 = load i8, ptr %225, align 1, !dbg !2704
  %227 = sext i8 %226 to i32, !dbg !2704
  %228 = icmp ne i32 %227, 0, !dbg !2705
  br i1 %228, label %229, label %234, !dbg !2706

229:                                              ; preds = %223
  %230 = load i64, ptr %11, align 8, !dbg !2707
  %231 = load i64, ptr %7, align 8, !dbg !2708
  %232 = sub i64 %231, 1, !dbg !2709
  %233 = icmp ult i64 %230, %232, !dbg !2710
  br label %234

234:                                              ; preds = %229, %223
  %235 = phi i1 [ false, %223 ], [ %233, %229 ], !dbg !2711
  br i1 %235, label %236, label %247, !dbg !2702

236:                                              ; preds = %234
  %237 = load i64, ptr %13, align 8, !dbg !2712
  %238 = getelementptr inbounds [32 x i8], ptr %12, i64 0, i64 %237, !dbg !2714
  %239 = load i8, ptr %238, align 1, !dbg !2714
  %240 = load ptr, ptr %6, align 8, !dbg !2715
  %241 = load i64, ptr %11, align 8, !dbg !2716
  %242 = getelementptr inbounds i8, ptr %240, i64 %241, !dbg !2715
  store i8 %239, ptr %242, align 1, !dbg !2717
  %243 = load i64, ptr %11, align 8, !dbg !2718
  %244 = add i64 %243, 1, !dbg !2718
  store i64 %244, ptr %11, align 8, !dbg !2718
  %245 = load i64, ptr %13, align 8, !dbg !2719
  %246 = add i64 %245, 1, !dbg !2719
  store i64 %246, ptr %13, align 8, !dbg !2719
  br label %223, !dbg !2702, !llvm.loop !2720

247:                                              ; preds = %234
  %248 = load i64, ptr %10, align 8, !dbg !2722
  %249 = add i64 %248, 1, !dbg !2722
  store i64 %249, ptr %10, align 8, !dbg !2722
  br label %262, !dbg !2723

250:                                              ; preds = %36
  %251 = load ptr, ptr %8, align 8, !dbg !2724
  %252 = load i64, ptr %10, align 8, !dbg !2726
  %253 = getelementptr inbounds i8, ptr %251, i64 %252, !dbg !2724
  %254 = load i8, ptr %253, align 1, !dbg !2724
  %255 = load ptr, ptr %6, align 8, !dbg !2727
  %256 = load i64, ptr %11, align 8, !dbg !2728
  %257 = getelementptr inbounds i8, ptr %255, i64 %256, !dbg !2727
  store i8 %254, ptr %257, align 1, !dbg !2729
  %258 = load i64, ptr %10, align 8, !dbg !2730
  %259 = add i64 %258, 1, !dbg !2730
  store i64 %259, ptr %10, align 8, !dbg !2730
  %260 = load i64, ptr %11, align 8, !dbg !2731
  %261 = add i64 %260, 1, !dbg !2731
  store i64 %261, ptr %11, align 8, !dbg !2731
  br label %262

262:                                              ; preds = %250, %247
  br label %22, !dbg !2579, !llvm.loop !2692

263:                                              ; preds = %52, %34
  %264 = load ptr, ptr %6, align 8, !dbg !2732
  %265 = load i64, ptr %11, align 8, !dbg !2733
  %266 = getelementptr inbounds i8, ptr %264, i64 %265, !dbg !2732
  store i8 0, ptr %266, align 1, !dbg !2734
  %267 = load i64, ptr %11, align 8, !dbg !2735
  %268 = trunc i64 %267 to i32, !dbg !2736
  store i32 %268, ptr %5, align 4, !dbg !2737
  br label %269, !dbg !2737

269:                                              ; preds = %263, %20
  %270 = load i32, ptr %5, align 4, !dbg !2738
  ret i32 %270, !dbg !2738
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local x86_fp80 @__fizzer_model__fabsl(x86_fp80 noundef %0) #0 !dbg !2739 {
  %2 = alloca x86_fp80, align 16
  %3 = alloca x86_fp80, align 16
  store x86_fp80 %0, ptr %3, align 16
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2744, metadata !DIExpression()), !dbg !2745
  %4 = load x86_fp80, ptr %3, align 16, !dbg !2746
  %5 = fcmp olt x86_fp80 %4, 0xK00000000000000000000, !dbg !2748
  br i1 %5, label %6, label %9, !dbg !2749

6:                                                ; preds = %1
  %7 = load x86_fp80, ptr %3, align 16, !dbg !2750
  %8 = fneg x86_fp80 %7, !dbg !2751
  store x86_fp80 %8, ptr %2, align 16, !dbg !2752
  br label %11, !dbg !2752

9:                                                ; preds = %1
  %10 = load x86_fp80, ptr %3, align 16, !dbg !2753
  store x86_fp80 %10, ptr %2, align 16, !dbg !2754
  br label %11, !dbg !2754

11:                                               ; preds = %9, %6
  %12 = load x86_fp80, ptr %2, align 16, !dbg !2755
  ret x86_fp80 %12, !dbg !2755
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @__fizzer_model__fabs(double noundef %0) #0 !dbg !2756 {
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  store double %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2760, metadata !DIExpression()), !dbg !2761
  %4 = load double, ptr %3, align 8, !dbg !2762
  %5 = fcmp olt double %4, 0.000000e+00, !dbg !2764
  br i1 %5, label %6, label %9, !dbg !2765

6:                                                ; preds = %1
  %7 = load double, ptr %3, align 8, !dbg !2766
  %8 = fneg double %7, !dbg !2767
  store double %8, ptr %2, align 8, !dbg !2768
  br label %11, !dbg !2768

9:                                                ; preds = %1
  %10 = load double, ptr %3, align 8, !dbg !2769
  store double %10, ptr %2, align 8, !dbg !2770
  br label %11, !dbg !2770

11:                                               ; preds = %9, %6
  %12 = load double, ptr %2, align 8, !dbg !2771
  ret double %12, !dbg !2771
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @__fizzer_model__fabsf(float noundef %0) #0 !dbg !2772 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  store float %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2777, metadata !DIExpression()), !dbg !2778
  %4 = load float, ptr %3, align 4, !dbg !2779
  %5 = fcmp olt float %4, 0.000000e+00, !dbg !2781
  br i1 %5, label %6, label %9, !dbg !2782

6:                                                ; preds = %1
  %7 = load float, ptr %3, align 4, !dbg !2783
  %8 = fneg float %7, !dbg !2784
  store float %8, ptr %2, align 4, !dbg !2785
  br label %11, !dbg !2785

9:                                                ; preds = %1
  %10 = load float, ptr %3, align 4, !dbg !2786
  store float %10, ptr %2, align 4, !dbg !2787
  br label %11, !dbg !2787

11:                                               ; preds = %9, %6
  %12 = load float, ptr %2, align 4, !dbg !2788
  ret float %12, !dbg !2788
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__fizzer_model__strftime(ptr noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !2789 {
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
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2813, metadata !DIExpression()), !dbg !2814
  store i64 %1, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2815, metadata !DIExpression()), !dbg !2816
  store ptr %2, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2817, metadata !DIExpression()), !dbg !2818
  store ptr %3, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2819, metadata !DIExpression()), !dbg !2820
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2821, metadata !DIExpression()), !dbg !2822
  store i64 0, ptr %9, align 8, !dbg !2822
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2823, metadata !DIExpression()), !dbg !2824
  store i64 0, ptr %10, align 8, !dbg !2824
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2825, metadata !DIExpression()), !dbg !2826
  br label %19, !dbg !2827

19:                                               ; preds = %184, %4
  %20 = load ptr, ptr %7, align 8, !dbg !2828
  %21 = load i64, ptr %9, align 8, !dbg !2829
  %22 = getelementptr inbounds i8, ptr %20, i64 %21, !dbg !2828
  %23 = load i8, ptr %22, align 1, !dbg !2828
  %24 = sext i8 %23 to i32, !dbg !2828
  %25 = icmp ne i32 %24, 0, !dbg !2830
  br i1 %25, label %26, label %31, !dbg !2831

26:                                               ; preds = %19
  %27 = load i64, ptr %10, align 8, !dbg !2832
  %28 = load i64, ptr %6, align 8, !dbg !2833
  %29 = sub i64 %28, 1, !dbg !2834
  %30 = icmp ult i64 %27, %29, !dbg !2835
  br label %31

31:                                               ; preds = %26, %19
  %32 = phi i1 [ false, %19 ], [ %30, %26 ], !dbg !2836
  br i1 %32, label %33, label %185, !dbg !2827

33:                                               ; preds = %31
  %34 = load ptr, ptr %7, align 8, !dbg !2837
  %35 = load i64, ptr %9, align 8, !dbg !2840
  %36 = getelementptr inbounds i8, ptr %34, i64 %35, !dbg !2837
  %37 = load i8, ptr %36, align 1, !dbg !2837
  %38 = sext i8 %37 to i32, !dbg !2837
  %39 = icmp eq i32 %38, 37, !dbg !2841
  br i1 %39, label %40, label %172, !dbg !2842

40:                                               ; preds = %33
  %41 = load i64, ptr %9, align 8, !dbg !2843
  %42 = add i64 %41, 1, !dbg !2843
  store i64 %42, ptr %9, align 8, !dbg !2843
  %43 = load ptr, ptr %7, align 8, !dbg !2845
  %44 = load i64, ptr %9, align 8, !dbg !2847
  %45 = getelementptr inbounds i8, ptr %43, i64 %44, !dbg !2845
  %46 = load i8, ptr %45, align 1, !dbg !2845
  %47 = sext i8 %46 to i32, !dbg !2845
  %48 = icmp eq i32 %47, 0, !dbg !2848
  br i1 %48, label %49, label %50, !dbg !2849

49:                                               ; preds = %40
  br label %185, !dbg !2850

50:                                               ; preds = %40
  call void @llvm.dbg.declare(metadata ptr %12, metadata !2852, metadata !DIExpression()), !dbg !2853
  store i32 0, ptr %12, align 4, !dbg !2853
  %51 = load ptr, ptr %7, align 8, !dbg !2854
  %52 = load i64, ptr %9, align 8, !dbg !2856
  %53 = getelementptr inbounds i8, ptr %51, i64 %52, !dbg !2854
  %54 = load i8, ptr %53, align 1, !dbg !2854
  %55 = sext i8 %54 to i32, !dbg !2854
  %56 = icmp eq i32 %55, 89, !dbg !2857
  br i1 %56, label %57, label %64, !dbg !2858

57:                                               ; preds = %50
  call void @llvm.dbg.declare(metadata ptr %13, metadata !2859, metadata !DIExpression()), !dbg !2861
  %58 = load ptr, ptr %8, align 8, !dbg !2862
  %59 = getelementptr inbounds %struct.tm, ptr %58, i32 0, i32 5, !dbg !2863
  %60 = load i32, ptr %59, align 4, !dbg !2863
  %61 = add nsw i32 1900, %60, !dbg !2864
  store i32 %61, ptr %13, align 4, !dbg !2861
  %62 = load i32, ptr %13, align 4, !dbg !2865
  %63 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 0, !dbg !2866
  call void @__fizzer_model__helper_itoa(i32 noundef %62, ptr noundef %63, i32 noundef 10), !dbg !2867
  br label %142, !dbg !2868

64:                                               ; preds = %50
  %65 = load ptr, ptr %7, align 8, !dbg !2869
  %66 = load i64, ptr %9, align 8, !dbg !2871
  %67 = getelementptr inbounds i8, ptr %65, i64 %66, !dbg !2869
  %68 = load i8, ptr %67, align 1, !dbg !2869
  %69 = sext i8 %68 to i32, !dbg !2869
  %70 = icmp eq i32 %69, 109, !dbg !2872
  br i1 %70, label %71, label %78, !dbg !2873

71:                                               ; preds = %64
  call void @llvm.dbg.declare(metadata ptr %14, metadata !2874, metadata !DIExpression()), !dbg !2876
  %72 = load ptr, ptr %8, align 8, !dbg !2877
  %73 = getelementptr inbounds %struct.tm, ptr %72, i32 0, i32 4, !dbg !2878
  %74 = load i32, ptr %73, align 8, !dbg !2878
  %75 = add nsw i32 %74, 1, !dbg !2879
  store i32 %75, ptr %14, align 4, !dbg !2876
  %76 = load i32, ptr %14, align 4, !dbg !2880
  %77 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 0, !dbg !2881
  call void @__fizzer_model__helper_itoa(i32 noundef %76, ptr noundef %77, i32 noundef 10), !dbg !2882
  br label %141, !dbg !2883

78:                                               ; preds = %64
  %79 = load ptr, ptr %7, align 8, !dbg !2884
  %80 = load i64, ptr %9, align 8, !dbg !2886
  %81 = getelementptr inbounds i8, ptr %79, i64 %80, !dbg !2884
  %82 = load i8, ptr %81, align 1, !dbg !2884
  %83 = sext i8 %82 to i32, !dbg !2884
  %84 = icmp eq i32 %83, 100, !dbg !2887
  br i1 %84, label %85, label %91, !dbg !2888

85:                                               ; preds = %78
  call void @llvm.dbg.declare(metadata ptr %15, metadata !2889, metadata !DIExpression()), !dbg !2891
  %86 = load ptr, ptr %8, align 8, !dbg !2892
  %87 = getelementptr inbounds %struct.tm, ptr %86, i32 0, i32 3, !dbg !2893
  %88 = load i32, ptr %87, align 4, !dbg !2893
  store i32 %88, ptr %15, align 4, !dbg !2891
  %89 = load i32, ptr %15, align 4, !dbg !2894
  %90 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 0, !dbg !2895
  call void @__fizzer_model__helper_itoa(i32 noundef %89, ptr noundef %90, i32 noundef 10), !dbg !2896
  br label %140, !dbg !2897

91:                                               ; preds = %78
  %92 = load ptr, ptr %7, align 8, !dbg !2898
  %93 = load i64, ptr %9, align 8, !dbg !2900
  %94 = getelementptr inbounds i8, ptr %92, i64 %93, !dbg !2898
  %95 = load i8, ptr %94, align 1, !dbg !2898
  %96 = sext i8 %95 to i32, !dbg !2898
  %97 = icmp eq i32 %96, 72, !dbg !2901
  br i1 %97, label %98, label %104, !dbg !2902

98:                                               ; preds = %91
  call void @llvm.dbg.declare(metadata ptr %16, metadata !2903, metadata !DIExpression()), !dbg !2905
  %99 = load ptr, ptr %8, align 8, !dbg !2906
  %100 = getelementptr inbounds %struct.tm, ptr %99, i32 0, i32 2, !dbg !2907
  %101 = load i32, ptr %100, align 8, !dbg !2907
  store i32 %101, ptr %16, align 4, !dbg !2905
  %102 = load i32, ptr %16, align 4, !dbg !2908
  %103 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 0, !dbg !2909
  call void @__fizzer_model__helper_itoa(i32 noundef %102, ptr noundef %103, i32 noundef 10), !dbg !2910
  br label %139, !dbg !2911

104:                                              ; preds = %91
  %105 = load ptr, ptr %7, align 8, !dbg !2912
  %106 = load i64, ptr %9, align 8, !dbg !2914
  %107 = getelementptr inbounds i8, ptr %105, i64 %106, !dbg !2912
  %108 = load i8, ptr %107, align 1, !dbg !2912
  %109 = sext i8 %108 to i32, !dbg !2912
  %110 = icmp eq i32 %109, 77, !dbg !2915
  br i1 %110, label %111, label %117, !dbg !2916

111:                                              ; preds = %104
  call void @llvm.dbg.declare(metadata ptr %17, metadata !2917, metadata !DIExpression()), !dbg !2919
  %112 = load ptr, ptr %8, align 8, !dbg !2920
  %113 = getelementptr inbounds %struct.tm, ptr %112, i32 0, i32 1, !dbg !2921
  %114 = load i32, ptr %113, align 4, !dbg !2921
  store i32 %114, ptr %17, align 4, !dbg !2919
  %115 = load i32, ptr %17, align 4, !dbg !2922
  %116 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 0, !dbg !2923
  call void @__fizzer_model__helper_itoa(i32 noundef %115, ptr noundef %116, i32 noundef 10), !dbg !2924
  br label %138, !dbg !2925

117:                                              ; preds = %104
  %118 = load ptr, ptr %7, align 8, !dbg !2926
  %119 = load i64, ptr %9, align 8, !dbg !2928
  %120 = getelementptr inbounds i8, ptr %118, i64 %119, !dbg !2926
  %121 = load i8, ptr %120, align 1, !dbg !2926
  %122 = sext i8 %121 to i32, !dbg !2926
  %123 = icmp eq i32 %122, 83, !dbg !2929
  br i1 %123, label %124, label %130, !dbg !2930

124:                                              ; preds = %117
  call void @llvm.dbg.declare(metadata ptr %18, metadata !2931, metadata !DIExpression()), !dbg !2933
  %125 = load ptr, ptr %8, align 8, !dbg !2934
  %126 = getelementptr inbounds %struct.tm, ptr %125, i32 0, i32 0, !dbg !2935
  %127 = load i32, ptr %126, align 8, !dbg !2935
  store i32 %127, ptr %18, align 4, !dbg !2933
  %128 = load i32, ptr %18, align 4, !dbg !2936
  %129 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 0, !dbg !2937
  call void @__fizzer_model__helper_itoa(i32 noundef %128, ptr noundef %129, i32 noundef 10), !dbg !2938
  br label %137, !dbg !2939

130:                                              ; preds = %117
  %131 = load ptr, ptr %7, align 8, !dbg !2940
  %132 = load i64, ptr %9, align 8, !dbg !2942
  %133 = getelementptr inbounds i8, ptr %131, i64 %132, !dbg !2940
  %134 = load i8, ptr %133, align 1, !dbg !2940
  %135 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 0, !dbg !2943
  store i8 %134, ptr %135, align 16, !dbg !2944
  %136 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 1, !dbg !2945
  store i8 0, ptr %136, align 1, !dbg !2946
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
  store i32 0, ptr %12, align 4, !dbg !2947
  br label %143, !dbg !2948

143:                                              ; preds = %157, %142
  %144 = load i32, ptr %12, align 4, !dbg !2949
  %145 = sext i32 %144 to i64, !dbg !2950
  %146 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 %145, !dbg !2950
  %147 = load i8, ptr %146, align 1, !dbg !2950
  %148 = sext i8 %147 to i32, !dbg !2950
  %149 = icmp ne i32 %148, 0, !dbg !2951
  br i1 %149, label %150, label %155, !dbg !2952

150:                                              ; preds = %143
  %151 = load i64, ptr %10, align 8, !dbg !2953
  %152 = load i64, ptr %6, align 8, !dbg !2954
  %153 = sub i64 %152, 1, !dbg !2955
  %154 = icmp ult i64 %151, %153, !dbg !2956
  br label %155

155:                                              ; preds = %150, %143
  %156 = phi i1 [ false, %143 ], [ %154, %150 ], !dbg !2957
  br i1 %156, label %157, label %169, !dbg !2948

157:                                              ; preds = %155
  %158 = load i32, ptr %12, align 4, !dbg !2958
  %159 = sext i32 %158 to i64, !dbg !2960
  %160 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 %159, !dbg !2960
  %161 = load i8, ptr %160, align 1, !dbg !2960
  %162 = load ptr, ptr %5, align 8, !dbg !2961
  %163 = load i64, ptr %10, align 8, !dbg !2962
  %164 = getelementptr inbounds i8, ptr %162, i64 %163, !dbg !2961
  store i8 %161, ptr %164, align 1, !dbg !2963
  %165 = load i64, ptr %10, align 8, !dbg !2964
  %166 = add i64 %165, 1, !dbg !2964
  store i64 %166, ptr %10, align 8, !dbg !2964
  %167 = load i32, ptr %12, align 4, !dbg !2965
  %168 = add nsw i32 %167, 1, !dbg !2965
  store i32 %168, ptr %12, align 4, !dbg !2965
  br label %143, !dbg !2948, !llvm.loop !2966

169:                                              ; preds = %155
  %170 = load i64, ptr %9, align 8, !dbg !2968
  %171 = add i64 %170, 1, !dbg !2968
  store i64 %171, ptr %9, align 8, !dbg !2968
  br label %184, !dbg !2969

172:                                              ; preds = %33
  %173 = load ptr, ptr %7, align 8, !dbg !2970
  %174 = load i64, ptr %9, align 8, !dbg !2972
  %175 = getelementptr inbounds i8, ptr %173, i64 %174, !dbg !2970
  %176 = load i8, ptr %175, align 1, !dbg !2970
  %177 = load ptr, ptr %5, align 8, !dbg !2973
  %178 = load i64, ptr %10, align 8, !dbg !2974
  %179 = getelementptr inbounds i8, ptr %177, i64 %178, !dbg !2973
  store i8 %176, ptr %179, align 1, !dbg !2975
  %180 = load i64, ptr %9, align 8, !dbg !2976
  %181 = add i64 %180, 1, !dbg !2976
  store i64 %181, ptr %9, align 8, !dbg !2976
  %182 = load i64, ptr %10, align 8, !dbg !2977
  %183 = add i64 %182, 1, !dbg !2977
  store i64 %183, ptr %10, align 8, !dbg !2977
  br label %184

184:                                              ; preds = %172, %169
  br label %19, !dbg !2827, !llvm.loop !2978

185:                                              ; preds = %49, %31
  %186 = load ptr, ptr %5, align 8, !dbg !2980
  %187 = load i64, ptr %10, align 8, !dbg !2981
  %188 = getelementptr inbounds i8, ptr %186, i64 %187, !dbg !2980
  store i8 0, ptr %188, align 1, !dbg !2982
  %189 = load i64, ptr %10, align 8, !dbg !2983
  ret i64 %189, !dbg !2984
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @__fizzer_model__ctime(ptr noundef %0, ptr noundef %1) #0 !dbg !2985 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca [26 x i8], align 16
  %6 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2993, metadata !DIExpression()), !dbg !2994
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2995, metadata !DIExpression()), !dbg !2996
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2997, metadata !DIExpression()), !dbg !2999
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %5, ptr align 16 @__const.__fizzer_model__ctime.template, i64 26, i1 false), !dbg !2999
  call void @llvm.dbg.declare(metadata ptr %6, metadata !3000, metadata !DIExpression()), !dbg !3002
  store i64 0, ptr %6, align 8, !dbg !3002
  br label %7, !dbg !3003

7:                                                ; preds = %13, %2
  %8 = load i64, ptr %6, align 8, !dbg !3004
  %9 = getelementptr inbounds [26 x i8], ptr %5, i64 0, i64 %8, !dbg !3005
  %10 = load i8, ptr %9, align 1, !dbg !3005
  %11 = sext i8 %10 to i32, !dbg !3005
  %12 = icmp ne i32 %11, 0, !dbg !3006
  br i1 %12, label %13, label %22, !dbg !3003

13:                                               ; preds = %7
  %14 = load i64, ptr %6, align 8, !dbg !3007
  %15 = getelementptr inbounds [26 x i8], ptr %5, i64 0, i64 %14, !dbg !3009
  %16 = load i8, ptr %15, align 1, !dbg !3009
  %17 = load ptr, ptr %4, align 8, !dbg !3010
  %18 = load i64, ptr %6, align 8, !dbg !3011
  %19 = getelementptr inbounds i8, ptr %17, i64 %18, !dbg !3010
  store i8 %16, ptr %19, align 1, !dbg !3012
  %20 = load i64, ptr %6, align 8, !dbg !3013
  %21 = add i64 %20, 1, !dbg !3013
  store i64 %21, ptr %6, align 8, !dbg !3013
  br label %7, !dbg !3003, !llvm.loop !3014

22:                                               ; preds = %7
  %23 = load ptr, ptr %4, align 8, !dbg !3016
  %24 = load i64, ptr %6, align 8, !dbg !3017
  %25 = getelementptr inbounds i8, ptr %23, i64 %24, !dbg !3016
  store i8 0, ptr %25, align 1, !dbg !3018
  %26 = load ptr, ptr %4, align 8, !dbg !3019
  ret ptr %26, !dbg !3020
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind willreturn }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.dbg.cu = !{!78, !2, !83, !9, !86, !17, !23, !88, !90, !94, !96, !98, !100, !103, !105, !107, !109, !111, !113, !115, !117, !119, !122, !124, !127, !130, !132, !134, !136, !33, !138, !144, !75, !146, !148, !150, !152, !154, !156, !158, !160, !162, !164, !166, !168, !170, !172, !174, !176, !178, !181, !183, !185, !187, !189, !191, !193}
!llvm.module.flags = !{!195, !196, !197, !198, !199, !200, !201}
!llvm.ident = !{!202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202, !202}

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
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
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
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!75 = distinct !DICompileUnit(language: DW_LANG_C11, file: !76, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !77, splitDebugInlining: false, nameTableKind: None)
!76 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/std/string/strtok.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "d6aa346c784ed4f2c46282113e65161d")
!77 = !{!67}
!78 = distinct !DICompileUnit(language: DW_LANG_C11, file: !79, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !80, splitDebugInlining: false, nameTableKind: None)
!79 = !DIFile(filename: "/home/marek/root/fizzer/dist/data/models/c/testcomp/nondet.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "949c31f0da7b279f40bfbf3ec7cfdee3")
!80 = !{!81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
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
!141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !142, size: 64)
!142 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !82)
!143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
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
!195 = !{i32 7, !"Dwarf Version", i32 5}
!196 = !{i32 2, !"Debug Info Version", i32 3}
!197 = !{i32 1, !"wchar_size", i32 4}
!198 = !{i32 8, !"PIC Level", i32 2}
!199 = !{i32 7, !"PIE Level", i32 2}
!200 = !{i32 7, !"uwtable", i32 2}
!201 = !{i32 7, !"frame-pointer", i32 2}
!202 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!203 = distinct !DISubprogram(name: "__fizzer_model____VERIFIER_nondet_memory", scope: !204, file: !204, line: 4, type: !205, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !78, retainedNodes: !63)
!204 = !DIFile(filename: "data/models/c/testcomp/nondet.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "949c31f0da7b279f40bfbf3ec7cfdee3")
!205 = !DISubroutineType(types: !206)
!206 = !{null, !143, !207}
!207 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !208, line: 6, baseType: !209)
!208 = !DIFile(filename: "data/models/c/testcomp/nondet.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "fd37181ed1f1cdda8e171f77fdc042bf")
!209 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!210 = !DILocalVariable(name: "mem", arg: 1, scope: !203, file: !204, line: 4, type: !143)
!211 = !DILocation(line: 4, column: 53, scope: !203)
!212 = !DILocalVariable(name: "size", arg: 2, scope: !203, file: !204, line: 4, type: !207)
!213 = !DILocation(line: 4, column: 65, scope: !203)
!214 = !DILocalVariable(name: "p", scope: !203, file: !204, line: 6, type: !81)
!215 = !DILocation(line: 6, column: 20, scope: !203)
!216 = !DILocation(line: 6, column: 40, scope: !203)
!217 = !DILocalVariable(name: "e", scope: !203, file: !204, line: 7, type: !81)
!218 = !DILocation(line: 7, column: 20, scope: !203)
!219 = !DILocation(line: 7, column: 24, scope: !203)
!220 = !DILocation(line: 7, column: 28, scope: !203)
!221 = !DILocation(line: 7, column: 26, scope: !203)
!222 = !DILocation(line: 8, column: 5, scope: !203)
!223 = !DILocation(line: 8, column: 13, scope: !224)
!224 = distinct !DILexicalBlock(scope: !225, file: !204, line: 8, column: 5)
!225 = distinct !DILexicalBlock(scope: !203, file: !204, line: 8, column: 5)
!226 = !DILocation(line: 8, column: 18, scope: !224)
!227 = !DILocation(line: 8, column: 15, scope: !224)
!228 = !DILocation(line: 8, column: 5, scope: !225)
!229 = !DILocation(line: 9, column: 14, scope: !224)
!230 = !DILocation(line: 9, column: 10, scope: !224)
!231 = !DILocation(line: 9, column: 12, scope: !224)
!232 = !DILocation(line: 9, column: 9, scope: !224)
!233 = !DILocation(line: 8, column: 21, scope: !224)
!234 = !DILocation(line: 8, column: 5, scope: !224)
!235 = distinct !{!235, !228, !236, !237}
!236 = !DILocation(line: 9, column: 38, scope: !225)
!237 = !{!"llvm.loop.mustprogress"}
!238 = !DILocation(line: 10, column: 1, scope: !203)
!239 = distinct !DISubprogram(name: "__fizzer_model__getopt_long", scope: !240, file: !240, line: 3, type: !241, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !63)
!240 = !DIFile(filename: "data/models/c/posix/getopt_long.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "de123133f6a530da5006cce09eb75639")
!241 = !DISubroutineType(types: !242)
!242 = !{!6, !6, !243, !73, !245, !253}
!243 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !244, size: 64)
!244 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!245 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !246, size: 64)
!246 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !247)
!247 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "option", file: !248, line: 50, size: 256, elements: !249)
!248 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/getopt_ext.h", directory: "", checksumkind: CSK_MD5, checksum: "3b9516601798e99ca8a1ad9f5208e7ec")
!249 = !{!250, !251, !252, !254}
!250 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !247, file: !248, line: 52, baseType: !73, size: 64)
!251 = !DIDerivedType(tag: DW_TAG_member, name: "has_arg", scope: !247, file: !248, line: 55, baseType: !6, size: 32, offset: 64)
!252 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !247, file: !248, line: 56, baseType: !253, size: 64, offset: 128)
!253 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!254 = !DIDerivedType(tag: DW_TAG_member, name: "val", scope: !247, file: !248, line: 57, baseType: !6, size: 32, offset: 192)
!255 = !DILocalVariable(name: "argc", arg: 1, scope: !239, file: !240, line: 3, type: !6)
!256 = !DILocation(line: 3, column: 37, scope: !239)
!257 = !DILocalVariable(name: "argv", arg: 2, scope: !239, file: !240, line: 3, type: !243)
!258 = !DILocation(line: 3, column: 56, scope: !239)
!259 = !DILocalVariable(name: "optstring", arg: 3, scope: !239, file: !240, line: 3, type: !73)
!260 = !DILocation(line: 3, column: 76, scope: !239)
!261 = !DILocalVariable(name: "longopts", arg: 4, scope: !239, file: !240, line: 4, type: !245)
!262 = !DILocation(line: 4, column: 54, scope: !239)
!263 = !DILocalVariable(name: "longindex", arg: 5, scope: !239, file: !240, line: 4, type: !253)
!264 = !DILocation(line: 4, column: 69, scope: !239)
!265 = !DILocation(line: 6, column: 9, scope: !266)
!266 = distinct !DILexicalBlock(scope: !239, file: !240, line: 6, column: 9)
!267 = !DILocation(line: 6, column: 35, scope: !266)
!268 = !DILocation(line: 6, column: 32, scope: !266)
!269 = !DILocation(line: 6, column: 9, scope: !239)
!270 = !DILocation(line: 8, column: 9, scope: !271)
!271 = distinct !DILexicalBlock(scope: !266, file: !240, line: 7, column: 5)
!272 = !DILocalVariable(name: "current", scope: !239, file: !240, line: 11, type: !13)
!273 = !DILocation(line: 11, column: 11, scope: !239)
!274 = !DILocation(line: 11, column: 21, scope: !239)
!275 = !DILocation(line: 11, column: 26, scope: !239)
!276 = !DILocation(line: 13, column: 9, scope: !277)
!277 = distinct !DILexicalBlock(scope: !239, file: !240, line: 13, column: 9)
!278 = !DILocation(line: 13, column: 20, scope: !277)
!279 = !DILocation(line: 13, column: 27, scope: !277)
!280 = !DILocation(line: 13, column: 30, scope: !277)
!281 = !DILocation(line: 13, column: 41, scope: !277)
!282 = !DILocation(line: 13, column: 9, scope: !239)
!283 = !DILocation(line: 15, column: 39, scope: !284)
!284 = distinct !DILexicalBlock(scope: !277, file: !240, line: 14, column: 5)
!285 = !DILocation(line: 15, column: 45, scope: !284)
!286 = !DILocation(line: 15, column: 51, scope: !284)
!287 = !DILocation(line: 15, column: 16, scope: !284)
!288 = !DILocation(line: 15, column: 9, scope: !284)
!289 = !DILocalVariable(name: "i", scope: !239, file: !240, line: 18, type: !290)
!290 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !291, line: 6, baseType: !209)
!291 = !DIFile(filename: "data/models/c/posix/getopt_long.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "df33a0efdb11040b8d720c7550c383ff")
!292 = !DILocation(line: 18, column: 12, scope: !239)
!293 = !DILocation(line: 19, column: 5, scope: !239)
!294 = !DILocation(line: 19, column: 12, scope: !239)
!295 = !DILocation(line: 19, column: 21, scope: !239)
!296 = !DILocation(line: 19, column: 24, scope: !239)
!297 = !DILocation(line: 19, column: 29, scope: !239)
!298 = !DILocalVariable(name: "j", scope: !299, file: !240, line: 21, type: !290)
!299 = distinct !DILexicalBlock(scope: !239, file: !240, line: 20, column: 5)
!300 = !DILocation(line: 21, column: 16, scope: !299)
!301 = !DILocalVariable(name: "match", scope: !299, file: !240, line: 22, type: !6)
!302 = !DILocation(line: 22, column: 13, scope: !299)
!303 = !DILocation(line: 24, column: 9, scope: !299)
!304 = !DILocation(line: 24, column: 16, scope: !299)
!305 = !DILocation(line: 24, column: 25, scope: !299)
!306 = !DILocation(line: 24, column: 28, scope: !299)
!307 = !DILocation(line: 24, column: 33, scope: !299)
!308 = !DILocation(line: 24, column: 36, scope: !299)
!309 = !DILocation(line: 24, column: 41, scope: !299)
!310 = !DILocation(line: 24, column: 44, scope: !299)
!311 = !DILocation(line: 24, column: 56, scope: !299)
!312 = !DILocation(line: 24, column: 54, scope: !299)
!313 = !DILocation(line: 24, column: 59, scope: !299)
!314 = !DILocation(line: 0, scope: !299)
!315 = !DILocation(line: 26, column: 17, scope: !316)
!316 = distinct !DILexicalBlock(scope: !317, file: !240, line: 26, column: 17)
!317 = distinct !DILexicalBlock(scope: !299, file: !240, line: 25, column: 9)
!318 = !DILocation(line: 26, column: 26, scope: !316)
!319 = !DILocation(line: 26, column: 29, scope: !316)
!320 = !DILocation(line: 26, column: 34, scope: !316)
!321 = !DILocation(line: 26, column: 40, scope: !316)
!322 = !DILocation(line: 26, column: 52, scope: !316)
!323 = !DILocation(line: 26, column: 50, scope: !316)
!324 = !DILocation(line: 26, column: 37, scope: !316)
!325 = !DILocation(line: 26, column: 17, scope: !317)
!326 = !DILocation(line: 28, column: 23, scope: !327)
!327 = distinct !DILexicalBlock(scope: !316, file: !240, line: 27, column: 13)
!328 = !DILocation(line: 29, column: 17, scope: !327)
!329 = !DILocation(line: 31, column: 14, scope: !317)
!330 = distinct !{!330, !303, !331, !237}
!331 = !DILocation(line: 32, column: 9, scope: !299)
!332 = !DILocation(line: 34, column: 13, scope: !333)
!333 = distinct !DILexicalBlock(scope: !299, file: !240, line: 34, column: 13)
!334 = !DILocation(line: 34, column: 19, scope: !333)
!335 = !DILocation(line: 34, column: 22, scope: !333)
!336 = !DILocation(line: 34, column: 31, scope: !333)
!337 = !DILocation(line: 34, column: 34, scope: !333)
!338 = !DILocation(line: 34, column: 39, scope: !333)
!339 = !DILocation(line: 34, column: 42, scope: !333)
!340 = !DILocation(line: 34, column: 47, scope: !333)
!341 = !DILocation(line: 34, column: 50, scope: !333)
!342 = !DILocation(line: 34, column: 62, scope: !333)
!343 = !DILocation(line: 34, column: 60, scope: !333)
!344 = !DILocation(line: 34, column: 65, scope: !333)
!345 = !DILocation(line: 34, column: 13, scope: !299)
!346 = !DILocation(line: 36, column: 17, scope: !347)
!347 = distinct !DILexicalBlock(scope: !348, file: !240, line: 36, column: 17)
!348 = distinct !DILexicalBlock(scope: !333, file: !240, line: 35, column: 9)
!349 = !DILocation(line: 36, column: 27, scope: !347)
!350 = !DILocation(line: 36, column: 17, scope: !348)
!351 = !DILocation(line: 38, column: 35, scope: !352)
!352 = distinct !DILexicalBlock(scope: !347, file: !240, line: 37, column: 13)
!353 = !DILocation(line: 38, column: 30, scope: !352)
!354 = !DILocation(line: 38, column: 18, scope: !352)
!355 = !DILocation(line: 38, column: 28, scope: !352)
!356 = !DILocation(line: 39, column: 13, scope: !352)
!357 = !DILocation(line: 41, column: 17, scope: !358)
!358 = distinct !DILexicalBlock(scope: !348, file: !240, line: 41, column: 17)
!359 = !DILocation(line: 41, column: 26, scope: !358)
!360 = !DILocation(line: 41, column: 29, scope: !358)
!361 = !DILocation(line: 41, column: 37, scope: !358)
!362 = !DILocation(line: 41, column: 17, scope: !348)
!363 = !DILocation(line: 43, column: 21, scope: !364)
!364 = distinct !DILexicalBlock(scope: !365, file: !240, line: 43, column: 21)
!365 = distinct !DILexicalBlock(scope: !358, file: !240, line: 42, column: 13)
!366 = !DILocation(line: 43, column: 44, scope: !364)
!367 = !DILocation(line: 43, column: 50, scope: !364)
!368 = !DILocation(line: 43, column: 48, scope: !364)
!369 = !DILocation(line: 43, column: 21, scope: !365)
!370 = !DILocation(line: 45, column: 46, scope: !371)
!371 = distinct !DILexicalBlock(scope: !364, file: !240, line: 44, column: 17)
!372 = !DILocation(line: 45, column: 51, scope: !371)
!373 = !DILocation(line: 45, column: 74, scope: !371)
!374 = !DILocation(line: 45, column: 44, scope: !371)
!375 = !DILocation(line: 46, column: 44, scope: !371)
!376 = !DILocation(line: 47, column: 17, scope: !371)
!377 = !DILocation(line: 50, column: 44, scope: !378)
!378 = distinct !DILexicalBlock(scope: !364, file: !240, line: 49, column: 17)
!379 = !DILocation(line: 51, column: 43, scope: !378)
!380 = !DILocation(line: 53, column: 13, scope: !365)
!381 = !DILocation(line: 56, column: 40, scope: !382)
!382 = distinct !DILexicalBlock(scope: !358, file: !240, line: 55, column: 13)
!383 = !DILocation(line: 57, column: 39, scope: !382)
!384 = !DILocation(line: 60, column: 17, scope: !385)
!385 = distinct !DILexicalBlock(scope: !348, file: !240, line: 60, column: 17)
!386 = !DILocation(line: 60, column: 26, scope: !385)
!387 = !DILocation(line: 60, column: 29, scope: !385)
!388 = !DILocation(line: 60, column: 34, scope: !385)
!389 = !DILocation(line: 60, column: 17, scope: !348)
!390 = !DILocation(line: 62, column: 37, scope: !391)
!391 = distinct !DILexicalBlock(scope: !385, file: !240, line: 61, column: 13)
!392 = !DILocation(line: 62, column: 46, scope: !391)
!393 = !DILocation(line: 62, column: 49, scope: !391)
!394 = !DILocation(line: 62, column: 18, scope: !391)
!395 = !DILocation(line: 62, column: 27, scope: !391)
!396 = !DILocation(line: 62, column: 30, scope: !391)
!397 = !DILocation(line: 62, column: 35, scope: !391)
!398 = !DILocation(line: 63, column: 17, scope: !391)
!399 = !DILocation(line: 66, column: 20, scope: !348)
!400 = !DILocation(line: 66, column: 29, scope: !348)
!401 = !DILocation(line: 66, column: 32, scope: !348)
!402 = !DILocation(line: 66, column: 13, scope: !348)
!403 = !DILocation(line: 69, column: 10, scope: !299)
!404 = distinct !{!404, !293, !405, !237}
!405 = !DILocation(line: 70, column: 5, scope: !239)
!406 = !DILocation(line: 72, column: 27, scope: !239)
!407 = !DILocation(line: 73, column: 5, scope: !239)
!408 = !DILocation(line: 74, column: 1, scope: !239)
!409 = distinct !DISubprogram(name: "__fizzer_model__getopt", scope: !410, file: !410, line: 2, type: !411, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !86, retainedNodes: !63)
!410 = !DIFile(filename: "data/models/c/posix/getopt.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "f654b476831f33a28b3fae574c027426")
!411 = !DISubroutineType(types: !412)
!412 = !{!6, !6, !243, !73}
!413 = !DILocalVariable(name: "argc", arg: 1, scope: !409, file: !410, line: 2, type: !6)
!414 = !DILocation(line: 2, column: 32, scope: !409)
!415 = !DILocalVariable(name: "argv", arg: 2, scope: !409, file: !410, line: 2, type: !243)
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
!443 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !444, line: 6, baseType: !209)
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
!463 = distinct !{!463, !448, !464, !237}
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
!529 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !530, line: 6, baseType: !209)
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
!543 = distinct !{!543, !532, !544, !237}
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
!580 = distinct !{!580, !562, !581, !237}
!581 = !DILocation(line: 27, column: 5, scope: !517)
!582 = !DILocation(line: 29, column: 12, scope: !517)
!583 = !DILocation(line: 29, column: 19, scope: !517)
!584 = !DILocation(line: 29, column: 17, scope: !517)
!585 = !DILocation(line: 29, column: 5, scope: !517)
!586 = distinct !DISubprogram(name: "__fizzer_model__strtod", scope: !587, file: !587, line: 2, type: !588, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !90, retainedNodes: !63)
!587 = !DIFile(filename: "data/models/c/std/stdlib/strtod.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "8af3db33fabf3d592277f51247d76438")
!588 = !DISubroutineType(types: !589)
!589 = !{!93, !73, !590}
!590 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
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
!608 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !609, line: 6, baseType: !209)
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
!622 = distinct !{!622, !611, !623, !237}
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
!658 = distinct !{!658, !641, !659, !237}
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
!688 = distinct !{!688, !667, !689, !237}
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
!744 = distinct !{!744, !726, !745, !237}
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
!776 = distinct !{!776, !768, !777, !237}
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
!817 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
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
!861 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !862, line: 6, baseType: !209)
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
!890 = distinct !{!890, !879, !891, !237}
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
!926 = !DILocation(line: 37, column: 32, scope: !921)
!927 = !DILocation(line: 37, column: 30, scope: !921)
!928 = !DILocation(line: 37, column: 16, scope: !921)
!929 = !DILocation(line: 38, column: 10, scope: !921)
!930 = distinct !{!930, !912, !931, !237}
!931 = !DILocation(line: 39, column: 5, scope: !846)
!932 = !DILocation(line: 41, column: 9, scope: !933)
!933 = distinct !DILexicalBlock(scope: !846, file: !847, line: 41, column: 9)
!934 = !DILocation(line: 41, column: 16, scope: !933)
!935 = !DILocation(line: 41, column: 9, scope: !846)
!936 = !DILocation(line: 43, column: 28, scope: !937)
!937 = distinct !DILexicalBlock(scope: !933, file: !847, line: 42, column: 5)
!938 = !DILocation(line: 43, column: 35, scope: !937)
!939 = !DILocation(line: 43, column: 33, scope: !937)
!940 = !DILocation(line: 43, column: 10, scope: !937)
!941 = !DILocation(line: 43, column: 17, scope: !937)
!942 = !DILocation(line: 44, column: 5, scope: !937)
!943 = !DILocation(line: 46, column: 12, scope: !846)
!944 = !DILocation(line: 46, column: 19, scope: !846)
!945 = !DILocation(line: 46, column: 17, scope: !846)
!946 = !DILocation(line: 46, column: 5, scope: !846)
!947 = !DILocation(line: 47, column: 1, scope: !846)
!948 = distinct !DISubprogram(name: "__fizzer_model__atol", scope: !949, file: !949, line: 2, type: !950, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !103, retainedNodes: !63)
!949 = !DIFile(filename: "data/models/c/std/stdlib/atol.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "130864a3e56f877c17dbd6cd172158db")
!950 = !DISubroutineType(types: !951)
!951 = !{!817, !73}
!952 = !DILocalVariable(name: "nptr", arg: 1, scope: !948, file: !949, line: 2, type: !73)
!953 = !DILocation(line: 2, column: 39, scope: !948)
!954 = !DILocalVariable(name: "result", scope: !948, file: !949, line: 4, type: !817)
!955 = !DILocation(line: 4, column: 10, scope: !948)
!956 = !DILocalVariable(name: "sign", scope: !948, file: !949, line: 5, type: !6)
!957 = !DILocation(line: 5, column: 9, scope: !948)
!958 = !DILocalVariable(name: "i", scope: !948, file: !949, line: 6, type: !959)
!959 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !960, line: 6, baseType: !209)
!960 = !DIFile(filename: "data/models/c/std/stdlib/atol.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "1fd40bbb4fabb448cf5666fb2ad7f378")
!961 = !DILocation(line: 6, column: 12, scope: !948)
!962 = !DILocation(line: 8, column: 5, scope: !948)
!963 = !DILocation(line: 8, column: 12, scope: !948)
!964 = !DILocation(line: 8, column: 17, scope: !948)
!965 = !DILocation(line: 8, column: 20, scope: !948)
!966 = !DILocation(line: 8, column: 25, scope: !948)
!967 = !DILocation(line: 8, column: 52, scope: !948)
!968 = !DILocation(line: 8, column: 57, scope: !948)
!969 = !DILocation(line: 8, column: 28, scope: !948)
!970 = !DILocation(line: 0, scope: !948)
!971 = !DILocation(line: 10, column: 10, scope: !972)
!972 = distinct !DILexicalBlock(scope: !948, file: !949, line: 9, column: 5)
!973 = distinct !{!973, !962, !974, !237}
!974 = !DILocation(line: 11, column: 5, scope: !948)
!975 = !DILocation(line: 13, column: 9, scope: !976)
!976 = distinct !DILexicalBlock(scope: !948, file: !949, line: 13, column: 9)
!977 = !DILocation(line: 13, column: 14, scope: !976)
!978 = !DILocation(line: 13, column: 17, scope: !976)
!979 = !DILocation(line: 13, column: 9, scope: !948)
!980 = !DILocation(line: 15, column: 10, scope: !981)
!981 = distinct !DILexicalBlock(scope: !976, file: !949, line: 14, column: 5)
!982 = !DILocation(line: 16, column: 5, scope: !981)
!983 = !DILocation(line: 17, column: 14, scope: !984)
!984 = distinct !DILexicalBlock(scope: !976, file: !949, line: 17, column: 14)
!985 = !DILocation(line: 17, column: 19, scope: !984)
!986 = !DILocation(line: 17, column: 22, scope: !984)
!987 = !DILocation(line: 17, column: 14, scope: !976)
!988 = !DILocation(line: 19, column: 14, scope: !989)
!989 = distinct !DILexicalBlock(scope: !984, file: !949, line: 18, column: 5)
!990 = !DILocation(line: 20, column: 10, scope: !989)
!991 = !DILocation(line: 21, column: 5, scope: !989)
!992 = !DILocation(line: 23, column: 5, scope: !948)
!993 = !DILocation(line: 23, column: 12, scope: !948)
!994 = !DILocation(line: 23, column: 17, scope: !948)
!995 = !DILocation(line: 23, column: 20, scope: !948)
!996 = !DILocation(line: 23, column: 25, scope: !948)
!997 = !DILocation(line: 23, column: 52, scope: !948)
!998 = !DILocation(line: 23, column: 57, scope: !948)
!999 = !DILocation(line: 23, column: 28, scope: !948)
!1000 = !DILocation(line: 25, column: 18, scope: !1001)
!1001 = distinct !DILexicalBlock(scope: !948, file: !949, line: 24, column: 5)
!1002 = !DILocation(line: 25, column: 25, scope: !1001)
!1003 = !DILocation(line: 25, column: 33, scope: !1001)
!1004 = !DILocation(line: 25, column: 38, scope: !1001)
!1005 = !DILocation(line: 25, column: 41, scope: !1001)
!1006 = !DILocation(line: 25, column: 32, scope: !1001)
!1007 = !DILocation(line: 25, column: 30, scope: !1001)
!1008 = !DILocation(line: 25, column: 16, scope: !1001)
!1009 = !DILocation(line: 26, column: 10, scope: !1001)
!1010 = distinct !{!1010, !992, !1011, !237}
!1011 = !DILocation(line: 27, column: 5, scope: !948)
!1012 = !DILocation(line: 29, column: 12, scope: !948)
!1013 = !DILocation(line: 29, column: 19, scope: !948)
!1014 = !DILocation(line: 29, column: 17, scope: !948)
!1015 = !DILocation(line: 29, column: 5, scope: !948)
!1016 = distinct !DISubprogram(name: "__fizzer_model__strtoul", scope: !1017, file: !1017, line: 2, type: !1018, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !105, retainedNodes: !63)
!1017 = !DIFile(filename: "data/models/c/std/stdlib/strtoul.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "edaf3dbca4ae2e5ae7dd393d65e176da")
!1018 = !DISubroutineType(types: !1019)
!1019 = !{!209, !73, !590, !6}
!1020 = !DILocalVariable(name: "nptr", arg: 1, scope: !1016, file: !1017, line: 2, type: !73)
!1021 = !DILocation(line: 2, column: 51, scope: !1016)
!1022 = !DILocalVariable(name: "endptr", arg: 2, scope: !1016, file: !1017, line: 2, type: !590)
!1023 = !DILocation(line: 2, column: 64, scope: !1016)
!1024 = !DILocalVariable(name: "base", arg: 3, scope: !1016, file: !1017, line: 2, type: !6)
!1025 = !DILocation(line: 2, column: 76, scope: !1016)
!1026 = !DILocalVariable(name: "result", scope: !1016, file: !1017, line: 4, type: !209)
!1027 = !DILocation(line: 4, column: 19, scope: !1016)
!1028 = !DILocalVariable(name: "i", scope: !1016, file: !1017, line: 5, type: !1029)
!1029 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1030, line: 6, baseType: !209)
!1030 = !DIFile(filename: "data/models/c/std/stdlib/strtoul.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "34874f151f8ea8334fcbf34c096cdb20")
!1031 = !DILocation(line: 5, column: 12, scope: !1016)
!1032 = !DILocation(line: 7, column: 9, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1016, file: !1017, line: 7, column: 9)
!1034 = !DILocation(line: 7, column: 14, scope: !1033)
!1035 = !DILocation(line: 7, column: 9, scope: !1016)
!1036 = !DILocation(line: 9, column: 13, scope: !1037)
!1037 = distinct !DILexicalBlock(scope: !1038, file: !1017, line: 9, column: 13)
!1038 = distinct !DILexicalBlock(scope: !1033, file: !1017, line: 8, column: 5)
!1039 = !DILocation(line: 9, column: 20, scope: !1037)
!1040 = !DILocation(line: 9, column: 13, scope: !1038)
!1041 = !DILocation(line: 11, column: 31, scope: !1042)
!1042 = distinct !DILexicalBlock(scope: !1037, file: !1017, line: 10, column: 9)
!1043 = !DILocation(line: 11, column: 14, scope: !1042)
!1044 = !DILocation(line: 11, column: 21, scope: !1042)
!1045 = !DILocation(line: 12, column: 9, scope: !1042)
!1046 = !DILocation(line: 13, column: 9, scope: !1038)
!1047 = !DILocation(line: 16, column: 5, scope: !1016)
!1048 = !DILocation(line: 16, column: 12, scope: !1016)
!1049 = !DILocation(line: 16, column: 17, scope: !1016)
!1050 = !DILocation(line: 16, column: 20, scope: !1016)
!1051 = !DILocation(line: 16, column: 25, scope: !1016)
!1052 = !DILocation(line: 16, column: 52, scope: !1016)
!1053 = !DILocation(line: 16, column: 57, scope: !1016)
!1054 = !DILocation(line: 16, column: 28, scope: !1016)
!1055 = !DILocation(line: 0, scope: !1016)
!1056 = !DILocation(line: 18, column: 10, scope: !1057)
!1057 = distinct !DILexicalBlock(scope: !1016, file: !1017, line: 17, column: 5)
!1058 = distinct !{!1058, !1047, !1059, !237}
!1059 = !DILocation(line: 19, column: 5, scope: !1016)
!1060 = !DILocation(line: 22, column: 9, scope: !1061)
!1061 = distinct !DILexicalBlock(scope: !1016, file: !1017, line: 22, column: 9)
!1062 = !DILocation(line: 22, column: 14, scope: !1061)
!1063 = !DILocation(line: 22, column: 17, scope: !1061)
!1064 = !DILocation(line: 22, column: 9, scope: !1016)
!1065 = !DILocation(line: 24, column: 10, scope: !1066)
!1066 = distinct !DILexicalBlock(scope: !1061, file: !1017, line: 23, column: 5)
!1067 = !DILocation(line: 25, column: 5, scope: !1066)
!1068 = !DILocalVariable(name: "start", scope: !1016, file: !1017, line: 27, type: !1029)
!1069 = !DILocation(line: 27, column: 12, scope: !1016)
!1070 = !DILocation(line: 27, column: 20, scope: !1016)
!1071 = !DILocation(line: 29, column: 5, scope: !1016)
!1072 = !DILocation(line: 29, column: 12, scope: !1016)
!1073 = !DILocation(line: 29, column: 17, scope: !1016)
!1074 = !DILocation(line: 29, column: 20, scope: !1016)
!1075 = !DILocation(line: 29, column: 25, scope: !1016)
!1076 = !DILocation(line: 29, column: 52, scope: !1016)
!1077 = !DILocation(line: 29, column: 57, scope: !1016)
!1078 = !DILocation(line: 29, column: 28, scope: !1016)
!1079 = !DILocation(line: 31, column: 18, scope: !1080)
!1080 = distinct !DILexicalBlock(scope: !1016, file: !1017, line: 30, column: 5)
!1081 = !DILocation(line: 31, column: 25, scope: !1080)
!1082 = !DILocation(line: 31, column: 33, scope: !1080)
!1083 = !DILocation(line: 31, column: 38, scope: !1080)
!1084 = !DILocation(line: 31, column: 41, scope: !1080)
!1085 = !DILocation(line: 31, column: 32, scope: !1080)
!1086 = !DILocation(line: 31, column: 30, scope: !1080)
!1087 = !DILocation(line: 31, column: 16, scope: !1080)
!1088 = !DILocation(line: 32, column: 10, scope: !1080)
!1089 = distinct !{!1089, !1071, !1090, !237}
!1090 = !DILocation(line: 33, column: 5, scope: !1016)
!1091 = !DILocation(line: 35, column: 9, scope: !1092)
!1092 = distinct !DILexicalBlock(scope: !1016, file: !1017, line: 35, column: 9)
!1093 = !DILocation(line: 35, column: 16, scope: !1092)
!1094 = !DILocation(line: 35, column: 9, scope: !1016)
!1095 = !DILocation(line: 37, column: 28, scope: !1096)
!1096 = distinct !DILexicalBlock(scope: !1092, file: !1017, line: 36, column: 5)
!1097 = !DILocation(line: 37, column: 35, scope: !1096)
!1098 = !DILocation(line: 37, column: 33, scope: !1096)
!1099 = !DILocation(line: 37, column: 10, scope: !1096)
!1100 = !DILocation(line: 37, column: 17, scope: !1096)
!1101 = !DILocation(line: 38, column: 5, scope: !1096)
!1102 = !DILocation(line: 40, column: 12, scope: !1016)
!1103 = !DILocation(line: 40, column: 5, scope: !1016)
!1104 = !DILocation(line: 41, column: 1, scope: !1016)
!1105 = distinct !DISubprogram(name: "__fizzer_model__atoi", scope: !1106, file: !1106, line: 2, type: !1107, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !107, retainedNodes: !63)
!1106 = !DIFile(filename: "data/models/c/std/stdlib/atoi.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "25ff8cf0c3b1eb16133d1fa2f6f4599f")
!1107 = !DISubroutineType(types: !1108)
!1108 = !{!6, !73}
!1109 = !DILocalVariable(name: "nptr", arg: 1, scope: !1105, file: !1106, line: 2, type: !73)
!1110 = !DILocation(line: 2, column: 38, scope: !1105)
!1111 = !DILocalVariable(name: "result", scope: !1105, file: !1106, line: 4, type: !6)
!1112 = !DILocation(line: 4, column: 9, scope: !1105)
!1113 = !DILocalVariable(name: "sign", scope: !1105, file: !1106, line: 5, type: !6)
!1114 = !DILocation(line: 5, column: 9, scope: !1105)
!1115 = !DILocalVariable(name: "i", scope: !1105, file: !1106, line: 6, type: !1116)
!1116 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1117, line: 6, baseType: !209)
!1117 = !DIFile(filename: "data/models/c/std/stdlib/atoi.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "7570ed2f727a93bc5429216171743e1c")
!1118 = !DILocation(line: 6, column: 12, scope: !1105)
!1119 = !DILocation(line: 9, column: 5, scope: !1105)
!1120 = !DILocation(line: 9, column: 12, scope: !1105)
!1121 = !DILocation(line: 9, column: 17, scope: !1105)
!1122 = !DILocation(line: 9, column: 20, scope: !1105)
!1123 = !DILocation(line: 9, column: 25, scope: !1105)
!1124 = !DILocation(line: 9, column: 52, scope: !1105)
!1125 = !DILocation(line: 9, column: 57, scope: !1105)
!1126 = !DILocation(line: 9, column: 28, scope: !1105)
!1127 = !DILocation(line: 0, scope: !1105)
!1128 = !DILocation(line: 11, column: 10, scope: !1129)
!1129 = distinct !DILexicalBlock(scope: !1105, file: !1106, line: 10, column: 5)
!1130 = distinct !{!1130, !1119, !1131, !237}
!1131 = !DILocation(line: 12, column: 5, scope: !1105)
!1132 = !DILocation(line: 15, column: 9, scope: !1133)
!1133 = distinct !DILexicalBlock(scope: !1105, file: !1106, line: 15, column: 9)
!1134 = !DILocation(line: 15, column: 14, scope: !1133)
!1135 = !DILocation(line: 15, column: 17, scope: !1133)
!1136 = !DILocation(line: 15, column: 9, scope: !1105)
!1137 = !DILocation(line: 17, column: 10, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !1133, file: !1106, line: 16, column: 5)
!1139 = !DILocation(line: 18, column: 5, scope: !1138)
!1140 = !DILocation(line: 19, column: 14, scope: !1141)
!1141 = distinct !DILexicalBlock(scope: !1133, file: !1106, line: 19, column: 14)
!1142 = !DILocation(line: 19, column: 19, scope: !1141)
!1143 = !DILocation(line: 19, column: 22, scope: !1141)
!1144 = !DILocation(line: 19, column: 14, scope: !1133)
!1145 = !DILocation(line: 21, column: 14, scope: !1146)
!1146 = distinct !DILexicalBlock(scope: !1141, file: !1106, line: 20, column: 5)
!1147 = !DILocation(line: 22, column: 10, scope: !1146)
!1148 = !DILocation(line: 23, column: 5, scope: !1146)
!1149 = !DILocation(line: 26, column: 5, scope: !1105)
!1150 = !DILocation(line: 26, column: 12, scope: !1105)
!1151 = !DILocation(line: 26, column: 17, scope: !1105)
!1152 = !DILocation(line: 26, column: 20, scope: !1105)
!1153 = !DILocation(line: 26, column: 25, scope: !1105)
!1154 = !DILocation(line: 26, column: 52, scope: !1105)
!1155 = !DILocation(line: 26, column: 57, scope: !1105)
!1156 = !DILocation(line: 26, column: 28, scope: !1105)
!1157 = !DILocation(line: 28, column: 18, scope: !1158)
!1158 = distinct !DILexicalBlock(scope: !1105, file: !1106, line: 27, column: 5)
!1159 = !DILocation(line: 28, column: 25, scope: !1158)
!1160 = !DILocation(line: 28, column: 33, scope: !1158)
!1161 = !DILocation(line: 28, column: 38, scope: !1158)
!1162 = !DILocation(line: 28, column: 41, scope: !1158)
!1163 = !DILocation(line: 28, column: 30, scope: !1158)
!1164 = !DILocation(line: 28, column: 16, scope: !1158)
!1165 = !DILocation(line: 29, column: 10, scope: !1158)
!1166 = distinct !{!1166, !1149, !1167, !237}
!1167 = !DILocation(line: 30, column: 5, scope: !1105)
!1168 = !DILocation(line: 32, column: 12, scope: !1105)
!1169 = !DILocation(line: 32, column: 19, scope: !1105)
!1170 = !DILocation(line: 32, column: 17, scope: !1105)
!1171 = !DILocation(line: 32, column: 5, scope: !1105)
!1172 = distinct !DISubprogram(name: "__fizzer_model__strstr", scope: !1173, file: !1173, line: 2, type: !1174, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !109, retainedNodes: !63)
!1173 = !DIFile(filename: "data/models/c/std/string/strstr.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "88fd7ab45b37086df2d2f42655100238")
!1174 = !DISubroutineType(types: !1175)
!1175 = !{!13, !73, !73}
!1176 = !DILocalVariable(name: "haystack", arg: 1, scope: !1172, file: !1173, line: 2, type: !73)
!1177 = !DILocation(line: 2, column: 42, scope: !1172)
!1178 = !DILocalVariable(name: "needle", arg: 2, scope: !1172, file: !1173, line: 2, type: !73)
!1179 = !DILocation(line: 2, column: 64, scope: !1172)
!1180 = !DILocation(line: 4, column: 10, scope: !1181)
!1181 = distinct !DILexicalBlock(scope: !1172, file: !1173, line: 4, column: 9)
!1182 = !DILocation(line: 4, column: 9, scope: !1181)
!1183 = !DILocation(line: 4, column: 17, scope: !1181)
!1184 = !DILocation(line: 4, column: 9, scope: !1172)
!1185 = !DILocation(line: 6, column: 24, scope: !1186)
!1186 = distinct !DILexicalBlock(scope: !1181, file: !1173, line: 5, column: 5)
!1187 = !DILocation(line: 6, column: 9, scope: !1186)
!1188 = !DILocation(line: 8, column: 5, scope: !1172)
!1189 = !DILocation(line: 8, column: 13, scope: !1172)
!1190 = !DILocation(line: 8, column: 12, scope: !1172)
!1191 = !DILocation(line: 8, column: 22, scope: !1172)
!1192 = !DILocalVariable(name: "h", scope: !1193, file: !1173, line: 10, type: !73)
!1193 = distinct !DILexicalBlock(scope: !1172, file: !1173, line: 9, column: 5)
!1194 = !DILocation(line: 10, column: 21, scope: !1193)
!1195 = !DILocation(line: 10, column: 25, scope: !1193)
!1196 = !DILocalVariable(name: "n", scope: !1193, file: !1173, line: 11, type: !73)
!1197 = !DILocation(line: 11, column: 21, scope: !1193)
!1198 = !DILocation(line: 11, column: 25, scope: !1193)
!1199 = !DILocation(line: 12, column: 9, scope: !1193)
!1200 = !DILocation(line: 12, column: 17, scope: !1193)
!1201 = !DILocation(line: 12, column: 16, scope: !1193)
!1202 = !DILocation(line: 12, column: 19, scope: !1193)
!1203 = !DILocation(line: 12, column: 24, scope: !1193)
!1204 = !DILocation(line: 12, column: 28, scope: !1193)
!1205 = !DILocation(line: 12, column: 27, scope: !1193)
!1206 = !DILocation(line: 12, column: 30, scope: !1193)
!1207 = !DILocation(line: 12, column: 35, scope: !1193)
!1208 = !DILocation(line: 12, column: 39, scope: !1193)
!1209 = !DILocation(line: 12, column: 38, scope: !1193)
!1210 = !DILocation(line: 12, column: 45, scope: !1193)
!1211 = !DILocation(line: 12, column: 44, scope: !1193)
!1212 = !DILocation(line: 12, column: 41, scope: !1193)
!1213 = !DILocation(line: 0, scope: !1193)
!1214 = !DILocation(line: 14, column: 14, scope: !1215)
!1215 = distinct !DILexicalBlock(scope: !1193, file: !1173, line: 13, column: 9)
!1216 = !DILocation(line: 15, column: 14, scope: !1215)
!1217 = distinct !{!1217, !1199, !1218, !237}
!1218 = !DILocation(line: 16, column: 9, scope: !1193)
!1219 = !DILocation(line: 17, column: 14, scope: !1220)
!1220 = distinct !DILexicalBlock(scope: !1193, file: !1173, line: 17, column: 13)
!1221 = !DILocation(line: 17, column: 13, scope: !1220)
!1222 = !DILocation(line: 17, column: 16, scope: !1220)
!1223 = !DILocation(line: 17, column: 13, scope: !1193)
!1224 = !DILocation(line: 19, column: 28, scope: !1225)
!1225 = distinct !DILexicalBlock(scope: !1220, file: !1173, line: 18, column: 9)
!1226 = !DILocation(line: 19, column: 13, scope: !1225)
!1227 = !DILocation(line: 21, column: 17, scope: !1193)
!1228 = distinct !{!1228, !1188, !1229, !237}
!1229 = !DILocation(line: 22, column: 5, scope: !1172)
!1230 = !DILocation(line: 23, column: 5, scope: !1172)
!1231 = !DILocation(line: 24, column: 1, scope: !1172)
!1232 = distinct !DISubprogram(name: "__fizzer_model__strpbrk", scope: !1233, file: !1233, line: 2, type: !1174, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !111, retainedNodes: !63)
!1233 = !DIFile(filename: "data/models/c/std/string/strpbrk.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "f90ee9e8ce652e3236917e969fe7e0af")
!1234 = !DILocalVariable(name: "s", arg: 1, scope: !1232, file: !1233, line: 2, type: !73)
!1235 = !DILocation(line: 2, column: 43, scope: !1232)
!1236 = !DILocalVariable(name: "accept", arg: 2, scope: !1232, file: !1233, line: 2, type: !73)
!1237 = !DILocation(line: 2, column: 58, scope: !1232)
!1238 = !DILocation(line: 4, column: 5, scope: !1232)
!1239 = !DILocation(line: 4, column: 13, scope: !1232)
!1240 = !DILocation(line: 4, column: 12, scope: !1232)
!1241 = !DILocation(line: 4, column: 15, scope: !1232)
!1242 = !DILocalVariable(name: "a", scope: !1243, file: !1233, line: 6, type: !73)
!1243 = distinct !DILexicalBlock(scope: !1232, file: !1233, line: 5, column: 5)
!1244 = !DILocation(line: 6, column: 21, scope: !1243)
!1245 = !DILocation(line: 6, column: 25, scope: !1243)
!1246 = !DILocation(line: 7, column: 9, scope: !1243)
!1247 = !DILocation(line: 7, column: 17, scope: !1243)
!1248 = !DILocation(line: 7, column: 16, scope: !1243)
!1249 = !DILocation(line: 7, column: 19, scope: !1243)
!1250 = !DILocation(line: 9, column: 18, scope: !1251)
!1251 = distinct !DILexicalBlock(scope: !1252, file: !1233, line: 9, column: 17)
!1252 = distinct !DILexicalBlock(scope: !1243, file: !1233, line: 8, column: 9)
!1253 = !DILocation(line: 9, column: 17, scope: !1251)
!1254 = !DILocation(line: 9, column: 24, scope: !1251)
!1255 = !DILocation(line: 9, column: 23, scope: !1251)
!1256 = !DILocation(line: 9, column: 20, scope: !1251)
!1257 = !DILocation(line: 9, column: 17, scope: !1252)
!1258 = !DILocation(line: 11, column: 32, scope: !1259)
!1259 = distinct !DILexicalBlock(scope: !1251, file: !1233, line: 10, column: 13)
!1260 = !DILocation(line: 11, column: 17, scope: !1259)
!1261 = !DILocation(line: 13, column: 14, scope: !1252)
!1262 = distinct !{!1262, !1246, !1263, !237}
!1263 = !DILocation(line: 14, column: 9, scope: !1243)
!1264 = !DILocation(line: 15, column: 10, scope: !1243)
!1265 = distinct !{!1265, !1238, !1266, !237}
!1266 = !DILocation(line: 16, column: 5, scope: !1232)
!1267 = !DILocation(line: 17, column: 5, scope: !1232)
!1268 = !DILocation(line: 18, column: 1, scope: !1232)
!1269 = distinct !DISubprogram(name: "__fizzer_model__strcpy", scope: !1270, file: !1270, line: 2, type: !71, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !113, retainedNodes: !63)
!1270 = !DIFile(filename: "data/models/c/std/string/strcpy.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "a9d5e5946be9d668420164bcb8d1da5f")
!1271 = !DILocalVariable(name: "dest", arg: 1, scope: !1269, file: !1270, line: 2, type: !13)
!1272 = !DILocation(line: 2, column: 36, scope: !1269)
!1273 = !DILocalVariable(name: "src", arg: 2, scope: !1269, file: !1270, line: 2, type: !73)
!1274 = !DILocation(line: 2, column: 54, scope: !1269)
!1275 = !DILocalVariable(name: "d", scope: !1269, file: !1270, line: 4, type: !13)
!1276 = !DILocation(line: 4, column: 11, scope: !1269)
!1277 = !DILocation(line: 4, column: 15, scope: !1269)
!1278 = !DILocation(line: 5, column: 5, scope: !1269)
!1279 = !DILocation(line: 5, column: 13, scope: !1269)
!1280 = !DILocation(line: 5, column: 12, scope: !1269)
!1281 = !DILocation(line: 5, column: 17, scope: !1269)
!1282 = !DILocation(line: 7, column: 15, scope: !1283)
!1283 = distinct !DILexicalBlock(scope: !1269, file: !1270, line: 6, column: 5)
!1284 = !DILocation(line: 7, column: 14, scope: !1283)
!1285 = !DILocation(line: 7, column: 10, scope: !1283)
!1286 = !DILocation(line: 7, column: 12, scope: !1283)
!1287 = !DILocation(line: 8, column: 10, scope: !1283)
!1288 = !DILocation(line: 9, column: 12, scope: !1283)
!1289 = distinct !{!1289, !1278, !1290, !237}
!1290 = !DILocation(line: 10, column: 5, scope: !1269)
!1291 = !DILocation(line: 11, column: 6, scope: !1269)
!1292 = !DILocation(line: 11, column: 8, scope: !1269)
!1293 = !DILocation(line: 12, column: 12, scope: !1269)
!1294 = !DILocation(line: 12, column: 5, scope: !1269)
!1295 = distinct !DISubprogram(name: "__fizzer_model__strncat", scope: !1296, file: !1296, line: 2, type: !1297, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !115, retainedNodes: !63)
!1296 = !DIFile(filename: "data/models/c/std/string/strncat.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "1734f838e35184e8c456b32046d1ee07")
!1297 = !DISubroutineType(types: !1298)
!1298 = !{!13, !13, !73, !1299}
!1299 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1300, line: 6, baseType: !209)
!1300 = !DIFile(filename: "data/models/c/std/string/strncat.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "c3654096277bccf248969a0055808a98")
!1301 = !DILocalVariable(name: "dest", arg: 1, scope: !1295, file: !1296, line: 2, type: !13)
!1302 = !DILocation(line: 2, column: 37, scope: !1295)
!1303 = !DILocalVariable(name: "src", arg: 2, scope: !1295, file: !1296, line: 2, type: !73)
!1304 = !DILocation(line: 2, column: 55, scope: !1295)
!1305 = !DILocalVariable(name: "n", arg: 3, scope: !1295, file: !1296, line: 2, type: !1299)
!1306 = !DILocation(line: 2, column: 67, scope: !1295)
!1307 = !DILocalVariable(name: "d", scope: !1295, file: !1296, line: 4, type: !13)
!1308 = !DILocation(line: 4, column: 11, scope: !1295)
!1309 = !DILocation(line: 4, column: 15, scope: !1295)
!1310 = !DILocation(line: 5, column: 5, scope: !1295)
!1311 = !DILocation(line: 5, column: 13, scope: !1295)
!1312 = !DILocation(line: 5, column: 12, scope: !1295)
!1313 = !DILocation(line: 5, column: 15, scope: !1295)
!1314 = !DILocation(line: 7, column: 10, scope: !1315)
!1315 = distinct !DILexicalBlock(scope: !1295, file: !1296, line: 6, column: 5)
!1316 = distinct !{!1316, !1310, !1317, !237}
!1317 = !DILocation(line: 8, column: 5, scope: !1295)
!1318 = !DILocalVariable(name: "i", scope: !1295, file: !1296, line: 9, type: !1299)
!1319 = !DILocation(line: 9, column: 12, scope: !1295)
!1320 = !DILocation(line: 10, column: 5, scope: !1295)
!1321 = !DILocation(line: 10, column: 12, scope: !1295)
!1322 = !DILocation(line: 10, column: 16, scope: !1295)
!1323 = !DILocation(line: 10, column: 14, scope: !1295)
!1324 = !DILocation(line: 10, column: 18, scope: !1295)
!1325 = !DILocation(line: 10, column: 22, scope: !1295)
!1326 = !DILocation(line: 10, column: 21, scope: !1295)
!1327 = !DILocation(line: 10, column: 26, scope: !1295)
!1328 = !DILocation(line: 0, scope: !1295)
!1329 = !DILocation(line: 12, column: 15, scope: !1330)
!1330 = distinct !DILexicalBlock(scope: !1295, file: !1296, line: 11, column: 5)
!1331 = !DILocation(line: 12, column: 14, scope: !1330)
!1332 = !DILocation(line: 12, column: 10, scope: !1330)
!1333 = !DILocation(line: 12, column: 12, scope: !1330)
!1334 = !DILocation(line: 13, column: 10, scope: !1330)
!1335 = !DILocation(line: 14, column: 12, scope: !1330)
!1336 = !DILocation(line: 15, column: 10, scope: !1330)
!1337 = distinct !{!1337, !1320, !1338, !237}
!1338 = !DILocation(line: 16, column: 5, scope: !1295)
!1339 = !DILocation(line: 17, column: 6, scope: !1295)
!1340 = !DILocation(line: 17, column: 8, scope: !1295)
!1341 = !DILocation(line: 18, column: 12, scope: !1295)
!1342 = !DILocation(line: 18, column: 5, scope: !1295)
!1343 = distinct !DISubprogram(name: "__fizzer_model__strcspn", scope: !1344, file: !1344, line: 2, type: !1345, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !117, retainedNodes: !63)
!1344 = !DIFile(filename: "data/models/c/std/string/strcspn.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "2f7cd216c9e6f8edb02d5afb4ea11b44")
!1345 = !DISubroutineType(types: !1346)
!1346 = !{!1347, !73, !73}
!1347 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1348, line: 6, baseType: !209)
!1348 = !DIFile(filename: "data/models/c/std/string/strcspn.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "14201ac4b9600306ae68639f4954a548")
!1349 = !DILocalVariable(name: "s", arg: 1, scope: !1343, file: !1344, line: 2, type: !73)
!1350 = !DILocation(line: 2, column: 44, scope: !1343)
!1351 = !DILocalVariable(name: "reject", arg: 2, scope: !1343, file: !1344, line: 2, type: !73)
!1352 = !DILocation(line: 2, column: 59, scope: !1343)
!1353 = !DILocalVariable(name: "count", scope: !1343, file: !1344, line: 4, type: !1347)
!1354 = !DILocation(line: 4, column: 12, scope: !1343)
!1355 = !DILocation(line: 5, column: 5, scope: !1343)
!1356 = !DILocation(line: 5, column: 13, scope: !1343)
!1357 = !DILocation(line: 5, column: 12, scope: !1343)
!1358 = !DILocation(line: 5, column: 15, scope: !1343)
!1359 = !DILocalVariable(name: "r", scope: !1360, file: !1344, line: 7, type: !73)
!1360 = distinct !DILexicalBlock(scope: !1343, file: !1344, line: 6, column: 5)
!1361 = !DILocation(line: 7, column: 21, scope: !1360)
!1362 = !DILocation(line: 7, column: 25, scope: !1360)
!1363 = !DILocation(line: 8, column: 9, scope: !1360)
!1364 = !DILocation(line: 8, column: 17, scope: !1360)
!1365 = !DILocation(line: 8, column: 16, scope: !1360)
!1366 = !DILocation(line: 8, column: 19, scope: !1360)
!1367 = !DILocation(line: 8, column: 24, scope: !1360)
!1368 = !DILocation(line: 8, column: 28, scope: !1360)
!1369 = !DILocation(line: 8, column: 27, scope: !1360)
!1370 = !DILocation(line: 8, column: 34, scope: !1360)
!1371 = !DILocation(line: 8, column: 33, scope: !1360)
!1372 = !DILocation(line: 8, column: 30, scope: !1360)
!1373 = !DILocation(line: 0, scope: !1360)
!1374 = !DILocation(line: 10, column: 14, scope: !1375)
!1375 = distinct !DILexicalBlock(scope: !1360, file: !1344, line: 9, column: 9)
!1376 = distinct !{!1376, !1363, !1377, !237}
!1377 = !DILocation(line: 11, column: 9, scope: !1360)
!1378 = !DILocation(line: 12, column: 14, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1360, file: !1344, line: 12, column: 13)
!1380 = !DILocation(line: 12, column: 13, scope: !1379)
!1381 = !DILocation(line: 12, column: 16, scope: !1379)
!1382 = !DILocation(line: 12, column: 13, scope: !1360)
!1383 = !DILocation(line: 14, column: 13, scope: !1384)
!1384 = distinct !DILexicalBlock(scope: !1379, file: !1344, line: 13, column: 9)
!1385 = !DILocation(line: 16, column: 14, scope: !1360)
!1386 = !DILocation(line: 17, column: 10, scope: !1360)
!1387 = distinct !{!1387, !1355, !1388, !237}
!1388 = !DILocation(line: 18, column: 5, scope: !1343)
!1389 = !DILocation(line: 19, column: 12, scope: !1343)
!1390 = !DILocation(line: 19, column: 5, scope: !1343)
!1391 = distinct !DISubprogram(name: "__fizzer_model__strcoll", scope: !1392, file: !1392, line: 2, type: !1393, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !119, retainedNodes: !63)
!1392 = !DIFile(filename: "data/models/c/std/string/strcoll.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "594081383e127900a617071ac71187f1")
!1393 = !DISubroutineType(types: !1394)
!1394 = !{!6, !73, !73}
!1395 = !DILocalVariable(name: "s1", arg: 1, scope: !1391, file: !1392, line: 2, type: !73)
!1396 = !DILocation(line: 2, column: 41, scope: !1391)
!1397 = !DILocalVariable(name: "s2", arg: 2, scope: !1391, file: !1392, line: 2, type: !73)
!1398 = !DILocation(line: 2, column: 57, scope: !1391)
!1399 = !DILocation(line: 4, column: 5, scope: !1391)
!1400 = !DILocation(line: 4, column: 13, scope: !1391)
!1401 = !DILocation(line: 4, column: 12, scope: !1391)
!1402 = !DILocation(line: 4, column: 16, scope: !1391)
!1403 = !DILocation(line: 4, column: 21, scope: !1391)
!1404 = !DILocation(line: 4, column: 25, scope: !1391)
!1405 = !DILocation(line: 4, column: 24, scope: !1391)
!1406 = !DILocation(line: 4, column: 32, scope: !1391)
!1407 = !DILocation(line: 4, column: 31, scope: !1391)
!1408 = !DILocation(line: 4, column: 28, scope: !1391)
!1409 = !DILocation(line: 0, scope: !1391)
!1410 = !DILocation(line: 6, column: 11, scope: !1411)
!1411 = distinct !DILexicalBlock(scope: !1391, file: !1392, line: 5, column: 5)
!1412 = !DILocation(line: 7, column: 11, scope: !1411)
!1413 = distinct !{!1413, !1399, !1414, !237}
!1414 = !DILocation(line: 8, column: 5, scope: !1391)
!1415 = !DILocation(line: 9, column: 34, scope: !1391)
!1416 = !DILocation(line: 9, column: 33, scope: !1391)
!1417 = !DILocation(line: 9, column: 18, scope: !1391)
!1418 = !DILocation(line: 9, column: 55, scope: !1391)
!1419 = !DILocation(line: 9, column: 54, scope: !1391)
!1420 = !DILocation(line: 9, column: 39, scope: !1391)
!1421 = !DILocation(line: 9, column: 37, scope: !1391)
!1422 = !DILocation(line: 9, column: 5, scope: !1391)
!1423 = distinct !DISubprogram(name: "__fizzer_model__strcmp", scope: !1424, file: !1424, line: 2, type: !1393, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !122, retainedNodes: !63)
!1424 = !DIFile(filename: "data/models/c/std/string/strcmp.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "e8d614ef53fc1f2814b3a79a1909aaf7")
!1425 = !DILocalVariable(name: "s1", arg: 1, scope: !1423, file: !1424, line: 2, type: !73)
!1426 = !DILocation(line: 2, column: 40, scope: !1423)
!1427 = !DILocalVariable(name: "s2", arg: 2, scope: !1423, file: !1424, line: 2, type: !73)
!1428 = !DILocation(line: 2, column: 56, scope: !1423)
!1429 = !DILocation(line: 4, column: 5, scope: !1423)
!1430 = !DILocation(line: 4, column: 13, scope: !1423)
!1431 = !DILocation(line: 4, column: 12, scope: !1423)
!1432 = !DILocation(line: 4, column: 16, scope: !1423)
!1433 = !DILocation(line: 4, column: 21, scope: !1423)
!1434 = !DILocation(line: 4, column: 25, scope: !1423)
!1435 = !DILocation(line: 4, column: 24, scope: !1423)
!1436 = !DILocation(line: 4, column: 32, scope: !1423)
!1437 = !DILocation(line: 4, column: 31, scope: !1423)
!1438 = !DILocation(line: 4, column: 28, scope: !1423)
!1439 = !DILocation(line: 0, scope: !1423)
!1440 = !DILocation(line: 6, column: 11, scope: !1441)
!1441 = distinct !DILexicalBlock(scope: !1423, file: !1424, line: 5, column: 5)
!1442 = !DILocation(line: 7, column: 11, scope: !1441)
!1443 = distinct !{!1443, !1429, !1444, !237}
!1444 = !DILocation(line: 8, column: 5, scope: !1423)
!1445 = !DILocation(line: 9, column: 34, scope: !1423)
!1446 = !DILocation(line: 9, column: 33, scope: !1423)
!1447 = !DILocation(line: 9, column: 18, scope: !1423)
!1448 = !DILocation(line: 9, column: 55, scope: !1423)
!1449 = !DILocation(line: 9, column: 54, scope: !1423)
!1450 = !DILocation(line: 9, column: 39, scope: !1423)
!1451 = !DILocation(line: 9, column: 37, scope: !1423)
!1452 = !DILocation(line: 9, column: 5, scope: !1423)
!1453 = distinct !DISubprogram(name: "__fizzer_model__strncmp", scope: !1454, file: !1454, line: 2, type: !1455, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !124, retainedNodes: !63)
!1454 = !DIFile(filename: "data/models/c/std/string/strncmp.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "e275f67b87d7e3da1256de4308f1f1ce")
!1455 = !DISubroutineType(types: !1456)
!1456 = !{!6, !73, !73, !1457}
!1457 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1458, line: 6, baseType: !209)
!1458 = !DIFile(filename: "data/models/c/std/string/strncmp.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "d722468f3764edd1057fdc528e8c267d")
!1459 = !DILocalVariable(name: "s1", arg: 1, scope: !1453, file: !1454, line: 2, type: !73)
!1460 = !DILocation(line: 2, column: 41, scope: !1453)
!1461 = !DILocalVariable(name: "s2", arg: 2, scope: !1453, file: !1454, line: 2, type: !73)
!1462 = !DILocation(line: 2, column: 57, scope: !1453)
!1463 = !DILocalVariable(name: "n", arg: 3, scope: !1453, file: !1454, line: 2, type: !1457)
!1464 = !DILocation(line: 2, column: 68, scope: !1453)
!1465 = !DILocalVariable(name: "i", scope: !1453, file: !1454, line: 4, type: !1457)
!1466 = !DILocation(line: 4, column: 12, scope: !1453)
!1467 = !DILocation(line: 5, column: 5, scope: !1453)
!1468 = !DILocation(line: 5, column: 12, scope: !1453)
!1469 = !DILocation(line: 5, column: 16, scope: !1453)
!1470 = !DILocation(line: 5, column: 14, scope: !1453)
!1471 = !DILocalVariable(name: "c1", scope: !1472, file: !1454, line: 7, type: !82)
!1472 = distinct !DILexicalBlock(scope: !1453, file: !1454, line: 6, column: 5)
!1473 = !DILocation(line: 7, column: 23, scope: !1472)
!1474 = !DILocation(line: 7, column: 43, scope: !1472)
!1475 = !DILocation(line: 7, column: 46, scope: !1472)
!1476 = !DILocalVariable(name: "c2", scope: !1472, file: !1454, line: 8, type: !82)
!1477 = !DILocation(line: 8, column: 23, scope: !1472)
!1478 = !DILocation(line: 8, column: 43, scope: !1472)
!1479 = !DILocation(line: 8, column: 46, scope: !1472)
!1480 = !DILocation(line: 9, column: 13, scope: !1481)
!1481 = distinct !DILexicalBlock(scope: !1472, file: !1454, line: 9, column: 13)
!1482 = !DILocation(line: 9, column: 19, scope: !1481)
!1483 = !DILocation(line: 9, column: 16, scope: !1481)
!1484 = !DILocation(line: 9, column: 22, scope: !1481)
!1485 = !DILocation(line: 9, column: 25, scope: !1481)
!1486 = !DILocation(line: 9, column: 28, scope: !1481)
!1487 = !DILocation(line: 9, column: 33, scope: !1481)
!1488 = !DILocation(line: 9, column: 36, scope: !1481)
!1489 = !DILocation(line: 9, column: 39, scope: !1481)
!1490 = !DILocation(line: 9, column: 13, scope: !1472)
!1491 = !DILocation(line: 11, column: 26, scope: !1492)
!1492 = distinct !DILexicalBlock(scope: !1481, file: !1454, line: 10, column: 9)
!1493 = !DILocation(line: 11, column: 31, scope: !1492)
!1494 = !DILocation(line: 11, column: 29, scope: !1492)
!1495 = !DILocation(line: 11, column: 13, scope: !1492)
!1496 = !DILocation(line: 13, column: 10, scope: !1472)
!1497 = distinct !{!1497, !1467, !1498, !237}
!1498 = !DILocation(line: 14, column: 5, scope: !1453)
!1499 = !DILocation(line: 15, column: 5, scope: !1453)
!1500 = !DILocation(line: 16, column: 1, scope: !1453)
!1501 = distinct !DISubprogram(name: "__fizzer_model__strrchr", scope: !1502, file: !1502, line: 2, type: !1503, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !127, retainedNodes: !63)
!1502 = !DIFile(filename: "data/models/c/std/string/strrchr.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "44079aea5c31caec0e42d813448f707f")
!1503 = !DISubroutineType(types: !1504)
!1504 = !{!13, !73, !6}
!1505 = !DILocalVariable(name: "s", arg: 1, scope: !1501, file: !1502, line: 2, type: !73)
!1506 = !DILocation(line: 2, column: 43, scope: !1501)
!1507 = !DILocalVariable(name: "c", arg: 2, scope: !1501, file: !1502, line: 2, type: !6)
!1508 = !DILocation(line: 2, column: 50, scope: !1501)
!1509 = !DILocalVariable(name: "last", scope: !1501, file: !1502, line: 4, type: !73)
!1510 = !DILocation(line: 4, column: 17, scope: !1501)
!1511 = !DILocation(line: 5, column: 5, scope: !1501)
!1512 = !DILocation(line: 5, column: 13, scope: !1501)
!1513 = !DILocation(line: 5, column: 12, scope: !1501)
!1514 = !DILocation(line: 5, column: 15, scope: !1501)
!1515 = !DILocation(line: 7, column: 14, scope: !1516)
!1516 = distinct !DILexicalBlock(scope: !1517, file: !1502, line: 7, column: 13)
!1517 = distinct !DILexicalBlock(scope: !1501, file: !1502, line: 6, column: 5)
!1518 = !DILocation(line: 7, column: 13, scope: !1516)
!1519 = !DILocation(line: 7, column: 25, scope: !1516)
!1520 = !DILocation(line: 7, column: 19, scope: !1516)
!1521 = !DILocation(line: 7, column: 16, scope: !1516)
!1522 = !DILocation(line: 7, column: 13, scope: !1517)
!1523 = !DILocation(line: 9, column: 20, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1516, file: !1502, line: 8, column: 9)
!1525 = !DILocation(line: 9, column: 18, scope: !1524)
!1526 = !DILocation(line: 10, column: 9, scope: !1524)
!1527 = !DILocation(line: 11, column: 10, scope: !1517)
!1528 = distinct !{!1528, !1511, !1529, !237}
!1529 = !DILocation(line: 12, column: 5, scope: !1501)
!1530 = !DILocation(line: 13, column: 15, scope: !1531)
!1531 = distinct !DILexicalBlock(scope: !1501, file: !1502, line: 13, column: 9)
!1532 = !DILocation(line: 13, column: 9, scope: !1531)
!1533 = !DILocation(line: 13, column: 17, scope: !1531)
!1534 = !DILocation(line: 13, column: 9, scope: !1501)
!1535 = !DILocation(line: 15, column: 24, scope: !1536)
!1536 = distinct !DILexicalBlock(scope: !1531, file: !1502, line: 14, column: 5)
!1537 = !DILocation(line: 15, column: 9, scope: !1536)
!1538 = !DILocation(line: 17, column: 20, scope: !1501)
!1539 = !DILocation(line: 17, column: 5, scope: !1501)
!1540 = !DILocation(line: 18, column: 1, scope: !1501)
!1541 = distinct !DISubprogram(name: "__fizzer_model__strcat", scope: !1542, file: !1542, line: 2, type: !71, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !130, retainedNodes: !63)
!1542 = !DIFile(filename: "data/models/c/std/string/strcat.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "8970d2710d3c40f59dab15e8fb2774f9")
!1543 = !DILocalVariable(name: "dest", arg: 1, scope: !1541, file: !1542, line: 2, type: !13)
!1544 = !DILocation(line: 2, column: 36, scope: !1541)
!1545 = !DILocalVariable(name: "src", arg: 2, scope: !1541, file: !1542, line: 2, type: !73)
!1546 = !DILocation(line: 2, column: 54, scope: !1541)
!1547 = !DILocalVariable(name: "d", scope: !1541, file: !1542, line: 4, type: !13)
!1548 = !DILocation(line: 4, column: 11, scope: !1541)
!1549 = !DILocation(line: 4, column: 15, scope: !1541)
!1550 = !DILocation(line: 5, column: 5, scope: !1541)
!1551 = !DILocation(line: 5, column: 13, scope: !1541)
!1552 = !DILocation(line: 5, column: 12, scope: !1541)
!1553 = !DILocation(line: 5, column: 15, scope: !1541)
!1554 = !DILocation(line: 7, column: 10, scope: !1555)
!1555 = distinct !DILexicalBlock(scope: !1541, file: !1542, line: 6, column: 5)
!1556 = distinct !{!1556, !1550, !1557, !237}
!1557 = !DILocation(line: 8, column: 5, scope: !1541)
!1558 = !DILocation(line: 9, column: 5, scope: !1541)
!1559 = !DILocation(line: 9, column: 13, scope: !1541)
!1560 = !DILocation(line: 9, column: 12, scope: !1541)
!1561 = !DILocation(line: 9, column: 17, scope: !1541)
!1562 = !DILocation(line: 11, column: 15, scope: !1563)
!1563 = distinct !DILexicalBlock(scope: !1541, file: !1542, line: 10, column: 5)
!1564 = !DILocation(line: 11, column: 14, scope: !1563)
!1565 = !DILocation(line: 11, column: 10, scope: !1563)
!1566 = !DILocation(line: 11, column: 12, scope: !1563)
!1567 = !DILocation(line: 12, column: 10, scope: !1563)
!1568 = !DILocation(line: 13, column: 12, scope: !1563)
!1569 = distinct !{!1569, !1558, !1570, !237}
!1570 = !DILocation(line: 14, column: 5, scope: !1541)
!1571 = !DILocation(line: 15, column: 6, scope: !1541)
!1572 = !DILocation(line: 15, column: 8, scope: !1541)
!1573 = !DILocation(line: 16, column: 12, scope: !1541)
!1574 = !DILocation(line: 16, column: 5, scope: !1541)
!1575 = distinct !DISubprogram(name: "__fizzer_model__strspn", scope: !1576, file: !1576, line: 2, type: !1577, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !132, retainedNodes: !63)
!1576 = !DIFile(filename: "data/models/c/std/string/strspn.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "093bc709c553b9ccbb1565b54017ff4e")
!1577 = !DISubroutineType(types: !1578)
!1578 = !{!1579, !73, !73}
!1579 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1580, line: 6, baseType: !209)
!1580 = !DIFile(filename: "data/models/c/std/string/strspn.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "e204dc773920ac8c268dc68093e93bcb")
!1581 = !DILocalVariable(name: "s", arg: 1, scope: !1575, file: !1576, line: 2, type: !73)
!1582 = !DILocation(line: 2, column: 43, scope: !1575)
!1583 = !DILocalVariable(name: "accept", arg: 2, scope: !1575, file: !1576, line: 2, type: !73)
!1584 = !DILocation(line: 2, column: 58, scope: !1575)
!1585 = !DILocalVariable(name: "count", scope: !1575, file: !1576, line: 4, type: !1579)
!1586 = !DILocation(line: 4, column: 12, scope: !1575)
!1587 = !DILocation(line: 5, column: 5, scope: !1575)
!1588 = !DILocation(line: 5, column: 13, scope: !1575)
!1589 = !DILocation(line: 5, column: 12, scope: !1575)
!1590 = !DILocation(line: 5, column: 15, scope: !1575)
!1591 = !DILocalVariable(name: "a", scope: !1592, file: !1576, line: 7, type: !73)
!1592 = distinct !DILexicalBlock(scope: !1575, file: !1576, line: 6, column: 5)
!1593 = !DILocation(line: 7, column: 21, scope: !1592)
!1594 = !DILocation(line: 7, column: 25, scope: !1592)
!1595 = !DILocation(line: 8, column: 9, scope: !1592)
!1596 = !DILocation(line: 8, column: 17, scope: !1592)
!1597 = !DILocation(line: 8, column: 16, scope: !1592)
!1598 = !DILocation(line: 8, column: 19, scope: !1592)
!1599 = !DILocation(line: 8, column: 24, scope: !1592)
!1600 = !DILocation(line: 8, column: 28, scope: !1592)
!1601 = !DILocation(line: 8, column: 27, scope: !1592)
!1602 = !DILocation(line: 8, column: 34, scope: !1592)
!1603 = !DILocation(line: 8, column: 33, scope: !1592)
!1604 = !DILocation(line: 8, column: 30, scope: !1592)
!1605 = !DILocation(line: 0, scope: !1592)
!1606 = !DILocation(line: 10, column: 14, scope: !1607)
!1607 = distinct !DILexicalBlock(scope: !1592, file: !1576, line: 9, column: 9)
!1608 = distinct !{!1608, !1595, !1609, !237}
!1609 = !DILocation(line: 11, column: 9, scope: !1592)
!1610 = !DILocation(line: 12, column: 14, scope: !1611)
!1611 = distinct !DILexicalBlock(scope: !1592, file: !1576, line: 12, column: 13)
!1612 = !DILocation(line: 12, column: 13, scope: !1611)
!1613 = !DILocation(line: 12, column: 16, scope: !1611)
!1614 = !DILocation(line: 12, column: 13, scope: !1592)
!1615 = !DILocation(line: 14, column: 13, scope: !1616)
!1616 = distinct !DILexicalBlock(scope: !1611, file: !1576, line: 13, column: 9)
!1617 = !DILocation(line: 16, column: 14, scope: !1592)
!1618 = !DILocation(line: 17, column: 10, scope: !1592)
!1619 = distinct !{!1619, !1587, !1620, !237}
!1620 = !DILocation(line: 18, column: 5, scope: !1575)
!1621 = !DILocation(line: 19, column: 12, scope: !1575)
!1622 = !DILocation(line: 19, column: 5, scope: !1575)
!1623 = distinct !DISubprogram(name: "__fizzer_model__strncpy", scope: !1624, file: !1624, line: 2, type: !1625, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !134, retainedNodes: !63)
!1624 = !DIFile(filename: "data/models/c/std/string/strncpy.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "4b1e33fa2c1188492810829cb7ad397c")
!1625 = !DISubroutineType(types: !1626)
!1626 = !{!13, !13, !73, !1627}
!1627 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1628, line: 6, baseType: !209)
!1628 = !DIFile(filename: "data/models/c/std/string/strncpy.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "05e0494f8da850b7625fd57dcdc37446")
!1629 = !DILocalVariable(name: "dest", arg: 1, scope: !1623, file: !1624, line: 2, type: !13)
!1630 = !DILocation(line: 2, column: 37, scope: !1623)
!1631 = !DILocalVariable(name: "src", arg: 2, scope: !1623, file: !1624, line: 2, type: !73)
!1632 = !DILocation(line: 2, column: 55, scope: !1623)
!1633 = !DILocalVariable(name: "n", arg: 3, scope: !1623, file: !1624, line: 2, type: !1627)
!1634 = !DILocation(line: 2, column: 67, scope: !1623)
!1635 = !DILocalVariable(name: "i", scope: !1623, file: !1624, line: 4, type: !1627)
!1636 = !DILocation(line: 4, column: 12, scope: !1623)
!1637 = !DILocation(line: 5, column: 5, scope: !1623)
!1638 = !DILocation(line: 5, column: 12, scope: !1623)
!1639 = !DILocation(line: 5, column: 16, scope: !1623)
!1640 = !DILocation(line: 5, column: 14, scope: !1623)
!1641 = !DILocation(line: 5, column: 18, scope: !1623)
!1642 = !DILocation(line: 5, column: 21, scope: !1623)
!1643 = !DILocation(line: 5, column: 25, scope: !1623)
!1644 = !DILocation(line: 5, column: 28, scope: !1623)
!1645 = !DILocation(line: 0, scope: !1623)
!1646 = !DILocation(line: 7, column: 19, scope: !1647)
!1647 = distinct !DILexicalBlock(scope: !1623, file: !1624, line: 6, column: 5)
!1648 = !DILocation(line: 7, column: 23, scope: !1647)
!1649 = !DILocation(line: 7, column: 9, scope: !1647)
!1650 = !DILocation(line: 7, column: 14, scope: !1647)
!1651 = !DILocation(line: 7, column: 17, scope: !1647)
!1652 = !DILocation(line: 8, column: 10, scope: !1647)
!1653 = distinct !{!1653, !1637, !1654, !237}
!1654 = !DILocation(line: 9, column: 5, scope: !1623)
!1655 = !DILocation(line: 10, column: 5, scope: !1623)
!1656 = !DILocation(line: 10, column: 12, scope: !1623)
!1657 = !DILocation(line: 10, column: 16, scope: !1623)
!1658 = !DILocation(line: 10, column: 14, scope: !1623)
!1659 = !DILocation(line: 12, column: 9, scope: !1660)
!1660 = distinct !DILexicalBlock(scope: !1623, file: !1624, line: 11, column: 5)
!1661 = !DILocation(line: 12, column: 14, scope: !1660)
!1662 = !DILocation(line: 12, column: 17, scope: !1660)
!1663 = !DILocation(line: 13, column: 10, scope: !1660)
!1664 = distinct !{!1664, !1655, !1665, !237}
!1665 = !DILocation(line: 14, column: 5, scope: !1623)
!1666 = !DILocation(line: 15, column: 12, scope: !1623)
!1667 = !DILocation(line: 15, column: 5, scope: !1623)
!1668 = distinct !DISubprogram(name: "__fizzer_model__strchr", scope: !1669, file: !1669, line: 2, type: !1503, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !136, retainedNodes: !63)
!1669 = !DIFile(filename: "data/models/c/std/string/strchr.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "be78f81f7eb8078306a1616593746c64")
!1670 = !DILocalVariable(name: "s", arg: 1, scope: !1668, file: !1669, line: 2, type: !73)
!1671 = !DILocation(line: 2, column: 42, scope: !1668)
!1672 = !DILocalVariable(name: "c", arg: 2, scope: !1668, file: !1669, line: 2, type: !6)
!1673 = !DILocation(line: 2, column: 49, scope: !1668)
!1674 = !DILocation(line: 4, column: 5, scope: !1668)
!1675 = !DILocation(line: 4, column: 13, scope: !1668)
!1676 = !DILocation(line: 4, column: 12, scope: !1668)
!1677 = !DILocation(line: 4, column: 15, scope: !1668)
!1678 = !DILocation(line: 6, column: 14, scope: !1679)
!1679 = distinct !DILexicalBlock(scope: !1680, file: !1669, line: 6, column: 13)
!1680 = distinct !DILexicalBlock(scope: !1668, file: !1669, line: 5, column: 5)
!1681 = !DILocation(line: 6, column: 13, scope: !1679)
!1682 = !DILocation(line: 6, column: 25, scope: !1679)
!1683 = !DILocation(line: 6, column: 19, scope: !1679)
!1684 = !DILocation(line: 6, column: 16, scope: !1679)
!1685 = !DILocation(line: 6, column: 13, scope: !1680)
!1686 = !DILocation(line: 8, column: 28, scope: !1687)
!1687 = distinct !DILexicalBlock(scope: !1679, file: !1669, line: 7, column: 9)
!1688 = !DILocation(line: 8, column: 13, scope: !1687)
!1689 = !DILocation(line: 10, column: 10, scope: !1680)
!1690 = distinct !{!1690, !1674, !1691, !237}
!1691 = !DILocation(line: 11, column: 5, scope: !1668)
!1692 = !DILocation(line: 12, column: 15, scope: !1693)
!1693 = distinct !DILexicalBlock(scope: !1668, file: !1669, line: 12, column: 9)
!1694 = !DILocation(line: 12, column: 9, scope: !1693)
!1695 = !DILocation(line: 12, column: 17, scope: !1693)
!1696 = !DILocation(line: 12, column: 9, scope: !1668)
!1697 = !DILocation(line: 14, column: 24, scope: !1698)
!1698 = distinct !DILexicalBlock(scope: !1693, file: !1669, line: 13, column: 5)
!1699 = !DILocation(line: 14, column: 9, scope: !1698)
!1700 = !DILocation(line: 16, column: 5, scope: !1668)
!1701 = !DILocation(line: 17, column: 1, scope: !1668)
!1702 = !DILocalVariable(name: "errnum", arg: 1, scope: !29, file: !30, line: 2, type: !6)
!1703 = !DILocation(line: 2, column: 36, scope: !29)
!1704 = !DILocation(line: 8, column: 13, scope: !29)
!1705 = !DILocation(line: 8, column: 5, scope: !29)
!1706 = !DILocation(line: 11, column: 13, scope: !1707)
!1707 = distinct !DILexicalBlock(scope: !29, file: !30, line: 9, column: 5)
!1708 = !DILocation(line: 13, column: 13, scope: !1707)
!1709 = !DILocation(line: 15, column: 13, scope: !1707)
!1710 = !DILocation(line: 17, column: 13, scope: !1707)
!1711 = !DILocation(line: 19, column: 13, scope: !1707)
!1712 = !DILocation(line: 21, column: 13, scope: !1707)
!1713 = !DILocation(line: 23, column: 13, scope: !1707)
!1714 = !DILocation(line: 25, column: 1, scope: !29)
!1715 = distinct !DISubprogram(name: "__fizzer_model__memchr", scope: !1716, file: !1716, line: 2, type: !1717, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !138, retainedNodes: !63)
!1716 = !DIFile(filename: "data/models/c/std/string/memchr.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "eb41c2475f9bcc7c01385e05d30fa3e5")
!1717 = !DISubroutineType(types: !1718)
!1718 = !{!143, !1719, !6, !1721}
!1719 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1720, size: 64)
!1720 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!1721 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1722, line: 6, baseType: !209)
!1722 = !DIFile(filename: "data/models/c/std/string/memchr.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "af02b37770d7a7765f9edfc9d8d94d59")
!1723 = !DILocalVariable(name: "s", arg: 1, scope: !1715, file: !1716, line: 2, type: !1719)
!1724 = !DILocation(line: 2, column: 42, scope: !1715)
!1725 = !DILocalVariable(name: "c", arg: 2, scope: !1715, file: !1716, line: 2, type: !6)
!1726 = !DILocation(line: 2, column: 49, scope: !1715)
!1727 = !DILocalVariable(name: "n", arg: 3, scope: !1715, file: !1716, line: 2, type: !1721)
!1728 = !DILocation(line: 2, column: 59, scope: !1715)
!1729 = !DILocalVariable(name: "p", scope: !1715, file: !1716, line: 4, type: !141)
!1730 = !DILocation(line: 4, column: 26, scope: !1715)
!1731 = !DILocation(line: 4, column: 53, scope: !1715)
!1732 = !DILocalVariable(name: "i", scope: !1715, file: !1716, line: 5, type: !1721)
!1733 = !DILocation(line: 5, column: 12, scope: !1715)
!1734 = !DILocation(line: 7, column: 5, scope: !1715)
!1735 = !DILocation(line: 7, column: 12, scope: !1715)
!1736 = !DILocation(line: 7, column: 16, scope: !1715)
!1737 = !DILocation(line: 7, column: 14, scope: !1715)
!1738 = !DILocation(line: 9, column: 13, scope: !1739)
!1739 = distinct !DILexicalBlock(scope: !1740, file: !1716, line: 9, column: 13)
!1740 = distinct !DILexicalBlock(scope: !1715, file: !1716, line: 8, column: 5)
!1741 = !DILocation(line: 9, column: 15, scope: !1739)
!1742 = !DILocation(line: 9, column: 36, scope: !1739)
!1743 = !DILocation(line: 9, column: 21, scope: !1739)
!1744 = !DILocation(line: 9, column: 18, scope: !1739)
!1745 = !DILocation(line: 9, column: 13, scope: !1740)
!1746 = !DILocation(line: 11, column: 29, scope: !1747)
!1747 = distinct !DILexicalBlock(scope: !1739, file: !1716, line: 10, column: 9)
!1748 = !DILocation(line: 11, column: 33, scope: !1747)
!1749 = !DILocation(line: 11, column: 31, scope: !1747)
!1750 = !DILocation(line: 11, column: 13, scope: !1747)
!1751 = !DILocation(line: 13, column: 10, scope: !1740)
!1752 = distinct !{!1752, !1734, !1753, !237}
!1753 = !DILocation(line: 14, column: 5, scope: !1715)
!1754 = !DILocation(line: 15, column: 5, scope: !1715)
!1755 = !DILocation(line: 16, column: 1, scope: !1715)
!1756 = distinct !DISubprogram(name: "__fizzer_model__strlen", scope: !1757, file: !1757, line: 2, type: !1758, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !144, retainedNodes: !63)
!1757 = !DIFile(filename: "data/models/c/std/string/strlen.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "02927e422ac203a0e84c9a608c987af4")
!1758 = !DISubroutineType(types: !1759)
!1759 = !{!1760, !73}
!1760 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1761, line: 6, baseType: !209)
!1761 = !DIFile(filename: "data/models/c/std/string/strlen.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "b08c6e51a3e99f12523321dfde78fc5e")
!1762 = !DILocalVariable(name: "s", arg: 1, scope: !1756, file: !1757, line: 2, type: !73)
!1763 = !DILocation(line: 2, column: 43, scope: !1756)
!1764 = !DILocalVariable(name: "n", scope: !1756, file: !1757, line: 4, type: !1760)
!1765 = !DILocation(line: 4, column: 12, scope: !1756)
!1766 = !DILocation(line: 5, column: 5, scope: !1756)
!1767 = !DILocation(line: 5, column: 12, scope: !1756)
!1768 = !DILocation(line: 5, column: 14, scope: !1756)
!1769 = !DILocation(line: 5, column: 17, scope: !1756)
!1770 = !DILocation(line: 7, column: 10, scope: !1771)
!1771 = distinct !DILexicalBlock(scope: !1756, file: !1757, line: 6, column: 5)
!1772 = distinct !{!1772, !1766, !1773, !237}
!1773 = !DILocation(line: 8, column: 5, scope: !1756)
!1774 = !DILocation(line: 9, column: 12, scope: !1756)
!1775 = !DILocation(line: 9, column: 5, scope: !1756)
!1776 = !DILocalVariable(name: "s", arg: 1, scope: !69, file: !70, line: 2, type: !13)
!1777 = !DILocation(line: 2, column: 36, scope: !69)
!1778 = !DILocalVariable(name: "delim", arg: 2, scope: !69, file: !70, line: 2, type: !73)
!1779 = !DILocation(line: 2, column: 51, scope: !69)
!1780 = !DILocation(line: 6, column: 9, scope: !1781)
!1781 = distinct !DILexicalBlock(scope: !69, file: !70, line: 6, column: 9)
!1782 = !DILocation(line: 6, column: 11, scope: !1781)
!1783 = !DILocation(line: 6, column: 9, scope: !69)
!1784 = !DILocation(line: 8, column: 13, scope: !1785)
!1785 = distinct !DILexicalBlock(scope: !1781, file: !70, line: 7, column: 5)
!1786 = !DILocation(line: 8, column: 11, scope: !1785)
!1787 = !DILocation(line: 9, column: 5, scope: !1785)
!1788 = !DILocation(line: 11, column: 9, scope: !1789)
!1789 = distinct !DILexicalBlock(scope: !69, file: !70, line: 11, column: 9)
!1790 = !DILocation(line: 11, column: 11, scope: !1789)
!1791 = !DILocation(line: 11, column: 9, scope: !69)
!1792 = !DILocation(line: 13, column: 9, scope: !1793)
!1793 = distinct !DILexicalBlock(scope: !1789, file: !70, line: 12, column: 5)
!1794 = !DILocation(line: 17, column: 5, scope: !69)
!1795 = !DILocation(line: 17, column: 13, scope: !69)
!1796 = !DILocation(line: 17, column: 12, scope: !69)
!1797 = !DILocation(line: 17, column: 15, scope: !69)
!1798 = !DILocalVariable(name: "d", scope: !1799, file: !70, line: 19, type: !73)
!1799 = distinct !DILexicalBlock(scope: !69, file: !70, line: 18, column: 5)
!1800 = !DILocation(line: 19, column: 21, scope: !1799)
!1801 = !DILocation(line: 19, column: 25, scope: !1799)
!1802 = !DILocation(line: 20, column: 9, scope: !1799)
!1803 = !DILocation(line: 20, column: 17, scope: !1799)
!1804 = !DILocation(line: 20, column: 16, scope: !1799)
!1805 = !DILocation(line: 20, column: 19, scope: !1799)
!1806 = !DILocation(line: 20, column: 24, scope: !1799)
!1807 = !DILocation(line: 20, column: 28, scope: !1799)
!1808 = !DILocation(line: 20, column: 27, scope: !1799)
!1809 = !DILocation(line: 20, column: 34, scope: !1799)
!1810 = !DILocation(line: 20, column: 33, scope: !1799)
!1811 = !DILocation(line: 20, column: 30, scope: !1799)
!1812 = !DILocation(line: 0, scope: !1799)
!1813 = !DILocation(line: 22, column: 14, scope: !1814)
!1814 = distinct !DILexicalBlock(scope: !1799, file: !70, line: 21, column: 9)
!1815 = distinct !{!1815, !1802, !1816, !237}
!1816 = !DILocation(line: 23, column: 9, scope: !1799)
!1817 = !DILocation(line: 24, column: 14, scope: !1818)
!1818 = distinct !DILexicalBlock(scope: !1799, file: !70, line: 24, column: 13)
!1819 = !DILocation(line: 24, column: 13, scope: !1818)
!1820 = !DILocation(line: 24, column: 16, scope: !1818)
!1821 = !DILocation(line: 24, column: 13, scope: !1799)
!1822 = !DILocation(line: 26, column: 13, scope: !1823)
!1823 = distinct !DILexicalBlock(scope: !1818, file: !70, line: 25, column: 9)
!1824 = !DILocation(line: 28, column: 10, scope: !1799)
!1825 = distinct !{!1825, !1794, !1826, !237}
!1826 = !DILocation(line: 29, column: 5, scope: !69)
!1827 = !DILocation(line: 31, column: 10, scope: !1828)
!1828 = distinct !DILexicalBlock(scope: !69, file: !70, line: 31, column: 9)
!1829 = !DILocation(line: 31, column: 9, scope: !1828)
!1830 = !DILocation(line: 31, column: 12, scope: !1828)
!1831 = !DILocation(line: 31, column: 9, scope: !69)
!1832 = !DILocation(line: 33, column: 14, scope: !1833)
!1833 = distinct !DILexicalBlock(scope: !1828, file: !70, line: 32, column: 5)
!1834 = !DILocation(line: 34, column: 9, scope: !1833)
!1835 = !DILocalVariable(name: "token", scope: !69, file: !70, line: 37, type: !13)
!1836 = !DILocation(line: 37, column: 11, scope: !69)
!1837 = !DILocation(line: 37, column: 19, scope: !69)
!1838 = !DILocation(line: 40, column: 5, scope: !69)
!1839 = !DILocation(line: 40, column: 13, scope: !69)
!1840 = !DILocation(line: 40, column: 12, scope: !69)
!1841 = !DILocation(line: 40, column: 15, scope: !69)
!1842 = !DILocalVariable(name: "d", scope: !1843, file: !70, line: 42, type: !73)
!1843 = distinct !DILexicalBlock(scope: !69, file: !70, line: 41, column: 5)
!1844 = !DILocation(line: 42, column: 21, scope: !1843)
!1845 = !DILocation(line: 42, column: 25, scope: !1843)
!1846 = !DILocation(line: 43, column: 9, scope: !1843)
!1847 = !DILocation(line: 43, column: 17, scope: !1843)
!1848 = !DILocation(line: 43, column: 16, scope: !1843)
!1849 = !DILocation(line: 43, column: 19, scope: !1843)
!1850 = !DILocation(line: 43, column: 24, scope: !1843)
!1851 = !DILocation(line: 43, column: 28, scope: !1843)
!1852 = !DILocation(line: 43, column: 27, scope: !1843)
!1853 = !DILocation(line: 43, column: 34, scope: !1843)
!1854 = !DILocation(line: 43, column: 33, scope: !1843)
!1855 = !DILocation(line: 43, column: 30, scope: !1843)
!1856 = !DILocation(line: 0, scope: !1843)
!1857 = !DILocation(line: 45, column: 14, scope: !1858)
!1858 = distinct !DILexicalBlock(scope: !1843, file: !70, line: 44, column: 9)
!1859 = distinct !{!1859, !1846, !1860, !237}
!1860 = !DILocation(line: 46, column: 9, scope: !1843)
!1861 = !DILocation(line: 47, column: 14, scope: !1862)
!1862 = distinct !DILexicalBlock(scope: !1843, file: !70, line: 47, column: 13)
!1863 = !DILocation(line: 47, column: 13, scope: !1862)
!1864 = !DILocation(line: 47, column: 16, scope: !1862)
!1865 = !DILocation(line: 47, column: 13, scope: !1843)
!1866 = !DILocation(line: 49, column: 13, scope: !1867)
!1867 = distinct !DILexicalBlock(scope: !1862, file: !70, line: 48, column: 9)
!1868 = !DILocation(line: 51, column: 10, scope: !1843)
!1869 = distinct !{!1869, !1838, !1870, !237}
!1870 = !DILocation(line: 52, column: 5, scope: !69)
!1871 = !DILocation(line: 54, column: 10, scope: !1872)
!1872 = distinct !DILexicalBlock(scope: !69, file: !70, line: 54, column: 9)
!1873 = !DILocation(line: 54, column: 9, scope: !1872)
!1874 = !DILocation(line: 54, column: 12, scope: !1872)
!1875 = !DILocation(line: 54, column: 9, scope: !69)
!1876 = !DILocation(line: 56, column: 10, scope: !1877)
!1877 = distinct !DILexicalBlock(scope: !1872, file: !70, line: 55, column: 5)
!1878 = !DILocation(line: 56, column: 12, scope: !1877)
!1879 = !DILocation(line: 57, column: 10, scope: !1877)
!1880 = !DILocation(line: 58, column: 16, scope: !1877)
!1881 = !DILocation(line: 58, column: 14, scope: !1877)
!1882 = !DILocation(line: 59, column: 5, scope: !1877)
!1883 = !DILocation(line: 62, column: 14, scope: !1884)
!1884 = distinct !DILexicalBlock(scope: !1872, file: !70, line: 61, column: 5)
!1885 = !DILocation(line: 65, column: 12, scope: !69)
!1886 = !DILocation(line: 65, column: 5, scope: !69)
!1887 = !DILocation(line: 66, column: 1, scope: !69)
!1888 = distinct !DISubprogram(name: "__fizzer_model__strxfrm", scope: !1889, file: !1889, line: 2, type: !1890, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !146, retainedNodes: !63)
!1889 = !DIFile(filename: "data/models/c/std/string/strxfrm.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "989278973572eb57b2d093785a278add")
!1890 = !DISubroutineType(types: !1891)
!1891 = !{!1892, !13, !73, !1892}
!1892 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1893, line: 6, baseType: !209)
!1893 = !DIFile(filename: "data/models/c/std/string/strxfrm.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "710e97a829760447cb50814df00571f8")
!1894 = !DILocalVariable(name: "dest", arg: 1, scope: !1888, file: !1889, line: 2, type: !13)
!1895 = !DILocation(line: 2, column: 38, scope: !1888)
!1896 = !DILocalVariable(name: "src", arg: 2, scope: !1888, file: !1889, line: 2, type: !73)
!1897 = !DILocation(line: 2, column: 56, scope: !1888)
!1898 = !DILocalVariable(name: "n", arg: 3, scope: !1888, file: !1889, line: 2, type: !1892)
!1899 = !DILocation(line: 2, column: 68, scope: !1888)
!1900 = !DILocalVariable(name: "len", scope: !1888, file: !1889, line: 4, type: !1892)
!1901 = !DILocation(line: 4, column: 12, scope: !1888)
!1902 = !DILocalVariable(name: "s", scope: !1888, file: !1889, line: 5, type: !73)
!1903 = !DILocation(line: 5, column: 17, scope: !1888)
!1904 = !DILocation(line: 5, column: 21, scope: !1888)
!1905 = !DILocation(line: 8, column: 5, scope: !1888)
!1906 = !DILocation(line: 8, column: 13, scope: !1888)
!1907 = !DILocation(line: 8, column: 12, scope: !1888)
!1908 = !DILocation(line: 8, column: 15, scope: !1888)
!1909 = !DILocation(line: 10, column: 12, scope: !1910)
!1910 = distinct !DILexicalBlock(scope: !1888, file: !1889, line: 9, column: 5)
!1911 = !DILocation(line: 11, column: 10, scope: !1910)
!1912 = distinct !{!1912, !1905, !1913, !237}
!1913 = !DILocation(line: 12, column: 5, scope: !1888)
!1914 = !DILocation(line: 15, column: 9, scope: !1915)
!1915 = distinct !DILexicalBlock(scope: !1888, file: !1889, line: 15, column: 9)
!1916 = !DILocation(line: 15, column: 11, scope: !1915)
!1917 = !DILocation(line: 15, column: 9, scope: !1888)
!1918 = !DILocalVariable(name: "i", scope: !1919, file: !1889, line: 17, type: !1892)
!1919 = distinct !DILexicalBlock(scope: !1915, file: !1889, line: 16, column: 5)
!1920 = !DILocation(line: 17, column: 16, scope: !1919)
!1921 = !DILocation(line: 18, column: 9, scope: !1919)
!1922 = !DILocation(line: 18, column: 16, scope: !1919)
!1923 = !DILocation(line: 18, column: 20, scope: !1919)
!1924 = !DILocation(line: 18, column: 22, scope: !1919)
!1925 = !DILocation(line: 18, column: 18, scope: !1919)
!1926 = !DILocation(line: 18, column: 26, scope: !1919)
!1927 = !DILocation(line: 18, column: 29, scope: !1919)
!1928 = !DILocation(line: 18, column: 33, scope: !1919)
!1929 = !DILocation(line: 18, column: 36, scope: !1919)
!1930 = !DILocation(line: 0, scope: !1919)
!1931 = !DILocation(line: 20, column: 23, scope: !1932)
!1932 = distinct !DILexicalBlock(scope: !1919, file: !1889, line: 19, column: 9)
!1933 = !DILocation(line: 20, column: 27, scope: !1932)
!1934 = !DILocation(line: 20, column: 13, scope: !1932)
!1935 = !DILocation(line: 20, column: 18, scope: !1932)
!1936 = !DILocation(line: 20, column: 21, scope: !1932)
!1937 = !DILocation(line: 21, column: 14, scope: !1932)
!1938 = distinct !{!1938, !1921, !1939, !237}
!1939 = !DILocation(line: 22, column: 9, scope: !1919)
!1940 = !DILocation(line: 23, column: 9, scope: !1919)
!1941 = !DILocation(line: 23, column: 14, scope: !1919)
!1942 = !DILocation(line: 23, column: 17, scope: !1919)
!1943 = !DILocation(line: 24, column: 5, scope: !1919)
!1944 = !DILocation(line: 26, column: 12, scope: !1888)
!1945 = !DILocation(line: 26, column: 5, scope: !1888)
!1946 = distinct !DISubprogram(name: "__fizzer_model__iscntrl", scope: !1947, file: !1947, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !148, retainedNodes: !63)
!1947 = !DIFile(filename: "data/models/c/std/ctype/iscntrl.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "1d16fabd886360902b60cd5383ecd536")
!1948 = !DILocalVariable(name: "c", arg: 1, scope: !1946, file: !1947, line: 2, type: !6)
!1949 = !DILocation(line: 2, column: 33, scope: !1946)
!1950 = !DILocation(line: 4, column: 10, scope: !1951)
!1951 = distinct !DILexicalBlock(scope: !1946, file: !1947, line: 4, column: 9)
!1952 = !DILocation(line: 4, column: 12, scope: !1951)
!1953 = !DILocation(line: 4, column: 17, scope: !1951)
!1954 = !DILocation(line: 4, column: 20, scope: !1951)
!1955 = !DILocation(line: 4, column: 22, scope: !1951)
!1956 = !DILocation(line: 4, column: 29, scope: !1951)
!1957 = !DILocation(line: 4, column: 32, scope: !1951)
!1958 = !DILocation(line: 4, column: 34, scope: !1951)
!1959 = !DILocation(line: 4, column: 9, scope: !1946)
!1960 = !DILocation(line: 6, column: 9, scope: !1961)
!1961 = distinct !DILexicalBlock(scope: !1951, file: !1947, line: 5, column: 5)
!1962 = !DILocation(line: 8, column: 5, scope: !1946)
!1963 = !DILocation(line: 9, column: 1, scope: !1946)
!1964 = distinct !DISubprogram(name: "__fizzer_model__isxdigit", scope: !1965, file: !1965, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !150, retainedNodes: !63)
!1965 = !DIFile(filename: "data/models/c/std/ctype/isxdigit.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "0abf049bb725434344eee06d1063bde8")
!1966 = !DILocalVariable(name: "c", arg: 1, scope: !1964, file: !1965, line: 2, type: !6)
!1967 = !DILocation(line: 2, column: 34, scope: !1964)
!1968 = !DILocation(line: 4, column: 34, scope: !1969)
!1969 = distinct !DILexicalBlock(scope: !1964, file: !1965, line: 4, column: 9)
!1970 = !DILocation(line: 4, column: 10, scope: !1969)
!1971 = !DILocation(line: 4, column: 38, scope: !1969)
!1972 = !DILocation(line: 5, column: 10, scope: !1969)
!1973 = !DILocation(line: 5, column: 12, scope: !1969)
!1974 = !DILocation(line: 5, column: 19, scope: !1969)
!1975 = !DILocation(line: 5, column: 22, scope: !1969)
!1976 = !DILocation(line: 5, column: 24, scope: !1969)
!1977 = !DILocation(line: 5, column: 32, scope: !1969)
!1978 = !DILocation(line: 6, column: 10, scope: !1969)
!1979 = !DILocation(line: 6, column: 12, scope: !1969)
!1980 = !DILocation(line: 6, column: 19, scope: !1969)
!1981 = !DILocation(line: 6, column: 22, scope: !1969)
!1982 = !DILocation(line: 6, column: 24, scope: !1969)
!1983 = !DILocation(line: 4, column: 9, scope: !1964)
!1984 = !DILocation(line: 8, column: 9, scope: !1985)
!1985 = distinct !DILexicalBlock(scope: !1969, file: !1965, line: 7, column: 5)
!1986 = !DILocation(line: 10, column: 5, scope: !1964)
!1987 = !DILocation(line: 11, column: 1, scope: !1964)
!1988 = distinct !DISubprogram(name: "__fizzer_model__isalnum", scope: !1989, file: !1989, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !152, retainedNodes: !63)
!1989 = !DIFile(filename: "data/models/c/std/ctype/isalnum.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "6bbe9a062fcf4ea45225490b0c0403ef")
!1990 = !DILocalVariable(name: "c", arg: 1, scope: !1988, file: !1989, line: 2, type: !6)
!1991 = !DILocation(line: 2, column: 33, scope: !1988)
!1992 = !DILocation(line: 4, column: 33, scope: !1993)
!1993 = distinct !DILexicalBlock(scope: !1988, file: !1989, line: 4, column: 9)
!1994 = !DILocation(line: 4, column: 9, scope: !1993)
!1995 = !DILocation(line: 4, column: 36, scope: !1993)
!1996 = !DILocation(line: 4, column: 63, scope: !1993)
!1997 = !DILocation(line: 4, column: 39, scope: !1993)
!1998 = !DILocation(line: 4, column: 9, scope: !1988)
!1999 = !DILocation(line: 6, column: 9, scope: !2000)
!2000 = distinct !DILexicalBlock(scope: !1993, file: !1989, line: 5, column: 5)
!2001 = !DILocation(line: 8, column: 5, scope: !1988)
!2002 = !DILocation(line: 9, column: 1, scope: !1988)
!2003 = distinct !DISubprogram(name: "__fizzer_model__isspace", scope: !2004, file: !2004, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !154, retainedNodes: !63)
!2004 = !DIFile(filename: "data/models/c/std/ctype/isspace.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "9ab9a851c14ac485b9c69b251ca4421f")
!2005 = !DILocalVariable(name: "c", arg: 1, scope: !2003, file: !2004, line: 2, type: !6)
!2006 = !DILocation(line: 2, column: 33, scope: !2003)
!2007 = !DILocation(line: 4, column: 9, scope: !2008)
!2008 = distinct !DILexicalBlock(scope: !2003, file: !2004, line: 4, column: 9)
!2009 = !DILocation(line: 4, column: 11, scope: !2008)
!2010 = !DILocation(line: 4, column: 18, scope: !2008)
!2011 = !DILocation(line: 4, column: 21, scope: !2008)
!2012 = !DILocation(line: 4, column: 23, scope: !2008)
!2013 = !DILocation(line: 4, column: 31, scope: !2008)
!2014 = !DILocation(line: 4, column: 34, scope: !2008)
!2015 = !DILocation(line: 4, column: 36, scope: !2008)
!2016 = !DILocation(line: 4, column: 44, scope: !2008)
!2017 = !DILocation(line: 4, column: 47, scope: !2008)
!2018 = !DILocation(line: 4, column: 49, scope: !2008)
!2019 = !DILocation(line: 4, column: 57, scope: !2008)
!2020 = !DILocation(line: 4, column: 60, scope: !2008)
!2021 = !DILocation(line: 4, column: 62, scope: !2008)
!2022 = !DILocation(line: 4, column: 70, scope: !2008)
!2023 = !DILocation(line: 4, column: 73, scope: !2008)
!2024 = !DILocation(line: 4, column: 75, scope: !2008)
!2025 = !DILocation(line: 4, column: 9, scope: !2003)
!2026 = !DILocation(line: 6, column: 9, scope: !2027)
!2027 = distinct !DILexicalBlock(scope: !2008, file: !2004, line: 5, column: 5)
!2028 = !DILocation(line: 8, column: 5, scope: !2003)
!2029 = !DILocation(line: 9, column: 1, scope: !2003)
!2030 = distinct !DISubprogram(name: "__fizzer_model__isalpha", scope: !2031, file: !2031, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !156, retainedNodes: !63)
!2031 = !DIFile(filename: "data/models/c/std/ctype/isalpha.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "ec45d1a23298cf8353ee76bfbe3010f4")
!2032 = !DILocalVariable(name: "c", arg: 1, scope: !2030, file: !2031, line: 2, type: !6)
!2033 = !DILocation(line: 2, column: 33, scope: !2030)
!2034 = !DILocation(line: 4, column: 10, scope: !2035)
!2035 = distinct !DILexicalBlock(scope: !2030, file: !2031, line: 4, column: 9)
!2036 = !DILocation(line: 4, column: 12, scope: !2035)
!2037 = !DILocation(line: 4, column: 19, scope: !2035)
!2038 = !DILocation(line: 4, column: 22, scope: !2035)
!2039 = !DILocation(line: 4, column: 24, scope: !2035)
!2040 = !DILocation(line: 4, column: 32, scope: !2035)
!2041 = !DILocation(line: 4, column: 36, scope: !2035)
!2042 = !DILocation(line: 4, column: 38, scope: !2035)
!2043 = !DILocation(line: 4, column: 45, scope: !2035)
!2044 = !DILocation(line: 4, column: 48, scope: !2035)
!2045 = !DILocation(line: 4, column: 50, scope: !2035)
!2046 = !DILocation(line: 4, column: 9, scope: !2030)
!2047 = !DILocation(line: 6, column: 9, scope: !2048)
!2048 = distinct !DILexicalBlock(scope: !2035, file: !2031, line: 5, column: 5)
!2049 = !DILocation(line: 8, column: 5, scope: !2030)
!2050 = !DILocation(line: 9, column: 1, scope: !2030)
!2051 = distinct !DISubprogram(name: "__fizzer_model__isblank", scope: !2052, file: !2052, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !158, retainedNodes: !63)
!2052 = !DIFile(filename: "data/models/c/std/ctype/isblank.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "4469204b656f7c8f7e1807d1f4e59567")
!2053 = !DILocalVariable(name: "c", arg: 1, scope: !2051, file: !2052, line: 2, type: !6)
!2054 = !DILocation(line: 2, column: 33, scope: !2051)
!2055 = !DILocation(line: 4, column: 9, scope: !2056)
!2056 = distinct !DILexicalBlock(scope: !2051, file: !2052, line: 4, column: 9)
!2057 = !DILocation(line: 4, column: 11, scope: !2056)
!2058 = !DILocation(line: 4, column: 18, scope: !2056)
!2059 = !DILocation(line: 4, column: 21, scope: !2056)
!2060 = !DILocation(line: 4, column: 23, scope: !2056)
!2061 = !DILocation(line: 4, column: 9, scope: !2051)
!2062 = !DILocation(line: 6, column: 9, scope: !2063)
!2063 = distinct !DILexicalBlock(scope: !2056, file: !2052, line: 5, column: 5)
!2064 = !DILocation(line: 8, column: 5, scope: !2051)
!2065 = !DILocation(line: 9, column: 1, scope: !2051)
!2066 = distinct !DISubprogram(name: "__fizzer_model__islower", scope: !2067, file: !2067, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !160, retainedNodes: !63)
!2067 = !DIFile(filename: "data/models/c/std/ctype/islower.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "7f0db237b2957c408137ff19b95b9f37")
!2068 = !DILocalVariable(name: "c", arg: 1, scope: !2066, file: !2067, line: 2, type: !6)
!2069 = !DILocation(line: 2, column: 33, scope: !2066)
!2070 = !DILocation(line: 4, column: 9, scope: !2071)
!2071 = distinct !DILexicalBlock(scope: !2066, file: !2067, line: 4, column: 9)
!2072 = !DILocation(line: 4, column: 11, scope: !2071)
!2073 = !DILocation(line: 4, column: 18, scope: !2071)
!2074 = !DILocation(line: 4, column: 21, scope: !2071)
!2075 = !DILocation(line: 4, column: 23, scope: !2071)
!2076 = !DILocation(line: 4, column: 9, scope: !2066)
!2077 = !DILocation(line: 6, column: 9, scope: !2078)
!2078 = distinct !DILexicalBlock(scope: !2071, file: !2067, line: 5, column: 5)
!2079 = !DILocation(line: 8, column: 5, scope: !2066)
!2080 = !DILocation(line: 9, column: 1, scope: !2066)
!2081 = distinct !DISubprogram(name: "__fizzer_model__isdigit", scope: !2082, file: !2082, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !162, retainedNodes: !63)
!2082 = !DIFile(filename: "data/models/c/std/ctype/isdigit.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "9967dfc55f3c5b9e8a34a1c12ab51128")
!2083 = !DILocalVariable(name: "c", arg: 1, scope: !2081, file: !2082, line: 2, type: !6)
!2084 = !DILocation(line: 2, column: 33, scope: !2081)
!2085 = !DILocation(line: 4, column: 9, scope: !2086)
!2086 = distinct !DILexicalBlock(scope: !2081, file: !2082, line: 4, column: 9)
!2087 = !DILocation(line: 4, column: 11, scope: !2086)
!2088 = !DILocation(line: 4, column: 18, scope: !2086)
!2089 = !DILocation(line: 4, column: 21, scope: !2086)
!2090 = !DILocation(line: 4, column: 23, scope: !2086)
!2091 = !DILocation(line: 4, column: 9, scope: !2081)
!2092 = !DILocation(line: 6, column: 9, scope: !2093)
!2093 = distinct !DILexicalBlock(scope: !2086, file: !2082, line: 5, column: 5)
!2094 = !DILocation(line: 8, column: 5, scope: !2081)
!2095 = !DILocation(line: 9, column: 1, scope: !2081)
!2096 = distinct !DISubprogram(name: "__fizzer_model__toupper", scope: !2097, file: !2097, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !164, retainedNodes: !63)
!2097 = !DIFile(filename: "data/models/c/std/ctype/toupper.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "35ae67ebdb17b245d732ce3603fdfa64")
!2098 = !DILocalVariable(name: "c", arg: 1, scope: !2096, file: !2097, line: 2, type: !6)
!2099 = !DILocation(line: 2, column: 33, scope: !2096)
!2100 = !DILocation(line: 4, column: 33, scope: !2101)
!2101 = distinct !DILexicalBlock(scope: !2096, file: !2097, line: 4, column: 9)
!2102 = !DILocation(line: 4, column: 9, scope: !2101)
!2103 = !DILocation(line: 4, column: 9, scope: !2096)
!2104 = !DILocation(line: 6, column: 16, scope: !2105)
!2105 = distinct !DILexicalBlock(scope: !2101, file: !2097, line: 5, column: 5)
!2106 = !DILocation(line: 6, column: 18, scope: !2105)
!2107 = !DILocation(line: 6, column: 24, scope: !2105)
!2108 = !DILocation(line: 6, column: 9, scope: !2105)
!2109 = !DILocation(line: 8, column: 12, scope: !2096)
!2110 = !DILocation(line: 8, column: 5, scope: !2096)
!2111 = !DILocation(line: 9, column: 1, scope: !2096)
!2112 = distinct !DISubprogram(name: "__fizzer_model__isprint", scope: !2113, file: !2113, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !166, retainedNodes: !63)
!2113 = !DIFile(filename: "data/models/c/std/ctype/isprint.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "d8538a5b382a98a36fe86b916256fcc7")
!2114 = !DILocalVariable(name: "c", arg: 1, scope: !2112, file: !2113, line: 2, type: !6)
!2115 = !DILocation(line: 2, column: 33, scope: !2112)
!2116 = !DILocation(line: 4, column: 9, scope: !2117)
!2117 = distinct !DILexicalBlock(scope: !2112, file: !2113, line: 4, column: 9)
!2118 = !DILocation(line: 4, column: 11, scope: !2117)
!2119 = !DILocation(line: 4, column: 17, scope: !2117)
!2120 = !DILocation(line: 4, column: 20, scope: !2117)
!2121 = !DILocation(line: 4, column: 22, scope: !2117)
!2122 = !DILocation(line: 4, column: 9, scope: !2112)
!2123 = !DILocation(line: 6, column: 9, scope: !2124)
!2124 = distinct !DILexicalBlock(scope: !2117, file: !2113, line: 5, column: 5)
!2125 = !DILocation(line: 8, column: 5, scope: !2112)
!2126 = !DILocation(line: 9, column: 1, scope: !2112)
!2127 = distinct !DISubprogram(name: "__fizzer_model__isupper", scope: !2128, file: !2128, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !168, retainedNodes: !63)
!2128 = !DIFile(filename: "data/models/c/std/ctype/isupper.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "c2334b5acdb0a1b26cc08f11cf47c244")
!2129 = !DILocalVariable(name: "c", arg: 1, scope: !2127, file: !2128, line: 2, type: !6)
!2130 = !DILocation(line: 2, column: 33, scope: !2127)
!2131 = !DILocation(line: 4, column: 9, scope: !2132)
!2132 = distinct !DILexicalBlock(scope: !2127, file: !2128, line: 4, column: 9)
!2133 = !DILocation(line: 4, column: 11, scope: !2132)
!2134 = !DILocation(line: 4, column: 18, scope: !2132)
!2135 = !DILocation(line: 4, column: 21, scope: !2132)
!2136 = !DILocation(line: 4, column: 23, scope: !2132)
!2137 = !DILocation(line: 4, column: 9, scope: !2127)
!2138 = !DILocation(line: 6, column: 9, scope: !2139)
!2139 = distinct !DILexicalBlock(scope: !2132, file: !2128, line: 5, column: 5)
!2140 = !DILocation(line: 8, column: 5, scope: !2127)
!2141 = !DILocation(line: 9, column: 1, scope: !2127)
!2142 = distinct !DISubprogram(name: "__fizzer_model__tolower", scope: !2143, file: !2143, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !170, retainedNodes: !63)
!2143 = !DIFile(filename: "data/models/c/std/ctype/tolower.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "7faecd1bd1600a814e6c8b43347332c3")
!2144 = !DILocalVariable(name: "c", arg: 1, scope: !2142, file: !2143, line: 2, type: !6)
!2145 = !DILocation(line: 2, column: 33, scope: !2142)
!2146 = !DILocation(line: 4, column: 33, scope: !2147)
!2147 = distinct !DILexicalBlock(scope: !2142, file: !2143, line: 4, column: 9)
!2148 = !DILocation(line: 4, column: 9, scope: !2147)
!2149 = !DILocation(line: 4, column: 9, scope: !2142)
!2150 = !DILocation(line: 6, column: 16, scope: !2151)
!2151 = distinct !DILexicalBlock(scope: !2147, file: !2143, line: 5, column: 5)
!2152 = !DILocation(line: 6, column: 18, scope: !2151)
!2153 = !DILocation(line: 6, column: 24, scope: !2151)
!2154 = !DILocation(line: 6, column: 9, scope: !2151)
!2155 = !DILocation(line: 8, column: 12, scope: !2142)
!2156 = !DILocation(line: 8, column: 5, scope: !2142)
!2157 = !DILocation(line: 9, column: 1, scope: !2142)
!2158 = distinct !DISubprogram(name: "__fizzer_model__isgraph", scope: !2159, file: !2159, line: 2, type: !799, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !172, retainedNodes: !63)
!2159 = !DIFile(filename: "data/models/c/std/ctype/isgraph.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "53707fda19088bc8e89fad78f4c3a13f")
!2160 = !DILocalVariable(name: "c", arg: 1, scope: !2158, file: !2159, line: 2, type: !6)
!2161 = !DILocation(line: 2, column: 33, scope: !2158)
!2162 = !DILocation(line: 4, column: 9, scope: !2163)
!2163 = distinct !DILexicalBlock(scope: !2158, file: !2159, line: 4, column: 9)
!2164 = !DILocation(line: 4, column: 11, scope: !2163)
!2165 = !DILocation(line: 4, column: 17, scope: !2163)
!2166 = !DILocation(line: 4, column: 20, scope: !2163)
!2167 = !DILocation(line: 4, column: 22, scope: !2163)
!2168 = !DILocation(line: 4, column: 9, scope: !2158)
!2169 = !DILocation(line: 6, column: 9, scope: !2170)
!2170 = distinct !DILexicalBlock(scope: !2163, file: !2159, line: 5, column: 5)
!2171 = !DILocation(line: 8, column: 5, scope: !2158)
!2172 = !DILocation(line: 9, column: 1, scope: !2158)
!2173 = distinct !DISubprogram(name: "__fizzer_model__snprintf", scope: !2174, file: !2174, line: 2, type: !2175, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !174, retainedNodes: !63)
!2174 = !DIFile(filename: "data/models/c/std/stdio/snprintf.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "76bc06d30e021e08fbd62dcb20d50aff")
!2175 = !DISubroutineType(types: !2176)
!2176 = !{!6, !13, !2177, !73, null}
!2177 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2178, line: 6, baseType: !209)
!2178 = !DIFile(filename: "data/models/c/std/stdio/snprintf.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "3041458efcb1c5564be86cab3319404a")
!2179 = !DILocalVariable(name: "str", arg: 1, scope: !2173, file: !2174, line: 2, type: !13)
!2180 = !DILocation(line: 2, column: 36, scope: !2173)
!2181 = !DILocalVariable(name: "size", arg: 2, scope: !2173, file: !2174, line: 2, type: !2177)
!2182 = !DILocation(line: 2, column: 48, scope: !2173)
!2183 = !DILocalVariable(name: "format", arg: 3, scope: !2173, file: !2174, line: 2, type: !73)
!2184 = !DILocation(line: 2, column: 66, scope: !2173)
!2185 = !DILocalVariable(name: "ap", scope: !2173, file: !2174, line: 4, type: !2186)
!2186 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !2178, line: 14, baseType: !2187)
!2187 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !2174, baseType: !2188)
!2188 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2189, size: 192, elements: !2196)
!2189 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, elements: !2190)
!2190 = !{!2191, !2193, !2194, !2195}
!2191 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !2189, file: !2174, line: 4, baseType: !2192, size: 32)
!2192 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!2193 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !2189, file: !2174, line: 4, baseType: !2192, size: 32, offset: 32)
!2194 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !2189, file: !2174, line: 4, baseType: !143, size: 64, offset: 64)
!2195 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !2189, file: !2174, line: 4, baseType: !143, size: 64, offset: 128)
!2196 = !{!2197}
!2197 = !DISubrange(count: 1)
!2198 = !DILocation(line: 4, column: 13, scope: !2173)
!2199 = !DILocation(line: 5, column: 5, scope: !2173)
!2200 = !DILocalVariable(name: "result", scope: !2173, file: !2174, line: 6, type: !6)
!2201 = !DILocation(line: 6, column: 9, scope: !2173)
!2202 = !DILocation(line: 6, column: 44, scope: !2173)
!2203 = !DILocation(line: 6, column: 49, scope: !2173)
!2204 = !DILocation(line: 6, column: 55, scope: !2173)
!2205 = !DILocation(line: 6, column: 63, scope: !2173)
!2206 = !DILocation(line: 6, column: 18, scope: !2173)
!2207 = !DILocation(line: 7, column: 5, scope: !2173)
!2208 = !DILocation(line: 8, column: 12, scope: !2173)
!2209 = !DILocation(line: 8, column: 5, scope: !2173)
!2210 = distinct !DISubprogram(name: "__fizzer_model__sprintf", scope: !2211, file: !2211, line: 2, type: !2212, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !176, retainedNodes: !63)
!2211 = !DIFile(filename: "data/models/c/std/stdio/sprintf.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "56f45916c6775fca737b2a248636b9a4")
!2212 = !DISubroutineType(types: !2213)
!2213 = !{!6, !13, !73, null}
!2214 = !DILocalVariable(name: "str", arg: 1, scope: !2210, file: !2211, line: 2, type: !13)
!2215 = !DILocation(line: 2, column: 35, scope: !2210)
!2216 = !DILocalVariable(name: "format", arg: 2, scope: !2210, file: !2211, line: 2, type: !73)
!2217 = !DILocation(line: 2, column: 52, scope: !2210)
!2218 = !DILocalVariable(name: "ap", scope: !2210, file: !2211, line: 4, type: !2219)
!2219 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !2220, line: 4, baseType: !2221)
!2220 = !DIFile(filename: "data/models/c/std/stdio/sprintf.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "d6124a58b9c67c791cdec6fe4c5e48a1")
!2221 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !2211, baseType: !2222)
!2222 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2223, size: 192, elements: !2196)
!2223 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, elements: !2224)
!2224 = !{!2225, !2226, !2227, !2228}
!2225 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !2223, file: !2211, line: 4, baseType: !2192, size: 32)
!2226 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !2223, file: !2211, line: 4, baseType: !2192, size: 32, offset: 32)
!2227 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !2223, file: !2211, line: 4, baseType: !143, size: 64, offset: 64)
!2228 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !2223, file: !2211, line: 4, baseType: !143, size: 64, offset: 128)
!2229 = !DILocation(line: 4, column: 13, scope: !2210)
!2230 = !DILocation(line: 5, column: 5, scope: !2210)
!2231 = !DILocalVariable(name: "result", scope: !2210, file: !2211, line: 6, type: !6)
!2232 = !DILocation(line: 6, column: 9, scope: !2210)
!2233 = !DILocation(line: 6, column: 43, scope: !2210)
!2234 = !DILocation(line: 6, column: 48, scope: !2210)
!2235 = !DILocation(line: 6, column: 56, scope: !2210)
!2236 = !DILocation(line: 6, column: 18, scope: !2210)
!2237 = !DILocation(line: 7, column: 5, scope: !2210)
!2238 = !DILocation(line: 8, column: 12, scope: !2210)
!2239 = !DILocation(line: 8, column: 5, scope: !2210)
!2240 = distinct !DISubprogram(name: "__fizzer_model__vsprintf", scope: !2241, file: !2241, line: 2, type: !2242, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !178, retainedNodes: !63)
!2241 = !DIFile(filename: "data/models/c/std/stdio/vsprintf.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "108c7547e9301a0fdafaac5451fdb696")
!2242 = !DISubroutineType(types: !2243)
!2243 = !{!6, !13, !73, !2244}
!2244 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2245, size: 64)
!2245 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, elements: !2246)
!2246 = !{!2247, !2248, !2249, !2250}
!2247 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !2245, file: !2241, baseType: !2192, size: 32)
!2248 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !2245, file: !2241, baseType: !2192, size: 32, offset: 32)
!2249 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !2245, file: !2241, baseType: !143, size: 64, offset: 64)
!2250 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !2245, file: !2241, baseType: !143, size: 64, offset: 128)
!2251 = !DILocalVariable(name: "str", arg: 1, scope: !2240, file: !2241, line: 2, type: !13)
!2252 = !DILocation(line: 2, column: 36, scope: !2240)
!2253 = !DILocalVariable(name: "format", arg: 2, scope: !2240, file: !2241, line: 2, type: !73)
!2254 = !DILocation(line: 2, column: 53, scope: !2240)
!2255 = !DILocalVariable(name: "ap", arg: 3, scope: !2240, file: !2241, line: 2, type: !2244)
!2256 = !DILocation(line: 2, column: 69, scope: !2240)
!2257 = !DILocalVariable(name: "i", scope: !2240, file: !2241, line: 4, type: !2258)
!2258 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2259, line: 6, baseType: !209)
!2259 = !DIFile(filename: "data/models/c/std/stdio/vsprintf.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "22dc0c17cd450f7813777d9af49e0ce8")
!2260 = !DILocation(line: 4, column: 12, scope: !2240)
!2261 = !DILocalVariable(name: "j", scope: !2240, file: !2241, line: 5, type: !2258)
!2262 = !DILocation(line: 5, column: 12, scope: !2240)
!2263 = !DILocation(line: 7, column: 5, scope: !2240)
!2264 = !DILocation(line: 7, column: 12, scope: !2240)
!2265 = !DILocation(line: 7, column: 19, scope: !2240)
!2266 = !DILocation(line: 7, column: 22, scope: !2240)
!2267 = !DILocation(line: 9, column: 13, scope: !2268)
!2268 = distinct !DILexicalBlock(scope: !2269, file: !2241, line: 9, column: 13)
!2269 = distinct !DILexicalBlock(scope: !2240, file: !2241, line: 8, column: 5)
!2270 = !DILocation(line: 9, column: 20, scope: !2268)
!2271 = !DILocation(line: 9, column: 23, scope: !2268)
!2272 = !DILocation(line: 9, column: 13, scope: !2269)
!2273 = !DILocation(line: 11, column: 14, scope: !2274)
!2274 = distinct !DILexicalBlock(scope: !2268, file: !2241, line: 10, column: 9)
!2275 = !DILocation(line: 12, column: 17, scope: !2276)
!2276 = distinct !DILexicalBlock(scope: !2274, file: !2241, line: 12, column: 17)
!2277 = !DILocation(line: 12, column: 24, scope: !2276)
!2278 = !DILocation(line: 12, column: 27, scope: !2276)
!2279 = !DILocation(line: 12, column: 17, scope: !2274)
!2280 = !DILocation(line: 14, column: 17, scope: !2281)
!2281 = distinct !DILexicalBlock(scope: !2276, file: !2241, line: 13, column: 13)
!2282 = !DILocation(line: 17, column: 17, scope: !2283)
!2283 = distinct !DILexicalBlock(scope: !2274, file: !2241, line: 17, column: 17)
!2284 = !DILocation(line: 17, column: 24, scope: !2283)
!2285 = !DILocation(line: 17, column: 27, scope: !2283)
!2286 = !DILocation(line: 17, column: 17, scope: !2274)
!2287 = !DILocalVariable(name: "val", scope: !2288, file: !2241, line: 19, type: !6)
!2288 = distinct !DILexicalBlock(scope: !2283, file: !2241, line: 18, column: 13)
!2289 = !DILocation(line: 19, column: 21, scope: !2288)
!2290 = !DILocation(line: 19, column: 27, scope: !2288)
!2291 = !DILocalVariable(name: "buf", scope: !2288, file: !2241, line: 20, type: !2292)
!2292 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 256, elements: !2293)
!2293 = !{!2294}
!2294 = !DISubrange(count: 32)
!2295 = !DILocation(line: 20, column: 22, scope: !2288)
!2296 = !DILocation(line: 21, column: 45, scope: !2288)
!2297 = !DILocation(line: 21, column: 50, scope: !2288)
!2298 = !DILocation(line: 21, column: 17, scope: !2288)
!2299 = !DILocalVariable(name: "k", scope: !2288, file: !2241, line: 22, type: !2258)
!2300 = !DILocation(line: 22, column: 24, scope: !2288)
!2301 = !DILocation(line: 23, column: 17, scope: !2288)
!2302 = !DILocation(line: 23, column: 28, scope: !2288)
!2303 = !DILocation(line: 23, column: 24, scope: !2288)
!2304 = !DILocation(line: 23, column: 31, scope: !2288)
!2305 = !DILocation(line: 25, column: 34, scope: !2306)
!2306 = distinct !DILexicalBlock(scope: !2288, file: !2241, line: 24, column: 17)
!2307 = !DILocation(line: 25, column: 30, scope: !2306)
!2308 = !DILocation(line: 25, column: 21, scope: !2306)
!2309 = !DILocation(line: 25, column: 25, scope: !2306)
!2310 = !DILocation(line: 25, column: 28, scope: !2306)
!2311 = !DILocation(line: 26, column: 22, scope: !2306)
!2312 = !DILocation(line: 27, column: 22, scope: !2306)
!2313 = distinct !{!2313, !2301, !2314, !237}
!2314 = !DILocation(line: 28, column: 17, scope: !2288)
!2315 = !DILocation(line: 29, column: 13, scope: !2288)
!2316 = !DILocation(line: 30, column: 22, scope: !2317)
!2317 = distinct !DILexicalBlock(scope: !2283, file: !2241, line: 30, column: 22)
!2318 = !DILocation(line: 30, column: 29, scope: !2317)
!2319 = !DILocation(line: 30, column: 32, scope: !2317)
!2320 = !DILocation(line: 30, column: 22, scope: !2283)
!2321 = !DILocalVariable(name: "val", scope: !2322, file: !2241, line: 32, type: !2192)
!2322 = distinct !DILexicalBlock(scope: !2317, file: !2241, line: 31, column: 13)
!2323 = !DILocation(line: 32, column: 30, scope: !2322)
!2324 = !DILocation(line: 32, column: 36, scope: !2322)
!2325 = !DILocalVariable(name: "buf", scope: !2322, file: !2241, line: 33, type: !2292)
!2326 = !DILocation(line: 33, column: 22, scope: !2322)
!2327 = !DILocation(line: 34, column: 50, scope: !2322)
!2328 = !DILocation(line: 34, column: 55, scope: !2322)
!2329 = !DILocation(line: 34, column: 17, scope: !2322)
!2330 = !DILocalVariable(name: "k", scope: !2322, file: !2241, line: 35, type: !2258)
!2331 = !DILocation(line: 35, column: 24, scope: !2322)
!2332 = !DILocation(line: 36, column: 17, scope: !2322)
!2333 = !DILocation(line: 36, column: 28, scope: !2322)
!2334 = !DILocation(line: 36, column: 24, scope: !2322)
!2335 = !DILocation(line: 36, column: 31, scope: !2322)
!2336 = !DILocation(line: 38, column: 34, scope: !2337)
!2337 = distinct !DILexicalBlock(scope: !2322, file: !2241, line: 37, column: 17)
!2338 = !DILocation(line: 38, column: 30, scope: !2337)
!2339 = !DILocation(line: 38, column: 21, scope: !2337)
!2340 = !DILocation(line: 38, column: 25, scope: !2337)
!2341 = !DILocation(line: 38, column: 28, scope: !2337)
!2342 = !DILocation(line: 39, column: 22, scope: !2337)
!2343 = !DILocation(line: 40, column: 22, scope: !2337)
!2344 = distinct !{!2344, !2332, !2345, !237}
!2345 = !DILocation(line: 41, column: 17, scope: !2322)
!2346 = !DILocation(line: 42, column: 13, scope: !2322)
!2347 = !DILocation(line: 43, column: 22, scope: !2348)
!2348 = distinct !DILexicalBlock(scope: !2317, file: !2241, line: 43, column: 22)
!2349 = !DILocation(line: 43, column: 29, scope: !2348)
!2350 = !DILocation(line: 43, column: 32, scope: !2348)
!2351 = !DILocation(line: 43, column: 22, scope: !2317)
!2352 = !DILocalVariable(name: "val", scope: !2353, file: !2241, line: 45, type: !2192)
!2353 = distinct !DILexicalBlock(scope: !2348, file: !2241, line: 44, column: 13)
!2354 = !DILocation(line: 45, column: 30, scope: !2353)
!2355 = !DILocation(line: 45, column: 36, scope: !2353)
!2356 = !DILocalVariable(name: "buf", scope: !2353, file: !2241, line: 46, type: !2292)
!2357 = !DILocation(line: 46, column: 22, scope: !2353)
!2358 = !DILocation(line: 47, column: 50, scope: !2353)
!2359 = !DILocation(line: 47, column: 55, scope: !2353)
!2360 = !DILocation(line: 47, column: 17, scope: !2353)
!2361 = !DILocalVariable(name: "k", scope: !2353, file: !2241, line: 48, type: !2258)
!2362 = !DILocation(line: 48, column: 24, scope: !2353)
!2363 = !DILocation(line: 49, column: 17, scope: !2353)
!2364 = !DILocation(line: 49, column: 28, scope: !2353)
!2365 = !DILocation(line: 49, column: 24, scope: !2353)
!2366 = !DILocation(line: 49, column: 31, scope: !2353)
!2367 = !DILocation(line: 51, column: 34, scope: !2368)
!2368 = distinct !DILexicalBlock(scope: !2353, file: !2241, line: 50, column: 17)
!2369 = !DILocation(line: 51, column: 30, scope: !2368)
!2370 = !DILocation(line: 51, column: 21, scope: !2368)
!2371 = !DILocation(line: 51, column: 25, scope: !2368)
!2372 = !DILocation(line: 51, column: 28, scope: !2368)
!2373 = !DILocation(line: 52, column: 22, scope: !2368)
!2374 = !DILocation(line: 53, column: 22, scope: !2368)
!2375 = distinct !{!2375, !2363, !2376, !237}
!2376 = !DILocation(line: 54, column: 17, scope: !2353)
!2377 = !DILocation(line: 55, column: 13, scope: !2353)
!2378 = !DILocation(line: 56, column: 22, scope: !2379)
!2379 = distinct !DILexicalBlock(scope: !2348, file: !2241, line: 56, column: 22)
!2380 = !DILocation(line: 56, column: 29, scope: !2379)
!2381 = !DILocation(line: 56, column: 32, scope: !2379)
!2382 = !DILocation(line: 56, column: 22, scope: !2348)
!2383 = !DILocalVariable(name: "c", scope: !2384, file: !2241, line: 58, type: !14)
!2384 = distinct !DILexicalBlock(scope: !2379, file: !2241, line: 57, column: 13)
!2385 = !DILocation(line: 58, column: 22, scope: !2384)
!2386 = !DILocation(line: 58, column: 32, scope: !2384)
!2387 = !DILocation(line: 58, column: 26, scope: !2384)
!2388 = !DILocation(line: 59, column: 26, scope: !2384)
!2389 = !DILocation(line: 59, column: 17, scope: !2384)
!2390 = !DILocation(line: 59, column: 21, scope: !2384)
!2391 = !DILocation(line: 59, column: 24, scope: !2384)
!2392 = !DILocation(line: 60, column: 18, scope: !2384)
!2393 = !DILocation(line: 61, column: 13, scope: !2384)
!2394 = !DILocation(line: 62, column: 22, scope: !2395)
!2395 = distinct !DILexicalBlock(scope: !2379, file: !2241, line: 62, column: 22)
!2396 = !DILocation(line: 62, column: 29, scope: !2395)
!2397 = !DILocation(line: 62, column: 32, scope: !2395)
!2398 = !DILocation(line: 62, column: 22, scope: !2379)
!2399 = !DILocalVariable(name: "s", scope: !2400, file: !2241, line: 64, type: !13)
!2400 = distinct !DILexicalBlock(scope: !2395, file: !2241, line: 63, column: 13)
!2401 = !DILocation(line: 64, column: 23, scope: !2400)
!2402 = !DILocation(line: 64, column: 27, scope: !2400)
!2403 = !DILocalVariable(name: "k", scope: !2400, file: !2241, line: 65, type: !2258)
!2404 = !DILocation(line: 65, column: 24, scope: !2400)
!2405 = !DILocation(line: 66, column: 17, scope: !2400)
!2406 = !DILocation(line: 66, column: 24, scope: !2400)
!2407 = !DILocation(line: 66, column: 26, scope: !2400)
!2408 = !DILocation(line: 66, column: 29, scope: !2400)
!2409 = !DILocation(line: 68, column: 30, scope: !2410)
!2410 = distinct !DILexicalBlock(scope: !2400, file: !2241, line: 67, column: 17)
!2411 = !DILocation(line: 68, column: 32, scope: !2410)
!2412 = !DILocation(line: 68, column: 21, scope: !2410)
!2413 = !DILocation(line: 68, column: 25, scope: !2410)
!2414 = !DILocation(line: 68, column: 28, scope: !2410)
!2415 = !DILocation(line: 69, column: 22, scope: !2410)
!2416 = !DILocation(line: 70, column: 22, scope: !2410)
!2417 = distinct !{!2417, !2405, !2418, !237}
!2418 = !DILocation(line: 71, column: 17, scope: !2400)
!2419 = !DILocation(line: 72, column: 13, scope: !2400)
!2420 = !DILocation(line: 75, column: 26, scope: !2421)
!2421 = distinct !DILexicalBlock(scope: !2395, file: !2241, line: 74, column: 13)
!2422 = !DILocation(line: 75, column: 33, scope: !2421)
!2423 = !DILocation(line: 75, column: 17, scope: !2421)
!2424 = !DILocation(line: 75, column: 21, scope: !2421)
!2425 = !DILocation(line: 75, column: 24, scope: !2421)
!2426 = !DILocation(line: 76, column: 18, scope: !2421)
!2427 = !DILocation(line: 79, column: 14, scope: !2274)
!2428 = !DILocation(line: 80, column: 9, scope: !2274)
!2429 = !DILocation(line: 83, column: 22, scope: !2430)
!2430 = distinct !DILexicalBlock(scope: !2268, file: !2241, line: 82, column: 9)
!2431 = !DILocation(line: 83, column: 29, scope: !2430)
!2432 = !DILocation(line: 83, column: 13, scope: !2430)
!2433 = !DILocation(line: 83, column: 17, scope: !2430)
!2434 = !DILocation(line: 83, column: 20, scope: !2430)
!2435 = !DILocation(line: 84, column: 14, scope: !2430)
!2436 = !DILocation(line: 85, column: 14, scope: !2430)
!2437 = distinct !{!2437, !2263, !2438, !237}
!2438 = !DILocation(line: 87, column: 5, scope: !2240)
!2439 = !DILocation(line: 89, column: 5, scope: !2240)
!2440 = !DILocation(line: 89, column: 9, scope: !2240)
!2441 = !DILocation(line: 89, column: 12, scope: !2240)
!2442 = !DILocation(line: 91, column: 17, scope: !2240)
!2443 = !DILocation(line: 91, column: 12, scope: !2240)
!2444 = !DILocation(line: 91, column: 5, scope: !2240)
!2445 = distinct !DISubprogram(name: "__fizzer_model__helper_itoa", scope: !2446, file: !2446, line: 2, type: !2447, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !181, retainedNodes: !63)
!2446 = !DIFile(filename: "data/models/c/std/stdio/helper_itoa.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "20d31603d5d66432f19663f52fc24b10")
!2447 = !DISubroutineType(types: !2448)
!2448 = !{null, !6, !13, !6}
!2449 = !DILocalVariable(name: "value", arg: 1, scope: !2445, file: !2446, line: 2, type: !6)
!2450 = !DILocation(line: 2, column: 38, scope: !2445)
!2451 = !DILocalVariable(name: "buffer", arg: 2, scope: !2445, file: !2446, line: 2, type: !13)
!2452 = !DILocation(line: 2, column: 51, scope: !2445)
!2453 = !DILocalVariable(name: "base", arg: 3, scope: !2445, file: !2446, line: 2, type: !6)
!2454 = !DILocation(line: 2, column: 63, scope: !2445)
!2455 = !DILocalVariable(name: "temp", scope: !2445, file: !2446, line: 4, type: !2292)
!2456 = !DILocation(line: 4, column: 10, scope: !2445)
!2457 = !DILocalVariable(name: "i", scope: !2445, file: !2446, line: 5, type: !6)
!2458 = !DILocation(line: 5, column: 9, scope: !2445)
!2459 = !DILocalVariable(name: "is_negative", scope: !2445, file: !2446, line: 6, type: !6)
!2460 = !DILocation(line: 6, column: 9, scope: !2445)
!2461 = !DILocation(line: 8, column: 9, scope: !2462)
!2462 = distinct !DILexicalBlock(scope: !2445, file: !2446, line: 8, column: 9)
!2463 = !DILocation(line: 8, column: 15, scope: !2462)
!2464 = !DILocation(line: 8, column: 19, scope: !2462)
!2465 = !DILocation(line: 8, column: 22, scope: !2462)
!2466 = !DILocation(line: 8, column: 27, scope: !2462)
!2467 = !DILocation(line: 8, column: 9, scope: !2445)
!2468 = !DILocation(line: 10, column: 21, scope: !2469)
!2469 = distinct !DILexicalBlock(scope: !2462, file: !2446, line: 9, column: 5)
!2470 = !DILocation(line: 11, column: 18, scope: !2469)
!2471 = !DILocation(line: 11, column: 17, scope: !2469)
!2472 = !DILocation(line: 11, column: 15, scope: !2469)
!2473 = !DILocation(line: 12, column: 5, scope: !2469)
!2474 = !DILocation(line: 14, column: 9, scope: !2475)
!2475 = distinct !DILexicalBlock(scope: !2445, file: !2446, line: 14, column: 9)
!2476 = !DILocation(line: 14, column: 15, scope: !2475)
!2477 = !DILocation(line: 14, column: 9, scope: !2445)
!2478 = !DILocation(line: 16, column: 9, scope: !2479)
!2479 = distinct !DILexicalBlock(scope: !2475, file: !2446, line: 15, column: 5)
!2480 = !DILocation(line: 16, column: 19, scope: !2479)
!2481 = !DILocation(line: 17, column: 9, scope: !2479)
!2482 = !DILocation(line: 17, column: 19, scope: !2479)
!2483 = !DILocation(line: 18, column: 9, scope: !2479)
!2484 = !DILocation(line: 21, column: 5, scope: !2445)
!2485 = !DILocation(line: 21, column: 12, scope: !2445)
!2486 = !DILocation(line: 21, column: 18, scope: !2445)
!2487 = !DILocalVariable(name: "rem", scope: !2488, file: !2446, line: 23, type: !6)
!2488 = distinct !DILexicalBlock(scope: !2445, file: !2446, line: 22, column: 5)
!2489 = !DILocation(line: 23, column: 13, scope: !2488)
!2490 = !DILocation(line: 23, column: 19, scope: !2488)
!2491 = !DILocation(line: 23, column: 27, scope: !2488)
!2492 = !DILocation(line: 23, column: 25, scope: !2488)
!2493 = !DILocation(line: 24, column: 13, scope: !2494)
!2494 = distinct !DILexicalBlock(scope: !2488, file: !2446, line: 24, column: 13)
!2495 = !DILocation(line: 24, column: 17, scope: !2494)
!2496 = !DILocation(line: 24, column: 13, scope: !2488)
!2497 = !DILocation(line: 26, column: 29, scope: !2498)
!2498 = distinct !DILexicalBlock(scope: !2494, file: !2446, line: 25, column: 9)
!2499 = !DILocation(line: 26, column: 27, scope: !2498)
!2500 = !DILocation(line: 26, column: 23, scope: !2498)
!2501 = !DILocation(line: 26, column: 18, scope: !2498)
!2502 = !DILocation(line: 26, column: 13, scope: !2498)
!2503 = !DILocation(line: 26, column: 21, scope: !2498)
!2504 = !DILocation(line: 27, column: 9, scope: !2498)
!2505 = !DILocation(line: 30, column: 30, scope: !2506)
!2506 = distinct !DILexicalBlock(scope: !2494, file: !2446, line: 29, column: 9)
!2507 = !DILocation(line: 30, column: 34, scope: !2506)
!2508 = !DILocation(line: 30, column: 27, scope: !2506)
!2509 = !DILocation(line: 30, column: 23, scope: !2506)
!2510 = !DILocation(line: 30, column: 18, scope: !2506)
!2511 = !DILocation(line: 30, column: 13, scope: !2506)
!2512 = !DILocation(line: 30, column: 21, scope: !2506)
!2513 = !DILocation(line: 32, column: 17, scope: !2488)
!2514 = !DILocation(line: 32, column: 25, scope: !2488)
!2515 = !DILocation(line: 32, column: 23, scope: !2488)
!2516 = !DILocation(line: 32, column: 15, scope: !2488)
!2517 = !DILocation(line: 33, column: 10, scope: !2488)
!2518 = distinct !{!2518, !2484, !2519, !237}
!2519 = !DILocation(line: 34, column: 5, scope: !2445)
!2520 = !DILocalVariable(name: "j", scope: !2445, file: !2446, line: 36, type: !6)
!2521 = !DILocation(line: 36, column: 9, scope: !2445)
!2522 = !DILocation(line: 37, column: 9, scope: !2523)
!2523 = distinct !DILexicalBlock(scope: !2445, file: !2446, line: 37, column: 9)
!2524 = !DILocation(line: 37, column: 9, scope: !2445)
!2525 = !DILocation(line: 39, column: 9, scope: !2526)
!2526 = distinct !DILexicalBlock(scope: !2523, file: !2446, line: 38, column: 5)
!2527 = !DILocation(line: 39, column: 16, scope: !2526)
!2528 = !DILocation(line: 39, column: 19, scope: !2526)
!2529 = !DILocation(line: 40, column: 10, scope: !2526)
!2530 = !DILocation(line: 41, column: 5, scope: !2526)
!2531 = !DILocation(line: 43, column: 5, scope: !2445)
!2532 = !DILocation(line: 43, column: 12, scope: !2445)
!2533 = !DILocation(line: 43, column: 14, scope: !2445)
!2534 = !DILocation(line: 45, column: 10, scope: !2535)
!2535 = distinct !DILexicalBlock(scope: !2445, file: !2446, line: 44, column: 5)
!2536 = !DILocation(line: 46, column: 26, scope: !2535)
!2537 = !DILocation(line: 46, column: 21, scope: !2535)
!2538 = !DILocation(line: 46, column: 9, scope: !2535)
!2539 = !DILocation(line: 46, column: 16, scope: !2535)
!2540 = !DILocation(line: 46, column: 19, scope: !2535)
!2541 = !DILocation(line: 47, column: 10, scope: !2535)
!2542 = distinct !{!2542, !2531, !2543, !237}
!2543 = !DILocation(line: 48, column: 5, scope: !2445)
!2544 = !DILocation(line: 50, column: 5, scope: !2445)
!2545 = !DILocation(line: 50, column: 12, scope: !2445)
!2546 = !DILocation(line: 50, column: 15, scope: !2445)
!2547 = !DILocation(line: 51, column: 1, scope: !2445)
!2548 = distinct !DISubprogram(name: "__fizzer_model__vsnprintf", scope: !2549, file: !2549, line: 2, type: !2550, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !183, retainedNodes: !63)
!2549 = !DIFile(filename: "data/models/c/std/stdio/vsnprintf.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "97ba02a558780981a4df185c06cf20d5")
!2550 = !DISubroutineType(types: !2551)
!2551 = !{!6, !13, !2552, !73, !2554}
!2552 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2553, line: 6, baseType: !209)
!2553 = !DIFile(filename: "data/models/c/std/stdio/vsnprintf.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "811d6d74b8b56631aab99e8a3863ea0c")
!2554 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2555, size: 64)
!2555 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, elements: !2556)
!2556 = !{!2557, !2558, !2559, !2560}
!2557 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !2555, file: !2549, baseType: !2192, size: 32)
!2558 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !2555, file: !2549, baseType: !2192, size: 32, offset: 32)
!2559 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !2555, file: !2549, baseType: !143, size: 64, offset: 64)
!2560 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !2555, file: !2549, baseType: !143, size: 64, offset: 128)
!2561 = !DILocalVariable(name: "str", arg: 1, scope: !2548, file: !2549, line: 2, type: !13)
!2562 = !DILocation(line: 2, column: 37, scope: !2548)
!2563 = !DILocalVariable(name: "size", arg: 2, scope: !2548, file: !2549, line: 2, type: !2552)
!2564 = !DILocation(line: 2, column: 49, scope: !2548)
!2565 = !DILocalVariable(name: "format", arg: 3, scope: !2548, file: !2549, line: 2, type: !73)
!2566 = !DILocation(line: 2, column: 67, scope: !2548)
!2567 = !DILocalVariable(name: "ap", arg: 4, scope: !2548, file: !2549, line: 2, type: !2554)
!2568 = !DILocation(line: 2, column: 83, scope: !2548)
!2569 = !DILocalVariable(name: "i", scope: !2548, file: !2549, line: 4, type: !2552)
!2570 = !DILocation(line: 4, column: 12, scope: !2548)
!2571 = !DILocalVariable(name: "j", scope: !2548, file: !2549, line: 5, type: !2552)
!2572 = !DILocation(line: 5, column: 12, scope: !2548)
!2573 = !DILocation(line: 7, column: 9, scope: !2574)
!2574 = distinct !DILexicalBlock(scope: !2548, file: !2549, line: 7, column: 9)
!2575 = !DILocation(line: 7, column: 14, scope: !2574)
!2576 = !DILocation(line: 7, column: 9, scope: !2548)
!2577 = !DILocation(line: 9, column: 9, scope: !2578)
!2578 = distinct !DILexicalBlock(scope: !2574, file: !2549, line: 8, column: 5)
!2579 = !DILocation(line: 12, column: 5, scope: !2548)
!2580 = !DILocation(line: 12, column: 12, scope: !2548)
!2581 = !DILocation(line: 12, column: 19, scope: !2548)
!2582 = !DILocation(line: 12, column: 22, scope: !2548)
!2583 = !DILocation(line: 12, column: 27, scope: !2548)
!2584 = !DILocation(line: 12, column: 30, scope: !2548)
!2585 = !DILocation(line: 12, column: 34, scope: !2548)
!2586 = !DILocation(line: 12, column: 39, scope: !2548)
!2587 = !DILocation(line: 12, column: 32, scope: !2548)
!2588 = !DILocation(line: 0, scope: !2548)
!2589 = !DILocation(line: 14, column: 13, scope: !2590)
!2590 = distinct !DILexicalBlock(scope: !2591, file: !2549, line: 14, column: 13)
!2591 = distinct !DILexicalBlock(scope: !2548, file: !2549, line: 13, column: 5)
!2592 = !DILocation(line: 14, column: 20, scope: !2590)
!2593 = !DILocation(line: 14, column: 23, scope: !2590)
!2594 = !DILocation(line: 14, column: 13, scope: !2591)
!2595 = !DILocation(line: 16, column: 14, scope: !2596)
!2596 = distinct !DILexicalBlock(scope: !2590, file: !2549, line: 15, column: 9)
!2597 = !DILocation(line: 17, column: 17, scope: !2598)
!2598 = distinct !DILexicalBlock(scope: !2596, file: !2549, line: 17, column: 17)
!2599 = !DILocation(line: 17, column: 24, scope: !2598)
!2600 = !DILocation(line: 17, column: 27, scope: !2598)
!2601 = !DILocation(line: 17, column: 17, scope: !2596)
!2602 = !DILocation(line: 19, column: 17, scope: !2603)
!2603 = distinct !DILexicalBlock(scope: !2598, file: !2549, line: 18, column: 13)
!2604 = !DILocalVariable(name: "buf", scope: !2596, file: !2549, line: 22, type: !2292)
!2605 = !DILocation(line: 22, column: 18, scope: !2596)
!2606 = !DILocalVariable(name: "k", scope: !2596, file: !2549, line: 23, type: !2552)
!2607 = !DILocation(line: 23, column: 20, scope: !2596)
!2608 = !DILocation(line: 25, column: 17, scope: !2609)
!2609 = distinct !DILexicalBlock(scope: !2596, file: !2549, line: 25, column: 17)
!2610 = !DILocation(line: 25, column: 24, scope: !2609)
!2611 = !DILocation(line: 25, column: 27, scope: !2609)
!2612 = !DILocation(line: 25, column: 17, scope: !2596)
!2613 = !DILocalVariable(name: "val", scope: !2614, file: !2549, line: 27, type: !6)
!2614 = distinct !DILexicalBlock(scope: !2609, file: !2549, line: 26, column: 13)
!2615 = !DILocation(line: 27, column: 21, scope: !2614)
!2616 = !DILocation(line: 27, column: 27, scope: !2614)
!2617 = !DILocation(line: 28, column: 45, scope: !2614)
!2618 = !DILocation(line: 28, column: 50, scope: !2614)
!2619 = !DILocation(line: 28, column: 17, scope: !2614)
!2620 = !DILocation(line: 29, column: 13, scope: !2614)
!2621 = !DILocation(line: 30, column: 22, scope: !2622)
!2622 = distinct !DILexicalBlock(scope: !2609, file: !2549, line: 30, column: 22)
!2623 = !DILocation(line: 30, column: 29, scope: !2622)
!2624 = !DILocation(line: 30, column: 32, scope: !2622)
!2625 = !DILocation(line: 30, column: 22, scope: !2609)
!2626 = !DILocalVariable(name: "val", scope: !2627, file: !2549, line: 32, type: !2192)
!2627 = distinct !DILexicalBlock(scope: !2622, file: !2549, line: 31, column: 13)
!2628 = !DILocation(line: 32, column: 30, scope: !2627)
!2629 = !DILocation(line: 32, column: 36, scope: !2627)
!2630 = !DILocation(line: 33, column: 50, scope: !2627)
!2631 = !DILocation(line: 33, column: 55, scope: !2627)
!2632 = !DILocation(line: 33, column: 17, scope: !2627)
!2633 = !DILocation(line: 34, column: 13, scope: !2627)
!2634 = !DILocation(line: 35, column: 22, scope: !2635)
!2635 = distinct !DILexicalBlock(scope: !2622, file: !2549, line: 35, column: 22)
!2636 = !DILocation(line: 35, column: 29, scope: !2635)
!2637 = !DILocation(line: 35, column: 32, scope: !2635)
!2638 = !DILocation(line: 35, column: 22, scope: !2622)
!2639 = !DILocalVariable(name: "val", scope: !2640, file: !2549, line: 37, type: !2192)
!2640 = distinct !DILexicalBlock(scope: !2635, file: !2549, line: 36, column: 13)
!2641 = !DILocation(line: 37, column: 30, scope: !2640)
!2642 = !DILocation(line: 37, column: 36, scope: !2640)
!2643 = !DILocation(line: 38, column: 50, scope: !2640)
!2644 = !DILocation(line: 38, column: 55, scope: !2640)
!2645 = !DILocation(line: 38, column: 17, scope: !2640)
!2646 = !DILocation(line: 39, column: 13, scope: !2640)
!2647 = !DILocation(line: 40, column: 22, scope: !2648)
!2648 = distinct !DILexicalBlock(scope: !2635, file: !2549, line: 40, column: 22)
!2649 = !DILocation(line: 40, column: 29, scope: !2648)
!2650 = !DILocation(line: 40, column: 32, scope: !2648)
!2651 = !DILocation(line: 40, column: 22, scope: !2635)
!2652 = !DILocation(line: 42, column: 32, scope: !2653)
!2653 = distinct !DILexicalBlock(scope: !2648, file: !2549, line: 41, column: 13)
!2654 = !DILocation(line: 42, column: 26, scope: !2653)
!2655 = !DILocation(line: 42, column: 17, scope: !2653)
!2656 = !DILocation(line: 42, column: 24, scope: !2653)
!2657 = !DILocation(line: 43, column: 17, scope: !2653)
!2658 = !DILocation(line: 43, column: 24, scope: !2653)
!2659 = !DILocation(line: 44, column: 13, scope: !2653)
!2660 = !DILocation(line: 45, column: 22, scope: !2661)
!2661 = distinct !DILexicalBlock(scope: !2648, file: !2549, line: 45, column: 22)
!2662 = !DILocation(line: 45, column: 29, scope: !2661)
!2663 = !DILocation(line: 45, column: 32, scope: !2661)
!2664 = !DILocation(line: 45, column: 22, scope: !2648)
!2665 = !DILocalVariable(name: "s", scope: !2666, file: !2549, line: 47, type: !13)
!2666 = distinct !DILexicalBlock(scope: !2661, file: !2549, line: 46, column: 13)
!2667 = !DILocation(line: 47, column: 23, scope: !2666)
!2668 = !DILocation(line: 47, column: 27, scope: !2666)
!2669 = !DILocation(line: 48, column: 19, scope: !2666)
!2670 = !DILocation(line: 49, column: 17, scope: !2666)
!2671 = !DILocation(line: 49, column: 24, scope: !2666)
!2672 = !DILocation(line: 49, column: 26, scope: !2666)
!2673 = !DILocation(line: 49, column: 29, scope: !2666)
!2674 = !DILocation(line: 49, column: 34, scope: !2666)
!2675 = !DILocation(line: 49, column: 37, scope: !2666)
!2676 = !DILocation(line: 49, column: 41, scope: !2666)
!2677 = !DILocation(line: 49, column: 46, scope: !2666)
!2678 = !DILocation(line: 49, column: 39, scope: !2666)
!2679 = !DILocation(line: 0, scope: !2666)
!2680 = !DILocation(line: 51, column: 30, scope: !2681)
!2681 = distinct !DILexicalBlock(scope: !2666, file: !2549, line: 50, column: 17)
!2682 = !DILocation(line: 51, column: 32, scope: !2681)
!2683 = !DILocation(line: 51, column: 21, scope: !2681)
!2684 = !DILocation(line: 51, column: 25, scope: !2681)
!2685 = !DILocation(line: 51, column: 28, scope: !2681)
!2686 = !DILocation(line: 52, column: 22, scope: !2681)
!2687 = !DILocation(line: 53, column: 22, scope: !2681)
!2688 = distinct !{!2688, !2670, !2689, !237}
!2689 = !DILocation(line: 54, column: 17, scope: !2666)
!2690 = !DILocation(line: 55, column: 18, scope: !2666)
!2691 = !DILocation(line: 56, column: 17, scope: !2666)
!2692 = distinct !{!2692, !2579, !2693, !237}
!2693 = !DILocation(line: 80, column: 5, scope: !2548)
!2694 = !DILocation(line: 60, column: 26, scope: !2695)
!2695 = distinct !DILexicalBlock(scope: !2661, file: !2549, line: 59, column: 13)
!2696 = !DILocation(line: 60, column: 33, scope: !2695)
!2697 = !DILocation(line: 60, column: 17, scope: !2695)
!2698 = !DILocation(line: 60, column: 24, scope: !2695)
!2699 = !DILocation(line: 61, column: 17, scope: !2695)
!2700 = !DILocation(line: 61, column: 24, scope: !2695)
!2701 = !DILocation(line: 64, column: 15, scope: !2596)
!2702 = !DILocation(line: 65, column: 13, scope: !2596)
!2703 = !DILocation(line: 65, column: 24, scope: !2596)
!2704 = !DILocation(line: 65, column: 20, scope: !2596)
!2705 = !DILocation(line: 65, column: 27, scope: !2596)
!2706 = !DILocation(line: 65, column: 32, scope: !2596)
!2707 = !DILocation(line: 65, column: 35, scope: !2596)
!2708 = !DILocation(line: 65, column: 39, scope: !2596)
!2709 = !DILocation(line: 65, column: 44, scope: !2596)
!2710 = !DILocation(line: 65, column: 37, scope: !2596)
!2711 = !DILocation(line: 0, scope: !2596)
!2712 = !DILocation(line: 67, column: 30, scope: !2713)
!2713 = distinct !DILexicalBlock(scope: !2596, file: !2549, line: 66, column: 13)
!2714 = !DILocation(line: 67, column: 26, scope: !2713)
!2715 = !DILocation(line: 67, column: 17, scope: !2713)
!2716 = !DILocation(line: 67, column: 21, scope: !2713)
!2717 = !DILocation(line: 67, column: 24, scope: !2713)
!2718 = !DILocation(line: 68, column: 18, scope: !2713)
!2719 = !DILocation(line: 69, column: 18, scope: !2713)
!2720 = distinct !{!2720, !2702, !2721, !237}
!2721 = !DILocation(line: 70, column: 13, scope: !2596)
!2722 = !DILocation(line: 72, column: 14, scope: !2596)
!2723 = !DILocation(line: 73, column: 9, scope: !2596)
!2724 = !DILocation(line: 76, column: 22, scope: !2725)
!2725 = distinct !DILexicalBlock(scope: !2590, file: !2549, line: 75, column: 9)
!2726 = !DILocation(line: 76, column: 29, scope: !2725)
!2727 = !DILocation(line: 76, column: 13, scope: !2725)
!2728 = !DILocation(line: 76, column: 17, scope: !2725)
!2729 = !DILocation(line: 76, column: 20, scope: !2725)
!2730 = !DILocation(line: 77, column: 14, scope: !2725)
!2731 = !DILocation(line: 78, column: 14, scope: !2725)
!2732 = !DILocation(line: 82, column: 5, scope: !2548)
!2733 = !DILocation(line: 82, column: 9, scope: !2548)
!2734 = !DILocation(line: 82, column: 12, scope: !2548)
!2735 = !DILocation(line: 83, column: 17, scope: !2548)
!2736 = !DILocation(line: 83, column: 12, scope: !2548)
!2737 = !DILocation(line: 83, column: 5, scope: !2548)
!2738 = !DILocation(line: 84, column: 1, scope: !2548)
!2739 = distinct !DISubprogram(name: "__fizzer_model__fabsl", scope: !2740, file: !2740, line: 2, type: !2741, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !185, retainedNodes: !63)
!2740 = !DIFile(filename: "data/models/c/std/math/fabsl.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "5c5076ae740114377af63cf033329357")
!2741 = !DISubroutineType(types: !2742)
!2742 = !{!2743, !2743}
!2743 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!2744 = !DILocalVariable(name: "x", arg: 1, scope: !2739, file: !2740, line: 2, type: !2743)
!2745 = !DILocation(line: 2, column: 47, scope: !2739)
!2746 = !DILocation(line: 4, column: 9, scope: !2747)
!2747 = distinct !DILexicalBlock(scope: !2739, file: !2740, line: 4, column: 9)
!2748 = !DILocation(line: 4, column: 11, scope: !2747)
!2749 = !DILocation(line: 4, column: 9, scope: !2739)
!2750 = !DILocation(line: 5, column: 17, scope: !2747)
!2751 = !DILocation(line: 5, column: 16, scope: !2747)
!2752 = !DILocation(line: 5, column: 9, scope: !2747)
!2753 = !DILocation(line: 7, column: 16, scope: !2747)
!2754 = !DILocation(line: 7, column: 9, scope: !2747)
!2755 = !DILocation(line: 8, column: 1, scope: !2739)
!2756 = distinct !DISubprogram(name: "__fizzer_model__fabs", scope: !2757, file: !2757, line: 2, type: !2758, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !187, retainedNodes: !63)
!2757 = !DIFile(filename: "data/models/c/std/math/fabs.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "8c49c577f21ca028a8a9f5afb48aacbb")
!2758 = !DISubroutineType(types: !2759)
!2759 = !{!93, !93}
!2760 = !DILocalVariable(name: "x", arg: 1, scope: !2756, file: !2757, line: 2, type: !93)
!2761 = !DILocation(line: 2, column: 36, scope: !2756)
!2762 = !DILocation(line: 4, column: 9, scope: !2763)
!2763 = distinct !DILexicalBlock(scope: !2756, file: !2757, line: 4, column: 9)
!2764 = !DILocation(line: 4, column: 11, scope: !2763)
!2765 = !DILocation(line: 4, column: 9, scope: !2756)
!2766 = !DILocation(line: 5, column: 17, scope: !2763)
!2767 = !DILocation(line: 5, column: 16, scope: !2763)
!2768 = !DILocation(line: 5, column: 9, scope: !2763)
!2769 = !DILocation(line: 7, column: 16, scope: !2763)
!2770 = !DILocation(line: 7, column: 9, scope: !2763)
!2771 = !DILocation(line: 8, column: 1, scope: !2756)
!2772 = distinct !DISubprogram(name: "__fizzer_model__fabsf", scope: !2773, file: !2773, line: 2, type: !2774, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !189, retainedNodes: !63)
!2773 = !DIFile(filename: "data/models/c/std/math/fabsf.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "b084fca80d77cc63411b9d4b3fe450c4")
!2774 = !DISubroutineType(types: !2775)
!2775 = !{!2776, !2776}
!2776 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!2777 = !DILocalVariable(name: "x", arg: 1, scope: !2772, file: !2773, line: 2, type: !2776)
!2778 = !DILocation(line: 2, column: 35, scope: !2772)
!2779 = !DILocation(line: 4, column: 9, scope: !2780)
!2780 = distinct !DILexicalBlock(scope: !2772, file: !2773, line: 4, column: 9)
!2781 = !DILocation(line: 4, column: 11, scope: !2780)
!2782 = !DILocation(line: 4, column: 9, scope: !2772)
!2783 = !DILocation(line: 5, column: 17, scope: !2780)
!2784 = !DILocation(line: 5, column: 16, scope: !2780)
!2785 = !DILocation(line: 5, column: 9, scope: !2780)
!2786 = !DILocation(line: 7, column: 16, scope: !2780)
!2787 = !DILocation(line: 7, column: 9, scope: !2780)
!2788 = !DILocation(line: 8, column: 1, scope: !2772)
!2789 = distinct !DISubprogram(name: "__fizzer_model__strftime", scope: !2790, file: !2790, line: 3, type: !2791, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !191, retainedNodes: !63)
!2790 = !DIFile(filename: "data/models/c/std/time/strftime.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "60233b54b62040efdc56806d7e2f5c85")
!2791 = !DISubroutineType(types: !2792)
!2792 = !{!2793, !13, !2795, !73, !2797}
!2793 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2794, line: 6, baseType: !209)
!2794 = !DIFile(filename: "data/models/c/std/time/strftime.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "0140443382a318fb7fcf42588cda3812")
!2795 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2796, line: 18, baseType: !209)
!2796 = !DIFile(filename: "/usr/lib/llvm-18/lib/clang/18/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!2797 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2798, size: 64)
!2798 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2799)
!2799 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !2800, line: 7, size: 448, elements: !2801)
!2800 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h", directory: "", checksumkind: CSK_MD5, checksum: "9e5545b565ef031c4cd0faf90b69386f")
!2801 = !{!2802, !2803, !2804, !2805, !2806, !2807, !2808, !2809, !2810, !2811, !2812}
!2802 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !2799, file: !2800, line: 9, baseType: !6, size: 32)
!2803 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !2799, file: !2800, line: 10, baseType: !6, size: 32, offset: 32)
!2804 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !2799, file: !2800, line: 11, baseType: !6, size: 32, offset: 64)
!2805 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !2799, file: !2800, line: 12, baseType: !6, size: 32, offset: 96)
!2806 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !2799, file: !2800, line: 13, baseType: !6, size: 32, offset: 128)
!2807 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !2799, file: !2800, line: 14, baseType: !6, size: 32, offset: 160)
!2808 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !2799, file: !2800, line: 15, baseType: !6, size: 32, offset: 192)
!2809 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !2799, file: !2800, line: 16, baseType: !6, size: 32, offset: 224)
!2810 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !2799, file: !2800, line: 17, baseType: !6, size: 32, offset: 256)
!2811 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !2799, file: !2800, line: 20, baseType: !817, size: 64, offset: 320)
!2812 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !2799, file: !2800, line: 21, baseType: !73, size: 64, offset: 384)
!2813 = !DILocalVariable(name: "s", arg: 1, scope: !2789, file: !2790, line: 3, type: !13)
!2814 = !DILocation(line: 3, column: 39, scope: !2789)
!2815 = !DILocalVariable(name: "max", arg: 2, scope: !2789, file: !2790, line: 3, type: !2795)
!2816 = !DILocation(line: 3, column: 49, scope: !2789)
!2817 = !DILocalVariable(name: "format", arg: 3, scope: !2789, file: !2790, line: 3, type: !73)
!2818 = !DILocation(line: 3, column: 66, scope: !2789)
!2819 = !DILocalVariable(name: "tm", arg: 4, scope: !2789, file: !2790, line: 3, type: !2797)
!2820 = !DILocation(line: 3, column: 91, scope: !2789)
!2821 = !DILocalVariable(name: "i", scope: !2789, file: !2790, line: 5, type: !2795)
!2822 = !DILocation(line: 5, column: 12, scope: !2789)
!2823 = !DILocalVariable(name: "j", scope: !2789, file: !2790, line: 6, type: !2795)
!2824 = !DILocation(line: 6, column: 12, scope: !2789)
!2825 = !DILocalVariable(name: "buf", scope: !2789, file: !2790, line: 8, type: !53)
!2826 = !DILocation(line: 8, column: 10, scope: !2789)
!2827 = !DILocation(line: 10, column: 5, scope: !2789)
!2828 = !DILocation(line: 10, column: 12, scope: !2789)
!2829 = !DILocation(line: 10, column: 19, scope: !2789)
!2830 = !DILocation(line: 10, column: 22, scope: !2789)
!2831 = !DILocation(line: 10, column: 27, scope: !2789)
!2832 = !DILocation(line: 10, column: 30, scope: !2789)
!2833 = !DILocation(line: 10, column: 34, scope: !2789)
!2834 = !DILocation(line: 10, column: 38, scope: !2789)
!2835 = !DILocation(line: 10, column: 32, scope: !2789)
!2836 = !DILocation(line: 0, scope: !2789)
!2837 = !DILocation(line: 12, column: 13, scope: !2838)
!2838 = distinct !DILexicalBlock(scope: !2839, file: !2790, line: 12, column: 13)
!2839 = distinct !DILexicalBlock(scope: !2789, file: !2790, line: 11, column: 5)
!2840 = !DILocation(line: 12, column: 20, scope: !2838)
!2841 = !DILocation(line: 12, column: 23, scope: !2838)
!2842 = !DILocation(line: 12, column: 13, scope: !2839)
!2843 = !DILocation(line: 14, column: 14, scope: !2844)
!2844 = distinct !DILexicalBlock(scope: !2838, file: !2790, line: 13, column: 9)
!2845 = !DILocation(line: 15, column: 17, scope: !2846)
!2846 = distinct !DILexicalBlock(scope: !2844, file: !2790, line: 15, column: 17)
!2847 = !DILocation(line: 15, column: 24, scope: !2846)
!2848 = !DILocation(line: 15, column: 27, scope: !2846)
!2849 = !DILocation(line: 15, column: 17, scope: !2844)
!2850 = !DILocation(line: 17, column: 17, scope: !2851)
!2851 = distinct !DILexicalBlock(scope: !2846, file: !2790, line: 16, column: 13)
!2852 = !DILocalVariable(name: "k", scope: !2844, file: !2790, line: 20, type: !6)
!2853 = !DILocation(line: 20, column: 17, scope: !2844)
!2854 = !DILocation(line: 21, column: 17, scope: !2855)
!2855 = distinct !DILexicalBlock(scope: !2844, file: !2790, line: 21, column: 17)
!2856 = !DILocation(line: 21, column: 24, scope: !2855)
!2857 = !DILocation(line: 21, column: 27, scope: !2855)
!2858 = !DILocation(line: 21, column: 17, scope: !2844)
!2859 = !DILocalVariable(name: "year", scope: !2860, file: !2790, line: 23, type: !6)
!2860 = distinct !DILexicalBlock(scope: !2855, file: !2790, line: 22, column: 13)
!2861 = !DILocation(line: 23, column: 21, scope: !2860)
!2862 = !DILocation(line: 23, column: 35, scope: !2860)
!2863 = !DILocation(line: 23, column: 39, scope: !2860)
!2864 = !DILocation(line: 23, column: 33, scope: !2860)
!2865 = !DILocation(line: 24, column: 45, scope: !2860)
!2866 = !DILocation(line: 24, column: 51, scope: !2860)
!2867 = !DILocation(line: 24, column: 17, scope: !2860)
!2868 = !DILocation(line: 25, column: 13, scope: !2860)
!2869 = !DILocation(line: 26, column: 22, scope: !2870)
!2870 = distinct !DILexicalBlock(scope: !2855, file: !2790, line: 26, column: 22)
!2871 = !DILocation(line: 26, column: 29, scope: !2870)
!2872 = !DILocation(line: 26, column: 32, scope: !2870)
!2873 = !DILocation(line: 26, column: 22, scope: !2855)
!2874 = !DILocalVariable(name: "month", scope: !2875, file: !2790, line: 28, type: !6)
!2875 = distinct !DILexicalBlock(scope: !2870, file: !2790, line: 27, column: 13)
!2876 = !DILocation(line: 28, column: 21, scope: !2875)
!2877 = !DILocation(line: 28, column: 29, scope: !2875)
!2878 = !DILocation(line: 28, column: 33, scope: !2875)
!2879 = !DILocation(line: 28, column: 40, scope: !2875)
!2880 = !DILocation(line: 29, column: 45, scope: !2875)
!2881 = !DILocation(line: 29, column: 52, scope: !2875)
!2882 = !DILocation(line: 29, column: 17, scope: !2875)
!2883 = !DILocation(line: 30, column: 13, scope: !2875)
!2884 = !DILocation(line: 31, column: 22, scope: !2885)
!2885 = distinct !DILexicalBlock(scope: !2870, file: !2790, line: 31, column: 22)
!2886 = !DILocation(line: 31, column: 29, scope: !2885)
!2887 = !DILocation(line: 31, column: 32, scope: !2885)
!2888 = !DILocation(line: 31, column: 22, scope: !2870)
!2889 = !DILocalVariable(name: "day", scope: !2890, file: !2790, line: 33, type: !6)
!2890 = distinct !DILexicalBlock(scope: !2885, file: !2790, line: 32, column: 13)
!2891 = !DILocation(line: 33, column: 21, scope: !2890)
!2892 = !DILocation(line: 33, column: 27, scope: !2890)
!2893 = !DILocation(line: 33, column: 31, scope: !2890)
!2894 = !DILocation(line: 34, column: 45, scope: !2890)
!2895 = !DILocation(line: 34, column: 50, scope: !2890)
!2896 = !DILocation(line: 34, column: 17, scope: !2890)
!2897 = !DILocation(line: 35, column: 13, scope: !2890)
!2898 = !DILocation(line: 36, column: 22, scope: !2899)
!2899 = distinct !DILexicalBlock(scope: !2885, file: !2790, line: 36, column: 22)
!2900 = !DILocation(line: 36, column: 29, scope: !2899)
!2901 = !DILocation(line: 36, column: 32, scope: !2899)
!2902 = !DILocation(line: 36, column: 22, scope: !2885)
!2903 = !DILocalVariable(name: "hour", scope: !2904, file: !2790, line: 38, type: !6)
!2904 = distinct !DILexicalBlock(scope: !2899, file: !2790, line: 37, column: 13)
!2905 = !DILocation(line: 38, column: 21, scope: !2904)
!2906 = !DILocation(line: 38, column: 28, scope: !2904)
!2907 = !DILocation(line: 38, column: 32, scope: !2904)
!2908 = !DILocation(line: 39, column: 45, scope: !2904)
!2909 = !DILocation(line: 39, column: 51, scope: !2904)
!2910 = !DILocation(line: 39, column: 17, scope: !2904)
!2911 = !DILocation(line: 40, column: 13, scope: !2904)
!2912 = !DILocation(line: 41, column: 22, scope: !2913)
!2913 = distinct !DILexicalBlock(scope: !2899, file: !2790, line: 41, column: 22)
!2914 = !DILocation(line: 41, column: 29, scope: !2913)
!2915 = !DILocation(line: 41, column: 32, scope: !2913)
!2916 = !DILocation(line: 41, column: 22, scope: !2899)
!2917 = !DILocalVariable(name: "minute", scope: !2918, file: !2790, line: 43, type: !6)
!2918 = distinct !DILexicalBlock(scope: !2913, file: !2790, line: 42, column: 13)
!2919 = !DILocation(line: 43, column: 21, scope: !2918)
!2920 = !DILocation(line: 43, column: 30, scope: !2918)
!2921 = !DILocation(line: 43, column: 34, scope: !2918)
!2922 = !DILocation(line: 44, column: 45, scope: !2918)
!2923 = !DILocation(line: 44, column: 53, scope: !2918)
!2924 = !DILocation(line: 44, column: 17, scope: !2918)
!2925 = !DILocation(line: 45, column: 13, scope: !2918)
!2926 = !DILocation(line: 46, column: 22, scope: !2927)
!2927 = distinct !DILexicalBlock(scope: !2913, file: !2790, line: 46, column: 22)
!2928 = !DILocation(line: 46, column: 29, scope: !2927)
!2929 = !DILocation(line: 46, column: 32, scope: !2927)
!2930 = !DILocation(line: 46, column: 22, scope: !2913)
!2931 = !DILocalVariable(name: "second", scope: !2932, file: !2790, line: 48, type: !6)
!2932 = distinct !DILexicalBlock(scope: !2927, file: !2790, line: 47, column: 13)
!2933 = !DILocation(line: 48, column: 21, scope: !2932)
!2934 = !DILocation(line: 48, column: 30, scope: !2932)
!2935 = !DILocation(line: 48, column: 34, scope: !2932)
!2936 = !DILocation(line: 49, column: 45, scope: !2932)
!2937 = !DILocation(line: 49, column: 53, scope: !2932)
!2938 = !DILocation(line: 49, column: 17, scope: !2932)
!2939 = !DILocation(line: 50, column: 13, scope: !2932)
!2940 = !DILocation(line: 53, column: 26, scope: !2941)
!2941 = distinct !DILexicalBlock(scope: !2927, file: !2790, line: 52, column: 13)
!2942 = !DILocation(line: 53, column: 33, scope: !2941)
!2943 = !DILocation(line: 53, column: 17, scope: !2941)
!2944 = !DILocation(line: 53, column: 24, scope: !2941)
!2945 = !DILocation(line: 54, column: 17, scope: !2941)
!2946 = !DILocation(line: 54, column: 24, scope: !2941)
!2947 = !DILocation(line: 57, column: 15, scope: !2844)
!2948 = !DILocation(line: 58, column: 13, scope: !2844)
!2949 = !DILocation(line: 58, column: 24, scope: !2844)
!2950 = !DILocation(line: 58, column: 20, scope: !2844)
!2951 = !DILocation(line: 58, column: 27, scope: !2844)
!2952 = !DILocation(line: 58, column: 32, scope: !2844)
!2953 = !DILocation(line: 58, column: 35, scope: !2844)
!2954 = !DILocation(line: 58, column: 39, scope: !2844)
!2955 = !DILocation(line: 58, column: 43, scope: !2844)
!2956 = !DILocation(line: 58, column: 37, scope: !2844)
!2957 = !DILocation(line: 0, scope: !2844)
!2958 = !DILocation(line: 60, column: 28, scope: !2959)
!2959 = distinct !DILexicalBlock(scope: !2844, file: !2790, line: 59, column: 13)
!2960 = !DILocation(line: 60, column: 24, scope: !2959)
!2961 = !DILocation(line: 60, column: 17, scope: !2959)
!2962 = !DILocation(line: 60, column: 19, scope: !2959)
!2963 = !DILocation(line: 60, column: 22, scope: !2959)
!2964 = !DILocation(line: 61, column: 18, scope: !2959)
!2965 = !DILocation(line: 62, column: 18, scope: !2959)
!2966 = distinct !{!2966, !2948, !2967, !237}
!2967 = !DILocation(line: 63, column: 13, scope: !2844)
!2968 = !DILocation(line: 65, column: 14, scope: !2844)
!2969 = !DILocation(line: 66, column: 9, scope: !2844)
!2970 = !DILocation(line: 69, column: 20, scope: !2971)
!2971 = distinct !DILexicalBlock(scope: !2838, file: !2790, line: 68, column: 9)
!2972 = !DILocation(line: 69, column: 27, scope: !2971)
!2973 = !DILocation(line: 69, column: 13, scope: !2971)
!2974 = !DILocation(line: 69, column: 15, scope: !2971)
!2975 = !DILocation(line: 69, column: 18, scope: !2971)
!2976 = !DILocation(line: 70, column: 14, scope: !2971)
!2977 = !DILocation(line: 71, column: 14, scope: !2971)
!2978 = distinct !{!2978, !2827, !2979, !237}
!2979 = !DILocation(line: 73, column: 5, scope: !2789)
!2980 = !DILocation(line: 75, column: 5, scope: !2789)
!2981 = !DILocation(line: 75, column: 7, scope: !2789)
!2982 = !DILocation(line: 75, column: 10, scope: !2789)
!2983 = !DILocation(line: 76, column: 12, scope: !2789)
!2984 = !DILocation(line: 76, column: 5, scope: !2789)
!2985 = distinct !DISubprogram(name: "__fizzer_model__ctime", scope: !2986, file: !2986, line: 2, type: !2987, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !193, retainedNodes: !63)
!2986 = !DIFile(filename: "data/models/c/std/time/ctime.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "a911ddebb345e08702cf6c685c49baca")
!2987 = !DISubroutineType(types: !2988)
!2988 = !{!13, !2989, !13}
!2989 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2990, size: 64)
!2990 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2991)
!2991 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !2992, line: 14, baseType: !817)
!2992 = !DIFile(filename: "data/models/c/std/time/ctime.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "fa159fd5097e337914b2eb75fc3ffc16")
!2993 = !DILocalVariable(name: "timep", arg: 1, scope: !2985, file: !2986, line: 2, type: !2989)
!2994 = !DILocation(line: 2, column: 43, scope: !2985)
!2995 = !DILocalVariable(name: "buffer", arg: 2, scope: !2985, file: !2986, line: 2, type: !13)
!2996 = !DILocation(line: 2, column: 56, scope: !2985)
!2997 = !DILocalVariable(name: "template", scope: !2985, file: !2986, line: 4, type: !2998)
!2998 = !DICompositeType(tag: DW_TAG_array_type, baseType: !74, size: 208, elements: !49)
!2999 = !DILocation(line: 4, column: 16, scope: !2985)
!3000 = !DILocalVariable(name: "i", scope: !2985, file: !2986, line: 5, type: !3001)
!3001 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !2992, line: 6, baseType: !209)
!3002 = !DILocation(line: 5, column: 12, scope: !2985)
!3003 = !DILocation(line: 7, column: 5, scope: !2985)
!3004 = !DILocation(line: 7, column: 21, scope: !2985)
!3005 = !DILocation(line: 7, column: 12, scope: !2985)
!3006 = !DILocation(line: 7, column: 24, scope: !2985)
!3007 = !DILocation(line: 9, column: 30, scope: !3008)
!3008 = distinct !DILexicalBlock(scope: !2985, file: !2986, line: 8, column: 5)
!3009 = !DILocation(line: 9, column: 21, scope: !3008)
!3010 = !DILocation(line: 9, column: 9, scope: !3008)
!3011 = !DILocation(line: 9, column: 16, scope: !3008)
!3012 = !DILocation(line: 9, column: 19, scope: !3008)
!3013 = !DILocation(line: 10, column: 10, scope: !3008)
!3014 = distinct !{!3014, !3003, !3015, !237}
!3015 = !DILocation(line: 11, column: 5, scope: !2985)
!3016 = !DILocation(line: 13, column: 5, scope: !2985)
!3017 = !DILocation(line: 13, column: 12, scope: !2985)
!3018 = !DILocation(line: 13, column: 15, scope: !2985)
!3019 = !DILocation(line: 14, column: 12, scope: !2985)
!3020 = !DILocation(line: 14, column: 5, scope: !2985)
