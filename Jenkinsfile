//@Library('mylib') _

pipeline {
    agent {
        label 'agent'
    }
    tools {
        maven 'maven3'
    }
    environment {
        userName='vigneshrepo23'
        imgName='bg'
        scannerHome=tool'scanner'
    }
    stages {
        stage ('clean workspace') {
            steps {
                cleanWs()
            }
        }
        stage ('git checkout') {
            steps {
                git url:'https://github.com/vigneshrepo23/shared_lib_jenkins_java.git', branch:'master'
            }
        }
        stage ('compile') {
            steps {
                sh 'mvn compile'
            }
        }
        stage ('unit test') {
            steps {
                sh 'mvn test'
            }
        }
        stage ('sonar code analysis') {
            steps {
                withSonarQubeEnv('sonarserver') {
                    sh '''
                    $scannerHome/bin/sonar-scanner \
                    -Dsonar.projectName=bg \
                    -Dsonar.projectKey=bgkey \
                    -Dsonar.java.binaries=. 
                    '''
                }
            }
        }
        stage ('code package') {
            steps {
                sh 'mvn package'
            }
        }
        stage ('docker image build') {
            steps {
                sh 'docker build -t $userName/$imgName .'
            }
        }
        stage ('trivy scan') {
            steps {
                sh 'trivy image $userName/$imgName -f table -o image_report'
            }
        }
    }
}