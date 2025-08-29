#!/usr/bin/env bash

# Source:   iterm
# Theme:    12-bit Rainbow
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
    print_osc4 1 "a0/30/50"
    print_osc4 2 "40/d0/80"
    print_osc4 3 "e0/90/40"
    print_osc4 4 "30/60/b0"
    print_osc4 5 "60/30/90"
    print_osc4 6 "00/90/c0"
    print_osc4 7 "db/de/d8"
    print_osc4 8 "68/56/56"
    print_osc4 9 "c0/60/60"
    print_osc4 10 "90/d0/50"
    print_osc4 11 "e0/d0/00"
    print_osc4 12 "00/b0/c0"
    print_osc4 13 "80/10/70"
    print_osc4 14 "20/b0/c0"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "fe/ff/ff"
    print_osc_rgb 11 "04/04/04"
    print_osc_rgb 12 "e0/d0/00"
    print_osc_rgb 17 "60/60/60"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#a03050"
    print_linux 2 "#40d080"
    print_linux 3 "#e09040"
    print_linux 4 "#3060b0"
    print_linux 5 "#603090"
    print_linux 6 "#0090c0"
    print_linux 7 "#feffff"
    print_linux 8 "#685656"
    print_linux 9 "#c06060"
    print_linux 10 "#90d050"
    print_linux 11 "#e0d000"
    print_linux 12 "#00b0c0"
    print_linux 13 "#801070"
    print_linux 14 "#20b0c0"
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
