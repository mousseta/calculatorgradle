FROM openjdk:8-jre
COPY build/libs/* app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
