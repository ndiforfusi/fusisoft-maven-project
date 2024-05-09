pipeline {
 agent { node { label "maven-sonarqube-deploy-node" } }
 parameters   {
   string(name: 'aws_account', defaultValue: '322266404742', description: 'aws account hosting image registry')
   string(name: 'ecr_tag', defaultValue: '1.0.0', description: 'aws ecr image tag')
       }
tools {
    maven "Maven-3.9.6"
    }
    stages {
      stage('1. Git Checkout') {
        steps {
          git branch: 'release', credentialsId: 'github-repo-pat', url: 'https://github.com/ndiforfusi/fusisoft-maven-project.git'
        }
      }
      stage('2. Build with maven') { 
        steps{
          sh "mvn clean package"
         }
       }
      stage('3. SonarQube analysis') {
      environment {SONAR_TOKEN = credentials('sonar-token')}
      steps {
       script {
         def scannerHome = tool 'SonarQube_Scanner-5.0.1';
         withSonarQubeEnv("sonar-integration") {
         sh "${tool("SonarQube_Scanner-5.0.1")}/bin/sonar-scanner -X \
         -Dsonar.projectKey=maven-web-application \
         -Dsonar.projectName='maven-web-application' \
         -Dsonar.host.url=https://sonar.shiawslab.com \
         -Dsonar.token=$SONAR_TOKEN"
        }
        }
      }
      }
      stage('4. Docker image build') {
         steps{
          sh "aws ecr get-login-password --region us-west-2 | sudo docker login --username AWS --password-stdin ${params.aws_account}.dkr.ecr.us-west-2.amazonaws.com"
          sh "sudo docker build -t webapp ."
          sh "sudo docker tag webapp:latest ${params.aws_account}.dkr.ecr.us-west-2.amazonaws.com/webapp:${params.ecr_tag}"
          sh "sudo docker push ${params.aws_account}.dkr.ecr.us-west-2.amazonaws.com/webapp:${params.ecr_tag}"
         }
       }
      stage('5. Deployment into kubernetes cluster') {
        steps{
          kubeconfig(credentialsId: 'k8s-kubeconfig', serverUrl: '') {
          }
          script {
          sh "kubectl apply -f manifest/namespace.yaml"
          sh "kubectl apply -f manifest"
          }
         }
       }

      stage ('6. Email Notification') {
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



