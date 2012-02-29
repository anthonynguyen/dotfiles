#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lafoh --color=auto'
alias l='leafpad'
alias g='gedit'
alias v='vim'
alias pacupg='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias yaoin='yaourt -S'
alias pacreps='pacman -Ss'
alias pacrem='sudo pacman -Rns'
alias pacinf='pacman -Qi'
alias pacls="LC_ALL=C pacman -Qi | sed -n '/^Name[^:]*: \(.*\)/{s//\1 /;x};/^Installed[^:]*: \(.*\)/{s//\1/;H;x;s/\n//;p}' | sort -nk2 | column -t"
alias paccc='sudo pacman -Sc'

bldgrn='\e[1;32m' # Green
bldblu='\e[1;34m' # Blue
bldpur='\e[0;35m' # Purple

PS1="\[$bldblu\][\[$bldpur\]\w\[$bldblu\]]\$\[$bldgrn\] "

trap 'echo -ne "\e[0m"' DEBUG
