https://docs.docker.com/engine/reference/commandline/run/
https://docs.docker.com/engine/reference/builder/

https://hub.docker.com/_/jenkins/

Liste der Plugins:
 https://github.com/fabric8io/jenkins-docker/blob/master/plugins.txt

# jenkins user im System verfügbar und Schreibberechtigung auf /home/jenkins/jenkins_home
sudo useradd jenkins -d /home/jenkins/ -p jenkins
sudo mkdir -p /home/jenkins/jenkins_home
sudo chown jenkins /home/jenkins/jenkins_home
sudo chmod a+wx /home/jenkins/jenkins_home

# Build the image from Dockerfile
sudo docker build --pull=true --no-cache=true -t glsp/jenkins-master .

# Run Jenkins command in a new container
sudo docker run -p 8080:8080 -p 50000:50000 -v /home/jenkins/jenkins_home:/var/jenkins_home --name jenkins-master --env MAVEN_HOME=/opt/maven --env PATH=$PATH:$MAVEN_HOME/bin glsp/jenkins-master



---- Slave ---------
https://wiki.jenkins-ci.org/display/JENKINS/Slave+To+Master+Access+Control

sudo docker run jenkinsci/jnlp-slave -url http://localhost:8080 <secret> <slave name>






