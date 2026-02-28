## Debian Hyprland Dots
Hyprland desktop on Debian 13. *work in progress - notes & config*

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
3. Sublime - [Sublime Docs](https://www.sublimetext.com/docs/linux_repositories.html#apt)
4. `sudo apt install timeshift`
4. Zsh `sudo apt install zsh zplug`
5. eza `sudo apt install eza`
6. Enable NetworkManager and disable ifupdown.
- `sudo apt install network-manager`
- `sudo systemctl disable --now networking`
- `sudo systemctl enable --now NetworkManager`

*You may have to unbind ifupdown from your current interface if you want NetworkManager to control it.*

7. Network Manager TUI `cargo install impala-nm`
8. Bluetooth `sudo apt install bluez`
9. Bluetooth TUI `cargo install bluetui`
2. Audio TUI `cargo install wiremix`

`git config --global user.email "you@example.com"`

`git config --global user.name "Your Name"`

### Manual Configuration
`git clone -b main --depth=1 https://github.com/uiriansan/SilentSDDM`

`cd SilentSDDM/`

`sudo mkdir -p /usr/share/sddm/themes/silent`

`sudo cp -rf . /usr/share/sddm/themes/silent/`

`sudo cp -r /usr/share/sddm/themes/silent/fonts/* /usr/share/fonts/`

`sudo mkdir -p /etc/sddm.conf.d`

`sudo vi /etc/sddm.conf.d/10-silent-theme.conf`

```
[General]
InputMethod=qtvirtualkeyboard
GreeterEnvironment=QML2_IMPORT_PATH=/usr/share/sddm/themes/silent/components/,QT_IM_MODULE=qtvirtualkeyboard

[Theme]
Current=silent
```

### To-do
### Next up
2. SDDM theme -> clean this whole thing up
3. Hypridle screensaver
4. Make sddm and hyprlock look not bad together

### Way off
4. Multiple color schemes with switching
5. Firewall
