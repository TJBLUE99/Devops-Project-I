 FROM tomcat
 WORKDIR /usr/local/tomcat/webapps
 COPY /target/pipline.war .
 RUN mv pipline.war ROOT.war
 RUN rm -rf ROOT
 CMD ["catalina.sh", "run"]
