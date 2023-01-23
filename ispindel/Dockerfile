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

WORKDIR /home/ispindel
RUN git clone https://github.com/avollkopf/iSpindel-TCP-Server iSpindel-Srv
RUN pip3 install mysql-connector-python==8.0.29

WORKDIR /home/ispindel/iSpindel-Srv
RUN cp config/iSpindle_default.ini config/iSpindle_config.ini
RUN chown root:www-data config && \
	chmod 775 config
WORKDIR /var/www/html
RUN ln -sf /home/ispindel/iSpindel-Srv/web/ iSpindle && \
	chown -R ispindel:ispindel iSpindle/* && \
	chown -R ispindel:ispindel iSpindle

USER ispindel
WORKDIR /home/ispindel/iSpindel-Srv
CMD ["/usr/bin/python3", "iSpindle.py", "&", "/usr/sbin/apache2", "-D",  "FOREGROUND"]
