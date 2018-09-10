FROM alpine:3.8

LABEL maintainer="warroyo@pivotal.io"
LABEL description="concourse worker docker image"

ARG pivnet_token

RUN apk update && apk add --no-cache curl bash jq ruby  && \
    apk add --no-cache --virtual .build-dependencies musl-dev gcc make g++ ruby-dev && \
    addgroup -g 1000 -S pa && \
    adduser -u 1000 -S pa -G pa && \ 
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/kubectl && \
    curl -Lo helm.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-v2.10.0-linux-amd64.tar.gz && \
    tar -zxvf helm.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    rm helm.tar.gz && \
    rm -rf linux-amd64  && \
    gem install cf-uaac && \
    apk del .build-dependencies
    # curl  -H "Authorization: Token " -Lo pks https://network.pivotal.io/api/v2/products/pivotal-container-service/releases/174703/product_files/198252/download
    # chmod +x pks && \
    # mv pks

USER pa

ENTRYPOINT ["/bin/bash"]
