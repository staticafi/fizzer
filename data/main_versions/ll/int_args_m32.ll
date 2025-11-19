; ModuleID = '/home/marek/root/fizzer/dist/data//main_versions/c/int_args.c'
source_filename = "/home/marek/root/fizzer/dist/data//main_versions/c/int_args.c"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

%struct.__fizzer_private_io_model_cmdline_data_type = type { [255 x ptr], [4095 x i8], i8 }

@__fizzer_private_io_model_cmdline_data = internal global %struct.__fizzer_private_io_model_cmdline_data_type zeroinitializer, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_private_entry_function() #0 !dbg !31 {
  %1 = alloca ptr, align 4
  call void @llvm.dbg.declare(metadata ptr %1, metadata !36, metadata !DIExpression()), !dbg !39
  store ptr @__fizzer_private_io_model_cmdline_data, ptr %1, align 4, !dbg !39
  call void @__fizzer_private_io_model_cmdline_read_data(ptr noundef @__fizzer_private_io_model_cmdline_data), !dbg !40
  %2 = load i8, ptr getelementptr inbounds (%struct.__fizzer_private_io_model_cmdline_data_type, ptr @__fizzer_private_io_model_cmdline_data, i32 0, i32 2), align 1, !dbg !41
  %3 = zext i8 %2 to i32, !dbg !42
  %4 = call i32 @__fizzer_method_under_test__(i32 noundef %3, ptr noundef @__fizzer_private_io_model_cmdline_data), !dbg !43
  ret i32 %4, !dbg !44
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @__fizzer_private_io_model_cmdline_read_data(ptr noundef %0) #0 !dbg !45 {
  %2 = alloca ptr, align 4
  %3 = alloca i16, align 2
  %4 = alloca i8, align 1
  store ptr %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata ptr %3, metadata !50, metadata !DIExpression()), !dbg !52
  store i16 0, ptr %3, align 2, !dbg !52
  %5 = call zeroext i8 @__fizzer_private_io_model_cmdline_read_argc(), !dbg !53
  %6 = load ptr, ptr %2, align 4, !dbg !54
  %7 = getelementptr inbounds %struct.__fizzer_private_io_model_cmdline_data_type, ptr %6, i32 0, i32 2, !dbg !55
  store i8 %5, ptr %7, align 1, !dbg !56
  call void @llvm.dbg.declare(metadata ptr %4, metadata !57, metadata !DIExpression()), !dbg !59
  store i8 0, ptr %4, align 1, !dbg !59
  br label %8, !dbg !60

8:                                                ; preds = %55, %1
  %9 = load i8, ptr %4, align 1, !dbg !61
  %10 = zext i8 %9 to i32, !dbg !61
  %11 = load ptr, ptr %2, align 4, !dbg !63
  %12 = getelementptr inbounds %struct.__fizzer_private_io_model_cmdline_data_type, ptr %11, i32 0, i32 2, !dbg !64
  %13 = load i8, ptr %12, align 1, !dbg !64
  %14 = zext i8 %13 to i32, !dbg !63
  %15 = icmp slt i32 %10, %14, !dbg !65
  br i1 %15, label %16, label %58, !dbg !66

16:                                               ; preds = %8
  %17 = load i16, ptr %3, align 2, !dbg !67
  %18 = zext i16 %17 to i32, !dbg !67
  %19 = and i32 %18, 4095, !dbg !69
  %20 = trunc i32 %19 to i16, !dbg !70
  store i16 %20, ptr %3, align 2, !dbg !71
  %21 = load ptr, ptr %2, align 4, !dbg !72
  %22 = getelementptr inbounds %struct.__fizzer_private_io_model_cmdline_data_type, ptr %21, i32 0, i32 1, !dbg !73
  %23 = load i16, ptr %3, align 2, !dbg !74
  %24 = zext i16 %23 to i32, !dbg !72
  %25 = getelementptr inbounds [4095 x i8], ptr %22, i32 0, i32 %24, !dbg !72
  %26 = load ptr, ptr %2, align 4, !dbg !75
  %27 = getelementptr inbounds %struct.__fizzer_private_io_model_cmdline_data_type, ptr %26, i32 0, i32 0, !dbg !76
  %28 = load i8, ptr %4, align 1, !dbg !77
  %29 = zext i8 %28 to i32, !dbg !75
  %30 = getelementptr inbounds [255 x ptr], ptr %27, i32 0, i32 %29, !dbg !75
  store ptr %25, ptr %30, align 4, !dbg !78
  br label %31, !dbg !79

