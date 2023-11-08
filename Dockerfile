FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
VOLUME /tmp
COPY target/${VERSION:-"our-book-store-0.0.1-SNAPSHOT.jar"} app.jar
ENTRYPOINT ["java","-jar","app.jar"]
