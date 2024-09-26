function fish_prompt
	if test -n "$SSH_TTY"
		echo -n (set_color brred)"$USER"(set_color white)'@'(set_color yellow)(prompt_hostname)' '
	end

	echo -n (set_color blue)(prompt_pwd)

	printf '%s ' (fish_git_prompt)
	
	set_color -o

	if fish_is_root_user
	echo -n (set_color red)'# '
	end

	echo -n (set_color ff0055)'/'(set_color ffbb00)'/'(set_color 00bbff)'/ '

	set_color normal
end
