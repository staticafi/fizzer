; ModuleID = '/home/marek/root/fizzer/dist/data//main_versions/c/int_args.c'
source_filename = "/home/marek/root/fizzer/dist/data//main_versions/c/int_args.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__fizzer_private_io_model_cmdline_data_type = type { [255 x ptr], [4095 x i8], i8 }

@__fizzer_private_io_model_cmdline_data = internal global %struct.__fizzer_private_io_model_cmdline_data_type zeroinitializer, align 8, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_private_entry_function() #0 !dbg !30 {
  %1 = alloca ptr, align 8
  call void @llvm.dbg.declare(metadata ptr %1, metadata !35, metadata !DIExpression()), !dbg !38
  store ptr @__fizzer_private_io_model_cmdline_data, ptr %1, align 8, !dbg !38
  call void @__fizzer_private_io_model_cmdline_read_data(ptr noundef @__fizzer_private_io_model_cmdline_data), !dbg !39
  %2 = load i8, ptr getelementptr inbounds (%struct.__fizzer_private_io_model_cmdline_data_type, ptr @__fizzer_private_io_model_cmdline_data, i32 0, i32 2), align 1, !dbg !40
  %3 = zext i8 %2 to i32, !dbg !41
  %4 = call i32 @__fizzer_method_under_test__(i32 noundef %3, ptr noundef @__fizzer_private_io_model_cmdline_data), !dbg !42
  ret i32 %4, !dbg !43
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @__fizzer_private_io_model_cmdline_read_data(ptr noundef %0) #0 !dbg !44 {
  %2 = alloca ptr, align 8
  %3 = alloca i16, align 2
  %4 = alloca i8, align 1
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata ptr %3, metadata !49, metadata !DIExpression()), !dbg !51
  store i16 0, ptr %3, align 2, !dbg !51
  %5 = call zeroext i8 @__fizzer_private_io_model_cmdline_read_argc(), !dbg !52
  %6 = load ptr, ptr %2, align 8, !dbg !53
  %7 = getelementptr inbounds %struct.__fizzer_private_io_model_cmdline_data_type, ptr %6, i32 0, i32 2, !dbg !54
  store i8 %5, ptr %7, align 1, !dbg !55
  call void @llvm.dbg.declare(metadata ptr %4, metadata !56, metadata !DIExpression()), !dbg !58
  store i8 0, ptr %4, align 1, !dbg !58
  br label %8, !dbg !59

8:                                                ; preds = %56, %1
  %9 = load i8, ptr %4, align 1, !dbg !60
  %10 = zext i8 %9 to i32, !dbg !60
  %11 = load ptr, ptr %2, align 8, !dbg !62
  %12 = getelementptr inbounds %struct.__fizzer_private_io_model_cmdline_data_type, ptr %11, i32 0, i32 2, !dbg !63
  %13 = load i8, ptr %12, align 1, !dbg !63
  %14 = zext i8 %13 to i32, !dbg !62
  %15 = icmp slt i32 %10, %14, !dbg !64
  br i1 %15, label %16, label %59, !dbg !65

16:                                               ; preds = %8
  %17 = load i16, ptr %3, align 2, !dbg !66
  %18 = zext i16 %17 to i32, !dbg !66
  %19 = and i32 %18, 4095, !dbg !68
  %20 = trunc i32 %19 to i16, !dbg !69
  store i16 %20, ptr %3, align 2, !dbg !70
  %21 = load ptr, ptr %2, align 8, !dbg !71
  %22 = getelementptr inbounds %struct.__fizzer_private_io_model_cmdline_data_type, ptr %21, i32 0, i32 1, !dbg !72
  %23 = load i16, ptr %3, align 2, !dbg !73
  %24 = zext i16 %23 to i64, !dbg !71
  %25 = getelementptr inbounds [4095 x i8], ptr %22, i64 0, i64 %24, !dbg !71
  %26 = load ptr, ptr %2, align 8, !dbg !74
  %27 = getelementptr inbounds %struct.__fizzer_private_io_model_cmdline_data_type, ptr %26, i32 0, i32 0, !dbg !75
  %28 = load i8, ptr %4, align 1, !dbg !76
  %29 = zext i8 %28 to i64, !dbg !74
  %30 = getelementptr inbounds [255 x ptr], ptr %27, i64 0, i64 %29, !dbg !74
  store ptr %25, ptr %30, align 8, !dbg !77
  br label %31, !dbg !78

