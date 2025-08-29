#!/usr/bin/env bash

# Source:   iterm
# Theme:    CobaltNext
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
    print_osc4 1 "ff/52/7b"
    print_osc4 2 "8c/c9/8f"
    print_osc4 3 "ff/c6/4c"
    print_osc4 4 "40/9d/d4"
    print_osc4 5 "cb/a3/c7"
    print_osc4 6 "37/b5/b4"
    print_osc4 7 "d7/de/ea"
    print_osc4 8 "62/74/7f"
    print_osc4 9 "e4/7e/8b"
    print_osc4 10 "ba/dd/bb"
    print_osc4 11 "ff/dc/91"
    print_osc4 12 "7a/c0/eb"
    print_osc4 13 "f3/cc/ef"
    print_osc4 14 "84/e4/e3"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "d7/de/ea"
    print_osc_rgb 11 "16/2c/35"
    print_osc_rgb 12 "ff/c6/4c"
    print_osc_rgb 17 "4c/5b/67"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff527b"
    print_linux 2 "#8cc98f"
    print_linux 3 "#ffc64c"
    print_linux 4 "#409dd4"
    print_linux 5 "#cba3c7"
    print_linux 6 "#37b5b4"
    print_linux 7 "#d7deea"
    print_linux 8 "#62747f"
    print_linux 9 "#e47e8b"
    print_linux 10 "#baddbb"
    print_linux 11 "#ffdc91"
    print_linux 12 "#7ac0eb"
    print_linux 13 "#f3ccef"
    print_linux 14 "#84e4e3"
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
