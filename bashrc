#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll="ls -l"
alias rm="rm -i"
#alias vim="nvim"
#alias zathura="/usr/bin/i3-swallow zathura"
#alias ytfzf="/usr/bin/ytfzf -t --detach"

# exports
PS1='[\u@\h \W]\$ '
export EDITOR=vim
export XDG_CONFIG_HOME=${HOME}/.config
#export PATH=$PATH:${HOME}/.local/bin:${HOME}/scripts:/usr/local/go/bin
#export MONITOR=$(xrandr -q | awk '/ connected/ {print $1}')
#export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
#export MPD_PORT=6666
#export PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'

