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

/*
#route tables X
resource "aws_route_table" "icdl-za-rt-table" {
    vpc_id = aws_vpc.icdl-za-south-network.id

    tags = {
        "Name" = "icdl-za-rt-table"
        "Creator" = "nyasha@cloud-fundis"
        "Createdby" = "terraform"
        "Region"   = "cape town"
    }

}

resource "aws_route_table" "icdl-za-pvt-rt-table" {
    vpc_id = aws_vpc.icdl-za-south-network.id

    tags = {
        "Name" = "icdl-za-pvt-rt-table"
        "Creator" = "nyasha@cloud-fundis"
        "Createdby" = "terraform"
        "Region"   = "cape town"
    }

}

#internet gateway
resource "aws_internet_gateway" " icdl-za-igw" {
  vpc_id = aws_vpc.icdl-za-south-network.id
  tags = {
      "Name" = " icdl-za-igw"
      "Creator" = "nyasha@cloud-fundis"
      "Createdby" = "terraform"
      "Region"   = "cape town"
    }
}
*/