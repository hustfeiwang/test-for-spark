# /bin/bash
bin=`dirname $0`
bin=`cd $bin;pwd`
rm $bin/results/examples-core-failed.list
rm $bin/results/examples-core-success.list
rm  $bin/logs/*
source $bin/test-env.sh


function assert(){
if [ $? -eq 0 ];then
   echo  $1 Executed SUCCESS >>$bin/results/examples-core-success.list
   rm $bin/logs/examples-$1.log
else
    echo $1 Executed FAILED  >> $bin/results/examples-core-failed.list
fi
}
function run(){
$SPARK_HOME/bin/run-example org.apache.spark.examples.$@
}
:<<!
for app in $( cd  $SPARK_HOME/examples/src/main/scala/org/apache/spark/examples; ls *scala| grep -vE '(DFSReadWriteTest|HdfsTest|LocalALS|LocalFileLR|SparkHdfsLR|SparkKMeans|SparkPageRank)')
do
run ${app%.scala} >> $bin/logs/examples-core.${app%.scala}.log
assert core.${app%.scala}
done
!
hadoop fs -rmr $HDFS_DIR/LR_DATA
hadoop fs -rmr $HDFS_DIR/PR_DATA
hadoop fs -rmr $HDFS_DIR/KMEANS_DATA
run DFSReadWriteTest $bin/data/lr.txt  $HDFS_DIR/LR_DATA >> $bin/logs/examples-core.DFSReadWriteTest.log
assert core.DFSReadWriteTest
run DFSReadWriteTest $bin/data/pr.txt  $HDFS_DIR/PR_DATA >> $bin/logs/examples-core.DFSReadWriteTest.log
assert core.DFSReadWriteTest
run DFSReadWriteTest $bin/data/kmeans.txt  $HDFS_DIR/KMEANS_DATA >> $bin/logs/examples-core.DFSReadWriteTest.log
assert core.DFSReadWriteTest

run HdfsTest $HDFS_DIR/LR_DATA/dfs_read_write_test >> $bin/logs/examples-core.HdfsTest.log
assert core.HdfsTest

run LocalALS  1 2 3 4  >> $bin/logs/examples-core.LocalALs.log
assert core.LocalALs

run LocalFileLR $bin/data/lr.txt 2  >> $bin/logs/examples-core.LocalFileLR.log
assert core.LocalFileLR

run SparkHdfsLR $HDFS_DIR/LR_DATA/dfs_read_write_test  2 >> $bin/logs/examples-core.SparkHdfsLR.log
assert core.SparkHdfsLR

run SparkKMeans $HDFS_DIR/KMEANS_DATA/dfs_read_write_test 2 0.1 >> $bin/logs/examples-core.SparkKMeans.log
assert core.SparkKMeans

run SparkPageRank $HDFS_DIR/PR_DATA/dfs_read_write_test 2 >> $bin/logs/examples-core.SparkPageRank.log
assert core.SparkPageRank

hadoop fs -rmr $HDFS_DIR/LR_DATA
hadoop fs -rmr $HDFS_DIR/PR_DATA
hadoop fs -rmr $HDFS_DIR/KMEANS_DATA
