resource "aws_vpc" " icdl-vpc-euw1" {
    cidr_block = "192.168.0.0/24"
    instance_tenancy = "default"

}

#public sun=bnets
resource "aws_subnet" " icdl-pub-0a" {
    vpc_id = "aws_vpc.icdl-vpc-euwl.id"
    cidr_block = "192.168.0.0/27"
  
}

resource "aws_subnet" "icdl-pub-1b" {
    vpc_id = "aws_vpc.icdl-vpc-euw1.id"
    cidr_block = "192.168.0.32/27"
  
}

resource "aws_subnet" "icdl-pub-1c" {
    vpc_id = "aws_vpc.icdl-vpc-euw1.id"
    cidr_block = "192.168.0.32/27"
  
}

#private subnets
resource "aws_subnet" "icdl-pvt-0a" {
    vpc_id = "aws_vpc.icdl-vpc-euw1.id"
    cidr_block = "192.168.0.128/27"
  
}

resource "aws_subnet" "icdl-pvt-1b" {
    vpc_id = "aws_vpc.icdl-vpc-euw1.id"
    cidr_block = "192.168.0.192/27"
  
}
resource "aws_subnet" "icdl-pvt-1c" {
    vpc_id = "aws_vpc.icdl-vpc-euw1.id"
    cidr_block = "192.168.0.224/27"
  
}
