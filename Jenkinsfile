@Library('my_shared_library') _

pipeline {
    agent any
    tools {
        maven 'maven3'
    }
    stages {
        stage ('code compile') {
            steps {
                compile()
            }
        }
        stage ('unit test') {
            steps {
                unitTest()
            }
        }
        stage ('code package') {
            steps {
                codePackage()
            }
        }
        stage ('echo status') {
            steps {
                echo()
            }
        }
    }
}