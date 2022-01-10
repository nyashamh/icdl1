resource "aws_eip" "icdl-za-north-eip" {
  #instance = ""
  vpc      = true
}

resource "aws_nat_gateway" "icdl-north-nat-gateway" {
  allocation_id = aws_eip.icdl-za-north-eip.id
  subnet_id     = data.aws_subnet.icdl-north-1-public-1-0.id
 
}

resource "aws_route" "icdl-north-route-nat-gw" {
  route_table_id         = "rtb-09b8aa4a97487c2bc"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.icdl-north-nat-gateway.id
}