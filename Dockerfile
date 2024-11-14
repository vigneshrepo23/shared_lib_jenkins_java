FROM maven:3.9.9-amazoncorretto-8-alpine as build
WORKDIR /app
COPY pom.xml .
COPY /src ./src
RUN mvn package

FROM openjdk:19-jdk-alpine3.15
WORKDIR /app
COPY --from=build target/*jar bg.jar
EXPOSE 8080
CMD [ "java", "-jar", "bg.jar" ]