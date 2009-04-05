Delete files and directories.

## Delete Files
* `rm file` - Deletes `file`. For example, `rm contacts.csv`.
* `rm file *.txt` - Deletes `file` and all .txt files in the current
directory.
* `rm -i *.txt` - For each .txt file in the current directory, ask the user if
he wants to delete it; if he answers in the affirmative, the file will be
deleted.
* `rm -f file` - The `-f` flag *f*orces the deletion of `file`. The user is
assumed to answer in the affirmative to any questions `rm` would usually pose.
For example, if a file were write protected the user would normally need
to confirm its deletion; with `-f` the file is simply deleted. This option
also causes `rm` to ignore non-existent files, rather than issuing a warning.

## Delete Directories
* `rm -r dir/` - The `-r` option is needed to delete directories and their
contents; without it `rm` refuses to operate. It operates *r*ecursively,
deleting not only `dir/`, but also any files it contains, any directories it
contains, and so on for their contents.
* `rm -rf dir/` - The `-r` flag is typically paired with the `-f` flag
described above to prevent `rm` from repeatedly prompting the user. Be warned,
however, that this command is particularly dangerous: if you mistype the
directory name, or provide too broad a wildcard, you can accidentally delete
large quantities of files. Consider using `-rf` in conjunction with `-I` which
will prompt you once before recrusive removals, thus giving you some degree of
protection against mistakes.
* `rmdir dir/` - To delete a directory which you assume to be empty, it is
safer to use `rmdir` instead. This command refuses to delete non-empty
directories, so acts as a safety net against accidental deletions.
