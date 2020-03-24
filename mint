#!/bin/sh

LIB=$(dirname $0)/mint_lib

. $LIB/usage.sh

[ ! -n "$1" ] && usage && exit 1

while echo $1 | sed '/^-/!{q1}' > /dev/null; do
	args=$args$1 ; shift
	[ ! -n "$1" ] && break
done

echo $args | sed '/h/!{q1}' > /dev/null && usage help && exit 1
[ ! -n "$1" ] && usage && exit 1

file=$1
ext=$(echo $1 | sed s~.*\\\.\\\([^\\\.]*\\\)$~\\1~)
base=$(echo $1 | sed s~\\\(.*\\\)\\\.[^\\\.]*$~\\1~)
shift

[ ! -f $file ] && \
	echo mint: file $file not found && exit 2

[ ! -f $LIB/_$ext.sh ] && \
	echo mint: no instructions specified for \'.$ext\' file \
	&& exit 3

. $LIB/_$ext.sh
_$ext $file _$base || exit 4


./_$base $@ ; rc=$?
echo $args | sed '/r/!{q1}' > /dev/null && \
	echo Process finished with exit code $rc
echo $args | sed '/e/!{q1}' > /dev/null || \
	rm _$base
