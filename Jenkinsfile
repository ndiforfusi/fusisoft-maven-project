pipeline {
agent any
    stages {
      stage('1. git clone'){
        when {
            expression {
              BRANCH_NAME == 'main'
            }
          }
        steps{
        git url: 'https://github.com/ndiforfusi/fusisoft-maven-project.git'
       }
      }
    stage('2. Build') { 
      steps{
        sh "mvn clean package"
         }
       }
    stage('3. Deploy') {
       steps{
         sh "docker build -t fusisoft-webapps:1.1.0 .;docker run -itd --name=fusisoft-webapps -p 8085:8080 fusisoft-webapps:1.1.0"
       }
       }
    stage ('4. Email Notification') {
       steps{
         mail bcc: 'fusisoft@gmail.com', body: '''Build is Over
         Thanks,
         Fusisoft Technology,
         +1 (313) 413-1477''', cc: 'fusisoft@gmail.com', from: '', replyTo: '', subject: 'Build is over!!', to: 'fusisoft@gmail.com'
      }
    }
   }
}


