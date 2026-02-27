## Debian Hyprland Dots
Hyprland desktop on Debian 13 that looks like Omarchy.

### Installation Pt. 1 - Hyprland
1. `sudo apt install git`
2. `mkdir -p ~/System/Repos && cd ~/System/Repos`
4. `git clone --depth=1 https://github.com/LinuxBeginnings/Debian-Hyprland.git Debian-Hyprland` *[Read More](https://github.com/LinuxBeginnings/Debian-Hyprland)*
5. `cd Debian-Hyprland/`
6. `chmod +x install.sh`
7. `./install.sh`
8. On the software selection screen add `nvidia,` `input_group,` and `sddm.` Then complete the installation.

### Hyprland Applications
- Authentication agent: hyprpolkit agent `systemctl --user enable hyprpolkitagent`
- Terminal: kitty
- Wallpaper: swww
- Notification Daemon: swaynotificationcenter
- Application launcher: hyprlauncher
- File manager: nautilus `sudo apt instsall -y nautilus`
- Pipewire: pipewire `sudo apt install -y pipewire`
- XDG Desktop Portal: xdg-desktop-portal-hyprland
- Status bar / shell: waybar
- Clipboard: wl-copy

### Software to install
1. Hyprland - [LinuxBeginnings/Debian-Hyprland]()
2. Firefox - [Read More](https://support.mozilla.org/en-US/kb/install-firefox-linux#w_install-firefox-deb-package-for-debian-based-distributions-recommended)
3. ZSH `sudo apt install zsh zplug`
4. EZA `sudo apt install eza`
5. TUIs `cargo install bluetui`, `cargo install wiremix`, `cargo install impala-nm`
