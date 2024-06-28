# Use a smaller base image for the final run image
FROM madiva/openjdk17

# Set the working directory
WORKDIR /app

# Copy the packaged jar from the build stage
COPY ./target/*.jar app.jar

# Expose the application port
EXPOSE 8088

# Entry point to run the Spring Boot application
CMD ["java", "-jar", "app.jar"]
