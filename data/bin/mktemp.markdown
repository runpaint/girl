Creates a temporary file/directory with a unique filename and safe
permissions.

* `mktemp` - Generates a unique filename, creates a file with that name in
`/tmp`, accessible only by the owner, then returns the filename.
* `mktemp -d` - As above, but creates a directory instead of a file.
* `mktemp -p dir` - As `mktemp`, but the file is created in `dir`. If the
environment variable TMPDIR is set, the file will be created there, instead. 
* `mktemp tmp.XX` - `tmp.XX` is a filename template. The Xs will be replaced
with numbers or random data in order to generate a unique filename. The more
Xs supplied, the more combinations will be tried. There is a default template,
so there's not much need to supply your own.
* `mktemp -q` - As `mktemp`, but if it fails, it fails quietly: printing no
error messages.
