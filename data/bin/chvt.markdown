Switch to another virtual terminal.

* `chvt N` - Switches to terminal number `N`, where `number` is
usually between 1 and 7. On most systems you can achieve the same affect with
<Ctrl>+<Alt><FN>, e.g. <Ctrl>+<Alt>+<F2>.
* The actual terminal brought to the foreground is `/dev/ttyN`.
* Terminals can be deallocated with `deallocvt`, e.g. `deallocvt N`.
* The terminal's output can be captured to a text file with `sudo cat /dev/vcsN
>Ndump.txt`.
