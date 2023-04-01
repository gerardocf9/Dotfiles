#!/bin/sh

nombre=$1

mkdir -p $nombre
cd $nombre
mkdir -p images src

touch "src/$nombre.tex"

mainTex="https://github.com/gerardocf9/Dotfiles/raw/main/scripts/main.tex"

bibliografia="https://github.com/gerardocf9/Dotfiles/raw/main/scripts/referencias.bib"

curl -L $mainTex | cat > "$nombre.tex"

curl -L $bibliografia| cat > "referencias.bib"
