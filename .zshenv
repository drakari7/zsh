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

# Machine-local settings + light/dark theme, single knob at ~/.theme.toml
[ -f "${ZDOTDIR}/theme.zsh" ] && source "${ZDOTDIR}/theme.zsh"

# Fix ssh agent for ssh sessions
if [ -z "$SSH_AUTH_SOCK" ] && [ -S "/run/user/$(id -u)/keyring/ssh" ]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi
