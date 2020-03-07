pipeline {
    agent any
    environment {
        CI = 'true'
    }
    stages {
        stage('Deploy') {
            steps {
                echo 'Deploying'
                sh 'docker-compose up -d'
            }
        }
        }

    post {
        always {
            echo 'post_always...'
        }
    }
}