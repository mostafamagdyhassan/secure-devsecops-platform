# AWS Load Balancer Controller Installation

## Prerequisites

- EKS cluster created by Terraform
- AWS CLI configured
- kubectl configured
- Helm installed
- Terraform IAM role created
- Kubernetes service account annotated with the IAM role ARN

## 1. Configure kubectl

```bash
aws eks update-kubeconfig \
  --region me-south-1 \
  --name secure-devsecops-platform-dev-eks
