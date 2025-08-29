#!/usr/bin/env bash

# Source:   iterm
# Theme:    Obsidian
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
    print_osc4 1 "a6/00/01"
    print_osc4 2 "00/bb/00"
    print_osc4 3 "fe/cd/22"
    print_osc4 4 "3a/9b/db"
    print_osc4 5 "bb/00/bb"
    print_osc4 6 "00/bb/bb"
    print_osc4 7 "bb/bb/bb"
    print_osc4 8 "55/55/55"
    print_osc4 9 "ff/00/03"
    print_osc4 10 "93/c8/63"
    print_osc4 11 "fe/f8/74"
    print_osc4 12 "a1/d7/ff"
    print_osc4 13 "ff/55/ff"
    print_osc4 14 "55/ff/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "cd/cd/cd"
    print_osc_rgb 11 "28/30/33"
    print_osc_rgb 12 "c0/ca/d0"
    print_osc_rgb 17 "3e/4c/4f"
    print_osc_rgb 19 "df/e1/e2"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#a60001"
    print_linux 2 "#00bb00"
    print_linux 3 "#fecd22"
    print_linux 4 "#3a9bdb"
    print_linux 5 "#bb00bb"
    print_linux 6 "#00bbbb"
    print_linux 7 "#cdcdcd"
    print_linux 8 "#555555"
    print_linux 9 "#ff0003"
    print_linux 10 "#93c863"
    print_linux 11 "#fef874"
    print_linux 12 "#a1d7ff"
    print_linux 13 "#ff55ff"
    print_linux 14 "#55ffff"
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
