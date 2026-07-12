#!/bin/sh
# Genera un proyecto de tesis de maestría en LaTeX con formato APA 6ª ed.
# Uso: create-apa-maestria.sh <nombre> ["Título de la tesis"]

nombre=$1
titulo=${2:-$1}

if [ -z "$nombre" ]; then
    echo "Uso: $0 <nombre> [\"Título de la tesis\"]" >&2
    exit 1
fi

mkdir -p "$nombre"
cd "$nombre" || exit 1
mkdir -p images src

base="https://github.com/gerardocf9/Dotfiles/raw/main/scripts/apaMaestria"
bib="https://github.com/gerardocf9/Dotfiles/raw/main/scripts/referencias.bib"

curl -L "$base/main.tex" -o "$nombre.tex"
curl -L "$bib"           -o "referencias.bib"

# Sustituir el título en la portada
sed -i "s/contenido-titulo/$titulo/g" "$nombre.tex"

# Apartado inicial de ejemplo
touch "src/introduccion.tex"

echo "Proyecto '$nombre' listo. Compila con:"
echo "  cd $nombre && pdflatex $nombre && biber $nombre && pdflatex $nombre && pdflatex $nombre"
