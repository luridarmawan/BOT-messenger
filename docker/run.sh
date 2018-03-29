#!/bin/bash
echo BOT Template
echo
echo

docker run -it -p 8080:80 bot-template
#docker run -it -v ~/shared-folder:/shared-folder -p 8080:80 fastplaz/$OS$RELEASE
