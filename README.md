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

### Things to install
1. Hyprland - [LinuxBeginnings/Debian-Hyprland]()
- `cargo install bluetui`
- `cargo install wiremix`
- `cargo install impala-nm`
- `sudo apt install btop`
