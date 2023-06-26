# ranger icons
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.appdata/ranger_devicons
mkdir ~/.dotfiles/ranger/plugins
ln -sf ~/.appdata/ranger_devicons ~/.dotfiles/ranger/plugins/ranger_devicons

# kitty theme
kitty +kitten themes --reload-in=all Rosé Pine

# i3 theme
i3-style purple -o ~/.dotfiles/i3/config --reload

# set brave as default browser
xdg-settings set default-web-browser brave-browser.desktop
xdg-mime default brave-browser.desktop x-scheme-handler/http
xdg-mime default brave-browser.desktop x-scheme-handler/https

# set ranger as default file manager
xdg-mime default ranger.desktop inode/directory
update-desktop-database ~/.local/share/applications

