#!/usr/bin/env bash

# Source:   iterm
# Theme:    cyberpunk
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
    print_osc4 1 "ff/70/92"
    print_osc4 2 "00/fb/ac"
    print_osc4 3 "ff/fa/6a"
    print_osc4 4 "00/bf/ff"
    print_osc4 5 "df/95/ff"
    print_osc4 6 "86/cb/fe"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "00/00/00"
    print_osc4 9 "ff/8a/a4"
    print_osc4 10 "21/f6/bc"
    print_osc4 11 "ff/f7/87"
    print_osc4 12 "1b/cc/fd"
    print_osc4 13 "e6/ae/fe"
    print_osc4 14 "99/d6/fc"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "e5/e5/e5"
    print_osc_rgb 11 "33/2a/57"
    print_osc_rgb 12 "21/f6/bc"
    print_osc_rgb 17 "c1/de/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff7092"
    print_linux 2 "#00fbac"
    print_linux 3 "#fffa6a"
    print_linux 4 "#00bfff"
    print_linux 5 "#df95ff"
    print_linux 6 "#86cbfe"
    print_linux 7 "#e5e5e5"
    print_linux 8 "#000000"
    print_linux 9 "#ff8aa4"
    print_linux 10 "#21f6bc"
    print_linux 11 "#fff787"
    print_linux 12 "#1bccfd"
    print_linux 13 "#e6aefe"
    print_linux 14 "#99d6fc"
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
