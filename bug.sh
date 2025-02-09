#!/bin/bash

# This script attempts to process files in a directory, but it has a subtle error.

find . -type f -print0 | while IFS= read -r -d $'\0' file; do
  process_file "$file"
done

process_file() {
  echo "Processing: $1"
  # ... some file processing logic ...
  # The bug is that the $1 variable isn't properly quoted inside the function
  # This could lead to issues if filenames contain spaces or special characters
}

# Example usage (create a few files with spaces in names for testing)
mkdir -p testdir
touch testdir/"file with spaces.txt"
touch testdir/"another file.txt"

cd testdir
./../script.sh
cd ..
rm -rf testdir