FROM ubuntu:latest AS base

RUN apt-get update && apt-get upgrade -y && \
    apt-get install git sudo -y

WORKDIR /root

RUN git clone https://github.com/Drahlous/dotfiles.git

WORKDIR /root/dotfiles

RUN ./bootstrap.sh

