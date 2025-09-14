if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Download TPM, if it's not there yet
TPM_HOME="${XDG_DATA_HOME:-${HOME}/.tmux/plugins/tpm}"
if [ ! -d "$TPM_HOME" ]; then
  mkdir -p "$TPM_HOME" 
  git clone https://github.com/tmux-plugins/tpm "$TPM_HOME"
fi

# Source/Load zinit
declare -A ZINIT
ZINIT[NO_ALIASES]=1
source "${ZINIT_HOME}/zinit.zsh"

export LANG=en_US.UTF-8
export CLICOLOR=1
export VISUAL=nvim;
export EDITOR=nvim;
export PATH="$HOME/.cargo/bin:$PATH"
export GOPATH="$HOME/go"
export GOPROXY="https://proxy.golang.org,direct"
export PATH="$PATH:$GOPATH/bin"
export BAT_THEME="base16-256"  
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light atuinsh/atuin

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::jsontools
zinit snippet OMZP::copyfile
zinit snippet OMZP::copypath
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

autoload -Uz compinit
compinit

zinit cdreplay -q

# in bash: set -o vi
bindkey -v '^?' backward-delete-char
bindkey '^y' autosuggest-accept
bindkey '^e' autosuggest-execute
# bindkey '^u' autosuggest-toggle

# Completions
source <(kubectl completion zsh)

# load alias file
source ~/.config/aliases

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

take () {
    mkdir -p "$1" && cd "$1"
}

# Host-specific configs
if [ -f "$HOME/.config/host/init.zsh" ]; then
  source "$HOME/.config/host/init.zsh"
fi

# See: https://github.com/starship/starship/issues/3418#issuecomment-2477375663
if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi

# Shell integrations
eval "$(fzf --zsh)"
eval "$(starship init zsh)"
eval "$(mise activate zsh)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
eval "$(thefuck --alias)"
