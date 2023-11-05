#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Aliases
alias ls='ls --color=auto'
alias ll="ls -l"
alias rm="rm -i"
alias grep="grep --color"
alias vim="nvim"
alias zathura="/usr/bin/i3-swallow zathura"
alias ytfzf="/usr/bin/ytfzf -t --detach"

# Environment variables
export PS1='[\[\033[0;91m\]\u@\h \[\033[0;36m\]\w \[\033[0;35m\]$(git_branch)\[\033[0m\]]\$ '
export XDG_CONFIG_HOME=/home/m0numentum/.config
export PATH=$PATH:/home/m0numentum/.local/bin:/home/m0numentum/scripts:/usr/local/go/bin
export MONITOR=$(xrandr -q | awk '/ connected/ {print $1}')
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export MPD_PORT=6666
export PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
export EDITOR=/usr/bin/nvim

# Functions
git_branch() {
	/usr/bin/git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
