#!/usr/bin/env bash
if [[ $# -ne 0 ]]; then
	path=$(realpath -s "$1")
else
	path=$(realpath -s .)
fi
files=$(ls -a $path | grep -E '^\.[^.]+' | grep -v "^\.git$")
for file in $files; do
	if [[ -f $file ]]; then
		rm -i ~/$file
	fi
	ln -s $path/$file ~/$file
	echo "Create soft link from $1/$file to ~/$file"
done
# set gitignore_global as globally ignored file rules
git config --global core.excludesfile ~/.gitignore_global
