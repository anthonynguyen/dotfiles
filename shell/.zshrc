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
compinit
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

bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del

export EDITOR=vim

# export PANEL_FIFO=/home/anthony/.panel-fifo
# export PANEL_HEIGHT=20
# export PANEL_FONT_FAMILY="-*-Terminus-medium-r-*-*-*-*-*-*-*-*-*-*"

# export COLOR_FOCUSED_FG='#FFF6F9FF'
# export COLOR_FOCUSED_URGENT_FG='#FF34322E'
# export COLOR_FG='#FF777777'
# export COLOR_BG='#FF333333'
# export COLOR_URGENT_FG='#FFFF0000'
# export COLOR_TITLE_FG='#FFAAAAAA'
# export COLOR_STATUS_FG='#FFA3A6AB'

# export MPD_LIGHT='#FFAAE3FF'
# export MPD_DARK='#FF779FB3'

# export VOLUME_LIGHT='#FFAAFFB8'
# export VOLUME_DARK='#FF66996E'

# export TIME_LIGHT='#FFFFAAAA'
# export TIME_DARK='#FFBF8080'

# added by travis gem
# [ -f /home/anthony/.travis/travis.sh ] && source /home/anthony/.travis/travis.sh

export PATH="$HOME/bin:$PATH"
source ~/dev/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#export NVM_DIR="/home/anthony/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
