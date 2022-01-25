module "iam" {
  source = "./iam"
}

module "south-network" {
  source = "./south-network"
  #region = af-south-1
}
module "south-instance" {
  source = "./south-instance"
  #region = af-south-1
}
module "north-network" {
  source = "./north-network"
  #region = eu-west-1
  providers = {
    aws = aws.north
  }

}
module "north-instance" {
  source = "./north-instance"
  #region = eu-west-1
  providers = {
    aws = aws.north
  }

}

module "ecr" {
  source = "./ecr"
  #region = eu-west-1
  providers = {
    aws = aws.north
  }
}

resource "aws_secretsmanager_secret" "github-oauth-token" {
  name = "github-oauth-token"
}

module "north-backend" {
  source = "./north-backend"
  #region = eu-west-1
  providers = {
    aws = aws.north
  }
}

module "codebuild" {
  source = "./codebuild"
  providers = {
    aws = aws.north
  }
}
module "eventbridge" {
  source = "./eventbridge"
  providers = {
    aws = aws.north
  }
}

module "lambda" {
  source = "./lambda"
  providers = {
    aws = aws.north
  }
}

module "sns" {
  source = "./sns"
  providers = {
    aws = aws.north
  }
}

module "tfm-docker" {
  source = "./tfm-docker"
}

module "imports" {
  source = "./imports"
  providers = {
    aws = aws.north
  }
}
