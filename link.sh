# Program config folders

ln -sf ~/.dotfiles/ranger ~/.config/
ln -sf ~/.dotfiles/nvim ~/.config/
ln -sf ~/.dotfiles/kitty ~/.config/
ln -sf ~/.dotfiles/i3 ~/.config/
ln -sf ~/.dotfiles/ncspot ~/.config/

# Bash config
ln -sf ~/.dotfiles/bash/.bash* ~/

# Git and Xorg config

ln -sf ~/.dotfiles/syst/.xinitrc ~/
ln -sf ~/.dotfiles/syst/.gitconfig ~/
ln -sf ~/.dotfiles/syst/.Xresources ~/

# Alternative desktop file for ranger

ln -sf ~/.dotfiles/syst/ranger.desktop ~/.local/share/applications/ranger.desktop

# Xorg config files

sudo ln -sf ~/.dotfiles/syst/touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
sudo ln -sf ~/.dotfiles/syst/keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
