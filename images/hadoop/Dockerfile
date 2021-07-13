FROM ubuntu:latest

WORKDIR /root

ARG HADOOP_HOME=/opt/hadoop
ARG HADOOP_VERSION=3.3.1

RUN apt-get update && apt-get -y install openjdk-8-jdk-headless wget tar zip 

RUN mkdir -p $HADOOP_HOME 

RUN wget https://downloads.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz  
RUN mv hadoop-${HADOOP_VERSION}.tar.gz $HADOOP_HOME \
    && cd $HADOOP_HOME  && tar xvfz hadoop-${HADOOP_VERSION}.tar.gz \
    && rm -f $HADOOP_HOME/hadoop-${HADOOP_VERSION}.tar.gz \
    && mkdir -p /nn /snn /yarn /dn /etc/hadoop/conf

VOLUME /nn /snn /yarn /dn /etc/hadoop/conf

ENV HADOOP_CONF_DIR /etc/hadoop/conf
ENV YARN_CONF_DIR /etc/hadoop/conf
ENV MAPRED_CONF_DIR /etc/hadoop/conf
ENV HADOOP_HOME $HADOOP_HOME/hadoop-${HADOOP_VERSION}
ENV PATH $PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64

COPY entrypoint.sh ./ 
RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]
