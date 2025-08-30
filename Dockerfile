#Dockerfile
FROM fedora:39
MAINTAINER AlexaZhou <AlexaZhou@163.com>

ENV LANG=C.UTF-8

#cp prebuild bin
COPY ./bin/jad158e/jad /usr/local/bin
COPY ./patch /root/patch
COPY ./assets /root/assets


#install package
RUN echo "Asia/Shanghai" > /etc/timezone && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo -e "fastestmirror=true\nmax_parallel_downloads=10" >> /etc/dnf/dnf.conf  && \
    yum install iputils net-tools telnet procps htop which wget tree vim file pcre pcre-devel -y && \
    yum install unzip lbzip2 bzip2-devel -y && \
    yum install openssl openssl-libs openssl-devel -y && \
    yum install git -y && \
    yum install gcc gcc-c++ -y && \
    yum install java maven -y && \
    yum install nodejs -y && \
    yum install nginx -y && \
    yum install redis -y && \
    yum install python3-pip -y && \
    python3 -m pip install -r /root/assets/requirements.txt && \
    yum clean all && \
    cd /root && wget https://go.dev/dl/go1.21.5.linux-amd64.tar.gz && \
    tar -C /usr/local -xvzf go1.21.5.linux-amd64.tar.gz && \
    rm -rf /tmp/* && \
    rm -rf /root/go1.21.5.linux-amd64.tar.gz && \
    cat patch/bashrc.txt >> /root/.bashrc



#End
