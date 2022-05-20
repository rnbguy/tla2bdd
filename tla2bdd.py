import json
import glob
import os
import argparse

INDENT = " " * 4


def generate(tla_trace_dir: str, feature_file: str):
    with open(feature_file, "w") as feature:
        feature.write("Feature: MBT trace\n")
        for itf_file in glob.glob(f"{tla_trace_dir}/counterexample[0-9]*.itf.json"):
            cex_name = os.path.basename(itf_file).split(".", maxsplit=1)[0]
            feature.write(f"{INDENT}Scenario: {cex_name}\n")
            with open(itf_file) as f:
                trace = json.load(f)
            states = []
            for e_s in trace["states"]:
                e_s.pop("#meta")
                action = e_s.pop("action")
                states.append((action, json.dumps(e_s)))
            feature.write(f"{INDENT}{INDENT}Given {states[0][0]}: {states[0][1]}\n\n")
            for i in range(1, len(states) - 1):
                feature.write(
                    f"{INDENT}{INDENT}{'When': >5} {states[i][0]}: {states[i][1]}\n"
                )
            if len(states) > 1:
                feature.write(
                    f"\n{INDENT}{INDENT}{'Then': >5} {states[-1][0]}: {states[-1][1]}\n"
                )


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("tla_trace_dir")
    parser.add_argument("feature_file")

    args = parser.parse_args()

    generate(args.tla_trace_dir, args.feature_file)


if __name__ == "__main__":
    main()
