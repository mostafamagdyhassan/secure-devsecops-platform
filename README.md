# Secure DevSecOps Platform

A production-oriented DevSecOps platform demonstrating secure software delivery, cloud infrastructure security, Kubernetes hardening, GitOps, observability, and compliance practices.

## Project Goals

- Build a secure application with automated testing
- Implement security gates throughout CI/CD
- Provision AWS infrastructure using Terraform
- Secure container images and dependencies
- Deploy workloads to Kubernetes using GitOps
- Apply Kubernetes security best practices
- Monitor application health and security events
- Map engineering controls to security frameworks

## Architecture

The platform follows a secure software delivery workflow:

1. Developer pushes code to GitHub
2. Jenkins executes the CI/CD pipeline
3. Automated tests and security scans run
4. Container images are built and scanned
5. Approved images are published to Amazon ECR
6. Argo CD deploys approved changes to Kubernetes
7. Prometheus and Grafana monitor the platform

## Technology Stack

| Area | Technologies |
|---|---|
| Application | Python, FastAPI |
| CI/CD | Jenkins |
| Infrastructure as Code | Terraform |
| Containers | Docker |
| Container Registry | Amazon ECR |
| Orchestration | Kubernetes, Amazon EKS |
| GitOps | Argo CD |
| Security | Semgrep, Gitleaks, Checkov, Trivy, OWASP ZAP |
| Monitoring | Prometheus, Grafana, Alertmanager |
| Cloud | AWS |

## Repository Structure

```text
app/              Application source code and tests
terraform/        Cloud infrastructure and security policies
jenkins/         CI/CD pipeline and shared library
kubernetes/      Kubernetes manifests and security policies
gitops/          Argo CD configuration
security/         Security scanning configuration
monitoring/      Metrics, dashboards, and alerting
compliance/       Security framework mappings
docs/             Architecture, threat model, and runbooks
```

## Security Principles

- Least privilege
- Secure-by-default configuration
- Defense in depth
- Automated security testing
- Non-root containers
- Infrastructure as Code
- Secrets management
- Network segmentation
- Continuous monitoring

## Project Status

🚧 Work in progress — development is proceeding incrementally, starting with the application foundation.

## Disclaimer

This project is intended for educational and portfolio demonstration purposes. Production deployment requires environment-specific review, testing, and security validation.
