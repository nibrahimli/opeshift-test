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
                sh 'git clone https://jenkins-token:ZA51h-b5cyBwRFGgdSyP@myapps.extranet.geodis.org/scm/de/applications_mobiles/mobicourse.git'
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
                sh "oc start-build -F openshift-jee-sample-docker --from-file=target/ROOT.war"
            }
        }       
    }
}
