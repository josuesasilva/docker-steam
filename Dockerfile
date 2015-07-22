FROM ubuntu:12.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -yq sudo vim htop xterm
RUN echo 'steam ALL = NOPASSWD: ALL' > /etc/sudoers.d/steam && chmod 0440 /etc/sudoers.d/steam
RUN adduser --disabled-password --gecos 'Steam' steam && adduser steam video
RUN apt-get install -yq mesa-utils python-software-properties
RUN add-apt-repository -y ppa:bumblebee/stable
RUN apt-get update && apt-get -yq install bumblebee bumblebee-nvidia virtualgl linux-headers-generic
RUN gpasswd -a steam bumblebee

USER steam
