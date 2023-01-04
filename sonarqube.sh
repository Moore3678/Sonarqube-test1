#!/bin/bash


####sonarqube installation on centOs 7

## please run this as user Vagrant
user_name= 'whoami'


if [ $user_name != vagrant ];

then

echo "Must run as user vagrant!!!!"
exit

fi

###Java 11 installation

sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y

##downloading Sonarqube

cd /opt
sudo yum install wget unzip -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip

###Extraction of packages
sudo unzip /opt/sonarqube-9.3.0.51899.zip

##Change of ownership

sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64/ 
sudo firewall-cmd --permanent --add-port=9000/tcpcd
sudo firewall-cmd --reload
 ./sonar.sh start

echo "Done installation"