Compare files compressed with the bizp2 algorithm using `cmp`.

* `bzcmp file1` - Compares `file1` with an uncompressed `file1.bz2`. (Both
files need to exist or you get an unhelpful error message). If they are the
same, nothing is printed; if they differ the first byte at which they do so is
indicated.
* `bzcmp file1 file2` - Files are uncompressed if necessary then compared as
above.
* `bzcmp -l file1 file2` - Options are passed to `cmp`, which is used for the
comparisons, so this example calls `cmp` with `-l` which "outputs byte numbers
and values of all differing bytes". (See `girl cmp` for more options). As
above, the files are compressed beforehand if necessary.
* The exit status is that of `cmp`.
* Note: **all** options are passed to `cmp`, so `bzcat --version`, for
example, will display the version of `cmp`; not that of `bzcat`.
* This is just a shell script, so read the source if you want to know more.
