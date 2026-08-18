. "$HOME/.cargo/env"

# fnm
FNM_PATH="/home/sravi/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --shell zsh)"
fi

# Begin added by argcomplete
fpath=( /home/sravi/.local/lib/devctl/venv/lib/python3.12/site-packages/argcomplete/bash_completion.d "${fpath[@]}" )
# End added by argcomplete
#
export PATH=~/scripts/:$PATH
export PATH=~/bin/:$PATH

export EDITOR="nvim"
export VISUAL="nvim"

# Set wordchars to modify ctrl-w behavior. Only _ is treated as part of a word
export WORDCHARS='_'

# Disable sgr escape sequences (makes man pages colorful)
export GROFF_NO_SGR=1

# Better less defaults
export LESS="-iR --incsearch -M"

# Terminal theme — flip this line to switch bat/delta previews light <-> dark
export BAT_THEME="gruvbox-dark"   # light: gruvbox-light

# set fd colors in light/dark mode
# TODO: this fn doesnt work
# set_ls_colors() {
#   local bg r
#   IFS=: read -t 0.1 -s -d $'\a' -p $'\e]11;?\a' bg < /dev/tty 2>/dev/null
#   if [[ $bg =~ rgb:([0-9a-f]+)/ ]]; then
#     r=$((16#${match[1]:0:2}))
#     if (( r >= 128 )); then
#       export LS_COLORS=$(vivid generate solarized-light)
#     else
#       export LS_COLORS=$(vivid generate solarized-dark)
#     fi
#   fi
# }
# set_ls_colors
export LS_COLORS=$(vivid generate solarized-dark)

# Fix ssh agent for ssh sessions
if [ -z "$SSH_AUTH_SOCK" ] && [ -S "/run/user/$(id -u)/keyring/ssh" ]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi
