Changes the group of files so as to allow a different set of users access.

* `chgrp group file` - Changes the group of `file` to `group`. Note: you must
be a member of `group`, or this operation will fail. The `groups` command
lists your groups.
* `chgrp -R group .` - Changes the group to `group` of files in the current
directory, and any of its subdirectories, in a recursive fashion. (Long
option: `--recursive`). The following operations augment `-R`. Only the last
one specified takes effect.

 * `-H` - If a command line argument is a symlink, traverse it. i.e. if `dir`
is a symlink pointing to `glark/` `chgrp -HR group dir` acts recursively on
`glark/`.
 * `-L` - Traverse every symlink to a directory encountered. i.e `chgrp -LR
group dir/` acts recursively on `dir/`, and if it finds a symlink to a
directory, follows it, and continues to act recursively on its contents.
 * `-P` - Do not traverse any symlinks. (This is the default behaviour).
Unlike the example above, when `chgrp` encounters a symlink it does not follow
it.
* `chgrp --reference=file1 file2` - Changes the group of `file2` to that of
`file1`.
* `chgrp --v group file` - Displays diagnostics for each file processed.
For example, "group of `report.txt' retained as students" (if `chgrp --v
students report.txt` was called despite `report.txt` already being in the
`students` group), or "changed group of 'report.txt' to staff". (Long option:
`--verbose`).
* `chgrp --c group file` - As above, but reports only if the group was
changed. (Long option: `--changes`).
* `chgrp -h group file` - Change the group of the symlink; not its target. If
`file` was a symlink pointing to `glark`, file` would have its group changed
to `group`; `glark` would be unchanged. (Long option: `--no-dereference`).
 * `chgrp --dereference group file` - Change the group of each symlink's
target; not the symlink itself. This is the default. In the example above,
`glark` would have its group changed to `group`; `file`'s group would be
unchanged.
* `chgrp --preserve-root group file` - Refuse to operate recursively on the
root of the file system ("/"). This is a useful safety net to guard against
messing up an entire system's file permissions by a fat-fingered root user.
 * `chgrp --no-preserve-root group file` - The default, and the opposite of
the above. "/" is not treated specially.
* `chgrp -f group file` - Suppress most error messages. (Long option:
`--silent`, `--quiet`).
