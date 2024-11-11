@Library('my_library') _ 

pipeline {
    agent any
    tools {
        maven 'maven3'
        sonarQubeScanner 'scanner'
    }
    environment {
        userName = 'vigneshrepo23'
        appName = 'bg'
    }
    stages {
        stage ('code compile') {
            steps {
                code_compile()
            }
        }
        stage ('unit testing') {
            steps {
                unit_test()
            }
        }
        stage ('sonar code analysis') {
            steps {
                withSonarQubeEnv('sonarserver') {
                    sh '''
                    sonar-scanner \
                    -Dsonar.projectName=bgproject \
                    -Dsonar.projectKey=bgkey \
                    -Dsonar.java.binaries=target/classes
                    '''
                }
            }
        }
        stage ('code package') {
            steps {
                code_package()
            }
        }
    }
}