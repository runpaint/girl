Show differences between files compressed with the bizp2 algorithm using `diff`.

* `bzdiff file1` - Diffs `file1` with an uncompressed `file1.bz2`. (Both
files need to exist or you get an unhelpful error message). If they are the
same, nothing is printed; if they differ the diff is printed.
* `bzcmp file1 file2` - Files are uncompressed if necessary then diff'd as
above.
* See `girl diff` for an explanation of the output.
* `bzdiff -i file1 file2` - Options are passed to `diff`, which is used for
the diffs, so this example calls `diff` with `-i` which "ignores case
differences in file contents". (See `girl diff` for more options). As above,
the files are compressed beforehand if necessary.
* The exit status is that of `diff`.
* Note: **all** options are passed to `diff`, so `bzdiff --version`, for
example, will display the version of `diff`; not that of `bzdiff`.
* This is just a shell script, so read the source if you want to know more.
