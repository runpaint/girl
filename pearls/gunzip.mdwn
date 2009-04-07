Uncompresses (expands) files compressed with `gzip` or `compress`.

* `gunzip file.gz` - Uncompresses `file.gz` then deletes `file.gz`.
* `gunzip -r directory/` - Recursively walks `directory/`, uncompressing
anything that it can.
* `gunzip -c file.gz` - Uncompress `file.gz` to STDOUT, leaving `file.gz`
unchanged.
 * `gunzip -c <file.gz` - As above, but reads compressed data from STDIN. This
has the side effect of keeping `file.gz` unchanged.
* `gunzip -f file.gz` - Forces the decompression of `file.gz` even if:
 * The output file already exists (normally the user is prompted to overwrite
it)
 * The file has multiple links.
 * The compressed data is read from the terminal.

