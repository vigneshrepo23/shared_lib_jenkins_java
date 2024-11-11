def call() {
    sh 'docker run -d -p 8080:8080 --name app $userName/$appName' 
}