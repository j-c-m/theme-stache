#!/usr/bin/env bash

# Source:   iterm
# Theme:    Lab Fox
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
    print_osc4 0 "2e/2e/2e"
    print_osc4 1 "fc/6d/26"
    print_osc4 2 "3e/b3/83"
    print_osc4 3 "fc/a1/21"
    print_osc4 4 "db/3b/21"
    print_osc4 5 "38/0d/75"
    print_osc4 6 "6e/49/cb"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "46/46/46"
    print_osc4 9 "ff/65/17"
    print_osc4 10 "53/ea/a8"
    print_osc4 11 "fc/a0/13"
    print_osc4 12 "db/50/1f"
    print_osc4 13 "44/10/90"
    print_osc4 14 "7d/53/e7"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "2e/2e/2e"
    print_osc_rgb 12 "7f/7f/7f"
    print_osc_rgb 17 "cb/39/2e"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#2e2e2e"
    print_linux 1 "#fc6d26"
    print_linux 2 "#3eb383"
    print_linux 3 "#fca121"
    print_linux 4 "#db3b21"
    print_linux 5 "#380d75"
    print_linux 6 "#6e49cb"
    print_linux 7 "#ffffff"
    print_linux 8 "#464646"
    print_linux 9 "#ff6517"
    print_linux 10 "#53eaa8"
    print_linux 11 "#fca013"
    print_linux 12 "#db501f"
    print_linux 13 "#441090"
    print_linux 14 "#7d53e7"
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
