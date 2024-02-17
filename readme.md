# Dotfiles

## Guideline:

1. Git clone this repo INTO YOUR HOME DIRECTORY.
2. Install packages.
3. Run scripts.
4. Enable services.
5. Check machine-dependent settings.

## Packages:

### Install with package manager if possible:

- Sound: alsa-utils pulseaudio pulsemixer pulseaudio-alsa pulseaudio-bluetooth pamixer
- Fonts: ttf-3270-nerd ttf-mononoki-nerd ttf-terminus-nerd (if not available, run fonts.sh)
- Hyprland: hyprland pipewire wireplumber qt5-wayland qt6-wayland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk dunst polkit-kde-agent mako waybar freetype2 harfbuzz cairo pango wayland libxkbcommon meson scdoc wayland-protocols cliphist grim vulkan-driver greetd greetd-tuigreet
- Tools: git ranger nvim sl kitty firefox neofetch ncspot zathura zathura-pdf-mupdf lsd openssh zip unzip npm python python-pip man texlive xdg-utils bluez dbus networkmanager discord wget ripgrep fd biber xdotool xclip jdk-openjdk pandoc deno texlive-babel-czech btop highlight dnsutils ascii ntp

1-command installation for Arch:

```bash
sudo pacman -S hyprland pipewire wireplumber qt5-wayland qt6-wayland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk dunst polkit-kde-agent mako waybar alsa-utils pulseaudio pulsemixer pulseaudio-alsa pulseaudio-bluetooth pamixer ttf-3270-nerd ttf-mononoki-nerd ttf-terminus-nerd git ranger nvim sl kitty firefox neofetch ncspot zathura zathura-pdf-mupdf lsd openssh zip unzip npm python python-pip man texlive xdg-utils bluez dbus networkmanager discord wget ripgrep fd biber xdotool xclip jdk-openjdk pandoc deno texlive-babel-czech btop highlight dnsutils ascii ntp freetype2 harfbuzz cairo pango wayland libxkbcommon meson scdoc wayland-protocols cliphist grim vulkan-driver greetd greetd-tuigreet

```

### Other packages:

- [yay](https://github.com/Jguer/yay)

    ```bash
    yay -S brave wmenu bluetuith tofi swww
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
- Enable system services for BlueTooth, NetworkManager and ntpdate (time sync on boot).

```bash
sh link.sh
sh settings.sh
systemctl enable bluetooth NetworkManager ntpdate.service greetd.service
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

