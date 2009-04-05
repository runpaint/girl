Search possibly bzip2 compressed files for a regular expression with `egrep`.

* `bzegrep pattern <file1` - Uncompresses `file1` if necessary then invokes
`egrep` to search it for `pattern`.
* `bzegrep pattern *` - Uncompresses each file in the current directory, if
necessary, then invokes `egrep` to search them for `pattern`.
* `bzegrep -i st..t file.bz2` - Uncompresses `file.bz2` then calls `egrep
-i`, which matches case insensitively, to search it for /st..t/. IOW, any
supplied options are passed directly to `egrep`. See `girl egrep` for more. 
* See `girl egrep` for the kinds of patterns and objects it supports.
* Note: **all** options are passed to `egrep`, so `bzegrep --version`, for
example, will display the version of `egrep`; not that of `bzegrep`.
* This is just a shell script, so read the source if you want to know more.
