FROM maven:3.8.1-jdk-17 AS build

# Set the working directory
WORKDIR /app

# Copy the source code into the container
COPY . .

# Package the application
RUN mvn clean package

# Use a smaller base image for the final run image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the packaged jar from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the application port
EXPOSE 8080

# Entry point to run the Spring Boot application
CMD ["java", "-jar", "app.jar"]
