FROM maven:3.8-openjdk-17 as build
WORKDIR /app
COPY pom.xml . 
COPY src ./src
RUN mvn package

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar bg.jar
EXPOSE 8080
CMD ["java", "-jar", "bg.jar"]