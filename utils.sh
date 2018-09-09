# /bin/bash
# 从 xml中解析出相应参数的配置值
function parse(){
pa=`xmllint --xpath "//$1" $2 |grep -o '>[[:space:][:punct:][:alnum:]]*<'`
pb=`echo ${pa##>}`
echo ${pb%%<}
}
# 判断执行core例子时是否出错，并记录
function assertCore(){
if [ $? -eq 0 ];then
   echo  $1 Executed SUCCESS >>$bin/results/examples-core-success.list
else
    echo $1 Executed FAILED  >> $bin/results/examples-core-failed.list
fi
}
# 判断执行mllib例子时是否出错，并记录
function assertMLlib(){
if [ $? -eq 0 ];then
   echo  $1 Executed SUCCESS >>$bin/results/examples-mllib-success.list
else
    echo $1 Executed FAILED  >> $bin/results/examples-mllib-failed.list
fi
}
# 判断执行graphx例子时是否出错，并记录
function assertGraphx(){
if [ $? -eq 0 ];then
   echo  $1 Executed SUCCESS >>$bin/results/examples-graphx-success.list
else
    echo $1 Executed FAILED  >> $bin/results/examples-graphx-failed.list
fi
}
# 运行core测试例子
function runCore(){
$SPARK_HOME/bin/run-example --master $SPARK_MASTER --deploy-mode $DEPLOY_MODE  org.apache.spark.examples.$@  
assertCore core.$1
}
# 运行mllib测试例子
function runMLlib(){
$SPARK_HOME/bin/run-example --master $SPARK_MASTER --deploy-mode $DEPLOY_MODE org.apache.spark.examples.$@  
assertMLlib $1
}
# 运行graphx测试例子
function runGraphx(){
$SPARK_HOME/bin/run-example --master $SPARK_MASTER --deploy-mode $DEPLOY_MODE org.apache.spark.examples.$@
assertGraphx $1
}
# 清空一些测试中生成的临时数据
function clearDir(){
$HADOOP_HOME/bin/hadoop fs -rmr $HDFS_DIR/DFSReadWriteTest
$HADOOP_HOME/bin/hadoop fs -rmr $HDFS_DIR/myModelPath
$HADOOP_HOME/bin/hadoop fs -rmr $HDFS_DIR/target
$HADOOP_HOME/bin/hadoop fs -rmr /tmp/kmeans
}
