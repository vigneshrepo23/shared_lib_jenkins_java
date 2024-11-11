def call() {
    sh 'docker run -d -p 99:8080 --name app $userName/$appName' 
}