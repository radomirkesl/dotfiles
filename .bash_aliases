
#Bash Aliases (command shortcuts)

alias idea='bgr intellij-idea-community'
alias charm='bgr pycharm-community'
alias brave='bgr brave-browser'
alias code='bgr code'

alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

alias vim='nvim'

#Shortcut functions

shopt -s expand_aliases

function bgr(){
	nohup "$@" &>/dev/null &
}

