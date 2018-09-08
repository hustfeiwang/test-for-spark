# /bin/bash
bin=`dirname $0`
bin=`cd $bin;pwd`
source $bin/conf.sh

#放置在SPARK_HOME下面用于测试examples的小数据，是用于mllib
$HADOOP_HOME/bin/hadoop fs -mkdir /user/$USER_NAME
$HADOOP_HOME/bin/hadoop fs -put $SPARK_HOME/data /user/$USER_NAME

#放置在本测试工具中的例子，用于测试core的例子
$HADOOP_HOME/bin/hadoop fs -mkdir $HDFS_DIR/LR_DATA_TEST
$HADOOP_HOME/bin/hadoop fs -put $bin/data/lr.txt $HDFS_DIR/LR_DATA_TEST
$HADOOP_HOME/bin/hadoop fs -mkdir $HDFS_DIR/PR_DATA
$HADOOP_HOME/bin/hadoop fs -put $bin/data/pr.txt $HDFS_DIR/PR_DATA_TEST
$HADOOP_HOME/bin/hadoop fs -mkdir $HDFS_DIR/KMEANS_DATA_TEST
$HADOOP_HOME/bin/hadoop fs -put $bin/data/kmeans.txt $HDFS_DIR/KMEANS_DATA_TEST
