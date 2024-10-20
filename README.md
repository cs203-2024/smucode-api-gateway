# smucode-api-gateway

## Overview

This project is the API Gateway for the SMUCode application.
It serves as the entry point for all client requests, routing them to the appropriate microservices.

## Features

- Routes requests to User Service and Tournament Service
- Implements CORS configuration
- Integrates with Eureka for service discovery
- Configurable through environment variables
- Docker support for easy deployment

## Prerequisites

- Java 17
- Maven
- Docker (for containerization)

## Setup and Running

### Local Development

1. Clone the repository:
   ```
   git clone https://github.com/your-repo/smucode-api-gateway.git
   cd smucode-api-gateway
   ```

2. Build the project:
   ```
   mvn clean package
   ```

3. Run the application:
   ```
   java -jar target/smucode-0.0.1-SNAPSHOT.jar
   ```

The API Gateway will start on port 9000 by default.

### Using Docker

1. Build the Docker image:
   ```
   docker build -t smucode-api-gateway .
   ```

2. Run the container:
   ```
   docker run -p 9000:9000 smucode-api-gateway
   ```

## Configuration

The application can be configured using environment variables:

- `USER_SERVICE_URL`: URL of the User Service (default: http://localhost:8080)
- `TOURNAMENT_SERVICE_URL`: URL of the Tournament Service (default: http://localhost:8081)
- `EUREKA_CLIENT_SERVICEURL_DEFAULTZONE`: URL of the Eureka server (default: http://localhost:8761/eureka/)

## API Routes

- `/api/users/**`: Routed to User Service
- `/api/tournaments/**`: Routed to Tournament Service

## CORS Configuration

CORS is configured to allow requests from `http://localhost:3000`. Modify this in `application.yaml` for production use.

## Health Check

A health check endpoint is available at `/actuator/health`.

## Continuous Integration

This project uses GitHub Actions for CI/CD. The workflow builds the application, creates a Docker image, and pushes it to Amazon ECR.
