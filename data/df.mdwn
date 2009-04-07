Displays filesystem and disk usage statistics.

* `df -h` - Shows the capacity and usage of all mounted filesystems,
displaying the sizes in *h*uman-readable units, e.g.

        Filesystem            Size  Used Avail Use% Mounted on
        /dev/sda5             100G  8.9G   86G  10% /
        tmpfs                 496M     0  496M   0% /lib/init/rw
        varrun                496M  108K  496M   1% /var/run
        varlock               496M     0  496M   0% /var/lock
        udev                  496M   88K  496M   1% /dev
        tmpfs                 496M   88K  496M   1% /dev/shm
        lrm                   496M  2.0M  494M   1% /lib/modules/2.6.28-11-generic/volatile

* `df -h /home` - Restricts the output above to the filesystem on which the
given directory is mounted, e.g.

        Filesystem            Size  Used Avail Use% Mounted on
        /dev/sda5             100G  8.9G   86G  10% /

* `df -h /dev/sda5` works in the same way.
