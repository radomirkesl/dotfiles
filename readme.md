# Dotfiles

## Guideline:

1. Git clone this repo INTO YOUR HOME DIRECTORY.
2. Install packages.
3. Run scripts.
4. Enable services.
5. Check machine-dependent settings.

## Packages:

### Install with package manager if possible:

- X: xorg-server xorg-init xorg-xrdb xorg-xrandr (xf86-video-intel might be necessary)
- I3-WM: i3-wm i3blocks i3lock i3status
- Sound: alsa-utils pulseaudio pulsemixer pulseaudio-alsa pulseaudio-bluetooth
- Fonts: ttf-3270-nerd ttf-mononoki-nerd ttf-terminus-nerd (if not available, run fonts.sh)
- Tools: git ranger nvim sl kitty firefox neofetch ncspot zathura zathura-pdf-mupdf lsd openssh zip unzip npm python python-pip man texlive xdg-utils bluez dbus networkmanager discord wget ripgrep fd biber xdotool xclip jdk-openjdk pandoc deno texlive-babel-czech htop highlight

1-command installation for Arch:

```bash
sudo pacman -S xorg-server xorg-init xorg-xrdb xorg-xrandr xf86-video-intel i3-wm i3blocks i3lock i3status git ranger nvim sl kitty tmux firefox neofetch ncspot zathura lsd ttf-3270-nerd ttf-mononoki-nerd ttf-terminus-nerd openssh zip unzip npm python python-pip alsa-util spulseaudio pulsemixer pulseaudio-alsa pulseaudio-bluetooth man texlive zathura-pdf-mupdf xdg-utils bluez dbus networkmanager discord wget ripgrep fd biber xdotool python-pillow python-pynvim python-dbus xclip jdk-openjdk pandoc deno texlive-babel-czech htop highlight
```

### Other packages:

- [yay](https://github.com/Jguer/yay)

    ```bash
    yay -S brave wmenu bluetuith
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

## Scripts and services:

- Run link.sh to symlink config files.
- Run settings.sh to set up details.
- Enable system services for BlueTooth and NetworkManager.

```bash
sh link.sh
sh settings.sh
systemctl enable bluetooth NetworkManager
```

Note that enabling bt on boot might not be the safest.

## Machine-dependent settings:

- Selecting the right keyboard model (syst/keyboard.conf) might for example make some special keys work.
- Touchpad sensitivity and similar properties (syst/touchpad.conf) might be off. In that case using Synaptics instead of libinput might be necessary.

## Other stuff:

- Setting go path:

```bash
go env -w GOPATH=~/.go
```

