#!/bin/bash
set -euo pipefail

#################################
### HYPELESS BOOTSTRAP SCRIPT ###
#################################

OMARCHY_DIR="${OMARCHY_DIR:-$HOME/.local/share/omarchy}"
OMARCHY_CONFIG_DIR="$OMARCHY_DIR/config"
TARGET_CONFIG_DIR="$HOME/.config"

usage() {
	cat <<'EOF'
Usage: ./script.sh [options]

Options:
  --name "Full Name"      Git user.name
  --email you@domain.tld  Git user.email
  -h, --help              Show help
EOF
}

# --- flag parsing ---
GIT_NAME_FLAG=""
GIT_EMAIL_FLAG=""

while (($#)); do
	case "$1" in
	--name=*)
		GIT_NAME_FLAG="${1#*=}"
		shift
		;;
	--name)
		shift
		[[ $# -gt 0 ]] || die "--name requires a value"
		GIT_NAME_FLAG="$1"
		shift
		;;
	--email=*)
		GIT_EMAIL_FLAG="${1#*=}"
		shift
		;;
	--email)
		shift
		[[ $# -gt 0 ]] || die "--email requires a value"
		GIT_EMAIL_FLAG="$1"
		shift
		;;
	-h | --help)
		usage
		exit 0
		;;
	*)
		die "Unknown argument: $1 (try --help)"
		;;
	esac
done

# --- git global config ---
GIT_NAME="${GIT_NAME_FLAG:-${GIT_NAME:-Your Name}}"
GIT_EMAIL="${GIT_EMAIL_FLAG:-${GIT_EMAIL:-you@example.com}}"

# --- helpers ---
log() { printf '%s\n' "==> $*"; }
warn() { printf '%s\n' "WARN: $*" >&2; }
die() {
	printf '%s\n' "ERROR: $*" >&2
	exit 1
}

need_cmd() { command -v "$1" >/dev/null 2>&1 || die "Missing command: $1"; }

backup_if_exists() {
	local p="$1"
	if [[ -e "$p" && ! -L "$p" ]]; then
		local ts
		ts="$(date +%Y%m%d-%H%M%S)"
		log "Backing up $p -> $p.bak.$ts"
		mv "$p" "$p.bak.$ts"
	fi
}

copy_dir() {
	local src="$1" dst="$2"
	[[ -d "$src" ]] || die "Source directory not found: $src"
	mkdir -p "$(dirname "$dst")"
	backup_if_exists "$dst"
	log "Copying $src -> $dst"
	cp -a "$src" "$dst"
}

copy_file() {
	local src="$1" dst="$2"
	[[ -f "$src" ]] || die "Source file not found: $src"
	mkdir -p "$(dirname "$dst")"
	if [[ -e "$dst" && ! -L "$dst" ]]; then
		backup_if_exists "$dst"
	fi
	log "Copying $src -> $dst"
	cp -a "$src" "$dst"
}

append_if_missing() {
	local file="$1" line="$2"
	mkdir -p "$(dirname "$file")"
	touch "$file"
	if ! grep -Fqx "$line" "$file"; then
		log "Appending to $file: $line"
		printf '%s\n' "$line" >>"$file"
	else
		log "Already present in $file: $line"
	fi
}

# --- preflight ---
log "Preflight checks"
[[ -d "$OMARCHY_DIR" ]] || die "Omarchy dir not found: $OMARCHY_DIR"
[[ -d "$OMARCHY_CONFIG_DIR" ]] || die "Omarchy config dir not found: $OMARCHY_CONFIG_DIR"

need_cmd cp
need_cmd ln
need_cmd mkdir
need_cmd git
need_cmd sudo
need_cmd wget
need_cmd gpg
need_cmd apt-get
need_cmd tee

# cargo is optional if you don't care about the TUIs; if missing, we skip those installs
if command -v cargo >/dev/null 2>&1; then
	HAVE_CARGO=1
