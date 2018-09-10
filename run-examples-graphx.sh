# /bin/bash
bin=`dirname $0`
bin=`cd $bin;pwd`
rm $bin/results/examples-graphx-failed.list
rm $bin/results/examples-graphx-success.list
source $bin/conf.sh
source $bin/utils.sh
# 清空生成数据目录防止目录已存在
clearDir

for app in $( cd  $SPARK_HOME/examples/src/main/scala/org/apache/spark/examples/graphx; ls *scala)
do
app=${app%.scala}
param=`parse $app $PARAMETERS`
eval runGraphx graphx.$app  $param
done
#清空生成数据目录
clearDir
