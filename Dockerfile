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

RUN wget -q -O - https://get.pmmp.io/ | bash -s - -r

CMD ["bash"]
