#!/bin/bash
#chmod +x build.sh
#https://www.cyberciti.biz/faq/how-to-execute-a-shell-script-in-linux/
docker build . -t web
docker run -dt -p 80:80 --name web02 web