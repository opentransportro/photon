FROM alpine:3.16

RUN apk add --no-cache openjdk17-jre wget
WORKDIR /opt/photon

RUN wget -O - https://download1.graphhopper.com/public/extracts/by-country-code/ro/photon-db-ro-latest.tar.bz2 | bzip2 -cd | tar x
RUN wget -O photon.jar https://github.com/komoot/photon/releases/download/0.4.1/photon-0.4.1.jar
EXPOSE 2322

RUN chmod a+rw -R /opt/photon
USER 1000

CMD ["java", "-jar", "/opt/photon/photon.jar"]
