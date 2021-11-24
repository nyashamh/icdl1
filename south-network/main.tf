resource "aws_vpc" "icdl-za-south-network" {
    assign_generated_ipv6_cidr_block = false
    cidr_block                       = "10.1.0.0/16"
    enable_dns_hostnames             = true
    enable_dns_support               = true
    instance_tenancy                 = "default"

    tags = {
        "Creator"   = "nyasha@cloud-fundis"
        "Name"      = "icdl-za-south-network"
        "CreatedBy" = "terraform"
        "Region"    = "Cape Town"
  }
}

#public subnets
resource "aws_subnet" "icdl-za-south-pub-1-0" {
  vpc_id            = aws_vpc.icdl-za-south-network.id
  cidr_block        = "10.1.1.0/26"
  availability_zone = "af-south-1a"
  assign_ipv6_address_on_creation = false
  map_public_ip_on_launch         = false

  tags = {
    "Name"      = "icdl-za-south-pub-1-0"
    "Creator"   = "nyasha@cloud-fundis"
    "Createdby" = "terraform"
    "Region"    = "cape town"
  }
}

/*
resource "aws_subnet" "icdl-za-pub-1-64" {
  vpc_id            = aws_vpc.icdl-za-south-network.id
  cidr_block        = "10.1.1.64/26"
  availability_zone = "af-south-1b"
  assign_ipv6_address_on_creation = false
  map_public_ip_on_launch         = true

  tags = {
    "Name"      = "icdl-za-pub-1-64"
    "Creator"   = "nyasha@cloud-fundis"
    "Createdby" = "terraform"
    "Region"    = "cape town"
  }
}

resource "aws_subnet" "icdl-za-pub-1-128" {
  vpc_id            = aws_vpc.icdl-za-south-network.id
  cidr_block        = "10.1.1.128/26"
  availability_zone = "af-south-1c"
  assign_ipv6_address_on_creation = false
  map_public_ip_on_launch         = true

  tags = {
    "Name"      = "icdl-za-pub-1-128  "
    "Creator"   = "nyasha@cloud-fundis"
    "Createdby" = "terraform"
    "Region"    = "cape town"
  }
}
*/
#private subnets
resource "aws_subnet" "icdl-za-priv-0-0" {
  vpc_id            = aws_vpc.icdl-za-south-network.id
  cidr_block        = "10.1.0.0/26"
  availability_zone = "af-south-1a"
  assign_ipv6_address_on_creation = false
  map_public_ip_on_launch         = false

  tags = {
    "Name"      = "icdl-za-priv-0-0"
    "Creator"   = "nyasha@cloud-fundis"
    "Createdby" = "terraform"
    "Region"    = "cape town"
  }
}
/*
resource "aws_subnet" "icdl-za-priv-0-64" {
  vpc_id            = aws_vpc.icdl-za-south-network.id
  cidr_block        = "10.1.0.64/26"
  availability_zone = "af-south-1b"
  assign_ipv6_address_on_creation = false
  map_public_ip_on_launch         = false

  tags = {
    "Name"      = "icdl-za-priv-0-64"
    "Creator"   = "nyasha@cloud-fundis"
    "Createdby" = "terraform"
    "Region"    = "cape town"
  }
}

resource "aws_subnet" "icdl-za-priv-0-128" {
  vpc_id            = aws_vpc.icdl-za-south-network.id
  cidr_block        = "10.1.0.128/26"
  availability_zone = "af-south-1c"
    assign_ipv6_address_on_creation = false
  map_public_ip_on_launch         = false

  tags = {
    "Name"      = "icdl-za-priv-0-128"
    "Creator"   = "nyasha@cloud-fundis"
    "Createdby" = "terraform"
    "Region"    = "cape town"
  }
}
*/
#route tables
resource "aws_route_table" "icdl-za-rt-table" {
  vpc_id = aws_vpc.icdl-za-south-network.id
  
  propagating_vgws = []
    route            = [
        {
            carrier_gateway_id         = ""
            cidr_block                 = "0.0.0.0/0"
            destination_prefix_list_id = ""
            egress_only_gateway_id     = ""
            gateway_id                 = "igw-007749bcf2c736f6a"
            instance_id                = ""
            ipv6_cidr_block            = ""
            local_gateway_id           = ""
            nat_gateway_id             = ""
            network_interface_id       = ""
            transit_gateway_id         = ""
            vpc_endpoint_id            = ""
            vpc_peering_connection_id  = ""
        },
        {
            carrier_gateway_id         = ""
            cidr_block                 = "172.16.0.0/16"
            destination_prefix_list_id = ""
            egress_only_gateway_id     = ""
            gateway_id                 = ""
            instance_id                = ""
            ipv6_cidr_block            = ""
            local_gateway_id           = ""
            nat_gateway_id             = ""
            network_interface_id       = ""
            transit_gateway_id         = ""
            vpc_endpoint_id            = ""
            vpc_peering_connection_id  = "pcx-0c53b96062c6831fe"
        },
    ]
  
  tags = {
    "Name"      = "icdl-za-rt-table"
    "Creator"   = "nyasha@cloud-fundis"
    "Createdby" = "terraform"
    "Region"    = "cape town"
  }

}

