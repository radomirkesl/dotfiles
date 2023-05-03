# Work in progress

# nerd fonts
git clone https://github.com/ryanoasis/nerd-fonts.git ~/appdata/nerd-fonts
sh ~/appdata/nerd-fonts/install.sh

# ranger icons
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/appdata/ranger_devicons
ln -s ~/appdata/ranger_devicons ~/.dotfiles/ranger/plugins/ranger_devicons
# echo "default_linemode devicons" >> ~/.config/ranger/rc.conf

# kitty theme
kitty +kitten themes --reload-in=all Rosé Pine Moon

