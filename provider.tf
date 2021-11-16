terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  # default region
  profile = "icdl"
  region = "af-south-1"
}

provider "aws" {
  profile = "icdl"
  alias = "north"
  region = "eu-west-1"
}