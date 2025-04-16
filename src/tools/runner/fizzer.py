#!/usr/bin/env python3
import subprocess
import sys
import os
import time
import shutil
from datetime import datetime


dummy_mut_versions = """
int  __fizzer_private_int_method_under_test(void) { return 0; }
void  __fizzer_private_void_method_under_test(void) {}
int  __fizzer_private_int_method_under_test_with_params(int  argc, char*  argv[]) { return 0; }
void  __fizzer_private_void_method_under_test_with_params(int  argc, char*  argv[]) {}
"""

empty_cmdline_options = """
#define __fizzer_private_io_model_cmdline_read() int argc = 0; char* argv[1] = { 0 }
"""

reading_cmdline_options = """
extern unsigned char  __fizzer_private_io_model_cmdline_read_argc(void);
extern char  __fizzer_private_io_model_cmdline_read_char(void);
#define __fizzer_private_io_model_cmdline_read()                                                    \\
    enum {                                                                                          \\
        MAX_CHARS   = 4095U /* This value must be equal to iomodels::cmdline::MAX_NUM_CHARS. */     \\
    };                                                                                              \\
    char*  argv[255];                                                                               \\
    char  chars[MAX_CHARS];                                                                         \\
    unsigned short  j = 0U;                                                                         \\
    unsigned char const  argc = __fizzer_private_io_model_cmdline_read_argc();                      \\
    for (unsigned char  i = 0U; i < argc; ++i)                                                      \\
    {                                                                                               \\
        j = (j & MAX_CHARS);                                                                        \\
        argv[i] = &chars[j];                                                                        \\
        do                                                                                          \\
        {                                                                                           \\
            j = (j & MAX_CHARS);                                                                    \\
            chars[j] = __fizzer_private_io_model_cmdline_read_char();                               \\
            ++j;                                                                                    \\
        }                                                                                           \\
        while (chars[j - 1U] != '\\0');                                                              \\
    }                                                                                               \\
    argv[argc] = (char*)0
"""

entry_function_versions = """
int  __fizzer_private_int_entry_function(void) { return __fizzer_private_int_method_under_test(); }
int  __fizzer_private_void_entry_function(void) { __fizzer_private_void_method_under_test(); return 0; }
int  __fizzer_private_int_entry_function_with_params(void)
{ __fizzer_private_io_model_cmdline_read(); return __fizzer_private_int_method_under_test_with_params((int)argc, argv); }
int  __fizzer_private_void_entry_function_with_params(void)
{ __fizzer_private_io_model_cmdline_read(); __fizzer_private_void_method_under_test_with_params((int)argc, argv); return 0; }
"""

testcomp_testsuite_metadata = """<?xml version='1.0' encoding='UTF-8' standalone='no'?>
<!DOCTYPE test-metadata PUBLIC "+//IDN sosy-lab.org//DTD test-format test-metadata 1.1//EN" "https://sosy-lab.org/test-format/test-metadata-1.1.dtd">
<test-metadata>
  <sourcecodelang>C</sourcecodelang>
  <producer>fizzer</producer>
  <specification>%%SPECIFICATION%%</specification>
  <programfile>%%PROGRAM_FILE%%</programfile>
  <programhash>null</programhash>
  <entryfunction>main</entryfunction>
  <architecture>%%ARCHITECTURE%%</architecture>
  <creationtime>%%CREATIONTIME%%</creationtime>
</test-metadata>
"""
testcomp_property_coverage_branches = "COVER( init(main()), FQL(COVER EDGES(@DECISIONEDGE)) )"
testcomp_property_coverage_error_call = "COVER( init(main()), FQL(COVER EDGES(@CALL(reach_error))) )"


def _execute(command_and_args, timeout_ = None):
    cmd = [x for x in command_and_args if len(x) > 0]
    # print("*** CALLING ***\n" + " ".join(cmd) + "\n************\n")
    return subprocess.run(cmd, timeout=timeout_)


def  benchmark_file_name(input_file):
    return os.path.basename(input_file)


def  benchmark_name(input_file):
    return os.path.splitext(benchmark_file_name(input_file))[0]


def  benchmark_c_name(input_file):
    return benchmark_name(input_file) + "_source.c"


def  benchmark_ll_name(input_file):
    return benchmark_name(input_file) + ".ll"


def  benchmark_instrumented_ll_name(input_file):
    return benchmark_name(input_file) + "_instrumented.ll"


def  benchmark_entry_function_name(input_file):
    return benchmark_name(input_file) + "_entry_function.txt"


