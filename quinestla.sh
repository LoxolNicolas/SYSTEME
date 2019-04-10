#!/bin/bash

LISTE=`ls ~/../*/pseudo.cat`

for i in $LISTE 
do
    cat "$i"
done