FROM debian:latest
USER root
WORKDIR /home/
RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_14.x  | bash -
RUN apt-get -y install nodejs