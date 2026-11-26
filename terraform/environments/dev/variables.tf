variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "me-south-1"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name used in resource naming"
  type        = string
  default     = "secure-devsecops-platform"
}
