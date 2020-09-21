FROM maven:3.6.3-jdk-15

MAINTAINER Stephan Krusche <krusche@in.tum.de>

#install git
RUN yum install wget make curl-devel expat-devel gettext-devel openssl-devel zlib-devel -y && yum install gcc perl-ExtUtils-MakeMaker -y && yum remove git -y

RUN cd /usr/src && wget https://www.kernel.org/pub/software/scm/git/git-2.29.0.tar.gz && tar xzf git-2.29.0.tar.gz && cd git-2.29.0 && make prefix=/usr/local all && make prefix=/usr/local install && git --version && rm -rf /usr/src/git-2.29.0.tar.gz && rm -rf /usr/src/git-2.29.0

ADD artemis-java-template /opt/artemis-java-template

RUN cd /opt/artemis-java-template && pwd && ls -la && mvn clean install test

RUN rm -rf /opt/artemis-java-template

ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]

CMD ["mvn"]