FROM ubuntu:14.04

RUN	apt-get update 
RUN	apt-get -y upgrade
RUN	apt-get -y install
RUN DEBIAN_FRONTEND=noninteractive apt-get autoremove
RUN	apt-get -y install build-essential 
RUN DEBIAN_FRONTEND=noninteractive apt-get autoremove
RUN apt-get -y install dialog
RUN	apt-get -y install cmake 
RUN	apt-get -y install exuberant-ctags 
RUN	apt-get -y install git 
RUN	apt-get -y install libboost-dev 
RUN	apt-get -y install libboost-program-options-dev 
RUN	apt-get -y install libboost-test-dev 
RUN	apt-get -y install libboost-thread-dev 
RUN	apt-get -y install libbz2-dev 
RUN	apt-get -y install libdigest-hmac-perl 
RUN	apt-get -y install libdigest-sha-perl 
RUN	apt-get -y install libevent-dev 
RUN	apt-get -y install libextutils-parsexs-perl 
RUN	apt-get -y install liblzo2-dev 
RUN	apt-get -y install liblz4-dev 
RUN	apt-get -y install libpcre3-dev 
RUN	apt-get -y install libsnappy-dev 
RUN	apt-get -y install libssl-dev 
RUN	apt-get -y install libxml2-dev 
RUN	apt-get -y install libxml-parser-perl 
RUN	apt-get -y install libz-dev 
RUN	apt-get -y install perl 
RUN	apt-get -y install make 
RUN	apt-get -y install vim

WORKDIR	/usr/src

RUN	git clone http://github.com/dataseries/Lintel.git
RUN	git clone http://github.com/dataseries/DataSeries.git
RUN	mkdir -p build/Lintel build/DataSeries
RUN	sed -i -e '/_UNUSED_/,+1d' Lintel/src/perl/xsubpp-cleanup
RUN	cd build/Lintel
RUN	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ../../Lintel
RUN	make 
RUN	make install
RUN cd ../..
RUN	cd build/DataSeries 
RUN	cmake	-DCMAKE_INSTALL_PREFIX:PATH=/usr -DWITH_POD2MAN:BOOL=OFF ../../DataSeries
RUN	make
RUN	make install

ENV HOME /root

WORKDIR /root

CMD ["bash"]
