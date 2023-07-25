# zmodload zsh/zprof

## ZSH-specific vars
# disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="awesome-patched"
# ZSH_THEME="robbyrussell"
#
# Disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

## Plugins
# Standard plugins
# plugins=(git fzf brew macos npm node)

# Hack to speed up shell init time - nvm is incredibly slow and rarely used.
# This is like a lazy init if any nvm commands are issued while retaining
# full functionality
declare -a NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)

NODE_GLOBALS+=("node")
NODE_GLOBALS+=("nvm")

load_nvm () {
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}

for cmd in "${NODE_GLOBALS[@]}"; do
  eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
done

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export GOPATH="$HOME/go"
# Custom script sources, go binary
export PATH=$PATH:$HOME/.local/bin:$HOME/.nvm/versions/node/v16.13.2/lib:/usr/local/go/bin:/$HOME/go/bin

# Path to your oh-my-zsh installation.
export ZSH="/Users/patrickwalsh/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

## User configuration
### Exports

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export NOTES_DIR="$HOME/vimwiki/index.md"
export LEDGER_FILE=/Users/patrickwalsh/finance/2022.journal

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

### Aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vimconfig="nvim ~/.config/nvim/init.vim"

# alias mrm="bundle exec rake db:migrate && bundle exec rake db:rollback && bundle exec rake db:migrate"
# alias t="/usr/local/bin/todo.sh -d /Users/patrickwalsh/Nextcloud/todo/.todo.cfg"
alias la="ls -a"
alias ll="ls -al"
alias notes="nvim $NOTES_DIR"
alias gs="git status"
alias ta="tmux a -t"
alias tm="task mod"
alias cg="codegen"

# Remaps/env setting
alias vim="nvim"
alias vw="vim -c VimwikiIndex"

alias g="git"

## Misc. sourcing
# speed up shell init
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/local/opt/zsh-syntax-highlighting 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# zprof
