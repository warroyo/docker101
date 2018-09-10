#!/bin/bash

##########
# docker demo
#########

#build the image
cd examples/basic && docker build -t harbor.gcp.59s.io/59s/wa-basic-image:1.0.0 .

#push the image
docker push harbor.gcp.59s.io/59s/wa-basic-image:1.0.0

#default run
docker run -it --rm harbor.gcp.59s.io/59s/wa-basic-image:1.0.0

#overide the command
docker run -it --rm harbor.gcp.59s.io/59s/wa-basic-image:1.0.0 -v

# override the entrypoint
docker run -it --rm --entrypoint=/bin/bash harbor.gcp.59s.io/59s/wa-basic-image:1.0.0

#multistage show docker file
cd examples/multistage && docker build -t spring-music:1.0 .

#run the image
docker run -it --rm spring-music:1.0

#show override the entrypoint and show gradle doesnt exist
docker run -it --rm --entrypoint=/bin/bash spring-music:1.0


##########
# docker image automation demo
#########

#show the pipeline file and walk through

#login to concourse
fly login -t 59s -u test -p test -c https://ci.59s.io/

#push the pipeline
fly -t 59s set-pipeline -c pipeline.yml -p basic-image -v harbor-username=jason -v harbor-password=''

#run the pipeline


# show the image in harbor

# scan the image


##########
# worker image automation demo
#########

#show worker file

# deploy image
fly -t 59s set-pipeline -c pipeline.yml -p kube-worker -v harbor-username=jason -v harbor-password=''

#use image in pipeline
fly -t 59s set-pipeline -c worker-pipeline.yml -p run-worker -v harbor-username=jason -v harbor-password=''


