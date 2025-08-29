#!/usr/bin/env bash

# Source:   iterm
# Theme:    Purple Rain
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
    print_osc4 1 "ff/26/0e"
    print_osc4 2 "9b/e2/05"
    print_osc4 3 "ff/c4/00"
    print_osc4 4 "00/a2/fa"
    print_osc4 5 "81/5b/b5"
    print_osc4 6 "00/de/ef"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "56/56/56"
    print_osc4 9 "ff/42/50"
    print_osc4 10 "b8/e3/6e"
    print_osc4 11 "ff/d8/52"
    print_osc4 12 "00/a6/ff"
    print_osc4 13 "ac/7b/f0"
    print_osc4 14 "74/fd/f3"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/fb/f6"
    print_osc_rgb 11 "21/08/4a"
    print_osc_rgb 12 "ff/27/1d"
    print_osc_rgb 17 "28/76/91"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff260e"
    print_linux 2 "#9be205"
    print_linux 3 "#ffc400"
    print_linux 4 "#00a2fa"
    print_linux 5 "#815bb5"
    print_linux 6 "#00deef"
    print_linux 7 "#fffbf6"
    print_linux 8 "#565656"
    print_linux 9 "#ff4250"
    print_linux 10 "#b8e36e"
    print_linux 11 "#ffd852"
    print_linux 12 "#00a6ff"
    print_linux 13 "#ac7bf0"
    print_linux 14 "#74fdf3"
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
