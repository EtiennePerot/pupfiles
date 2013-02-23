UNDISTRACT_ME_CMD_BLACKLIST=(
	screen ssh
	wine
	less more most man
	'\S*top' '\S*mon'
	watch
)

undistract_me_preexec() {
	UNDISTRACT_ME_CMD=${${${(pj:\\\\n:)${(f)1}}//\%/%%}//\\/\\\\}
	UNDISTRACT_ME_CMD_START_TIME="$(date +%s)"
}
undistract_me_precmd() {
	local end_time duration
	if [ "$UNDISTRACT_ME_CMD" != '' ]; then
		end_time="$(date +%s)"
		validCommand='true'
		for cmd in "${UNDISTRACT_ME_CMD_BLACKLIST[@]}"; do
			if echo "$UNDISTRACT_ME_CMD" | grep -qP "^(?:sudo)?\s*$cmd\b"; then
				validCommand=''
				break
			fi
		done
		if [ -n "$validCommand" ]; then
			((duration="$end_time" - "$UNDISTRACT_ME_CMD_START_TIME"))
			if [ "$duration" -gt 15 ]; then
				notify-send --urgency=low --expire-time=1500 --icon=utilities-terminal 'Command executed' "'$UNDISTRACT_ME_CMD' ended in $duration seconds."
			fi
		fi
	fi
	unset UNDISTRACT_ME_CMD
	unset UNDISTRACT_ME_CMD_START_TIME
}

autoload -U add-zsh-hook
add-zsh-hook preexec undistract_me_preexec
add-zsh-hook precmd undistract_me_precmd
