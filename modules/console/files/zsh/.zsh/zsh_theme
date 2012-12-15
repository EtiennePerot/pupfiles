# Based on the kolo theme

autoload -U colors && colors

autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{green}*'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}*'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn hg
theme_precmd () {
	if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
		zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{green}]'
	} else {
		zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{red}*%F{green}]'
	}
	vcs_info
}

setopt prompt_subst
local user_color='green'; [ $UID -eq 0 ] && user_color='red'
local prompt_sign='$'; [ $UID -eq 0 ] && prompt_sign='#'
PROMPT='%B%F{$user_color}%n@%m%{$reset_color%} %B%F{cyan}%~%B%F{green}${vcs_info_msg_0_}%B%F{magenta}%{$reset_color%} %B$prompt_sign%{$reset_color%} '
RPROMPT="[%B%F{yellow}%?%{$reset_color%}]"

autoload -U add-zsh-hook
add-zsh-hook precmd theme_precmd