31:                                               ; preds = %44, %16
  %32 = load i16, ptr %3, align 2, !dbg !79
  %33 = zext i16 %32 to i32, !dbg !79
  %34 = and i32 %33, 4095, !dbg !81
  %35 = trunc i32 %34 to i16, !dbg !82
  store i16 %35, ptr %3, align 2, !dbg !83
  %36 = call signext i8 @__fizzer_private_io_model_cmdline_read_char(), !dbg !84
  %37 = load ptr, ptr %2, align 8, !dbg !85
  %38 = getelementptr inbounds %struct.__fizzer_private_io_model_cmdline_data_type, ptr %37, i32 0, i32 1, !dbg !86
  %39 = load i16, ptr %3, align 2, !dbg !87
  %40 = zext i16 %39 to i64, !dbg !85
  %41 = getelementptr inbounds [4095 x i8], ptr %38, i64 0, i64 %40, !dbg !85
  store i8 %36, ptr %41, align 1, !dbg !88
  %42 = load i16, ptr %3, align 2, !dbg !89
  %43 = add i16 %42, 1, !dbg !89
  store i16 %43, ptr %3, align 2, !dbg !89
  br label %44, !dbg !90

44:                                               ; preds = %31
  %45 = load ptr, ptr %2, align 8, !dbg !91
  %46 = getelementptr inbounds %struct.__fizzer_private_io_model_cmdline_data_type, ptr %45, i32 0, i32 1, !dbg !92
  %47 = load i16, ptr %3, align 2, !dbg !93
  %48 = zext i16 %47 to i32, !dbg !93
  %49 = sub i32 %48, 1, !dbg !94
  %50 = zext i32 %49 to i64, !dbg !91
  %51 = getelementptr inbounds [4095 x i8], ptr %46, i64 0, i64 %50, !dbg !91
  %52 = load i8, ptr %51, align 1, !dbg !91
  %53 = sext i8 %52 to i32, !dbg !91
  %54 = icmp ne i32 %53, 0, !dbg !95
  br i1 %54, label %31, label %55, !dbg !90, !llvm.loop !96

55:                                               ; preds = %44
  br label %56, !dbg !99

56:                                               ; preds = %55
  %57 = load i8, ptr %4, align 1, !dbg !100
  %58 = add i8 %57, 1, !dbg !100
  store i8 %58, ptr %4, align 1, !dbg !100
  br label %8, !dbg !101, !llvm.loop !102

59:                                               ; preds = %8
  %60 = load ptr, ptr %2, align 8, !dbg !104
  %61 = getelementptr inbounds %struct.__fizzer_private_io_model_cmdline_data_type, ptr %60, i32 0, i32 0, !dbg !105
  %62 = load ptr, ptr %2, align 8, !dbg !106
  %63 = getelementptr inbounds %struct.__fizzer_private_io_model_cmdline_data_type, ptr %62, i32 0, i32 2, !dbg !107
  %64 = load i8, ptr %63, align 1, !dbg !107
  %65 = zext i8 %64 to i64, !dbg !104
  %66 = getelementptr inbounds [255 x ptr], ptr %61, i64 0, i64 %65, !dbg !104
  store ptr null, ptr %66, align 8, !dbg !108
  ret void, !dbg !109
}

declare i32 @__fizzer_method_under_test__(i32 noundef, ptr noundef) #2

declare zeroext i8 @__fizzer_private_io_model_cmdline_read_argc() #2

