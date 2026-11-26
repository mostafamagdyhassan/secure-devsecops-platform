# Deployment Runbook

## Prerequisites

- AWS CLI configured with appropriate permissions
- Docker installed
- kubectl configured for the target cluster
- Terraform installed
- Argo CD installed in the cluster

## Deployment process

1. Run application tests.
2. Run Semgrep and Gitleaks.
3. Run Checkov against Terraform and Kubernetes.
4. Build the Docker image.
5. Scan the image with Trivy.
6. Push the approved image to ECR.
7. Update the Kubernetes deployment image reference.
8. Commit and push the manifest change.
9. Allow Argo CD to synchronize the application.
10. Verify application health and monitoring.

## Verification

```bash
kubectl get pods -n secure-app
kubectl get services -n secure-app
kubectl rollout status deployment/secure-devsecops-platform -n secure-app
kubectl logs deployment/secure-devsecops-platform -n secure-app
