#!/bin/bash


if [ ! $SPARK_WORKER_WEBUI_PORT ];then    export SPARK_WORKER_WEBUI_PORT=8081; fi
if [ ! $SPARK_MASTER ];then    export SPARK_MASTER=spark://spark-master:7077; fi
if [ ! $SPARK_WORKER_LOG ];then    export SPARK_WORKER_LOG=$SPARK_HOME/logs; fi

export PYSPARK_PYTHON=/usr/bin/python3
export PYSPARK_DRIVER_PYTHON=/usr/bin/python3


. "${SPARK_HOME}/sbin/spark-config.sh"
. "${SPARK_HOME}/bin/load-spark-env.sh"

mkdir -p $SPARK_WORKER_LOG

ln -sf /dev/stdout $SPARK_WORKER_LOG/spark-worker.out

$SPARK_HOME/bin/spark-class org.apache.spark.deploy.worker.Worker --webui-port $SPARK_WORKER_WEBUI_PORT $SPARK_MASTER >> $SPARK_WORKER_LOG/spark-worker.out