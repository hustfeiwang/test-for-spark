# /bin/bash
bin=`dirname $0`
bin=`cd $bin;pwd`
rm $bin/results/examples-mllib-failed.list
rm $bin/results/examples-mllib-success.list
source $bin/conf.sh
source $bin/utils.sh
# 清空生成数据目录防止目录已存在
clearDir

#RegressionMetricsExample 官方spark都存在类型转换错误，streaming相关由于缺乏数据，不跑
for app in $( cd  $SPARK_HOME/examples/src/main/scala/org/apache/spark/examples/mllib; ls *scala| grep -vE '(AbstractParams|RegressionMetricsExample|StreamingKMeansExample|StreamingLinearRegressionExample|StreamingLogisticRegression|StreamingTestExample)')
do
app=${app%.scala}
param=`parse $app $PARAMETERS`
eval runMLlib mllib.$app  $param
done


#清空生成数据目录
clearDir
