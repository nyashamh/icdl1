
data "aws_prefix_list" "za-s3" {
    prefix_list_id = aws_vpc_endpoint.icdl-za-s3endpoint.prefix_list_id
}

data "aws_instance" "OpenVPN-BYOL" {
    instance_id = "i-07f33411ef414aabe"
}

data "aws_network_interface" "icdl-south-eni-2" {
    id = "eni-0815bdcd755b73218"
}

data "aws_eip" "icdl-za-eip" {
  id = "eipalloc-0214a896d931068f5"
}

data "aws_subnet" "icdl-za-south-pub-1-0" {
  cidr_block = "10.1.1.0/26"
  vpc_id     = local.south-1-vpc_id

}