
# Architecture

## Overview

The Secure DevSecOps Platform uses automated security controls throughout the software delivery lifecycle.

## Delivery Flow

1. Developers commit code to GitHub.
2. GitHub Actions validates the application.
3. Jenkins executes the main CI/CD pipeline.
4. Security tools analyze source code, dependencies, infrastructure, and containers.
5. Approved container images are published to Amazon ECR.
6. Argo CD deploys approved manifests to Kubernetes.
7. Prometheus and Grafana provide observability.

## Security Boundaries

- Source code and CI/CD
- Cloud infrastructure
- Container registry
- Kubernetes workloads
- Monitoring and incident response

## Deployment Environments

- Local development
- Development environment
- Production environment
