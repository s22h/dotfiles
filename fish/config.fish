set -x PATH ~/bin ~/.local/bin ~/bin/VSCode-linux-x64/bin $PATH
set -x GPG_TTY (tty)

if status is-interactive
	# Commands to run in interactive sessions can go here
end

alias vim="nvim"

