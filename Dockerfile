FROM ubuntu:19.04
RUN apt-get update && \
    apt-get install -y curl chromium-browser
COPY check.sh /usr/local/bin/check.sh
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs && \
    npm i -g npm && \
    npm i -g lighthouse && \
    mkdir -p /reports && \
    chmod 777 /reports && \
    chmod +x /usr/local/bin/check.sh
VOLUME /reports
WORKDIR /reports
