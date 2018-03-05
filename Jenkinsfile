pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                sh 'git submodule init'
                sh 'git submodule update'
            }
        }
        stage('Build') {
            agent { dockerfile true }
            steps {
                sh 'mkdir html && cp -r adoc/img html || cp -r adoc/img/* html/img'
                sh 'asciidoctor -D html -r asciidoctor-diagram adoc/index_adoc.adoc'
                archiveArtifacts artifacts: 'html/', fingerprint: true
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'html/', fingerprint: true
        }
    }
}
