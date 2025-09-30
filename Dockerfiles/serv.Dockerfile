FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    asterisk \
    curl \
    tcpdump \
    wget \
    nano \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /etc/asterisk

COPY configs/ /etc/asterisk/

EXPOSE 5060/udp 5060/tcp 10000-10100/udp

CMD ["sh", "-c", "tcpdump -i any port 5060 -w /var/log/asterisk/sip-dump.pcap & asterisk -f -vvv"]

