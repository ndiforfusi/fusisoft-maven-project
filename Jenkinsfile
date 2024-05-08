pipeline {
 agent { node { label "maven-sonarqube-node" } }
 parameters   {
   string(name: 'aws_account', defaultValue: '322266404742', description: 'aws account hosting image registry')
   string(name: 'ecr_tag', defaultValue: '1.0.0', description: 'aws ecr image tag')
       }
tools {
    maven "Maven-3.9.6"
    }
    stages {
      stage('1. Build with maven') { 
        steps{
          sh "mvn clean package"
         }
       }
      stage('2. SonarQube analysis') {
 //     def scannerHome = tool 'sonar-integration';
 //       steps{
//       withSonarQubeEnv('sonar-integration') { 
 //       withCredentials([string(credentialsId: 'sonar-token', variable: 'sonar-integration')]) {
    // some block
 //       }
        // If you have configured more than one global server connection, you can specify its name
//      sh "${scannerHome}/bin/sonar-scanner"
//       sh "mvn clean verify sonar:sonar \
      steps {
        script {
        def scannerHome = tool 'SonarQube_Scanner-5.0.1';
         withSonarQubeEnv("sonar-integration") {
         sh "${tool("SonarQube_Scanner-5.0.1")}/bin/sonar-scanner -X\
         -D.sonar.projectKey='maven-web-application' \
         -Dsonar.projectName='maven-web-application' \
         -Dsonar.host.url='https://sonar.shiawslab.com' \
         -Dsonar.token='sqp_9e7de9d43df91ec5831d3090a1762e8dd67eae93'"
        }
        }
      }
      }
      stage("3. Quality Gate") {
            steps {
              timeout(time: 1, unit: 'HOURS') {
                waitForQualityGate abortPipeline: true
              }
            }
          }
      stage('4. Docker image build') {
         steps{
          sh "aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 322266404742.dkr.ecr.us-west-2.amazonaws.com"
          sh "docker build -t webapp ."
          sh "docker tag webapp:latest ${params.aws_account}.dkr.ecr.us-west-2.amazonaws.com/webapp:${params.ecr_tag}"
          sh "docker push ${params.aws_account}.dkr.ecr.us-west-2.amazonaws.com/webapp:${params.ecr_tag}"
         }
       }
      stage('5. Deployment into kubernetes cluster') {
         steps{
          sh "kubectl kustomize manifest/kustomization.yaml"
         }
       }

      stage ('. Email Notification') {
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



