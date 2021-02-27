pipeline{
    agent any
    stages{
        stage("init") {
            steps {
                sh 'cp /Users/pavankumar/terraform-jenkins/terraform-jenkins/var.auto.tfvars'
                sh 'terraform init'
                sh 'terraform plan'
            }
        }

        stage("apply") {
            steps {
                sh 'terraform apply'
            }
        }
    }
}