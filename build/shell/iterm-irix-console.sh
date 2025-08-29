#!/usr/bin/env bash

# Source:   iterm
# Theme:    IRIX Console
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
    print_osc4 0 "1a/19/19"
    print_osc4 1 "d4/24/26"
    print_osc4 2 "37/a3/27"
    print_osc4 3 "c2/9d/28"
    print_osc4 4 "07/39/e2"
    print_osc4 5 "91/1f/9c"
    print_osc4 6 "44/97/df"
    print_osc4 7 "cc/cc/cc"
    print_osc4 8 "76/76/76"
    print_osc4 9 "f3/4f/59"
    print_osc4 10 "45/c7/31"
    print_osc4 11 "f9/f2/a7"
    print_osc4 12 "40/79/ff"
    print_osc4 13 "c3/1b/a2"
    print_osc4 14 "6e/d7/d7"
    print_osc4 15 "f2/f2/f2"

    print_osc_rgb 10 "f2/f2/f2"
    print_osc_rgb 11 "0c/0c/0c"
    print_osc_rgb 12 "c7/c7/c7"
    print_osc_rgb 17 "c2/de/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#1a1919"
    print_linux 1 "#d42426"
    print_linux 2 "#37a327"
    print_linux 3 "#c29d28"
    print_linux 4 "#0739e2"
    print_linux 5 "#911f9c"
    print_linux 6 "#4497df"
    print_linux 7 "#f2f2f2"
    print_linux 8 "#767676"
    print_linux 9 "#f34f59"
    print_linux 10 "#45c731"
    print_linux 11 "#f9f2a7"
    print_linux 12 "#4079ff"
    print_linux 13 "#c31ba2"
    print_linux 14 "#6ed7d7"
    print_linux 15 "#f2f2f2"
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
