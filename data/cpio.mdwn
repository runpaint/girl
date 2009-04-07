Manipulate archives in the _cpio_  and _tar_ file formats.

## Copying Files to an Archive

* `ls | cpio -ov > dir.cpio` - Creates a _cpio_ archive from the contents of
the current directory and stores it in `dir.cpio`. Takes a list of files to
archive on STDIN; sends the archive to STDOUT. The `-o` option creates the
archive, and `-v` specifies a verbose mode that prints each filename as it is
added.
* `find . -depth -print | cpio -ov > tree.cpio` - Creates a _cpio_ archive of
an entire directory tree. This works on the same principle as the above, but
this time `find` is used to generate the list of filenames.

## Listing an Archive's Contents

* `cpio -t <archive.cpio` - Displays the filenames in the archive
`archive.cpio`.
 * Appending the `-v` option results in an `ls -l`-style listing.

## Extracting Files from an Archive

* `cpio -idv < archive.cpio` - Extracts the contents of `archive.cpio` into
the current directory. The `-i` flag denotes requests extraction from the
archive supplied on STDIN, the `-v` flag requests verbosity, and `-d` that
directories should be created as needed.
 * If files to be extracted have the same name and the same or later
modification time as files in the destination directory, `cpio` will skip
them. The `-u` (*u*nconditional replacement) option forces the replacement.
 * Any command-line arguments that are not recognised options are interpreted
as shell globbing patterns which specify which files should be extracted. If
present, extracted files must match at least one.

## Copying Files Between Directories

* `find . -depth -print0 | cpio --null -pvd dir/` - Recursively copy the
contents of the current directory into `dir/`. The `-print0` option of `find`
and the `--null` option of `cpio` ensure that filenames containing special
characters are handled correctly. `-p` instructs `cpio` to *p*ass through
files from STDIN to `dir/`. `-d` specifies that directories should be created
as needed.

## Options

