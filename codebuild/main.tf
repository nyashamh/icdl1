

/*
resource "aws_codebuild_project" "1cdl-codebuild" {
  name          = "1cdl-codebuild"
  description   = "icdl codebiild project for "
  #build_timeout = "5"
  service_role  = aws_iam_role.ivdl-codebuild.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:1.0"  #add docker image
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
      name  = "TF_ACTION"
      value = ""
    }
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "icdl-codebuild-log-group"
      stream_name = "icdl-codebuild-log-stream"
    }
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/cloud-fundis/nyasha_terraform_icdl.git" 
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }
  }

  /*source_version = "main"

  vpc_config {
    vpc_id = aws_vpc.example.id

    subnets = [
      aws_subnet.example1.id,
      aws_subnet.example2.id,
    ]

    security_group_ids = [
      aws_security_group.example1.id,
      aws_security_group.example2.id,
    ]
  }

  tags = {
    Environment = "Test"
  }
}*/

module "build" {
    source = "cloudposse/codebuild/aws"
    name                = "1cdl-codebuild"

    build_image         = "aws/codebuild/standard:2.0" # I need a local image
    build_compute_type  = "BUILD_GENERAL1_SMALL"
    build_timeout       = 60

    privileged_mode     = true
    aws_region          = "eu-west-1"
    aws_account_id      = "813260210012"
    image_repo_name     = "icdl" 
    image_tag           = "latest"

    environment_variables = [{
      name  = "TF_ACTION"
      value = ""
      type = "Plaintext"
    }]
  }

