usage () {
	echo "mint: usage: mint [options] [source-file] [args]" >&2
	[ ! -n "$1" ] && echo mint: use -h for more information. >&2 || \
	echo "-e    Do not delete the executable" \
	   "\n-r    Output exit code of the process" \
	   "\n-h    Display this information and exit" >&2
}
