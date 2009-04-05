Attaches the filesystem of a device to the system's filesystem.

* `mount device` - Attaches `device` to the fileystem in the manner specified in `/etc/fstab`. `device` must be
listed in `/etc/fstab` for this to work. For example: `mount /dev/sda`.
* `mount mountpoint` - As above, but the mount point (a directory in the filesystem) is given instead of the
device. `mountpoint` must already exist. For example, `mount /media/usbstick`.  
* `mount -t type device mountpoint` - Mounts `device` to `mountpoint` using a filesystem of type `type`. If
`type` isn't given, the `mount` tries to guess the filesystem type. For
example:
 * `mount /dev/cdrom /media/cdrom` - The filesystem on `/dev/cdrom` is made accessible from `/media/cdrom`. The
filesystem type ('iso9660' in this case) is guessed.
 * `mount -t vfat /dev/sdb1 ~/flashdisk` - The filesystem on `/dev/sdb1` is mounted at the 'flashdisk'
sub-directory of the user's home directory as a 'vfat' (FAT32, the Windows format used on USB flash
disks) fileystem. 
* `mount -a` - Mounts all filesystems in `/etc/fstab`. Optionally, `mount -a -t type` mounts listed filesystems
with type `type`.

[TODO: Explain the easiest way to find the device name of a piece of hardware].