resource "aws_route_table" "icdl-za-pvt-rt-table" {
  vpc_id = aws_vpc.icdl-za-south-network.id

    propagating_vgws = []
    route            = [
        {
            carrier_gateway_id         = ""
            cidr_block                 = "172.16.0.0/16"
            destination_prefix_list_id = ""
            egress_only_gateway_id     = ""
            gateway_id                 = ""
            instance_id                = ""
            ipv6_cidr_block            = ""
            local_gateway_id           = ""
            nat_gateway_id             = ""
            network_interface_id       = ""
            transit_gateway_id         = ""
            vpc_endpoint_id            = ""
            vpc_peering_connection_id  = "pcx-0c53b96062c6831fe"
        },
    ]
    #nat_gateway_id = aws_nat_gateway.icdl-za-south-nat-gw.id

  tags = {
    "Name"      = "icdl-za-pvt-rt-table"
    "Creator"   = "nyasha@cloud-fundis"
    "Createdby" = "terraform"
    "Region"    = "cape town"
  }

}
/*
#internet gtw
resource "aws_internet_gateway" "icdl-za-igw" {
  vpc_id = aws_vpc.icdl-za-south-network.id

  tags = {
    "Name"      = "icdl-za-igw"
    "Creator"   = "nyasha@cloud-fundis"
    "Createdby" = "terraform"
    "Region"    = "cape town"
  }
}
*/ 

#eip
resource "aws_eip" "icdl-za-south-eip" {
    instance             = "i-07f33411ef414aabe"
    network_border_group = "af-south-1"
    network_interface    = "eni-0815bdcd755b73218"
    public_ipv4_pool     = "amazon"

    vpc                  = true

    timeouts {}

    tags = {
    "Name"      = "icdl-za-south-eip"
    "Creator"   = "nyasha@cloud-fundis"
    "Createdby" = "terraform"
    "Region"    = "cape town"
  }
}

#vpc_endpoint
resource "aws_vpc_endpoint" "icdl-za-s3endpoint" {
  vpc_id       = aws_vpc.icdl-za-south-network.id
  service_name = "com.amazonaws.af-south-1.s3"

    policy                = jsonencode(
        {
            Statement = [
                {
                    Action    = "*"
                    Effect    = "Allow"
                    Principal = "*"
                    Resource  = "*"
                },
            ]
            Version   = "2008-10-17"
        }
    )
    private_dns_enabled   = false
    route_table_ids       = [
        "rtb-00a48c6df4b8ffd38",
        "rtb-0f724982f511d86dd",
    ]
    security_group_ids    = []
    subnet_ids            = []
    tags                  = {
        "Name"    = "icdl-za-s3endpoint"
        "creator" = "nyasha@cloud-fundis"
        "reason"  = "Make moving data faster"
    }
    vpc_endpoint_type     = "Gateway"
}

#vpc peering
resource "aws_vpc_peering_connection" "icdl-af-to-icdl-eu" {
  vpc_id        = aws_vpc.icdl-za-south-network.id
    peer_owner_id = "813260210012"
    peer_region   = "eu-west-1"
    peer_vpc_id   = "vpc-0c092d552baffc13d"
    tags          = {
        "Name"    = "icdl-af-to-icdl-eu"
        "Creator" = "nyasha@cloud-fundis"
        "Createdby"= "terraform"
    }

    accepter {
        allow_classic_link_to_remote_vpc = false
        allow_remote_vpc_dns_resolution  = true
        allow_vpc_to_remote_classic_link = false
    }

    requester {
        allow_classic_link_to_remote_vpc = false
        allow_remote_vpc_dns_resolution  = true
        allow_vpc_to_remote_classic_link = false
    }

    timeouts {}
}

#network acl
resource "aws_network_acl" "icdl-za-network-acl" {
  vpc_id = aws_vpc.icdl-za-south-network.id
      egress     = [
        {
            action          = "allow"
            cidr_block      = "0.0.0.0/0"
            from_port       = 0
            icmp_code       = 0
            icmp_type       = 0
            ipv6_cidr_block = ""
            protocol        = "-1"
            rule_no         = 100
            to_port         = 0
        },
    ]

    ingress    = [
        {
            action          = "allow"
            cidr_block      = "0.0.0.0/0"
            from_port       = 0
            icmp_code       = 0
            icmp_type       = 0
            ipv6_cidr_block = ""
            protocol        = "-1"
            rule_no         = 100
            to_port         = 0
        }
    ]
    subnet_ids = [
        "subnet-0079ed87b2bc005ee",
        "subnet-058d9e91725b55e0d",
        "subnet-0817f27901aa2d887",
        "subnet-09a787cd42ae02ec8",
        "subnet-0b4e65b06a02f3ffa",
        "subnet-0d4d26a43155146e9",
    ]
    tags       = {
        "Name" = "icdl-za-network-acl"
        "Creator" = "nyasha@cloud-fundis"
        "Createdby"= "terraform"
    }
}
/*
resource "aws_network_interface" "icdl-za-south-eni" {
  subnet_id       = aws_subnet.icdl-za-south-pub-1-0.id
  #private_ips     = [""]
  #security_groups = [aws_security_group.OpenVPN_Access_Server_SG.id]

  attachment {
    instance     = aws_instance.OpenVPN-BYOL.id
    device_index = 1
  }
tags             = {
  "Name"         = "icdl-za-south-eni"
  "Creator"      = "nyasha@cloud-fundis"
  "Createdby"    = "terraform"

}
*/
resource "aws_nat_gateway" "icdl-za-south-nat-gw" {
  allocation_id = aws_eip.icdl-za-south-eip.id
  subnet_id     = aws_subnet.icdl-za-south-pub-1-0.id
  tags           = {  
    "Name"         = "icdl-za-south-nat-gw"
    "Creator"      = "nyasha@cloud-fundis"
    "Createdby"    = "terraform"
  }
}

