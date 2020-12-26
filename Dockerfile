FROM node:alpine3.12
MAINTAINER wuhanstudio <wuhanstudio@qq.com>

ADD pasteboard.cron /etc/cron.daily/pasteboard

RUN apk update && \
    apk add imagemagick && \
    chmod 755 /etc/cron.daily/pasteboard && \
    npm install -g coffee-script

COPY ./ /pasteboard/

WORKDIR /pasteboard/
RUN npm install

ENV NODE_ENV production
ENV ORIGIN pasteboard.wuhanstudio.cc
ENV MAX 7

VOLUME ["/pasteboard/public/storage/"]
EXPOSE 3000

CMD LOCAL=true coffee app.coffee