#!/usr/bin/env python3

import argparse
import collections
import pathlib  # available since Python 3.4 (else install it using pip/pipenv/…)


def get_files_directories_from_cmd_line():
    """ Parse command line arguments and return the single argument as an iterable. """
    parser = argparse.ArgumentParser(
        prog="long-file-names",
        description="""
        Print the file names in either condition:
        (1) Longer than the shortest name of all files having same content size.
        (2) Content size is larger the smaller of all files having same name length.
        """,
    )
    parser.add_argument("--version", action="version", version="%(prog)s v3")
    parser.add_argument("file_or_directory", type=str, nargs="+")
    args = parser.parse_args()
    return args.file_or_directory


def collect_regular_files(files_or_directories):
    """ Returns regular files in all sub directories. """
    regular_files = set()
    for pathname in files_or_directories:
        path = pathlib.Path(pathname)
        if path.is_file():
            regular_files.add(path)
        elif path.is_dir():
            for sub_path in path.glob("**/*"):
                if sub_path.is_file():
                    regular_files.add(sub_path)
    return regular_files


def group_the_paths(get_value, regular_files):
    grouped_paths = collections.defaultdict(set)
    for path in regular_files:
        val = get_value(path)
        grouped_paths[val].add(path)
    return grouped_paths


def add_when_greater_than_min(get_value, grouped_paths, files_to_print):
    for paths in grouped_paths.values():
        min_val = min(map(get_value, paths))
        for file in paths:
            if get_value(file) > min_val:
                files_to_print.add(file)


def get_file_size(file):
    return file.stat().st_size


def get_name_length(file):
    return len(file.name)


def add_files_having_longer_name_for_same_size(regular_files, files_to_print):
    """ Add in {files_to_print} the files having a name longer than minimum among the ones having same size.

    1. Group by file content size.
    2. Select the files having a name length greater than minimum.
    """
    paths_by_size = group_the_paths(get_file_size, regular_files)
    add_when_greater_than_min(get_name_length, paths_by_size, files_to_print)


def add_files_having_larger_content_for_same_name_length(regular_files, files_to_print):
    """ Add in {files_to_print} the files having a size larger among the ones having same name length.

    1. Group by file name length.
    2. Select the files having a content size greater than minimum.
    """
    paths_by_name_length = group_the_paths(get_name_length, regular_files)
    add_when_greater_than_min(get_file_size, paths_by_name_length, files_to_print)


def main():
    files_or_directories = get_files_directories_from_cmd_line()
    regular_files = collect_regular_files(files_or_directories)

    files_to_print = set()
    add_files_having_longer_name_for_same_size(regular_files, files_to_print)
    add_files_having_larger_content_for_same_name_length(regular_files, files_to_print)

    for file in files_to_print:
        print(file)


if __name__ == "__main__":
    main()
