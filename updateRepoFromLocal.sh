#!/bin/zsh

FILES=(.aliases .gitconfig .gitignore_global .vimrc .zshrc)

echo "This script will update files in this repository with files from local machine:"
echo "-------------"
echo $FILES
echo "-------------"
echo "Should I continue?"
read a

for f in ${FILES[@]}
do
 cp -va ~/${f} .
done

echo
echo "Do NOT forget to commit and pull this change."
echo

