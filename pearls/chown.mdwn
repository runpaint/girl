Changes the owner and/or group of files.

* `chown user file` - Makes `user` the owner of `file`. Note: this can only be
ran as root or as `sudo chown user file`. In all cases `user` can be a username
or a user ID.
 * `chown user: file` - Makes `user` the owner of `file` and changes its group
to `user`'s login group. The caveat about root/sudo applies here, too.
* `chown user:group file` - Makes `user` the owner and `group` the group of
`file`. The above note on root/sudo applies here unless the `user` is the
username of the person running the command and he already owns `file`. However,
in this case he could just as well use `chgrp` instead. In all cases `group` can
be a group name or a group ID.
* `chown :group file` - Changes the group of `file` to `group`; serves the same
purpose as `chgrp group file`.
* `chown -R user:group .` - Changes the group to `group` and user to `user` of files in the current
directory, and any of its subdirectories, in a recursive fashion. (Long
option: `--recursive`). The following operations augment `-R`. Only the last
one specified takes effect. Note `group:user` can be replaced with any of the
syntaxes explained above, e.g. `chown -R user: dir/`.
 * `-H` - If a command line argument is a symlink, traverse it. i.e. if `dir`
is a symlink pointing to `glark/` `chown -HR user:group dir` acts recursively on
`glark/`.
 * `-L` - Traverse every symlink to a directory encountered. i.e `chown -LR
user:group dir/` acts recursively on `dir/`, and if it finds a symlink to a
directory, follows it, and continues to act recursively on its contents.
 * `-P` - Do not traverse any symlinks. (This is the default behaviour).
Unlike the example above, when `chown` encounters a symlink it does not follow
it.
* `chown --reference=file1 file2` - Changes the user and group of `file2` to
that of `file1`.
* `chown --v user:group file` - Displays diagnostics for each file processed.
For example, "ownership of 'report.txt' retained as julia:students" (if `chgrp
--v students report.txt` was called despite `report.txt` already being in the
`students` group and being owned by julia), or "changed ownership of
'report.txt' to steven:staff". (Long option: `--verbose`).
* `chown --c user:group file` - As above, but reports only if the group was
changed. (Long option: `--changes`).
* `chown -h user:group file` - Change the user/group of the symlink; not its
target. If `file` was a symlink pointing to `glark`, `file` would have its
user/group changed to `user:group`; `glark` would be unchanged. (Long option:
`--no-dereference`).
 * `chown --dereference user:group file` - Change the user/group of each
symlink's target; not the symlink itself. This is the default. In the example
above, `glark` would have its user/group changed to `user:group`; `file`'s
user/group would be unchanged.
* `chown --preserve-root user:group file` - Refuse to operate recursively on the
root of the file system ("/"). This is a useful safety net to guard against
messing up an entire system's file permissions by a fat-fingered root user.
 * `chown --no-preserve-root user:group file` - The default, and the opposite of
the above. "/" is not treated specially.
* `chown -f user:group file` - Suppress most error messages. (Long option:
`--silent`, `--quiet`).
