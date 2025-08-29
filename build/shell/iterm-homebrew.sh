#!/usr/bin/env bash

# Source:   iterm
# Theme:    Homebrew
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
    print_osc4 1 "99/00/00"
    print_osc4 2 "00/a6/00"
    print_osc4 3 "99/99/00"
    print_osc4 4 "00/00/b2"
    print_osc4 5 "b2/00/b2"
    print_osc4 6 "00/a6/b2"
    print_osc4 7 "bf/bf/bf"
    print_osc4 8 "66/66/66"
    print_osc4 9 "e5/00/00"
    print_osc4 10 "00/d9/00"
    print_osc4 11 "e5/e5/00"
    print_osc4 12 "00/00/ff"
    print_osc4 13 "e5/00/e5"
    print_osc4 14 "00/e5/e5"
    print_osc4 15 "e5/e5/e5"

    print_osc_rgb 10 "00/ff/00"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "23/ff/18"
    print_osc_rgb 17 "08/39/05"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#990000"
    print_linux 2 "#00a600"
    print_linux 3 "#999900"
    print_linux 4 "#0000b2"
    print_linux 5 "#b200b2"
    print_linux 6 "#00a6b2"
    print_linux 7 "#00ff00"
    print_linux 8 "#666666"
    print_linux 9 "#e50000"
    print_linux 10 "#00d900"
    print_linux 11 "#e5e500"
    print_linux 12 "#0000ff"
    print_linux 13 "#e500e5"
    print_linux 14 "#00e5e5"
    print_linux 15 "#e5e5e5"
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
