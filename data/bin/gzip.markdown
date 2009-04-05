Compresses files using the Lempel-Ziv coding (Gzip).

* `gzip file` - Compresses `file` to `file.gz` then deletes `file`.
* `gzip -r directory/` - Recursively walks `directory/`, compressing
anything that it can.
* `gzip -c file` - Compress `file` to STDOUT, leaving `file`
unchanged. You'd normally redirect the compressed output to a file or another
process, e.g. `gzip -c file >file.gz` or `gzip -c file | someprocess`.
* `gzip -f file` - Forces the compression of `file` even if:
 * The output file already exists (normally the user is prompted to overwrite
it)
 * The file has multiple links.
 * The compressed data would be written to the terminal.

