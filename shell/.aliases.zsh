if [[ `uname` == 'Darwin' ]]; then
    LS='gls'
else
    LS='ls'
fi

alias ls="$LS -F --color=auto --group-directories-first"
alias ll="$LS -AFho --color=auto --group-directories-first"

alias c='clear'
alias s='sudo'

alias fsize='du -sh'

alias zs='source ~/.zshrc'

alias rg='rg -S'

alias zypupg='sudo zypper update'
alias zypin='sudo zypper install'
alias zypsrch='zypper search'
alias zyprem='sudo zypper remove'
alias zypinf='zypper info'

alias aptupd='sudo apt update'
alias aptupg='sudo apt upgrade'
alias aptin='sudo apt install'
alias aptsrch='apt-cache search'
alias aptrem='sudo apt purge --auto-remove'
alias aptinf='apt-cache show'

alias pacupd='sudo pacman -Syy'
alias pacupg='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacsrch='pacman -Ss'
alias pacrem='sudo pacman -Rs'
alias pacinf='pacman -Qi'

alias aurin='pacaur -S'
alias aurupg='pacaur -Syu'

alias emin='sudo emerge -a'
alias emupd='sudo emerge --sync'
alias emupg='emerge -uDU --with-bdeps=y @world'
alias emrem='sudo emerge -cav'
alias eminf='emerge --info'
alias emsrch='emerge -s'

alias xin='sudo xbps-install'
alias xrem='sudo xbps-remove -R'
alias xupd='sudo xbps-install -Su'
alias xsrch='xbps-query -Rs'
alias xinf='xbps-query'

alias gac='git add . && git commit -m'
alias ga='git add'
alias gcom='git commit'
alias gs='git status'
alias gss='git status --stat'
alias gd='git diff'
alias gds='git diff --stat'
alias gl='git log'
alias glo='git log --oneline --decorate'
alias gg='glo --graph'

alias gotest='go test -v -cover'
alias gocover='go test -v -coverprofile=coverage.out; go tool cover -html=coverage.out; rm coverage.out'

alias rgrep='grep -r -n'
alias rgrepi='rgrep -i'

alias less='less -R'

alias tls='tmux ls'
alias ta='tmux a'
alias tn='tmux new -s'

alias please='sudo `fc -ln -1`'
