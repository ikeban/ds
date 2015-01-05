FROM ubuntu:14.04

RUN	apt-get update 
RUN	apt-get -y upgrade
RUN	apt-get -y install
RUN	apt-get build-essential 
RUN	apt-get -y cmake 
RUN	apt-get -y exuberant-ctags 
RUN	apt-get -y git 
RUN	apt-get -y libboost-dev 
RUN	apt-get -y libboost-program-options-dev 
RUN	apt-get -y libboost-test-dev 
RUN	apt-get -y libboost-thread-dev 
RUN	apt-get -y libbz2-dev 
RUN	apt-get -y libdigest-hmac-perl 
RUN	apt-get -y libdigest-sha-perl 
RUN	apt-get -y libevent-dev 
RUN	apt-get -y libextutils-parsexs-perl 
RUN	apt-get -y liblzo2-dev 
RUN	apt-get -y liblz4-dev 
RUN	apt-get -y libpcre3-dev 
RUN	apt-get -y libsnappy-dev 
RUN	apt-get -y libssl-dev 
RUN	apt-get -y libxml2-dev 
RUN	apt-get -y libxml-parser-perl 
RUN	apt-get -y libz-dev 
RUN	apt-get -y perl 
RUN	apt-get -y make 
RUN	apt-get -y vim

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
