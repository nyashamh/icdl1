
locals {
  aws_region = "eu-west-1"
  north-1-vpc_id         = "vpc-0c092d552baffc13d"
  north-1-pub-subnet_id = "subnet-057b56235bd001e7d"
  north-1-priv-rt-tbl    = "rtb-09b8aa4a97487c2bc"
  north-1-s3-endpoint    = "vpce-0e32b1da49d9b0f5b"
  south-1-cidr_block     = "10.1.0.0/16"
  peer-to-north-1        = "pcx-0c53b96062c6831fe"
}