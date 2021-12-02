
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

/* import done already 15/11/21
#security groups  fix thi one
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

resource "aws_security_group" "default" {
    description = "default VPC security group"
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
                "172.16.0.0/16",
            ]
            description      = "Allow all traffic from the eu-west region into this subnet"
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
        {
            cidr_blocks      = []
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = true
            to_port          = 0
        },
    ]
    name        = "default"
    tags        = {}
    tags_all    = {}
    vpc_id      = "vpc-05853c0c9f0293771"

    timeouts {}
}

resource "aws_security_group" "OpenVPNAccessServer" { ###this one
    name    = "OpenVPNAccessServer"
}


resource "aws_security_group" "sg_for_ESET" {
    description = "Security Group for the ESET software"
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
                "10.1.0.0/16",
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
        {
            cidr_blocks      = [
                "10.1.0.0/16",
            ]
            description      = ""
            from_port        = 3389
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 3389
        },
    ]
    name        = "sg_for_ESET"
    tags        = {}
    vpc_id      = "vpc-05853c0c9f0293771"

    timeouts {}

}

resource "aws_security_group" "sg_pastel" {
    description = "Pastel POC Security Group"
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
            ]
            description      = ""
            from_port        = 3389
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 3389
        },
    ]
    name        = "sg_pastel"
    tags        = {}
    vpc_id      = "vpc-05853c0c9f0293771"

    timeouts {} 
}

resource "aws_security_group" "sg_windows_server" {
    description = "SG to control access to AD, Pastel and Eset"
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
            ]
            description      = ""
            from_port        = 3389
            ipv6_cidr_blocks = [
                "::/0",
            ]
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 3389
        },
        {
            cidr_blocks      = [
                "172.16.0.0/16",
                "192.168.1.0/24",
                "10.1.1.0/26",
                "10.1.0.0/26",
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
    name        = "sg_windows_server"
    tags        = {}
    tags_all    = {}
    vpc_id      = "vpc-05853c0c9f0293771"

    timeouts {}

}

resource "aws_security_group" "Allow-from-eu-west-to-af-south" {
    description = "Allow from eu-west-1 to af-south-1"
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
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = true
            to_port          = 0
        },
        {
            cidr_blocks      = [
                "10.1.0.0/16",
            ]
            description      = "Allow all traffic from af-south-1 to eu-west"
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    name        = "Allow-from-eu-west-to-af-south"
    tags        = {}
    tags_all    = {}
    vpc_id      = "vpc-0c092d552baffc13d"

    timeouts {}

}

resource "aws_security_group" "sg_ubuntu_cache" {
    description = "Security Group for Ubuntu Cache"
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
                "172.16.0.0/16",
                "192.168.1.0/24",
                "10.1.1.0/26",
                "10.1.0.0/26",
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
    name        = "sg_ubuntu_cache"
    tags        = {}
    tags_all    = {}
    vpc_id      = "vpc-05853c0c9f0293771"

    timeouts {}

}

resource "aws_security_group" "default-cf-SG" {
    name    = "default-cf-SG"
    #vpc_id  = aws_vpc.icdl-za-south-network.id
}
/*
resource "aws_lambda_function" "icdl-south-nat-lambda" {
  filename      = ""
  function_name = ""
  role          = ""
  handler       = ""
}*/


