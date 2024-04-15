FROM gradle:jdk21 as builder
USER root
WORKDIR /builder
ADD . /builder
RUN gradle build

FROM openjdk:21-jdk
WORKDIR /app
EXPOSE 8080
COPY --from=builder /builder/build/libs/kotlin-api-skeleton-0.0.1.jar .
CMD ["java", "-jar", "kotlin-api-skeleton-0.0.1.jar"]

