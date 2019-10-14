#!/usr/bin/env python3

import argparse
import collections
import sys

# Parse command line arguments
parser = argparse.ArgumentParser(
    prog="long-file-names",
    description="For files having same size, print the file names longer than the shortest one.",
)
parser.add_argument("--version", action="version", version="%(prog)s v1")
parser.add_argument("file", type=argparse.FileType("a"), nargs="+")
args = parser.parse_args()

# Sort file-names by file size
sorted_filenames = collections.defaultdict(set)
min_name_lengths = collections.defaultdict(lambda: int(sys.maxsize))
for file in args.file:
    sorted_filenames[file.tell()].add(file.name)
    previous_min_length = min_name_lengths[file.tell()]
    if len(file.name) < previous_min_length:
        min_name_lengths[file.tell()] = len(file.name)

# For same content size, print file-names except shortest ones
for file_size, names in sorted_filenames.items():
    min_filename_length = min_name_lengths[file_size]
    for n in names:
        if len(n) > min_filename_length:
            print(n)
