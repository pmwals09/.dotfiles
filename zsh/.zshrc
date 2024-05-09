# zmodload zsh/zprof

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#
# Disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

## Plugins
# Standard plugins
# plugins=(git fzf brew macos npm node)

export GOPATH="$HOME/go"
# Custom script sources, go binary
export PATH=$PATH:$HOME/.local/bin:/usr/local/go/bin:/$HOME/go/bin


## User configuration
### Exports

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export NOTES_DIR="$HOME/notes/"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

### Aliases
alias zshconfig="nvim ~/.zshrc"
# alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vimconfig="nvim ~/.config/nvim/init.vim"
alias ls="lsd"
alias la="ls -a"
alias ll="ls -al"
alias notes="cd $NOTES_DIR && nvim ."
alias gs="git status"
alias ta="tmux a -t"
alias tm="task mod"
alias cg="codegen"
alias qn="quicknote"

# Remaps/env setting
alias vim="nvim"
alias vw="vim -c VimwikiIndex"

alias g="git"

## Misc. sourcing
source /usr/local/opt/zsh-syntax-highlighting 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/patrickwalsh/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/patrickwalsh/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/patrickwalsh/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/patrickwalsh/google-cloud-sdk/completion.zsh.inc'; fi
