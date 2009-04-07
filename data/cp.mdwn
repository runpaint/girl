Copies a file to a new location.

## Copying Files

* `cp file1 file2` - Makes a copy of `file1` called `file2`. For example, `cp
journal journal.bak` or `cp nabokov-essay ~/Documents/nabokov-essay`. Note:
 * If `file2` already exists it will be overwritten without warning.
 * If `file2` is a directory, `file1` will be copied into it, as described
below. A directory cannot contain a file and directory with the same name.
 * If `file2` is a period it will copy `file1` into the current directory, e.g.
`cp ~/.vimrc .` copies your `.vimrc` file into the current directory.
* `cp file1 directory/` - Makes a copy of `file1` inside `directory/`, i.e.
creates `directory/file1`. Note: 
  * The trailing slash is optional, but suggested for the reason below.
 * `directory/` must already exist. If it doesn't this command will fail with
"cp: cannot create regular file 'directory/': Is a directory". If you have
omitted the trailing slash `file1` will simply be copied to a new file called
`directory`.
* `cp *.txt directory/` - Copies all .txt files in the current directory to the
`directory/` directory. The copied files have the same filenames as the
originals, but are located in the given directory.
* "Special files", i.e. those in `/dev/`, are copied as regular files unless the
`-R` flag is given. For example, `cp /dev/null /tmp` creates a regular file
called `/tmp/null`; `sudo cp -R /dev/null /tmp` creates a special file
`/tmp/null`. [FIXME: Be more precise]

## Copying Directories

* `cp -R directory1 directory2/` - Copies `directory1/` to `directory2/`
recursively. Note:
 * If `directory2/` doesn't already exist it is created with the contents of
`directory1/`.
 * If `directory2/` does exist, and ends with a trailing slash, a copy of
