FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN adduser ispindel
RUN apt-get update
RUN apt upgrade
RUN apt install git -y
RUN apt install openssh-server -y
RUN apt install php php-mysqli -y
RUN apt install apache2 -y
RUN apt install apache2-utils -y
RUN apt install python3 python3-pip -y
RUN apt install iproute2 -y
RUN apt install sudo -y

# expose port 9501 for iSpindel
EXPOSE 9501

WORKDIR /etc/apache2
COPY 000-default.conf sites-enabled/000-default.conf
COPY apache2.conf apache2.conf

WORKDIR /var/www/html
RUN git clone https://github.com/avollkopf/iSpindel-TCP-Server iSpindel
RUN chown -R root:www-data iSpindel
RUN pip3 install mysql-connector-python==8.0.29

WORKDIR /var/www/html/iSpindel
COPY iSpindle_config.ini /var/www/html/iSpindel/config/iSpindle_config.ini
RUN mv web iSpindel
RUN chown root:www-data config && \
	chmod 775 config
WORKDIR /
COPY ./startup.sh /startup.sh

CMD ["/bin/bash", "/startup.sh"]
