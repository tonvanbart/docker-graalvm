#!/usr/bin/env bash
docker_name=ivonet
image=graalvm
version=1.0.0-rc16

#deploy=false
deploy=true
#versioning=false
versioning=true

#set -x
OPTIONS="--no-cache"
#OPTIONS="$OPTIONS --force-rm"
OPTIONS="$OPTIONS --build-arg version=$version"

docker build ${OPTIONS} -t $docker_name/${image}:latest .
if [ "$?" -eq 0 ] && [ ${deploy} == "true" ]; then
    docker push $docker_name/${image}:latest
else
    exit 1
fi

if [ "$versioning" = true ]; then
    docker tag $docker_name/${image}:latest $docker_name/${image}:${version}
    if [ "$?" -eq 0 ] && [ ${deploy} == "true" ]; then
        docker push $docker_name/${image}:${version}
    fi
fi
