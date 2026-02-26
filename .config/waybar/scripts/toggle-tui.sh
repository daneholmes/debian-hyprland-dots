#!/bin/bash
set -euo pipefail

# Usage:
#   toggle-tui.sh <app_id> <command...>
#
# Example:
#   toggle-tui.sh bluetui bluetui
#   toggle-tui.sh impala impala

APP_ID="${1:-}"
shift 1 || { echo "Error: Missing command."; exit 2; }

# find the window address by class
WIND_ADDR=$(hyprctl clients -j | jq -r ".[] | select(.class == \"$APP_ID\") | .address" | head -n 1)

if [[ -n "$WIND_ADDR" ]]; then
    # check if the window is currently focused
    FOCUSED_ADDR=$(hyprctl activewindow -j | jq -r ".address")

    if [[ "$WIND_ADDR" == "$FOCUSED_ADDR" ]]; then
        # if it's focused, close it
        hyprctl dispatch closewindow "address:$WIND_ADDR"
    else
        # if it exists but isn't focused, bring it to the front
        hyprctl dispatch focuswindow "address:$WIND_ADDR"
    fi
else
    # 3. launch if it doesn't exist
    kitty --class "${APP_ID}" --title "${APP_ID}" -e "$@" &
fi
