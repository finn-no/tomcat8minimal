FROM chriswk/java8minimal

ENV TOMCAT_MAJOR_VERSION 8
ENV TOMCAT_MINOR_VERSION 0
ENV TOMCAT_PATCH_VERSION 27

RUN curl -s http://apache.uib.no/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MAJOR_VERSION}.${TOMCAT_MINOR_VERSION}.${TOMCAT_PATCH_VERSION}/bin/apache-tomcat-${TOMCAT_MAJOR_VERSION}.${TOMCAT_MINOR_VERSION}.${TOMCAT_PATCH_VERSION}.tar.gz\
 | tar -xzf - -C /opt

RUN ln -s /opt/apache-tomcat-${TOMCAT_MAJOR_VERSION}.${TOMCAT_MINOR_VERSION}.${TOMCAT_PATCH_VERSION} /opt/tomcat${TOMCAT_MAJOR_VERSION} &&\
  rm -rf /opt/tomcat${TOMCAT_MAJOR_VERSION}/webapps/ROOT \
        /opt/tomcat${TOMCAT_MAJOR_VERSION}/webapps/docs \
        /opt/tomcat${TOMCAT_MAJOR_VERSION}/webapps/examples \
        /opt/tomcat${TOMCAT_MAJOR_VERSION}/webapps/host-manager \
        /opt/tomcat${TOMCAT_MAJOR_VERSION}/webapps/manager

ENV CATALINA_HOME /opt/tomcat${TOMCAT_MAJOR_VERSION}
ENV PATH ${PATH}:${CATALINA_HOME}/bin
