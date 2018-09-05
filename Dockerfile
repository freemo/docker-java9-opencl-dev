FROM florentbenoit/ubuntu_jdk9
RUN sudo apt-get update && sudo apt-get upgrade -y

RUN sudo apt install -y ocl-icd-opencl-dev \
    && sudo apt-get purge --auto-remove -y \
    && sudo apt-get clean

RUN cd /opt/ \
    && sudo wget http://www-eu.apache.org/dist/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz \
    && sudo tar -xf apache-maven-3.5.4-bin.tar.gz \
    && sudo mv apache-maven-3.5.4/ apache-maven/ \
    && echo "export M2_HOME=/opt/apache-maven" >> /home/user/.profile \
    && echo "export MAVEN_HOME=/opt/apache-maven" >> /home/user/.profile \
    && echo "export PATH=${M2_HOME}/bin:${PATH}" >> /home/user/.profile