def  benchmark_target_name(input_file):
    return benchmark_name(input_file) + "_target"


def  benchmark_sala_name(input_file):
    return benchmark_name(input_file) + "_sala" + ".json"


def build(self_dir, input_file, output_dir, options, use_m32, generate_jsonc, testcomp, silent_mode):
    ll_file = os.path.join(output_dir, benchmark_ll_name(input_file))

    if silent_mode is False: print("\"build_times\": {", flush=True)
    if silent_mode is False: print("    \"Compiling[C->LLVM]\": ", end='', flush=True)
    t0 = time.time()
    benchmark_file = os.path.join(output_dir, benchmark_c_name(input_file))
    shutil.copyfile(input_file, benchmark_file)
    with open(benchmark_file, "a") as fw:
        fw.write(dummy_mut_versions)
        if testcomp is not None:
            fw.write(empty_cmdline_options)
        else:
            fw.write(reading_cmdline_options)
        fw.write(entry_function_versions)
    if _execute(
            [ "clang" ] +
                (["-m32"] if use_m32 is True else []) +
                [ "-O0", "-g", "-S", "-emit-llvm", "-Wno-everything", "-fbracket-depth=1024", benchmark_file, "-o", ll_file],
            None).returncode:
        raise Exception("Compilation[C->LLVM] has failed: " + input_file)
    t1 = time.time()
    if silent_mode is False: print("%.2f," % (t1 - t0), flush=True)

    instrumented_ll_file = os.path.join(output_dir, benchmark_instrumented_ll_name(input_file))
    if silent_mode is False: print("    \"Instrumenting\": ", end='', flush=True)
    t0 = time.time()
    if _execute(
            [ os.path.join(self_dir, "tools", "@INSTRUMENTER_FILE@") ] +
                options +
                ["--input", ll_file, "--output", instrumented_ll_file],
            None).returncode:
        raise Exception("Instrumentation has failed: " + ll_file)
    t1 = time.time()
    if silent_mode is False: print("%.2f," % (t1 - t0), flush=True)

    fuzz_target_libraries = list(map( # type: ignore
        lambda lib_name: os.path.join(self_dir, "lib32" if use_m32 is True else "lib", lib_name).replace("\\", "/"), 
        @FUZZ_TARGET_LIBRARIES_FILES_LIST@ # type: ignore
        ))
    target_file = os.path.join(output_dir, benchmark_target_name(input_file))

    if silent_mode is False: print("    \"Linking\": ", end='', flush=True)
    t0 = time.time()
    if _execute(
            [ "clang++" ] +
                (["-m32"] if use_m32 is True else []) +
                [ "-O3", instrumented_ll_file ] +
                "@FUZZ_TARGET_NEEDED_COMPILATION_FLAGS@".split() +
                fuzz_target_libraries +
                [ "-o", target_file ],
            None).returncode:
        raise Exception("Linking has failed: " + input_file)
    t1 = time.time()
    if silent_mode is False: print("%.2f," % (t1 - t0), flush=True)

    if silent_mode is False: print("    \"Compiling[LLVM->sala]\": ", end='', flush=True)
    t0 = time.time()
    with open(os.path.join(output_dir, benchmark_entry_function_name(input_file)), "r") as f:
        entry_function_name = f.read()
    if _execute(
            [ os.path.join(self_dir, "tools", "salac", "salac.py") ] +
                (["--jsonc"] if generate_jsonc is True else []) + [
                "--input", instrumented_ll_file,
                "--output", output_dir,
                "--rename", os.path.splitext(benchmark_sala_name(input_file))[0],
                "--entry", entry_function_name ],
            None).returncode:
        if silent_mode is False: print("},", flush=True)
        return 
    t1 = time.time()
    if silent_mode is False: print("%.2f" % (t1 - t0), flush=True)
    if silent_mode is False: print("},", flush=True)


