FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD

MAINTAINER Brian Hannaway

COPY pom.xml /build/
COPY src /build/src/

WORKDIR /build/
RUN mvn package
RUN mvn install -DskipTests=false

FROM openjdk:8-jre-alpine

WORKDIR /app

COPY --from=MAVEN_BUILD /build/target/Gcs-1.jar  /app/

ENTRYPOINT ["java", "-jar", "Gcs-1.jar "]

java -jar target/rest-service-0.0.1-SNAPSHOT.jar


