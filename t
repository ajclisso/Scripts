#!/bin/bash
#
# Steve Wiggins's Tomcat start/stop command

tomcat="org\.apache.*Bootstrap"

for i in "$@"; do
    if [[ $i == "start" ]]; then
        $TOMCAT_HOME/bin/startup.sh
    elif [[ $i == "stop" ]]; then
        kill -9 $(ps aux | grep $tomcat | awk '{print $2}')
        sleep 5
    elif [[ $i == "restart" ]]; then
        kill -9 $(ps aux | grep $tomcat | awk '{print $2}') &&
            sleep 10
        $TOMCAT_HOME/bin/startup.sh
    elif [[ $i == "clean" ]]; then
        rm -rf $TOMCAT_HOME/webapps/*
        rm -rf $TOMCAT_HOME/work/Catalina/localhost/*
    elif [[ $i == "s" || $i == "status" ]]; then
        ps aux | grep $tomcat
    else
        echo "whachu tryna do"
    fi
done
