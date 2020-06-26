FROM laofeng/bigdata-base:7.18.376
MAINTAINER laofeng <387753061@qq.com>
LABEL author="laofeng" email="387753061@qq.com"
LABEL version="0.1"

ENV JAVA_HOME /usr/lib/jvm/java
ENV SPARK_VERSION 2.4.6
ENV HADOOP_VERSION 2.7
ENV PYTHON_VERSION 3.7.6
ENV SPARK_MASTER_LOG /opt/spark/logs


#RUN rm -f /usr/bin/python
RUN rm -f /usr/bin/python3 \
    && ln -s /usr/local/lib/python-${PYTHON_VERSION}/bin/python3 /usr/bin/python3
#RUN ln -s /usr/local/lib/python-${PYTHON_VERSION}/bin/python3 /usr/bin/python

#openjdk version "1.8.0_252
#下载spark,解压，删除压缩包，移动到/opt/spark
RUN cd /root \ 
    && wget https://mirrors.aliyun.com/apache/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && tar zxf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -C /opt \
    && rm -f spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && mv /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /opt/spark \
	&& mkdir -p ${SPARK_MASTER_LOG} 
	
ENV PATH /opt/spark/bin:$PATH
ENV PATH /opt/spark/sbin:$PATH
ENV SPARK_HOME /opt/spark

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080

ENV SPARK_WORKER_WEBUI_PORT 8081
ENV SPARK_WORKER_LOG /opt/spark/logs
ENV SPARK_MASTER "spark://spark-master:7077"

#修改python -> python3
#RUN rm -f /usr/bin/python
#RUN ln -s /usr/local/lib/python-${PYTHON_VERSION}/bin/python3 /usr/bin/python

ENV PYSPARK_PYTHON /usr/bin/python3
ENV PYSPARK_DRIVER_PYTHON /usr/bin/python3

# Configure container
COPY start-master.sh /
COPY start-worker.sh /
COPY log4j.properties /opt/spark/logs

#ENTRYPOINT ["/bin/bash"]
#EXPOSE 7077 8080
#CMD ["/start-master.sh"]