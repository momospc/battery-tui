#!/usr/bin/env bash

require() {
    command -v "$1" &>/dev/null || {
        echo "Missing dependency: $1"
        exit 1
    }
}

has_nerd_font() {
    fc-list | grep -qi "nerd"
}

