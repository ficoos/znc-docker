FROM multiarch/alpine:armhf-edge
LABEL image=ficoos/znc:armhf
ENV ARCH armhf
MAINTAINER Saggi Mizrahi "saggi@mizrahi.cc"

RUN apk update && \
    apk add znc

RUN adduser znc znc
ADD docker-entrypoint.sh /entrypoint.sh
ADD znc.conf.default /znc.conf.default
RUN chmod 644 /znc.conf.default

VOLUME /znc-data

EXPOSE 6667
ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
