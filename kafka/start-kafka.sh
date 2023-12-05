#!/bin/bash -e

# Replace config values un properties file
perl -pi -e "s/zookeeper.connect=localhost/zookeeper.connect=$ZOOKEEPER_HOST/g" /kafka/config/kafka.properties
perl -pi -e "s/broker.id=0/broker.id=$BROKER_ID/g" /kafka/config/kafka.properties
# Allow external connections to the Kafka instance
perl -pi -e "s/#advertised.listeners=PLAINTEXT:\/\/your.host.name:9092/advertised.listeners=PLAINTEXT:\/\/localhost:9092/g" /kafka/config/kafka.properties
# Change log directory in case of instance restart
perl -pi -e "s/log.dirs=\/tmp\/kafka-logs/log.dirs=\/kafka\/kafka-logs/g" /kafka/config/kafka.properties

/kafka/bin/kafka-server-start.sh /kafka/config/kafka.properties
