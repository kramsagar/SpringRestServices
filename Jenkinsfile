pipeline {
    agent any

    environment {
        JAVA_HOME = tool name: 'jdk-17' // Adjust the name according to your JDK installation in Jenkins
        PATH = "${env.JAVA_HOME}/bin:${env.PATH}"
    }

    tools {
        maven 'maven-3.8.1' // Adjust the name according to your Maven installation in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                // Use the GIT_TOKEN parameter for authentication
                script {
                    // Clone the repository using git with authentication
                    sh "git config --global credential.helper cache"
                    sh "git config --global credential.helper 'cache --timeout=3600'"
                    sh "git clone https://kramsagar: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@github.com/kramsagar/SpringRestServices.git"
                }
            }
        }
        
        stage('Build') {
            steps {
                // Clean and package the application using Maven
                sh 'mvn clean package'
            }
        }
        
        stage('Test') {
            steps {
                // Run tests
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                // Package the application
                sh 'mvn package'
            }
        }
        
        stage('Run') {
            steps {
                // Deploy the application (this step can vary depending on your deployment strategy)
                // Example: Copy the JAR to a server
                // sh 'scp target/*.jar user@yourserver.com:/path/to/deployment/dir'
                sh 'mvn spring-boot:run'
            }
        }
    }

    post {
        success {
            // Notify on success (e.g., via email or Slack)
            echo 'Build and deployment succeeded!'
        }
        failure {
            // Notify on failure (e.g., via email or Slack)
            echo 'Build and deployment failed!'
        }
        cleanup {
            // Clean up workspace directory
            cleanWs()
        }
    }
}
