# Dotfiles

## Guideline:

1. git clone this repo
2. install packages
3. run scripts
4. enable services

### Packages:

#### Install with package manager if possible:

- X: xorg-server xorg-init xorg-xrdb (xf86-video-intel might be necessary)
- I3-WM: i3-wm i3blocks i3lock i3status
- Sway: sway swaylock swayidle swaybg
- Sound: alsa-utils pulseaudio pulsemixer pulseaudio-alsa pulseaudio-bluetooth
- Fonts: ttf-3270-nerd ttf-mononoki-nerd ttf-terminus-nerd (if not available, run fonts.sh)
- Tools: git ranger nvim sl kitty firefox neofetch ncspot zathura zathura-pdf-mupdf lsd openssh zip unzip npm python python-pip man texlive xdg-utils bluez dbus networkmanager

1-command install for arch:
```bash
sudo pacman -S xorg-server xorg-init xorg-xrdb xf86-video-intel i3-wm i3blocks i3lock i3status git ranger nvim sl kitty tmux firefox neofetch ncspot zathura lsd ttf-3270-nerd ttf-mononoki-nerd ttf-terminus-nerd openssh zip unzip npm python python-pip sway swaylock swayidle swaybg alsa-util spulseaudio pulsemixer pulseaudio-alsa pulseaudio-bluetooth man texlive zathura-pdf-mupdf xdg-utils bluez dbus networkmanager
```

#### Other packages:

- yay (github.com/Jguer/yay)
    ```bash
    yay -S brave wmenu bluetuith
    ```
- rust (rustup.rs)
    ```bash
    cargo install sccache
    ```
- pip
    ```bash
    pip install pillow
    ```

### Other steps:

- run link.sh to symlink config files
- run settings.sh to set up details
- enable system services for BlueTooth and NetworkManager

```bash
sh link.sh
sh settings.sh
systemctl enable bluetooth NetworkManager
```

Note that enabling bt on boot might not be the safest.

