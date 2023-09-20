# Configurations for MacOS/Ubuntu

## Requirements

Make sure to these package is installed to your system:

- `git`
- `zsh`
- `neovim`

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

```sh
git clone git@github.com:slavamak/dotfiles.git
cd dotfiles
./install.sh
```

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
- Map `CONTROL + [` to `ESCAPE`
- Map `CONTROL + HJKL` to arrow keys (like vim)
