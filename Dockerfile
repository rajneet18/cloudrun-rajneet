FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD

MAINTAINER Brian Hannaway

COPY pom.xml /build/
COPY src /build/src/

WORKDIR /build/
RUN mvn package
RUN mvn clean install

FROM openjdk:8-jre-alpine

WORKDIR /app

COPY --from=MAVEN_BUILD /build/target/cloudrun-rajneet-0.1.0.jar /app/

ENTRYPOINT ["java", "-jar", "cloudrun-rajneet-0.1.0.jar"]