declare signext i8 @__fizzer_private_io_model_cmdline_read_char() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__fizzer_private_io_model_cmdline_data", scope: !2, file: !9, line: 11, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//main_versions/c/int_args.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "731d4f7a406eb0000343ec0747eb32a2")
!4 = !{!5, !6}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !{!0}
!9 = !DIFile(filename: "data/main_versions/c/cmdline_model.h", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "413401da3ac2f65d38efdce9f88688d2")
!10 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__fizzer_private_io_model_cmdline_data_type", file: !9, line: 6, size: 49088, elements: !11)
!11 = !{!12, !16, !20}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "argv", scope: !10, file: !9, line: 8, baseType: !13, size: 16320)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 16320, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 255)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "chars", scope: !10, file: !9, line: 9, baseType: !17, size: 32760, offset: 16320)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 32760, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 4095)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "argc", scope: !10, file: !9, line: 10, baseType: !21, size: 8, offset: 49080)
!21 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!22 = !{i32 7, !"Dwarf Version", i32 5}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 8, !"PIC Level", i32 2}
!26 = !{i32 7, !"PIE Level", i32 2}
!27 = !{i32 7, !"uwtable", i32 2}
!28 = !{i32 7, !"frame-pointer", i32 2}
!29 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!30 = distinct !DISubprogram(name: "__fizzer_private_entry_function", scope: !31, file: !31, line: 3, type: !32, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !34)
!31 = !DIFile(filename: "data/main_versions/c/int_args.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "731d4f7a406eb0000343ec0747eb32a2")
!32 = !DISubroutineType(types: !33)
!33 = !{!5}
!34 = !{}
!35 = !DILocalVariable(name: "data", scope: !30, file: !31, line: 5, type: !36)
!36 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !37)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!38 = !DILocation(line: 5, column: 64, scope: !30)
!39 = !DILocation(line: 6, column: 5, scope: !30)
!40 = !DILocation(line: 7, column: 52, scope: !30)
!41 = !DILocation(line: 7, column: 41, scope: !30)
!42 = !DILocation(line: 7, column: 12, scope: !30)
!43 = !DILocation(line: 7, column: 5, scope: !30)
!44 = distinct !DISubprogram(name: "__fizzer_private_io_model_cmdline_read_data", scope: !9, file: !9, line: 13, type: !45, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !34)
!45 = !DISubroutineType(types: !46)
!46 = !{null, !36}
!47 = !DILocalVariable(name: "data", arg: 1, scope: !44, file: !9, line: 13, type: !36)
!48 = !DILocation(line: 13, column: 117, scope: !44)
!49 = !DILocalVariable(name: "j", scope: !44, file: !9, line: 15, type: !50)
!50 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 15, column: 21, scope: !44)
!52 = !DILocation(line: 16, column: 18, scope: !44)
!53 = !DILocation(line: 16, column: 5, scope: !44)
!54 = !DILocation(line: 16, column: 11, scope: !44)
!55 = !DILocation(line: 16, column: 16, scope: !44)
!56 = !DILocalVariable(name: "i", scope: !57, file: !9, line: 17, type: !21)
!57 = distinct !DILexicalBlock(scope: !44, file: !9, line: 17, column: 5)
!58 = !DILocation(line: 17, column: 25, scope: !57)
!59 = !DILocation(line: 17, column: 10, scope: !57)
!60 = !DILocation(line: 17, column: 33, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !9, line: 17, column: 5)
!62 = !DILocation(line: 17, column: 37, scope: !61)
!63 = !DILocation(line: 17, column: 43, scope: !61)
!64 = !DILocation(line: 17, column: 35, scope: !61)
!65 = !DILocation(line: 17, column: 5, scope: !57)
!66 = !DILocation(line: 19, column: 14, scope: !67)
!67 = distinct !DILexicalBlock(scope: !61, file: !9, line: 18, column: 5)
!68 = !DILocation(line: 19, column: 16, scope: !67)
!69 = !DILocation(line: 19, column: 13, scope: !67)
!70 = !DILocation(line: 19, column: 11, scope: !67)
!71 = !DILocation(line: 20, column: 26, scope: !67)
!72 = !DILocation(line: 20, column: 32, scope: !67)
!73 = !DILocation(line: 20, column: 38, scope: !67)
!74 = !DILocation(line: 20, column: 9, scope: !67)
!75 = !DILocation(line: 20, column: 15, scope: !67)
!76 = !DILocation(line: 20, column: 20, scope: !67)
!77 = !DILocation(line: 20, column: 23, scope: !67)
!78 = !DILocation(line: 21, column: 9, scope: !67)
!79 = !DILocation(line: 23, column: 18, scope: !80)
!80 = distinct !DILexicalBlock(scope: !67, file: !9, line: 22, column: 9)
!81 = !DILocation(line: 23, column: 20, scope: !80)
!82 = !DILocation(line: 23, column: 17, scope: !80)
!83 = !DILocation(line: 23, column: 15, scope: !80)
!84 = !DILocation(line: 24, column: 30, scope: !80)
!85 = !DILocation(line: 24, column: 13, scope: !80)
!86 = !DILocation(line: 24, column: 19, scope: !80)
!87 = !DILocation(line: 24, column: 25, scope: !80)
!88 = !DILocation(line: 24, column: 28, scope: !80)
!89 = !DILocation(line: 25, column: 13, scope: !80)
!90 = !DILocation(line: 26, column: 9, scope: !80)
!91 = !DILocation(line: 27, column: 16, scope: !67)
!92 = !DILocation(line: 27, column: 22, scope: !67)
!93 = !DILocation(line: 27, column: 28, scope: !67)
!94 = !DILocation(line: 27, column: 30, scope: !67)
!95 = !DILocation(line: 27, column: 36, scope: !67)
!96 = distinct !{!96, !78, !97, !98}
!97 = !DILocation(line: 27, column: 43, scope: !67)
!98 = !{!"llvm.loop.mustprogress"}
!99 = !DILocation(line: 28, column: 5, scope: !67)
!100 = !DILocation(line: 17, column: 49, scope: !61)
!101 = !DILocation(line: 17, column: 5, scope: !61)
!102 = distinct !{!102, !65, !103, !98}
!103 = !DILocation(line: 28, column: 5, scope: !57)
!104 = !DILocation(line: 29, column: 5, scope: !44)
!105 = !DILocation(line: 29, column: 11, scope: !44)
!106 = !DILocation(line: 29, column: 16, scope: !44)
!107 = !DILocation(line: 29, column: 22, scope: !44)
!108 = !DILocation(line: 29, column: 28, scope: !44)
!109 = !DILocation(line: 30, column: 1, scope: !44)
