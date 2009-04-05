Creates either hard of symbolic (soft) links between files.

## Hard Links

A hard link is a way of giving a file multiple names without storing its
contents in multiple places. 

A file is not deleted until all hard links pointing to it have been deleted
_and_ it has been deleted itself. Directories can't be hard linked, although
sometimes root can override this restriction.

* `ln target name` - Creates a hard link called `name` which points to
`target`. Note:
 * `target` must already exist.
 * `name` can't already exist.

## Symbolic Links (Symlinks)

Symlinks differ from hardlinks in that they continue to exist when their
target is deleted, and they can be created to point to directories. If you
view a directory holding a symlink with `ls -ll` it is displayed in the form
'link -> target'.

* `ln -s target name` - Creates a symlink from `name` to `target`, with the
same caveats as above. 
