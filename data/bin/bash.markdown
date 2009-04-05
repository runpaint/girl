Default shell.

## Run Command
*  `command [args] [files]`, e.g. `ls`, `cat foo.txt`, `df -h`.
*  Uses $PATH to locate command; first match wins.
* `command &` - Run command in background.
* `cmd1 && cmd2` - Run `cmd1`, then if, and only if, `cmd1` was successful, run
`cmd2`.
* `cmd1 || cmd2` - Run `cmd1`, then, if unsuccessful, run `cmd2`.
* `cmd1; cmd2` - Run `cmd1` then `cmd2`.
* `cmd1 & cmd2` Run `cmd1` and `cmd2`, without waiting for `cmd1` to finish.
* `(cmds)` Run `cmds` in a subshell.

## Tests
Tests (for ifs and loops) are done with [...] or with the `test` command.

### File Tests
 * `-r [file]` - readable?
 * `-w [file]` - writable?
 * `-x [file]` - executable?
 * `-f [file]` - ordinary file (not directory, device, etc.)?
 * `-s [file]` - size > 0?
 * `-d [file]` - directory?
 * `-e [file]` - exists?

        if [ -s file ]
        then
          echo "$file has content"
        fi

### String Tests		

* `s1 = s2` - s1 equals s2?
* `s1 != s2` - s1 doesn't equal s2?
* `-z s1` - s1 has size 0?
* `-n s1` - s2's size > 0?
* `s1` - s1 is non-empty?

        if [ $myvar = "foo" ] ; then
          echo "$myvar equals 'foo'"
        fi

### Number Tests

* `n1 -eq n2` - n1 equals n2?
* `n1 -ne n2` - n1 doesn't equal n2?
* `n1 -lt n2` - n1 < n2?
* `n1 -le n2` - n1 <= n2?
* `n1 -gt n2` - n1 > n2?
* `n1 -ge n2` - n1 >= n2?

        if [ $# -gt 1 ]
        then
            echo "ERROR: should have 0 or 1 command-line parameters"
        fi

## Boolean Operators

* `!` - NOT
* `-a` - AND
* `-o` - OR

        if [ $num -lt 10 -o $num -gt 100 ]
        then
            echo "Number $num is out of range"
        elif [ ! -w $filename ]
        then
            echo "Cannot write to $filename"
        fi

## Conditionals

* `if [condition]; then [body]; fi`
* Can be nested
FIXME: Expand.

## Read from Keyboard

* `read num` - reads keyboard input to $num

## Return Values

* Most *nix commands return a true (non-zero) value on success, and false on
failure. They can be used as conditions. e.g. `if grep -q line file` executes if
`grep -q line file` returns true, which it will if it finds 'line' in file.

## I/O Redirection

* `command > file` - Redirect output of `command` to file, clobbering any
existing content. file is created unless it exists.
* `command < file` - Provide `command` the contents of `file` on STDIN.
* `command >> file` - Append output of `command` to file. file is created
unless it exists.
* `command1 | command2` - Pipe output of `command1` to `command2` as input.
* `n > file` - Redirect output from stream with descriptor n to file.
* `n >> file` - Append output from stream with descriptor n to file.
* `n >& m` - Merge output from stream n with stream m.
* `n <& m` - Merge input from stream n with stream m.
* `<< tag` - Standard input comes from here through next tag at start of line. FIXME

Note: file descriptor 0 is normally standard input, 1 is standard output, and 2 is standard error output.

## Shell Built-in Variables

* `$0` - Name of this shell script.
* `$1` - Value of first command line parameter (similarly $2, $3, etc,)
* `$#` - In a shell script, the number of command line parameters.
* `$*` - All of the command line parameters.
* `$-` - Options given to the shell.
* `$?` - Exit status of the last command.
* `$$` - Process id of script (really id of the shell running the script)

## Pattern Matching

* `*` - Matches 0 or more characters.
* `?` - Matches 1 character.
* `[AaBbCc]` - Character class: matches any specified character.
* `[^RGB]` - Inverted character class: matches any unspecified character.
* `[a-g]` - Character class with range: matches any character between 'a' and 'g' inclusive. 

## Quoting

* `\c` - Take character c literally. e.g. `echo \*` displays '*'; doesn't treat it as a wildcard. 
* `command` - Return the output of running `command`. ee. `match=`ls *.bak` stores names of *.bak files in $match. 
* "whatever" - Take 'whatever' literally, after interpolating $variables. e.g. `echo "Hello, $name" displays 'Hello, ' then the value of $name.
* 'whatever' - Take whatever absolutely literally, performing no variable interpolation. e.g. `echo 'Hello, $name' displays 'Hello, $name'.


## Grouping
* Parentheses may be used for grouping, but must be preceded by backslashes.

        if test \( -r $file1 -a -r $file2 \) -o \( -r $1 -a -r $2 \)
        then
          #do whatever
        fi

## Case Statement
* Example below looks for a match with one of the characters 'a', 'b', or 'c'.
If $1 fails to match these, it always matches the * case. 

        case "$1" in
            a) cmd1 ;;
            b) cmd2 ;;
            c) cmd3 ;;
            *) cmd4 ;;
        esac

## Shell Arithmetic

* Enclose expression in [...]
* Operators (in order of precedence):
 * '/' '%' (multiply, divide, remainder)
 * '+' '-' (add, subtract)
 * '<' '>' '<=' '>=' (comparison operators)
 * '==' '!=' (equal to, not equal to)
 * '&&' (logical and)
 * '||' (logical or)
 * '=' (assignment)
* Arithmetic is done using long integers, e.g. `result=$[$1 + 3]` adds 3 to the value of $1 and assigns the result to `result`.

## Order of Interpretation

1. Brace expansion.
2. ~ expansion (for login ids).
3. Parameters (such as $1).
4. Variables (such as $var).
5. Command substitution (example: match=`grep DNS *` ).
6. Arithmetic (from left to right).
7. Word splitting.
8. Pathname expansion (using *, ?, and [abc] ).

## Other Shell Features:

* `$var` - Value of shell variable `var`.
* ${var}abc - Value of var followed by 'abc'.
* '#' - At start of line, indicates a comment; ignored by bash.
* `var=value` - Assign the string 'value' to shell variable `var`.

Derived from <http://cis.stvincent.edu/html/tutorials/unix/bshellref>.
