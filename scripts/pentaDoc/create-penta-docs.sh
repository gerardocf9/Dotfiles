#!/bin/sh

nombre=$1
titulo=$2

mkdir -p $nombre
cd $nombre
mkdir -p images src

cp /home/gerardo/Dotfiles/scripts/pentaDoc/main.tex "$nombre.tex"
sed -i "s/contenido-reemplazable/$nombre/g"  "$nombre.tex"
sed -i "s/contenido-titulo/$titulo/g"  "$nombre.tex"

cp /home/gerardo/Dotfiles/scripts/pentaDoc/header.png ./images/header.png

touch "src/$nombre.tex"

