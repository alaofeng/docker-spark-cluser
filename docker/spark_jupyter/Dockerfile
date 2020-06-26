FROM laofeng/apache-spark:2.4.6
MAINTAINER laofeng <387753061@qq.com>
LABEL author="laofeng" email="387753061@qq.com"
LABEL version="0.1"

ENV JAVA_HOME /usr/lib/jvm/java
ENV SPARK_VERSION 2.4.6
ENV HADOOP_VERSION 2.7
ENV PYTHON_VERSION 3.7.6
ENV SPARK_MASTER_LOG /opt/spark/logs


RUN yum install -y at

# 'sha1:5c923ae844bf:422d8add7d971f43d45bf86ed83288e820b6a18c'
RUN pip3 install jupyter \
    && ln -s /usr/local/lib/python-3.7.6/bin/jupyter /usr/bin/jupyter \
    && ln -s /usr/local/lib/python-3.7.6/bin/ipython /usr/bin/ipython \
    && mkdir /root/.jupyter



#修改python -> python3
#RUN rm -f /usr/bin/python
#RUN ln -s /usr/local/lib/python-${PYTHON_VERSION}/bin/python3 /usr/bin/python
ENV PYSPARK_PYTHON /usr/bin/python3
ENV PYSPARK_DRIVER_PYTHON /usr/bin/python3
ENV PYSPARK_DRIVER_PYTHON jupyter
ENV PYSPARK_DRIVER_PYTHON_OPTS 'notebook'

COPY jupyter_notebook_config.py /root/.jupyter
COPY start-pyspark.sh /
COPY start-pyspark-deltalake.sh /
COPY start-pyspark-hudi.sh /
RUN rm -f $SPARK_HOME/bin/pyspark
COPY pyspark $SPARK_HOME/bin/


# Configure container

ENTRYPOINT ["/bin/bash"]
#EXPOSE 7077 8080
#CMD ["/start-master.sh"]

