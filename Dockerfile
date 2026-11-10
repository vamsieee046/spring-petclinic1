FROM maven:3.9.11-eclipse-temurin-17-alpine AS build
ADD . /Appjava
WORKDIR /Appjava
RUN mvn package -DskipTests

FROM eclipse-temurine:25-36-jdk AS runtime
COPY --from=build /Appjava/target/*.jar /devops/spring.jar
WORKDIR /devops
EXPOSE 8080
CMD ["java", "-jar", "spring.jar"]
