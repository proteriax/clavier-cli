# clavier

Change input source from command line.

## Build/Install

This process should take only a few seconds.

```sh
git clone https://github.com/proteriax/clavier-cli.git
cd clavier-cli
make all
cp clavier /usr/local/bin
```

## Example
```sh
clavier "U.S."
clavier "Hiragana"
clavier "Pinyin - Simplified"

# Show current input source
clavier # U.S.
```