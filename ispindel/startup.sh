#!/bin/bash

whoami

apachectl -D FOREGROUND & \
/bin/python3 /var/www/html/iSpindel/iSpindle.py 