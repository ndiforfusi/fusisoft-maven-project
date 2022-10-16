pipeline {
agent any
tools {
    maven 'maven-3.8.6'
    }
    stages {
      stage('1. Build') { 
        steps{
          sh "mvn clean package"
         }
       }
      stage('2. Deploy') {
         steps{
          sh "docker build -t fusisoft-webapps:1.1.0 .;docker run -itd --name=fusisoft-webapps -p 8085:8080 fusisoft-webapps:1.1.0"
         }
       }
      stage ('3. Email Notification') {
         steps{
         mail bcc: 'fusisoft@gmail.com', body: '''Build is Over
         Thanks,
         Fusisoft Technology,
         +1 (313) 413-1477''', cc: 'fusisoft@gmail.com', from: '', replyTo: '', subject: 'Build is over!!', to: 'fusisoft@gmail.com'
      }
    }
 }
}



