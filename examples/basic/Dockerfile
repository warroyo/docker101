FROM alpine:3.8

# image metadata labels 
LABEL maintainer="warroyo@pivotal.io"
LABEL description="basic docker image"

# set an env var available inside the container
ENV APP_VERSION 1.0.0

#copy a local file into the image
COPY files/start.sh /app/start.sh

# when the container starts use this dir as the working dir
WORKDIR /app

# install some tools and add a user and chnage permissions
RUN apk update && apk add  --no-cache curl bash jq && \
    addgroup -g 1000 -S pa && \
    adduser -u 1000 -S pa -G pa && \
    chown -R pa:pa /app && chmod 774 /app/start.sh

# set the default user when the container starts
USER pa

# declare a volume for any external data
# mount point is specified at runtime
VOLUME [ "/data" ]

# when the container starts by default run the start.sh
# also use the -r argument by default
ENTRYPOINT ["./start.sh"]

CMD ["-r"]