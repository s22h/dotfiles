autoload -Uz vcs_info
zstyle ':vcs_info:git*' formats "[%b]"
zstyle ':vcs_info:git*' actionformats "[%b]-[%a]"

precmd() {
	vcs_info

	if [[ -z ${vcs_info_msg_0_} ]]; then
		PROMPT="%~ %B%F{#ff5500}%(?..[%?] )"$'\n'"%(!.%F{#FF3333}///.%F{#ff0055}/%F{#ffbb00}/%F{#00bbff}/)%b%f "
	else
		PROMPT="%~ %F{#ffffff}${vcs_info_msg_0_} %B%F{#ff5500}%(?..[%?] )"$'\n'"%(!.%F{#FF3333}///.%F{#ff0055}/%F{#ffbb00}/%F{#00bbff}/)%b%f "
	fi
}

