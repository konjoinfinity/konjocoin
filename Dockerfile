FROM ubuntu:20.04
COPY ./konjocoin.conf /root/.konjocoin/konjocoin.conf
COPY . /konjocoin
WORKDIR /konjocoin
#shared libraries and dependencies
RUN apt update
RUN apt-get install -y build-essential libtool autotools-dev automake pkg-config bsdmainutils python3
RUN apt-get install -y libssl-dev libevent-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev
RUN apt-get install -y libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler
#BerkleyDB for wallet support
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update
RUN wget http://download.oracle.com/berkeley-db/db-4.8.30.zip
RUN unzip db-4.8.30.zip
RUN sed -i 's/__atomic_compare_exchange/__atomic_compare_exchange_db/g' db-4.8.30/dbinc/atomic.h
WORKDIR db-4.8.30/build_unix
RUN ../dist/configure --prefix=/usr/local --enable-cxx
RUN make
RUN make install
#build konjocoin source
WORKDIR /konjocoin
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
#open service port
EXPOSE 8888 18888
#run konjocoind
CMD ["konjocoind", "--printtoconsole"]
