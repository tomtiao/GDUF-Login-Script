#!/bin/bash
$(curl -s https://www.v2ex.com/generate_204 --connect-timeout 5)
if [ $? == 7 ]
then
    logger "Disconnected. Try to login."
    adapter="eth2.2"

    currentIp=$(ifconfig ${adapter} | grep "inet addr:" | awk '{print $2}' | awk -F ':' '{print $2}')

    macAddr=$(ifconfig ${adapter} | grep "HWaddr" | awk '{print $5}')
    macAddr=${macAddr//:/%3A}

    username="username"
    password="password"

    json=$(curl -S -o /dev/null "http://10.69.69.72/quickauth.do?userid=${username}&passwd=${password}&wlanuserip=${currentIp}&wlanacname=NFV-BASE1&wlanacIp=&mac=${macAddr}&version=0&portalpageid=1&timestamp=&uuid=&portaltype=")
    code=$(echo $json | awk -F ',' '{print $1}' | cut -b 2-)
    message=$(echo $json | awk -F ',' '{print $3}')

    if [ $code != "0" ]
    then
        logger "${message}. ${code}"
    else
        logger "Success."
    fi
else
    logger "Connected."
fi
