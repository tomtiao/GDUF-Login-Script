#!/bin/bash
adapter="eth0"

currentIp=$(ifconfig ${adapter} | grep "inet " | awk '{print $2}')

macAddr=$(ifconfig ${adapter} | grep "ether " | awk '{print $2}')
macAddr=${macAddr//:/%3A}

username="username"
password="password"

json=$(curl -s "http://10.69.69.72/quickauth.do?userid=${username}&passwd=${password}&wlanuserip=${currentIp}&wlanacname=NFV-BASE1&wlanacIp=&mac=${macAddr}&version=0&portalpageid=1&timestamp=&uuid=&portaltype=")
code=$(echo ${json} | awk -F ',' '{print $1}' | cut -b 2- | awk -F ':' '{print $2}' | cut -c 2)

if [ ${code} != 0 ]
then
    message=$(echo ${json} | awk -F ',' '{print $3}' | cut -c 2- | awk -F ':' '{print $2}')
    echo "${message}, ${code}"
fi