FROM hive-base:3.1.2

WORKDIR /root

RUN wget https://dlcdn.apache.org/spark/spark-3.3.1/spark-3.3.1-bin-hadoop3.tgz && \
    mkdir -p /opt/spark && \
    mv spark-3.3.1-bin-hadoop3.tgz /opt/spark/ && \
    cd /opt/spark/ && \
    tar xvfz spark-3.3.1-bin-hadoop3.tgz && \
    rm -f spark-3.3.1-bin-hadoop3.tgz

ENV SPARK_HOME /opt/spark/spark-3.3.1-bin-hadoop3

# installing zeppelin
RUN wget https://dlcdn.apache.org/zeppelin/zeppelin-0.10.1/zeppelin-0.10.1-bin-netinst.tgz && \
    mkdir -p /opt/zeppelin && \
    mv zeppelin-0.10.1-bin-netinst.tgz /opt/zeppelin  && \
    cd /opt/zeppelin && \
    tar xvfz zeppelin-0.10.1-bin-netinst.tgz && \
    rm -f zeppelin-0.10.1-bin-netinst.tgz && \
    mkdir -p /notebook && chmod -R 777 /notebook && \
    mkdir -p /logs && chmod -R 777 /logs

ENV ZEPPELIN_LOG_DIR /logs 
ENV ZEPPELIN_NOTEBOOK_DIR /notebook
ENV ZEPPELIN_HOME /opt/zeppelin/zeppelin-0.10.1-bin-netinst
ENV ZEPPELIN_ADDR 0.0.0.0
ENV ZEPPELIN_PORT 8080

VOLUME /notebook /logs

ENV PATH $PATH:$SPARK_HOME/bin:$ZEPPELIN_HOME/bin

COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh 

ENTRYPOINT ["/root/entrypoint.sh"] 