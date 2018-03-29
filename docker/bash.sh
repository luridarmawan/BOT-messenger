#!/bin/bash
echo BOT Template
echo
echo Project Name: BOT Template
echo   dir: /projects/bot
echo 
echo How to compile:
echo   $ cd /projects/bot/source/telegram/
echo   $ ./clean.sh
echo   $ ./compile.sh
echo
echo Output File:
echo   /projects/bot/public_htm/telegram.bin
echo

docker run -it -p 8080:80 bot-template bash
#docker run -it -v ~/shared-folder:/shared-folder -p 8080:80 fastplaz/$OS$RELEASE
