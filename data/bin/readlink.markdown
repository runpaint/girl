Shows the target of a symbolic link (symlink).

* `readlink link` - Shows the filename that symlink `link` links to. For
example, if you create a link with `ln -s target link`, then `readlink link`
will display `target`. Note: `readlink` does not operate on hardlinks.
