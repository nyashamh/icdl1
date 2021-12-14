
data "aws_prefix_list" "za-s3" {
    prefix_list_id = aws_vpc_endpoint.icdl-za-s3endpoint.prefix_list_id
}
