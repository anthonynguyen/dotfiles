git_branch() {
	ref=$(git symbolic-ref HEAD | cut -d'/' -f3)
	echo $ref
}

git_num_staged() {
	echo $(git status --porcelain | grep "^[MADR]" | wc -l)
}

git_num_unstaged() {
	echo $(git status --porcelain | grep "^.[MADR]" | wc -l)
}

git_num_untracked() {
	echo $(git status --porcelain | grep "^??" | wc -l)
}

git_staged_prompt() {
	if [[ $(git_num_staged) -gt 0 ]]; then
		echo "+"
	fi
}

git_unstaged_prompt() {
	if [[ $(git_num_unstaged) -gt 0 ]]; then
		echo "!"
	fi
}

git_untracked_prompt() {
	if [[ $(git_num_untracked) -gt 0 ]]; then
		echo "?"
	fi
}

git_files_prompt() {
	let "total = $(git_num_staged) + $(git_num_unstaged) + $(git_num_untracked)"
	if [[ total -gt 0 ]]; then
		echo " [$(git_staged_prompt)$(git_unstaged_prompt)$(git_untracked_prompt)]"
	fi
}

prompt_git() {
	if git branch > /dev/null 2>/dev/null; then
		echo "%F{magenta} ± $(git_branch)$(git_files_prompt)%f"
		#echo "±"
	else
		echo ""
		#echo " ——— "───
	fi
}

prompt_nvm() {
	command -v nvm > /dev/null 2>&1 || return
	nvm_version=$(nvm current 2>/dev/null)
	[[ ${nvm_version} == "system" ]] && return
	if git branch > /dev/null 2>/dev/null; then
		slash="%F{black} •%f"
	else
		slash=""
	fi
	echo "${slash}%F{green} ${nvm_version}%f"
	# ⬢
}

setprompt() {
	if [[ "$?" -ne "0" ]]; then
		prompt_char="%F{yellow} :: %f"
	else
		prompt_char="%F{white} ── %f"
	fi

	RPROMPT="%B%F{white}$(prompt_git)$(prompt_nvm)%b%b"
	PROMPT="%B%F{yellow}%T %f%F{black}•%f %F{cyan}%~%f${prompt_char}%b"
}


precmd () {
	setprompt
}

mke() {
	mkdir -p "$1" && cd "$1"
}

ws() {
	ia () {
		if pidof "$1" > /dev/null
		then
			echo -e "[\033[1;32mON\033[0m]  $2"
		else
			echo -e "[\033[1;31mOFF\033[0m] $2"
		fi
	}

	ia httpd Apache
	ia mysqld MySQL
}

docker_init () {
	eval "$(docker-machine env default)"
}

docker_delete () {
	docker rm -f $(docker ps -a -q)
	docker rmi $(docker images -q)
}
