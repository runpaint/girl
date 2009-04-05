Search possibly bzip2 compressed files for any of the specified
newline-separated strings with `fgrep`.

* `bzfgrep pattern <file1` - Uncompresses `file1` if necessary then invokes
`fgrep` to search it for `pattern`.
* `bzfgrep pattern *` - Uncompresses each file in the current directory, if
necessary, then invokes `fgrep` to search them for `pattern`.
* `bzfgrep -i st..t file.bz2` - Uncompresses `file.bz2` then calls `fgrep
-i`, which matches case insensitively, to search it for /st..t/. IOW, any
supplied options are passed directly to `fgrep`. See `girl fgrep` for more. 
* Note: `fgrep` (`grep -F`) is called to perform the pattern matching. It
interprets `pattern` as a list of newline-separated strings, any of which is
to be matched. See `girl fgrep` for more information.
* Note: **all** options are passed to `fgrep`, so `bzfgrep --version`, for
example, will display the version of `fgrep`; not that of `bzfgrep`.
* This is just a shell script, so read the source if you want to know more.
