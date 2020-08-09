FROM debian:buster-slim

WORKDIR /bot
RUN echo "Wassup dumbo"
RUN ls
RUN chmod 777 /bot
RUN cd /bot
RUN apt-get -qq update
RUN apk add bc build-essential ccache curl neofetch g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop m4 openjdk-8-jdk pngcrush repo rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
RUN curl --create-dirs -L -o /usr/local/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
RUN chmod a+rx /usr/local/bin/repo
CMD ["python3","bot.py"]
