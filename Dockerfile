FROM eclipse-temurin:17-jre-jammy

# Add a non-root user
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
RUN groupadd -r spring && useradd -r -g spring spring

WORKDIR /app

COPY target/smucode-0.0.1-SNAPSHOT.jar smucode-api-gateway.jar

# Set ownership to the non-root user
RUN chown -R spring:spring /app

USER spring

EXPOSE 9000

HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget -q --spider http://localhost:9000/actuator/health || exit 1

ENTRYPOINT ["java", "-jar", "smucode-api-gateway.jar"]