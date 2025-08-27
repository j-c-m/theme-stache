![theme stache logo](/images/theme-stache.png)

# theme stache "stash"

Building themes to any target using mustache templates.

## theme sources

- [Gogh](https://github.com/Gogh-Co/Gogh/tree/master/themes) (https://gogh-co.github.io/Gogh/)
- [Base16](https://github.com/tinted-theming/schemes/tree/spec-0.11/base16)
- [Base24](https://github.com/tinted-theming/schemes/tree/spec-0.11/base24)
- [iTerm](https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master/schemes) (https://gogh-co.github.io/Gogh/)

## install

```bash
mkdir -p $HOME/.config
cd $HOME/.config
git clone https://github.com/j-c-m/theme-stache.git
```

Use theme-stache (theme-stach.py) to browse, activate (temporary), or install themes (current-theme).

![theme-stache tool screenshot](/images/theme-stache-screenshot.png)

[ansi-dim.vim](https://raw.githubusercontent.com/j-c-m/dotfiles/refs/heads/master/.vim/colors/ansi-dim.vim)

Recommended vimrc colorscheme section, let the 16 colors do the work!

```vimscript
if &t_Co > 16
  set t_Co=16
endif

colorscheme ansi-dim
```

## targets

### shell

- [shell.sh](/build/shell) xterm OSC shell script

```sh
[ -f "$HOME/.config/current-theme/shell.sh" ] && . "$HOME/.config/current-theme/shell.sh"
```

### alacritty

- [alacritty](/build/alacritty) Alacritty terminal emulator

Add an import to your `alacritty.toml` config

```toml
[general]
import = [
    "~/.config/theme-stache/current-theme/alacritty.toml"
]
```

### ghostty

- [ghostty](/build/ghostty) Ghostty terminal emulator

### iterm2

- [iterm2](/build/itermcolors/) iTerm2 terminal emulator

# to be continued ...
