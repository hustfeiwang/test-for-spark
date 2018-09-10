# /bin/bash
bin=`dirname $0`
bin=`cd $bin;pwd`
rm $bin/results/examples-streaming-failed.list
rm $bin/results/examples-streaming-success.list
source $bin/conf.sh
source $bin/utils.sh


for app in KafkaWordCount KafkaPR KafkaCC KafkaLR KafkaKMeans
do
runStreamingProducer ${app}Producer $BOOTSTRAP_SERVERS $TOPICS $MESSAGES_PER_SEC $WORDS_PER_MESSAGE $TIMEOUT
runStreaming $app $BOOTSTRAP_SERVERS $GROUP $TOPICS $TIMEOUT
sleep 30
done
