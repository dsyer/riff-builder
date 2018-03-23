#!/bin/sh

git clone https://github.com/scratches/rest-test
cd rest-test && git checkout boot2 && git pull --rebase
./mvnw install
docker build -t dsyer/rest-test:0.0.1 .
kubectl apply -f rest-test.yaml
