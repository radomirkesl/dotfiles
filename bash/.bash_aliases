
#Bash Aliases (command shortcuts)

alias idea='bgr intellij-idea-community'
alias charm='bgr pycharm-community'
alias brave='bgr brave'
alias code='bgr code'

alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

alias vim='nvim'

alias ls='lsd'

alias net='nmtui'
alias sound='pulsemixer'
alias bt='bluetuith'

#Shortcut functions

shopt -s expand_aliases

function bgr(){
	nohup "$@" &>/dev/null &
}

function screen(){
    intern=eDP1
    extern=HDMI2
    if xrandr | grep "$extern disconnected"; then
        xrandr --output "$extern" --off --output "$intern" --auto
    else
        xrandr --output "$intern" --off --output "$extern" --auto
    fi
}

