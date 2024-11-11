def call() {
    sh 'docker build -t $userName/$appName .'
}
