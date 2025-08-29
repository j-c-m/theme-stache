#!/usr/bin/env bash

# Source:   iterm
# Theme:    Monokai Classic
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
    print_osc4 0 "27/28/22"
    print_osc4 1 "f9/26/72"
    print_osc4 2 "a6/e2/2e"
    print_osc4 3 "e6/db/74"
    print_osc4 4 "fd/97/1f"
    print_osc4 5 "ae/81/ff"
    print_osc4 6 "66/d9/ef"
    print_osc4 7 "fd/ff/f1"
    print_osc4 8 "6e/70/66"
    print_osc4 9 "f9/26/72"
    print_osc4 10 "a6/e2/2e"
    print_osc4 11 "e6/db/74"
    print_osc4 12 "fd/97/1f"
    print_osc4 13 "ae/81/ff"
    print_osc4 14 "66/d9/ef"
    print_osc4 15 "fd/ff/f1"

    print_osc_rgb 10 "fd/ff/f1"
    print_osc_rgb 11 "27/28/22"
    print_osc_rgb 12 "c0/c1/b5"
    print_osc_rgb 17 "57/58/4f"
    print_osc_rgb 19 "fd/ff/f1"
}

do_linux() {
    print_linux 0 "#272822"
    print_linux 1 "#f92672"
    print_linux 2 "#a6e22e"
    print_linux 3 "#e6db74"
    print_linux 4 "#fd971f"
    print_linux 5 "#ae81ff"
    print_linux 6 "#66d9ef"
    print_linux 7 "#fdfff1"
    print_linux 8 "#6e7066"
    print_linux 9 "#f92672"
    print_linux 10 "#a6e22e"
    print_linux 11 "#e6db74"
    print_linux 12 "#fd971f"
    print_linux 13 "#ae81ff"
    print_linux 14 "#66d9ef"
    print_linux 15 "#fdfff1"
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
