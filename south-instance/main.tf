/*
#instances
resource "aws_instance" "OpenVPN-BYOL" {
     ami           = "ami-0a33e4cabcbb38486"
     instance_type = "t3.micro"
      tags = {
          "Name" = "OpenVPN-BYOL"
          "Creator"   = "nyasha@cloud-fundis"
          "Createdby" = "terraform"
          "Region"    = "cape town"
          }
}
/*
resource "aws_instance" "ICDL2K19-DC01" {
     ami           = "ami-0aa317924368277f8"
     instance_type = "t3.micro"
      tags = {
          "Name" = "ICDL2K19-DC01"
          "Creator"   = "nyasha@cloud-fundis"
          "Createdby" = "terraform"
          "Region"    = "cape town"
          }
}

resource "aws_instance" "Ubuntu-Cache" {
     ami           = "ami-0d5b85a61c6c618cc"
     instance_type = "t3.micro"
      tags = {
          "Name" = "Ubuntu-Cache"
          "Creator"   = "nyasha@cloud-fundis"
          "Createdby" = "terraform"
          "Region"    = "cape town"
          }
}

resource "aws_instance" "ICDL2K19-AV01" {
     ami           = "ami-03c39c9a3184e919d"
     instance_type = "t3.micro"
      tags = {
          "Name" = "ICDL2K19-AV01"
          "Creator"   = "nyasha@cloud-fundis"
          "Createdby" = "terraform"
          "Region"    = "cape town"
          }
}
*/
/* import done already 15/11/21
#security groups
resource "aws_security_group" "OpenVPN_Access_Server_SG" {
  name        = "OpenVPN_Access_Server_SG"
  description = "This SG is for the OpenVPN access server"
  vpc_id      = local.south-1-vpc_id
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    
    ingress     = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
                "156.155.234.32/32",
            ]
            description      = ""
            from_port        = 443
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 443
        },
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 1194
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "udp"
            security_groups  = []
            self             = false
            to_port          = 1194
        },
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 943
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 943
        },
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 945
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 945
        },
    ]

    tags = {
    "Name"      = "OpenVPN_Access_Server_SG"
    "Creator"   = "nyasha@cloud-fundis"
    "Createdby" = "terraform"
    "Region"    = "cape town"
    }
}*/
/*
resource "aws_security_group" "default" {
    name    = "default"
    vpc_id  = aws_vpc.icdl-za-south-network.id
}
*/
/*
resource "aws_security_group" "OpenVPNAccessServer" {
    name    = "OpenVPNAccessServer"
    vpc_id  = aws_vpc.icdl-za-south-network.id
}

resource "aws_security_group" "sg_for_ESET" {
    name    = "sg_for_ESET"
    vpc_id  = aws_vpc.icdl-za-south-network.id
}

resource "aws_security_group" "sg_windows_server" {
    name    = "sg_windows_server"
    vpc_id  = aws_vpc.icdl-za-south-network.id
}

resource "aws_security_group" "Allow-from-eu-west-to-af-south" {
    name    = "Allow-from-eu-west-to-af-south"
    vpc_id  = aws_vpc.icdl-za-south-network.id
}

resource "aws_security_group" "sg_ubuntu_cache" {
    name    = "sg_ubuntu_cache"
    vpc_id  = aws_vpc.icdl-za-south-network.id
}

resource "aws_security_group" "default-cf-SG" {
    name    = "default-cf-SG"
    vpc_id  = aws_vpc.icdl-za-south-network.id
}*/
/*
resource "aws_lambda_function" "icdl-south-nat-lambda" {
  filename      = ""
  function_name = ""
  role          = ""
  handler       = ""
}*/