else
	HAVE_CARGO=0
	warn "cargo not found; will SKIP cargo installs (impala-nm, bluetui, wiremix)"
fi

# --- copy configs ---
log "Copying Omarchy configs into ~/.config"
mkdir -p "$TARGET_CONFIG_DIR"

copy_dir "$OMARCHY_CONFIG_DIR/hypr" "$TARGET_CONFIG_DIR/hypr"
copy_dir "$OMARCHY_CONFIG_DIR/kitty" "$TARGET_CONFIG_DIR/kitty"
copy_dir "$OMARCHY_CONFIG_DIR/omarchy" "$TARGET_CONFIG_DIR/omarchy"
copy_dir "$OMARCHY_CONFIG_DIR/uwsm" "$TARGET_CONFIG_DIR/uwsm"
copy_dir "$OMARCHY_CONFIG_DIR/waybar" "$TARGET_CONFIG_DIR/waybar"
copy_dir "$OMARCHY_CONFIG_DIR/btop" "$TARGET_CONFIG_DIR/btop"

log "Setting up btop theme symlink"
mkdir -p "$TARGET_CONFIG_DIR/btop/themes"

BTP_THEME_SRC="$TARGET_CONFIG_DIR/omarchy/current/theme/btop.theme"
BTP_THEME_DST="$TARGET_CONFIG_DIR/btop/themes/current.theme"

if [[ -e "$BTP_THEME_SRC" ]]; then
	ln -sf "$BTP_THEME_SRC" "$BTP_THEME_DST"
else
	warn "btop theme not found at $BTP_THEME_SRC; skipping symlink"
fi

copy_file "$OMARCHY_CONFIG_DIR/xdg-terminals.list" "$TARGET_CONFIG_DIR/xdg-terminals.list"
copy_file "$OMARCHY_DIR/.zshrc" "$HOME/.zshrc"
copy_file "$OMARCHY_DIR/.zshenv" "$HOME/.zshenv"

# --- git global config (uses env vars or defaults) ---
GIT_NAME="${GIT_NAME:-Your Name}"
GIT_EMAIL="${GIT_EMAIL:-you@example.com}"

log "Configuring global git identity"
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

# --- cargo TUIs ---
if ((HAVE_CARGO == 1)); then
	log "Installing Rust TUIs via cargo"
	cargo install impala-nm || warn "cargo install impala-nm failed"
	cargo install bluetui || warn "cargo install bluetui failed"
	cargo install wiremix || warn "cargo install wiremix failed"
fi

# --- Firefox ---
log "Adding Mozilla apt repo for Firefox"
sudo install -d -m 0755 /etc/apt/keyrings

# key
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- |
	sudo tee /etc/apt/keyrings/packages.mozilla.org.asc >/dev/null

# sources
cat <<'EOF' | sudo tee /etc/apt/sources.list.d/mozilla.sources >/dev/null
Types: deb
URIs: https://packages.mozilla.org/apt
Suites: mozilla
Components: main
Signed-By: /etc/apt/keyrings/packages.mozilla.org.asc
EOF

# pinning
cat <<'EOF' | sudo tee /etc/apt/preferences.d/mozilla >/dev/null
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
EOF

log "Installing Firefox"
sudo apt-get update
sudo apt-get install -y firefox

# --- VS Code ---
log "Adding Microsoft apt repo for VS Code"
sudo apt-get install -y wget gpg apt-transport-https

# keyring
wget -qO- https://packages.microsoft.com/keys/microsoft.asc |
	gpg --dearmor |
	sudo tee /usr/share/keyrings/microsoft.gpg >/dev/null
sudo chmod 0644 /usr/share/keyrings/microsoft.gpg

# sources
cat <<'EOF' | sudo tee /etc/apt/sources.list.d/vscode.sources >/dev/null
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64 arm64 armhf
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF

log "Installing VS Code"
sudo apt-get update
sudo apt-get install -y code

log "Done."
