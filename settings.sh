# kitty theme
kitty +kitten themes --reload-in=all Rosé Pine

# set brave as default browser
xdg-settings set default-web-browser brave-browser.desktop
xdg-mime default brave-browser.desktop x-scheme-handler/http
xdg-mime default brave-browser.desktop x-scheme-handler/https

# other default applications
xdg-mime default yazi.desktop inode/directory
xdg-mime default feh.desktop image/png
xdg-mime default feh.desktop image/jpg
xdg-mime default zathura.desktop application/pdf

update-desktop-database ~/.local/share/applications

# # i3 theme
# i3-style purple -o ~/.dotfiles/i3/config --reload
#
# # ranger icons
# git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.appdata/ranger_devicons
# mkdir ~/.dotfiles/ranger/plugins
# ln -sf ~/.appdata/ranger_devicons ~/.dotfiles/ranger/plugins/ranger_devicons
