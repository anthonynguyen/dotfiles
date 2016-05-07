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
setopt share_history
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

export PATH="$HOME/bin:$PATH"
source ~/sw/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PAGER=/usr/bin/less
