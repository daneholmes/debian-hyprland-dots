## Hypeless

Hyprland, using Omarchy hypeless and scripts,on Debian 13.

_work in progress_

### INSTALL STEPS

#### STEP ONE: Install Hyprland

1. `git clone --depth=1 https://github.com/LinuxBeginnings/Debian-Hyprland.git ~repos/Debian-Hyprland` # _use 0.53.3_
2. `./~/repos/Debian-Hyprland/install.sh`
3. On the software selection screen add `nvidia,` `input_group,` `thunar.` Later, select Nvidia Open Drivers # _do nvidia manually_
4. Restart.

### STEP TWO: Install uwsm

1. `git clone https://github.com/Vladimir-csp/uwsm.git ~repos/uwsm`
2. `./~/repos/uwsm/build-deb.sh`

### STEP THREE: Copy hypeless

1. `git clone https://github.com/daneholmes/hypeless.git ~/.local/usr/hypeless`
2. `ln -sfn ~/.local/usr/hypeless/config/hypr ~/.config/hypr`
3. `ln -sfn ~/.local/usr/hypeless/config/kitty ~/.config/kitty`
4. `ln -sfn ~/.local/usr/hypeless/config/waybar ~/.config/waybar`
5. `ln -sfn ~/.local/usr/hypeless/config/uwsm ~/.config/uwsm`
6. `ln -sfn ~/.local/usr/hypeless/config/user-dirs.dirs ~/.config/user-dirs.dirs`
7. `ln -sfn ~/.local/usr/hypeless/config/xdg-terminals.list ~/.config/xdg-terminals.list`
8. `ln -sfn ~/.local/usr/hypeless/bin ~/.local/bin`
9. `ln -sfn ~/.local/usr/hypeless/meta ~/.meta`
10. `ln -sfn ~/.local/usr/hypeless/themes ~/.themes`
11. `ln -sfn ~/.local/usr/hypeless/.zshrc ~/.zshrc`
12. `ln -sfn ~/.local/usr/hypeless/.zshenv ~/.zshenv`

## Rest of this is notes

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
