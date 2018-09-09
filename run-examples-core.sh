# /bin/bash
bin=`dirname $0`
bin=`cd $bin;pwd`
rm $bin/results/examples-core-failed.list
rm $bin/results/examples-core-success.list
rm  $bin/logs/*
source $bin/conf.sh
source $bin/utils.sh
# 不需要加参数的例子
for app in $( cd  $SPARK_HOME/examples/src/main/scala/org/apache/spark/examples; ls *scala| grep -vE '(DFSReadWriteTest|HdfsTest|LocalALS|LocalFileLR|SparkHdfsLR|SparkKMeans|SparkPageRank)')
do
runCore ${app%.scala} 
done
# 为了保险，清空目录
clearDir
#需要参数的例子
for app in DFSReadWriteTest HdfsTest LocalALS LocalFileLR SparkHdfsLR SparkKMeans SparkPageRank
do
 param=`parse $app $PARAMETERS`
eval runCore $app $param
done
# 清空生成的数据目录
clearDir
