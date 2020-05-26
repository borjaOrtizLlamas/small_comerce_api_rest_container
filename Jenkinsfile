pipeline {
   agent any
   	stages {
        stage('login') {
            steps {
                sh 	"aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 005269061637.dkr.ecr.eu-west-1.amazonaws.com/springbootcrud"
            }
        }
        stage('download') {
            steps {
                dir('shop-proyect-pro') {
                    git credentialsId: 'github_credential', url: 'https://github.com/borjaOrtizLlamas/small_comerce_api_rest.git'
                }
            }
        }

        stage('build') {
            steps {
                dir('shop-proyect-pro') {
                    sh 	"docker build . -t 005269061637.dkr.ecr.eu-west-1.amazonaws.com/small_comerce_api_rest:$TAG"
                }
            }
        }

        stage('push to repository') {
            steps {
                sh 	"docker push 005269061637.dkr.ecr.eu-west-1.amazonaws.com/small_comerce_api_rest:$TAG"
            }
        }
    }
}
