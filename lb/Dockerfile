FROM ubuntu


RUN apt-get update -y
RUN apt install vim htop haproxy iputils-ping systemctl -y
ADD ./haproxy.cfg /etc/haproxy/haproxy.cfg



EXPOSE 3306
EXPOSE 8080

CMD ["tail", "-f", "/dev/null"]
ENTRYPOINT ["systemctl", "start", "haproxy"]