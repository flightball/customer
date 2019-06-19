# inspection-customer-server
#阿里云服务器
scp customer.war root@119.23.236.94:/home/apache-tomcat-9.0.19/webapps</br>
#线上环境</br>
mvn clean package -Dmaven.test.skip=true -Pprod</br>
