Displays the contents of bzip2-compressed files one screen at a time using
`more`. 

* `bzmore file.bz2` - Uncompresses `file.bz2` in place and pipes it to `more`
to display one screenful at a time. 
* `bzmore file` - As above, but works on uncompressed files, too. If `file` is
not found, attempts to display `file.bz2` instead.
* While viewing the file the user can:
 * Press <Space> to display the next screenful.
 * Press the up/down arrow to advance by line.
 * Type `/pattern` to jump to the first occurrence of `pattern`.
* See `girl more` for more commands. 
