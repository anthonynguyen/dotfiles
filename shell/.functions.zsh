git_branch() {
	echo $(git branch | sed -n '/\* /s///p')
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
		echo "$(git_staged_prompt)$(git_unstaged_prompt)$(git_untracked_prompt)"
	fi
}

prompt_git() {
	if git branch > /dev/null 2>/dev/null; then
		echo "%F{magenta} $(git_branch)$(git_files_prompt)%f%F{black} •%f"
	fi
}

setprompt() {
	if [[ "$?" -ne "0" ]]; then
		# ★ ☀
		prompt_dot="%F{red}★ %f"
		prompt_char="%F{red}%#%f"
	else
		prompt_dot="%F{white}★ %f"
		prompt_char="%F{white}%#%f"
	fi



	RPROMPT="%B%F{white}$(prompt_git)%F{yellow} %T%f%f%b"
	PROMPT="%B ${prompt_dot} %F{cyan}%~%f%b ${prompt_char} "
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

kube_rs() {
	kubectl delete -f $1
	kubectl create -f $1
}
