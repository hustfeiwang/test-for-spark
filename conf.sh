# /bin/bash
bin=`dirname $0`
bin=`cd $bin;pwd`

#Spark和Hadoop变量
#export SPARK_HOME=/Users/bbw/netease/spark-2.2.1
SPARK_HOME=/root/todo/spark-1.1.1
HADOOP_HOME=/root/todo/hadoop-2.7.6
HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
HDFS_DIR=hdfs://netease:9000/user/root
# HDFS USER_NAME related to hdfs://*/user/USER_NAME
USER_NAME=$USER
PARAMETERS=$bin/parameters.xml
# SPARK-SUBMIT配置
SPARK_MASTER=yarn
DEPLOY_MODE=client
