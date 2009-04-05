Displays the given text.

* ` echo string` - Displays `string` to STDOUT. For example:
 * `echo 1234` - Displays "1234".
 * `echo "Captain Beefheart and His Magic Band"` - Displays "Captain Beefheart
and His Magic Band".
* `echo -e string` - Displays `string` with embedded escapes. For example:
 * `echo -e "The first\nThe second"` - Displays

            The first
            The second

 * `echo "The first\nThe second"` - Displays "The first\nThe second", i.e. the
newline escape ("\n") is displayed literally; not interpreted as newline.
 * `echo -e "The first\n\tThe second\041"` - Displays:

            The first
              The second!

The "\n" escape indicates a newline, "\t" a tab, and "\041" is the ASCII code
for ! in octal. `echo` recognises the usual character escapes plus `\0NNN`,
where `NNN` is the character code for an ASCII character expressed in octal. 

