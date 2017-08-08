# Run Hadoop 2.7 on Docker in Pseudo-distributed mode

## Install Docker CE on Ubuntu

Follow the instructions from [Get Docker CE for Ubuntu](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/) page.


## Manage Docker as a non-root user

Follow the instructions from [Post-installation steps for Linux](https://docs.docker.com/engine/installation/linux/linux-postinstall/#manage-docker-as-a-non-root-user) page.


## How to Run
- Go to your terminal or command line.
- Clone this repository and go inside it
	```
	git clone https://github.com/mjaglan/docker-hadoop-pseudo-distributed-mode.git
	cd docker-hadoop-pseudo-distributed-mode
	```
- Run the following file
	```
	. ./restart-all.sh
	```

## After Starting Hadoop System
The [scripts/hadoop-services.sh](scripts/hadoop-services.sh) is running following commands after starting Hadoop System - 
- Java Virtual Machine Process Status Tool (jps)
	```
	266 org.apache.hadoop.hdfs.server.datanode.DataNode
	142 org.apache.hadoop.hdfs.server.namenode.NameNode
	428 org.apache.hadoop.hdfs.server.namenode.SecondaryNameNode
	678 org.apache.hadoop.yarn.server.nodemanager.NodeManager
	579 org.apache.hadoop.yarn.server.resourcemanager.ResourceManager
	```

- Basic Hadoop filesystem information and statistics
	```
	Configured Capacity: 37912903680 (35.31 GB)
	Present Capacity: 11530969088 (10.74 GB)
	DFS Remaining: 11530944512 (10.74 GB)
	DFS Used: 24576 (24 KB)
	DFS Used%: 0.00%
	Under replicated blocks: 0
	Blocks with corrupt replicas: 0
	Missing blocks: 0
	Missing blocks (with replication factor 1): 0
	
	-------------------------------------------------
	Live datanodes (1):
	
	Name: 127.0.0.1:50010 (localhost)
	Hostname: hadoop-testbed
	Decommission Status : Normal
	Configured Capacity: 37912903680 (35.31 GB)
	DFS Used: 24576 (24 KB)
	Non DFS Used: 26381934592 (24.57 GB)
	DFS Remaining: 11530944512 (10.74 GB)
	DFS Used%: 0.00%
	DFS Remaining%: 30.41%
	Configured Cache Capacity: 0 (0 B)
	Cache Used: 0 (0 B)
	Cache Remaining: 0 (0 B)
	Cache Used%: 100.00%
	Cache Remaining%: 0.00%
	Xceivers: 1
	Last contact: Sat Aug 05 17:58:00 UTC 2017	
	```
 
- Hadoop Terasort Benchmark Test

- (Optional) Hadoop NNBENCH Test

- (Optional) Hadoop MRBENCH Test

## Tools
```
Docker version 17.06.0-ce
Ubuntu Trusty 14.04 Host OS
Eclipse IDE for Java EE Developers Oxygen (4.7.0)
Eclipse Docker Tooling 3.1.0
```
