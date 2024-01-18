#!/usr/bin/env bash
files=$(ls -a $1 | grep -E '^\.[^.]+' | grep -v "^\.git$")
for file in $files; do
	rm -i ~/$file
	ln -s $1/$file ~/$file
	echo "Create soft link from $1/$file to ~/$file"
done
