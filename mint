#!/bin/sh

usage () {
    echo "mint: usage: mint [options] [compile string]"
    echo "'-e'    Keep the executable" \
       "\n'-r'    Output exit code of the process" \
       #"\ns        Run the compiler silently"
}

while echo "$1" | sed '/^-\?\w\+$/!{q1}' > /dev/null; do
    options="$options""$1" && shift
done

[ "$1" = "--" ] && shift

for char in `echo -n "$options" | fold -w 1`; do
    case $char in
        "-") ;;
        "r")
            return_code=1 ;;
        "e")
            keep_executable=1 ;;
        *)
            echo "mint: unknown option: '$char'"
            usage && exit 1
    esac
done

[ -z "$1" ] && usage && exit 1

compile_string=""

while [ ! "$1" = "--" ]; do
    compile_string="$compile_string $1" && shift
    [ -z "$1" ] && break
done

[ "$1" = "--" ] && shift

extension=$(echo $compile_string | grep -o '\.\w\+' | grep -o '\w\+' | head -n1)

[ ! -f "$HOME/.mint/$extension.sh" ] &&
    echo mint: no instructions specified for \'.$extension\' file && exit 1

. "$HOME/.mint/$extension.sh"
_compile $compile_string || exit $?

_exec $@ ; code=$?
[ $return_code ] &&
    echo Process finished with exit code $code

[ $keep_executable ] ||
    _cleanup
