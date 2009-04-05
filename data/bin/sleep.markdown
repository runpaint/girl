Waits for the given time, then exits.

* `sleep 3600` - Waits for sixty minutes, then exits.
* `sleep 60m` - As above: the 'm' suffix indicates that the unit is *m*inutes. 
* `sleep 1h` - As above: the 'h' suffix indicates *h*ours.
* `sleep 1.5d` - Waits for one and a half days, then exits: the 'd' suffix
indicates days.

For example, `sleep 1h && command` - Runs `command` in an hour's time.
