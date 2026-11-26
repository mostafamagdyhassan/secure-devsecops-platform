output "ecr_repository_url" {
  description = "Private ECR repository URL"
  value       = aws_ecr_repository.app.repository_url
}

output "ecr_repository_arn" {
  description = "Private ECR repository ARN"
  value       = aws_ecr_repository.app.arn
}
