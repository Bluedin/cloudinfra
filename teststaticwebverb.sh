#!/bin/bash

#insert config file curl.config
#content of curl.config :
#		URL=http://localhost:3000/is_alive.html
. ./curl.config
#HTTP GET request on URL 
#insert into dump.txt the request and response 
#stop display in console by dumping in /dev/null
curl -k $URL 
