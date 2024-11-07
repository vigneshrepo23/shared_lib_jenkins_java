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
                unit_test()
            }
        }
        // stage ('code package') {
        //     steps {
        //         package()
        //     }
        // }
        stage ('echo status') {
            steps {
                echo()
            }
        }
    }
}