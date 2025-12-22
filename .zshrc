eval "$(starship init zsh)"
source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--multi --no-height --extended'

export EDITOR=vim
export VISUAL="$EDITOR"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias ls="eza --icons=always"
eval "$(zoxide init zsh)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zsh completions
if [ -e /usr/share/zsh/site-functions ]; then
  fpath=(/usr/share/zsh/site-functions $fpath)
fi

autoload -U compinit && compinit
# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line
