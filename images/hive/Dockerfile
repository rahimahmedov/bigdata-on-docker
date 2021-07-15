FROM hadoop-base:3.3.1

ARG HIVE_VERSION=3.1.2

WORKDIR /root

RUN wget https://downloads.apache.org/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz && \
    mkdir -p /opt/hive && \
    mv apache-hive-${HIVE_VERSION}-bin.tar.gz /opt/hive/ && \
    cd /opt/hive/ && \
    tar xvfz apache-hive-${HIVE_VERSION}-bin.tar.gz &&\
    rm -f apache-hive-3.1.2-bin.tar.gz

ENV HIVE_HOME /opt/hive/apache-hive-${HIVE_VERSION}-bin
ENV PATH $PATH:$HIVE_HOME/bin
ENV HIVE_CONF_DIR /etc/hadoop/conf
ENV METASTORE_HOME $HIVE_HOME

COPY mysql-connector-java_8.0.25-1ubuntu20.04_all.deb ./
RUN dpkg -i mysql-connector-java_8.0.25-1ubuntu20.04_all.deb && \
    cp /usr/share/java/mysql* $HIVE_HOME/lib

RUN useradd hive

COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh 

ENTRYPOINT ["/root/entrypoint.sh"] 
