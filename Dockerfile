#Dockerfile
FROM fedora:28
MAINTAINER AlexaZhou <AlexaZhou@163.com>

ENV LANG=C.UTF-8

#install package
RUN yum install yum-plugin-fastestmirror -y && echo "fastestmirror=true" >> /etc/dnf/dnf.conf  && \
    yum install iputils net-tools procps htop which wget tree vim file -y && \
    yum install unzip lbzip2 bzip2-devel -y && \
    yum install openssl openssl-static openssl-devel -y && \
    yum install git -y && \
    yum install gcc gcc-c++ -y && \
    yum install java maven -y && \
    yum install nodejs -y && \
    yum install nginx -y && \
    yum clean all && \  
    rm -rf /tmp/*

#End
