#!/bin/bash -e

# Replace config values un properties file
perl -pi -e "s/zookeeper.connect=localhost/zookeeper.connect=$ZOOKEEPER_HOST/g" /kafka/config/kafka.properties
perl -pi -e "s/broker.id=0/broker.id=$BROKER_ID/g" /kafka/config/kafka.properties

/kafka/bin/kafka-server-start.sh /kafka/config/kafka.properties
