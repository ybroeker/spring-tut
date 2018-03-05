pipeline {
    agent { dockerfile true }
    stages {
        stage('Build') {
            steps {
                sh 'mkdir html && cp -r adoc/img html || cp -r adoc/img/* html/img'
                sh 'asciidoctor -D html -r asciidoctor-diagram adoc/index.adoc'
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: true, keepAll: false, reportDir: 'html', reportFiles: 'index.html', reportName: 'Spring-Boot-Tutorial', reportTitles: ''])

                s3Upload consoleLogLevel: 'INFO', dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'ybroeker.de/spring-boot-tut', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: true, selectedRegion: 'eu-central-1', showDirectlyInBrowser: false, sourceFile: 'html/', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'UNSTABLE', profileName: 'spring-boot-tut-publisher', userMetadata: []


            }
        }
    }
}
