#!/usr/bin/env python3
import subprocess
import sys
import os
import time
import shutil
import re
from datetime import datetime


def _execute(command_and_args, timeout_ = None, stdout_=None, stderr_=None):
    cmd = [x for x in command_and_args if len(x) > 0]
    # print("*** CALLING ***\n" + " ".join(cmd) + "\n************\n")
    return subprocess.run(cmd, timeout=timeout_, stdout=stdout_, stderr=stderr_)


def  benchmark_file_name(input_file):
    return os.path.basename(input_file)


def  benchmark_name(input_file):
    return os.path.splitext(benchmark_file_name(input_file))[0]


def  benchmark_c_name(input_file):
    return benchmark_name(input_file) + "_source.c"


def  benchmark_ll_name(input_file):
    return benchmark_name(input_file) + ".ll"


def  benchmark_composed_ll_name(input_file):
    return benchmark_name(input_file) + "_composed.ll"


def  benchmark_instrumented_ll_name(input_file):
    return benchmark_name(input_file) + "_instrumented.ll"


def  benchmark_target_name(input_file):
    return benchmark_name(input_file) + "_target"


def  benchmark_sala_name(input_file):
    return benchmark_name(input_file) + "_sala" + ".json"


def build(self_dir, input_file, output_dir, options, use_m32, main_no_args, generate_jsonc, silent_mode):
    ll_file = os.path.join(output_dir, benchmark_ll_name(input_file))

    if silent_mode is False: print("\"build_times\": {", flush=True)
    if silent_mode is False: print("    \"Compiling[C->LLVM]\": ", end='', flush=True)
    t0 = time.time()
    benchmark_file = os.path.join(output_dir, benchmark_c_name(input_file))
    shutil.copyfile(input_file, benchmark_file)
    if _execute(
            [ "clang" ] +
                (["-m32"] if use_m32 is True else []) +
                [ "-O0", "-g", "-S", "-emit-llvm", "-Wno-everything", "-fbracket-depth=1024", benchmark_file, "-o", ll_file]
            ).returncode:
        raise Exception("Compilation[C->LLVM] has failed: " + input_file)
    t1 = time.time()
    if silent_mode is False: print("%.2f," % (t1 - t0), flush=True)

    composed_ll_file = os.path.join(output_dir, benchmark_composed_ll_name(input_file))
    if silent_mode is False: print("    \"Composing\": ", end='', flush=True)
    t0 = time.time()
    if _execute(
            [ os.path.join(self_dir, "tools", "@COMPOSER_FILE@") ] +
                ["--data", os.path.join(self_dir, "data"), "--input", ll_file, "--output", composed_ll_file] +
                (["--noargs"] if main_no_args else [])
            ).returncode:
        raise Exception("Composition of the analyzed .ll file has failed: " + ll_file)
    t1 = time.time()
    if silent_mode is False: print("%.2f," % (t1 - t0), flush=True)


    instrumented_ll_file = os.path.join(output_dir, benchmark_instrumented_ll_name(input_file))
    if silent_mode is False: print("    \"Instrumenting\": ", end='', flush=True)
    t0 = time.time()
    if _execute(
            [ os.path.join(self_dir, "tools", "@INSTRUMENTER_FILE@") ] +
                options +
                ["--input", composed_ll_file, "--output", instrumented_ll_file]
            ).returncode:
        raise Exception("Instrumentation has failed: " + composed_ll_file)
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
                [ "-o", target_file ]
            ).returncode:
        raise Exception("Linking has failed: " + input_file)
    t1 = time.time()
    if silent_mode is False: print("%.2f," % (t1 - t0), flush=True)

    if silent_mode is False: print("    \"Compiling[LLVM->sala]\": ", end='', flush=True)
    t0 = time.time()
    if _execute(
            [ os.path.join(self_dir, "tools", "salac", "salac.py") ] +
                (["--jsonc"] if generate_jsonc is True else []) + [
                "--input", instrumented_ll_file,
                "--output", output_dir,
                "--rename", os.path.splitext(benchmark_sala_name(input_file))[0],
                "--entry", "__fizzer_private_entry_function"
                ]
            ).returncode:
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
                options
            ).returncode:
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
    print("\nNext follows a listing of options of tools called from this script. When they are")
    print("passed to the script they will automatically be propagated to the corresponding tool.")

    print("\nThe options of the 'composer' tool:")
    _execute([ os.path.join(self_dir, "tools", "@COMPOSER_FILE@"), "--help"])
    print("\nThe options of the LLVM 'instrumenter' tool:")
    _execute([ os.path.join(self_dir, "tools", "@INSTRUMENTER_FILE@"), "--help"])
    print("\nThe options of the 'fuzzer' tool:")
    _execute([ os.path.join(self_dir, "tools", "@FUZZER_FILE@"), "--help"])

    print("\n!!! WARNING !!!!")
    print("An analyzed program is currently *NOT* executed in an isolated environment. It is thus")
    print("*NOT* advised to use it on a C program accessing disk or any other external resource")
    print("(unless you provided the isolation, e.g. by running the analysis in a Docker container).")


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

        if arg == "--silent_mode":
            silent_mode = True
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
        else:
            options.append(arg)
        i += 1

    if clear_output_dir is True and os.path.isdir(output_dir):
        shutil.rmtree(output_dir)
    os.makedirs(output_dir, exist_ok=True)

    old_cwd = os.getcwd()
    os.chdir(output_dir)
    try:
        if input_file is None:
            raise Exception("Cannot find the input file. Check the option --input_file.")
        if silent_mode is False: print("### starting fizzer's pipeline ###\n{", flush=True)
        if skip_building is False:
            build(self_dir, input_file, output_dir, options_instument, use_m32, "testcomp" in options, generate_jsonc, silent_mode)
            adjust_timeouts(options, start_time, silent_mode)
        if skip_fuzzing is False:
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
