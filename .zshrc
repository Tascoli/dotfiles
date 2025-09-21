#!/usr/bin/env bash

# Configure a function to check if program is installed(Git, Curl , Neofetch e etc..)

# This function help us to check if all dependencies is installed

check_if_install (){
    if command -v $1  > /dev/null; then
        $1
    else
       echo "The $1 isn't installed"
    fi
}

check_if_install fastfetch

#-----------------------------#
# EXPORT ENVIRONMENT VARIABLE #
#-----------------------------#


## Put the things in right place
# --------------------------

## Pode ser colocada no arquivo '$HOME/.zshenv

## Where user-specific configurations should be written (analogous to /etc).Should default to $HOME/.config.
export XDG_CONFIG_HOME="$HOME/.config"
# Where user-specific data files should be written (analogous to /usr/share). Should default to $HOME/.local/share.
export XDG_DATA_HOME="$XDG_CONFIG_HOME/.local/share"
# Where user-specific non-essential (cached) data should be written (analogous to /var/cache).Should default to $HOME/.cache.
export  XDG_CACHE_HOME="$XDG_CONFIG_HOME/.cache"


# History settings
# --------------------------

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.


# Define preferred tools TODO: Set term and others envoirament variebles

export TERM="xterm-256color"              # getting a proper color
export EDITOR="nvim"                    # $EDITOR use nvim in terminal

#---------------------------------
# LESS as MANPAGER with colours
#---------------------------------

# export MANPAGER='less -s -M +Gg'

## Have less display colours
#
# export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
# export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
# export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
# export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
# export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
# export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
# export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
# export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

#---------------------------------
# BAT as MANPAGER
#---------------------------------
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
# export MANPAGER="sh -c 'col -bx | bat --theme=default -l man -Len -p'"
# man 2 select

#---------------------------------
## ZSH AUTO COMPLETE CONFIG        TODO: Review config auto complete and delete desnecesary things
#---------------------------------

## Initialize completion
autoload -Uz compinit; compinit                               # Option: - U -> mark the function compinit for autoloading and suppress alias expansion. | -z -> The -z means use zsh (rather than ksh) style.

## dotfiles in completion options
_comp_options+=(globdots)

## case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

## Menu and Colors for files and directory
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Autocomplete options for cd instead of directory stack
# zstyle ':completion:*' file-sort modification

# Only display some tags for the command cd
# zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
# zstyle ':completion:*:complete:git:argument-1:' tag-order !aliases
#
# Required for completion to be in good groups (named after the tags)
# zstyle ':completion:*' group-name ''
#
# zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
#
# zstyle ':completion:*' keep-prefix true
# zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

#---------------------
# Set Zsh plugins
#---------------------
if ! which brew > /dev/null; then
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/local/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/local/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
else
    source /opt/homebrew/share/zsh/site-functions
    source /opt/homebrew/share/zsh-autosuggestions
    source /opt/homebrew/share/zsh-completions
    source /opt/homebrew/share/zsh-fast-syntax-highlighting
    source /opt/homebrew/share/zsh-syntax-highlighting
fi

#     _    _     ___    _    ____  _____ ____   #
#    / \  | |   |_ _|  / \  / ___|| ____/ ___|  #
#   / _ \ | |    | |  / _ \ \___ \|  _| \___ \  #
#  / ___ \| |___ | | / ___ \ ___) | |___ ___) | #
# /_/   \_\_____|___/_/   \_\____/|_____|____/  #
#
#



#------
# EZA
#------

# general use

alias ls='eza -lF --color=always --icons=auto --group-directories-first'             # ls
alias ll='eza -lbGF --git --sort=modified'                                           # long list
alias llm='eza -lbGd --git --sort=modified'                                         # long list, modified date sort
alias la='eza -lha --icons'
alias lad='eza -lhar --icons --sort=modified --group-directories-first'             # long, all, directories first, modify first
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale'              # all + extended list
alias lx=' eza -lbhgmSa --time-style=relative --git --color-scale --no-filesize'    # all + extended list
alias lg='eza -lbF --color-scale --git --git-repos'

# specialty views
alias lS='eza -1'                                                                   # one column, just names
alias lt='eza -T --level=2'                                                         # tree

# Idea
alias lm='eza -lr --sort=modified'                                                  #list last modify first
alias lla='eza -lhHgUma --time-style=long-iso --git --color-scale'                  # all list
#eza -lhgma --git --color-scale


#-----------
# IDEAS:      TODO: Review
#-----------

# source_if_exists () {
# if test -r "$1"; then
#         source "$1"
#     fi
# }
#
# source_if_exists $HOME/.env.sh
# source_if_exists $DOTFILES/zsh/history.zsh
# source_if_exists $DOTFILES/zsh/git.zsh
# source_if_exists ~/.fzf.zsh
# source_if_exists $DOTFILES/zsh/aliases.zsh
# # source_if_exists $HOME/.asdf/asdf.sh
# source_if_exists /usr/local/etc/profile.d/z.sh
# source_if_exists /opt/homebrew/etc/profile.d/z.sh

# note() {
#     echo "date: $(date)" >> $HOME/drafts.txt
#     echo "$@" >> $HOME/drafts.txt
#     echo "" >> $HOME/drafts.txt
# }
#
# Start with neofetch
#
# Add CARGO  to your PATH to be able to run the installed binaries
export PATH=~/.cargo/bin/:$PATH

# Set config local to Wezterm - Terminal emulator
export WEZTERM_CONFIG_FILE="$HOME/.config/wezterm/"

# Set Starship

eval "$(starship init zsh)"

#Inspired by
# [Andrew Burgess](https://github.com/andrew8088/dotfiles)
export PATH=~/.cargo/bin/:/Users/tascoli/.cargo/bin/:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:
