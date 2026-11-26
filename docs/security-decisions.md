
# Security Decisions

## Decision 001: Non-root containers

Application containers run as a non-root user to reduce the impact of container compromise.

## Decision 002: Least privilege

CI/CD workflows and cloud workloads receive only the permissions required for their tasks.

## Decision 003: Automated security checks

Security scanning is integrated into CI to detect vulnerabilities before deployment.

## Decision 004: GitOps deployment

Kubernetes deployment configuration is maintained in Git and reconciled by Argo CD.

## Decision 005: Secrets management

Secrets must not be committed to source control or embedded in container images.
