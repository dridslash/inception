#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/CN=mnaqqad/C=MO/ST=BG/L=1137/O=mnaqqad-org"

nginx -g 'daemon off;'
