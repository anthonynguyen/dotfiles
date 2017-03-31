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
		echo "$dot%F{magenta}$(git_branch)$(git_files_prompt)%f"
	fi
}

prompt_kubectl() {
	if [[ $KUBE_PROMPT_ENABLE -eq 0 ]]; then
		return
	fi

	CONTEXT=$(cat ~/.kube/config | grep current-context | cut -f 2 -d " ")
	if [ -n "$CONTEXT" ]; then
        echo "$dot%F{blue}$CONTEXT%f"
    fi
}

kp() {
	KUBE_PROMPT_ENABLE=1
}
KUBE_PROMPT_ENABLE=0

setprompt() {
	last_status=$?

	# •
	dot="%F{black} ◦ %f"

	if [[ "$last_status" -ne "0" ]]; then
		# ★ ☀
		prompt_char="%F{red}★%f"
		prompt_status="$dot%F{red}x$last_status%f"
	else
		prompt_char="%F{white}★%f"
		prompt_status=""
	fi

	print -P "%B%F{yellow}%T%f$prompt_status$dot%F{cyan}%~%f$(prompt_git)$(prompt_kubectl)%b"
	PROMPT="%B ${prompt_char}%b "
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

kuben() {
	if [[ -z $KUBE_NAMESPACE ]]; then
		kubectl "$@"
	else
		kubectl -n $KUBE_NAMESPACE "$@"
	fi
}

kube_rs() {
	kubectl delete -f $1
	kubectl create -f $1
}
