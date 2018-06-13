#! /bin/bash
set -e
./build.sh
docker run -p 5000:5000 hjerpbakk/poor-mans-rate-limiter