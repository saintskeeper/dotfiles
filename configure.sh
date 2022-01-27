#!/bin/bash

for i in `cat files-to-link.txt`;
do ln -s $i ~/$i;
done