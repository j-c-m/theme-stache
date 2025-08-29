#!/usr/bin/env bash

# Source:   iterm
# Theme:    Horizon-Bright
# Author:   unknown
# Variant:  light

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
    print_osc4 0 "16/16/1d"
    print_osc4 1 "fc/47/77"
    print_osc4 2 "00/d7/93"
    print_osc4 3 "ff/b3/8f"
    print_osc4 4 "00/be/dd"
    print_osc4 5 "ff/58/b1"
    print_osc4 6 "00/e7/e5"
    print_osc4 7 "ff/ef/ec"
    print_osc4 8 "1a/1c/24"
    print_osc4 9 "fe/5f/87"
    print_osc4 10 "00/de/a0"
    print_osc4 11 "ff/c0/a2"
    print_osc4 12 "00/c9/e2"
    print_osc4 13 "ff/6c/ba"
    print_osc4 14 "07/e9/e8"
    print_osc4 15 "ff/f2/ef"

    print_osc_rgb 10 "16/16/1d"
    print_osc_rgb 11 "fd/f0/ed"
    print_osc_rgb 12 "f9/ce/c3"
    print_osc_rgb 17 "f9/ce/c3"
    print_osc_rgb 19 "16/16/1d"
}

do_linux() {
    print_linux 0 "#16161d"
    print_linux 1 "#fc4777"
    print_linux 2 "#00d793"
    print_linux 3 "#ffb38f"
    print_linux 4 "#00bedd"
    print_linux 5 "#ff58b1"
    print_linux 6 "#00e7e5"
    print_linux 7 "#16161d"
    print_linux 8 "#1a1c24"
    print_linux 9 "#fe5f87"
    print_linux 10 "#00dea0"
    print_linux 11 "#ffc0a2"
    print_linux 12 "#00c9e2"
    print_linux 13 "#ff6cba"
    print_linux 14 "#07e9e8"
    print_linux 15 "#fff2ef"
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
