Displays the process ID of the named process.

Every process on Linux has a process ID or 'pid', which is an integer unique
to that process. Each process also has a name, which is typically the same as
the command used to invoke it.

* `pidof process` - Displays the process ID of a process named `process`. If
multiple copies of `process` are running, the IDs of each will be shown. For
example:
 * `pidof firefox` - Shows the process ID of the Firefox web browser. On my
system only one copy of `firefox` was running, so '7328' was output.
 * `pidof /bin/bash` - If you know the full pathname of the program, provide
it to ensure that you only see the process IDs you're interested in. For
example, `pidof bash` shows the process IDs of all processes named 'bash'.
While you may assume them to refer to the bash shell, if, say, a game
installed at `/usr/local/bin/bash` was running, it's process ID would be
returned as well. 
 * `pidof git` - The `git` command is installed on my system, but not
currently running, so nothing is displayed.
 * `pidof apache2` - There are multiple processes of the Apache 2 web server
running on my system so this displays "2697 2696 2695 2693 2692 2625".
 * `pidof firefox apache2` - Multiple process names can be given, in which
case the process IDs are shown. Processes that don't exist are ignored. This
displays for me "7328 2697 2696 2695 2693 2692 2625".
* `pidof -s process` - Returns at most a *s*ingle process ID. For example:
`pidof -s apache2` displays "2697".
* `pidof -x process` - Also displays the process IDs of shells running scripts
named `process`.
