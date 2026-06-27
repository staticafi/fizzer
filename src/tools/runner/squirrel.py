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
    return benchmark_name(input_file) + ".c"


def  benchmark_ll_name(input_file):
    return benchmark_name(input_file) + ".ll"


def  benchmark_composed_ll_name(input_file):
    return benchmark_name(input_file) + "_composed.ll"


def  benchmark_sala_name(input_file):
    return benchmark_name(input_file) + "_sala" + ".json"


def build(self_dir, input_file, output_dir, use_m32, options, generate_jsonc):
    ll_file = os.path.join(output_dir, benchmark_ll_name(input_file))

    print("\"build_times\": {", flush=True)
    print("    \"Compiling[C->LLVM]\": ", end='', flush=True)
    t0 = time.time()
    benchmark_file = os.path.join(output_dir, benchmark_c_name(input_file))
    if input_file != benchmark_file:
        shutil.copyfile(input_file, benchmark_file)
    if _execute(
            [ "clang" ] +
                (["-m32"] if use_m32 is True else []) +
                [ "-O0", "-g", "-S", "-emit-llvm", "-Wno-everything", "-fbracket-depth=1024", benchmark_file, "-o", ll_file]
            ).returncode:
        raise Exception("Compilation[C->LLVM] has failed: " + input_file)
    t1 = time.time()
    print("%.2f," % (t1 - t0), flush=True)

    composed_ll_file = os.path.join(output_dir, benchmark_composed_ll_name(input_file))
    print("    \"Composing\": ", end='', flush=True)
    t0 = time.time()
    if _execute(
            [ os.path.join(self_dir, "tools", "@COMPOSER_FILE@") ] +
                ["--data", os.path.join(self_dir, "data"), "--input", ll_file, "--output", composed_ll_file]
            ).returncode:
        raise Exception("Composition of the analyzed .ll file has failed: " + ll_file)
    t1 = time.time()
    print("%.2f," % (t1 - t0), flush=True)

    print("    \"Compiling[LLVM->sala]\": ", end='', flush=True)
    t0 = time.time()
    if _execute(
            [ os.path.join(self_dir, "tools", "salac", "salac.py") ] +
                (["--jsonc"] if generate_jsonc is True else []) + [
                "--input", composed_ll_file,
                "--output", output_dir,
                "--rename", os.path.splitext(benchmark_sala_name(input_file))[0],
                "--entry", "__fizzer_private_entry_function"
                ]
            ).returncode:
        print("},", flush=True)
        return 
    t1 = time.time()
    print("%.2f" % (t1 - t0), flush=True)
    print("},", flush=True)


def adjust_timeouts(options, start_time):
    time_taken = time.time() - start_time
    if time_taken < 0.1:
        return

    def find_option_value_and_index(option):
        for idx, opt in enumerate(options):
            if opt == option:
                idx += 1
                try: return int(options[idx]), idx
                except: pass
        return None, None
    
    print("\"adjusting_timeout\": {", flush=True)
    print("    \"time_already_taken\": %.2f," % time_taken, flush=True)

    value, idx = find_option_value_and_index("--timeout")
    if value is not None:
        if value > time_taken:
            percentage = 1.0 - time_taken / value
        else:
            percentage = 0.0
        new_value = int(value * percentage)
        print("    \"timeout\": [ " + str(value) + ", " + str(new_value) + " ]", flush=True)
        options[idx] = str(new_value)

    print("},", flush=True)


def analyse(self_dir, input_file, output_dir, options):
    sala_program = os.path.join(output_dir, benchmark_sala_name(input_file))
    if not os.path.isfile(sala_program):
        sala_program = os.path.join(os.path.dirname(input_file), benchmark_sala_name(input_file))
        if not os.path.isfile(sala_program):
            raise Exception("Cannot find the target sala program: " + sala_program)

    print("\"analysis\": {", flush=True)

    if _execute(
            [ os.path.join(self_dir, "tools", "@SQUIRREL_FILE@"),
                "--sala", sala_program,
                "--out", output_dir
                ] +
                options
            ).returncode:
        raise Exception("Analysis has failed.")

    print("},", flush=True)


def help(self_dir):
    print("squirrel usage")
    print("==============")
    print("help                 Prints this help message.")
    print("input_file <PATH>    A source C file to build and analyze.")
    print("output_dir <PATH>    A directory under which all results will be saved.")
    print("                     If not specified, then the current directory is used.")
    print("m32                  When specified, the source C file will be compiled for")
    print("                     32-bit machine (cpu). Otherwise, 64-bit machine is assumed.")
    print("jsonc                When specified, Sala program with comments will be")
    print("                     generated together with the standard one.")
    print("\nNext follows a listing of options of tools called from this script. When they are")
    print("passed to the script they will automatically be propagated to the corresponding tool.")

    print("\nThe options of the 'composer' tool:")
    _execute([ os.path.join(self_dir, "tools", "@COMPOSER_FILE@"), "--help"])
    print("\nThe options of the 'squirrel' tool:")
    _execute([ os.path.join(self_dir, "tools", "@SQUIRREL_FILE@"), "--help"])


def main():
    start_time = time.time()
    self_dir = os.path.normpath(os.path.abspath(os.path.dirname(__file__)))
    old_cwd = os.path.abspath(os.getcwd())
    input_file = None
    output_dir = old_cwd
    use_m32 = False
    generate_jsonc = False
    options = []
    i = 1
    while (i < len(sys.argv)):
        arg = sys.argv[i]
        if arg == "--help":
            help(self_dir)
            return

        if arg == "--input_file" and i+1 < len(sys.argv) and os.path.isfile(sys.argv[i+1]):
            input_file = os.path.normpath(os.path.abspath(sys.argv[i+1]))
            i += 1
        elif arg == "--output_dir" and i+1 < len(sys.argv) and not os.path.isfile(sys.argv[i+1]):
            output_dir = os.path.normpath(os.path.abspath(sys.argv[i+1]))
            os.makedirs(output_dir, exist_ok=True)
            i += 1
        elif arg == "--m32":
            use_m32 = True
        elif arg == "--jsonc":
            generate_jsonc = True
        else:
            options.append(arg)
        i += 1

    os.makedirs(output_dir, exist_ok=True)

    os.chdir(output_dir)
    try:
        print("{", flush=True)
        if input_file is None:
            raise Exception("Cannot find the input file. Check the option --input_file.")
        build(self_dir, input_file, output_dir, use_m32, options, generate_jsonc)
        adjust_timeouts(options, start_time)
        analyse(self_dir, input_file, output_dir, options)
    except Exception as e:
        os.chdir(old_cwd)
        print("\"error_message\": \"" + str(e) + "\"", flush=True)
        print("\"exit_code\": 1,", flush=True)
        raise e
    finally:
        print("\"total_time\": %.2f" % (time.time() - start_time), flush=True)
        print("}", flush=True)


if __name__ == "__main__":
    exit_code = 0
    try:
        main()
    except Exception as e:
        exit_code = 1
    exit(exit_code)
