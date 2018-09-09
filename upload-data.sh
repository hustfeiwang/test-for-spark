# /bin/bash
bin=`dirname $0`
bin=`cd $bin;pwd`
source $bin/conf.sh
mkdir $bin/logs
#放置在SPARK_HOME下面用于测试examples的小数据，是用于mllib
$HADOOP_HOME/bin/hadoop fs -mkdir /user/$USER_NAME
$HADOOP_HOME/bin/hadoop fs -put $SPARK_HOME/data /user/$USER_NAME

#放置在本测试工具中的例子，用于测试core的例子
$HADOOP_HOME/bin/hadoop fs -put $bin/data/* $HDFS_DIR/data
