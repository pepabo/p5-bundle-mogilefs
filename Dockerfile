FROM centos:6
MAINTAINER pepabo.com

RUN yum install -y tar gcc perl-core  mysql-devel

ADD . /opt/mogilefs
WORKDIR /opt/mogilefs
RUN ./install.sh

ENTRYPOINT ["bash", "/opt/mogilefs/env"]
