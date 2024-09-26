set -x PATH ~/bin ~/.local/bin ~/bin/VSCode-linux-x64/bin ~/bin/texlive/bin/x86_64-linux $PATH
set -x GPG_TTY (tty)
set -x MOZ_ENABLE_WAYLAND 1

set -x GTK_IM_MODULE ibus
set -x QT_IM_MODULE ibus
set -x XMODIFIERS @im=ibus
set -x IBUS_ENABLE_SYNC_MODE 2

if status is-interactive
	# Commands to run in interactive sessions can go here
end

alias emacs="emacs -nw"
alias todo="todo.sh -ca"
alias zed="zeditor"

# bun
set --export BUN_INSTALL "$HOME/bin/bun"
set --export PATH $BUN_INSTALL/bin $PATH

