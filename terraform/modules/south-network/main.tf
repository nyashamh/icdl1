resource "aws_vpc" "icdl-za-south-network" {
    cidr_clock = "10.1.0.0/16"
    instance_tenancy = "default"
    tags = {
        "Creator"   = "nyasha@cloud-fundis"
        "Name"      = "icdlza-south-network"
        "CreatedBy" = "terraform"
        "Region"    = "Cape Town"
  }
}

