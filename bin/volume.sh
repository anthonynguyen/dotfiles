#!/bin/sh

get() {
	amixer get Master | sed -n 's/^.*\[\([0-9]\+\)%.*$/\1/p' | tail -n 1
}

up() {
	amixer set Master 5%+ > /dev/null
}

down() {
	amixer set Master 5%- > /dev/null
}

g() {
	LEVEL=$(get)

	PLUS=$(($LEVEL / 5))
	MINUS=$((20 - $PLUS))

	PLUS=$(($PLUS * 2))
	MINUS=$(($MINUS * 2))

	echo -e -n "\ue050  "
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