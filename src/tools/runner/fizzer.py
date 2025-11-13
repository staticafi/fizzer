#!/usr/bin/env python3
import subprocess
import sys
import os
import time
import shutil
import re
from datetime import datetime


FIZZER_MODEL_PREFIX = "__fizzer_model__"
FIZZER_METHOD_UNDER_TEST = "__fizzer_method_under_test__"
FIZZER_ENTRY_FUNCTION = "__fizzer_private_entry_function"

class AstFnInfo:
    def __init__(self) -> None:
        self.name = None
        self.offset = None
        self.used = False
        self.type = None

    def reset(self):
        self.name = None
        self.offset = None
        self.used = False
        self.type = None

    def parse_str(line, pre, post):
        return line[line.index(pre) + len(pre): line.rindex(post)] if pre in line else None

    def parse_int(line, pre, post):
        try:
            return int(AstFnInfo.parse_str(line, pre, post)) if pre in line else None
        except Exception as e:
            print(str(e))
            return None

    def try_parse_name(self, line: str):
        if self.name is None:
            self.name = AstFnInfo.parse_str(line, '"name": "', '",')

    def try_parse_offset(self, line: str):
        if self.offset is None:
            self.offset = AstFnInfo.parse_int(line, '"offset": ', ',')

    def try_parse_usage(self, line: str):
        if '"isUsed": true,' in line:
            self.used = True

    def try_parse_type(self, line: str):
        if self.type is None:
            self.type = AstFnInfo.parse_str(line, '"qualType": "', '"')

    def valid(self):
        return self.name is not None and self.used and self.offset is not None

    def valid_main(self):
        return self.name == "main" and self.offset is not None and self.type is not None

    def try_save(self, result: dict[str, set[int]]):
        if self.valid():
            if self.name in result:
                result[self.name].add(self.offset)
            else:
                result[self.name] = {self.offset}


def process_ast(ast_file, used_external_functions: dict[str, set[int]]) -> AstFnInfo:
    in_fn = False
    fn_info = AstFnInfo()
    main_info = AstFnInfo()
    for i, line in enumerate(ast_file):
        if '"kind": "FunctionDecl",' in line:
            fn_info.try_save(used_external_functions)
            fn_info.reset()
            in_fn = True
            continue
        if '"kind": "CompoundStmt",' in line:
            in_fn = False
            if not main_info.valid_main() and fn_info.valid_main():
                main_info = fn_info
                fn_info = AstFnInfo()
            else:
                fn_info.reset()
            continue
        if in_fn is False:
            continue
        if '"id": "0x' in line:
            in_fn = False
            continue
        fn_info.try_parse_name(line)
        fn_info.try_parse_offset(line)
        fn_info.try_parse_usage(line)
        fn_info.try_parse_type(line)
    fn_info.try_save(used_external_functions)
    return main_info


def obtain_model_files(root_folder) -> dict[str, str]:
    file_dict: dict[str, str] = {}
    for dirpath, _, filenames in os.walk(root_folder):
        for filename in filenames:
            name, ext = os.path.splitext(filename)
            if ext == ".h":
                file_dict[name] = os.path.abspath(os.path.join(dirpath, name))
    return file_dict


def save_model_declarations(out_file, functions_to_save, model_files) -> set[str]:
    pattern = f'\\b({FIZZER_MODEL_PREFIX}[A-Za-z0-9_]*)\\b' # Regular expression to match identifiers starting with FIZZER_MODEL_PREFIX
    work_list = list(functions_to_save)
    done = set()
    while len(work_list) > 0:
        name = work_list.pop()
        if name in done:
            continue
        done.add(name)

        with open(model_files[name] + ".h", "r", encoding="utf-8") as in_file:
            content = in_file.read()
        out_file.write(content)

        for match in re.findall(pattern, content):
            work_list.append(match[len(FIZZER_MODEL_PREFIX):])
    return done


def save_model_definitions(out_file, models_to_save, model_files):
    for name in models_to_save:
        with open(model_files[name] + ".c", "r", encoding="utf-8") as in_file:
            content = in_file.read()
        out_file.write(content)


def save_main(out_file, data_root_dir: str, main_type: str, for_testcomp):
    fn_type = main_type.strip().replace(" ", "")
    file_names = []
    if fn_type == "void(void)" or fn_type == "void()":
        file_names.append("void_void.c")
    elif fn_type == "int(int,char**)":
        if for_testcomp:
            file_names.append("int_args_testcomp.c")
        else:
            file_names.append("cmdline_model.c")
            file_names.append("int_args.c")
    elif fn_type == "int(void)" or fn_type == "int()":
        file_names.append("int_void.c")
    elif fn_type == "void(int,char**)":
        if for_testcomp:
            file_names.append("void_args_testcomp.c")
        else:
            file_names.append("cmdline_model.c")
            file_names.append("void_args.c")
    else:
        raise Exception("Unknown format of the main function.")
    for name in file_names:
        with open(os.path.join(data_root_dir, "main_versions", name), encoding="utf-8") as in_file:
            out_file.write(in_file.read())


def _execute(command_and_args, timeout_ = None, stdout_=None, stderr_=None):
    cmd = [x for x in command_and_args if len(x) > 0]
    # print("*** CALLING ***\n" + " ".join(cmd) + "\n************\n")
    return subprocess.run(cmd, timeout=timeout_, stdout=stdout_, stderr=stderr_)