`directory1/` is made a sub-directory of it. (If `directory2/` exists but isn't
given a trailing slash, e.g. `cp -R directory1/ directory2`, the contents of
`directory1` is copied into `directory2/`, overwriting existing files with the
same name.
 * The `-R` switch is essential here. Without it, trying to copy a directory
results in the confusing error message "cp: omitting directory 'directory1'".
* `cp --parents ~/.bashrc /tmp/` - Copies while preserving the original file's
parent directory structure. For user `kim`, this command would create a
`home/kim` directory in /tmp and copy `.bashrc` into there, i.e. it would create
`/tmp/home/kim/.bashrc`.

## Preventing Mistakes

* `cp -b file1 file2` - If `file2` already exists it's copied to `file2~` before
being replaced with `file1`. The `b` (for *b*ackup) flag acts as a safety net so
if you accidentally delete a file by copying another one over it, you can just
rename the backup to the original name.
 * By default the backup suffix is '~', i.e. a tilde character is appended to
the original filename to create the backup filename. You can override the suffix
used with the `-S` option, e.g. `cp -S! file1 file2` uses '!' as the suffix.
 * For more control over the backup process use the `--backup=method` syntax
where `method` can be:
  * `none`/`off` - Never make backups even if `--backup` is used.
  * `numbered`/`t` - Make numbered backups.
  * `existing` \ `nil` - Make numbered backups if they already exist, otherwise
simple backups (explained below).
  * `simple`\`never` - Make backups by appending the suffix ('~' by default) to
the original name.
 * The backup methods can also be set in the `VERSION_CONTROL` variable. For
example, `bash` users could put `export VERSION_CONTROL=numbered` in their
`~/.bashrc` file, then when they use `cp -b file1 file2` numbered backups are
made if `file2` already exists.
 * `cp -fb file file` - Makes a backup of `file` using the default method or as
directed by `VERSION_CONTROL`. This can be used to make a backup of a file,
perhaps before modifying it. The advantage over simply `cp file file~` is that
it handles the case of `file~` already existing. The advantage over `cp -b file
file~` is that it respects `VERSION_CONTROL`, which is especially useful for
making repeated numbered backups as opposed to numbering the destination
filename manually.
* `cp -i *.rb dir/` - The `-i` flag stands for 'interactive' because it prompts
the user for confirmation each time the destination file already exists. In this
example, say `dir/` contained one file, `hello-world.rb`, and the current
directory contained two files, `1-10.rb` and `hello-world.rb`. `1-10.rb` would
be copied into `dir/` as normal, but before `hello-world.rb` was copied over the
user would be prompted: "cp: overwrite 'dir/hello-world.rb'?". If the user
answers 'y' or 'yes' (or anything else starting with 'y'/'Y') `dir/hello-world.rb`
will be overwritten; otherwise that file will be skipped. (Long option:
`--interactive`).

## Symbolic and Hard Links

* `cp -s file1 file2` - Creates a symlink named `file2` that points to `file1`.
Like `ln -s file1 file2`. (Long option: `-symbolic link`).
* `cp -l file1 file2` - Create a hard link from `file1` to `file2`. Like `ln
file1 file2`. (Long option: `--link`).
* `cp -d dir1 dir2` - Copies `dir1` to `dir2` without following symlinks in
`dir1`, but preserving any that it finds.
* `cp -H file1 file2` - If `file1` is a symlink, its target is copied to
`file2`; else `file1` is copied to `file2` as normal.
* `cp --strip-trailing-slashes dir1/ dir2` - This option ignores the trailing
slash on `dir1/` so if it is a symlink to a directory, the symlink isn't
followed. This ensures that `dir1/` is copied; not its target.


## Other Options

* `cp -p file1 file2` - Copies `file1` to `file2` preserving its modification
date, time, and access control list.
* `cp -v *.rb dir/` - The `v` flag copies files verbosely by printing a message
every time a copy is made. This is useful when you're copying large amounts of
files, particularly with `-R`, so that you can monitor the progress of the
operation. (Long option: `--verbose`).
* `cp -u file1 file2` - Copies `file1` to `file2` if `file1` is newer than
`file2` or `file2` doesn't exist; otherwise, nothing is copied. For example, `cp
-u *.csv archive/` ensures that only new and updated .csv files are copied to
the `archive/` directory.
* `cp -a dir1/ dir2/` - Copy `dir1/` to `dir2/` recursively, without following
symlinks in `dir1/`, while preserving links, mode, ownership, and timestamps.
(Long option: `--archive`). Note: 
 * The first argument doesn't need to be a directory, but recursively copying a
file doesn't make much sense.
 * Neither does the second argument, but again recursively copying anything to a
file makes little sense. 
 * See `--preserve` for how to preserve these attributes in other invocations.
* `cp -f file1 file2` - If `file2` exists and can't be overwritten, delete it,
then retry. For example, if the user doesn't have write permission for `file2`
a `cp` would normally fail with the error "cp: cannot create regular file
'file2': Permission denied". The `-f` flag *f*orces the copy by deleting `file2`
first, then copying as normal. (Long option: `--force`).
* `cp --sparse=when file1 file2` - By default `cp` tries to make `file2` sparse
if `file1` is sparse unless `file2` exists and is non-regular. This is the
behaviour when `when` is 'auto'. If `when` is 'always' `and `file2` is a regular
file `cp` tries to make `file2` sparse even if `file1` doesn't seem to be. If
`when` is 'never', `file2` won't be made sparse even if `file1` is.

## Esoteric Options

* `cp -x file1 dir/` - Copies `file1` to `dir/` only if they are both on the
same filesystem. (Long option: `--one-file-system`).  
* `cp -t dir/ file` - Copies `file` into `dir/`. (Long-option:
`--target-directory`).
* `cp -T file2 file1` - Copies `file1` to `file2` treating `file2` as a regular
file. Note:
 * If `file2` exists and is a directory this will fail with "cp: omitting
directory 'file2'"
 * As `file2` has to be a normal file, there can only be one `file1`, i.e. `cp
-T file2 file1 file3` doesn't work because it means copy `file1` to `file2` then
overwrite it with `file3`.
* `cp --copy-contents`- Copy contents of special files when recursive. [FIXME:
What does this actually do?]
 * `cp --remove-destination file1 file2` - Unconditionally removes each
destination file before copying to it. This is in contrast to `--force`, which
only removes destination files if they can't be overwritten.
* `cp --preserve=attributes file1 file2` - Controls which attributes of `file1`
are copied to `file2`. By default `attributes` is 'mode,ownership,timestamps'.
Additional attributes are 'context', 'list', and 'all'.
* `cp --no-preserve=attributes file1 file2` - Controls which attributes of `file1`
are *not* copied to `file2`. Possible attributes are 'mode', 'timestamps',
'ownership', 'context', 'list', and 'all'.
