# Shell Scripting Bug: Filename Handling

This repository demonstrates a subtle bug in a shell script that can occur when processing files with spaces or special characters in their names.

The script uses `find` to locate files and then processes them in a loop. However, it improperly handles the quoting of filenames within the loop, leading to unexpected behavior.

## Bug Description

The script fails to properly quote the filename within the `process_file` function.  This is particularly problematic when filenames contain spaces or special characters, causing word splitting and/or globbing issues.  The solution involves correctly quoting the argument passed to the function.

## Reproduction Steps
1. Clone this repository.
2. Run `./bug.sh`  (make sure that `bug.sh` is executable).
3. Observe the unexpected output.  If you run it with files containing spaces you'll see that the spaces cause problems.

## Solution

The solution is demonstrated in `bugSolution.sh`, which correctly quotes the filename passed to `process_file` using double quotes.