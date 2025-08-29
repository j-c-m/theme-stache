#!/usr/bin/env bash

# Source:   iterm
# Theme:    iTerm2 Pastel Dark Background
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
    print_osc4 0 "62/62/62"
    print_osc4 1 "ff/83/73"
    print_osc4 2 "b4/fb/73"
    print_osc4 3 "ff/fd/c3"
    print_osc4 4 "a5/d5/fe"
    print_osc4 5 "ff/90/fe"
    print_osc4 6 "d1/d1/fe"
    print_osc4 7 "f1/f1/f1"
    print_osc4 8 "8f/8f/8f"
    print_osc4 9 "ff/c4/be"
    print_osc4 10 "d6/fc/ba"
    print_osc4 11 "ff/fe/d5"
    print_osc4 12 "c2/e3/ff"
    print_osc4 13 "ff/b2/fe"
    print_osc4 14 "e6/e6/fe"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "c7/c7/c7"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "ff/b4/73"
    print_osc_rgb 17 "45/4d/96"
    print_osc_rgb 19 "f4/f4/f4"
}

do_linux() {
    print_linux 0 "#626262"
    print_linux 1 "#ff8373"
    print_linux 2 "#b4fb73"
    print_linux 3 "#fffdc3"
    print_linux 4 "#a5d5fe"
    print_linux 5 "#ff90fe"
    print_linux 6 "#d1d1fe"
    print_linux 7 "#c7c7c7"
    print_linux 8 "#8f8f8f"
    print_linux 9 "#ffc4be"
    print_linux 10 "#d6fcba"
    print_linux 11 "#fffed5"
    print_linux 12 "#c2e3ff"
    print_linux 13 "#ffb2fe"
    print_linux 14 "#e6e6fe"
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
