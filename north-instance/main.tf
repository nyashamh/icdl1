#aws -instance
resource "aws_instance" "ICDL2K12-CRM01" {
    ami                                  = "ami-064a169afbffa8eb0"
    associate_public_ip_address          = false
    availability_zone                    = "eu-west-1b"
    cpu_core_count                       = 2
    cpu_threads_per_core                 = 2
    disable_api_termination              = true
    ebs_optimized                        = true
    get_password_data                    = false
    hibernation                          = false
    iam_instance_profile                 = "RoleForS3AccessFromEc2"
    instance_initiated_shutdown_behavior = "stop"
    instance_type                        = "t3a.xlarge"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    key_name                             = "Hamish-ICDL-eu-west-keypair"
    monitoring                           = false
    private_ip                           = "172.16.2.15"
    secondary_private_ips                = []
    security_groups                      = []
    source_dest_check                    = true
    subnet_id                            = "subnet-0146062e1f9031420"
    tags                                 = {
        "Name"       = "ICDL2K12-CRM01"
        "CreatedBy"  = "terraform"
        "Creator"    = "nyasha@cloud-fundis"
        "Region"     = "Ireland"
    }
    tenancy                              = "default"
    vpc_security_group_ids               = [
        "sg-07fe9673bfb269ba7",
        "sg-0baf45e0b04dcaef9",
    ]

    capacity_reservation_specification {
        capacity_reservation_preference = "open"
    }

    credit_specification {
        cpu_credits = "unlimited"
    }

    enclave_options {
        enabled = false
    }

    metadata_options {
        http_endpoint               = "enabled"
        http_put_response_hop_limit = 1
        http_tokens                 = "optional"
    }

    root_block_device {
        delete_on_termination = false
        encrypted             = false
        iops                  = 900

        tags                  = {
            "Name" = "ICDL2K12-CRM01-disk"
        }

        throughput            = 0
        volume_size           = 300
        volume_type           = "gp2"
    }

    timeouts {}
}


#ami's
resource "aws_ami" "CRM-13-Oct-19-Final"  {
    architecture        = "x86_64"
    description         = "Final working CRM 2011 in the cloud"
    ena_support         = true
    image_location      = "813260210012/CRM-13-Oct-19-Final"
    name                = "CRM-13-Oct-19-Final"
    root_device_name    = "/dev/sda1"
    sriov_net_support   = "simple"

    tags                = {
        "Name"          = "ICDL2K12r2CRM2011"
        "CreatedBy"     = "terraform"
        "Creator"       = "nyasha@cloud-fundis"
        "Region"        = "Ireland"
    }

    virtualization_type = "hvm"

    ebs_block_device {
        delete_on_termination = false
        device_name           = "/dev/sda1"
        encrypted             = false
        iops                  = 0
        snapshot_id           = "snap-03784b345ace3b3fb"
        throughput            = 0
        volume_size           = 150
        volume_type           = "gp2"
    }

    timeouts {}
}

resource "aws_ami" "ICDL2K12-CRM01-0729"  {
    architecture        = "x86_64"
    description         = "Image created of the CRM server before an upgrade"
    ena_support         = true
    image_location      = "813260210012/ICDL2K12-CRM01-0729"
    name                = "ICDL2K12-CRM01-0729"
    root_device_name    = "/dev/sda1"
    sriov_net_support   = "simple"
    tags                = {
        "Name"          = "ICDL2K12-CRM01-BACKUP-0729"
        "CreatedBy"     = "terraform"
        "Creator"       = "nyasha@cloud-fundis"
        "Region"        = "Ireland"
    }

    virtualization_type = "hvm"

    ebs_block_device {
        delete_on_termination = false
        device_name           = "/dev/sda1"
        encrypted             = false
        iops                  = 0
        snapshot_id           = "snap-04849ba698434c909"
        throughput            = 0
        volume_size           = 250
        volume_type           = "gp2"
    }

    timeouts {}
}

#ebs volumes
resource "aws_ebs_volume" "ICDL2K12-CRM01-disk" {
    availability_zone    = "eu-west-1b"
    encrypted            = false
    iops                 = 900
    multi_attach_enabled = false
    size                 = 300
    snapshot_id          = "snap-0f293fce66ef8546a"
    tags                 = {
        "Name"           = "ICDL2K12-CRM01-disk"
        "CreatedBy"      = "terraform"
        "Creator"        = "nyasha@cloud-fundis"
        "Region"         = "Ireland"
    }

    type                 = "gp2"
}

#ebs snapshots
resource "aws_ebs_snapshot" "icdl-za-north-snapshot0" {
    description = "Created by CreateImage(i-0a775b8c631e8ad27) for ami-04eed3ce14b9489ad"
    tags        = {
        "Name"       = "icdl-za-north-snapshot0"
        "CreatedBy"  = "terraform"
        "Creator"    = "nyasha@cloud-fundis"
        "Region"     = "Ireland"
    }

    volume_id   = "vol-01ca741dc26d7c0f9"

    timeouts {}
}

