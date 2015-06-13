FROM gliderlabs/alpine:3.1

RUN apk --update add \
      python \
      py-pip \
      jq \
      curl \
      wget \
      bash &&\
      pip install --upgrade awscli &&\
      mkdir /root/.aws

COPY etcd-aws-cluster /etcd-aws-cluster

#Expose directory to write output to
VOLUME ["/etc/sysconfig/"]

# Remove entry point so the image can be a generic aws cli tool image.
#ENTRYPOINT /etcd-aws-cluster
