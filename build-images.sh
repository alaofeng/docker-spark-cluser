#!/bin/bash
set -e

docker build -t laofeng/bigdata-base:7.18.376 ./docker/bigdata_base
docker build -t laofeng/apache-spark:2.4.6 ./docker/spark_sd
docker build -t laofeng/apache-spark-jupyter:2.4.6 ./docker/spark_jupyter