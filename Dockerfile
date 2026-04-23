FROM maven:3.9-eclipse-temurin-21 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM tomcat:9
COPY --from=build target/linguados.war /usr/local/tomcat/webapps/