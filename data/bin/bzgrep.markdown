Search possibly bzip2 compressed files for a regular expression with `grep`.

* `bzgrep pattern <file1` - Uncompresses `file1` if necessary then invokes
`grep` to search it for `pattern`.
* `bzgrep pattern *` - Uncompresses each file in the current directory, if
necessary, then invokes `grep` to search them for `pattern`.
* `bzgrep -i st..t file.bz2` - Uncompresses `file.bz2` then calls `grep
-i`, which matches case insensitively, to search it for /st..t/. IOW, any
supplied options are passed directly to `grep`. See `girl grep` for more. 
* Note: `grep` is called to perform the pattern matching. See `girl grep` for
more information.
* Note: **all** options are passed to `grep`, so `bzgrep --version`, for
example, will display the version of `grep`; not that of `bzgrep`.
* This is just a shell script, so read the source if you want to know more.
