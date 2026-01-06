#!/usr/bin/env bash

export DIALOGRC=/dev/null   # disable user dialog themes

battery_icon() {
    local p="$1" s="$2"

    if has_nerd_font; then
        [[ "$s" =~ Charging ]] && echo "󰂄" && return
        ((p>=90)) && echo "󰁹" || \
        ((p>=70)) && echo "󰂀" || \
        ((p>=50)) && echo "󰁿" || \
        ((p>=30)) && echo "󰁽" || \
        ((p>=10)) && echo "󰁺" || echo "󰂃"
    else
        [[ "$s" =~ Charging ]] && echo "[+]" || echo "[BAT]"
    fi
}

show_battery_ui() {
    local STATUS="$1"
    local PERCENT="$2"
    local TIME="$3"

    local ICON
    ICON=$(battery_icon "$PERCENT" "$STATUS")

    dialog \
        --title " $ICON Battery Monitor " \
        --gauge "\
Status : $STATUS
Charge : $PERCENT%
Time   : $TIME

ESC to quit
" \
        12 60 "$PERCENT"
}

