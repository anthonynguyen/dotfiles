prompt_git() {
	if [[ $GIT_PROMPT_ENABLE -eq 0 ]]; then
		return
	fi

	gbranch=$(git branch 2>/dev/null)
	if [ $? -ne 0 ]; then
		return
	fi

	gcur=$(echo $gbranch| sed -n '/\* /s///p')
	gst=$(git status --porcelain)
	gfiles=""
	if [[ $(echo $gst | grep "^[MADR]" | wc -l) -gt 0 ]]; then
		gfiles="$gfiles+"
	fi
	if [[ $(echo $gst | grep "^.[MADR]" | wc -l) -gt 0 ]]; then
		gfiles="$gfiles!"
	fi
	if [[ $(echo $gst | grep "^??" | wc -l) -gt 0 ]]; then
		gfiles="$gfiles?"
	fi

	echo "$dot%F{magenta}g:$gcur%f%F{white}$gfiles%f"
}
GIT_PROMPT_ENABLE=1

gp() {
	if [ $GIT_PROMPT_ENABLE = "0" ]; then
		GIT_PROMPT_ENABLE=1
	else
		GIT_PROMPT_ENABLE=0
	fi
}

prompt_hg() {
	if [[ $HG_PROMPT_ENABLE -eq 0 ]]; then
		return
	fi

	hg root >/dev/null 2>/dev/null
	if [ $? -ne 0 ]; then
		return
	fi

	hgcur=$(hg log -T '{node|short}' -r .)
	hgst=$(hg status)

	hgfiles=""
	if [[ $(echo $hgst | grep "^[M!]" | wc -l) -gt 0 ]]; then
		hgfiles="$hgfiles!"
	fi
	if [[ $(echo $hgst | grep "^[?]" | wc -l) -gt 0 ]]; then
		hgfiles="$hgfiles?"
	fi

	echo "$dot%F{magenta}hg:$hgcur%f%F{white}$hgfiles%f"
}
HG_PROMPT_ENABLE=1

hp() {
	if [ $HG_PROMPT_ENABLE = "0" ]; then
		HG_PROMPT_ENABLE=1
	else
		HG_PROMPT_ENABLE=0
	fi
}

prompt_kubectl() {
	if [[ $KUBE_PROMPT_ENABLE -eq 0 ]]; then
		return
	fi

	CONTEXT=$(cat ~/.kube/config | grep current-context | cut -f 2 -d " ")
	if [ -n "$CONTEXT" ]; then
        echo "$dot%F{blue}$CONTEXT:$(kube_namespace)%f"
    fi
}
KUBE_PROMPT_ENABLE=0

kp() {
	if [ $KUBE_PROMPT_ENABLE = "0" ]; then
		KUBE_PROMPT_ENABLE=1
	else
		KUBE_PROMPT_ENABLE=0
	fi
}

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

	print -P "%B%F{yellow}%T%f$prompt_status$dot%F{cyan}%~%f$(prompt_git)$(prompt_hg)$(prompt_kubectl)%b"
	PROMPT="%B ${prompt_char}%b  "
}

precmd () {
	setprompt
}

docker_delete () {
	docker rm -f $(docker ps -a -q)
	docker rmi -f $(docker images -q)
}

kuben() {
	local kube_namespace=$(cat ~/.kube_namespace)
	KUBE_PROMPT_ENABLE=1
	if [[ -z $kube_namespace ]]; then
		kubectl "$@"
	else
		kubectl -n $kube_namespace "$@"
	fi
}

kpod() {
	kuben get pod | grep "$1" | cut -f 1 -d " " | head -n 1
}

kube_namespace() {
	if [ "$#" -ne 1 ]; then
		cat ~/.kube_namespace
	else
		echo "$1" > ~/.kube_namespace
	fi
}

kube_rs() {
	kubectl delete -f $1
	kubectl create -f $1
}
