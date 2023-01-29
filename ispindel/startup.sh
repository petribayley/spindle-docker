#!/bin/bash

whoami

cp /var/www/html/iSpindel/iSpindle.py /usr/local/bin/

apachectl -D FOREGROUND & \
# apachectl -D FOREGROUND 
sudo -u ispindel /bin/python3 /usr/local/bin/iSpindle.py 