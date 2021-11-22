
data "aws_region" "current" {}

data "aws_vpc" "icdl-north-1-network" {
    cidr_block = "172.16.0.0/16"
}

data "aws_subnet" "icdl-north-1-public-1-0" {
    cidr_block  = "172.16.1.0/24"
    vpc_id      = local.north-1-vpc_id
}