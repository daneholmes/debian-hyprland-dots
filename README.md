## Debian Hyprland Dots
Hyprland desktop on Debian 13 that looks like Omarchy. Work in progress.

### Install Hyprland
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
- Application launcher: rofi
- File manager: nautilus `sudo apt instsall nautilus`
- Pipewire: pipewire `sudo apt install pipewire`
- XDG Desktop Portal: xdg-desktop-portal-hyprland
- Status bar / shell: waybar
- Clipboard: wl-copy

### Install Software
1. Hyprland - [LinuxBeginnings/Debian-Hyprland](https://github.com/LinuxBeginnings/Debian-Hyprland)
2. Firefox - [Mozilla Support](https://support.mozilla.org/en-US/kb/install-firefox-linux#w_install-firefox-deb-package-for-debian-based-distributions-recommended)
3. Zsh `sudo apt install zsh zplug`
4. eza `sudo apt install eza`
5. Enable NetworkManager and disable ifupdown.
- `sudo apt install network-manager`
- `sudo systemctl disable --now networking`
- `sudo systemctl enable --now NetworkManager`

*You may have to unbind ifupdown from your current interface if you want NetworkManager to control it.*

6. Network Manager TUI `cargo install impala-nm`
7. Bluetooth `sudo apt install bluez`
8. Bluetooth TUI `cargo install bluetui`
9. Audio TUI `cargo install wiremix`

`git config --global user.email "you@example.com"`
`git config --global user.dane "Your Name"`

### To-do
### Setup
2. SDDM theme
3. Hypridle, proper sleep, and screensaver
4. Multiple color schemes with switching
5. Firewall
