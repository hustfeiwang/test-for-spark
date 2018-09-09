# /bin/bash
bin=`dirname $0`
bin=`cd $bin;pwd`
rm $bin/results/examples-mllib-failed.list
rm $bin/results/examples-mllib-success.list
rm  $bin/logs/*
source $bin/conf.sh
source $bin/utils.sh
# 清空生成数据目录防止目录已存在
clearDir
:<<!
#不需要参数的例子
for app in $( cd  $SPARK_HOME/examples/src/main/scala/org/apache/spark/examples/mllib; ls *scala| grep -vE '(AbstractParams|BinaryClassification|CosineSimilarity|DecisionTreeRunner|DenseKMeans|FPGrowthExample|GradientBoostedTreesRunner|LDAExample|LinearRegression|MovieLensALS|RegressionMetricsExample|SparseNaiveBayes|StreamingKMeansExample|StreamingLinearRegressionExample|StreamingLogisticRegression|StreamingTestExample|TallSkinnyPCA|TallSkinnySVD)')
do
runMLlib mllib.${app%.scala} 
done
#需要参数的例子
for app in BinaryClassification CosineSimilarity DecisionTreeRunner DenseKMeans FPGrowthExample  LDAExample LinearRegression MovieLensALS  SparseNaiveBayes 
do
param=`parse $app $PARAMETERS`
eval runMLlib mllib.$app  $param
done
!
# 失败的例子
# RegressionMetricsExample这个例子官方包都跑不通
for app in GradientBoostedTreesRunner TallSkinnyPCA TallSkinnySVD
do
param=`parse $app $PARAMETERS`
eval runMLlib mllib.$app  $param
done
#清空生成数据目录
clearDir
