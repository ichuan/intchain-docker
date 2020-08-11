FROM debian:9
EXPOSE 8555
WORKDIR /opt

RUN mkdir /opt/coin
RUN apt update && apt install -y wget python build-essential
RUN wget https://nodejs.org/dist/latest-v8.x/node-v8.17.0-linux-x64.tar.gz -O - | tar -C /usr/ --exclude CHANGELOG.md --exclude LICENSE --exclude README.md --strip-components 1 -xzf -
RUN wget https://github.com/intfoundation/int/archive/V3.1.0.tar.gz -O - | tar -C /opt/coin --strip-components 1 -xzf -
RUN cd /opt/coin && npm install

# cleanup
RUN apt remove -y python build-essential && apt autoremove -y && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/coin
ENTRYPOINT ["node", "src/tool/startDPeer.js", "--main", "--dataDir", "/opt/data", "--rpchost", "0.0.0.0"]
