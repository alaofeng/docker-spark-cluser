#!/bin/bash



export SPARK_MASTER_HOST=`hostname`

if [ ! $SPARK_MASTER_HOST ];then    export SPARK_MASTER_PORT=7077; fi
if [ ! $SPARK_MASTER_WEBUI_PORT ];then    export SPARK_MASTER_WEBUI_PORT=8080; fi
if [ ! $SPARK_MASTER_LOG ];then    export SPARK_MASTER_LOG=$SPARK_HOME/logs; fi

export PYSPARK_PYTHON=/usr/bin/python3
export PYSPARK_DRIVER_PYTHON=/usr/bin/python3
	
. "$SPARK_HOME/sbin/spark-config.sh"

. "$SPARK_HOME/bin/load-spark-env.sh"

mkdir -p $SPARK_MASTER_LOG

ln -sf /dev/stdout $SPARK_MASTER_LOG/spark-master.out


$SPARK_HOME/bin/spark-class org.apache.spark.deploy.master.Master -h $SPARK_MASTER_HOST -p $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT >> $SPARK_MASTER_LOG/spark-master.out