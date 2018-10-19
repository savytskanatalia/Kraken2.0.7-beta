FROM alpine

RUN	apk add bash perl libstdc++ rsync libgomp \
RUN	apk add build-base \
RUN	cd /tmp \
RUN	wget https://github.com/savytskanatalia/Kraken2.0.7-beta/raw/master/kraken2-2.0.7-beta.tar.gz \
RUN	tar xf kraken2-2.0.7-beta.tar.gz \
RUN	cd kraken2-2.0.7-beta \
RUN	mkdir -p /opt/kraken2 \
RUN	./install_kraken2.sh /opt/kraken2 \
RUN	ln -s /opt/kraken2/kraken2 /usr/local/bin/kraken2 \
RUN	ln -s /opt/kraken2/kraken2-build /usr/local/bin/kraken2-build \
RUN	ln -s /opt/kraken2/kraken2-inspect /usr/local/bin/kraken2-inspect \
RUN	cd / \
RUN	rm -rf /tmp/* \
RUN	apk del build-base

LABEL	tool=kraken2 version=2.0.7-beta
WORKDIR	/data
