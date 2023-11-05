# Install of SDDM

## Packages install

* Cloning my `arch_install` repository

* Run `pacman -S --needed - < arch_install/packages_list/login_manager.pacman.list`

## Configuration

* Cloning catppuccin sddm configuration repository: `git clone https://github.com/catppuccin/sddm.git`

* Copying the catppuccin's theme in `/usr/share/sddm/themes/`

* Copying default SDDM's default configuration file from `/usr/lib/sddm/sddm.conf.d/default.conf` into `/etc/sddm.conf.d/default.conf`

* Configuring the theme with the catppuccin's theme folder name

## Running

* Run `systemctl enable sddm` and restart
