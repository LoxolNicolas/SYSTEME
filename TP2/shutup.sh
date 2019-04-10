#!/bin/bash

ps -u niloxol | grep tail | cut -d " " -f 1
rm ~/online.cat
