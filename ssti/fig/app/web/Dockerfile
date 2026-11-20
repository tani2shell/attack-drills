FROM maven:3.8.4-openjdk-17-slim AS builder

WORKDIR /app

COPY . .

ADD https://repo1.maven.org/maven2/ognl/ognl/3.2.12/ognl-3.2.12.jar /usr/local/tomcat/lib/

RUN mvn package

FROM tomcat:9-jdk17-openjdk-slim

COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/
RUN mv /usr/local/tomcat/webapps/struts-example-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

RUN sed -i 's|security.debian.org/debian-security|archive.debian.org/debian-security|g; s|deb.debian.org/debian-security|archive.debian.org/debian-security|g; s|deb.debian.org/debian |archive.debian.org/debian |g; /-updates/d; /-backports/d' /etc/apt/sources.list
RUN apt-get update --allow-releaseinfo-change -y

RUN apt-get install -y curl

RUN --mount=type=secret,id=flag sh -c 'cat /run/secrets/flag > /tmp/flag && chmod 644 /tmp/flag'

EXPOSE 8080
