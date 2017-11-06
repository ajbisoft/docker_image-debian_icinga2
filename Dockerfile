FROM debian:9
MAINTAINER Jakub Kwiatkowski <jakub@ajbisoft.pl>

COPY sources.list /etc/apt/
COPY icinga2.gpg /etc/apt/trusted.gpg.d/icinga2.gpg
RUN apt-get update && apt-get install -y icinga2 monitoring-plugins vim-icinga2 vim-addon-manager \
  && apt-get -y --purge autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && vim-addon-manager -w install icinga2

COPY docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]
