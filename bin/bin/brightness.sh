#!/bin/sh

get() {
	printf "%.0f" "$(xbacklight)"
}

up() {
	xbacklight -inc 10 -steps 1 > /dev/null
}

down() {
	xbacklight -dec 10 -steps 1 > /dev/null
}

g() {
	LEVEL=$(get)

	PLUS=$(($LEVEL / 10))
	MINUS=$((10 - $PLUS))

	PLUS=$(($PLUS * 4))
	MINUS=$(($MINUS * 4))

	echo -e -n "\ue09F   "
	for a in $(seq 1 $PLUS); do
		echo -e -n "\u2588";
	done

	for a in $(seq 1 $MINUS); do
		echo -e -n "\u2581";
	done

	echo ""
}

case $1 in
	+) up && g;;
	-) down && g;;
	*) g;;
esac