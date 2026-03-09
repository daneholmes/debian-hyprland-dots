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
6. ` mkdir ~/.config/omarchy/themes`
7. `cp -r ~/.local/share/omarchy/config/uwsm ~/.config/uwsm`
8. `cp -r ~/.local/share/omarchy/config/waybar ~/.config/waybar`
9. `cp -r ~/.local/share/omarchy/config/ ~/.config/btop`
10. `mkdir -p ~/.config/btop/themes`
11. `ln -sf ~/.config/omarchy/current/theme/btop.theme ~/.config/btop/themes/current.theme`
12. `pipx ensurepath`
13. `pipx install terminaltexteffects`
14. `cp ~/.local/share/omarchy/logo.txt ~/.config/omarchy/branding/screensaver.txt`
15. `cp ~/.local/share/omarchy/config/xdg-terminals.list ~/.config/xdg-terminals.list`
16. `cp ~/.local/share/omarchy/.zshrc ~/.zshrc`
17. `cp ~/.local/share/omarchy/.zshenv ~/.zshenv`
18. `cargo install wiremix`
19. `cargo install bluetui`
20. `cargo install impala`
21. `git config --global user.name "Your Name"`
22. `git config --global user.email "you@example.com"`
23. `install elephant`
24. `ln -snf ~/.local/share/omarchy/default/elephant/omarchy_themes.lua ~/.config/elephant/menus/omarchy_themes.lua`
24. `sudo apt install libgtk-4-dev & libpoppler-glib-dev & libgtk4-layer-shell-dev & protobuf-compile # walker`
25. `install walker`
26. mkdir -p ~/Pictures/Screenshots
27. mkdir -p ~/Pictures/Screen-Recordings
28. sudo pacman -S gtk4 libadwaita glib2 cairo pango gdk-pixbuf2 base-devel
29. git clone https://github.com/Satty-org/Satty.git
30. make build-release
31. PREFIX=/usr/local make install
32. sudo bash -c "$(wget -q https://pacstall.dev/q/install -O -)"
33. pacstall -I gpu-screen-recorder
34. sudo apt install v4l-utils
SDDM
1. cp -r ~/.local/share/omarchy/default/sddm/omarchy /usr/share/sddm/themes/
2. sudo nano /etc/sddm.conf
3. [Theme]
4. Current=omarchy
5. [General]
6. InputMethod=
7. sudo ln -s /usr/bin/sddm-greeter-qt6 /usr/bin/sddm-greeter



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



# TO DO
Screen recording
Waybar hyprsunset icon