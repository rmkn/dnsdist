FROM centos:7
MAINTAINER rmkn
RUN sed -i -e "s/en_US.UTF-8/ja_JP.UTF-8/" /etc/locale.conf
RUN ln -sf /usr/share/zoneinfo/Japan /etc/localtime 
RUN yum -y update
RUN localedef -v -c -i ja_JP -f UTF-8 ja_JP.UTF-8; echo ""

RUN yum -y install epel-release
RUN yum -y install dnsdist

RUN yum -y install iproute bind-utils

COPY entrypoint.sh /

EXPOSE 53

CMD ["/usr/bin/dnsdist","-u","dnsdist","-g","dnsdist","--supervised","--disable-syslog"]

ENTRYPOINT ["/entrypoint.sh"]

