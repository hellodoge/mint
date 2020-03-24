# mint
A script that compiles and runs the source code

##  Installation
```
rm -rf /tmp/mint_repo
git clone https://github.com/hellodoge/mint.git /tmp/mint_repo
test -d $HOME/bin || mkdir $HOME/bin
mv /tmp/mint_repo/* $HOME/bin/
chmod +x $HOME/bin/mint
```

## Usage
```
mint: usage: mint [options] [source-file] [args]
-e    Do not delete the executable 
-r    Output exit code of the process 
-h    Display this information and exit
```

## License
This code is released under an MIT License. You are free to use, modify, distribute, or sell it under those terms.
