FROM alpine:3.6

RUN adduser -S -D -H hugo

COPY bin-hugo /bin/hugo

USER hugo
CMD [/bin/hugo]
