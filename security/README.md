# Security Tooling

| Tool | Purpose |
|---|---|
| Semgrep | Static Application Security Testing (SAST) |
| Gitleaks | Secret detection |
| Checkov | Infrastructure-as-Code scanning |
| Trivy | Container, dependency, and misconfiguration scanning |
| OWASP ZAP | Dynamic Application Security Testing (DAST) |

## Security workflow

1. Scan application source code.
2. Detect accidentally committed secrets.
3. Scan Terraform and Kubernetes manifests.
4. Build the container image.
5. Scan the image for vulnerabilities.
6. Run an OWASP ZAP baseline scan against a test deployment.
7. Review findings and document remediation.

Security scans should be performed before production deployment.
Do not treat a passing scan as proof that an application is secure.
