Copies a specified number of bytes or blocks, optionally performing on-the-fly
byte order conversions, or converting between data formats.

*Warning*: `dd` is very dangerous. Mix up the arguments for `if` and `of`, for
example, and you could delete the entire contents of your hard disk.

## Create a Disk Image from a Device / Clone a Device

* Note: to access devices directly you need to be root or `sudo`.
* `dd if=device of=image bs=blocks` - Creates a low-level copy of `device` and
stores it in `image`, using a block size of `block`. For example `dd
if=/dev/cdrom of=cd.iso bs=2k` creates an ISO of the CD in the drive name
`/dev/cdrom` using 2k blocks.
* Adding `conv=sync,noerror` to the `dd` options tells `dd` that if it can't
read a particular block from the device it should still attempt to write
something of the same length to the image file. In other words, it helps
protect against disk errors. For example, `dd if=/dev/hda of=image
conv=sync,noerror`.
* Similarly, you can use this syntax to clone one disk or partition to another. For
example, `dd if=/dev/sda of=/dev/sdb` creates an exact copy of disk `/dev/sda`
on disk `/dev/sdb`. Again, this will erase the contents of `/dev/sdb` so be
careful.
* In either case you may want to compress your disk images by piping them
through `bzip2`, e.g. `dd if=/dev/sdb | bzip2 >usb-stick.iso.bz2`. Note: this
will take a considerable amount of time.
* `dd if=/dev/hda of=hda.mbr bs=512 count=1` - Backup the master boot record
from `/dev/hda` to `hda.mbr`. This works because the MBR and the primary
partition information is located in the first 512 bytes and `dd` uses a block
size of 512 and a count of 1, i.e. it copies the first 512 bytes.

## Restore from a Disk Image

Having created a disk image above you can also use `dd` to restore it. That
is, to copy the image file to another disk

* `dd if=hard-disk.iso of/dev/sda` - Replaces the contents of '/dev/sda` with
`hard-disk.iso`. `/dev/sda` will now be an exact clone of the drive
`hard-disk.iso` was created from.
  
## Wipe an Entire Disk with Random Data

 * `dd if=/dev/urandom of=device` - Overwrites the contents of `device` with
random data obtained from the `/dev/urandom` device. For example: `dd
if=/dev/urandom of=/dev/hda` wipes the hard disk at `/dev/hda`.


## Create an Empty File of a Given Size

* `dd if=/dev/zero of=file bs=block_size count=num_blocks` - Reads zeroes from
the special device `/dev/zero` for `num_blocks` `block_size` blocks and writes
the data to `file`. For example, `dd if=/dev/zero of=1gb bs=1000
count=1000000` creates a file, `1gb`, of 1GB in size filled with zeros.

## Expand an Existing File to a Given Size

* `dd if=/dev/zero of=file bs=1 count=0 seek=1MB` - Expand `file` to 1MB in
size by padding it with zeros from `/dev/zero`. Note the file is appended to
so its original contents is not overwritten.


## Monitoring a Long Running Operation

If you're copying a lot of data with `dd` it can be useful to check its
progress. You can do this by running `dd` as a background task, then sending
it a `USR1` signal. Upon receiving this `dd` will display statistics about
the current job and then resume work. For example:

    $ sudo dd if=/dev/sdd of=/sdd.iso& pid=$!
    $ sudo kill -USR1 $pid
    85263+0 records in
    85263+0 records out
    43654656 bytes (44 MB) copied, 5.16925 s, 8.4 MB/s
   

