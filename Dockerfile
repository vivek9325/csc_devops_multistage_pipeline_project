FROM eclipse-temurin:17-jdk-alpine
ADD jarstaging/com/valaxy/demo-workshop/2.1.2/demo-workshop-2.1.2.jar demo-workshop.jar
ENTRYPOINT [ "java", "-jar", "demo-workshop.jar" ]