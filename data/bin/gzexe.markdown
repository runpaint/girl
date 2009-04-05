Creates self-extracting executables compressed with `gzip`.

* `gzexe program` - Copies `program` to `program~` and replaces `program` with a
compressed version of itself that will automatically uncompress and execute
when run. 
* Saves disk space on penalty of performance; mainly useful for particularly
small disks.
* `gzexe -d program` - Decompresses executable. `gunzip` can't be used here
because the compressed program is appended to a stub shell script, leaving the
file invalid from `gunzip`'s perspective.
* The man page warns of potential security flaws due to the compressed
executable being a shell script with a reliance on PATH, but the examples it
gives are invalid as most of the paths are hardcoded, and those that aren't
could be. `gzexe` does indeed rely on PATH, but searches /bin beforehand... [FIXME]
* Attempts to retain permissions of original executable, but may fail in some
cases. Specifically, `gzexe` will not create setuid or setgid shell scripts.
[TODO: are these the only exceptions; if not, find and document them.]
* This is just a shell script, so read the source if you want to know more.
