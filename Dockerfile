FROM ubuntu:19.04
COPY check.sh /usr/local/bin/check.sh
RUN apt-get update && \
    apt-get install -y curl chromium-browser && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/* && \
    npm i -g npm && \
    npm i -g lighthouse && \
    mkdir -p /reports && \
    chmod 777 /reports && \
    chmod +x /usr/local/bin/check.sh
VOLUME /reports
WORKDIR /reports
