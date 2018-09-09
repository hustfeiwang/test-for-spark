# /bin/bash
bin=`dirname $0`
bin=`cd $bin;pwd`
rm $bin/results/examples-core-failed.list
rm $bin/results/examples-core-success.list
rm  $bin/logs/*
source $bin/conf.sh
source $bin/utils.sh
# 清空目录
clearDir
for app in $( cd  $SPARK_HOME/examples/src/main/scala/org/apache/spark/examples; ls *scala)
do
app=${app%.scala}
param=`parse $app $PARAMETERS`
eval runCore $app $param
done
# 清空目录
clearDir
