
#instances
resource "aws_instance" "OpenVPN-BYOL" {
     ami           = "ami-0a33e4cabcbb38486"
     instance_type = "t3.micro"
      tags = {
          "Name" = "OpenVPN-BYOL"
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

resource "aws_instance" "Ubuntu-Cache" {
     ami           = "ami-0d5b85a61c6c618cc"
     instance_type = "t3.micro"
      tags = {
          "Name" = "Ubuntu-Cache"
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

#ami's
resource "aws_ami" "Eset-Antivirus" {
    architecture        = "x86_64"
    description         = "Eset Antivurus Image"
    ena_support         = true
    image_location      = "813260210012/Eset Antivirus"
    name                = "Eset Antivirus"
    root_device_name    = "/dev/sda1"
    sriov_net_support   = "simple"
    tags                = {
        "Name" = "Eset-Antivirus"
    }
    virtualization_type = "hvm"

    ebs_block_device {
        delete_on_termination = true
        device_name           = "/dev/sda1"
        encrypted             = false
        iops                  = 0
        snapshot_id           = "snap-0c32c1d834483b7b8"
        throughput            = 0
        volume_size           = 30
        volume_type           = "gp2"
    }

    timeouts {}
}

resource "aws_ami" "ICDL2K19-DC01-BACKUP-0729" {
    architecture        = "x86_64"
    description         = "Image of this server prior to doing updates. 20/July/2021"
    ena_support         = true
    image_location      = "813260210012/ICDL2K19-DC01-0729"
    name                = "ICDL2K19-DC01-0729"
    root_device_name    = "/dev/sda1"
    sriov_net_support   = "simple"
    tags                = {
        "Name" = "ICDL2K19-DC01-BACKUP-0729"
    }
    
    virtualization_type = "hvm"

    ebs_block_device {
        delete_on_termination = false
        device_name           = "/dev/sda1"
        encrypted             = true
        iops                  = 0
        snapshot_id           = "snap-00878c73fa1822756"
        throughput            = 0
        volume_size           = 70
        volume_type           = "gp2"
    }

    timeouts {}
}

resource "aws_ami" "ubuntu-image" {
    architecture        = "x86_64"
    description         = "Copy of the ubuntu machine - the jump box - ubuntu-image"
    ena_support         = true
    image_location      = "813260210012/ubuntu-image"
    name                = "ubuntu-image"
    root_device_name    = "/dev/sda1"
    sriov_net_support   = "simple"

    tags                = {
        "Name" = "ubuntu-image"
    }
    
    virtualization_type = "hvm"

    ebs_block_device {
        delete_on_termination = false
        device_name           = "/dev/sda1"
        encrypted             = false
        iops                  = 0
        snapshot_id           = "snap-02b69c9fa95d0ec07"
        throughput            = 0
        volume_size           = 20
        volume_type           = "gp2"
    }

    timeouts {}
}

resource "aws_ami" "OpenVPN-BYOL" {
    architecture        = "x86_64"
    description         = "OpenVPN BYOL Image"
    ena_support         = true
    image_location      = "813260210012/OpenVPN BYOL"
    name                = "OpenVPN BYOL"
    root_device_name    = "/dev/sda1"
    sriov_net_support   = "simple"
    tags                = {
        "Name" = "OpenVPN-BYOL"
    }

    virtualization_type = "hvm"

    ebs_block_device {
        delete_on_termination = true
        device_name           = "/dev/sda1"
        encrypted             = false
        iops                  = 0
        snapshot_id           = "snap-0615684b41495c328"
        throughput            = 0
        volume_size           = 20
        volume_type           = "gp2"
    }

    timeouts {}
}

resource "aws_ami" "Ubuntu-Cache" {
    architecture        = "x86_64"
    description         = "Ubuntu Cache (Fileshare) Image"
    ena_support         = true
    image_location      = "813260210012/Ubuntu Cache"
    name                = "Ubuntu Cache"
    root_device_name    = "/dev/sda1"
    sriov_net_support   = "simple"
    tags                = {
        "Name" = "Ubuntu-Cache"
    }

    virtualization_type = "hvm"

    ebs_block_device {
        delete_on_termination = true
        device_name           = "/dev/sda1"
        encrypted             = false
        iops                  = 0
        snapshot_id           = "snap-096df5d74403eb942"
        throughput            = 0
        volume_size           = 30
        volume_type           = "gp2"
    }

    timeouts {}
}

resource "aws_ami" "ICDL2K19-DC01-Pastel" {
    architecture        = "x86_64"
    description         = "ICDL Active Directory Server + Pastel 18 + data"
    ena_support         = true
    image_location      = "813260210012/ICDL2K19-DC01-Pastel"
    name                = "ICDL2K19-DC01-Pastel"
    root_device_name    = "/dev/sda1"
    sriov_net_support   = "simple"
    tags                = {
        "Name" = "ICDL2K19-DC01-Pastel"
    }
    virtualization_type = "hvm"

    ebs_block_device {
        delete_on_termination = true
        device_name           = "/dev/sda1"
        encrypted             = true
        iops                  = 0
        snapshot_id           = "snap-0ae0fdbd0d62c1f5b"
        throughput            = 0
        volume_size           = 50
        volume_type           = "gp2"
    }

    timeouts {}
}

# ebs_volumes
resource "aws_ebs_volume" "bastion" {
    availability_zone    = "af-south-1a"
    encrypted            = false
    iops                 = 100
    multi_attach_enabled = false
    size                 = 20
    snapshot_id          = "snap-02b69c9fa95d0ec07"
    tags                 = {
        "Name"           = "bastion"
        "creator"        = "hamish@cloud-fundis"
        "reason"         = "Bastion in new region"
        "TerraformedBy"  = "nyasha@cloud-funis"
    }
     type                = "gp2"
}

resource "aws_ebs_volume" "OpenVPN-disk" {
    availability_zone    = "af-south-1a"
    encrypted            = false
    iops                 = 100
    multi_attach_enabled = false
    size                 = 20
    snapshot_id          = "snap-00f41377613a9d494"
    tags                 = {
        "Name"    = "OpenVPN-disk"
        "creator" = "hamish@cloud-fundis"
        "reason"  = "OpenVPN Access Server"
    }
    type                 = "gp2"
}

resource "aws_ebs_volume" "Windows_Server-AD_Pastel_Eset-disk" {
    availability_zone    = "af-south-1a"
    encrypted            = true
    iops                 = 210
    kms_key_id           = "arn:aws:kms:af-south-1:813260210012:key/264ff20d-5ac8-4b93-a199-48c165327b92"
    multi_attach_enabled = false
    size                 = 70
    snapshot_id          = "snap-08634c1abc0ab2c4e"
    tags                 = {
        "Creator" = "ndafara@cloud-fundis.co.za"
        "Name"    = "Windows_Server-AD_Pastel_Eset-disk"
        "Purpose" = "To run AD, Pastel and Eset"
    }
    type                 = "gp2"
}

resource "aws_ebs_volume" "SharesVolume-disk" {
    availability_zone    = "af-south-1a"
    encrypted            = false
    iops                 = 720
    multi_attach_enabled = false
    size                 = 240
    tags                 = {
        "Name"    = "SharesVolume-disk"
        "creator" = "hamish@cloud-fundis"
    }
    type                 = "gp2"
}

resource "aws_ebs_volume" "Ubuntu_Cache-disk" {
    availability_zone    = "af-south-1a"
    encrypted            = false
    iops                 = 100
    multi_attach_enabled = false
    size                 = 30
    snapshot_id          = "snap-0f4f2bfb70165bbef"
    tags                 = {
        "Creator" = "ndafara@cloud-fundis.co.za"
        "Name"    = "Ubuntu_Cache-disk"
        "Purpose" = "UbuntuCache"
    }
    type                 = "gp2"
}

resource "aws_ebs_volume" "ESETAntiVirus-disk" {
    availability_zone    = "af-south-1a"
    encrypted            = false
    iops                 = 100
    multi_attach_enabled = false
    size                 = 30
    snapshot_id          = "snap-04ee53a3dd52f5005"
    tags                 = {
        "Name"    = "ESETAntiVirus-disk"
        "creator" = "hamish@cloud-fundis"
    }
    type                 = "gp2" 
}

#ebs snapshots
resource "aws_ebs_snapshot" "icdl-za-south-snapshot0" {
    description = "Created by CreateImage(i-01476a11b33a4b2b3) for ami-0d5b85a61c6c618cc from vol-03e88b8a7c6e09a1e"
    tags        = {
        "Name" = "icdl-za-south-snapshot0"
    }
    volume_id   = "vol-03e88b8a7c6e09a1e"
    timeouts {}
}

resource "aws_ebs_snapshot" "icdl-za-south-snapshot1" {
    description = "Created by CreateImage(i-0a19cf5616e3ff1d6) for ami-0de4b5fc23601a94d"
    tags        = {
        "Name" = "icdl-za-south-snapshot1"
    }
    volume_id   = "vol-0a34a9e1d7b1fa0e7"

    timeouts {}
}

resource "aws_ebs_snapshot" "icdl-za-south-snapshot2" {
    description = "Created by CreateImage(i-0a19cf5616e3ff1d6) for ami-03ea0be72ed92e263 from vol-0a34a9e1d7b1fa0e7"
    tags        = {
        "Name" = "icdl-za-south-snapshot2"
    }
    volume_id   = "vol-0a34a9e1d7b1fa0e7"

    timeouts {}
}

resource "aws_ebs_snapshot" "icdl-za-south-snapshot3" {
    description = "Copied for DestinationAmi ami-04ff25332bc840d3d from SourceAmi ami-0aea0af5dd4db7dbf for SourceSnapshot snap-0197b1ff455be2ad6. Task created on 1,587,635,416,745."
    tags        = {
        "Name" = "icdl-za-south-snapshot3"
    }
    volume_id   = "vol-ffffffff"

    timeouts {}
}

resource "aws_ebs_snapshot" "icdl-za-south-snapshot4" {
    description = "Created by CreateImage(i-079912a33481e8728) for ami-02ab4f9dbc7bafbf9"
    tags        = {
        "Name" = "icdl-za-south-snapshot4"
    }
    volume_id   = "vol-04ecaf213f84fd5b3"
    timeouts {}
}

resource "aws_ebs_snapshot" "icdl-za-south-snapshot5" {
    description = "Created by CreateImage(i-079912a33481e8728) for ami-02f32747edc660277 from vol-04ecaf213f84fd5b3"
    tags        = {
        "Name" = "icdl-za-south-snapshot5"
    }
    volume_id   = "vol-04ecaf213f84fd5b3"

    timeouts {}
}

resource "aws_ebs_snapshot" "icdl-za-south-snapshot6" {
    description = "Created by CreateImage(i-079912a33481e8728l) for ami-0277fd5b8865c77be from vol-04ecaf213f84fd5b3"
    tags        = {
        "Name" = "icdl-za-south-snapshot6"
    }
    volume_id   = "vol-04ecaf213f84fd5b3"

    timeouts {}
}

resource "aws_ebs_snapshot" "icdl-za-south-snapshot7" {
    description = "Copied for DestinationAmi ami-0aa317924368277f8 from SourceAmi ami-0c5dd94226daed594 for SourceSnapshot snap-06475bde11ea114b8. Task created on 1,594,658,958,567."
    tags        = {
        "Name" = "icdl-za-south-snapshot7"
    }
    volume_id   = "vol-ffffffff"

    timeouts {}
}

resource "aws_ebs_snapshot" "icdl-za-south-snapshot8" {
    description = "Created by CreateImage(i-0e99043ab6328e846) for ami-0ba7eb336aa97ffc3 from vol-0a62d40990ca2c1cd"
    tags        = {
        "Name" = "icdl-za-south-snapshot8"
    }
    volume_id   = "vol-0a62d40990ca2c1cd"

    timeouts {}
}

resource "aws_ebs_snapshot" "icdl-za-south-snapshot9" {
    description = "Created by CreateImage(i-07f33411ef414aabe) for ami-0dbccb7a0677f6a98 from vol-0202014404183eadd"
    tags        = {
        "Name" = "icdl-za-south-snapshot9"
    }
    volume_id   = "vol-0202014404183eadd"

    timeouts {}
}

resource "aws_ebs_snapshot" "icdl-za-south-snapshot10" {
    description = "Created by CreateImage(i-0689c11a5bb1f6f54) for ami-062d01a7ff216d72c from vol-0a6be54b943b547dd"
    tags        = {
        "Name" = "icdl-za-south-snapshot10"
    }
    volume_id   = "vol-0a6be54b943b547dd"

    timeouts {}
}

resource "aws_security_group" "OpenVPN_Access_Server_SG" {    
  name        = "OpenVPN_Access_Server_SG"
  description = "This SG is for the OpenVPN access server"
  vpc_id      = local.south-1-vpc_id
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    
    ingress     = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
                "156.155.234.32/32",
            ]
            description      = ""
            from_port        = 443
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 443
        },
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 1194
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "udp"
            security_groups  = []
            self             = false
            to_port          = 1194
        },
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 943
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 943
        },
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 945
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 945
        },
    ]

    tags = {
    "Name"      = "OpenVPN_Access_Server_SG"
    "Creator"   = "nyasha@cloud-fundis"
    "Createdby" = "terraform"
    "Region"    = "cape town"
    }
}

