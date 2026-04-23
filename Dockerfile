FROM maven:3.9-eclipse-temurin-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM tomcat:9
COPY --from=build target/app.war /usr/local/tomcat/webapps/