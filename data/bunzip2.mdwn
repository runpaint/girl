Uncompress files compressed with `bzip2`, e.g. 'logs.bz'.

* `bunzip2 file.bz` - Uncompresses `file.bz` to `file`, then deletes
`file.bz2`. Fails if `file` already exists.
* `bunzip2 -f file.bz` - As above, but overwites file if it exists.
* Name of decompressed file:
 * `file.bz2?` => `file`
 * `file.tbz2?` => `file.tar`.
 * `file` => `file.out` (i.e. anything else just gets '.out' appended).
* `bunzip2 -k file.bz2` - Uncompresses `file.bz2` without deleting it.
* `bunzip2 <file.bz2` - Decompresses STDIN to STDOUT when no filenames
supplied.
* `bunzip2 -c file.bz` - `-c` flag forces decompression to STDOUT. If multiple
filenames are supplied their outputs are concatenated.
* `bunzip2 *.bz2` - Uncompresses all .bz2 files in the current directory.
* `bunzip2` checks file's CRC on decompression and complains if it looks
corrupted. Try to fix such files with `bzip2recover`. 
*  `-s`, `--small` - Reduces memory usage at the expense of speed.
* `-q`, `--quiet` - Suppresses non-essential warnings.
* `-v`, `--verbose` - Shows the compression level for each file processed.
Further `-v`s increase diagnostic output.
* `-L`, `--license`, `-V`, `--version` - Displays software license, terms, and
conditions.
