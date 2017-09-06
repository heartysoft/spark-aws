#!/bin/bash

set -xe

export REPO=${REPO:-heartysoft/spark-aws}
export TAG_TO_USE=${TRAVIS_TAG:-snapshot}
docker build -t $REPO:spark-2.1.0 -f Dockerfile-2.1.0 .
docker tag $REPO:spark-2.1.0 $REPO:spark-2.1.0-$TAG_TO_USE
docker build -t $REPO:spark-2.1.1 -f Dockerfile-2.1.1 .
docker tag $REPO:spark-2.1.1 $REPO:spark-2.1.1-$TAG_TO_USE
