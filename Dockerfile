FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    wget \
    bash

RUN wget -q -O - https://get.pmmp.io/ | bash -s - -r

CMD ["bash"]
