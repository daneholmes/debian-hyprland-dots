## Debian Hyprland Dots
Hyprland desktop on Debian 13. *work in progress - notes & config*

### Install Hyprland
1. `sudo apt install git`
2. `mkdir -p ~/System/Repos && cd ~/System/Repos`
4. `git clone --depth=1 https://github.com/LinuxBeginnings/Debian-Hyprland.git Debian-Hyprland` *[Read More](https://github.com/LinuxBeginnings/Debian-Hyprland)*
5. `cd Debian-Hyprland/`
6. `chmod +x install.sh`
7. `./install.sh`
8. On the software selection screen add `nvidia,` `input_group,` `thunar,`and ` sddm.` Then complete the installation.

### Manually Setup Up Config
`ln -sfn ~/Repos/dots/config/hypr ~/.config/hypr`

`ln -sfn ~/Repos/dots/config/kitty ~/.config/kitty`

`ln -sfn ~/Repos/dots/config/waybar ~/.config/waybar`

`ln -sfn ~/Repos/dots/config/user-dirs.dirs ~/.config/user-dirs.dirs`

`ln -sfn ~/Repos/dots/config/xdg-terminals.list ~/.config/xdg-terminals.list`

`ln -sfn ~/Repos/dots/bin ~/.local/bin`

`chmod +x ~/Repos/dots/bin/*`

`ln -sfn ~/Repos/dots/meta ~/.meta`

`ln -sfn ~/Repos/dots/themes ~/.themes`

`ln -sfn ~/Repos/dots/.zshrc ~/.zshrc`

`ln -sfn ~/Repos/dots/.zshenv ~/.zshenv`

### Hyprland Applications
- Authentication agent: hyprpolkit agent `systemctl --user enable hyprpolkitagent`
- Terminal: kitty
- Wallpaper: swaybg
- Notification Daemon: swaynotificationcenter
- Application launcher: rofi
- File manager: thunar
- Pipewire: pipewire `sudo apt install pipewire`
- XDG Desktop Portal: xdg-desktop-portal-hyprland
- Status bar / shell: waybar
- Clipboard: wl-copy

### Install Software
1. [UWSM](https://github.com/Vladimir-csp/uwsm) - Use the shell script
2. [Hyprland](https://github.com/LinuxBeginnings/Debian-Hyprland) - Use the shell script
3. [Firefox](https://support.mozilla.org/en-US/kb/install-firefox-linux#w_install-firefox-deb-package-for-debian-based-distributions-recommended)
4. [Sublime](https://www.sublimetext.com/docs/linux_repositories.html#apt)
5. SwagBg (Backgrounds) `sudo apt isntall swaybg`
6. TimeShift `sudo apt install timeshift`
7. Zsh and Zplug `sudo apt install zsh zplug`
8. eza (alias ls) `sudo apt install eza`
9. Sway OSD (notification) `sudo apt install swayosd`
10. Enable NetworkManager and disable ifupdown.
- `sudo apt install network-manager`
- `sudo systemctl disable --now networking`
- `sudo systemctl enable --now NetworkManager`

### Manual Configuration
1. `git config --global user.email "you@example.com"`
2. `git config --global user.name "Your Name"`
3. Network Manager TUI `cargo install impala-nm`
4. Bluetooth `sudo apt install bluez`
5. Bluetooth TUI `cargo install bluetui`
6. Audio TUI `cargo install wiremix`
