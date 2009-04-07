Decompress files compressed with the bizp2 algorithm to STDOUT.

* `bzcat *.bz2` - Decompresses each .bz2 file in the current directory to
STDOUT.
* `bzcat <file.bz2` - As above, but reads compressed file from STDIN.
* To decompress files so that the output is stored in a new file, use `bunzip2`. 
*  `-s`, `--small` - Reduces memory usage at the expense of speed, when
decompressing, and compression ratio, when compressing.
* `-q`, `--quiet` - Suppresses non-essential warnings.
* `-v`, `--verbose` - Shows the compression level for each file processed.
Further `-v`s increase diagnostic output.
* `-L`, `--license`, `-V`, `--version` - Displays software license, terms, and
conditions.
