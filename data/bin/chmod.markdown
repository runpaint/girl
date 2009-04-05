Changes the permissions of files to control who can access them, and what they
can do with them.

* `chmod mode file` - Changes the permissions of `file` to
`mode`. For example:
 * `chmod +x file` - Sets the executable bit on `file` so it can be ran with
`./file`. Note: if `file` is a script the first line must be a shebang so that
the system knows how to execute it.
 * `chmod a-rwx file` - Removes all permissions from `file`, prohibiting
anybody from reading, writing, or executing it.
 * `chmod 755 file` - Makes `file` readable/executable by everybody, and
writable by the owner only. Many shared web hosts require CGI scripts to have
this permission so the web server (which does not share a group with the user)
can run the CGI, but only the user can edit it. This example uses the numeric
mode of setting permissions, which is more complex than the symbolic way
described below.  However, it's useful to know if you're asked to change a
file's permissions to a specific numeric mode.
 * `chmod 600 file` - Lets the user read and write `file`, prevents everybody
else from using it. This is useful for data files in a user's home directory;
their programs can access them, but nobody else can.
* `chmod -R mode file` - Changes the mode of `file` to `mode`, and does likewise
to its subdirectories and their contents, in a recursive fashion. 
* `ls -l file` - Shows the existing permissions of `file`.

The easiest way to set the mode is symbolically. The syntax is
`{who}{operation}{permissions}`. {who} determines who the mode applies to,
{operation} determines how the mode will be applied, and {permissions}
determines what {who} will be able to do.


                {who}                               {operation}

    | Symbol |    Meaning          |   | Symbol |           Meaning           |
    --------------------------------   ---------------------------------------
    |   a    | everybody           |   |    +   | adds to existing perms.     | 
    --------------------------------   ---------------------------------------
    |   u    | user (the owner)    |   |    -   | removes from existing perms.|
    --------------------------------   ---------------------------------------
    |   g    | group               |   |    =   | adds to existing perms;     |
    --------------------------------   |        |  removes unmentioned perms. |
    |   o    | other (other users) |   ---------------------------------------
    --------------------------------

              {permissions}
    | Symbol |              Meaning                    |
    ---------------------------------------------------
    |   r    | read                                    |
    ---------------------------------------------------
    |   w    | write                                   |
    ----------------------------------------------------
    |   x    | execute (or search for directories)     |
    --------------------------------------------------- 
    |   X    | as x if file is a directory or          |
    |        |   already has x set for some user       |
    ---------------------------------------------------
    |   s    | set user or group ID on execution       |
    ---------------------------------------------------
    |   t    | restricted deletion flag ("sticky bit") |
    ---------------------------------------------------

 So, in the example of `chmod go-w file` the {who} is the named group of `file`
and users who are neither in this group or the owners of `file`, the operation
is to remove, and the permission is write. The effect is to remove write
permission of `file` from everybody except the file's owner. 

[FIXME: This needs a lot of work. chmod confuses many new users, so it's
particularly important to get this right] 
