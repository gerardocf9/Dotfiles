#!/bin/sh

nombre=$1

mkdir -p $nombre
cd $nombre
mkdir -p images src

touch "$nombre.tex"#compilable
touch "src/$nombre.tex"#contenido, donde se escribira


printf $documento > "$nombre.tex"

