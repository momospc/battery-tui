#!/usr/bin/env bash

get_battery_info() {
    if command -v upower &>/dev/null; then
        BAT=$(upower -e | grep battery | head -n1)
        [[ -z "$BAT" ]] && return 1

        STATUS=$(upower -i "$BAT" | awk '/state:/ {print $2}')
        PERCENT=$(upower -i "$BAT" | awk '/percentage:/ {print $2}' | tr -d '%')
        TIME=$(upower -i "$BAT" | awk '/time to/ {print $4" "$5}')

        echo "$STATUS|$PERCENT|${TIME:-Unknown}"
        return
    fi

    BAT_PATH="/sys/class/power_supply/BAT0"
    [[ ! -d "$BAT_PATH" ]] && return 1

    STATUS=$(<"$BAT_PATH/status")
    PERCENT=$(<"$BAT_PATH/capacity")

    echo "$STATUS|$PERCENT|Unknown"
}

