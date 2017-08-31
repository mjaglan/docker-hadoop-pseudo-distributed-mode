# Run Hadoop 2.7 on Docker in Pseudo-distributed mode

## Install Docker CE on Ubuntu

Follow the instructions from [Get Docker CE for Ubuntu](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/) page.


## Manage Docker as a non-root user

Follow the instructions from [Post-installation steps for Linux](https://docs.docker.com/engine/installation/linux/linux-postinstall/#manage-docker-as-a-non-root-user) page.


## How to Run
- Go to your terminal.
- Clone this repository and go inside it
	```
	git clone https://github.com/mjaglan/docker-hadoop-pseudo-distributed-mode.git
	cd docker-hadoop-pseudo-distributed-mode
	```
- Run the following script
	```
	. ./restart-all.sh
	```

## After Starting Hadoop System
The [scripts/hadoop-services.sh](scripts/hadoop-services.sh) is running following commands after starting Hadoop System - 

- Java Virtual Machine Process Status Tool (jps)
	```
   <pid>   <process name>
	266    org.apache.hadoop.hdfs.server.datanode.DataNode
	142    org.apache.hadoop.hdfs.server.namenode.NameNode
	428    org.apache.hadoop.hdfs.server.namenode.SecondaryNameNode
	678    org.apache.hadoop.yarn.server.nodemanager.NodeManager
	579    org.apache.hadoop.yarn.server.resourcemanager.ResourceManager
	```

- Basic Hadoop filesystem information and statistics
	```
	
	Configured Capacity: 37912903680 (35.31 GB)
	Present Capacity: 8332066816 (7.76 GB)
	DFS Remaining: 8332042240 (7.76 GB)
	DFS Used: 24576 (24 KB)
	DFS Used%: 0.00%
	Under replicated blocks: 0
	Blocks with corrupt replicas: 0
	Missing blocks: 0
	Missing blocks (with replication factor 1): 0
	
	-------------------------------------------------
	Live datanodes (1):
	
	...
	```
 
- Hadoop Terasort Benchmark Test

- (Optional) Hadoop NNBENCH Test

- (Optional) Hadoop MRBENCH Test

# Web UI

- NameNode can be accessed on host machine browser at [http://HOST-OS-IP:8088/](http://0.0.0.0:8088/)

- Resource Manager can be accessed on host machine browser at [http://HOST-OS-IP:50070/](http://0.0.0.0:50070/)

- Secondary NameNode can be accessed on host machine browser at [http://HOST-OS-IP:50090/](http://0.0.0.0:50090/)

- DataNode can be accessed on host machine browser at [http://HOST-OS-IP:50075/](http://0.0.0.0:50075/)

## Tools
```
Docker version 17.06.0-ce
Ubuntu Trusty 14.04 Host OS
Eclipse IDE for Java EE Developers Oxygen (4.7.0)
Eclipse Docker Tooling 3.1.0
```

# Configuration References
- [Apache Hadoop 2.7.2 docs](https://hadoop.apache.org/docs/r2.7.2/)
- [core-default.xml](https://hadoop.apache.org/docs/r2.7.2/hadoop-project-dist/hadoop-common/core-default.xml)
- [hdfs-default.xml](https://hadoop.apache.org/docs/r2.7.2/hadoop-project-dist/hadoop-hdfs/hdfs-default.xml)
- [mapred-default.xml](https://hadoop.apache.org/docs/r2.7.2/hadoop-mapreduce-client/hadoop-mapreduce-client-core/mapred-default.xml)
- [yarn-default.xml](https://hadoop.apache.org/docs/r2.7.2/hadoop-yarn/hadoop-yarn-common/yarn-default.xml)
- [DeprecatedProperties.html](https://hadoop.apache.org/docs/r2.7.2/hadoop-project-dist/hadoop-common/DeprecatedProperties.html)

