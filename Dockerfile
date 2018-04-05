FROM php:7.1-apache

# Utilities
RUN apt-get update && \
    apt-get -y install apt-transport-https git curl vim --no-install-recommends && \
    rm -r /var/lib/apt/lists/*

# SimpleSAMLphp
ARG SIMPLESAMLPHP_VERSION=1.15.4
RUN curl -s -L -o /tmp/simplesamlphp.tar.gz https://github.com/simplesamlphp/simplesamlphp/releases/download/v$SIMPLESAMLPHP_VERSION/simplesamlphp-$SIMPLESAMLPHP_VERSION.tar.gz && \
    tar xzf /tmp/simplesamlphp.tar.gz -C /tmp && \
    rm -f /tmp/simplesamlphp.tar.gz  && \
    cp -r /tmp/simplesamlphp-* /var/www/simplesamlphp && \
    mv /tmp/simplesamlphp-* /var/www/simplesamlphp-idp && \
    touch /var/www/simplesamlphp-idp/modules/exampleauth/enable
COPY config/simplesamlphp/SP/config.php /var/www/simplesamlphp/config
COPY config/simplesamlphp/SP/authsources.php /var/www/simplesamlphp/config
COPY config/simplesamlphp/IDP/config.php /var/www/simplesamlphp-idp/config
COPY config/simplesamlphp/IDP/authsources.php /var/www/simplesamlphp-idp/config
COPY config/simplesamlphp/saml20-sp-hosted.php /var/www/simplesamlphp/metadata
COPY config/simplesamlphp/saml20-idp-remote.php /var/www/simplesamlphp/metadata
COPY config/simplesamlphp/saml20-sp-remote.php /var/www/simplesamlphp-idp/metadata
COPY config/simplesamlphp/saml20-idp-hosted.php /var/www/simplesamlphp-idp/metadata
COPY config/simplesamlphp/server.crt /var/www/simplesamlphp/cert/
COPY config/simplesamlphp/server.pem /var/www/simplesamlphp/cert/
COPY config/simplesamlphp/server.crt /var/www/simplesamlphp-idp/cert/
COPY config/simplesamlphp/server.pem /var/www/simplesamlphp-idp/cert/

# Apache
COPY config/apache/ports.conf /etc/apache2
COPY config/apache/simplesamlphp.conf /etc/apache2/sites-available
COPY config/apache/cert.crt /etc/ssl/cert/cert.crt
COPY config/apache/private.key /etc/ssl/private/private.key
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    a2enmod ssl && \
    a2dissite 000-default.conf default-ssl.conf && \
    a2ensite simplesamlphp.conf

# Set work dir
WORKDIR /var/www

# General setup
EXPOSE 8443 8444
