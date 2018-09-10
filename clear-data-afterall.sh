# /bin/bash
bin=`dirname $0`
bin=`cd $bin;pwd`
source $bin/conf.sh

#删除mllib测试数据
$HADOOP_HOME/bin/hadoop fs -rmr /user/$USER_NAME/data
#删除streaming测试数据
$HADOOP_HOME/bin/hadoop fs -rmr $HDFS_DIR/checkpoint


