pipeline {
    agent { dockerfile true }
    stages {
        stage('Build') {
            steps {
                sh 'mkdir html && cp -r adoc/img html || cp -r adoc/img/* html/img'
                sh 'asciidoctor -D html -r asciidoctor-diagram adoc/index.adoc'
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: true, keepAll: false, reportDir: 'html', reportFiles: 'index.html', reportName: 'Spring-Boot-Tutorial', reportTitles: ''])
            }
        }
    }
}
