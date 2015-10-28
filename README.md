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

Copy all config files from the hadoop folder from the git repo to `/home/vs_pj/hadoop/etc/hadoop`

`cp /home/vs_pj/server_config/hadoop/* /home/vs_pj/hadoop/etc/hadoop/`

Create hadoop pid dir

`mkdir /home/vs_pj/hadoop_pid_dir`

Change permission for the folder so that only the vs_pj user and group can write

`chmod 770 /home/vs_pj/hadoop_pid_dir`

### Attention!
The `slaves` config file must be modified by hand. Un-/Comment the slaves you want.

## Additional stuff

Fix some server pre-configs

This overwrite wrong JAVA_HOME dependency

`cp /home/vs_pj/server_config/java.sh /etc/profile.d/java.sh`
