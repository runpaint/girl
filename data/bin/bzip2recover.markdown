Compress files with the bizp2 algorithm. 

* `bzip2 file` - Compresses `file` to `file.bz2`, then deletes
`file`. Fails if `file.bz2` already exists.
* `bzip2 -f file` - As above, but overwites `file.bz2` if it exists.
* `bzip2 -k file.bz2` - Compresses `file` without deleting it.
* `bzip2 <file >file.bz2` - Decompresses STDIN to STDOUT when no filenames
supplied. Refuses to write compressed data to the terminal.
* `bzip2 -c file >file.bz2` - `-c` flag forces compression to STDOUT. If multiple
filenames are supplied their outputs are concatenated. Such a stream can only
be decompressed by bzip2 0.9.0+.
* Processes arguments in $BZIP and $BZIP2 before those supplied on the command
line; can be used for supplying default arguments.
* `bzip2 *.txt` - Compresses all .txt files in the current directory.
* Will perform compression even if compressed file is larger than original.
* Attempts to preserve original file's permissions.
* `-t`, `--test` - Tests the integrity of supplied files.
*  `-s`, `--small` - Reduces memory usage at the expense of speed, when
decompressing, and compression ratio, when compressing.
* `-q`, `--quiet` - Suppresses non-essential warnings.
* `-v`, `--verbose` - Shows the compression level for each file processed.
Further `-v`s increase diagnostic output.
* `-n` ( 9 =< n >= 0) - Uses a block size of n00k. Larger block sizes maximise
compression ratio.
* `-L`, `--license`, `-V`, `--version` - Displays software license, terms, and
conditions.
