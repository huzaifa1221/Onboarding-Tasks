pipeline {
    agent any

    tools {
        jdk 'jdk21'
        maven 'maven'
    }

    stages {

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t hello-world:${BUILD_NUMBER} .'
                sh 'minikube image load hello-world:${BUILD_NUMBER}'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    kubectl config use-context minikube
                    kubectl set image deployment/hello-world \
                        hello-world=hello-world:${BUILD_NUMBER}
                    kubectl rollout status deployment/hello-world
                '''
            }
        }
    }
}
