# Program config folders

ln -sf ~/.dotfiles/ranger ~/.config/
ln -sf ~/.dotfiles/nvim ~/.config/
ln -sf ~/.dotfiles/kitty ~/.config/
ln -sf ~/.dotfiles/i3 ~/.config/
ln -sf ~/.dotfiles/ncspot ~/.config/
ln -sf ~/.dotfiles/hypr ~/.config/
ln -sf ~/.dotfiles/electron/electron-flags.conf ~/.config/electron22-flags.conf
ln -sf ~/.dotfiles/electron/electron-flags.conf ~/.config/electron23-flags.conf
ln -sf ~/.dotfiles/electron/electron-flags.conf ~/.config/electron24-flags.conf
ln -sf ~/.dotfiles/electron/electron-flags.conf ~/.config/electron25-flags.conf
ln -sf ~/.dotfiles/electron/electron-flags.conf ~/.config/electron26-flags.conf
ln -sf ~/.dotfiles/electron/electron-flags.conf ~/.config/electron27-flags.conf
ln -sf ~/.dotfiles/electron/electron-flags.conf ~/.config/electron28-flags.conf

# Bash config
ln -sf ~/.dotfiles/bash/.bash* ~/

# Git and Xorg config

ln -sf ~/.dotfiles/syst/.xinitrc ~/
ln -sf ~/.dotfiles/syst/.gitconfig ~/
ln -sf ~/.dotfiles/syst/.Xresources ~/

# Alternative desktop files

ln -sf ~/.dotfiles/desktop/* ~/.local/share/applications/

# Xorg config files

sudo ln -sf ~/.dotfiles/syst/touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
sudo ln -sf ~/.dotfiles/syst/keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
