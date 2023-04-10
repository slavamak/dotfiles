#!/usr/bin/env bash
# Toggle between light and dark themes

light_mode_style="fg=#24292f,bg=#f6f8fa"
dark_mode_style="fg=#c9d1d9,bg=#1f2428"
current_mode_style=$(tmux show -Av mode-style)

case $current_mode_style in
  $dark_mode_style)
    cp -rf "$HOME/.config/tmux/themes/github_light.conf" "$HOME/.config/tmux/theme.conf"
    tmux source "$HOME/.tmux.conf"
    ;;
  *)
    cp -rf "$HOME/.config/tmux/themes/github_dark.conf" "$HOME/.config/tmux/theme.conf"
    tmux source "$HOME/.tmux.conf"
    ;;
esac
