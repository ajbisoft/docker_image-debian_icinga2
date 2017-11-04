FROM debian:9
MAINTAINER Jakub Kwiatkowski <jakub@ajbisoft.pl>
COPY sources.list /etc/apt/
COPY icinga2.gpg /etc/apt/trusted.gpg.d/icinga2.gpg
RUN apt-get update && apt-get install -y icinga2 \
  && apt-get -y --purge autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*
CMD ["/bin/sh"]
