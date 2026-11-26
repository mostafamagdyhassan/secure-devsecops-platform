# Argo CD GitOps

This directory contains the Argo CD Application definition.

## Deployment flow

1. Jenkins runs tests and security checks.
2. Jenkins builds and scans the container image.
3. The approved image is pushed to AWS ECR.
4. Kubernetes manifests are updated with the approved image tag.
5. Argo CD detects the Git change.
6. Argo CD synchronizes the manifests to the cluster.

## Important

Do not deploy an image by using the `latest` tag.
Use immutable image tags or image digests.

Argo CD must be installed in the target Kubernetes cluster
before applying the Application manifest.
