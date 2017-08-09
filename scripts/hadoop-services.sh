#!/bin/bash

echo "RUN service ssh start"
service ssh start

echo "HADOOP SERVICES"
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh

echo "RUN jps - Java Virtual Machine Process Status Tool"
jps -lm

echo "Get basic filesystem information and statistics."
hdfs dfsadmin -report

set -e
echo "HADOOP TERASORT BENCHMARK TEST"
# numfmt: https://www.gnu.org/software/coreutils/manual/html_node/numfmt-invocation.html
TOTAL_SIZE=1G
TOTAL_BYTES=$(numfmt --from=auto $TOTAL_SIZE)
NUMBER_OF_100_BYTE_ROWS=$((TOTAL_BYTES / 100))
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.[0-9].jar teragen $NUMBER_OF_100_BYTE_ROWS /user/$USER/benchmarks/terasort-input
TERASORT_START=`date +%s` # %s means seconds since 1970-01-01 00:00:00 UTC
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.[0-9].jar terasort /user/$USER/benchmarks/terasort-input /user/$USER/benchmarks/terasort-output
TERASORT_END=`date +%s` # %s means seconds since 1970-01-01 00:00:00 UTC
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.[0-9].jar teravalidate /user/$USER/benchmarks/terasort-output /user/$USER/benchmarks/terasort-validate
echo "TERASORT RUNTIME: $((TERASORT_END-TERASORT_START)) Seconds for sorting $TOTAL_SIZE of data."

#echo "HADOOP NNBENCH TEST"
#hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.7.[0-9].jar nnbench -operation create_write \
#    -maps 20 -reduces 10 -blockSize 1 -bytesToWrite 0 -numberOfFiles 1000 -replicationFactorPerFile 3 -readFileAfterOpen true \
#    -baseDir /user/$USER/benchmarks/NNBench-`hostname -s`

#echo "HADOOP MRBENCH TEST"
#hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.7.[0-9].jar mrbench -numRuns 50 \
#	-baseDir /user/$USER/benchmarks/MRBench
set +e
