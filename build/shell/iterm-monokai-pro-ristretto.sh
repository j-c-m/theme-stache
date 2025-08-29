#!/usr/bin/env bash

# Source:   iterm
# Theme:    Monokai Pro Ristretto
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
    print_osc4 0 "2c/25/25"
    print_osc4 1 "fd/68/83"
    print_osc4 2 "ad/da/78"
    print_osc4 3 "f9/cc/6c"
    print_osc4 4 "f3/8d/70"
    print_osc4 5 "a8/a9/eb"
    print_osc4 6 "85/da/cc"
    print_osc4 7 "ff/f1/f3"
    print_osc4 8 "72/69/6a"
    print_osc4 9 "fd/68/83"
    print_osc4 10 "ad/da/78"
    print_osc4 11 "f9/cc/6c"
    print_osc4 12 "f3/8d/70"
    print_osc4 13 "a8/a9/eb"
    print_osc4 14 "85/da/cc"
    print_osc4 15 "ff/f1/f3"

    print_osc_rgb 10 "ff/f1/f3"
    print_osc_rgb 11 "2c/25/25"
    print_osc_rgb 12 "c3/b7/b8"
    print_osc_rgb 17 "5b/53/53"
    print_osc_rgb 19 "ff/f1/f3"
}

do_linux() {
    print_linux 0 "#2c2525"
    print_linux 1 "#fd6883"
    print_linux 2 "#adda78"
    print_linux 3 "#f9cc6c"
    print_linux 4 "#f38d70"
    print_linux 5 "#a8a9eb"
    print_linux 6 "#85dacc"
    print_linux 7 "#fff1f3"
    print_linux 8 "#72696a"
    print_linux 9 "#fd6883"
    print_linux 10 "#adda78"
    print_linux 11 "#f9cc6c"
    print_linux 12 "#f38d70"
    print_linux 13 "#a8a9eb"
    print_linux 14 "#85dacc"
    print_linux 15 "#fff1f3"
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
