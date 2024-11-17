[![Setup](https://github.com/slavamak/dotfiles/actions/workflows/main.yml/badge.svg)](https://github.com/slavamak/dotfiles/actions/workflows/main.yml)

# Configurations for MacOS/Ubuntu

![screenshot](https://github.com/user-attachments/assets/cf530d77-eb23-4062-b6a0-fb9b12cc2fd3)

## Requirements

Make sure to these package is installed to your system:

- `git`
- `make`

## Contents

Includes configurations for:

- [iTerm](https://iterm2.com/)
- [WezTerm](https://wezfurlong.org/wezterm/)
- [Neovim](https://neovim.io/)
- [Tmux](https://github.com/tmux/tmux)
- [Starship](https://starship.rs/)
- [Zsh](https://www.zsh.org/)
- [Karabiner](https://karabiner-elements.pqrs.org/)

## How to use

Run these commands in your terminal:

```bash
git clone https://github.com/slavamak/dotfiles ~/.dotfiles
cd ~/.dotfiles
make
```

> [!NOTE]
> For simple dotfiles management, I use GNU Stow. Normally stow will abort the operation if a file already exists in the target directory, but with `--adopt` option stow will take the file and replace it inside your `.dotfiles` directory. If that's not what you need, you can do `git restore .`, so git will undo the changes and return to the original files but the symlinks will stay there.

## Neovim

Previously, I was using an pre-built configuration that had a lot of ui features and plugins. But I decided to drop it and make my own custom config without unnecessary plugins, only what I use most often. Config is based on [lazy.nvim](https://github.com/folke/lazy.nvim).

## iTerm, WezTerm

Settings and colors theme.

## Tmux

Base configuration with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm).

### Plugins

- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) - Persists tmux environment across system restarts.
- [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) - Continuous saving of tmux environment.
- [tmux-cpu](https://github.com/tmux-plugins/tmux-cpu) - Cpu percentage and icon indicator for Tmux.
- [tmux-prefix-highlight](https://github.com/tmux-plugins/tmux-continuum) - Highlights when you press tmux prefix key.

## Zsh

Base configuration with [zap-zsh](https://github.com/zap-zsh/zap) plugin manager.

### Plugins

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-completions](https://github.com/zsh-users/zsh-completions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-z](https://github.com/agkozak/zsh-z)
- [zsh-you-should-use](https://github.com/MichaelAquilina/zsh-you-should-use")

## Karabiner

A few simple key mappings:

- Swap `CAPSLOCK` with `LEFT CONTROL`
- Double-tap `LEFT CONTROL` to `CAPSLOCK` toggle
- `CAPSLOCK` + `SPACEBAR` to `CONTROL` + `OPTION` + `SPACEBAR` (MacOS input source toggle)
- `LEFT CONTROL` + `hjkl` to Arrow Keys for browser apps
