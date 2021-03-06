adpater="en0" # Adapter name

username="username"
password="password"

mac=$(ifconfig ${adpater} | grep "ether " | awk '{print $2}')

ip=$(ifconfig ${adpater} | grep "inet " | awk '{print $2}')

response=$(curl -s "http://10.69.69.72/quickauth.do?userid=${username}&passwd=${password}&wlanuserip=${ip}&wlanacname=NFV-BASE1&wlanacIp=&ssid=&vlan=&mac=${mac//:/%3A}&version=0&portalpageid=1&timestamp=&uuid=&portaltype=")

code=$(echo ${response} | awk -F ',' '{print $1}' | cut -c 2- | awk -F ':' '{print $2}' | cut -c 2)

if [ $code != 0 ]
then
  message=$(echo ${response} | awk -F ',' '{print $3}' | cut -c 2- | awk -F ':' '{print $2}')
  echo "${message}. ${code}"
fi