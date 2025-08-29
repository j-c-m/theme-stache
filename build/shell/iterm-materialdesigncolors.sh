#!/usr/bin/env bash

# Source:   iterm
# Theme:    MaterialDesignColors
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
    print_osc4 0 "43/5b/67"
    print_osc4 1 "fc/38/41"
    print_osc4 2 "5c/f1/9e"
    print_osc4 3 "fe/d0/32"
    print_osc4 4 "37/b6/ff"
    print_osc4 5 "fc/22/6e"
    print_osc4 6 "59/ff/d1"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "a1/b0/b8"
    print_osc4 9 "fc/74/6d"
    print_osc4 10 "ad/f7/be"
    print_osc4 11 "fe/e1/6c"
    print_osc4 12 "70/cf/ff"
    print_osc4 13 "fc/66/9b"
    print_osc4 14 "9a/ff/e6"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "e7/eb/ed"
    print_osc_rgb 11 "1d/26/2a"
    print_osc_rgb 12 "ea/ea/ea"
    print_osc_rgb 17 "4e/6a/78"
    print_osc_rgb 19 "e7/eb/ed"
}

do_linux() {
    print_linux 0 "#435b67"
    print_linux 1 "#fc3841"
    print_linux 2 "#5cf19e"
    print_linux 3 "#fed032"
    print_linux 4 "#37b6ff"
    print_linux 5 "#fc226e"
    print_linux 6 "#59ffd1"
    print_linux 7 "#e7ebed"
    print_linux 8 "#a1b0b8"
    print_linux 9 "#fc746d"
    print_linux 10 "#adf7be"
    print_linux 11 "#fee16c"
    print_linux 12 "#70cfff"
    print_linux 13 "#fc669b"
    print_linux 14 "#9affe6"
    print_linux 15 "#ffffff"
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
