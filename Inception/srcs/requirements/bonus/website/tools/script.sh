#!/bin/bash
envsubst < /etc/nginx/config > /etc/nginx/nginx.conf
nginx -g 'daemon off;'