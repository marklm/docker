FROM jenkins:2.32.1

COPY plugins.txt /usr/share/jenkins/ref/
#COPY custom.groovy /usr/share/jenkins/ref/init.groovy.d/custom.groovy
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

# get maven 3.3.9 
RUN wget --no-verbose -O /tmp/apache-maven-3.3.9.tar.gz http://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
RUN ls -l /tmp

USER root

# install maven 
RUN tar -xzvf /tmp/apache-maven-3.3.9.tar.gz -C /opt
RUN ln -s /opt/apache-maven-3.3.9 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.3.9-bin.tar.gz
ENV MAVEN_HOME /opt/maven

USER jenkins
ENV MAVEN_HOME $MAVEN_HOME/bin
ENV PATH "$PATH:$MAVEN_HOME"

RUN mvn -version
RUN echo $PATH


