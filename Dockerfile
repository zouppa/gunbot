FROM debian:stretch

RUN apt-get update \
 && apt-get install -y unzip \
 && apt-get clean

WORKDIR /tmp
ADD https://github.com/GuntharDeNiro/BTCT/releases/download/2304/gunthy_linux.zip .

RUN unzip -q gunthy_linux.zip \
 && rm -rf gunthy_linux.zip \
 && rm -rf __MACOSX \
 && mv gunthy_linux /gunbot 
 && rm /gunbot/config.js

 WORKDIR /gunbot

EXPOSE 5000
VOLUME [ "/gunbot/backups", "/gunbot/logs", "/gunbot/json", "/gunbot/config.js", "/gunbot/gunbotgui.db"]

CMD /gunbot/gunthy-linux