def adjust_timeouts(options, start_time, silent_mode):
    time_taken = time.time() - start_time
    if time_taken < 0.1:
        return

    def find_option_value_and_index(option):
        try: idx = options.index(option)
        except Exception: return None, None
        if idx >= len(options):
            return None
        idx += 1
        try: return int(options[idx]), idx
        except: return None, None
    
    def reduce_option_value(name, value, idx, total_time, suffix=""):
        if total_time > time_taken:
            percentage = 1.0 - time_taken / total_time
        else:
            percentage = 0.0
        new_value = int(value * percentage)
        if silent_mode is False: print("    \"" + name + "\": [ " + str(value) + ", " + str(new_value) + " ]" + suffix, flush=True)
        options[idx] = str(new_value)

    if silent_mode is False: print("\"adjusting_timeouts\": {", flush=True)
    if silent_mode is False: print("    \"time_already_taken\": %.2f," % time_taken, flush=True)

    fuzz_value, fuzz_idx = find_option_value_and_index("--max_seconds")
    opt_value, opt_idx = find_option_value_and_index("--opt_max_seconds")

    if fuzz_value is not None and opt_value is not None:
        reduce_option_value("--max_seconds", fuzz_value, fuzz_idx, fuzz_value + opt_value, ",")
        reduce_option_value("--opt_max_seconds", opt_value, opt_idx, fuzz_value + opt_value)
    elif fuzz_value is not None:
        reduce_option_value("--max_seconds", fuzz_value, fuzz_idx, fuzz_value)
    elif opt_value is not None:
        reduce_option_value("--opt_max_seconds", opt_value, opt_idx, opt_value)

    if silent_mode is False: print("},", flush=True)

def generate_testcomp_metadata_xml(input_file, output_dir, use_m32, property):
    test_suite_dir = os.path.join(output_dir, "test-suite")
    os.makedirs(test_suite_dir, exist_ok=True)
    content = testcomp_testsuite_metadata.replace(
        "%%SPECIFICATION%%", property
        ).replace(
        "%%PROGRAM_FILE%%", os.path.basename(input_file)
        ).replace(
        "%%ARCHITECTURE%%", "32" if use_m32 is True else "64"
        ).replace(
        "%%CREATIONTIME%%", datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        )
    with open(os.path.join(test_suite_dir, "metadata.xml"), "w") as f:
        f.write(content)


def fuzz(self_dir, input_file, output_dir, options, start_time, silent_mode):
    target = os.path.join(output_dir, benchmark_target_name(input_file))
    if not os.path.isfile(target):
        target = os.path.join(os.path.dirname(input_file), benchmark_target_name(input_file))
        if not os.path.isfile(target):
            raise Exception("Cannot find the fuzzing target file: " + target)

    sala_program = os.path.join(output_dir, benchmark_sala_name(input_file))
    if not os.path.isfile(sala_program):
        sala_program = os.path.join(os.path.dirname(input_file), benchmark_sala_name(input_file))
        if not os.path.isfile(sala_program) and silent_mode is False:
            sala_program = None

    if _execute(
            [ os.path.join(self_dir, "tools", "@FUZZER_FILE@"),
                "--path_to_target", target ] +
                ([ "--path_to_sala", sala_program ] if sala_program is not None else []) +
                [ "--output_dir", output_dir] +
                options,
            None).returncode:
        raise Exception("Fuzzing has failed.")


def help(self_dir):
    print("fizzer usage")
    print("================")
    print("help                 Prints this help message.")
    print("input_file <PATH>    A source C file to build and analyze.")
    print("output_dir <PATH>    A directory under which all results will be saved.")
    print("                     If not specified, then the current directory is used.")
    print("skip_building        Skip building of the source C file.")
    print("skip_fuzzing         Skip fuzzing of the built source C file.")
    print("silent_mode          When specified, no messages will be printed.")
    print("m32                  When specified, the source C file will be compiled for")
    print("                     32-bit machine (cpu). Otherwise, 64-bit machine is assumed.")
    print("jsonc                When specified, Sala program with comments will be")
    print("                     generated together with the standard one.")
    print("testcomp <PATH>      When specified, then the test suite will be produced in")
    print("                     the competition's format. See")
    print("                     https://gitlab.com/sosy-lab/test-comp/test-format")
    print("                     The PATH refers to competition's '.prp' file. See")
    print("                     https://test-comp.sosy-lab.org/2025/rules.php")
    print("                     If PATH is the string 'branches', then the property in file")
    print("                     'properties/coverage-branches.prp' is assumed.")
    print("                     If PATH is the string 'call', then the property in file")
    print("                     'properties/coverage-error-call.prp' is assumed.")
    print("                     The option '--test_type testcomp' is automatically.")
    print("                     passed to the fuzzer tool.")
    print("\nNext follows a listing of options of tools called from this script. When they are")
    print("passed to the script they will automatically be propagated to the corresponding tool.")

    print("\nThe options of the LLVM 'instrumenter' tool:")
    _execute([ os.path.join(self_dir, "tools", "@INSTRUMENTER_FILE@"), "--help"], None)
    print("\nThe options of the 'fuzzer' tool:")
    _execute([ os.path.join(self_dir, "tools", "@FUZZER_FILE@"), "--help"], None)

    print("\n!!! WARNING !!!!")
    print("An analyzed program is currently *NOT* executed in an isolated environment. It is thus")
    print("*NOT* advised to use it on a C program accessing disk or any other external resource")
    print("(unless you provided the isolation, e.g. by running the analysis in a Docker container).")