resource "aws_security_group" "default" {
    description = "default VPC security group"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = [
                "172.16.0.0/16",
            ]
            description      = "Allow all traffic from the eu-west region into this subnet"
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
        {
            cidr_blocks      = []
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = true
            to_port          = 0
        },
    ]
    name        = "default"
    tags        = {}
    tags_all    = {}
    vpc_id      = "vpc-05853c0c9f0293771"

    timeouts {}
}

resource "aws_security_group" "OpenVPNAccessServer" { 
    name    = "OpenVPNAccessServer"
}


resource "aws_security_group" "sg_for_ESET" {
    description = "Security Group for the ESET software"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = [
                "10.1.0.0/16",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
        {
            cidr_blocks      = [
                "10.1.0.0/16",
            ]
            description      = ""
            from_port        = 3389
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 3389
        },
    ]
    name        = "sg_for_ESET"
    tags        = {}
    vpc_id      = "vpc-05853c0c9f0293771"

    timeouts {}

}

resource "aws_security_group" "sg_pastel" {
    description = "Pastel POC Security Group"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 3389
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 3389
        },
    ]
    name        = "sg_pastel"
    tags        = {}
    vpc_id      = "vpc-05853c0c9f0293771"

    timeouts {} 
}

resource "aws_security_group" "sg_windows_server" {
    description = "SG to control access to AD, Pastel and Eset"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 3389
            ipv6_cidr_blocks = [
                "::/0",
            ]
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 3389
        },
        {
            cidr_blocks      = [
                "172.16.0.0/16",
                "192.168.1.0/24",
                "10.1.1.0/26",
                "10.1.0.0/26",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    name        = "sg_windows_server"
    tags        = {}
    tags_all    = {}
    vpc_id      = "vpc-05853c0c9f0293771"

    timeouts {}

}

resource "aws_security_group" "Allow-from-eu-west-to-af-south" {
    description = "Allow from eu-west-1 to af-south-1"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = true
            to_port          = 0
        },
        {
            cidr_blocks      = [
                "10.1.0.0/16",
            ]
            description      = "Allow all traffic from af-south-1 to eu-west"
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    name        = "Allow-from-eu-west-to-af-south"
    tags        = {}
    tags_all    = {}
    vpc_id      = "vpc-0c092d552baffc13d"

    timeouts {}

}

resource "aws_security_group" "sg_ubuntu_cache" {
    description = "Security Group for Ubuntu Cache"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
        {
            cidr_blocks      = [
                "172.16.0.0/16",
                "192.168.1.0/24",
                "10.1.1.0/26",
                "10.1.0.0/26",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    name        = "sg_ubuntu_cache"
    tags        = {}
    tags_all    = {}
    vpc_id      = "vpc-05853c0c9f0293771"

    timeouts {}

}

resource "aws_security_group" "default-cf-SG" {
    description = "Default SG for CF"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = [
                "105.22.73.14/32",
            ]
            description      = "From the ICDL offices"
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
        {
            cidr_blocks      = [
                "156.155.230.109/32",
            ]
            description      = "From the Cloud Fundis offices"
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
    ]
    name        = "default-cf-SG"
    tags        = {}
    vpc_id      = "vpc-05853c0c9f0293771"

    timeouts {}
    
}
/*
resource "aws_lambda_function" "icdl-south-nat-lambda" {
  filename      = ""
  function_name = ""
  role          = ""
  handler       = ""
}*/

