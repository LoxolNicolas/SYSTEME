#!/bin/bash

if [ -f $HOME/pseudo.cat ]; then
    if [ -f /tmp/convG21.cat ]; then
        cat ~/pseudo.cat >> /tmp/convG21.cat
        touch ~/online.cat
        chmod a+rx ~/online.cat
        tail -f /tmp/convG21.cat
fi
fi
