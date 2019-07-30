FROM node:10.16.0-stretch
MAINTAINER AnthoDingo <lsbdu42@gmail.com>

ADD pasteboard.cron /etc/cron.daily/pasteboard

RUN apt update && \
    apt upgrade -y && \
    apt install -y git imagemagick && \
    chmod 755 /etc/cron.daily/pasteboard && \
    npm install -g coffee-script && \
    git clone https://github.com/AnthoDingo/pasteboard.git /pasteboard

WORKDIR /pasteboard
RUN npm install

ENV NODE_ENV production
ENV ORIGIN pasteboard.co
ENV MAX 7

VOLUME ["/pasteboard/public/storage/"]
EXPOSE 4000

CMD /pasteboard/run_local