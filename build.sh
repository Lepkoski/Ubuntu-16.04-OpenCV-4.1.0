#!/bin/bash

docker build . -f Dockerfile-requirements -t opencv4-requirements
docker build . -f Dockerfile-source -t opencv4-source
docker build --build-arg cpucores=$(cat /proc/cpuinfo | awk '/^processor/{print $3}' | wc -l) . -f Dockerfile-make -t opencv4-make
docker build . -f Dockerfile -t opencv4