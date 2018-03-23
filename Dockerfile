FROM projectriff/shell-function-invoker:0.0.4
RUN apk add --no-cache openjdk8 git docker curl python && \
    curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz | tar -xzf - && \
    google-cloud-sdk/install.sh --quiet && \
    export PATH=$PATH:/google-cloud-sdk/bin && \
    gcloud components install kubectl --quiet && \
    gcloud components install docker-credential-gcr --quiet
ARG FUNCTION_URI="/build.sh"
ADD build.sh /
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/google-cloud-sdk/bin
ENV FUNCTION_URI $FUNCTION_URI
