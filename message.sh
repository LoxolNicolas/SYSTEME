#!/bin/bash

MESSAGE=$1
DATE=`date`
PSEUDO=`cat ~/pseudo.cat`

echo "$MESSAGE par $PSEUDO le $DATE" >> /tmp/convG21.cat