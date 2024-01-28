FROM ubuntu:latest AS base

RUN apt-get update && apt-get upgrade -y && \
    apt-get install git sudo -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu
RUN echo 'ubuntu:pass' | chpasswd

USER ubuntu
WORKDIR /home/ubuntu

ADD . /home/ubuntu/dotfiles

WORKDIR /home/ubuntu/dotfiles

ENTRYPOINT ["/bin/bash"]
