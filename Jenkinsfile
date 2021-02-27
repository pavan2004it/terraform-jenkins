pipeline{
    agent any
    stages{
        stage("init") {
            steps {
                sh 'cp /Users/pavankumar/terraform-jenkins/terraform-jenkins/var.auto.tfvars .'
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

    post {
    always {
        deleteDir()
        dir("${env.WORKSPACE}@tmp") {
            deleteDir()
        }
        dir("${env.WORKSPACE}@script") {
            deleteDir()
        }
        dir("${env.WORKSPACE}@script@tmp") {
            deleteDir()
        }
    }
}
}