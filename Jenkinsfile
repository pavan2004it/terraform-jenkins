pipeline{
    agent any
    stages{
        stage("init") {
            steps {
                sh 'cp /Users/pavankumar/terraform-jenkins/terraform-jenkins/var.auto.tfvars .'
                sh "/usr/local/bin/terraform version"
            }
        }

        stage("apply") {
            steps {
                sh 'terraform apply'
            }
        }
    }
}