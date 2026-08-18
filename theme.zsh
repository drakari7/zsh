# Machine-local settings from ~/.theme.toml (flat "key = value" lines).
_theme_load() {
  emulate -L zsh
  setopt extendedglob
  typeset -gA THEME_CFG=()
  [[ -r ~/.theme.toml ]] || return 1
  local line key val
  while IFS= read -r line || [[ -n $line ]]; do
    line=${line%%\#*}
    [[ $line == *=* ]] || continue
    key=${${line%%=*}//[[:space:]]/}
    val=${${line#*=}##[[:space:]]##}
    val=${val%%[[:space:]]##}
    val=${val#[\"\']}; val=${val%[\"\']}
    THEME_CFG[$key]=$val
  done < ~/.theme.toml
}
_theme_load

THEME=${THEME_CFG[mode]}
if [[ $THEME != (light|dark) ]]; then
  [[ -o interactive ]] && print -u2 "theme.zsh: no valid mode in ~/.theme.toml (got '$THEME'), using dark"
  THEME=dark
fi
export THEME

if [[ $THEME == light ]]; then
  export BAT_THEME="gruvbox-light"
  export DELTA_FEATURES="+theme-light"
  export LS_COLORS="$(vivid generate gruvbox-light)"
  export FZF_COLOR_BASE="light"
else
  export BAT_THEME="gruvbox-dark"
  export DELTA_FEATURES="+theme-dark"
  export LS_COLORS="$(vivid generate tokyonight-night)"
  export FZF_COLOR_BASE="dark"
fi
