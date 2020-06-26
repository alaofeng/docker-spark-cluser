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

#atd
#echo "${SPARK_HOME}/bin/pyspark --master ${SPARK_MASTER} >${SPARK_HOME}/logs/pyspark.log" > at_pyspark.sh 
#chmod 777 at_pyspark.sh 
#at -f ./at_pyspark.sh now + 1min

nohup pyspark --packages io.delta:delta-core_2.12:0.7.0 --conf "spark.sql.extensions=io.delta.sql.DeltaSparkSessionExtension" --conf "spark.sql.catalog.spark_catalog=org.apache.spark.sql.delta.catalog.DeltaCatalog" > ${SPARK_HOME}/logs/pyspark.log 2>&1 &
#pyspark >  ${SPARK_HOME}/logs/pyspark.log  2>&1  &  
$SPARK_HOME/bin/spark-class org.apache.spark.deploy.master.Master -h $SPARK_MASTER_HOST -p $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT >> $SPARK_MASTER_LOG/spark-master.out



#touch ${SPARK_HOME}/logs/1.txt
#pyspark >> $SPARK_MASTER_LOG/spark-master.out
#touch ${SPARK_HOME}/logs/2.txt