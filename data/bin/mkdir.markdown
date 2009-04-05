Create directories.

* `mkdir dir` - Creates the directory `dir`. Neither a file nor directory
named `dir` can already exist.
* `mkdir -p foo/bar/glark` - Creates the directory 'foo', then 'foo/bar', then
'foo/bar/glark'. It is OK if any of the directories already exist. (Long
option: `--parents`).
* `mkdir -v dir1 dir2` - Creates `dir1` and `dir2`, printing a message for
each one.
* `mkdir -m mode dir` - Creates `dir` with mode `mode`, where `mode` is an
octal integer representing the permissions of `dir`. `mode` is in the same
format as the numeric argument for `chmod`. If you'd rather not work in octal,
create the directory as normal, i.e. without the `-m` option, then use `chmod`
to set the permissions with a symbolic mode. (Long option: `--mode`).
* `mkdir -Z c dir` - Create `dir` with the SELinux security context `c`. (Long
option: `--context`).
