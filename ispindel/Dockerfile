FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN adduser ispindel
RUN apt update
RUN apt upgrade
RUN apt install git -y
RUN apt install openssh-server -y
RUN apt install php -y
RUN apt install apache2 -y
RUN apt install python3 python3-pip -y
RUN apt install iproute2 -y
RUN apt install sudo -y

# expose port 9501 for iSpindel
EXPOSE 9501

WORKDIR /etc/apache2
COPY 000-default.conf sites-available/000-default.conf
COPY apache2.conf apache2.conf

WORKDIR /home/ispindel
RUN git clone https://github.com/avollkopf/iSpindel-TCP-Server iSpindel-Srv
RUN pip3 install mysql-connector-python==8.0.29

WORKDIR /root
RUN mkdir -p /root/iSpindel-Srv/config/

WORKDIR /home/ispindel/iSpindel-Srv
RUN cp config/iSpindle_default.ini /root/iSpindel-Srv/config/iSpindle_config.ini
RUN mv iSpindle.py /usr/local/bin && \
	mv ispindle-srv /etc/init.d && \
	chmod 755 /usr/local/bin/iSpindle.py && \
	chmod 755 /etc/init.d/ispindle-srv && \
	chown root:www-data config && \
	chmod 775 config
WORKDIR /var/www/html
RUN ln -sf /home/ispindel/iSpindel-Srv/web/ iSpindle
RUN chown -R root:www-data /var/www/html/iSpindle/
WORKDIR /
COPY ./startup.sh /startup.sh

CMD ["/bin/bash", "/startup.sh"]

# CMD ["systemctl", "start", "ispindle-srv", "&&", "systemctl", "start", "apache2"]