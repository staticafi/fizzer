import os
import sys
import json
import shutil
import platform
import argparse
from typing import Optional
import subprocess


def ASSUMPTION(cond, msg="Unknown."):
    if not cond:
        raise Exception(msg)


def quote(path : str) -> str:
    return '"' + path + '"'


class Benchmark:
    def __init__(self, pathname : str, output_dir : str, runner_script : str, verbose : bool) -> None:
        self.runner_script = runner_script
        self.verbose = verbose

        self.python_binary = sys.executable

        self.src_file = pathname
        self.fname = os.path.basename(pathname)
        self.name = os.path.splitext(self.fname)[0]
        self.output_dir = output_dir
        self.config_file = os.path.splitext(self.src_file)[0] + ".json"
        with open(self.config_file, "rb") as fp:
            self.config = json.load(fp)
        ASSUMPTION(all(x in self.config for x in ["args", "results"]), "Cannot find 'args' or 'results' in the benchmark's JSON file.")
        ASSUMPTION(all(x in self.config["args"] for x in [
            "max_executions",
            "max_seconds",
            "max_trace_length",
            "max_bytes",
            "max_exec_milliseconds",
            "max_exec_megabytes",
            "opt_max_seconds",
            "opt_max_trace_length",
            "opt_max_bytes"
            ]), "Benchmark's JSON file does not contain all required options for running the tool.")

        self.fuzz_target_file = os.path.join(self.output_dir, "source_target")

        self.dir_stack = []

    def pushd(self, folder : str) -> None:
        self.dir_stack.append(os.getcwd())
        os.chdir(folder)

    def popd(self) -> str:
        ASSUMPTION(len(self.dir_stack) > 0, "Cannot pop from the empty stack of directories.")
        os.chdir(self.dir_stack[-1])
        del self.dir_stack[-1]

    def log(self, message : str, brief_message: str = None) -> None:
        if self.verbose:
            print(">>> " + message)
            sys.stdout.flush()
        elif brief_message is not None:
            print(brief_message, end="")
            sys.stdout.flush()

    def _erase_file_if_exists(self, pathname : str) -> None:
        if os.path.exists(pathname):
            self.log("remove " + pathname)
            os.remove(pathname)

    def _erase_dir_if_exists(self, pathname : str) -> None:
        if os.path.exists(pathname):
            self.log("rmtree " + pathname)
            shutil.rmtree(pathname)

    def _execute(self, cmdline : str, output_dir : str) -> None:
        self.pushd(output_dir)
        cmd = [x for x in cmdline if len(x) > 0]
        self.log(" ".join(cmd))
        subprocess.run(cmd)
        self.popd()

    def _execute_and_check_output(self, cmdline : str, desired_output : str, work_dir : str = None) -> None:
        self._execute(cmdline, os.path.dirname(desired_output) if work_dir is None else work_dir)
        ASSUMPTION(os.path.isfile(desired_output), "_execute_and_check_output(): the output is missing: " + desired_output)

    @staticmethod
    def _add_error_message(text: str, errors: list, properties: list):
        errors.append(("In " + "/".join(properties) + ": " if len(properties) > 0 else "") + text)

    @staticmethod
    def _epsilon_for_property(properties: list, expected: int|float):
        if len(properties) == 0: return None
        if properties[-1] == "num_executions": return 5.0 if expected >= 100 else 50.0 
        return None

    @staticmethod
    def _check_outcomes(obtained, expected, errors: list, properties = []) -> bool:
        if type(expected) is dict:
            if type(obtained) is not dict:
                Benchmark._add_error_message("Mismatch in JSON structure. Expected dictionary.", errors, properties)
                return False
            if len(obtained) > len(expected) and "output_statistics" in properties:
                Benchmark._add_error_message("Too many keys in obtained dictionary. "
                                             "Obtained: " + str(len(obtained)) + ", Expected: " + str(len(expected)), errors, properties)
            result = True
            for key in expected:
                if key not in obtained:
                    Benchmark._add_error_message("Missing property: " + key, errors, properties)
                    return False
                r = Benchmark._check_outcomes(obtained[key], expected[key], errors, properties + [key])
                result = result and r
            return result
        elif type(expected) is list:
            if type(obtained) is not list:
                Benchmark._add_error_message("Mismatch in JSON structure. Expected list.", errors, properties)
                return False
            if len(obtained) != len(expected):
                Benchmark._add_error_message("Different list size.", errors, properties)
                return False
            result = True
            for i in range(min(len(obtained), len(expected))):
                r = Benchmark._check_outcomes(obtained[i], expected[i], errors, properties)
                result = result and r
            return result
        elif type(expected) in [int, float]:
            if type(obtained) not in [int, float]:
                Benchmark._add_error_message("Mismatch in JSON structure. Expected int or float.", errors, properties)
                return False
            epsilon = Benchmark._epsilon_for_property(properties, expected)
            if epsilon is None:
                if obtained != expected:
                    Benchmark._add_error_message("Expected " + str(expected) + ", obtained " + str(obtained), errors, properties)
                    return False
            else:
                percentage = (100.0 * obtained) / expected if expected > 0 else 100.0 * obtained + 100.0
                error = percentage - 100.0
                if abs(error) > epsilon:
                    Benchmark._add_error_message("Expected " + str(expected) + ", obtained " + str(obtained) + " [error: " + ("%.2f" % error) + "%]", errors, properties)
                    return False
            return True
        elif type(expected) is str:
            if type(obtained) is not str:
                Benchmark._add_error_message("Mismatch in JSON structure. Expected string.", errors, properties)
                return False
            if obtained != expected:
                Benchmark._add_error_message("Expected " + expected + ", obtained " + obtained, errors, properties)
                return False
            return True
        else:
            Benchmark._add_error_message("Unexpected JSON content [type: " + str(type(expected)) + "].", errors, properties)
            return False

    def build(self) -> None:
        self.log("===")
        self.log("=== Building: " + self.src_file, "building: " + os.path.relpath(self.src_file, os.path.dirname(__file__)) + " ... ")
        self.log("===")

        self.log("makedirs " + self.output_dir)
        os.makedirs(self.output_dir, exist_ok=True)

        self._execute_and_check_output(
            [
                self.python_binary,
                self.runner_script,
                "--skip_fuzzing",
                "--input_file", self.src_file,
                "--output_dir",  self.output_dir,
                "--silent_mode",
                "--save_mapping"
            ] + (["--m32"] if "m32" in self.config["args"] and self.config["args"]["m32"] is True else []),
            self.fuzz_target_file,
            self.output_dir
            )

        self.log("Done", "Done\n")

    def fuzz(self) -> bool:
        self.log("===")
        self.log("=== Fuzzing: " + self.src_file, "fuzzing: " + os.path.relpath(self.src_file, os.path.dirname(__file__)) + " ... ")
        self.log("===")
        if "/pending/" in self.output_dir:
            self.log("The outcomes are IGNORED => the test has PASSED.", "ignored\n")
            return True

        self.log("makedirs " + self.output_dir)
        os.makedirs(self.output_dir, exist_ok=True)
        self._execute(
            [
                self.python_binary,
                self.runner_script,
                "--skip_building",
                "--input_file", os.path.join(self.output_dir, "source.c"),
                "--output_dir", self.output_dir,
                "--max_executions", str(self.config["args"]["max_executions"]),
                "--max_seconds", str(self.config["args"]["max_seconds"]),
                "--max_trace_length", str(self.config["args"]["max_trace_length"]),
                "--max_bytes", str(self.config["args"]["max_bytes"]),
                "--max_exec_milliseconds", str(self.config["args"]["max_exec_milliseconds"]),
                "--max_exec_megabytes", str(self.config["args"]["max_exec_megabytes"]),
                "--opt_max_seconds", str(self.config["args"]["opt_max_seconds"]),
                "--opt_max_trace_length", str(self.config["args"]["opt_max_trace_length"]),
                "--opt_max_bytes", str(self.config["args"]["opt_max_bytes"]),
                "--test_type", "native",
                ("--silent_mode" if self.verbose is False else "")
            ],
            self.output_dir
            )

        errors = []
        try:
            outcomes_pathname = os.path.join(self.output_dir, "source_outcomes.json")
            with open(outcomes_pathname, "rb") as fp:
                outcomes = json.load(fp)
            if self._check_outcomes(outcomes, self.config["results"], errors) is True:
                ASSUMPTION(len(errors) == 0)
                self.log("The outcomes are as expected => the test has PASSED.", "ok\n")
                return True
        except Exception as e:
            self.log("FAILURE due to an EXCEPTION: " + str(e), "EXCEPTION[" + str(e) + "]\n")
            return False
        error_messages = "\n    " + "\n    ".join(errors)
        self.log("The outcomes are NOT as expected => the test has FAILED. Details:" + error_messages, "FAILED " + error_messages + "\n")
        return False

    def clear(self) -> None:
        self.log("===")
        self.log("=== Clearing: " + self.src_file, "clearing: " + os.path.relpath(self.src_file, os.path.dirname(__file__)) + " ... ")
        self.log("===")
        self._erase_dir_if_exists(self.output_dir)
        self.log("Done", "Done\n")


