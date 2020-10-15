pipeline {
    agent {
            label 'maven'
    }
    stages {
        stage("SCM"){
            steps {
                sh "git clone https://github.com/openshift/openshift-jee-sample.git ."
            }
        }
        stage("Build"){
            steps {
                sh "mvn install -Popenshift -DskipTests=true"
            }
        }
        stage("Package"){
            steps {
                sh "mvn -B -Popenshift package"
            }
        }
        stage("Promote"){
            steps {
                sh "oc start-build -F openshift-jee-sample-docker --from-file=target/ROOT.war"
            }
        }       
    }
}