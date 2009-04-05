Pager for viewing long files on a terminal, one screnfull at a time.

* `more file` - Shows as many lines of `file` that will fit on the screen, then prompts users to press `<space>`
to see the next screenful.
* `more +/pattern file` - As above, but starts displaying `file` from the first occurrence of `pattern`. 
* `more +n file` - As `more`, but starts displaying `file` from line `n`.

When viewing a file:

* `<space>` / `s` - Skips forward to the next screenful.
* `b` - Skips backward to the previous screenful.
* `/pattern` - Advances to the next occurrence of `pattern`.
* `v` - Loads the current file in an editor (as defined by EDITOR or VISUAL), and skips to the current line.

