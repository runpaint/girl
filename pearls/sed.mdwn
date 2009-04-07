Performs search-and-replace operations on text.

The following examples assume they'll receive a file on STDIN, e.g. `sed
'/^$/d;G' <file`, or they'll be followed by filenames, e.g. `sed '/^$/d;G'
file`.

## File Spacing
* `sed '/^$/d;G'` - Double space a file
* `sed 'n;d'` - Undoes double-spacing on the assumption that even-numbered
lines are blank.

# Numbering
* `sed '/./=' file | sed '/./N; s/\n/ /'` - Numbers the lines of
`file`, omitting the display of the number on blank lines.

# Text Conversion
* `sed 's/.$//'` - Converts DOS newlines (CR/LF) to Unix-style. Assumes that
all lines end with CR/LF.
* `sed 's/$'"/`echo \\\r`/"` - Converts Unix-style newlines (LF) to DOS
style. 
* `sed 's/^[ \t]*//'` - Deletes leading whitespace from each line.
* `sed 's/[ \t]*$//'` - Deletes trailing whitespace from each line.
* `sed 's/^[ \t]*//;s/[ \t]*$//'` - Deletes leading and trailing whitespace
from each line.

## Search and Replace
* `sed 's/pattern/replacement/'` - Replaces the first instance of `pattern`
with `replacement` on every line, where `pattern` is a string or a regular
expression.
* `sed 's/pattern/replacement/g'` - As above, but replaces _all_ occurrences.  
* `sed '$!N;s/\n/ /'` - Join each pair of lines.

## Display Specific Lines
* `sed -e '/./{H;$!d;}' -e 'x;/pattern/!d;'` - Assuming that paragraphs are
separated by blank lines, print paragraphs containing `pattern`.
* `sed -n '/^.\{w\}/p'` - Display lines greater than `w` characters in length.
* `sed -n '/pattern/,$p'` - Display the file from the first occurrence of
`pattern` to the end of the file.
* `sed 's,f!d'` - Display line number `s` to line number `f`, inclusive. 
* `sed -n 'lp'` - Display line number `l`.
* `sed -n '/start/,/end/p'` - Display lines between the regular expressions
`start` and `end`.
* `sed '/start/,/end/d'` - Displays lines _not_ between the regular
expressions `start` and `end`.

## Deletes Specific Lines
* `sed '1,ld'` - Deletes the first `n` lines.
* `sed -n -e :a -e '1,l!{P;N;D;};N;ba'` - Delete the last `l` lines. 
* `sed '/./!d'` - Deletes blank lines.  
* `sed -e :a -e '/^\n*$/{$d;N;ba' -e '}'` - Deletes trailing blank lines at
the end of a file.
* `sed -e :a -e 's/<[^>]*>//g;/</N;//ba'` - Deletes most HTML tags.
