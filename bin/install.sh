#!/bin/bash


installToHome(){
for i `cat dependencies.txt`;do;cp $i ~/;done;
}