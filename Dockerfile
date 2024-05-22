FROM ubuntu:22.04

RUN apt update && \
  apt -y install wget openssh-server unzip golang-go

RUN wget -o /sbin/zinit https://github.com/kaspanet/kaspad/releases/download/v0.12.17/kaspad-v0.12.17-linux.zip && \
  unzip kaspad-v0.12.17-linux.zip && \
  mv kaspad-v0.12.17-linux/bin/* /usr/local/bin

RUN wget -O /sbin/zinit https://github.com/threefoldtech/zinit/releases/download/v0.2.5/zinit && \
  chmod +x /sbin/zinit

COPY zinit /etc/zinit
COPY start.sh /start.sh


RUN chmod +x /sbin/zinit && chmod +x /start.sh
ENTRYPOINT  ["zinit", "init"]
