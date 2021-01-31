#!/bin/sh
# Fixing misbehaving Java Applications (https://wiki.archlinux.org/index.php/Dwm#Fixing_misbehaving_Java_applications)
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_FX_WM_NONREPARENTING=1

# ADD $HOME/.local/bin TO PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')"

# SET PROGS
export FILE="lf"
export EDITOR="/usr/bin/nvim"
export TERMINAL="/usr/local/bin/st"
export MUSIC="/usr/bin/cmus"
export BROWSER="/usr/bin/brave-browser"
export READER="/usr/bin/zathura"
export MULTIPLEX="tmux"

# $HOME CLEAN-UP
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$HOME/.config/zsh"
export WGETRC="$HOME/.config/wget/wgetrc"
export GOPATH="$HOME/.local/share/go"
export CARGO_HOME="$HOME/.local/share/cargo"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"

# LESS
export LESSHISTFILE="-"
export LESS=-R
export LESS_TERMCAP_mb=$'\e[01;34m'
export LESS_TERMCAP_md=$'\e[01;34m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;30m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;34m'
export LESS_TERMCAP_ue=$'\e[0m'

# FFF
export FFF_FILE_FORMAT=" %f"
export FFF_MARK_FORMAT="> %f"
export FFF_OPENER="lf_opener"

# GREP
export GREP_COLORS="fn=34:mt=01;34:ln=01;30:se=30"

# SUDO PROMPT
export SUDO_PROMPT=$(printf "\e[01;30;47msudo\e[0m : ")

eval $(dircolors $HOME/.config/dir_colors)

# START WM WITH LOGIN
# exec startx
