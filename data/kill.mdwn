Forcibly terminate, or otherwise send a given signal, to a process.

`kill` is generally used to terminate a process that you can't exit normally,
e.g. via its interface. An easier to use interface of `kill` is `killall`
which lets you terminate processes by name rather than ID.

* `kill 1337` - Sends the (default) SIGTERM signal to the process with ID 1337. Note:
 * The process ID can be gleaned from `ps`.
 * You must own the process you're killing, or be root.
 * The process is given the chance of exiting gracefully, e.g. saving settings
and open files, so this is signal is preferable to SIGKILL, described below.
* `kill -KILL 1337` - Sends a SIGKILL signal to the process with the ID 1337.
This behaves much like the above with the exception that the process isn't
given a chance to exit gracefully; the kernel tries to forcibly terminate it.
* `kill -KILL 1337 9987 345` - As above, but kills all the named processes.
* `kill -KILL -1` - Sends SIGKILL to all processes you can kill.
* `kill -SIGNAL ID` - This is the general syntax to send a signal named
`SIGNAL` to a process with an ID of `ID`. You can use `/bin/kill -L` to see a
list of signal names your system supports.
