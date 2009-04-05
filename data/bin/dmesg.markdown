Displays a log of messages from the kernel.

* `dmesg` - Displays the latest messages with the newest at the end. 

The `dmesg` `man` page describes it as "print[ing] or contol[ing] the kernel
ring buffer". As a computer system runs the kernel will output various
diagnostic messages ranging from the purely informative (it's detected that
you have 4GB of RAM, you've just attached a USB flash drive) to reports of
serious problems (a key driver is malfunctioning, some process is eating up
all your resources so the kernel killed it). The 'ring buffer' part means that
only a predefined number of these messages will be displayed by `dmesg`; the
older messages will be deleted.

* `dmesg | less` - The output from `dmesg` is likely to be quite voluminous,
so pipe it through a pager, or `head` or `tail` to only view the beginning or
end, respectively.
