# /bin/bash
function parse(){
pa=`xmllint --xpath "//$1" $2 |grep -o '>[[:space:][:punct:][:alnum:]]*<'`
pb=`echo ${pa##>}`
echo ${pb%%<}
}
function assertCore(){
if [ $? -eq 0 ];then
   echo  $1 Executed SUCCESS >>$bin/results/examples-core-success.list
   rm $bin/logs/examples-$1.log
else
    echo $1 Executed FAILED  >> $bin/results/examples-core-failed.list
fi
}
function assertMLlib(){
if [ $? -eq 0 ];then
   echo  $1 Executed SUCCESS >>$bin/results/examples-mllib-success.list
   rm $bin/logs/examples-$1.log
else
    echo $1 Executed FAILED  >> $bin/results/examples-mllib-failed.list
fi
}
function runCore(){
$SPARK_HOME/bin/run-example org.apache.spark.examples.$@  >> $bin/logs/examples-core.$1.log
}
function runMLlib(){
$SPARK_HOME/bin/run-example org.apache.spark.examples.$@  >> $bin/logs/examples-$1.log
}
function clearDir(){
$HADOOP_HOME/bin/hadoop fs -rmr $HDFS_DIR/LR_DATA
$HADOOP_HOME/bin/hadoop fs -rmr $HDFS_DIR/PR_DATA
$HADOOP_HOME/bin/hadoop fs -rmr $HDFS_DIR/KMEANS_DATA
$HADOOP_HOME/bin/hadoop fs -rmr $HDFS_DIR/DFSReadWriteTest
$HADOOP_HOME/bin/hadoop fs -rmr $HDFS_DIR/myModelPath
$HADOOP_HOME/bin/hadoop fs -rmr $HDFS_DIR/target
$HADOOP_HOME/bin/hadoop fs -rmr /tmp/kmeans
}