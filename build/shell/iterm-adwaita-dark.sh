#!/usr/bin/env bash

# Source:   iterm
# Theme:    Adwaita Dark
# Author:   unknown
# Variant:  dark

# Exit if not on a tty

if [[ ! -t 0 ]]; then
    exit 0
fi

print_osc4() {
    local color="$1"
    local hexterm="$2"

    printf "\033]4;%d;rgb:%s\033\\" "$color" "$hexterm"
}

print_osc_rgb() {
    local osc="$1"
    local hexterm="$2"

    printf "\033]%d;rgb:%s\033\\" "$osc" "$hexterm"
}

print_linux() {
    local color="$1"
    local hex="$2"

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "24/1f/31"
    print_osc4 1 "c0/1c/28"
    print_osc4 2 "2e/c2/7e"
    print_osc4 3 "f5/c2/11"
    print_osc4 4 "1e/78/e4"
    print_osc4 5 "98/41/bb"
    print_osc4 6 "0a/b9/dc"
    print_osc4 7 "c0/bf/bc"
    print_osc4 8 "5e/5c/64"
    print_osc4 9 "ed/33/3b"
    print_osc4 10 "57/e3/89"
    print_osc4 11 "f8/e4/5c"
    print_osc4 12 "51/a1/ff"
    print_osc4 13 "c0/61/cb"
    print_osc4 14 "4f/d2/fd"
    print_osc4 15 "f6/f5/f4"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "1d/1d/20"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "5e/5c/64"
}

do_linux() {
    print_linux 0 "#241f31"
    print_linux 1 "#c01c28"
    print_linux 2 "#2ec27e"
    print_linux 3 "#f5c211"
    print_linux 4 "#1e78e4"
    print_linux 5 "#9841bb"
    print_linux 6 "#0ab9dc"
    print_linux 7 "#ffffff"
    print_linux 8 "#5e5c64"
    print_linux 9 "#ed333b"
    print_linux 10 "#57e389"
    print_linux 11 "#f8e45c"
    print_linux 12 "#51a1ff"
    print_linux 13 "#c061cb"
    print_linux 14 "#4fd2fd"
    print_linux 15 "#f6f5f4"
}

case "$TERM" in
    linux*)
        do_linux
        ;;
    *)
        do_osc
        ;;
esac

unset -f print_osc4
unset -f print_osc_rgb
unset -f print_linux
unset -f do_osc
unset -f do_linux
