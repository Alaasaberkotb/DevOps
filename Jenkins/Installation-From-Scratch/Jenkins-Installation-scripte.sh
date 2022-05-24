#!/bin/bash



echo '########################################################
      This script will install Jenkins and run it for you. <3
      ########################################################'
echo

echo 'Would you like to install Java 8 on your system? [y|n]'
read answer

if [ answer = y -o Y ]
then 
     yum install java-1.8.0-openjdk-devel
fi
echo

echo '##########################
      Adding Jenkins repository
      ##########################'
echo      

wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo


echo '############################################################
      Importing the GPG key to ensure your software is legitimate
      ############################################################'
echo

`rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key`

echo '############################################################
      Installing Jenkins
      ############################################################'
echo

yum install jenkins -y

echo
echo '##################################################################################
      Start the Jenkins services and enable them
      #################################################################################'
echo

systemctl start jenkins
systemctl enable jenkins

echo
echo '##################################################################################
      Adding the Jenkins port to firewall
      #################################################################################'
echo


firewall-cmd --permanent --zone=public --add-port=8080/tcp
firewall-cmd --reload


echo "############################################################################
      To Run and Set up Jenkins please go to:

      -------------> http://`hostname -I | awk '{print $1}'`:8080 <-----------

      The Password is: `cat /var/lib/jenkins/secrets/initialAdminPassword`

      ############################################################################"
