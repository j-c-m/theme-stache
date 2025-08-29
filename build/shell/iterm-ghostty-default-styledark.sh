#!/usr/bin/env bash

# Source:   iterm
# Theme:    Ghostty Default StyleDark
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
    print_osc4 0 "1d/1f/21"
    print_osc4 1 "cc/65/66"
    print_osc4 2 "b6/bd/68"
    print_osc4 3 "f0/c6/74"
    print_osc4 4 "82/a2/be"
    print_osc4 5 "b2/94/bb"
    print_osc4 6 "8a/be/b7"
    print_osc4 7 "c4/c8/c6"
    print_osc4 8 "66/66/66"
    print_osc4 9 "d5/4e/53"
    print_osc4 10 "b9/ca/4b"
    print_osc4 11 "e7/c5/47"
    print_osc4 12 "7a/a6/da"
    print_osc4 13 "c3/97/d8"
    print_osc4 14 "70/c0/b1"
    print_osc4 15 "ea/ea/ea"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "28/2c/34"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "28/2c/34"
}

do_linux() {
    print_linux 0 "#1d1f21"
    print_linux 1 "#cc6566"
    print_linux 2 "#b6bd68"
    print_linux 3 "#f0c674"
    print_linux 4 "#82a2be"
    print_linux 5 "#b294bb"
    print_linux 6 "#8abeb7"
    print_linux 7 "#ffffff"
    print_linux 8 "#666666"
    print_linux 9 "#d54e53"
    print_linux 10 "#b9ca4b"
    print_linux 11 "#e7c547"
    print_linux 12 "#7aa6da"
    print_linux 13 "#c397d8"
    print_linux 14 "#70c0b1"
    print_linux 15 "#eaeaea"
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
