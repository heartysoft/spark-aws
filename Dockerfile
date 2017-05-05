FROM openjdk:8u121-jre-alpine
MAINTAINER Luis Angel Vicente Sanchez "luis@bigcente.ch"

RUN apk add --no-cache bash coreutils procps python wget \
 && rm -rf /var/cache/apk/*

ENV SPARK_VERSION=2.1.0
ENV HADOOP_VERSION=2.7

RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -P /tmp \
 && tar -xzf /tmp/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -C /usr/local/ \
 && cd /usr/local \
 && ln -s spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
 && rm -f /tmp/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

ADD log4j.properties /usr/local/spark/conf/log4j.properties
ADD spark-defaults.conf /usr/local/spark/conf/spark-defaults.conf
ADD spark-env.sh /usr/local/spark/conf/spark-env.sh
ENV PATH $PATH:/usr/local/spark/bin
ENV SPARK_HOME /usr/local/spark
WORKDIR /usr/local/spark
