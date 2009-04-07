Move files and directories to new locations.

* `mv file file2` - Rename `file` to `file2`. Note:
 * If `file2` already exists it will be overwritten.
 * Either argument can be a directory. For example, `mv quine/ code/` moves
the entire `quine/` directory, along with its content, into `code/`. So
`quine/README`, for example, becomes `code/quine/README`.
 * After this operation `file` no longer exists.
* `mv file file1 dir` - Moves `file` and `file2` into `dir`. When more than
two arguments are given to `mv` it requires that the last be a directory.

## Overwriting Files

By default if you move a file to into a directory where a file with the same
name already exists, this destination file will be overwritten without
warning. The following options let you control this behaviour.

* `mv -i econ-notes.txt 0981-research 0981-data.csv ~/work` - The `-i` option
causes `mv` to be *i*nteractive: the user must confirm any overwriting of
existing files. For example, if `~/work` already contained a file called
`econ-notes.txt`, you would be prompted: "mv: overwrite
'~/work/econ-notes.txt'?". Unless the user answers in the affirmative, that
file is skipped. (Long option: `--interactive`).
* `mv -b millie.png /media/usbstick/` - The `-b` option causes files to be
backed up before they are overwritten. In this example, assuming that
`/media/usbstick/millie.png` already existed, it would be moved to
`/media/usbstick/millie.png~` before 'millie.png' in the current directory was
moved.
* `mv -u pink.rb lib/colours/` - The `-u` flag indicates that files should
only be overwritten if the file to be moved is newer than the destination
file, or the destination file doesn't exist. In this example, if
`lib/colours/pink.rb` didn't exist, `pink.rb` would be moved as normal. If
`lib/colours/pink.rb existed, but was older (i.e. it hadn't been updated as
recently as) 'pink.rb', it would be overwritten. If `lib/colours/pink.rb`
existed, and had been updated more recently than 'pink.rb', the move would not
take place.
