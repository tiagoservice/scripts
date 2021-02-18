#! /bin/bash

check()
{ 
    if [ "$1" -eq "0"  ]; then echo "success"; else echo "error"; exit 1; fi
}

start()

{
    set -x
	mkdir -p  /root/proteus/jan-fev
	check $?
	cd /root/proteus/jan-fev
	check $?
	cp /etc/login.defs /root/proteus/jan-fev/login.defs 
	cat /root/proteus/jan-fev/login.defs |egrep -v "PASS_MAX_DAYS" > /etc/login.defs
	echo "#GMUD-409" >> /etc/login.defs
	echo "PASS_MAX_DAYS 30" >> /etc/login.defs
}

start 2>&1 |egrep -v "for|start|grep|env|cut|echo|\+\+|sed|\[|check|curl|exit"
