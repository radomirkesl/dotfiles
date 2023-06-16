# Program config folders

ln -sf ~/.dotfiles/ranger ~/.config/
ln -sf ~/.dotfiles/nvim ~/.config/
ln -sf ~/.dotfiles/kitty ~/.config/
ln -sf ~/.dotfiles/i3 ~/.config/

# System config files

ln -sf ~/.dotfiles/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.bash_aliases ~/.bash_aliases
ln -sf ~/.dotfiles/.bash_logout ~/.bash_logout
ln -sf ~/.dotfiles/.xinitrc ~/.xinitrc
ln -sf ~/.dotfiles/.Xresources ~/.Xresources

# Alternative desktop file for ranger

ln -sf ~/.dotfiles/ranger.desktop ~/.local/share/applications/ranger.desktop

# Xorg config files

sudo ln -sf ~/.dotfiles/touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
sudo ln -sf ~/.dotfiles/keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
