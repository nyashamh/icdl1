resource "aws_vpc" "icdl-za-north-network" {
  cidr_block = "172.16.0.0/16"
}

#public subnets
resource "aws_subnet" " icdl-za-north-pub-1-0" {
  vpc_id     = aws_vpc.idicdl-za-north-network.id
  cidr_block = "172.16.1.0/24"
}
#private subnets
resource "aws_subnet" "ICDL-private-subnet" {
  vpc_id     = aws_vpc.idicdl-za-north-network.id
  cidr_block = "172.16.2.0/24"
}

#route tables
resource "aws_route_table" "ICDL default-routing table" {
  vpc_id = aws_vpc.idicdl-za-north-network.id
}

resource "aws_route_table" "ICDL-private-subnet-rt-tbl" {
  vpc_id = aws_vpc.idicdl-za-north-network.id
}

#internet gateway
resource "aws_internet_gateway" " ICDL-temp-IGW" {
    vpc_id = aws_vpc.idicdl-za-north-network.id
}

