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
      stage('2. SonarQube analysis') {
//    def scannerHome = tool 'SonarScanner 4.0';
        steps{
        withSonarQubeEnv('sonarqube-8.9.10') { 
        // If you have configured more than one global server connection, you can specify its name
//      sh "${scannerHome}/bin/sonar-scanner"
        sh "mvn sonar:sonar"
        }
        }
       }
      stage('3. Deploy to a Docker container') {
         steps{
          sh "docker stop fusisoft-webapps;docker rm fusisoft-webapps;docker rmi fusisoft-webapps:1.1.0;docker build -t fusisoft-webapps:1.1.0 .;docker run -itd --name=fusisoft-webapps -p 8085:8080 fusisoft-webapps:1.1.0"
         }
       }
      stage ('4. Email Notification') {
         steps{
         mail bcc: 'fusisoft@gmail.com', body: '''Build is Over. check application on. 
         http://3.143.231.151:8085/myapps/
         Check the website URL for latest changes.
         Let me know if the changes look okay.
         Thanks,
         Fusisoft Technologies,
         +1 (313) 413-1477''', cc: 'fusisoft@gmail.com', from: '', replyTo: '', subject: 'Application was Successfully Deployed!!', to: 'fusisoft@gmail.com'
      }
    }
 }
}



