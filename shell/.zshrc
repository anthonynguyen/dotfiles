# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' format 'Completion type: %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit -u

setopt transient_rprompt

# End of lines added by compinstall
# Lines configured by zsh-newuser-install

for f in ~/.{aliases,functions}; do
	source "$f"
done

HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory autocd beep
setopt inc_append_history
bindkey -e
# End of lines configured by zsh-newuser-install

autoload -U colors
colors

setprompt

bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line

bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del

export EDITOR=nvim

export GOPATH=~/dev/go
export PATH="$HOME/.cargo/bin:$HOME/bin:$GOPATH/bin:$PATH"
source ~/sw/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

source ~/.rvm/scripts/rvm

export PAGER=/usr/bin/less
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode – red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode – bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode – yellow
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode – cyan

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
