# /bin/bash
bin=`dirname $0`
bin=`cd $bin;pwd`
rm $bin/results/examples-mllib-failed.list
rm $bin/results/examples-mllib-success.list
rm  $bin/logs/*
source $bin/test-env.sh


function assert(){
if [ $? -eq 0 ];then
   echo  $1 Executed SUCCESS >>$bin/examples-mllib-success.list
   rm $bin/logs/examples-$1.log
else
    echo $1 Executed FAILED  >> $bin/examples-mllib-failed.list
fi
}
function run(){
$SPARK_HOME/bin/run-example org.apache.spark.examples.$@
}
for app in $( cd  $SPARK_HOME/examples/src/main/scala/org/apache/spark/examples/mllib; ls *scala| grep -vE '(AbstractParams)')
do
run mllib.${app%.scala} >> $bin/logs/examples-${app%.scala}.log
assert mllib.${app%.scala}
done
