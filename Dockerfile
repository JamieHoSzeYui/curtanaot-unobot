FROM ubuntu

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
RUN apt-get -qq update
RUN apt-get -qq install -y locales git python3.7 openjdk-8-jdk wget unace python3 unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller device-tree-compiler liblzma-dev python-pip brotli liblz4-tool gawk aria2
RUN pip install backports.lzma protobuf pycrypto
RUN bash locales/compile.sh
RUN pip install python-telegram-bot --upgrade 
RUN pip install -r requirements.txt
RUN rm -f config.json.example
RUN touch config.json
RUN echo "{" >> config.json
RUN echo "    "token": "1398041799:AAFGRGyAQhs2pXndXy8birUJ9hkWR1gnUkM"," >> config.json
RUN echo "    "admin_list": [1179129272]," >> config.json
RUN echo "    "open_lobby": true," >> config.json
RUN echo "    "enable_translations": false," >> config.json
RUN echo "    "workers": 32," >> config.json
RUN echo "    "default_gamemode": "fast"," >> config.json
RUN echo "    "waiting_time": 120," >> config.json
RUN echo "    "time_removal_after_skip": 20," >> config.json
RUN echo "    "min_fast_turn_time": 15," >> config.json
RUN echo "    "min_players": 2" >> config.json
RUN echo "}" >> config.json
CMD ["python3","-m","bot.py"]
