usage () {
	echo "mint: usage: mint [options] [source-file] [args]" >&2
	[ ! -n "$1" ] && echo mint: use -h for more information. >&2 ||
	echo "-e, --executable    Keep the executable" \
	   "\n-r, --return        Output exit code of the process" \
	   "\n-s, --silent        Run the compiler silently" \
	   "\n-f, --flags [flags] Pass the flags to the compiler" \
	   "\n-h, --help          Display this information and exit" >&2
}
