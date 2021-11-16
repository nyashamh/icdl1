resource "aws_vpc" "icdl-za-south-network" {
  instance_tenancy = "default"

  tags = {
    "Creator"   = "nyasha@cloud-fundis"
    "Name"      = "icdlza-south-network"
    "CreatedBy" = "terraform"
    "Region"    = "Cape Town"
  }
}

#public subnets
resource "aws_subnet" "icdl-za-south-pub-1-0" {
  vpc_id            = aws_vpc.icdl-za-south-network.id
  cidr_block        = "10.1.1.0/26"
  availability_zone = "af-south-1a"

  tags = {
    "Name"      = "icdl-za-south-pub-1-0"
    "Creator"   = "nyasha@cloud-fundis"
    "Createdby" = "terraform"
    "Region"    = "cape town"
  }
}

resource "aws_subnet" "icdl-za-pub-1-64" {
  vpc_id            = aws_vpc.icdl-za-south-network.id
  cidr_block        = "10.1.1.64/26"
  availability_zone = "af-south-1b"

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

  tags = {
    "Name"      = "icdl-za-pub-1-128  "
    "Creator"   = "nyasha@cloud-fundis"
    "Createdby" = "terraform"
    "Region"    = "cape town"
  }
}

#private subnets

resource "aws_subnet" "icdl-za-priv-0-0" {
  vpc_id            = aws_vpc.icdl-za-south-network.id
  cidr_block        = ""
  availability_zone = "af-south-1a"

  tags = {
    "Name"      = "icdl-za-priv-0-0"
    "Creator"   = "nyasha@cloud-fundis"
    "Createdby" = "terraform"
    "Region"    = "cape town"
  }
}

resource "aws_subnet" "icdl-za-priv-0-64" {
  vpc_id            = aws_vpc.icdl-za-south-network.id
  cidr_block        = "10.1.0.64/26"
  availability_zone = "af-south-1b"

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

  tags = {
    "Name"      = "icdl-za-priv-0-128"
    "Creator"   = "nyasha@cloud-fundis"
    "Createdby" = "terraform"
    "Region"    = "cape town"
  }
}


#route tables X
resource "aws_route_table" "icdl-za-rt-table" {
  vpc_id = aws_vpc.icdl-za-south-network.id

  tags = {
    "Name"      = "icdl-za-rt-table"
    "Creator"   = "nyasha@cloud-fundis"
    "Createdby" = "terraform"
    "Region"    = "cape town"
  }

}

resource "aws_route_table" "icdl-za-pvt-rt-table" {
  vpc_id = aws_vpc.icdl-za-south-network.id

  tags = {
    "Name"      = "icdl-za-pvt-rt-table"
    "Creator"   = "nyasha@cloud-fundis"
    "Createdby" = "terraform"
    "Region"    = "cape town"
  }

}

#internet gateway
resource "aws_internet_gateway" " icdl-za-igw" {
  vpc_id = aws_vpc.icdl-za-south-network.id
  tags = {
    "Name"      = " icdl-za-igw"
    "Creator"   = "nyasha@cloud-fundis"
    "Createdby" = "terraform"
    "Region"    = "cape town"
  }
}

resource "aws_eip" "" {
  instance                  = aws_instance.X.id
  vpc                       = true
  associate_with_private_ip = "10.1.1.11"
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.icdl-za-south-network.id
  service_name = "com.amazonaws.af-south-1.s3"

  tags = {
    "Creator" = "nyasha@cloud-fundis"
    "Reason"  = "Make moving data faster"
  }
}

resource "aws_vpc_peering_connection" "" {
  peer_owner_id = var.peer_owner_id
  peer_vpc_id   = aws_vpc.bar.id
  vpc_id        = aws_vpc.icdl-za-south-network.id
}

resource "aws_network_acl" "X" {
  vpc_id = aws_vpc.icdl-za-south-network.id

  ingress {
    rule_no    = 100
    protocol   = "all"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
  }

  egress {
    rule_no    = 100
    protocol   = "all"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
  }


  /* tags = {
    Name = 
  }*/
}

  resource "aws_security_group" "OpenVPN_Access_Server_SG" {
    name        = "OpenVPN_Access_Server_SG"
    description = "to add"
    vpc_id      = aws_vpc.icdl-za-south-network.id

    ingress {

    }

    egress {

    }
  }
