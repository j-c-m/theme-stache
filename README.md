![theme stache logo](/images/theme-stache.png)

# theme stache "stash"

Building themes to any target using mustache templates.

## theme sources

* [Gogh](https://github.com/Gogh-Co/Gogh/tree/master/themes) (https://gogh-co.github.io/Gogh/)
* [Base16](https://github.com/tinted-theming/schemes/tree/spec-0.11/base16)
* [Base24](https://github.com/tinted-theming/schemes/tree/spec-0.11/base24)
* [iTerm](https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master/schemes) (https://gogh-co.github.io/Gogh/)

## targets

### shell

* [shell.sh](/build/shell) xterm OSC shell script

install

```bash
mkdir -p $HOME/.config
cd $HOME/.config
git clone https://github.com/j-c-m/theme-stache.git
```

sample .bashrc or .zshrc addtion

```bash
THEME_STACHE="${HOME}/.config/theme-stache"         # Directory for theme-stache
DEFAULT_THEME="iterm-spacegray-eighties"            # Default theme name
SHELL_THEME="${HOME}/.shell_theme.sh"               # Path to shell theme symlink
THEME_STACHE_BIN="${HOME}/bin/theme-stache"         # Path to theme-stache binary symlink

if [[ ! -f $SHELL_THEME ]]; then
    ln -sf "${THEME_STACHE}/build/shell/${DEFAULT_THEME}.sh" "$SHELL_THEME"
fi

if [[ ! -f $THEME_STACHE_BIN ]]; then
    mkdir -p "${HOME}/bin"
    ln -sf "${THEME_STACHE}/theme-stache.py" "$THEME_STACHE_BIN"
fi

if [[ -f $SHELL_THEME ]]; then
    source "$SHELL_THEME"
fi

unset THEME_STACHE DEFAULT_THEME SHELL_THEME THEME_STACHE_BIN
```

Use theme-stache (theme-stach.py) to browse, activate, or install themes (create .shell_theme.sh symlink).

![theme-stache tool screenshot](/images/theme-stache-screenshot.png)

Recommended vimrc colorscheme section, let the 16 colors do the work!

```vimscript
if &t_Co > 16
  set t_Co=16
endif

set notermguicolors
colorscheme habamax
```

### alacritty

* [alacritty](/build/alacritty) Alacritty terminal emulator

Add an import to your `alacritty.toml` (Replace `{theme}` with your desired
colorscheme):

```toml
[general]
import = [
    "~/.config/theme-stache/build/alacritty/{theme}.toml"
]
```

# to be continued ...
