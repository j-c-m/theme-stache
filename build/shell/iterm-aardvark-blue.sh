#!/usr/bin/env bash

# Source:   iterm
# Theme:    Aardvark Blue
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
    print_osc4 0 "19/19/19"
    print_osc4 1 "aa/34/2e"
    print_osc4 2 "4b/8c/0f"
    print_osc4 3 "db/ba/00"
    print_osc4 4 "13/70/d3"
    print_osc4 5 "c4/3a/c3"
    print_osc4 6 "00/8e/b0"
    print_osc4 7 "be/be/be"
    print_osc4 8 "45/45/45"
    print_osc4 9 "f0/5b/50"
    print_osc4 10 "95/dc/55"
    print_osc4 11 "ff/e7/63"
    print_osc4 12 "60/a4/ec"
    print_osc4 13 "e2/6b/e2"
    print_osc4 14 "60/b6/cb"
    print_osc4 15 "f7/f7/f7"

    print_osc_rgb 10 "dd/dd/dd"
    print_osc_rgb 11 "10/20/40"
    print_osc_rgb 12 "00/7a/cc"
    print_osc_rgb 17 "bf/db/fe"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#191919"
    print_linux 1 "#aa342e"
    print_linux 2 "#4b8c0f"
    print_linux 3 "#dbba00"
    print_linux 4 "#1370d3"
    print_linux 5 "#c43ac3"
    print_linux 6 "#008eb0"
    print_linux 7 "#dddddd"
    print_linux 8 "#454545"
    print_linux 9 "#f05b50"
    print_linux 10 "#95dc55"
    print_linux 11 "#ffe763"
    print_linux 12 "#60a4ec"
    print_linux 13 "#e26be2"
    print_linux 14 "#60b6cb"
    print_linux 15 "#f7f7f7"
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
