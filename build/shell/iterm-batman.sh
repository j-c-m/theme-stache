#!/usr/bin/env bash

# Source:   iterm
# Theme:    Batman
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
    print_osc4 1 "e6/dc/44"
    print_osc4 2 "c8/be/46"
    print_osc4 3 "f4/fd/22"
    print_osc4 4 "73/71/74"
    print_osc4 5 "74/72/71"
    print_osc4 6 "62/60/5f"
    print_osc4 7 "c6/c5/bf"
    print_osc4 8 "50/53/54"
    print_osc4 9 "ff/f7/8e"
    print_osc4 10 "ff/f2/7d"
    print_osc4 11 "fe/ed/6c"
    print_osc4 12 "91/94/95"
    print_osc4 13 "9a/9a/9d"
    print_osc4 14 "a3/a3/a6"
    print_osc4 15 "da/db/d6"

    print_osc_rgb 10 "6f/6f/6f"
    print_osc_rgb 11 "1b/1d/1e"
    print_osc_rgb 12 "fc/ef/0c"
    print_osc_rgb 17 "4d/50/4c"
    print_osc_rgb 19 "f0/e0/4a"
}

do_linux() {
    print_linux 0 "#1b1d1e"
    print_linux 1 "#e6dc44"
    print_linux 2 "#c8be46"
    print_linux 3 "#f4fd22"
    print_linux 4 "#737174"
    print_linux 5 "#747271"
    print_linux 6 "#62605f"
    print_linux 7 "#6f6f6f"
    print_linux 8 "#505354"
    print_linux 9 "#fff78e"
    print_linux 10 "#fff27d"
    print_linux 11 "#feed6c"
    print_linux 12 "#919495"
    print_linux 13 "#9a9a9d"
    print_linux 14 "#a3a3a6"
    print_linux 15 "#dadbd6"
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
