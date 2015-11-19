#!/bin/bash

: ${KAFKA_REST_CONSUMER_INSTANCE_TIMEOUT_MS}
: ${KAFKA_REST_CONSUMER_REQUEST_TIMEOUT_MS}
: ${KAFKA_REST_CONSUMER_REQUEST_MAX_BYTES}


if [ -n ${KAFKA_REST_CONSUMER_INSTANCE_TIMEOUT_MS} ]; then
  echo "consumer.instance.timeout.ms=${KAFKA_REST_CONSUMER_INSTANCE_TIMEOUT_MS}" >> /etc/kafka-rest/kafka-rest.properties
fi

if [ -n ${KAFKA_REST_CONSUMER_REQUEST_TIMEOUT_MS} ]; then
  echo "consumer.request.timeout.ms=${KAFKA_REST_CONSUMER_REQUEST_TIMEOUT_MS}" >> /etc/kafka-rest/kafka-rest.properties
fi

if [ -n ${KAFKA_REST_CONSUMER_REQUEST_MAX_BYTES} ]; then
  echo "consumer.request.max.bytes=${KAFKA_REST_CONSUMER_REQUEST_MAX_BYTES}" >> /etc/kafka-rest/kafka-rest.properties
fi

echo "#generated by start-kafka-rest.sh at $(date)" >> /etc/kafka-rest/kafka-rest.properties

exec ./opt/confluent/bin/kafka-rest-start /etc/kafka-rest/kafka-rest.properties
