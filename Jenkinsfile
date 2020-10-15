pipeline {
    agent {
            node {
                label 'maven'
            }
    }
    stages {
        stage("SCM"){
            steps {
                sh "git clone https://github.com/openshift/openshift-jee-sample.git"
            }
        }
        stage("Build"){
            steps {
                sh "mvn -f openshift-jee-sample install -Popenshift -DskipTests=true"
            }
        }
        stage("Package"){
            steps {
                sh "mvn -f openshift-jee-sample -B -Popenshift package"
            }
        }
        stage("Promote"){
            steps {
                sh "oc start-build -F openshift-jee-sample-docker --from-file=openshift-jee-sample/target/ROOT.war"
            }
        }       
    }
}
