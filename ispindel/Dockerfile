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
RUN mv iSpindle.py /usr/local/bin && \
	mv ispindle-srv /etc/init.d && \
	chmod 755 /usr/local/bin/iSpindle.py && \
	chmod 755 /etc/init.d/ispindle-srv && \
	chown root:www-data config && \
	chmod 775 config
WORKDIR /var/www/html
RUN ln -sf /home/ispindel/iSpindel-Srv/web/ iSpindle && \
	chown -R ispindel:ispindel iSpindle/* && \
	chown -R ispindel:ispindel iSpindle

CMD ["systemctl", "start", "ispindle-srv", "&&", "systemctl", "start", "apache2"]