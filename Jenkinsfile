pipeline {
    agent any

    environment {
        TF_API_TOKEN = credentials('tfcloud')  // Fetch Terraform Cloud API token from Jenkins
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/git-skg/ace-iac-day-zero.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh """
                terraform init \
                -backend-config="organization=learning_skg" 
                """
            }
        }

        stage('Terraform Plan') {
            steps {
                sh "terraform plan -var='environment=dev'"
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: "Approve to Apply?", ok: "Apply"
                sh "terraform apply -auto-approve -var='environment=dev'"
            }
        }
    }

    post {
        success {
            echo "Terraform applied successfully!"
        }
        failure {
            echo "Terraform failed!"
        }
    }
}
