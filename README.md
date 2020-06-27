# Spark standalone Cluster with Docker & docker-compose

创建一个spark standalone集群的调试环境。

整个镜像分为三层：

- bigdata base： centos7+python3.7.2+openjdk8
- apache-spark：bigdata_base + spark 2.4.6
- apache-spark-jupyter:   apache-spark + Jupiter

### 使用普通spark集群:

Docker-compose up -d --scale spark-worker=2

启动集群启动后spark master为：spark://localhost:7077

访问spark ui：http://localhost:8080

### 使用支持pyspark&jupyter的spark集群:

Docker-compose -f docker-compose-jupyter.yml up -d --scale spark-worker=2

启动集群启动后spark master为：spark://localhost:7077

另外：pyspark已经加载hudi包，可以直接进行hudi的调试

访问spark ui：http://localhost:8080

jupyter访问地址为：http://localhost:18888, 登录密码为：laofeng

### 编译images

执行build-images.sh

### 其他

1. 共享了三个目录：

- app， 用于存放ipynb，文件
- data，存储测试数据
- logs，spark日志（包括jupyter）

2. 将pip地址，指向了aliyun
