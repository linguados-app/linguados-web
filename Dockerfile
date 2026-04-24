# ESTÁGIO 1: Build com Maven e Java 21
FROM maven:3.9.6-eclipse-temurin-21 AS build

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos do projeto
COPY . .

# Compila e gera o arquivo .war
RUN mvn clean package -DskipTests

# ESTÁGIO 2: Execução com Tomcat 10 (Necessário para Jakarta EE / Servlet 6.0)
FROM tomcat:10.1-jdk21-temurin

# Limpa as aplicações padrão do Tomcat para evitar conflitos
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia o .war gerado no estágio anterior renomeando para ROOT.war
# Isso faz com que sua app responda em http://localhost:8080/ e não em /linguados/
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expõe a porta padrão
EXPOSE 8080

# Inicia o servidor
CMD ["catalina.sh", "run"]