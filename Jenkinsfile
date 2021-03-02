pipeline{
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        TF_IN_AUTOMATION      = '1'
    }

    stages{
        stage("init") {
            steps {
                sh 'terraform init'
                sh 'terraform plan'
            }
        }

        stage("apply") {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }

        stage("cleanup"){
            steps {
                sh 'terraform destroy -auto-approve'
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