def version(self_dir):
    _execute([ os.path.join(self_dir, "tools", "@FUZZER_FILE@"), "--version"], None)


def main():
    start_time = time.time()
    self_dir = os.path.normpath(os.path.abspath(os.path.dirname(__file__)))
    old_cwd = os.path.abspath(os.getcwd())
    input_file = None
    output_dir = old_cwd
    clear_output_dir = False
    skip_building = False
    skip_fuzzing = False
    silent_mode = False
    copy_source_file = False
    testcomp = None
    use_m32 = False
    generate_jsonc = False
    options = []
    options_instument = []
    i = 1
    while (i < len(sys.argv)):
        arg = sys.argv[i]
        if arg == "--help":
            help(self_dir)
            return
        if arg == "--version":
            version(self_dir)
            return

        if arg == "--silent_mode":
            silent_mode = True
        elif arg == "--progress_recording":
            copy_source_file = True

        if arg == "--input_file" and i+1 < len(sys.argv) and os.path.isfile(sys.argv[i+1]):
            input_file = os.path.normpath(os.path.abspath(sys.argv[i+1]))
            i += 1
        elif arg == "--output_dir" and i+1 < len(sys.argv) and not os.path.isfile(sys.argv[i+1]):
            output_dir = os.path.normpath(os.path.abspath(sys.argv[i+1]))
            os.makedirs(output_dir, exist_ok=True)
            i += 1
        elif arg == "--clear_output_dir":
            clear_output_dir = True
        elif arg == "--skip_building":
            skip_building = True
        elif arg == "--skip_fuzzing":
            skip_fuzzing = True
        elif arg in [ "--save_mapping" ]:
            options_instument.append(arg)
        elif arg == "--m32":
            use_m32 = True
        elif arg == "--jsonc":
            generate_jsonc = True
        elif arg == "--testcomp" and i+1 < len(sys.argv):
            if sys.argv[i+1] == 'branches':
                testcomp = testcomp_property_coverage_branches
            elif sys.argv[i+1] == 'call':
                testcomp = testcomp_property_coverage_error_call
            elif os.path.isfile(sys.argv[i+1]):
                with open(sys.argv[i+1], "r") as f_prp:
                    testcomp = f_prp.read().strip()
            if testcomp is not None:
                options.append("--test_type")
                options.append("testcomp")
            i += 1
        else:
            options.append(arg)
        i += 1

    if clear_output_dir is True and os.path.isdir(output_dir):
        shutil.rmtree(output_dir)
    if copy_source_file is True:
        os.makedirs(output_dir, exist_ok=True)
        shutil.copy(input_file, output_dir)

    old_cwd = os.getcwd()
    os.chdir(output_dir)
    try:
        if input_file is None:
            raise Exception("Cannot find the input file.")
        if silent_mode is False: print("### starting fizzer's pipeline ###\n{", flush=True)
        if skip_building is False:
            build(self_dir, input_file, output_dir, options_instument, use_m32, generate_jsonc, testcomp, silent_mode)
            adjust_timeouts(options, start_time, silent_mode)
        if skip_fuzzing is False:
            if testcomp is not None:
                generate_testcomp_metadata_xml(input_file, output_dir, use_m32, testcomp)
            fuzz(self_dir, input_file, output_dir, options, start_time, silent_mode)
            if silent_mode is False: print(",", flush=True)
        if silent_mode is False: print("\"exit_code\": 0,", flush=True)
    except Exception as e:
        os.chdir(old_cwd)
        if silent_mode is False: print("\"error_message\": \"" + str(e) + "\"", flush=True)
        if silent_mode is False: print("\"exit_code\": 1,", flush=True)
        raise e
    finally:
        if silent_mode is False:
            print("\"total_time\": %.2f" % (time.time() - start_time), flush=True)
            print("}", flush=True)


if __name__ == "__main__":
    exit_code = 0
    try:
        main()
    except Exception as e:
        exit_code = 1
    exit(exit_code)
