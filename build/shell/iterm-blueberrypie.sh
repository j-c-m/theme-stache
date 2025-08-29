#!/usr/bin/env bash

# Source:   iterm
# Theme:    BlueBerryPie
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
    print_osc4 0 "0a/4c/62"
    print_osc4 1 "99/24/6e"
    print_osc4 2 "5c/b1/b3"
    print_osc4 3 "ea/b9/a8"
    print_osc4 4 "90/a5/bd"
    print_osc4 5 "9d/54/a7"
    print_osc4 6 "7e/83/cc"
    print_osc4 7 "f0/e8/d6"
    print_osc4 8 "20/16/37"
    print_osc4 9 "c8/72/72"
    print_osc4 10 "0a/6c/7e"
    print_osc4 11 "7a/31/88"
    print_osc4 12 "39/17/3d"
    print_osc4 13 "bc/94/b7"
    print_osc4 14 "5e/60/71"
    print_osc4 15 "0a/6c/7e"

    print_osc_rgb 10 "ba/ba/b9"
    print_osc_rgb 11 "1c/0c/28"
    print_osc_rgb 12 "fc/fa/d6"
    print_osc_rgb 17 "60/60/60"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#0a4c62"
    print_linux 1 "#99246e"
    print_linux 2 "#5cb1b3"
    print_linux 3 "#eab9a8"
    print_linux 4 "#90a5bd"
    print_linux 5 "#9d54a7"
    print_linux 6 "#7e83cc"
    print_linux 7 "#babab9"
    print_linux 8 "#201637"
    print_linux 9 "#c87272"
    print_linux 10 "#0a6c7e"
    print_linux 11 "#7a3188"
    print_linux 12 "#39173d"
    print_linux 13 "#bc94b7"
    print_linux 14 "#5e6071"
    print_linux 15 "#0a6c7e"
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
