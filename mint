#!/bin/sh

LIB=$(dirname $0)/mint_lib

. $LIB/usage.sh

while echo $1 | sed '/^-/!{q1}' > /dev/null; do
	case $1 in
		-r|--return)
			return_code=true ;;
		-e|--executable)
			keep_executable=true ;;
		-f|--flags)
			flags="$flags $2"
			shift ;;
		-s|--silent)
			compiler_output="/dev/null" ;;
		-h|--help)
			usage full
			exit ;;
		*)
			echo "mint: $1: invalid option"
	esac
	shift
done

[ ! "$1" ] && usage && exit 1

[ ! "$compiler_output" ] && compiler_output="/dev/stdout" 

filename=$1
ext=$(echo $filename | sed s~.*\\\.\\\([^\\\.]*\\\)$~\\1~)
base=$(echo $filename | sed s~\\\(.*\\\)\\\.[^\\\.]*$~\\1~)
shift

[ ! -f $filename ] &&
	echo mint: file $filename not found &&
	exit 1

[ ! -f $LIB/_$ext.sh ] &&
	echo mint: no instructions specified for \'.$ext\' file &&
	exit 2

. $LIB/_$ext.sh
_$ext $filename _$base "$flags" > $compiler_output 2>&1 ||
	exit 3

./_$base $@ ; rc=$?
[ $return_code ] &&
	echo Process finished with exit code $rc
[ $keep_executable ] ||
	rm _$base
