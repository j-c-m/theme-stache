#!/usr/bin/env bash

# Source:   iterm
# Theme:    gruber-darker
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
    print_osc4 0 "18/18/18"
    print_osc4 1 "ff/0a/36"
    print_osc4 2 "42/dc/00"
    print_osc4 3 "ff/db/00"
    print_osc4 4 "92/a7/cb"
    print_osc4 5 "a0/95/cb"
    print_osc4 6 "90/aa/9e"
    print_osc4 7 "e4/e4/e4"
    print_osc4 8 "54/49/4e"
    print_osc4 9 "ff/38/51"
    print_osc4 10 "42/dc/00"
    print_osc4 11 "ff/db/00"
    print_osc4 12 "92/a7/cb"
    print_osc4 13 "af/af/da"
    print_osc4 14 "90/aa/9e"
    print_osc4 15 "f5/f5/f5"

    print_osc_rgb 10 "e4/e4/e4"
    print_osc_rgb 11 "18/18/18"
    print_osc_rgb 12 "ff/db/00"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "54/49/4e"
}

do_linux() {
    print_linux 0 "#181818"
    print_linux 1 "#ff0a36"
    print_linux 2 "#42dc00"
    print_linux 3 "#ffdb00"
    print_linux 4 "#92a7cb"
    print_linux 5 "#a095cb"
    print_linux 6 "#90aa9e"
    print_linux 7 "#e4e4e4"
    print_linux 8 "#54494e"
    print_linux 9 "#ff3851"
    print_linux 10 "#42dc00"
    print_linux 11 "#ffdb00"
    print_linux 12 "#92a7cb"
    print_linux 13 "#afafda"
    print_linux 14 "#90aa9e"
    print_linux 15 "#f5f5f5"
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