class Benman:
    def __init__(self) -> None:
        parser = argparse.ArgumentParser(description="Builds the target for the benchmark(s) or fuzz the benchmark(s).")
        parser.add_argument("--clear", action='store_true', help="Clears the build files and outputs of the input benchmark(s).")
        parser.add_argument("--build", action='store_true', help="Builds the input benchmark(s).")
        parser.add_argument("--fuzz", action='store_true', help="Applies fuzzing on the input benchmark(s).")
        parser.add_argument("--input", help="Benchmark(s) to be processed. Possible values: "
                                           "all, fast, medium, slow, pending, fast/..., medium/..., slow/..., pending/...")
        parser.add_argument("--output_dir", help="The root output directory.")
        parser.add_argument("--verbose", action='store_true', help="Enables the verbose mode.")
        self.args = parser.parse_args()

        self.python_binary = '"' + sys.executable + '"'
        self._benchmarks_dir = os.getcwd()
        self.benchmarks_dir = self._benchmarks_dir
        self.output_dir = os.path.normpath(os.path.join(self._benchmarks_dir, "..", "output", "benchmarks"))
        self.self_dir = os.path.dirname(__file__)
        self.runner_script = os.path.join(self.self_dir, "..", "fizzer.py")
        ASSUMPTION(os.path.isfile(self.runner_script), "The runner script not found. Build and install the project first.")

    def collect_benchmarks(self, name : str) -> list[str]:
        def complete_and_check_benchmark_path(name : str) -> str:
            pathname = os.path.join(self.benchmarks_dir, name)
            ASSUMPTION(os.path.isfile(pathname), "The benchmark path is invalid: " + pathname)
            ASSUMPTION(os.path.isfile(os.path.splitext(pathname)[0] + ".json"), "Missing '.json' file for benchmark: " + pathname)
            return pathname

        def search_for_benchmarks(folder : str) -> list:
            benchmarks = []
            pathname = os.path.join(self.benchmarks_dir, folder)
            if os.path.isdir(pathname):
                for name in os.listdir(pathname):
                    if os.path.splitext(name)[1].lower() in [".c", ".i"]:
                        try:
                            benchmarks.append(complete_and_check_benchmark_path(os.path.join(folder, name)))
                        except Exception:
                            pass
            return benchmarks

        kinds = ["fast", "medium", "slow", "pending"]
        benchmarks = []
        if name == "all":
            for kind in kinds:
                benchmarks += search_for_benchmarks(kind)
        elif name in kinds:
            benchmarks += search_for_benchmarks(name)
        else:
            benchmarks.append(complete_and_check_benchmark_path(name))
        return sorted(benchmarks)

    def compute_benchmark_output_dir(self, pathname: str):
        return os.path.splitext(os.path.join(self.output_dir, os.path.relpath(pathname, self.self_dir)))[0]

    def build(self) -> bool:
        for pathname in self.collect_benchmarks(self.args.input):
            benchmark = Benchmark(pathname, self.compute_benchmark_output_dir(pathname), self.runner_script, self.args.verbose)
            benchmark.build()
        return True

    def fuzz(self) -> bool:
        num_failures = 0
        benchmark_paths = self.collect_benchmarks(self.args.input)
        for pathname in benchmark_paths:
            benchmark = Benchmark(pathname, self.compute_benchmark_output_dir(pathname), self.runner_script, self.args.verbose)
            if not benchmark.fuzz():
                num_failures += 1
        if num_failures > 0:
            print("FAILURE[" + str(num_failures) + "/" + str(len(benchmark_paths)) + "]")
            return False
        else:
            print("SUCCESS")
            return True

    def clear(self) -> None:
        for pathname in self.collect_benchmarks(self.args.input):
            benchmark = Benchmark(pathname, self.compute_benchmark_output_dir(pathname), self.runner_script, self.args.verbose)
            benchmark.clear()
        return True

    def run(self) -> bool:
        if self.args.clear:
            if self.clear() is False:
                return False
        if self.args.build:
            if self.build() is False:
                return False
        if self.args.fuzz:
            if self.fuzz() is False:
                return False
        return True

if __name__ == '__main__':
    exit_code = 0
    try:
        benman = Benman()
        if benman.run() is False:
            exit_code = 1
    except Exception as e:
        exit_code = 1
        print("ERROR: " + str(e))
    exit(exit_code)
