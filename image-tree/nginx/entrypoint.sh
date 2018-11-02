#!/bin/sh
set -e

mkdir -p /var/log/nginx
mkdir -p /usr/share/nginx/html

nginx -g "daemon off;"
