#!/usr/bin/env bash

# Source:   iterm
# Theme:    electron-highlighter
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
    print_osc4 0 "15/16/1f"
    print_osc4 1 "ff/6c/8d"
    print_osc4 2 "00/ff/c3"
    print_osc4 3 "ff/d7/a9"
    print_osc4 4 "77/ab/ff"
    print_osc4 5 "da/a4/f4"
    print_osc4 6 "00/fd/ff"
    print_osc4 7 "77/8f/af"
    print_osc4 8 "4a/67/89"
    print_osc4 9 "ff/6c/8d"
    print_osc4 10 "00/ff/c3"
    print_osc4 11 "ff/d7/a9"
    print_osc4 12 "77/ab/ff"
    print_osc4 13 "da/a4/f4"
    print_osc4 14 "00/fd/ff"
    print_osc4 15 "c3/ce/e2"

    print_osc_rgb 10 "a5/b6/d4"
    print_osc_rgb 11 "23/28/3d"
    print_osc_rgb 12 "a5/b6/d4"
    print_osc_rgb 17 "25/34/5a"
    print_osc_rgb 19 "a5/b6/d4"
}

do_linux() {
    print_linux 0 "#15161f"
    print_linux 1 "#ff6c8d"
    print_linux 2 "#00ffc3"
    print_linux 3 "#ffd7a9"
    print_linux 4 "#77abff"
    print_linux 5 "#daa4f4"
    print_linux 6 "#00fdff"
    print_linux 7 "#a5b6d4"
    print_linux 8 "#4a6789"
    print_linux 9 "#ff6c8d"
    print_linux 10 "#00ffc3"
    print_linux 11 "#ffd7a9"
    print_linux 12 "#77abff"
    print_linux 13 "#daa4f4"
    print_linux 14 "#00fdff"
    print_linux 15 "#c3cee2"
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
