FROM openjdk:8-jdk-alpine
MAINTAINER Thiago Oliveira <pintowar@gmail.com>

RUN mkdir -p /opt/pbf
WORKDIR /opt/pbf
RUN wget http://download.geofabrik.de/south-america/brazil-latest.osm.pbf

#RUN mkdir -p /tmp/gh-tmp
COPY gh-tmp /tmp/gh-tmp

WORKDIR /opt
ENV GRAPH_OSM_PATH /opt/pbf/brazil-latest.osm.pbf

EXPOSE 8080
ADD app.jar /opt/app.jar
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /opt/app.jar" ]
