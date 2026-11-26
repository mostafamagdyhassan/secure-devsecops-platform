data "aws_iam_policy_document" "jenkins_ec2_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "jenkins" {
  name               = "${local.name}-jenkins"
  assume_role_policy = data.aws_iam_policy_document.jenkins_ec2_assume_role.json

  tags = local.common_tags
}

data "aws_iam_policy_document" "jenkins_ecr_push" {
  statement {
    sid       = "ECRAuthorization"
    effect    = "Allow"
    actions   = ["ecr:GetAuthorizationToken"]
    resources = ["*"]
  }

  statement {
    sid    = "PushImagesToProjectRepository"
    effect = "Allow"

    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:PutImage",
      "ecr:DescribeRepositories",
      "ecr:DescribeImages"
    ]

    resources = [aws_ecr_repository.app.arn]
  }
}

resource "aws_iam_policy" "jenkins_ecr_push" {
  name   = "${local.name}-jenkins-ecr-push"
  policy = data.aws_iam_policy_document.jenkins_ecr_push.json
}

resource "aws_iam_role_policy_attachment" "jenkins_ecr_push" {
  role       = aws_iam_role.jenkins.name
  policy_arn = aws_iam_policy.jenkins_ecr_push.arn
}

resource "aws_iam_instance_profile" "jenkins" {
  name = "${local.name}-jenkins"
  role = aws_iam_role.jenkins.name
}

output "jenkins_instance_profile_name" {
  value       = aws_iam_instance_profile.jenkins.name
  description = "Instance profile to attach to the Jenkins EC2 instance"
}
