#!/usr/bin/env bash

# Source:   iterm
# Theme:    IR_Black
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
    print_osc4 0 "4f/4f/4f"
    print_osc4 1 "fa/6c/60"
    print_osc4 2 "a8/ff/60"
    print_osc4 3 "ff/fe/b7"
    print_osc4 4 "96/ca/fe"
    print_osc4 5 "fa/73/fd"
    print_osc4 6 "c6/c5/fe"
    print_osc4 7 "ef/ed/ef"
    print_osc4 8 "7b/7b/7b"
    print_osc4 9 "fc/b6/b0"
    print_osc4 10 "cf/ff/ab"
    print_osc4 11 "ff/ff/cc"
    print_osc4 12 "b5/dc/ff"
    print_osc4 13 "fb/9c/fe"
    print_osc4 14 "e0/e0/fe"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "f1/f1/f1"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "80/80/80"
    print_osc_rgb 17 "b5/d5/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#4f4f4f"
    print_linux 1 "#fa6c60"
    print_linux 2 "#a8ff60"
    print_linux 3 "#fffeb7"
    print_linux 4 "#96cafe"
    print_linux 5 "#fa73fd"
    print_linux 6 "#c6c5fe"
    print_linux 7 "#f1f1f1"
    print_linux 8 "#7b7b7b"
    print_linux 9 "#fcb6b0"
    print_linux 10 "#cfffab"
    print_linux 11 "#ffffcc"
    print_linux 12 "#b5dcff"
    print_linux 13 "#fb9cfe"
    print_linux 14 "#e0e0fe"
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
