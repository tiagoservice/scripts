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
        cp /etc/init/control-alt-delete.conf /root/proteus/jan-fev/control-alt-delete.conf_386
        cat /root/proteus/jan-fev/control-alt-delete.conf_386 |egrep -v "start on control-alt-delete" > /etc/init/control-alt-delete.conf
}

start 2>&1 |egrep -v "for|start|grep|env|cut|echo|\+\+|sed|\[|check|curl|exit"
