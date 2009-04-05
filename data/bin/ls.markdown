Displays directory contents and information about files.

In all of the following examples a directory name, or list of files and
directories can be passed to `ls`; by default it displays the contents of the
current directory.

* `ls` - Displays the names of the non-hidden files in a columnar format.
* `ls -hall --colour dir/` - Lists the contents of `dir/`, including hidden
files, in a colourful detailed, '*l*ong *l*isting' format, with human-readable
sizes. 
* `ls -Rhall` - As above, but displays the contents of subdirectories and
their contents, recursively, too.
* `ls --ll file.txt docs/file.csv` - Displays the details of the two named
files in long-listing format.

## Common Options
* `-a` - Shows *a*ll files, i.e. hidden files are displayed as well.
* `-ll` - Use a '*l*ong *l*isting' format. Each filename is accompanied by its
permissions, group, owner, size, and last modification date.
* `ls -h` - Displays file sizes in a human-readable fashion,
using sensible units instead of bytes. It is combined with the `-ll` flag to
provide detail of each file listed. (This only makes sense if the file sizes
are displayed, such as with `-ll` or `-s`.
* `-R` - Lists the contents of the argument's subdirectories as well, in a
*r*ecursive fashion. 
* `-F` - Appends indicators to filenames as follows: 
 * _*_ - Regular file that is executable.
 * _/_ - Directory.
 * _@_ - Symbolic link.
 * _|_ - FIFO.
 * _=_ - Sockets.
 * _>_ Doors
(Long option: `--classify`).

## Sorting

The `--sort=attribute` option specifies that the entries should be sorted by
attribute `attribute`, instead of by name, which is the default. Available
attributes follow, accompanied by the synonymous single-letter option:

* _none_ - `-U`
* _extension_ - `-X`
* _size_ - `-S`
* _time_ - `-t`
* _version_ - `-v`

The sort order can be reversed with the `-r` option. For example:

* `ls -ll --sort=size` - Uses the long-listing format and displays the largest
files first.
* `ls -Sllr` - Uses the long-listing format and displays the smallest files
first.
* `ls -tR docs/` - Recursively lists the files in the `docs/` directory in
order of file modification time. The most recent files are listed first.
