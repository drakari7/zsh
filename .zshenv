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
