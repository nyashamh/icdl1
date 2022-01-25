resource "aws_codebuild_project" "icdl-codebuild" {
  name          = "icdl-codebuild"
  description   = "icdl codebiild project "
  #build_timeout = "5"
  service_role  = aws_iam_role.CodeBuildRole.arn
  artifacts {
    type = "NO_ARTIFACTS"
  }
  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "813260210012.dkr.ecr.eu-west-1.amazonaws.com/icdl-north-ecr:latest"  #add current ecr and image 
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "SERVICE_ROLE"

    environment_variable {
      name  = "TF_ACTION"
      value = ""
      type = "PLAINTEXT"
    }
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "icdl-codebuild-log-group"
      status      = "ENABLED"
      stream_name = "icdl-codebuild-log-stream"
    }
  }

  source {
        buildspec           = data.local_file.buildspec_local.content
        git_clone_depth     = 1
        insecure_ssl        = false
        location            = "https://github.com/cloud-fundis/nyasha_terraform_icdl.git"
        report_build_status = false
        type                = "GITHUB"

        git_submodules_config {
            fetch_submodules = false
        }
  }  
  tags = {
    "CreatedBy" = "nyasha@cloud-fundis"
    "Name"      = "icdl-codebuild"
  }       
}
