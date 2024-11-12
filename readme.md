# Dotfiles

## Guideline:

1. Install packages.
2. Git clone this repo INTO YOUR HOME DIRECTORY.
3. Run GNU Stow.
4. Run scripts.
5. Enable services.
6. Check machine-dependent settings.
7. Use nwg-look to set GTK theme.

## Packages:

### Install with package manager if possible:

- Sound: alsa-utils pulseaudio pulsemixer pulseaudio-alsa pulseaudio-bluetooth pamixer
- Fonts: ttf-3270-nerd ttf-mononoki-nerd ttf-terminus-nerd (if not available, run fonts.sh)
- Hyprland: hyprland pipewire wireplumber qt5-wayland qt6-wayland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk dunst polkit-kde-agent mako waybar freetype2 harfbuzz cairo pango wayland libxkbcommon meson scdoc wayland-protocols cliphist grim slurp greetd greetd-tuigreet hypridle hyprlock brightnessctl
- Tools: git ranger nvim sl kitty firefox neofetch ncspot zathura zathura-pdf-mupdf eza openssh zip unzip npm python python-pip man texlive xdg-utils bluez dbus networkmanager discord wget ripgrep fd biber xdotool xclip jdk-openjdk pandoc deno texlive-babel-czech btop highlight dnsutils ascii ntp imagemagick yazi ffmpegthumbnailer unarchiver jq poppler fd ripgrep fzf zoxide syncthing wiki-tui zellij cryfs zoxide nwg-look bat starship

1-command installation for Arch:

```bash
sudo pacman -S hyprland pipewire wireplumber qt5-wayland qt6-wayland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk dunst polkit-kde-agent mako waybar alsa-utils pulseaudio pulsemixer pulseaudio-alsa pulseaudio-bluetooth pamixer ttf-3270-nerd ttf-mononoki-nerd ttf-terminus-nerd git ranger nvim sl kitty firefox neofetch ncspot zathura zathura-pdf-mupdf eza openssh zip unzip npm python python-pip man texlive xdg-utils bluez dbus networkmanager discord wget ripgrep fd biber xdotool xclip jdk-openjdk pandoc deno texlive-babel-czech btop highlight dnsutils ascii ntp freetype2 harfbuzz cairo pango wayland libxkbcommon meson scdoc wayland-protocols cliphist grim slurp greetd greetd-tuigreet hypridle hyprlock brightnessctl imagemagick yazi ffmpegthumbnailer unarchiver jq poppler fd ripgrep fzf zoxide syncthing wiki-tui zellij cryfs zoxide nwg-look bat starship
```

### Other packages:

- [yay](https://github.com/Jguer/yay)

    ```bash
    yay -S brave wmenu bluetuith tofi swww satty otf-openmoji anyrun-git rose-pine-gtk-theme-full phinger-cursors gurk-git rose-pine-cursor rose-pine-hyprcursor
    ```

- [rust](https://rustup.rs)

    ```bash
    cargo install sccache
    ```

- python packages

    ```bash
    pip install --user --upgrade pillow pynvim dbus
    ```

    - Pip might cause conflicts on system-wide installs, checkout other options. On Arch many python packages are accessible via pacman. They are already included in the 1-command installation.

- npm

    ```bash
    sudo npm install -g neovim
    ```
## Stow:

```bash
cd dotfiles
stow --dotfiles .
```

## Scripts and services:

- Run settings.sh to set up details.
- Run link.sh in greetd, electron and xorg if using that stuff.
- Enable system services for BlueTooth, NetworkManager,  ntpdate (time sync on boot), greetd, syncthing, ...

```bash
sh settings.sh
sh greetd/link.sh
sh electron/link.sh
sh xorg/link.sh
# --now starts the services immediately, unless they are already running
systemctl enable bluetooth NetworkManager ntpdate.service greetd.service syncthing@kera.service --now
```

Note that enabling bt on boot might not be the safest.

## Machine-dependent settings:

- Selecting the right keyboard model (syst/keyboard.conf) might for example make some special keys work.
- Touchpad sensitivity and similar properties (syst/touchpad.conf) might be off. In that case using Synaptics instead of libinput might be necessary.
- While using hyprland configure these in hypr/hyprland.conf.

## Other stuff:

- Setting go path:

```bash
go env -w GOPATH=~/.go
```

