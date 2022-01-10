module "codebuild_label" {
  source     = "git::https://github.com/cloudposse/terraform-terraform-label.git"
  namespace  = var.namespace
  stage      = var.stage
  name       = var.name
  attributes = ["codebuild", var.region]
  delimiter  = var.delimiter
  tags       = var.tags
}

resource "aws_s3_bucket" "artifcats" {
  bucket        = "${data.aws_caller_identity.current_account_id.account_id}${var.delimiter}${module.codebuild_label.id}"
  acl           = "private"
  force_destroy = "true"
}

data "aws_iam_policy_document" "codebuild" {
  statement {
    sid     = "TrustPolicy"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "codebuild" {
  name               = module.codebuild_label.id
  assume_role_policy = data.aws_iam_policy_document.codebuild.json
}

resource "aws_iam_role_policy_attachment" "codebuild" {
  count      = length(var.codebuild_iam_policy_arns)
  role       = aws_iam_role.codebuild.name
  policy_arn = var.codebuild_iam_policy_arns[count.index]
}

resource "aws_codebuild_project" "codebuild" {
  name         = module.codebuild_label.id
  description  = var.codebuild_project_description
  service_role = aws_iam_role.codebuild.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = var.codebuild_compute_type
    image        = var.codebuild_image
    type         = var.codebuild_type

    dynamic "environment_variable" {
      for_each = [for v in var.codebuild_env_vars: {
        name  = v.name
        value = v.value
      }]

      content {
        name  = environment_variable.value.name
        value = environment_variable.value.value
      }
    }
  }

  source {
    type = "CODEPIPELINE"
  }
}