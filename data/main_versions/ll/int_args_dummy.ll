; ModuleID = '/home/marek/root/fizzer/dist/data//main_versions/c/int_args_dummy.c'
source_filename = "/home/marek/root/fizzer/dist/data//main_versions/c/int_args_dummy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1, !dbg !0
@__const.__fizzer_private_entry_function.argv = private unnamed_addr constant [2 x ptr] [ptr @.str, ptr null], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_private_entry_function() #0 !dbg !18 {
  %1 = alloca [2 x ptr], align 16
  call void @llvm.dbg.declare(metadata ptr %1, metadata !23, metadata !DIExpression()), !dbg !26
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %1, ptr align 16 @__const.__fizzer_private_entry_function.argv, i64 16, i1 false), !dbg !26
  %2 = getelementptr inbounds [2 x ptr], ptr %1, i64 0, i64 0, !dbg !27
  %3 = call i32 @__fizzer_method_under_test__(i32 noundef 1, ptr noundef %2), !dbg !28
  ret i32 %3, !dbg !29
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @__fizzer_method_under_test__(i32 noundef, ptr noundef) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

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
!10 = !{i32 7, !"Dwarf Version", i32 5}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 8, !"PIC Level", i32 2}
!14 = !{i32 7, !"PIE Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 2}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!18 = distinct !DISubprogram(name: "__fizzer_private_entry_function", scope: !2, file: !2, line: 2, type: !19, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !22)
!19 = !DISubroutineType(types: !20)
!20 = !{!21}
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !{}
!23 = !DILocalVariable(name: "argv", scope: !18, file: !2, line: 4, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 128, elements: !5)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!26 = !DILocation(line: 4, column: 11, scope: !18)
!27 = !DILocation(line: 5, column: 44, scope: !18)
!28 = !DILocation(line: 5, column: 12, scope: !18)
!29 = !DILocation(line: 5, column: 5, scope: !18)
