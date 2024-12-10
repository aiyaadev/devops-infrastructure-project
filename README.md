# DevOps Infrastructure and CI/CD

## Project Overview
This project implements a complete cloud infrastructure and CI/CD pipeline using AWS services, Terraform, and GitOps principles.

### Technologies Used
- **Infrastructure as Code**: Terraform, Terragrunt
- **Cloud Provider**: AWS
- **Container Orchestration**: Kubernetes (EKS)
- **Auto Scaling**: Karpenter
- **GitOps**: ArgoCD
- **CI/CD**: GitHub Actions
- **Applications**: Node.js
- **Container Registry**: Amazon ECR
- **Security Scanning**: Trivy
- **Notifications**: Google Chat

## Architecture
- VPC with public/private subnets
- VPC Endpoint (S3)
- EKS cluster with Karpenter
- S3 Bucket with IRSA
- RDS Database
- Frontend and Backend applications deployed via Helm

## Project Structure
```
├── infrastructure/
│   ├── vpc/
│   ├── eks/
│   ├── s3/
│   └── rds/
├── modules/
│   ├── vpc/
│   ├── eks/
│   ├── s3/
│   └── rds/
├── kubernetes/
│   ├── argocd/
│   └── helm-charts/
│       ├── frontend/
│       └── backend/
├── src/
│   ├── frontend/
│   └── backend/
└── .github/workflows/
```

## Prerequisites
- AWS Account
- Terraform
- Terragrunt
- kubectl
- helm
- GitHub Account
- Docker

## Setup Instructions

### 1. AWS Infrastructure
```bash
cd infrastructure/vpc
terragrunt init
terragrunt apply

cd ../eks
terragrunt init
terragrunt apply

cd ../s3
terragrunt init
terragrunt apply

cd ../rds
terragrunt init
terragrunt apply
```

### 2. Kubernetes Setup
```bash
aws eks update-kubeconfig --name devops-test-eks --region ap-southeast-1

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

### 3. Application Deployment
```bash
kubectl apply -f kubernetes/argocd/frontend-app.yaml
kubectl apply -f kubernetes/argocd/backend-app.yaml
```

## CI/CD Pipeline
The GitHub Actions workflow includes:
- Automated testing
- Security scanning with Trivy
- Docker image building and pushing to ECR
- Automatic updates to ArgoCD manifests
- Google Chat notifications

## Security Features
- Private VPC with proper subnet isolation
- VPC Endpoint for S3
- IAM Roles for Service Accounts (IRSA)
- Security scanning in CI pipeline
- Private ECR repositories

## Development

### Local Development
```bash
cd src/frontend
npm install
npm start

cd src/backend
npm install
npm start
```

### Creating a New Deployment
1. Create feature branch
2. Make changes
3. Create Pull Request
4. Wait for CI/CD pipeline
5. Merge after approval