* `-0` - Assume that STDIN is a list of filenames terminated by a null character, instead of a newline, so that filenames containing nulls are handled correctly. `find` with the `-print0` produces null-terminated file lists. (Long option: `--null`).
* `-A` - Append files to an existing archive on disk. Use in conjunction with
`-o`. Specify the archive file with `-O` or `-F`. (Long option: `--append`).
* `-d` - Make leading directories as needed. Use this when extracting archives
containing directories to require that they are created in the output
directory. (Long option: `--make-directories`).
* `-E file` - When extracting or listing the contents of an archive treat
`file` as a list of newline separated patterns that filenames must match.
(Long option: `--pattern-file=file`).
* `-f` - Ignore files matching any of the given patterns. (Long options:
`--nonmatching`).
* `-F archive` - Instead of reading from STDIN/STDOUT read from archive file
`archive`. If `archive` starts with '`hostname`:', where `hostname` is the
name or IP address of another machine, treat it as a tape drive on that
machine. Preceed `hostname` with `username@`, where `username` is a username
on the remote machine, to access the drive as that user. (Long option:
`--file=archive`).
* `-i` - Extracts the contents of the specified archive file.  (Long option:
`--extract`) 
* `-I archive` - Reads the archive from file `archive` instead of STDIN. The
notes from `-F` apply here, too.
    Archive filename to use instead of standard input. To use a tape drive on another machine as the archive, use a filename that starts with ‘hostname:’, where hostname is the name or IP address of the remote host. The hostname can be preceded by a username and an ‘@’ to access the remote tape drive as that user, if you have permission to do so (typically an entry in that user's ~/.rhosts file).
* `-k` - Ignored; include for backward compatibility with older version.
* `-l` - When possible create hard links between files instead of copying
them. (Long option: `--link`)
* `-L` - Copy the target of a symlink rather than the link itself. (Long
option: `--dereference`)
* `--no-absolute-filenames` - Convert absolute filenames to be relative to the
current directory when extracting/listing. This ensures that the archive
contents is only extracted in the directory you choose; not where the archive
creator chose.
* `-o` - Create a new archive. (Long option: `--create`).
* `-O archive` - Create the archive in file `archive` rather than printing it
to STDOUT. See `-F` for notes.
* `-p` - Pass through files and directories from STDIN to STDOUT. See _Copying
Files Between Directories_ for example usage. (Long option: `--pass-through`)
* `-t` - List the contents of an existing archive. (Long option: `--list`).
* `-u` - *U*nconditionally replace all files in the output directory with the
same names as in the archive being extracted. (Long option: `--unconditional`)
* `-v` - Display the filename of each file being processed. When used in
conjunction with `-t` the archive's contents are listed in a style similar to
that of `ls -l`. (Long option: `--verbose`)
* `-V` - Prints a period ('.') every time a file is processed. (Long option:
`--dot`).
* `--version` - Displays the `cpio` version number.

## Esoteric Options

* `-a` - Preserve the access times of files after reading them so they don't appear to have been read. (Long option: `--reset-access-time`).
* `-b` - Swap both halfwords of words and bytes of halfwords in the data.
Equivalent to -sS. Use in conjunction with `--extract` or `--list`. Use this option to
convert 32-bit integers between big-endian and little-endian machines. (Long
option: `--swap`).
* `-B` - Use a block size of 5120 bytes for I/O. Default value is 512 bytes.
* `--block-size=block-size` - Use a block size of `block-size` * 512 bytes for
I/O.
* `-c` - Use the old portable (ASCII) format for archives.
* `-C io-size` - Use `io-size` bytes for the I/O block size. (Long option:
`--io-size=io-size`)
* `--force-local` - Assume that the archive file specified by `-F`, `-I` or
`O` even if it contains a colon, i.e. even if it looks like a hostname for a
remote machine.
* `-H format` - Assume the archive is in `format` format. By default, the
archive format is automatically detected when extracting and listing, and set
to 'bin' when creating. The valid formats follow with descriptions excerpted
from the `cpio` manual:
 * _bin_ - The obsolete binary format.
 * _odc_ - The old (POSIX.1) portable format.
 * _newc_ - The new (SVR4) portable format, which supports file systems having more than 65536 i-nodes.
 * _crc_ - The new (SVR4) portable format with a checksum added.
 * _tar_ - The old tar format.
 * _ustar_ - The POSIX.1 tar format. Also recognizes GNU tar archives, which are similar but not identical.
 * _hpbin_ - The obsolete binary format used by HPUX's cpio (which stores device files differently).
 * _hpodc_ - The portable format used by HPUX's cpio (which stores device files differently). 
(Long option: `--format=format`).
* `-m` - Creates files with their original modification time. (Long option: `--preserve-modification-time`)
* `-M message` - Display `message` when `cpio` reaches the end of a volume of
backup media (e.g. a tape). The string '%d' is substituted for the current
volume number if it appears in `message`. (Long option: `--message=message`)
* `--numeric-uid-gid` - Makes `--verbose` show numeric UID and GID instead of
usernames and group names, respectively.
* `--no-preserve-owner` - Extract files so that they are owned by the user
extracting them. This is the default for non-root users.
* `--only-verify-crc` - Test the CRCs of each file in the given CRC-format
archive. Checks whether the archive is corrupt.
* `--quiet` - Don't print how many blocks were copied.
* `-r` - Before each file is extracted prompt for the filename that should be
used for extraction. (Long option: `--rename`)
* `-R owner` - When running as root and either extracting or in pass-through
mode, set the ownership of all files created to the username `owner`. When
creating archives store the files' owner as `owner`. (Long option: `--owner
owner`). In either case `owner` can be a username and group name concatenated
with a colon, in the format described for `chown`.
* `--rsh-command=command` - Instructs `cpio` to use `command` to transfer data
to/from remote devices/machines.
* `-s` -  Swap the bytes of each halfword (pair of bytes) in the files when
extracting from an archive. (Long option: `--swap-bytes`)
* `-S` - Swap the halfwords of each word (4 bytes) in files that are
extracted from an archive. (Long option: `--swap-halfwords`).
* `--sparse` - Write files with large blocks of zeros as sparse files. This
option can be used in either extraction or pass-through mode.
* `--to-stdout` - When extracting files extract them to STDOUT.

## See Also

* [GNU `cpio` Manual](http://www.gnu.org/software/cpio/manual/)
