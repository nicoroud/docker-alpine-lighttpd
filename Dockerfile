FROM alpine:latest

RUN apk update && \
apk add --no-cache lighttpd && \
rm -rf /var/cache/apk/*

ADD lighttpd.conf /etc/lighttpd/
RUN lighttpd -t -f /etc/lighttpd/lighttpd.conf

ENTRYPOINT ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
