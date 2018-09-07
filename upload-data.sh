# /bin/bash
bin=`dirname $0`
bin=`cd $bin;pwd`
source $bin/test-env.sh
hadoop fs -ls /
echo "hadoop fs -mkdir /user/$USER"

hadoop fs -mkdir /user/$USER
echo "hadoop fs -put $SPARK_HOME/data /user/$USER"
hadoop fs -put $SPARK_HOME/data /user/$USER
