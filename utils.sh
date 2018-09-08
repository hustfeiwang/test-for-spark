# /bin/bash
function parse(){
pa=`xmllint --xpath "//$1" parameters.xml|grep -o '>[[:space:][:punct:][:alnum:]]*<'`
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
function run(){
$SPARK_HOME/bin/run-example org.apache.spark.examples.$@
}
