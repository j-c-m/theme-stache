#!/usr/bin/env bash

# Source:   iterm
# Theme:    Neon
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
    print_osc4 1 "ff/30/45"
    print_osc4 2 "5f/fa/74"
    print_osc4 3 "ff/fc/7e"
    print_osc4 4 "02/08/cb"
    print_osc4 5 "f9/24/e7"
    print_osc4 6 "00/ff/fc"
    print_osc4 7 "c7/c7/c7"
    print_osc4 8 "68/68/68"
    print_osc4 9 "ff/5a/5a"
    print_osc4 10 "75/ff/88"
    print_osc4 11 "ff/fd/96"
    print_osc4 12 "3c/40/cb"
    print_osc4 13 "f1/5b/e5"
    print_osc4 14 "88/ff/fe"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "00/ff/fc"
    print_osc_rgb 11 "14/16/1a"
    print_osc_rgb 12 "c7/c7/c7"
    print_osc_rgb 17 "00/13/ff"
    print_osc_rgb 19 "08/d2/cf"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff3045"
    print_linux 2 "#5ffa74"
    print_linux 3 "#fffc7e"
    print_linux 4 "#0208cb"
    print_linux 5 "#f924e7"
    print_linux 6 "#00fffc"
    print_linux 7 "#00fffc"
    print_linux 8 "#686868"
    print_linux 9 "#ff5a5a"
    print_linux 10 "#75ff88"
    print_linux 11 "#fffd96"
    print_linux 12 "#3c40cb"
    print_linux 13 "#f15be5"
    print_linux 14 "#88fffe"
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
