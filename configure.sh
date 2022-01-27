#!/bin/bash

cp .aliases .bash_profile .bash_prompt .bashrc .functions .profile ~/


ln -s ../


for i in `cat file-to-link.txt`;
do ln -s $i ~/$i;
done