resource "aws_instance" "OpenVPN BYOL" {
     ami           = "ami-0a33e4cabcbb38486"
     instance_type = "t3.micro"
      tags = {
          "Name" = "OpenVPN BYOL"
          "Creator"   = "nyasha@cloud-fundis"
          "Createdby" = "terraform"
          "Region"    = "cape town"
          }
}

resource "aws_instance" "ICDL2K19-DC01" {
     ami           = "ami-0aa317924368277f8"
     instance_type = "t3.micro"
      tags = {
          "Name" = "ICDL2K19-DC01"
          "Creator"   = "nyasha@cloud-fundis"
          "Createdby" = "terraform"
          "Region"    = "cape town"
          }
}

resource "aws_instance" "Ubuntu Cache" {
     ami           = "ami-0d5b85a61c6c618cc"
     instance_type = "t3.micro"
      tags = {
          "Name" = "Ubuntu Cache"
          "Creator"   = "nyasha@cloud-fundis"
          "Createdby" = "terraform"
          "Region"    = "cape town"
          }
}

resource "aws_instance" "ICDL2K19-AV01" {
     ami           = "ami-03c39c9a3184e919d"
     instance_type = "t3.micro"
      tags = {
          "Name" = "ICDL2K19-AV01"
          "Creator"   = "nyasha@cloud-fundis"
          "Createdby" = "terraform"
          "Region"    = "cape town"
          }
}
