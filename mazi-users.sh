#!/bin/bash
if [[ $2 == "AP-STA-CONNECTED" ]];then
 	name=""
    ip=""
	while [[ -z "$name" ]] && [[ -z $ip ]]; do 
	    ip=$(cat /var/lib/misc/dnsmasq.leases | grep $3 | awk {'print $3'})
		name=$(cat /var/lib/misc/dnsmasq.leases | grep $3 | awk {'print $4'})
	done
	sed -i "/$3/d" /etc/mazi/users.log
	echo "$3 $ip $name" >> /etc/mazi/users.log
fi
if [[ $2 == "AP-STA-DISCONNECTED" ]];then
	sed -i "/$3/d" /etc/mazi/users.log
fi
