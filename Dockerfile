 FROM tomcat
 WORKDIR /usr/local/tomcat/webapps
 COPY myapp/target/myapp.war .
 RUN mv myapp.war ROOT.war
 RUN rm -rf ROOT
 CMD ["catalina.sh", "run"]
