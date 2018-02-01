FROM ubuntu:16.04

RUN dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y curl lib32gcc1 lib32stdc++6 libstdc++6:i386 && \
    useradd -m steam

USER steam
WORKDIR /home/steam

RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - && \
    ./steamcmd.sh +quit && \
    ln -s ./linux32 ./.steam/sdk32
