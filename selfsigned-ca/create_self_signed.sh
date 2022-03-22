#!/bin/sh

SERVER_NAME=$1

if [ -z $SERVER_NAME ]; then echo "please specify servername"
else
  openssl req -newkey rsa:2048 -nodes -days 365000 \
     -subj "/CN=$SERVER_NAME" \
     -keyout $SERVER_NAME-key.pem \
     -out $SERVER_NAME-req.pem

  openssl x509 -req -days 365000 -set_serial 0x$(openssl rand -hex 19) \
    -in $SERVER_NAME-req.pem \
    -out $SERVER_NAME-cert.pem \
    -CA ca-cert.pem \
    -CAkey ca-key.pem
  
  mv $SERVER_NAME-key.pem $SERVER_NAME.key
  mv $SERVER_NAME-cert.pem $SERVER_NAME.crt
  rm $SERVER_NAME-req.pem
fi

