FROM rmkn/centos7
MAINTAINER rmkn

RUN yum -y install iproute bind-utils

RUN yum -y install dnsdist

COPY entrypoint.sh /

EXPOSE 53 53/udp

CMD ["/usr/bin/dnsdist","-u","dnsdist","-g","dnsdist","--supervised","--disable-syslog"]

ENTRYPOINT ["/entrypoint.sh"]

