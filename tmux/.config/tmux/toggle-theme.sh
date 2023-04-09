#!/usr/bin/env bash
# Toggle between light and dark themes

light_mode_style="fg=#2e7de9,bg=#a8aecb"
dark_mode_style="fg=#7aa2f7,bg=#3b4261"
current_mode_style=$(tmux show -Av mode-style)

case $current_mode_style in
  $dark_mode_style)
    cp -rf "$HOME/.config/tmux/themes/tokyonight_day.conf" "$HOME/.config/tmux/theme.conf"
    tmux source "$HOME/.tmux.conf"
    ;;
  *)
    cp -rf "$HOME/.config/tmux/themes/tokyonight_night.conf" "$HOME/.config/tmux/theme.conf"
    tmux source "$HOME/.tmux.conf"
    ;;
esac
