pipeline {
    agent {
        label 'azure-ubuntu-agent'
    }

	 environment {
        JAVA_TOOL_NAME = 'jdk17' // Adjust the name according to your JDK installation in Jenkins
        MAVEN_TOOL_NAME = 'maven3' // Adjust the name according to your Maven installation in Jenkins
        JAVA_HOME = tool name: "${env.JAVA_TOOL_NAME}", type: 'jdk'
        PATH = "${env.JAVA_HOME}/bin:${env.PATH}"
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
	GITHUB_CREDENTIALS = credentials('github_secrete2')
    }


	 tools {
        maven "${env.MAVEN_TOOL_NAME}"
    }

    stages {
         stage('Checkout') {
            steps {
                // Use the GIT_TOKEN parameter for authentication
                script {
                    // Clone the repository using git with authentication
                    sh "git config --global credential.helper cache"
                    sh "git config --global credential.helper 'cache --timeout=3600'"
                    sh "git clone https://${GITHUB_CREDENTIALS_USR}:${GITHUB_CREDENTIALS_PSW}@github.com/kramsagar/SpringRestServices.git"
                }
            }
        }
        
                stage('Build') {
            steps {
                // Clean and package the application using Maven
                sh 'cd SpringRestServices; mvn clean package'
            }
        }
        
        stage('Test') {
            steps {
                // Run tests
                sh 'cd SpringRestServices ; mvn test'
            }
        }

        stage('Package') {
            steps {
                // Package the application
                sh 'cd SpringRestServices ; mvn package'
            }
        }
         stage('Build Docker Image') {
            steps {
                script {
                    
                        // Build Docker image
                           
                            sh 'cd SpringRestServices; ls -ltr; docker build -t rkayasan44/spingbootapp12:latest .'
                            sh "echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin"
                            sh 'docker push rkayasan44/spingbootapp12:latest'                        

                    
                }
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
