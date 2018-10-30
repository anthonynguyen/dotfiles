alias ls='ls -F --color=auto --group-directories-first'
alias ll='ls -AFho --color=auto --group-directories-first'

alias gac='git add . && git commit -m'
alias ga='git add'
alias gcom='git commit'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias glo='git log --oneline --decorate'
alias gg='glo --graph'

alias less='less -R'

# =============================================================================
# =============================================================================


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
