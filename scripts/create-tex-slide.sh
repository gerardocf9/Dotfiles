
#!/bin/sh

nombre=$1

mkdir -p $nombre
cd $nombre

mainTex="https://github.com/gerardocf9/Dotfiles/raw/main/scripts/slices.tex"

curl -L $mainTex | cat > "$nombre.tex"
