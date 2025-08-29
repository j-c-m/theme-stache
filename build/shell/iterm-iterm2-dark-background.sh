#!/usr/bin/env bash

# Source:   iterm
# Theme:    iTerm2 Dark Background
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "c9/1b/00"
    print_osc4 2 "00/c2/00"
    print_osc4 3 "c7/c4/00"
    print_osc4 4 "02/25/c7"
    print_osc4 5 "ca/30/c7"
    print_osc4 6 "00/c5/c7"
    print_osc4 7 "c7/c7/c7"
    print_osc4 8 "68/68/68"
    print_osc4 9 "ff/6e/67"
    print_osc4 10 "5f/fa/68"
    print_osc4 11 "ff/fc/67"
    print_osc4 12 "68/71/ff"
    print_osc4 13 "ff/77/ff"
    print_osc4 14 "60/fd/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "c7/c7/c7"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "c7/c7/c7"
    print_osc_rgb 17 "c1/de/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#c91b00"
    print_linux 2 "#00c200"
    print_linux 3 "#c7c400"
    print_linux 4 "#0225c7"
    print_linux 5 "#ca30c7"
    print_linux 6 "#00c5c7"
    print_linux 7 "#c7c7c7"
    print_linux 8 "#686868"
    print_linux 9 "#ff6e67"
    print_linux 10 "#5ffa68"
    print_linux 11 "#fffc67"
    print_linux 12 "#6871ff"
    print_linux 13 "#ff77ff"
    print_linux 14 "#60fdff"
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
