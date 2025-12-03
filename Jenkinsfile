pipeline {
    agent {
        node{
            label 'slave-node'
        }
    }

    environment {
        PATH = "/opt/apache-maven-3.9.11/bin:$PATH"
    }
    stages {
        
         stage('Clone code from GitHub') {
            steps {
                git branch: 'main', url: 'https://github.com/vivek9325/tweet-ttrend.git'
            }
        }
        
        stage('Build Stage') {
            steps {
                sh 'mvn clean deploy'
            }
        }

        stage('SonarQube-Scan') {
            environment{
                scannerHome = tool 'vk-sonar-scanner'
            }

            steps{
                withSonarQubeEnv('vk-sonarqube-server') {
                    sh "${scannerHome}/bin/sonar-scanner"
                }
            }
        }

        stage('Build-Docker-Image') {
            steps {
                script {
                    sh """
                    echo 'Building Docker Image using custom Dockerfile...'
                    docker build -t tweet-ttrend:latest -f /home/ubuntu/jenkins/workspace/_trend_multibranch_pipeline_main/Dockerfile .
                    """
                    }
                }
            }
        
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
    }
}
