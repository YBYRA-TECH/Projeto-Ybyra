FROM eclipse-temurin:23-jdk AS build
WORKDIR /app

COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .
RUN chmod +x mvnw && ./mvnw -B dependency:go-offline || true

COPY src src
RUN ./mvnw -B clean package -DskipTests

FROM tomcat:10.1-jdk25-temurin

ENV JAVA_OPTS="-Xmx256m -Xss512k -XX:MaxMetaspaceSize=128m"
ENV CATALINA_OPTS="-Dfile.encoding=UTF-8"

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=build /app/target/YbyraServlet-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]