pipeline {
    agent any

    environment {
        CLUSTER_NAME = "my-eks-cluster"
        REGION = "us-west-2"
        NODE_TYPE = "t3.medium"
        NODES = "2"
        MAX_NODES = "3"
        AWS_CREDENTIALS_ID = "aws-creds" // Jenkins AWS credentials ID
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Setup AWS Credentials') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "${env.AWS_CREDENTIALS_ID}"]]) {
                    sh '''
                        echo "✅ AWS credentials configured"
                        aws sts get-caller-identity
                    '''
                }
            }
        }

        stage('Create EKS Cluster') {
            steps {
                sh '''
                    echo "🚀 Creating EKS cluster: $CLUSTER_NAME"
                    eksctl create cluster \
                      --name $CLUSTER_NAME \
                      --region $REGION \
                      --nodegroup-name standard-workers \
                      --node-type $NODE_TYPE \
                      --nodes $NODES \
                      --nodes-max $MAX_NODES \
                      --managed

                    echo "🎉 EKS cluster created successfully!"
                '''
            }
        }

        stage('Update Kubeconfig') {
            steps {
                sh '''
                    aws eks update-kubeconfig --region $REGION --name $CLUSTER_NAME
                    kubectl get nodes
                '''
            }
        }
    }

    post {
        failure {
            echo "❌ Cluster creation failed. Check logs."
        }
        success {
            echo "✅ Cluster setup complete and verified."
        }
    }
}
