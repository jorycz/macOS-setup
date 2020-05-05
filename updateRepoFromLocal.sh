#!/bin/zsh

FILES=(.aliases .gitconfig .gitignore_global .vimrc .zshrc)

for f in ${FILES[@]}
do
 cp -va ~/${f} .
done

