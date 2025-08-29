#!/usr/bin/env bash

# Source:   iterm
# Theme:    Elementary
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
    print_osc4 0 "24/24/24"
    print_osc4 1 "d7/1c/15"
    print_osc4 2 "5a/a5/13"
    print_osc4 3 "fd/b4/0c"
    print_osc4 4 "06/3b/8c"
    print_osc4 5 "e4/00/38"
    print_osc4 6 "25/95/e1"
    print_osc4 7 "ef/ef/ef"
    print_osc4 8 "4b/4b/4b"
    print_osc4 9 "fc/1c/18"
    print_osc4 10 "6b/c2/19"
    print_osc4 11 "fe/c8/0e"
    print_osc4 12 "09/55/ff"
    print_osc4 13 "fb/00/50"
    print_osc4 14 "3e/a8/fc"
    print_osc4 15 "8c/00/ec"

    print_osc_rgb 10 "ef/ef/ef"
    print_osc_rgb 11 "18/18/18"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "b5/d5/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#242424"
    print_linux 1 "#d71c15"
    print_linux 2 "#5aa513"
    print_linux 3 "#fdb40c"
    print_linux 4 "#063b8c"
    print_linux 5 "#e40038"
    print_linux 6 "#2595e1"
    print_linux 7 "#efefef"
    print_linux 8 "#4b4b4b"
    print_linux 9 "#fc1c18"
    print_linux 10 "#6bc219"
    print_linux 11 "#fec80e"
    print_linux 12 "#0955ff"
    print_linux 13 "#fb0050"
    print_linux 14 "#3ea8fc"
    print_linux 15 "#8c00ec"
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
