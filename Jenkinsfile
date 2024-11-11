@Library('my_library') _ 

pipeline {
    agent any
    tools {
        maven 'maven3'
        sonarScanner 'scanner'
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
                    -Dsonar.projectKey=bgproject \                    
                    -Dsonar.projectKey=bgkey \
                    -Dsonar.java.binaries=.                    
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