#!/usr/bin/env bash

# Source:   iterm
# Theme:    One Double Light
# Author:   unknown
# Variant:  light

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
    print_osc4 0 "45/4b/58"
    print_osc4 1 "f7/48/40"
    print_osc4 2 "25/a3/43"
    print_osc4 3 "cc/81/00"
    print_osc4 4 "00/87/c1"
    print_osc4 5 "b5/0d/a9"
    print_osc4 6 "00/9a/b7"
    print_osc4 7 "eb/d8/d9"
    print_osc4 8 "0e/13/1f"
    print_osc4 9 "ff/37/11"
    print_osc4 10 "00/b9/0e"
    print_osc4 11 "ec/99/00"
    print_osc4 12 "10/65/de"
    print_osc4 13 "e5/00/d8"
    print_osc4 14 "00/b4/dd"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "38/3a/43"
    print_osc_rgb 11 "fa/fa/fa"
    print_osc_rgb 12 "1a/19/19"
    print_osc_rgb 17 "45/4e/5e"
    print_osc_rgb 19 "1a/19/19"
}

do_linux() {
    print_linux 0 "#454b58"
    print_linux 1 "#f74840"
    print_linux 2 "#25a343"
    print_linux 3 "#cc8100"
    print_linux 4 "#0087c1"
    print_linux 5 "#b50da9"
    print_linux 6 "#009ab7"
    print_linux 7 "#383a43"
    print_linux 8 "#0e131f"
    print_linux 9 "#ff3711"
    print_linux 10 "#00b90e"
    print_linux 11 "#ec9900"
    print_linux 12 "#1065de"
    print_linux 13 "#e500d8"
    print_linux 14 "#00b4dd"
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
