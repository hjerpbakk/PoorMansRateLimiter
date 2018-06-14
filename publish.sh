#! /bin/bash
set -e

VERSION=$(cat PoorMansRateLimiter/wwwroot/VERSION.txt)

./build.sh
docker tag hjerpbakk/poor-mans-rate-limiter:latest vt-optimus-solr02:5000/hjerpbakk/poor-mans-rate-limiter:$VERSION
docker push vt-optimus-solr02:5000/hjerpbakk/poor-mans-rate-limiter:$VERSION
