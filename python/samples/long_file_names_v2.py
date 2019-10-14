#!/usr/bin/env python3

import argparse
import collections
import pathlib  # available since Python 3.4 (else install it using pip/pipenv/…)
import sys

# Parse command line arguments
parser = argparse.ArgumentParser(
    prog="long-file-names",
    description="For files having same size, print the file names longer than the shortest one.",
)
parser.add_argument("--version", action="version", version="%(prog)s v2")
parser.add_argument("file_or_directory", type=str, nargs="+")
args = parser.parse_args()

# Collect regular files
regular_file_paths = set()
for pathname in args.file_or_directory:
    path = pathlib.Path(pathname)
    if path.is_file():
        regular_file_paths.add(path)
    elif path.is_dir():
        for sub_path in path.glob("**/*"):
            if sub_path.is_file():
                regular_file_paths.add(sub_path)

# Sort files by file size
sorted_file_paths = collections.defaultdict(set)
min_name_lengths = collections.defaultdict(lambda: int(sys.maxsize))
for path in regular_file_paths:
    sorted_file_paths[path.stat().st_size].add(path)
    previous_min_length = min_name_lengths[path.stat().st_size]
    if len(path.name) < previous_min_length:
        min_name_lengths[path.stat().st_size] = len(path.name)

# For same content size, print all file paths except the one having the shortest file name
for file_size, file_paths in sorted_file_paths.items():
    min_filename_length = min_name_lengths[file_size]
    for path in file_paths:
        if len(path.name) > min_filename_length:
            print(path)
