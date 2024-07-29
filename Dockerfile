FROM jenkins/jenkins
USER root

#install maven 3.9.7
RUN apt-get update && apt-get install -y wget
RUN  wget --no-verbose https://downloads.apache.org/maven/maven-3/3.9.7/binaries/apache-maven-3.9.7-bin.tar.gz -P /tmp/
RUN tar xzf /tmp/apache-maven-3.9.7-bin.tar.gz -C /opt/
RUN ln -s  /opt/apache-maven-3.9.7 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm /tmp/apache-maven-3.9.7-bin.tar.gz

#permissions
RUN chown jenkins:jenkins /opt/maven;
ENV MAVEN_HOME=/opt/mvn
USER jenkins