def preprocess(self_dir, original_file, output_dir, testcomp, silent_mode):
    if silent_mode is False: print("\"preparation\": {", flush=True)

    if silent_mode is False: print("    \"preprocessing\": ", end='', flush=True)
    t0 = time.time()

    preprocessed_file = os.path.join(output_dir, "preprocessed.c")
    _execute(["clang", "-E", "-P", original_file, "-o", preprocessed_file])

    t1 = time.time()
    if silent_mode is False: print("%.2f," % (t1 - t0), flush=True)

    if silent_mode is False: print("    \"ast_build\": ", end='', flush=True)
    t0 = time.time()

    ast_json = os.path.join(output_dir, "ast.json")
    with open(ast_json, "w") as f:
        _execute(
            [
                "clang",
                "-Wno-everything",
                "-fbracket-depth=1024",
                "-Xclang",
                "-ast-dump=json",
                "-fsyntax-only",
                preprocessed_file
            ],
            stdout_=f,
            stderr_=subprocess.DEVNULL,
        )

    t1 = time.time()
    if silent_mode is False: print("%.2f," % (t1 - t0), flush=True)

    if silent_mode is False: print("    \"ast_scan\": ", end='', flush=True)
    t0 = time.time()

    used_external_functions: dict[str, set[int]] = {}
    with open(ast_json, "r", encoding="utf-8") as f:
        main_info = process_ast(f, used_external_functions)

    model_files = obtain_model_files(os.path.join(self_dir, "data", "models", "c"))
    for name in list(used_external_functions.keys()):
        if name not in model_files:
            del used_external_functions[name]

    t1 = time.time()
    if silent_mode is False: print("%.2f," % (t1 - t0), flush=True)

    if silent_mode is False: print("    \"source_composition\": ", end='', flush=True)
    t0 = time.time()

    source_file = os.path.join(output_dir, "source.c")
    with open(source_file, "w", encoding="utf-8") as out_file:
        model_declaration = save_model_declarations(out_file, used_external_functions.keys(), model_files)

        with open(preprocessed_file, "r", encoding="utf-8") as in_file:
            content = in_file.read()

        splitters = list((name, idx) for name, indices in used_external_functions.items() for idx in indices)
        if main_info.valid_main():
            splitters.append((main_info.name, main_info.offset))
        splitters.append(("", len(content)))
        splitters.sort(key=lambda x: x[1])

        start_idx = 0
        for name, end_idx in splitters:
            text = content[start_idx:end_idx]
            for fn_name in used_external_functions.keys():
                text = re.sub(f'\\b{fn_name}\\b', FIZZER_MODEL_PREFIX + fn_name, text)
            out_file.write(text)
            out_file.write(FIZZER_METHOD_UNDER_TEST if name == main_info.name else name)
            start_idx = end_idx + len(name)

        save_model_definitions(out_file, model_declaration, model_files)
        if main_info.valid_main():
            save_main(out_file, os.path.join(self_dir, "data"), main_info.type, testcomp is not None)

    t1 = time.time()
    if silent_mode is False: print("%.2f," % (t1 - t0), flush=True)

    if silent_mode is False: print("},", flush=True)

    return source_file


def  benchmark_file_name(input_file):
    return os.path.basename(input_file)


def  benchmark_name(input_file):
    return os.path.splitext(benchmark_file_name(input_file))[0]


def  benchmark_ll_name(input_file):
    return benchmark_name(input_file) + ".ll"


def  benchmark_instrumented_ll_name(input_file):
    return benchmark_name(input_file) + "_instrumented.ll"


def  benchmark_target_name(input_file):
    return benchmark_name(input_file) + "_target"


def  benchmark_sala_name(input_file):
    return benchmark_name(input_file) + "_sala" + ".json"


def build(self_dir, input_file, output_dir, options, use_m32, generate_jsonc, silent_mode):
    ll_file = os.path.join(output_dir, benchmark_ll_name(input_file))

    if silent_mode is False: print("\"build_times\": {", flush=True)
    if silent_mode is False: print("    \"Compiling[C->LLVM]\": ", end='', flush=True)
    t0 = time.time()
    if _execute(
            [ "clang" ] +
                (["-m32"] if use_m32 is True else []) +
                [ "-O0", "-g", "-S", "-emit-llvm", "-Wno-everything", "-fbracket-depth=1024", input_file, "-o", ll_file]
            ).returncode:
        raise Exception("Compilation[C->LLVM] has failed: " + input_file)
    t1 = time.time()
    if silent_mode is False: print("%.2f," % (t1 - t0), flush=True)

    instrumented_ll_file = os.path.join(output_dir, benchmark_instrumented_ll_name(input_file))
    if silent_mode is False: print("    \"Instrumenting\": ", end='', flush=True)
    t0 = time.time()
    if _execute(
            [ os.path.join(self_dir, "tools", "@INSTRUMENTER_FILE@") ] +
                options +
                ["--input", ll_file, "--output", instrumented_ll_file]
            ).returncode:
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
                "--entry", FIZZER_ENTRY_FUNCTION
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
            original_file = os.path.join(output_dir, "original.c")
            shutil.copy(input_file, original_file)
            input_file = preprocess(self_dir, original_file, output_dir, "testcomp" in options, silent_mode)
            build(self_dir, input_file, output_dir, options_instument, use_m32, generate_jsonc, silent_mode)
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
