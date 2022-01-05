terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
    docker = {
      source = "kreuzwerker/docker"
      #version = "2.15.0"
    }

    goodle = {
      source = "hashicorp/google"
    }

    random = {
      source = "hashicorp/random"
    }

  }
  #1.0
  required_version = ">= 0.15.0"
}

provider "aws" {
  # default region
  profile = "icdl-prod"
  region  = "af-south-1"
}

provider "docker" {
  # default region
  profile = "icdl-prod"
  region  = "af-south-1"
}

provider "aws" {
  profile = "icdl-prod"
  alias   = "north"
  region  = "eu-west-1"
}
