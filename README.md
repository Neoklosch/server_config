# Server config files for hadoop multi node cluster


## Install hadoop

Clone git repo to your home folder `/home/vs_pj`

`git clone https://github.com/citmp2015/server_config.git`

Download hadoop to home folder `/home/vs_pj/`

`wget http://apache.mirror.digionline.de/hadoop/core/stable/hadoop-2.7.1.tar.gz`

Extract them

`tar xzf hadoop-2.7.1.tar.gz`

Rename the folder

`mv hadoop-2.7.1 hadoop`

Overwrite the .bashrc file with the one from the git repo and also place the .bash_aliases in your home folder `/home/vs_pj/`.

`cp /home/vs_pj/server_config/.bashrc /home/vs_pj/`

`cp /home/vs_pj/server_config/.bash_aliases /home/vs_pj/`

Reload the .bashrc

`source /home/vs_pj/.bashrc`

## Start configuring your hadoop environment.

Copy all config files from the hadoop subfolder from the git repo to `/home/vs_pj/hadoop/etc/hadoop`

`cp /home/vs_pj/server_config/hadoop/* /home/vs_pj/hadoop/etc/hadoop/`

Create hadoop pid dir

`mkdir /home/vs_pj/hadoop_pid`

Change permission for the folder so that only the vs_pj user and group can write

`chmod 770 /home/vs_pj/hadoop_pid`

Create hadoop log dir

`mkdir /home/vs_pj/hadoop_log`

Create namenode dir on the root machine

`mkdir /home/vs_pj/hadoop_namenode`

Create datanode dir on the slaves machine

`mkdir /home/vs_pj/hadoop_datanode`

### Attention!
The `slaves` config file must be modified by hand. Un-/Comment the slaves you want.

`nano /home/vs_pj/hadoop/etc/hadoop/slaves`

You have also to configure the `core-site.xml` manually. Uncomment the master Namenode (asok05 or asok13)

`nano /home/vs_pj/hadoop/etc/hadoop/core-site.xml`

## Additional stuff

Fix some server pre-configs

This overwrite wrong JAVA_HOME dependency

`cp /home/vs_pj/server_config/java.sh /etc/profile.d/java.sh`

## Starting Hadoop

Before you can start Hadoop you have to format the HDFS. Attention: All data in your (not existing) HDFS will be lost! Only on your Namenode (asok05 or asok13)

`$HADOOP_HOME/bin/hdfs namenode -format <clustername>`

Finally start the Hadoop Namenode (asok05 or asok13)

`$HADOOP_HOME/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR --script hdfs start namenode`

Start you Hadoop Datanodes (the other asoks)

 `$HADOOP_HOME/sbin/hadoop-daemons.sh --config $HADOOP_CONF_DIR --script hdfs start datanode`

If you are done with that you can start all of the HDFS processes

`$HADOOP_HOME/sbin/start-dfs.sh`

Eventually you have to accept the `ECDSA key fingerprint` during this process.

If you get the error message `xxx.xxx.xxx.xxx JAVA_HOME is not set and could not be found.` make sure that in the /home/vs_pj/hadoop/etc/hadoop/hadoop-env.sh file you an export to the correct path of your JAVA_HOME.

If you want to stop HDFS

`$HADOOP_HOME/sbin/stop-dfs.sh`

## Check you running HDFS instance

Check you namenode (XY is the namenode server ip asok05 -> 34; asok13 -> 42)

`http://130.149.248.XY:50070/dfshealth.html#tab-overview`

## Install flink

Download flink to home folder `/home/vs_pj/`

`wget http://apache.lauf-forum.at/flink/flink-0.9.1/flink-0.9.1-bin-hadoop27.tgz`

Extract them

`tar xzf flink-0.9.1-bin-hadoop27.tgz`

Rename the folder

`mv flink-0.9.1 flink`

## Start configuring your flink environment.

Copy all config files from the flink subfolder from the git repo to `/home/vs_pj/flink/conf/`

`cp /home/vs_pj/server_config/flink/* /home/vs_pj/flink/conf/`

### Attention!
The `slaves` config file must be modified by hand. Un-/Comment the slaves you want.

`nano /home/vs_pj/flink/conf/slaves`

You have also to configure the `flink-conf.yaml` config file by hand. Un-/Comment the `jobmanager.rpc.address` you want in line 25 or line 28.

`nano /home/vs_pj/flink/conf/flink-conf.yaml`

## Start flink

Now the easy task

`$FLINK_HOME/bin/start-cluster.sh`

If you want to start the streaming mode

`$FLINK_HOME/bin/start-cluster-streaming.sh`

If you want to use the flink web-client you have to start them separately

`$FLINK_HOME/bin/start-webclient.sh`

Stop them with

`$FLINK_HOME/bin/stop-webclient.sh`

In addition to that you can stop flink

`$FLINK_HOME/bin/stop-cluster.sh`

And same for the streaming mode

`$FLINK_HOME/bin/stop-cluster-streaming.sh`

## Check your running flink instance

XY is the namenode server ip asok05 -> 34; asok13 -> 42

`http://130.149.248.XY:8081`

Check the web-client

`http://130.149.248.XY:8080`
