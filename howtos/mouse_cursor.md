# Mouse cursors

## Loading icon after opening xterm

Right after opening xterm, my cursor was always displaying a "loading" cursor.

After installing `xfce4-terminal`, it's gone

## Configuring mouse cursor in SDDM

As we're not logged in when we're displaying SDDM, the default theme for the
mouse cursor is the one used in `/usr/share/icons/default/index.theme`.

Copying my mouse cursor theme in `/usr/share/icons` and setting it up as the
default theme fixed it.
