
_compile() {
    cc $@ -o mint.out
    return $?
}

_exec() {
    ./mint.out $@
    return $?
}

_cleanup() {
    rm mint.out
}
