#!/usr/bin/env bash

# Source:   iterm
# Theme:    The Hulk
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
    print_osc4 0 "1b/1d/1e"
    print_osc4 1 "26/9d/1b"
    print_osc4 2 "13/ce/30"
    print_osc4 3 "63/e4/57"
    print_osc4 4 "25/25/f5"
    print_osc4 5 "64/1f/74"
    print_osc4 6 "37/8c/a9"
    print_osc4 7 "d9/d8/d1"
    print_osc4 8 "50/53/54"
    print_osc4 9 "8d/ff/2a"
    print_osc4 10 "48/ff/77"
    print_osc4 11 "3a/fe/16"
    print_osc4 12 "50/6b/95"
    print_osc4 13 "72/58/9d"
    print_osc4 14 "40/85/a6"
    print_osc4 15 "e5/e6/e1"

    print_osc_rgb 10 "b5/b5/b5"
    print_osc_rgb 11 "1b/1d/1e"
    print_osc_rgb 12 "16/b6/1b"
    print_osc_rgb 17 "4d/50/4c"
    print_osc_rgb 19 "0b/63/09"
}

do_linux() {
    print_linux 0 "#1b1d1e"
    print_linux 1 "#269d1b"
    print_linux 2 "#13ce30"
    print_linux 3 "#63e457"
    print_linux 4 "#2525f5"
    print_linux 5 "#641f74"
    print_linux 6 "#378ca9"
    print_linux 7 "#b5b5b5"
    print_linux 8 "#505354"
    print_linux 9 "#8dff2a"
    print_linux 10 "#48ff77"
    print_linux 11 "#3afe16"
    print_linux 12 "#506b95"
    print_linux 13 "#72589d"
    print_linux 14 "#4085a6"
    print_linux 15 "#e5e6e1"
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
