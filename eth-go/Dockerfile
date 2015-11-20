# Use Ubuntu:14.04 as the base image
FROM ubuntu:14.04

# Use a fast, German Mirror
RUN echo deb http://mirror.netcologne.de/ubuntu/ trusty main restricted universe multiverse >> /tmp/sources.list
RUN echo deb http://mirror.netcologne.de/ubuntu/ trusty-updates main restricted universe multiverse >> /tmp/sources.list
RUN echo deb http://mirror.netcologne.de/ubuntu/ trusty-backports main restricted universe multiverse >> /tmp/sources.list
RUN echo deb http://mirror.netcologne.de/ubuntu/ trusty-security main restricted universe multiverse >> /tmp/sources.list
RUN sudo cp /tmp/sources.list /etc/apt/sources.list
RUN sudo apt-get update -y


# Install Go Client (see https://www.ethereum.org/cli)
#RUN mkdir /tmp
RUN sudo apt-get install -y curl
WORKDIR /tmp
RUN curl https://install-geth.ethereum.org -L >install-geth.sh
RUN chmod a+x /tmp/install-geth.sh
RUN echo y | /tmp/install-geth.sh

RUN mkdir /data

EXPOSE 4000
EXPOSE 30303
EXPOSE 30303/udp
