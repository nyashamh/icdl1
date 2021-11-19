data "aws_region" "current" {}

data "aws_subnet" "icdl-south-1-public-1-0" {
  cidr_block = "10.1.1.0/26"
  vpc_id     = local.south-1-vpc_id   
}

data "aws_vpc" "icdl-south-1-network" {
  cidr_block = "10.1.0.0/16"
}