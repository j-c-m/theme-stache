#!/usr/bin/env bash

# Source:   iterm
# Theme:    Banana Blueberry
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
    print_osc4 0 "17/14/1f"
    print_osc4 1 "ff/6b/7f"
    print_osc4 2 "00/bd/9c"
    print_osc4 3 "e6/c6/2f"
    print_osc4 4 "22/e8/df"
    print_osc4 5 "dc/39/6a"
    print_osc4 6 "56/b6/c2"
    print_osc4 7 "f1/f1/f1"
    print_osc4 8 "49/51/62"
    print_osc4 9 "fe/9e/a1"
    print_osc4 10 "98/c3/79"
    print_osc4 11 "f9/e4/6b"
    print_osc4 12 "91/ff/f4"
    print_osc4 13 "da/70/d6"
    print_osc4 14 "bc/f3/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "cc/cc/cc"
    print_osc_rgb 11 "19/13/23"
    print_osc_rgb 12 "e0/7d/13"
    print_osc_rgb 17 "22/05/25"
    print_osc_rgb 19 "f4/f4/f4"
}

do_linux() {
    print_linux 0 "#17141f"
    print_linux 1 "#ff6b7f"
    print_linux 2 "#00bd9c"
    print_linux 3 "#e6c62f"
    print_linux 4 "#22e8df"
    print_linux 5 "#dc396a"
    print_linux 6 "#56b6c2"
    print_linux 7 "#cccccc"
    print_linux 8 "#495162"
    print_linux 9 "#fe9ea1"
    print_linux 10 "#98c379"
    print_linux 11 "#f9e46b"
    print_linux 12 "#91fff4"
    print_linux 13 "#da70d6"
    print_linux 14 "#bcf3ff"
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
