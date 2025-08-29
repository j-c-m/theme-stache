#!/usr/bin/env bash

# Source:   iterm
# Theme:    idea
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
    print_osc4 0 "ad/ad/ad"
    print_osc4 1 "fc/52/56"
    print_osc4 2 "98/b6/1c"
    print_osc4 3 "cc/b4/44"
    print_osc4 4 "43/7e/e7"
    print_osc4 5 "9d/74/b0"
    print_osc4 6 "24/88/87"
    print_osc4 7 "18/18/18"
    print_osc4 8 "ff/ff/ff"
    print_osc4 9 "fc/70/72"
    print_osc4 10 "98/b6/1c"
    print_osc4 11 "ff/ff/0b"
    print_osc4 12 "6c/9c/ed"
    print_osc4 13 "fc/7e/ff"
    print_osc4 14 "24/88/87"
    print_osc4 15 "18/18/18"

    print_osc_rgb 10 "ad/ad/ad"
    print_osc_rgb 11 "20/20/20"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "44/47/5a"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#adadad"
    print_linux 1 "#fc5256"
    print_linux 2 "#98b61c"
    print_linux 3 "#ccb444"
    print_linux 4 "#437ee7"
    print_linux 5 "#9d74b0"
    print_linux 6 "#248887"
    print_linux 7 "#adadad"
    print_linux 8 "#ffffff"
    print_linux 9 "#fc7072"
    print_linux 10 "#98b61c"
    print_linux 11 "#ffff0b"
    print_linux 12 "#6c9ced"
    print_linux 13 "#fc7eff"
    print_linux 14 "#248887"
    print_linux 15 "#181818"
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
