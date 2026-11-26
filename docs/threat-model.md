
# Threat Model

## Scope

This threat model covers the application, CI/CD pipeline, cloud infrastructure, container registry, and Kubernetes deployment.

## Assets

- Source code
- CI/CD credentials
- Cloud IAM credentials
- Container images
- Application data
- Infrastructure state
- Monitoring data

## Threats

| Threat | Mitigation |
|---|---|
| Secret leakage | Gitleaks and secrets management |
| Vulnerable dependencies | Dependency scanning |
| Malicious source code | SAST and code review |
| Compromised container | Image scanning and signing |
| Excessive permissions | Least-privilege IAM and RBAC |
| Network lateral movement | Kubernetes NetworkPolicies |
| Infrastructure misconfiguration | Terraform scanning and policy checks |
| Unauthorized deployment | Protected branches and deployment controls |

## Review

The threat model will be updated as new components are introduced.
