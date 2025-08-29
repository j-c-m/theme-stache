#!/usr/bin/env bash

# Source:   iterm
# Theme:    gruvbox-material
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
    print_osc4 0 "14/16/17"
    print_osc4 1 "ea/69/26"
    print_osc4 2 "c1/d0/41"
    print_osc4 3 "ee/cf/75"
    print_osc4 4 "6d/a3/ec"
    print_osc4 5 "fd/9b/c1"
    print_osc4 6 "fe/9d/6e"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "00/00/00"
    print_osc4 9 "d3/57/3b"
    print_osc4 10 "c1/d0/41"
    print_osc4 11 "ee/cf/75"
    print_osc4 12 "2c/86/ff"
    print_osc4 13 "fd/9b/c1"
    print_osc4 14 "92/a5/df"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "d4/be/98"
    print_osc_rgb 11 "1d/20/21"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "2b/2c/3f"
    print_osc_rgb 19 "7c/fb/70"
}

do_linux() {
    print_linux 0 "#141617"
    print_linux 1 "#ea6926"
    print_linux 2 "#c1d041"
    print_linux 3 "#eecf75"
    print_linux 4 "#6da3ec"
    print_linux 5 "#fd9bc1"
    print_linux 6 "#fe9d6e"
    print_linux 7 "#d4be98"
    print_linux 8 "#000000"
    print_linux 9 "#d3573b"
    print_linux 10 "#c1d041"
    print_linux 11 "#eecf75"
    print_linux 12 "#2c86ff"
    print_linux 13 "#fd9bc1"
    print_linux 14 "#92a5df"
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
