# mint
A script that compiles and runs the source code

##  Installation
```
rm -rf /tmp/mint_repo
git clone https://github.com/hellodoge/mint.git /tmp/mint_repo
rm /tmp/mint_repo/{README.md,LICENSE}
test -d $HOME/bin || mkdir $HOME/bin
mv -b /tmp/mint_repo/* $HOME/bin/
chmod +x $HOME/bin/mint
```

## Usage
```
mint: usage: mint [options] [source-file] [args]
-e, --executable    Keep the executable 
-r, --return        Output exit code of the process 
-s, --silent        Run the compiler silently 
-f, --flags [flags] Pass the flags to the compiler 
-h, --help          Display this information and exit
```

## Adding custom instructions
Declare a function named `_(source file extension)` in file `mint_lib/_(source file extension).sh`. Function should take three arguments (source filename, executable filename, flags) and return 0 in case of successful compilation.

## License
This code is released under an MIT License. You are free to use, modify, distribute, or sell it under those terms.
