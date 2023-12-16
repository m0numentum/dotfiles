# Configuring custom GTK theme

After installing catppuccin's gtk theme, we have to configure the theme in our own GTK configuration directory.

First, we have to select the theme. They are all installed in the `/usr/share/themes` directory.

## GTK4

Next, we're executing the following commands:

* `ln -sf /usr/share/themes/<THEME NAME>/gtk-4.0/assets ${HOME/.config/gtk-4.0/assets`

* `ln -sf /usr/share/themes/<THEME NAME>/gtk-4.0/gtk.css ${HOME/.config/gtk-4.0/gtk.css`

* `ln -sf /usr/share/themes/<THEME NAME>/gtk-4.0/gtk-dark.css ${HOME/.config/gtk-4.0/gtk-dark.css`

## GTK3

We have to create a settings file in our gtk3 directory:

```
[Settings]
gtk-icon-theme-name = Papirus-Dark
gtk-theme-name = <THEME NAME>
```
