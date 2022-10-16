node
{
def maveHome = tool name: "maven3.8.6"
    stage('1. git clone')
    {
       git url: 'https://github.com/ndiforfusi/fusisoft-maven-project.git'
    }
    
    stage('2. Build')
    {
        sh "${mavenHome}/bin/mvn clean package"

        // bat "mvn clean package"  - for winows OS
    }
    stage('3. Deploy')
    {
         sh "docker build -t fusisoft-webapps:1.1.0 .;docker run -itd --name=fusisoft-webapps -p 8085:8080 fusisoft-webapps:1.1.0"
        
    }
    stage ('4. Email Notification')
    {
     mail bcc: 'fusisoft@gmail.com', body: '''Build is Over
     Thanks,
     Fusisoft Technologies,
    +1 (313) 413-1477''', cc: 'fusisoft@gmail.com', from: '', replyTo: '', subject: 'Build is over!!', to: 'fusisoft@gmail.com'
    }
}

