FROM centos:7
MAINTAINER laofeng <387753061@qq.com>
LABEL author="laofeng" email="387753061@qq.com"
LABEL version="0.1"

ENV JAVA_HOME /usr/lib/jvm/java
ENV PYTHON_VERSION 3.7.6

#安装工具
RUN set -ex
RUN yum update -y && yum upgrade -y \
    && yum -y  groupinstall "Development tools" \
    && yum install -y byobu curl htop man unzip nano wget curl java-1.8.0-openjdk java-1.8.0-openjdk-devel.x86_64 gcc make \
	zlib* bzip2-devel openssl-devel openssl-static ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel libffi-devel lzma \
	&& yum clean all

#编译python 3.7.6
RUN cd /usr/local/src/ \
    && wget https://mirrors.huaweicloud.com/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tar.xz \
	&& tar xvf Python-${PYTHON_VERSION}.tar.xz \
	&& rm -f Python-${PYTHON_VERSION}.tar.xz \
    && cd Python-${PYTHON_VERSION} \
	&& ./configure --prefix=/usr/local/lib/python-${PYTHON_VERSION} \
	&& make && make install \
	&& ln -s /usr/local/lib/python-${PYTHON_VERSION}/bin/python3 /usr/bin/python3 \
	&& ln -s /usr/local/lib/python-${PYTHON_VERSION}/bin/pip3 /usr/bin/pip3 \
	&& cd /usr/local/src \
	&& rm -rf Python-${PYTHON_VERSION} \
	&& mkdir /root/.pip/
	

#pip source -> aliyun	
COPY pip.conf /root/.pip/
	
ENTRYPOINT ["/bin/bash"]




