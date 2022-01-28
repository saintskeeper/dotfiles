#!/bin/bash

for i in `cat files-to-link.txt`;
do ln -s $i ~/$i;
done

echo "export PATH=/opt/homebrew/bin:$PATH" >> ~/.bash_profile && source ~/.bash_profile

# need a script to return true of uname is Darwin

unamestr=$(uname)

if [[ "$unamestr" == 'Darwin' ]]; then
	echo "export PATH=/opt/homebrew/bin:$PATH" >> ~/.bash_profile && source ~/.bash_profile
fi