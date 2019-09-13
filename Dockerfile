FROM ubuntu:latest
WORKDIR /app

RUN apt-get update
RUN apt-get install -y rsyslog mailutils
RUN apt-get install -y vim less curl

RUN postconf -e smtpd_tls_security_level=encrypt

EXPOSE 25
ENV mailname localhost

ENTRYPOINT rsyslogd \
    && postconf -e myhostname=$(hostname -f) \
    && echo $mailname > /etc/mailname \
    && postfix start \
    && tail -f /var/log/mail.log
