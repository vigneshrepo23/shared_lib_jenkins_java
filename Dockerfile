FROM maven:3.8-openjdk-17 as build
WORKDIR /app
COPY pom.xml . 
COPY src .
RUN mvn package

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar bg.jar
EXPOSE 80
CMD ["java", "-jar", "bg.jar"]