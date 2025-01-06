export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

autoload -Ud +X compinit && compinit

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

antidote load

HISTSIZE=10000
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

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# zsh-history-substring-search configuration
bindkey '^[[A' history-substring-search-up # or '\eOA'
bindkey '^[[B' history-substring-search-down # or '\eOB'
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

bindkey              '^I'         menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete

alias ll='ls -lG'
alias lla='ls -lG -a'
alias ls='ls --color'
alias vim='nvim'
alias clear='echo -e "\e[H\e[2J"'

PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

function runSubCmd() {
  for d in ./*/ ; do /bin/zsh -c "(cd "$d" && "$@")"; done
}

git-recursive() { find -H . -name .git -type d -execdir pwd \; -execdir git "$@" \; -exec printf "\n" \; }
