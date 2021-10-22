resource "aws_vpc" "icdl-vpc-euw1" {
    cidr_block = "192.168.0.0/24"
    instance_tenancy = "default"
       tags                             = {
        "Creator" = "hamish@cloud-fundis"
        "Name"    = "icdl-vpc-euw1"
    }

}

#public sun=bnets
resource "aws_subnet" "icdl-pub-0a" {
    #vpc_id = "aws_vpc.icdl-vpc-euw1.id"
    vpc_id = "vpc-00bcaae0d0238926c"
    cidr_block = "192.168.0.0/27"
       tags                            = {
        "Creator" = "hamish@cloud-fundis"
        "Name"    = "icdl-pub-0a"
    }  
}

resource "aws_subnet" "icdl-pub-1b" {
    #vpc_id = "aws_vpc.icdl-vpc-euw1.id"
    vpc_id  = "vpc-00bcaae0d0238926c"
    cidr_block = "192.168.0.32/27"
       tags                            = {
        "Creator" = "nyasha@cloud-fundis"
        "Name"    = "icdl-pub-1b"
    }
  
}

resource "aws_subnet" "icdl-pub-1c" {
    #vpc_id = "aws_vpc.icdl-vpc-euw1.id"
    vpc_id  = "vpc-00bcaae0d0238926c"
    cidr_block = "192.168.0.64/27"
        tags                            = {
        "Creator" = "nyasha@cloud-fundis"
        "Name"    = "icdl-pub-1c"
    }
  
}

#private subnets
resource "aws_subnet" "icdl-pvt-0a" {
    #vpc_id = "aws_vpc.icdl-vpc-euw1.id"
    vpc_id  = "vpc-00bcaae0d0238926c"
    cidr_block = "192.168.0.128/27"
        tags                            = {
        "Creator" = "nyasha@cloud-fundis"
        "Name"    = "icdl-pvt-0a"
    }
  
}

resource "aws_subnet" "icdl-pvt-1b" {
    #vpc_id = "aws_vpc.icdl-vpc-euw1.id"
    vpc_id  = "vpc-00bcaae0d0238926c"
    cidr_block = "192.168.0.192/27"
       tags                            = {
        "Creator" = "nyasha@cloud-fundis"
        "Name"    = "icdl-pvt-1b"
    }
  
}
resource "aws_subnet" "icdl-pvt-1c" {
    #vpc_id = "aws_vpc.icdl-vpc-euw1.id"
    vpc_id  = "vpc-00bcaae0d0238926c"
    cidr_block = "192.168.0.224/27"
       tags                            = {
        "Creator" = "nyasha@cloud-fundis"
        "Name"    = "icdl-pvt-1c"
    }
  
}

resource "aws_nat_gateway" "icdl-nat" {
  #subnet_id = aws_subnet.icdl-pub-0a.id
  subnet_id            = "subnet-0eb00002412889b53"
  allocation_id        = "eipalloc-04c4eaaff88db6af8"

  tags = {
    "Name" = "icdl-nat"
    "Creator" = "nyasha@cloud-fundis"
  }
}

resource "aws_internet_gateway" "icdl-ig" {
  vpc_id = aws_vpc.icdl-vpc-euw1.id
    tags = {
    "Name"= "icdl-ig"
    "Creator" = "nyasha@cloud-fundis"
  }
}
resource "aws_eip" "icdl-eip" {
  vpc = true
  depends_on = [
    aws_nat_gateway.icdl-nat
  ]
  tags = {
    "Name"    = "icdl-eip"
    "Creator" = "nyasha@cloud-fundis"
  }
}
resource "aws_vpc_endpoint" "icdl-endpoint" {
  vpc_id       = aws_vpc.icdl-vpc-euw1.id
  service_name = "com.amazonaws.eu-west-1.s3"
         tags   = {
           "Creator" = "nyasha@cloud-fundis"
           "Name"    = "icdl-endpoint"
        }
}