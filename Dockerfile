FROM debian:9
MAINTAINER Jakub Kwiatkowski <jakub@ajbisoft.pl>

COPY sources.list /etc/apt/
COPY icinga2.gpg /etc/apt/trusted.gpg.d/icinga2.gpg
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq nullmailer icinga2 icinga2-ido-mysql monitoring-plugins vim-icinga2 vim-addon-manager apache2 \
  && apt-get -y --purge autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && icinga2 feature enable ido-mysql \
  && icinga2 api setup
  && vim-addon-manager -w install icinga2 \
  && mv /etc/icinga2 /etc/icinga2_orig
  
VOLUME ["/etc/icinga2"]

COPY docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]
