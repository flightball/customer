#!/bin/sh
mvn clean package -Dmaven.test.skip=true -Pprod
cd target
scp customer.war root@119.23.236.94:/home/apache-tomcat-9.0.19/webapps

