#!/bin/bash
# Run Jenkins command in a new container
sudo docker run -p 8080:8080 -p 50000:50000 -v /home/jenkins/jenkins_home:/var/jenkins_home --name jenkins-master --env MAVEN_HOME=/opt/maven --env PATH=$PATH:$MAVEN_HOME/bin glsp/jenkins-master
