# /bin/bash
bin=`dirname $0`
bin=`cd $bin;pwd`

#Spark和Hadoop变量
export SPARK_HOME=/Users/bbw/netease/spark-2.2.1
export HADOOP_HOME=/Users/bbw/netease/hadoop-2.7.6
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export HDFS_DIR=hdfs://127.0.0.1:9000/user/bbw
# HDFS USER_NAME related to hdfs://*/user/USER_NAME
export USER_NAME=$USER
export PARAMETERS=$bin/parameters.xml
