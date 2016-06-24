# Platform-specific aliases
if [ (uname) = "Darwin" ]
	# brew install coreutils
	alias ls='gls -F --color=auto --group-directories-first'
	#alias ls='ls -FG'
else
	alias ls='ls -F --color=auto --group-directories-first'
end

alias ll='ls -Aho'

alias c='clear'

alias s='sudo'

alias zs='source ~/.zshrc'

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

alias yaoin='yaourt -S'
alias yaosrch='yaourt -Ss'

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

alias gac='git add .; and git commit -m'
alias ga='git add'
alias gcom='git commit'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias glo='git log --oneline --decorate'
alias gg='glo --graph'

alias gotest='go test -v -cover'
alias gocover='go test -v -coverprofile=coverage.out; go tool cover -html=coverage.out; rm coverage.out'

alias envi='source env/bin/activate'

alias rgrep='grep -r -n'
alias rgrepi='rgrep -i'

alias less='less -R'

alias tls='tmux ls'
alias ta='tmux a'
alias tn='tmux new -s'

alias please='sudo `fc -ln -1`'
