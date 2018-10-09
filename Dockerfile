FROM alpine

RUN	apk add bash perl libstdc++ rsync libgomp \
&&	apk add build-base \
&&	cd /tmp \
&&	wget https://github.com/savytskanatalia/Kraken2.0.7-beta/raw/master/kraken2-2.0.7-beta.tar.gz \
&&	tar xf kraken2-2.0.7-beta.tar.gz \
&&	cd kraken2-2.0.7-beta \
&&	mkdir -p /opt/kraken2 \
&&	./install_kraken2.sh /opt/kraken2 \
&&	ln -s /opt/kraken2/kraken2 /usr/local/bin/kraken2 \
&&	ln -s /opt/kraken2/kraken2-build /usr/local/bin/kraken2-build \
&&	ln -s /opt/kraken2/kraken2-inspect /usr/local/bin/kraken2-inspect \
&&	cd .. \
&&	wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.7.1+-x64-linux.tar.gz \
&&	tar -xvzf ncbi-blast-2.7.1+-x64-linux.tar.gz \
&&	mv ncbi-blast-2.7.1+-x64-linux /usr/local/bin/ncbi-blast
&&	cd / \
&&	rm -rf /tmp/* \
&&	apk del build-base
&&	
LABEL	tool=kraken2 version=2.0.7-beta
WORKDIR	/data
