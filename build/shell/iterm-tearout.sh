#!/usr/bin/env bash

# Source:   iterm
# Theme:    Tearout
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
    print_osc4 0 "68/57/42"
    print_osc4 1 "cc/96/7b"
    print_osc4 2 "97/97/6d"
    print_osc4 3 "6c/98/61"
    print_osc4 4 "b5/95/5e"
    print_osc4 5 "c9/a5/54"
    print_osc4 6 "d7/c4/83"
    print_osc4 7 "b5/95/5e"
    print_osc4 8 "68/57/42"
    print_osc4 9 "cc/96/7b"
    print_osc4 10 "97/97/6d"
    print_osc4 11 "6c/98/61"
    print_osc4 12 "b5/95/5e"
    print_osc4 13 "c9/a5/54"
    print_osc4 14 "d7/c4/83"
    print_osc4 15 "b5/95/5e"

    print_osc_rgb 10 "f4/d2/ae"
    print_osc_rgb 11 "34/39/2d"
    print_osc_rgb 12 "d7/c4/83"
    print_osc_rgb 17 "e4/c4/7a"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#685742"
    print_linux 1 "#cc967b"
    print_linux 2 "#97976d"
    print_linux 3 "#6c9861"
    print_linux 4 "#b5955e"
    print_linux 5 "#c9a554"
    print_linux 6 "#d7c483"
    print_linux 7 "#f4d2ae"
    print_linux 8 "#685742"
    print_linux 9 "#cc967b"
    print_linux 10 "#97976d"
    print_linux 11 "#6c9861"
    print_linux 12 "#b5955e"
    print_linux 13 "#c9a554"
    print_linux 14 "#d7c483"
    print_linux 15 "#b5955e"
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
