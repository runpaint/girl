Deletes empty directories.

* `rmdir dir/` - Deletes `dir/` if it is empty; to delete non-empty
directories use `rm -rf dir/`, instead.
* `rmdir -p dir/` - Deletes `dir/` if it is non-empty, as well as any other
non-empty directories it contains, in a recursive fashion. This is similar in
operation to `rm -r`, only it never deletes files, or directories that contain
files.
