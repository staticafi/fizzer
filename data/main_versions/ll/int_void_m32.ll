; ModuleID = '/home/marek/root/fizzer/dist/data//main_versions/c/int_void.c'
source_filename = "/home/marek/root/fizzer/dist/data//main_versions/c/int_void.c"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__fizzer_private_entry_function() #0 !dbg !11 {
  %1 = call i32 @__fizzer_method_under_test__(), !dbg !16
  ret i32 %1, !dbg !17
}

declare i32 @__fizzer_method_under_test__() #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="i686" "target-features"="+cmov,+cx8,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="i686" "target-features"="+cmov,+cx8,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/marek/root/fizzer/dist/data//main_versions/c/int_void.c", directory: "/home/marek/root/fizzer/dist/output", checksumkind: CSK_MD5, checksum: "0a32bda5d4ee5e26d9e52e613cfff1f6")
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 7, !"Dwarf Version", i32 5}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 8, !"PIC Level", i32 2}
!7 = !{i32 7, !"PIE Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 2}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!11 = distinct !DISubprogram(name: "__fizzer_private_entry_function", scope: !12, file: !12, line: 2, type: !13, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!12 = !DIFile(filename: "data/main_versions/c/int_void.c", directory: "/home/marek/root/fizzer/dist", checksumkind: CSK_MD5, checksum: "0a32bda5d4ee5e26d9e52e613cfff1f6")
!13 = !DISubroutineType(types: !14)
!14 = !{!15}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DILocation(line: 4, column: 12, scope: !11)
!17 = !DILocation(line: 4, column: 5, scope: !11)