resource "aws_ebs_snapshot" "icdl-za-north-snapshot1" {
    description = "ICDL2K12-CRM01"
    tags        = {
        "Name"         = "icdl-za-north-snapshot1"
        "creator"      = "hamish@cloud-fundis"
        "date-created" = "January2020"
        "TerraformedBy"= "nyasha@cloudfundis.com"
    }
    
    volume_id   = "vol-01ca741dc26d7c0f9"

    timeouts {}
}

resource "aws_ebs_snapshot" "icdl-za-north-snapshot2" {
    description = "Created by CreateImage(i-0a775b8c631e8ad27) for ami-085927201b8b493db from vol-01ca741dc26d7c0f9"
    tags        = {
        "Name"       = "icdl-za-north-snapshot2"
        "CreatedBy"  = "terraform"
        "Creator"    = "nyasha@cloud-fundis"
        "Region"     = "Ireland"
    }

    volume_id   = "vol-01ca741dc26d7c0f9"

    timeouts {}
}

resource "aws_lambda_function" "icdl-lambda" {
    architectures                  = [
        "x86_64",
    ]
    description                    = "A starter AWS Lambda function."
    function_name                  = "StopStartICDLCRM"
    handler                        = "lambda_function.lambda_handler"
    layers                         = []
    memory_size                    = 128
    package_type                   = "Zip"
    reserved_concurrent_executions = -1
    role                           = "arn:aws:iam::813260210012:role/service-role/StopStartICDLCRM-role-bki579o2"
    runtime                        = "python3.7"
    source_code_hash               = "YwcZoelpKbcZTSqyODTo0PfVryHVw4p565H5T7jPGJE="
    tags                           = {
        "lambda-console:blueprint" = "hello-world-python"
        "CreatedBy"                = "terraform"
        "Creator"                  = "nyasha@cloud-fundis"
        "Name"                     = ""
        "Region"                   = "Ireland"
    }
    timeout                        = 3

    timeouts {}

    tracing_config {
        mode = "PassThrough"
    }

}
#security groups
resource "aws_security_group" "VPNAccess" {
    description = "This security group was generated by AWS Marketplace and is based on recommended settings for OpenVPN Access Server version 2.7.5 provided by OpenVPN Inc"
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
            description      = "Allow Anyone to log on"
            from_port        = 943
            ipv6_cidr_blocks = [
                "::/0",
            ]
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
            description      = "Clients use this port to connect"
            from_port        = 1194
            ipv6_cidr_blocks = [
                "::/0",
            ]
            prefix_list_ids  = []
            protocol         = "udp"
            security_groups  = []
            self             = false
            to_port          = 1194
        },
        {
            cidr_blocks      = [
                "156.155.230.109/32",
            ]
            description      = "From Cloud-Fundis office"
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
                "156.155.230.109/32",
            ]
            description      = "Web Admin UI for OpenVPN"
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
                "172.16.2.0/24",
            ]
            description      = "Ping from private network"
            from_port        = -1
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "icmp"
            security_groups  = []
            self             = false
            to_port          = -1
        },
        {
            cidr_blocks      = [
                "172.16.2.13/32",
            ]
            description      = "Allow ssh from bastion"
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
                "197.229.0.68/32",
            ]
            description      = "3G Hostspot"
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
    ]
    name             = "VPNAccess"
    tags             = {
        "Name"       = "icdl-za-north-snapshot2"
        "CreatedBy"  = "terraform"
        "Creator"    = "nyasha@cloud-fundis"
        "Region"     = "Ireland"

    }
    vpc_id      = "vpc-0c092d552baffc13d"

    timeouts {}
}

resource "aws_security_group" "SG-In-Priv-subnet" {
    description = "launch-wizard-1 created 2019-06-19T14:00:32.586+02:00"
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
            description      = "Allow everything from the af-south region"
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
                "172.16.2.13/32",
            ]
            description      = "Allow ssh from bastion"
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
                "172.16.2.13/32",
            ]
            description      = "Ping from the bastion"
            from_port        = -1
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "icmp"
            security_groups  = []
            self             = false
            to_port          = -1
        },
    ]
    name             = "SG-In-Priv-subnet"
    tags             = {
        "Name"       = "SG-In-Priv-subnet"
        "CreatedBy"  = "terraform"
        "Creator"    = "nyasha@cloud-fundis"
        "Region"     = "Ireland"
    }
    vpc_id           = "vpc-0c092d552baffc13d"

    timeouts {}
}

resource "aws_security_group" "Allow-from-af-south-to-eu-west" {
    description = "Allow traffic from af-south-1 to eu-west-1"
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
    name             = "Allow-from-af-south-to-eu-west"
    tags             = {
        "Name"       = "Allow-from-af-south-to-eu-west"
        "CreatedBy"  = "terraform"
        "Creator"    = "nyasha@cloud-fundis"
        "Region"     = "Ireland"
    }
    vpc_id      = "vpc-0c092d552baffc13d"

    timeouts {}
}
