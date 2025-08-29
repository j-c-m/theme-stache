#!/usr/bin/env bash

# Source:   iterm
# Theme:    Oxocarbon
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
    print_osc4 0 "16/16/16"
    print_osc4 1 "00/df/db"
    print_osc4 2 "00/b4/ff"
    print_osc4 3 "ff/42/97"
    print_osc4 4 "00/c1/5a"
    print_osc4 5 "c6/93/ff"
    print_osc4 6 "ff/74/b8"
    print_osc4 7 "f2/f4/f8"
    print_osc4 8 "58/58/58"
    print_osc4 9 "00/df/db"
    print_osc4 10 "00/b4/ff"
    print_osc4 11 "ff/42/97"
    print_osc4 12 "00/c1/5a"
    print_osc4 13 "c6/93/ff"
    print_osc4 14 "ff/74/b8"
    print_osc4 15 "f2/f4/f8"

    print_osc_rgb 10 "f2/f4/f8"
    print_osc_rgb 11 "16/16/16"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "39/39/39"
    print_osc_rgb 19 "16/16/16"
}

do_linux() {
    print_linux 0 "#161616"
    print_linux 1 "#00dfdb"
    print_linux 2 "#00b4ff"
    print_linux 3 "#ff4297"
    print_linux 4 "#00c15a"
    print_linux 5 "#c693ff"
    print_linux 6 "#ff74b8"
    print_linux 7 "#f2f4f8"
    print_linux 8 "#585858"
    print_linux 9 "#00dfdb"
    print_linux 10 "#00b4ff"
    print_linux 11 "#ff4297"
    print_linux 12 "#00c15a"
    print_linux 13 "#c693ff"
    print_linux 14 "#ff74b8"
    print_linux 15 "#f2f4f8"
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
