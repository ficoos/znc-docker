FROM kenntwasde/raspi_baseimage-docker
MAINTAINER Saggi Mizrahi "saggi@mizrahi.cc"

RUN echo "deb ftp://ftp.nl.debian.org/debian jessie-backports main contrib non-free" > /etc/apt/sources.list.d/backports.list
RUN gpg --keyserver pgpkeys.mit.edu --recv-key  8B48AD6246925553 && gpg -a --export 8B48AD6246925553 | apt-key add -
RUN gpg --keyserver pgpkeys.mit.edu --recv-key  7638D0442B90D010 && gpg -a --export 7638D0442B90D010 | apt-key add -
RUN apt-get update && apt-get install -y -t jessie-backports znc

RUN useradd znc
ADD docker-entrypoint.sh /entrypoint.sh
ADD znc.conf.default /znc.conf.default
RUN chmod 644 /znc.conf.default

VOLUME /znc-data

EXPOSE 6667
ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