31:                                               ; preds = %44, %16
  %32 = load i16, ptr %3, align 2, !dbg !80
  %33 = zext i16 %32 to i32, !dbg !80
  %34 = and i32 %33, 4095, !dbg !82
  %35 = trunc i32 %34 to i16, !dbg !83
  store i16 %35, ptr %3, align 2, !dbg !84
  %36 = call signext i8 @__fizzer_private_io_model_cmdline_read_char(), !dbg !85
  %37 = load ptr, ptr %2, align 4, !dbg !86
  %38 = getelementptr inbounds %struct.__fizzer_private_io_model_cmdline_data_type, ptr %37, i32 0, i32 1, !dbg !87
  %39 = load i16, ptr %3, align 2, !dbg !88
  %40 = zext i16 %39 to i32, !dbg !86
  %41 = getelementptr inbounds [4095 x i8], ptr %38, i32 0, i32 %40, !dbg !86
  store i8 %36, ptr %41, align 1, !dbg !89
  %42 = load i16, ptr %3, align 2, !dbg !90
  %43 = add i16 %42, 1, !dbg !90
  store i16 %43, ptr %3, align 2, !dbg !90
  br label %44, !dbg !91

44:                                               ; preds = %31
  %45 = load ptr, ptr %2, align 4, !dbg !92
  %46 = getelementptr inbounds %struct.__fizzer_private_io_model_cmdline_data_type, ptr %45, i32 0, i32 1, !dbg !93
  %47 = load i16, ptr %3, align 2, !dbg !94
  %48 = zext i16 %47 to i32, !dbg !94
  %49 = sub i32 %48, 1, !dbg !95
  %50 = getelementptr inbounds [4095 x i8], ptr %46, i32 0, i32 %49, !dbg !92
  %51 = load i8, ptr %50, align 1, !dbg !92
  %52 = sext i8 %51 to i32, !dbg !92
  %53 = icmp ne i32 %52, 0, !dbg !96
  br i1 %53, label %31, label %54, !dbg !91, !llvm.loop !97

54:                                               ; preds = %44
  br label %55, !dbg !100

55:                                               ; preds = %54
  %56 = load i8, ptr %4, align 1, !dbg !101
  %57 = add i8 %56, 1, !dbg !101
  store i8 %57, ptr %4, align 1, !dbg !101
  br label %8, !dbg !102, !llvm.loop !103

58:                                               ; preds = %8
  %59 = load ptr, ptr %2, align 4, !dbg !105
  %60 = getelementptr inbounds %struct.__fizzer_private_io_model_cmdline_data_type, ptr %59, i32 0, i32 0, !dbg !106
  %61 = load ptr, ptr %2, align 4, !dbg !107
  %62 = getelementptr inbounds %struct.__fizzer_private_io_model_cmdline_data_type, ptr %61, i32 0, i32 2, !dbg !108
  %63 = load i8, ptr %62, align 1, !dbg !108
  %64 = zext i8 %63 to i32, !dbg !105
  %65 = getelementptr inbounds [255 x ptr], ptr %60, i32 0, i32 %64, !dbg !105
  store ptr null, ptr %65, align 4, !dbg !109
  ret void, !dbg !110
}

declare i32 @__fizzer_method_under_test__(i32 noundef, ptr noundef) #2

declare zeroext i8 @__fizzer_private_io_model_cmdline_read_argc() #2

