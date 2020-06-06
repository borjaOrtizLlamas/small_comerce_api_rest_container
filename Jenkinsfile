pipeline {
   agent any
   	stages {
        stage('login') {
            steps {
                sh 	"aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 005269061637.dkr.ecr.eu-west-1.amazonaws.com/springbootcrud"
            }
        }

        stage('build') {
            steps {
                sh 	"docker build --no-cache . -t 005269061637.dkr.ecr.eu-west-1.amazonaws.com/small_comerce_api_rest:$TAG"
            }
        }

        stage('push to repository') {
            steps {
                sh 	"docker push 005269061637.dkr.ecr.eu-west-1.amazonaws.com/small_comerce_api_rest:$TAG"
            }
        }
    }
}
