# Build stage
FROM maven:3.9.11-eclipse-temurin-21 AS build

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src ./src

RUN mvn clean package -DskipTests

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "./target/hello-world-1.0.jar"]