declare signext i8 @__fizzer_private_io_model_cmdline_read_char() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="i686" "target-features"="+cmov,+cx8,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="i686" "target-features"="+cmov,+cx8,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__fizzer_private_io_model_cmdline_data", scope: !2, file: !9, line: 11, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//main_versions/c/int_args.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "731d4f7a406eb0000343ec0747eb32a2")
!4 = !{!5, !6}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 32)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !{!0}
!9 = !DIFile(filename: "data/main_versions/c/cmdline_model.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "413401da3ac2f65d38efdce9f88688d2")
!10 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__fizzer_private_io_model_cmdline_data_type", file: !9, line: 6, size: 40928, elements: !11)
!11 = !{!12, !16, !20}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "argv", scope: !10, file: !9, line: 8, baseType: !13, size: 8160)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 8160, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 255)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "chars", scope: !10, file: !9, line: 9, baseType: !17, size: 32760, offset: 8160)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 32760, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 4095)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "argc", scope: !10, file: !9, line: 10, baseType: !21, size: 8, offset: 40920)
!21 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!22 = !{i32 1, !"NumRegisterParameters", i32 0}
!23 = !{i32 7, !"Dwarf Version", i32 5}
!24 = !{i32 2, !"Debug Info Version", i32 3}
!25 = !{i32 1, !"wchar_size", i32 4}
!26 = !{i32 8, !"PIC Level", i32 2}
!27 = !{i32 7, !"PIE Level", i32 2}
!28 = !{i32 7, !"uwtable", i32 2}
!29 = !{i32 7, !"frame-pointer", i32 2}
!30 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!31 = distinct !DISubprogram(name: "__fizzer_private_entry_function", scope: !32, file: !32, line: 3, type: !33, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !35)
!32 = !DIFile(filename: "data/main_versions/c/int_args.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "731d4f7a406eb0000343ec0747eb32a2")
!33 = !DISubroutineType(types: !34)
!34 = !{!5}
!35 = !{}
!36 = !DILocalVariable(name: "data", scope: !31, file: !32, line: 5, type: !37)
!37 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !38)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 32)
!39 = !DILocation(line: 5, column: 64, scope: !31)
!40 = !DILocation(line: 6, column: 5, scope: !31)
!41 = !DILocation(line: 7, column: 52, scope: !31)
!42 = !DILocation(line: 7, column: 41, scope: !31)
!43 = !DILocation(line: 7, column: 12, scope: !31)
!44 = !DILocation(line: 7, column: 5, scope: !31)
!45 = distinct !DISubprogram(name: "__fizzer_private_io_model_cmdline_read_data", scope: !9, file: !9, line: 13, type: !46, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !35)
!46 = !DISubroutineType(types: !47)
!47 = !{null, !37}
!48 = !DILocalVariable(name: "data", arg: 1, scope: !45, file: !9, line: 13, type: !37)
!49 = !DILocation(line: 13, column: 117, scope: !45)
!50 = !DILocalVariable(name: "j", scope: !45, file: !9, line: 15, type: !51)
!51 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 15, column: 21, scope: !45)
!53 = !DILocation(line: 16, column: 18, scope: !45)
!54 = !DILocation(line: 16, column: 5, scope: !45)
!55 = !DILocation(line: 16, column: 11, scope: !45)
!56 = !DILocation(line: 16, column: 16, scope: !45)
!57 = !DILocalVariable(name: "i", scope: !58, file: !9, line: 17, type: !21)
!58 = distinct !DILexicalBlock(scope: !45, file: !9, line: 17, column: 5)
!59 = !DILocation(line: 17, column: 25, scope: !58)
!60 = !DILocation(line: 17, column: 10, scope: !58)
!61 = !DILocation(line: 17, column: 33, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !9, line: 17, column: 5)
!63 = !DILocation(line: 17, column: 37, scope: !62)
!64 = !DILocation(line: 17, column: 43, scope: !62)
!65 = !DILocation(line: 17, column: 35, scope: !62)
!66 = !DILocation(line: 17, column: 5, scope: !58)
!67 = !DILocation(line: 19, column: 14, scope: !68)
!68 = distinct !DILexicalBlock(scope: !62, file: !9, line: 18, column: 5)
!69 = !DILocation(line: 19, column: 16, scope: !68)
!70 = !DILocation(line: 19, column: 13, scope: !68)
!71 = !DILocation(line: 19, column: 11, scope: !68)
!72 = !DILocation(line: 20, column: 26, scope: !68)
!73 = !DILocation(line: 20, column: 32, scope: !68)
!74 = !DILocation(line: 20, column: 38, scope: !68)
!75 = !DILocation(line: 20, column: 9, scope: !68)
!76 = !DILocation(line: 20, column: 15, scope: !68)
!77 = !DILocation(line: 20, column: 20, scope: !68)
!78 = !DILocation(line: 20, column: 23, scope: !68)
!79 = !DILocation(line: 21, column: 9, scope: !68)
!80 = !DILocation(line: 23, column: 18, scope: !81)
!81 = distinct !DILexicalBlock(scope: !68, file: !9, line: 22, column: 9)
!82 = !DILocation(line: 23, column: 20, scope: !81)
!83 = !DILocation(line: 23, column: 17, scope: !81)
!84 = !DILocation(line: 23, column: 15, scope: !81)
!85 = !DILocation(line: 24, column: 30, scope: !81)
!86 = !DILocation(line: 24, column: 13, scope: !81)
!87 = !DILocation(line: 24, column: 19, scope: !81)
!88 = !DILocation(line: 24, column: 25, scope: !81)
!89 = !DILocation(line: 24, column: 28, scope: !81)
!90 = !DILocation(line: 25, column: 13, scope: !81)
!91 = !DILocation(line: 26, column: 9, scope: !81)
!92 = !DILocation(line: 27, column: 16, scope: !68)
!93 = !DILocation(line: 27, column: 22, scope: !68)
!94 = !DILocation(line: 27, column: 28, scope: !68)
!95 = !DILocation(line: 27, column: 30, scope: !68)
!96 = !DILocation(line: 27, column: 36, scope: !68)
!97 = distinct !{!97, !79, !98, !99}
!98 = !DILocation(line: 27, column: 43, scope: !68)
!99 = !{!"llvm.loop.mustprogress"}
!100 = !DILocation(line: 28, column: 5, scope: !68)
!101 = !DILocation(line: 17, column: 49, scope: !62)
!102 = !DILocation(line: 17, column: 5, scope: !62)
!103 = distinct !{!103, !66, !104, !99}
!104 = !DILocation(line: 28, column: 5, scope: !58)
!105 = !DILocation(line: 29, column: 5, scope: !45)
!106 = !DILocation(line: 29, column: 11, scope: !45)
!107 = !DILocation(line: 29, column: 16, scope: !45)
!108 = !DILocation(line: 29, column: 22, scope: !45)
!109 = !DILocation(line: 29, column: 28, scope: !45)
!110 = !DILocation(line: 30, column: 1, scope: !45)
