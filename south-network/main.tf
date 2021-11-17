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