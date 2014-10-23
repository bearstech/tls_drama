FROM debian:jessie

RUN apt-get -q update
RUN apt-get -q install -y stunnel4 netcat

COPY stunnel.conf /root/
COPY server.key /root/
COPY server.crt /root/

EXPOSE 2103
WORKDIR /root
CMD pwd && nc -l 2003 & stunnel4 stunnel.conf
