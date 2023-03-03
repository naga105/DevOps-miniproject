pipeline {
    agent any 
        stages {
            stage('Build Dockerfile') {
                agent {
                    label 'docker-engine'
                }
                steps {
                    sh 'docker build -t khanhtoan007/miniproject:v1 .'
                }  
            }
            stage('Push Image') {
                agent {
                    label 'docker-engine'
                }
                steps {
                    script {
                        withCredentials([string(credentialsId: 'dockerhub-passwd', variable: 'password')]) {
                            sh 'docker login -u khanhtoan007 -p ${password}'
                            sh 'docker push khanhtoan007/miniproject:v1'
                        }
                    }
                }
            }
            stage('Trigger Ansible') {
                agent {
                    label 'docker-engine'
                }
                steps {
                    build-job: 'deploy-pipeline'
                }
            }
        }
}
