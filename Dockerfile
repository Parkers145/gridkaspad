FROM ubuntu:22.04

RUN apt update && \
  apt -y install wget openssh-server unzip curl

RUN wget https://github.com/kaspanet/kaspad/releases/download/v0.12.17/kaspad-v0.12.17-linux.zip && \
  unzip kaspad-v0.12.17-linux.zip 
 
  
RUN wget -O /sbin/zinit https://github.com/threefoldtech/zinit/releases/download/v0.2.14/zinit && \
  chmod +x /sbin/zinit

COPY zinit /etc/zinit
COPY scripts/start.sh /start.sh
COPY scripts/kaspad-init.sh /kaspad-init.sh


RUN chmod +x /sbin/zinit && chmod +x /start.sh && chmod +x /kaspad-init.sh
ENTRYPOINT  ["zinit", "init"]
