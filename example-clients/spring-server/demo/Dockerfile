FROM openjdk:8u292-slim
COPY target/demo-0.0.1-SNAPSHOT.war demo.war
ENTRYPOINT [ "java", "-jar", "demo.war" ]