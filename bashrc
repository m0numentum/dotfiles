#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias ll="ls -l"
alias rm="rm -i"
alias grep="grep --color"
alias vim="nvim"
alias zathura="/usr/bin/i3-swallow zathura"
alias mpv="/usr/bin/i3-swallow mpv"
export XDG_CONFIG_HOME=/home/m0numentum/.config
export PATH=$PATH:/home/m0numentum/.local/bin

export MONITOR=$(xrandr -q | awk '/ connected/ {print $1}')
