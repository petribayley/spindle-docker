FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN adduser ispindel
RUN apt update -y
RUN apt upgrade -y
RUN apt install git -y
RUN apt install openssh-server -y
RUN apt install php php-mysqli -y
RUN apt install apache2 -y
RUN apt install apache2-utils -y
RUN apt install python3 python3-pip -y
RUN apt install sudo -y
RUN apt install vim -y

# expose port 9501 for iSpindle
EXPOSE 9501

# enable mysql for python 
RUN pip3 install mysql-connector-python==8.0.29

WORKDIR /etc/apache2
COPY 000-default.conf sites-enabled/000-default.conf
COPY apache2.conf apache2.conf

WORKDIR /var/www/html
RUN git clone https://github.com/avollkopf/iSpindel-TCP-Server iSpindel
RUN chown -R ispindel:www-data iSpindel


WORKDIR /var/www/html/iSpindel
COPY iSpindle_config.ini /var/www/html/iSpindel/config/iSpindle_config.ini
RUN chown ispindel:www-data /var/www/html/iSpindel/config/iSpindle_config.ini

COPY common_db_default.php /var/www/html/iSpindel/config/common_db_config.php
RUN chown ispindel:www-data /var/www/html/iSpindel/config/common_db_config.php

RUN mv web iSpindel
RUN chown ispindel:www-data config && \
	chmod 775 config

WORKDIR /home/ispindel/
RUN ln -s /var/www/html/iSpindel /home/ispindel/iSpindel-Srv
RUN chown ispindel:www-data iSpindel-Srv




WORKDIR /
COPY ./startup.sh /startup.sh

CMD ["/bin/bash", "/startup.sh"]
