FROM debian:9
MAINTAINER Jakub Kwiatkowski <jakub@ajbisoft.pl>
RUN apt-get update && apt-get install -y wget
COPY sources.list /etc/apt/
RUN wget -O - https://packages.icinga.com/icinga.key | apt-key add - \
  && apt-get update && apt-get install -y icinga2 \
  && apt-get -y --purge autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*
CMD ["/bin/sh"]