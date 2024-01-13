# ALIASES
alias ls="ls -G --color"
alias ll="ls -l"
alias rm="rm -i"
alias cat="batcat"
alias grep="grep --color"
alias g="git"
alias k="kubectl"
alias vim="${HOME}/bin/nvim.appimage"
alias tf="terraform"
alias day='timew summary :ids :day'
alias lastweek='timew summary :ids :lastweek'
alias week='timew summary :ids :week'
alias month='timew summary :ids :month'
alias ksniff='kubectl sniff'
alias approved="gh pr list -S \"review:approved\""
alias prlist="gh pr list -S \"sort:updated-desc\""
alias tfdocs="terraform-docs"
alias lock="bash ${HOME}/bin/lock.sh"
alias zathura="swallow zathura"

# EXPORTS
# export PS1='\u \w \$ '
#export PS1='[\[\033[0;91m\]\u \[\033[0;36m\]\w \[\033[0;35m\]$(git_branch)\[\033[0m\]]\$ '
export EDITOR="${HOME}/bin/nvim.appimage"
export K9S_EDITOR="${HOME}/bin/nvim.appimage"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS" --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
export CLOUDSDK_PYTHON_SITEPACKAGES=1
GPG_TTY=$(tty)
export GPG_TTY
export XCURSOR_PATH=${XCURSOR_PATH}:${HOME}/.local/share/icons
export PATH=${HOME}/.local/bin:${HOME}/.config/tfenv/bin:${HOME}/.pyenv/bin:${HOME}/.asdf/shims:${HOME}/.krew/bin:$PATH

# FUNCTIONS
activate() {
	gcloud_env_file=$(ls ${HOME}/.config/gcloud/configurations | fzf);
	gcloud_env=$(echo "${gcloud_env_file}" | sed 's/config_//');
	gcloud config configurations activate ${gcloud_env}
}

gitpull() {
	echo ${HOME}/repos/owkin/* | xargs -n 1 -P 8 -I {} git -C {} pull
}

function aws_setup() {
	# $1: profile for MFA (ex: euris)
	# $2: aws profile (ex: eurisprod)
	# MFA starting
	if [[ $# < 2 ]];
	then
		export AWS_PROFILE=$1
	else
		aws-mfa --profile=$1
		export AWS_PROFILE=$2
	fi
}

function tssh() {
	if [[ $1 != "" ]]; then
		if [[ $2 != "" ]]; then
			tsh ssh -l $2 $1;
		else
			tsh ssh $1;
		fi
	else
		hosts=$(tsh ls --format json | jq -rM '.[] | .spec.hostname' | fzf);
		if [[ "${hosts}" == "" ]];
		then
			echo "No server has been chosen. Exiting";
		else
			read -p "Enter login (empty for $(whoami)): " login
			if [[ "${login}" == "" ]];
			then
				tsh ssh ${hosts}
			else
				tsh ssh -l ${login} ${hosts}
			fi
		fi
	fi
}

function tshlogin() {
	tsh_profile=$(cat /home/fdesjeunes/.tsh/current-profile);
	tsh login --proxy=${tsh_profile}:443;
}

kubelogin() {
	kube_clusters=$(tsh kube ls --format json  | jq -rM '.[] | .kube_cluster_name' | fzf);
	tsh kube login ${kube_clusters};
}

kubeconfig() {
	tsh_profile=$(cat /home/fdesjeunes/.tsh/current-profile);
	export KUBECONFIG="/home/fdesjeunes/.kube/${tsh_profile}"
}

tshswitch() {
	profile=$(find ${HOME}/.tsh -name '*.yaml' -exec basename {} ".yaml" \; | fzf);
	echo "Switching to ${profile}"
	echo "${profile}" > ~/.tsh/current-profile
	kubeconfig
}

if [ -f /etc/bash_completion ] && ! shopt -oq posix;
then
	. /etc/bash_completion
fi
# eval "$(direnv hook bash)"
eval "$(starship init bash)"
eval "$(gh completion -s bash)"
eval "$(pyenv init -)"
. <(flux completion bash)
source ${HOME}/repos/timew-bashcompletion/timew
kubeconfig

. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/completions/asdf.bash
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
