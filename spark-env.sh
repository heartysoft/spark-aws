SPARK_NO_DAEMONIZE=true

if [ -n "$ZOOKEEPER_URL" ]; then 
	export SPARK_DAEMON_JAVA_OPTS="-Dspark.deploy.recoveryMode=ZOOKEEPER -Dspark.deploy.zookeeper.dir=/spark -Dspark.deploy.zookeeper.url=$ZOOKEEPER_URL"
fi
