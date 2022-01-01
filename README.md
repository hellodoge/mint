# mint
A script that compiles and runs the source code

##  Installation
```
rm -rf /tmp/mint_repo
git clone https://github.com/hellodoge/mint.git /tmp/mint_repo
test -d $HOME/bin || mkdir $HOME/bin
mv /tmp/mint_repo/mint $HOME/bin/
test -d $HOME/.mint || mv /tmp/mint_repo/.mint $HOME/.mint
```

## Usage
```
mint: usage: mint [options] [compile string]
'e'    Keep the executable
'r'    Output exit code of the process
```

## How to add user instructions
Declare a function named `_compile` in file `$HOME/.mint/_(source file extension).sh`. The function should take three arguments (source filename, executable filename, flags) and return 0 in case of successful compilation. There should be two others functions: `_exec` will run the program and `_cleanup` will delete the executable.

## License
This code is released under an MIT License. You are free to use, modify, distribute, or sell it under those terms.
