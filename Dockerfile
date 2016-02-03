FROM centos:6
MAINTAINER pepabo.com

RUN yum install -y tar patch gcc perl-core mysql-devel

ADD . /opt/mogilefs
WORKDIR /opt/mogilefs
RUN ./install.sh

EXPOSE 7001
ENTRYPOINT ["bash", "/opt/mogilefs/docker/entrypoint.sh"]
CMD ["mogilefsd"]
