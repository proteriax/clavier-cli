# clavier

Change or view input source from the command line.

## Example
```sh
clavier "U.S."
clavier "Hiragana"
clavier "Pinyin - Simplified"

# Show current input source
clavier # U.S.
```

## Build
This process should take only a few seconds.

```sh
git clone https://github.com/proteriax/clavier-cli.git
cd clavier-cli
make all
```

## Installation
If you don’t have the Swift compiler or you prefer to use the pre-built binary,
you can grab the released binary available on the [right side of the GitHub page](https://github.com/proteriax/clavier-cli/releases)
and place it under `/usr/local/bin`.
