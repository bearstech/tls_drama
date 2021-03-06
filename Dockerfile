FROM debian:jessie

RUN apt-get -q update
RUN apt-get -q install -y stunnel4 socat

COPY stunnel.conf /root/
COPY tls_drama.key /root/
RUN chmod 600 /root/tls_drama.key
COPY tls_drama.crt /root/

EXPOSE 2103
EXPOSE 2003
WORKDIR /root
CMD pwd && socat -v tcp-l:2003,fork exec:'/bin/cat' & stunnel4 stunnel.conf
