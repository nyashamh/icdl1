
resource "aws_vpc" "icdl-za-north-network" {
  cidr_block                       = "172.16.0.0/16"
  enable_classiclink               = false
  enable_classiclink_dns_support   = false
  enable_dns_hostnames             = true
  enable_dns_support               = true
  instance_tenancy                 = "default"
  tags                             = {
        "CreatedBy" = "terraform"
        "Creator"   = "nyasha@cloud-fundis"
        "Name"      = "icdl-za-north-network"
        "Region"    = "Ireland"
    }
}

#public subnets
resource "aws_subnet" "icdl-za-north-pub-1-0" {
  vpc_id                          = aws_vpc.icdl-za-north-network.id
  cidr_block                      = "172.16.1.0/24"
  assign_ipv6_address_on_creation = false
  availability_zone               = "eu-west-1b"
  map_public_ip_on_launch         = false
    tags                            = {
        "CreatedBy" = "terraform"
        "Creator"   = "nyasaah@cloud-fundis"
        "Name"      = "icdl-za-north-pub-1-0"
        "Region"    = "Ireland"
    }
}

#private subnets
resource "aws_subnet" "ICDL-private-subnet" {
  vpc_id                          = aws_vpc.icdl-za-north-network.id
  cidr_block                      = "172.16.2.0/24"
  assign_ipv6_address_on_creation = false
  availability_zone               = "eu-west-1b"
  map_public_ip_on_launch         = false
  tags                            = {
    "Name"      = "ICDL-private-subnet"
    "CreatedBy" = "terraform"
    "Creator"   = "nyasaah@cloud-fundis"
    "Region"    = "Ireland"
    }

}

#route tables
resource "aws_route_table" "ICDL-default-routing-table" {
    vpc_id                            = aws_vpc.icdl-za-north-network.id
    propagating_vgws                  = []
    route                             = [
        {
            carrier_gateway_id         = ""
            cidr_block                 = "0.0.0.0/0"
            destination_prefix_list_id = ""
            egress_only_gateway_id     = ""
            gateway_id                 = "igw-0cbaa3aae7421ac90"
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
            cidr_block                 = "10.1.0.0/16"
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
        {
            carrier_gateway_id         = ""
            cidr_block                 = "192.168.1.0/24"
            destination_prefix_list_id = ""
            egress_only_gateway_id     = ""
            gateway_id                 = "vgw-08d6781e4479aea48"
            instance_id                = ""
            ipv6_cidr_block            = ""
            local_gateway_id           = ""
            nat_gateway_id             = ""
            network_interface_id       = ""
            transit_gateway_id         = ""
            vpc_endpoint_id            = ""
            vpc_peering_connection_id  = ""
        },
    ]
    tags             = {
        "Name"       = "ICDL-default-routing-table"
        "CreatedBy"  = "terraform"
        "Creator"    = "nyasaah@cloud-fundis"
        "Region"     = "Ireland"
    }
}

resource "aws_route_table" "ICDL-private-subnet-rt-tbl" {
    vpc_id                            = aws_vpc.icdl-za-north-network.id
    propagating_vgws                  = []
    route                             = [
        {
            carrier_gateway_id         = ""
            cidr_block                 = "10.1.0.0/16"
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
    tags             = {
        "Name"       = "ICDL-private-subnet-rt-tbl"
        "CreatedBy"  = "terraform"
        "Creator"    = "nyasaah@cloud-fundis"
        "Region"     = "Ireland"
    }
}

#internet gateway
resource "aws_internet_gateway" "ICDL-temp-IGW" {
    vpc_id = aws_vpc.icdl-za-north-network.id
    tags   ={
      "Name" = "ICDL-temp-IGW"
      "CreatedBy"  = "terraform"
      "Creator"    = "nyasaah@cloud-fundis"
      "Region"     = "Ireland"
    }
}

#aws_vpc_dhcp_options
resource "aws_vpc_dhcp_options" "ICDL-local-DHCP-options" {
    domain_name         = "ICDL.local"
    domain_name_servers = [
        "AmazonProvidedDNS",
    ]
    tags                = {
        "Name"      = "ICDL-local-DHCP-options"
       "CreatedBy"  = "terraform"
       "Creator"    = "nyasaah@cloud-fundis"
       "Region"     = "Ireland"
    }

}
/*
#aws_ec2_managed_prefix_list
resource "aws_ec2_managed_prefix_list" "com.amazonaws.eu-west-1.s3" {

}

resource "aws_ec2_managed_prefix_list" "com.amazonaws.eu-west-1.dynamodb" {

}*/

#enpoints
resource "aws_vpc_endpoint" "icdl-za-endpoint-1" {
    vpc_id                = aws_vpc.icdl-za-north-network.id
    service_name          = "com.amazonaws.eu-west-1.storagegateway"
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
        }
    )
    private_dns_enabled   = true
    route_table_ids       = []
    security_group_ids    = [
        "sg-0522cc2d8eab470a9",
        "sg-0baf45e0b04dcaef9",
    ]
    subnet_ids            = [
        "subnet-0146062e1f9031420",
    ]
    tags                  = {
        "Name"            = "icdl-za-endpoint-1"
        "CreatedBy"       = "terraform"
        "Creator"         = "nyasaah@cloud-fundis"
        "Region"          = "Ireland"
    }
    vpc_endpoint_type     = "Interface"
}

resource "aws_vpc_endpoint" "icdl-za-endpoint-2" {
  vpc_id                 = aws_vpc.icdl-za-north-network.id
  service_name           = "com.amazonaws.eu-west-1.s3"
    policy               = jsonencode(
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
        "rtb-07b00e8bfe5a12ac1",
        "rtb-09b8aa4a97487c2bc",
    ]
    security_group_ids    = []
    subnet_ids            = []
    tags                  = {
        "Name"       = "icdl-za-endpoint-2"
        "CreatedBy"  = "terraform"
        "Creator"    = "nyasaah@cloud-fundis"
        "Region"     = "Ireland"
    }
}

#vpc peering
resource "aws_vpc_peering_connection" "icdl-eu-to-icdl-af" {
    #vpc_id       = aws_vpc.icdl-za-north-network.id
    vpc_id        = local.north-1-vpc_id
    #vpc_id = "vpc-0c092d552baffc13d"
    peer_owner_id = "813260210012"
    peer_region   = "eu-west-1"
    peer_vpc_id   = "vpc-0c092d552baffc13d"
    tags          = {
        "Name"       = "icdl-af-to-icdl-eu"
        "CreatedBy"  = "terraform"
        "Creator"    = "nyasaah@cloud-fundis"
        "Region"     = "Ireland"
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

