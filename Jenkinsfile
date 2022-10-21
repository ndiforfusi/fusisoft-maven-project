pipeline {
agent any
tools {
    maven 'maven3.8.6'
    }
    stages {
      stage('1. Build with maven') { 
        steps{
          sh "mvn clean package"
         }
       }
      stage('2. Quality analysis with SanaQube') { 
        steps{
          sh "echo 'Testing app with Junit'"
         }
       }
      stage('3. Deploy to a Docker container') {
         steps{
          sh "docker stop fusisoft-webapps;docker rm fusisoft-webapps;docker rmi fusisoft-webapps:1.1.0;docker build -t fusisoft-webapps:1.1.0 .;docker run -itd --name=fusisoft-webapps -p 8085:8080 fusisoft-webapps:1.1.0"
         }
       }
      stage ('4. Email Notification') {
         steps{
         mail bcc: 'fusisoft@gmail.com', body: '''Build is Over. check application on; http://
         Check the website URL for latest changes
         Thanks,
         Fusisoft Technologies,
         +1 (313) 413-1477''', cc: 'fusisoft@gmail.com', from: '', replyTo: '', subject: 'Application was Successfully Deployed!!', to: 'fusisoft@gmail.com'
      }
    }
 }
}



