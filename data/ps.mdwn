Reports on a selection of active processes.

* `ps -u user` - Displays a report of processes owned by user `user`. For
example, `ps -u kim` may show:

         PID TTY          TIME CMD
         1486 pts/1    00:00:02 bash
         2888 ?        00:00:06 x-session-manag
         3001 ?        00:00:00 ssh-agent
         3002 ?        00:00:07 gpg-agent
         7311 ?        01:01:24 rhythmbox
         7328 ?        18:41:35 firefox
         8302 pts/6    00:00:00 ps
        14186 pts/2    00:00:00 bash
        27634 ?        00:01:45 gvim

 * In all likelihood, if 'kim' was a human user, her list of processes would
be significantly longer.
 * The columns are: processes ID (PID), the controlling terminal the process
is running on (TTY), CPU time the process has consumed, and the command name
that initiated the process.
 * The third shows a process name which has been truncated (it should be
'x-session-manager'). You can view full command names with the `-f` option.
 * Processes such as 'ssh-agent' probably weren't started by the user
explicitly; rather, they were invoked by the system, and are waiting to be
used. (In this case, 'ssh-agent' provides a secure way of managing credentials
when connecting to remote systems via SSH.)
 * Processes that aren't attached to a controlling terminal have a question
mark in the TTY column.
 * Some processes will be running multiple instances of themselves, as shown
here for 'bash'.

* `ps -ef` - Shows *e*verybody's processes in *f*ull listing format. For
example:

        UID        PID  PPID  C STIME TTY          TIME CMD
        kim       1486 29867  0 Apr03 pts/1    00:00:02 bash
        lm        2876     1  0 Apr03 ?        00:00:01 /usr/bin/gnome-keyring-daemon --daemonize --login
        kim       2888  2397  0 Apr03 ?        00:00:06 x-session-manager
        brian     3082  2888  0 Apr03 ?        00:00:19 python /usr/share/system-config-printer/applet.py

 * The UID column shows the username of the process owner, PPID is the process
ID of the process' parent, C is the CPU utilization factor, and STIME is the start
time of the process.
* `ps -H -u mya` - The `-H` option causes the output to be displayed
*h*ierarchically. For example, the following output describes the process
hierarchy for the Google Desktop application:

         3084 ?        00:01:34 gdl_box
         3085 ?        00:03:58   gdl_service
         3101 ?        00:00:58     gdl_config
         3102 ?        00:02:01     gdl_indexer
         3103 ?        00:05:23     gdl_fs_crawler

 * `gdl_box` was invoked, presumably by a startup script, then spawned the
`gdl_service` process, which, in turn, spawned `gdl_config`, `gdl_indexer`,
and `gdl_fs_crawler`.
 * If a process name is indented more than the previous process name, the
previous process created it. 
 * If a process name is indented by the same amount as the preceeding name,
they were both created by the same process (they're siblings). 
 * If a process name is indented by a smaller amount than the previous process
name, it was created by a different process.
