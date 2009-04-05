Concatenates (merges sequentially) the contents of files to STDOUT.

* `cat file1 file2` - Displays the contents of `file1` followed by the
contents of `file2`.
* `cat file` - Displays the contents of `file1`. Note: this is probably not
what you want to do. To display `file` on the terminal use a pager
such as `less`, `more`, or `most`. To provide the content of the file as the
input to another command use `command <file`; `cat file | command` is a usless
construct and a waste of a process. 
* `cat -n file` - Displays `file` prefixing each line with its number.
 * `cat -b file` - As above, but only numbers non-blank lines. (Long option: `--number-nonblank`)
* `cat >file` - Starts an interactive session where the text you enter is
redirected to `file`. Use <Ctrl>+<D> to quit.
 * `cat >file << END` - As above, but exits when you type 'END' on a line by
itself.
* `cat file >> file2` - Appends the contents of `file` to `file2`.
* `cat -E file` - Displays `file` with a $ symbol at the end of each line.
(Long option: `--show-ends`)
* `cat -s file1 file2` - Replaces multiple blank lines with a single blank
line in concatenated output. (Long option: `--squeeze-blank`). 
* `cat -T file` - Displays `file` with <Tab> replaced by '^I', i.e. it
visually distinguishes tab characters from runs of spaces. (Long option:
`--show-tabs`).
* `cat -v *.txt` - Concatenates the contents of .txt files in the current
directory and escapes control and non-printing characters, with the exception
of linefeeds and tabs. For example, `dd if=/dev/urandom | cat -v` reads
random, binary data from the special `/dev/urandom` device, then pipes it to
`cat` which displays the data with control characters escaped, so it can be
viewed on a terminal.
* `cat index | xargs cat` - If `index` contains one filename per line, the
contents of each named file is concatenated to STDOUT.
