FROM java:8-jdk
## Based on this example http://stackoverflow.com/a/40612088/865222
ENV SONAR_SCANNER_VERSION 3.0.3.778

RUN apt-get update
RUN apt-get install sudo
RUN apt-get install apt-utils -y
RUN apt-get install unzip
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

RUN  wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip && \
    unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION} && \
    cd /usr/bin && ln -s /sonar-scanner-${SONAR_SCANNER_VERSION}/bin/sonar-scanner sonar-scanner && \ 
    ln -s /usr/bin/sonar-scanner-run.sh /bin/gitlab-sonar-scanner

COPY sonar-scanner-run.sh /usr/bin
