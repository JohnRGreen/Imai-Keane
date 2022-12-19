#!/bin/bash

echo '' ; echo 'Reproduce text of paper:' ; echo ''

DIR=$(dirname $(realpath $0))

# Make sure tlmgr (texlive manager) is installed and initialized
[[ "$(which tlmgr)" == "" ]] && echo 'tlmgr is not available; install texlive and rerun'
[[ "$(which ~/.tlpkg)" == "" ]] && tlmgr init-usertree

texname=ImaiKeane
output_directory='LaTeX'
file=ImaiKeane

# cd "$DIR/.."

# Compile PDF and slides
for file in "$texname" "$texname"_slides; do
    echo '' ; echo "Compiling $file" ; echo ''
#    dep="pwd ; texliveonfly $file"
#    echo dep="$dep"
#    eval "$dep"
    cmd="pdflatex -halt-on-error -output-directory=$output_directory $file"
    eval "$cmd"
    eval "$cmd > /dev/null" # Hide second output to reduce clutter
    bibtex $output_directory/"$file"
    eval "$cmd" # Hide third output to reduce clutter
    eval "$cmd > /dev/null" 
    echo '' ; echo "Compiled $file" ; echo ''
done

if [[ -e "$output_directory/$texname.pdf" ]]; then
    echo "Paper has been compiled to $output_directory/$texname.pdf"
    echo "and copied to ./$texname.pdf"
    cp "$output_directory/$texname.pdf" "./$texname.pdf"
else
    echo "Something went wrong and the paper is not in $output_directory/$texname.pdf"
fi

echo ''
