Displays the end of a growing file.

This command is most often used to monitor log files of a running application.
It lets the user see, in real time, what the application is doing.

* `tailf file` - Displays the last ten lines of `file`. If `file` grows, i.e.
has additional lines appended to it, the new lines are displayed as they
added.
* `tailf -n lines file` - As above, but begins by printing the last `lines`
lines, e.g. `tailf -n 20 file`.

To view the _first_ n lines of a file, see `head`.
