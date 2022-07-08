#! /bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

if [ $# != 1 ]; then
  echo -e "${RED}Missing port argument input"
  exit 2
fi

PROJECT_PORT=$1
echo -e "${GREEN}Nginx will ssl certify requests from port 443 and proxy to port $PROJECT_PORT${NC}";

THIS_DIR="$(dirname "$(realpath "$0")")"
echo "Path to this directory is $THIS_DIR"
mkdir -p $THIS_DIR/tmp

PROJECT_PORT=$PROJECT_PORT \
NGINX_SSL_CERT=$THIS_DIR/ssl/cert.pem \
NGINX_SSL_CERT_KEY=$THIS_DIR/ssl/privkey.pem \
NGINX_SSL_CLIENT_CERT=$THIS_DIR/ssl/client_root.crt \
    envsubst < $THIS_DIR/nginx.template.conf > $THIS_DIR/tmp/nginx.conf

nginx -c $THIS_DIR/tmp/nginx.conf