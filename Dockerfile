FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    wget \
    bash \
    coreutils \
    ca-certificates \
    curl \
    git \
    libcurl4-openssl-dev \
    libssl-dev \
    libssh2-1-dev \
    libzip-dev \
    make \
    openssl \
    unzip \
    zlib1g-dev \
    software-properties-common

WORKDIR /serveur

CMD bash -c "if [ -f server.log ]; then ./start.sh; else for i in {1..10}; do echo -ne '\n'; done; wget -q -O - https://get.pmmp.io/ | bash -s - -r; fi"
