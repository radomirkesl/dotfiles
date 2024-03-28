#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"

# Created by `pipx` on 2024-01-25 19:21:39
export PATH="$PATH:/home/kera/.local/bin"
# Add cargo to path
export PATH="$HOME/.cargo/bin:$PATH"
# Use sscache for cargo
export RUSTC_WRAPPER=sccache
# Add go binaries to path
export PATH="$HOME/.go/bin:$PATH"

# Set default editor
export EDITOR="/usr/bin/nvim"
# Set default terminal
export TERM='kitty'
export TERM_PROGRAM="kitty"

export SWWW_TRANSITION=simple
export SWWW_TRANSITION_STEP=2
export SWWW_TRANSITION_DURATION=3
export SWWW_TRANSITION_FPS=90

