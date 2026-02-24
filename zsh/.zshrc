# --- Core behavior ---
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git)
# --- History ---
setopt HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_SAVE_NO_DUPS HIST_EXPIRE_DUPS_FIRST
setopt HIST_REDUCE_BLANKS SHARE_HISTORY HIST_NO_STORE EXTENDED_HISTORY
HISTFILE=$HOME/.zsh_history
SAVEHIST=10000
HISTSIZE=50000
# --- Locale & editor ---
export LANG=en_US.UTF-8
export EDITOR=nvim
# --- PATH (dedup + guarded additions) ---
typeset -U path PATH
[[ -d /opt/homebrew/opt/libiconv/bin ]] && path=(/opt/homebrew/opt/libiconv/bin $path)
[[ -d /opt/homebrew/opt/curl/bin     ]] && path=(/opt/homebrew/opt/curl/bin $path)
[[ -d /nix/var/nix/profiles/default/bin ]] && path=(/nix/var/nix/profiles/default/bin $path)
[[ -d $HOME/.nix-profile/bin         ]] && path=($HOME/.nix-profile/bin $path)
[[ -d $HOME/.local/bin               ]] && path=($HOME/.local/bin $path)
[[ -d $HOME/.codeium/windsurf/bin    ]] && path=($HOME/.codeium/windsurf/bin $path)
[[ -d $HOME/.cache/lm-studio/bin     ]] && path=($HOME/.cache/lm-studio/bin $path)
[[ -d ${ASDF_DATA_DIR:-$HOME/.asdf}/shims ]] && path=(${ASDF_DATA_DIR:-$HOME/.asdf}/shims $path)
export PATH

# --- FZF ---
source $HOME/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
eval "$(fzf --zsh)"
# --- Erlang/Elixir ---
export ERL_AFLAGS="-kernel shell_history enabled"
# --- Bat ---
export BAT_THEME="TwoDark"
# --- asdf / Go ---
[[ -r $HOME/.asdf/plugins/golang/set-env.zsh ]] && source $HOME/.asdf/plugins/golang/set-env.zsh
export GOPATH="$(go env GOPATH 2>/dev/null)"
[[ -n $GOPATH ]] && path=($GOPATH/bin $path)
export PATH
# --- libffi flags for python-libmagic ---
export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"

# --- Ollama ---
export OLLAMA_KV_CACHE_TYPE="q8_0"
export OLLAMA_FLASH_ATTENTION=1

# --- Functions ---
lllm() {
  models=$(llm models)
  selection=$(echo "$models" | fzf --prompt="Select a model: ")
  model=$(echo "$selection" | sed -E 's/^[^:]+: ([^ ]+).*/\1/')
  llm -m "$model" "$@"
}

# --- Extra PATH appends (kept after function defs if needed) ---
export PATH  # already deduped; kept for clarity

# --- External sources ---
[[ -r $HOME/aliases.zsh ]] && source $HOME/aliases.zsh
[[ -r $HOME/.opam/opam-init/init.zsh ]] && source $HOME/.opam/opam-init/init.zsh > /dev/null 2>&1
[[ -f $HOME/.secrets ]] && source $HOME/.secrets

# --- Completions ---
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# --- Completion style ---
zmodload zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
bindkey -M menuselect '^M' .accept-line

# --- Key bindings ---
# Option + Backspace: delete backward word, treating '/' as a word boundary
backward-kill-dir() {
  local WORDCHARS=${WORDCHARS/\//}
  zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

# --- Prompt & utilities ---
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
# Uncomment to enable vi mode:
# bindkey -v
# Uncomment to load oh-my-zsh:
# export ZSH="$HOME/.oh-my-zsh"
# source $ZSH/oh-my-zsh.sh
# Uncomment to enable completion waiting dots:
# COMPLETION_WAITING_DOTS="true"

export OPENROUTER_BASE_URL="https://openrouter.ai/api/v1"

export CHROMA_PATH="http://localhost:8000"

# bun completions
[ -s "/Users/kiran/.bun/_bun" ] && source "/Users/kiran/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
