# /bin/bash
bin=`dirname $0`
bin=`cd $bin;pwd`

#Spark和Hadoop变量
#export SPARK_HOME=/Users/bbw/netease/spark-2.2.1
SPARK_HOME=/Users/bbw/todo/spark-1.1.2
HADOOP_HOME=/Users/bbw/netease/hadoop-2.7.6
HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
HDFS_DIR=hdfs://localhost:9000//user/bbw
# HDFS USER_NAME related to hdfs://*/user/USER_NAME
USER_NAME=$USER
PARAMETERS=$bin/parameters.xml
# SPARK-SUBMIT配置
SPARK_MASTER=yarn
DEPLOY_MODE=client
# Streaming APP相关配置，需要自己创建的，且专用于测试
BOOTSTRAP_SERVERS=localhost:9092
TOPICS=test
GROUP=test-for-spark
#每秒Kafka Producer产生信息数
MESSAGES_PER_SEC=100
# 每条信息word数量
WORDS_PER_MESSAGE=100
# streaming 应用运行时长，单位为S
TIMEOUT=100
