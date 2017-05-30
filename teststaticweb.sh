#!/bin/bash

#insert config file curl.config
#content of curl.config :
#		URL=http://localhost:3000/is_alive.html
. ./curl.config
#HTTP GET request on URL 
#insert into response.txt the request and response 
#stop display in console by dumping in /dev/null
curl -k --trace-ascii response.txt $URL > /dev/null 
#test if 
#search for response "HTTP 200 OK" in response.txt
if(grep -e "200 OK" response.txt)
then
	echo "success"
#search for response "HTTP 404" Not Found in response.txt
elif(grep -e "404 Not Found" response.txt)
then
	echo "failure"
#Unknown failure
else
	echo "Unknown failure"
fi
#search for message "I'm alive" in the html code returned in response.txt
#then crop to get only "I'm alive" instead of the complete line
grep -e "I'm alive" response.txt | cut -d\> -f2 | cut -d\< -f1
