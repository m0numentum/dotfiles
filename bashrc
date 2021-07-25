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
alias ytfzf="/usr/bin/ytfzf -t"
export XDG_CONFIG_HOME=/home/m0numentum/.config
export PATH=$PATH:/home/m0numentum/.local/bin:/home/m0numentum/scripts:/usr/local/go/bin

export MONITOR=$(xrandr -q | awk '/ connected/ {print $1}')
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
