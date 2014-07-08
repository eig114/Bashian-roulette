#!/bin/sh

BANG="rm -rf /"

while getopts :c OPT; do
    case $OPT in
	c|+c)
	    #Chicken mode engaged! Non-root execution allowed.
	    BANG="echo chicken!"
	    chicken=1
	    ;;
	*)
	    echo "usage: ${0##*/} [-c]"
	    exit 2
    esac
done
shift $(( OPTIND - 1 ))
OPTIND=1

if [[ $(whoami) != "root" && -z $chicken ]]; then 
    echo You are a chicken for playing this game while not root!
    exit 1
fi

[ $[ $RANDOM % 6 ] == 0 ] && $BANG || echo *Click*
