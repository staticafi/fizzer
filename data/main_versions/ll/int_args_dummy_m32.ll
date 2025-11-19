; ModuleID = '/home/marek/root/fizzer/dist/data//main_versions/c/int_args_dummy.c'
source_filename = "/home/marek/root/fizzer/dist/data//main_versions/c/int_args_dummy.c"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1, !dbg !0
@__const.__fizzer_private_entry_function.argv = private unnamed_addr constant [2 x ptr] [ptr @.str, ptr null], align 4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_private_entry_function() #0 !dbg !19 {
  %1 = alloca [2 x ptr], align 4
  call void @llvm.dbg.declare(metadata ptr %1, metadata !24, metadata !DIExpression()), !dbg !27
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %1, ptr align 4 @__const.__fizzer_private_entry_function.argv, i32 8, i1 false), !dbg !27
  %2 = getelementptr inbounds [2 x ptr], ptr %1, i32 0, i32 0, !dbg !28
  %3 = call i32 @__fizzer_method_under_test__(i32 noundef 1, ptr noundef %2), !dbg !29
  ret i32 %3, !dbg !30
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i32, i1 immarg) #2

declare i32 @__fizzer_method_under_test__(i32 noundef, ptr noundef) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="i686" "target-features"="+cmov,+cx8,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="i686" "target-features"="+cmov,+cx8,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 4, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "data/main_versions/c/int_args_dummy.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "a502c19b879dfac00078e8285d6b61c7")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 16, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 2)
!7 = distinct !DICompileUnit(language: DW_LANG_C11, file: !8, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !9, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//main_versions/c/int_args_dummy.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "a502c19b879dfac00078e8285d6b61c7")
!9 = !{!0}
!10 = !{i32 1, !"NumRegisterParameters", i32 0}
!11 = !{i32 7, !"Dwarf Version", i32 5}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 8, !"PIC Level", i32 2}
!15 = !{i32 7, !"PIE Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 2}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!19 = distinct !DISubprogram(name: "__fizzer_private_entry_function", scope: !2, file: !2, line: 2, type: !20, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !23)
!20 = !DISubroutineType(types: !21)
!21 = !{!22}
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !{}
!24 = !DILocalVariable(name: "argv", scope: !19, file: !2, line: 4, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 64, elements: !5)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 32)
!27 = !DILocation(line: 4, column: 11, scope: !19)
!28 = !DILocation(line: 5, column: 44, scope: !19)
!29 = !DILocation(line: 5, column: 12, scope: !19)
!30 = !DILocation(line: 5, column: 5, scope: !19)
