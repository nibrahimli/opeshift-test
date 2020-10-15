pipeline {
    agent {
            label 'maven'
    }
    stages {
        stage("SCM"){
            git branch: 'master', 
                url: 'https://github.com/openshift/openshift-jee-sample.git'
                //  credentialsId: 'myGitCredentialId'
        }
        stage("Build"){
            sh "mvn install -Popenshift -DskipTests=true"
        }
        stage("Package"){
            sh "mvn -B -Popenshift package"
        }       
    }
}