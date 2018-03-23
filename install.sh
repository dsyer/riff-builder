#!/bin/sh

apk add --no-cache openjdk8 git docker curl python
curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz | tar -xzf -
google-cloud-sdk/install.sh --quiet
export PATH=$PATH:/google-cloud-sdk/bin
gcloud components install kubectl --quiet
gcloud components install docker-credential-gcr --quiet
