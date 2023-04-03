
#Bash Aliases (command shortcuts)

alias idea='intellij-idea-community'
alias charm='pycharm-community'

alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

alias vim='nvim'

#Shortcut functions

shopt -s expand_aliases

function bgr(){
	nohup "$@" &>/dev/null &
}

