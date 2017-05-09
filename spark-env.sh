SPARK_NO_DAEMONIZE=true

if [ -n "$ZOOKEEPER_URL" ] && [ "$ZOOKEEPER_PATH" ]; then 
	export SPARK_DAEMON_JAVA_OPTS="-Dspark.deploy.recoveryMode=ZOOKEEPER -Dspark.deploy.zookeeper.dir=$ZOOKEEPER_PATH -Dspark.deploy.zookeeper.url=$ZOOKEEPER_URL"
elif [ -n "$ZOOKEEPER_URL" ] || [ "$ZOOKEEPER_PATH" ]; then
	echo "Both ZOOKEEPER_URL and ZOOKEEPER_PATH should be set."
	exit 1
fi
