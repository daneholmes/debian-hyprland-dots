## Hypeless

Hyprland, using Omarchy dots and scripts, on Debian 13.

_work in progress_

### INSTALL STEPS

#### STEP ONE: INSTALL [HYPRLAND](https://github.com/LinuxBeginnings/Debian-Hyprland)
1. `git clone --depth=1 https://github.com/LinuxBeginnings/Debian-Hyprland.git ~repos/Debian-Hyprland` # _use v3.0.0_
2. `./install.sh`
3. On the software selection screen add `nvidia,` `sddm,` `bluetooth,` `input_group,` `thunar.` Later, select Nvidia Open Drivers
4. Restart.

I am starting to think I might want to make my own hyprland install script :(. walker and elephant have to be complied for a lot of omarchy dots to work. Elephant is easy to compile, walker is a bit of a pain. There is a lot of unnecessary software baked into this script rofi, swww, etc.

#### STEP TWO: INSTALL [USWM](https://github.com/Vladimir-csp/uwsm)
1. `git clone https://github.com/Vladimir-csp/uwsm.git ~repos/uwsm`
2. `./build-deb.sh -i`

#### STEP THREE: COPY HYPELESS CONFIG
1. `sudo apt install xdg-terminal-exec zsh zplug eza swaybg swayosd pipx`
2. `git clone https://github.com/daneholmes/hypeless.git ~/.local/share/omarchy`
3. `cp -r ~/.local/share/omarchy/config/hypr ~/.config/hypr`
4. `cp -r ~/.local/share/omarchy/config/kitty ~/.config/kitty`
5. `cp -r ~/.local/share/omarchy/config/omarchy ~/.config/omarchy`
6. `cp -r ~/.local/share/omarchy/config/uwsm ~/.config/uwsm`
7. `cp -r ~/.local/share/omarchy/config/waybar ~/.config/waybar`
8. `cp -r ~/.local/share/omarchy/config/ ~/.config/btop`
9. `mkdir -p ~/.config/btop/themes`
10. `ln -sf ~/.config/omarchy/current/theme/btop.theme ~/.config/btop/themes/current.theme`
11. `pipx ensurepath`
12. `pipx install terminaltexteffects`
13. `cp ~/.local/share/omarchy/logo.txt ~/.config/omarchy/branding/screensaver.txt`
14. `cp ~/.local/share/omarchy/config/xdg-terminals.list ~/.config/xdg-terminals.list`
15. `cp ~/.local/share/omarchy/.zshrc ~/.zshrc`
16. `cp ~/.local/share/omarchy/.zshenv ~/.zshenv`
17. `cargo install wiremix`
18. `cargo install bluetui`
19. `cargo install impala`
20. `git config --global user.name "Your Name"`
21. `git config --global user.email "you@example.com"`

#### Hyprland Applications
- Authentication agent: hyprpolkit agent `systemctl --user enable hyprpolkitagent`
- Terminal: kitty
- Wallpaper: swaybg
- Notification Daemon: swaynotificationcenter
- Application launcher: rofi
- File manager: thunar
- Pipewire: pipewire
- XDG Desktop Portal: xdg-desktop-portal-hyprland
- Status bar / shell: waybar
- Clipboard: wl-copy

#### Manual Configuration
- `sudo apt install network-manager`
- `sudo systemctl disable --now networking`
- `sudo systemctl enable --now NetworkManager`
- `sudo apt install iwd` _[ref.](https://wiki.debian.org/NetworkManager/iwd)_
- `sudo mkdir -p /etc/NetworkManager/conf.d`
- `printf '[device]\nwifi.backend=iwd\n' | sudo tee /etc/NetworkManager/conf.d/wifi_backend.conf > /dev/null'`
- `sudo systemctl enable --now iwd`
- `sudo systemctl restart NetworkManager`
