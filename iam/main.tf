# iam roles
resource "aws_iam_role" "icdl-backup" {
    assume_role_policy    = jsonencode(
        {
            Statement = [
                {
                    Action    = "sts:AssumeRole"
                    Effect    = "Allow"
                    Principal = {
                        AWS = "arn:aws:iam::813260210012:user/backup_user"
                    }
                },
            ]
            Version   = "2012-10-17"
        }
    )
    description           = "Backup Role"
    force_detach_policies = false
    managed_policy_arns   = [
        "arn:aws:iam::813260210012:policy/icdl-backup-policy",
    ]
    max_session_duration  = 43200
    name                  = "icdl-backup-role"
    path                  = "/"
    tags                  = {
        "creator"         = "hamish@cloud-fundis"
        "TerraformedBy"   = "nyasha@cloud-fundis"
    }
 
    inline_policy {}
}


resource "aws_iam_role" "samba" {
    assume_role_policy    = jsonencode(
        {
            Statement = [
                {
                    Action    = "sts:AssumeRole"
                    Effect    = "Allow"
                    Principal = {
                        AWS = "arn:aws:iam::813260210012:user/backup_user"
                    }
                },
            ]
            Version   = "2012-10-17"
        }
    )
    description           = "A Role to allow the on-premise Samba server to sync changes to the Everyone and other shares to the cloud"
    force_detach_policies = false
    managed_policy_arns   = [
        "arn:aws:iam::813260210012:policy/icdl-backup-policy",
    ]
    max_session_duration  = 43200
    name                  = "icdl-samba-file-gateway"
    path                  = "/"
    tags                  = {
        "creator"         = "hamish@cloud-fundis"
        "reason"          = "sync for the on-prem Samba server"
        "TerraformedBy"   = "nyasha@cloud-fundis"
    }

    inline_policy {} 
}

resource "aws_iam_role" "s3Access" {
    assume_role_policy    = jsonencode(
        {
            Statement = [
                {
                    Action    = "sts:AssumeRole"
                    Effect    = "Allow"
                    Principal = {
                        Service = "ec2.amazonaws.com"
                    }
                },
            ]
            Version   = "2012-10-17"
        }
    )
    description           = "Allows EC2 instances to call AWS services on your behalf."
    force_detach_policies = false
    managed_policy_arns   = [
        "arn:aws:iam::813260210012:policy/icdl-backup-policy",
    ]
    max_session_duration  = 43200
    name                  = "RoleForS3AccessFromEc2"
    path                  = "/"
    tags                  = {
        "creator"         = "hamish@cloud-fundis"
        "TerraformedBy"   = "nyasha@cloud-fundis"
    }

    inline_policy {}
}

resource "aws_iam_role" "StopStartIcdl" {
    assume_role_policy    = jsonencode(
        {
            Statement = [
                {
                    Action    = "sts:AssumeRole"
                    Effect    = "Allow"
                    Principal = {
                        Service = [
                            "ec2.amazonaws.com",
                            "lambda.amazonaws.com",
                        ]
                    }
                },
            ]
            Version   = "2012-10-17"
        }
    )
    force_detach_policies = false
    managed_policy_arns   = [
        "arn:aws:iam::813260210012:policy/service-role/AWSLambdaBasicExecutionRole-5baac8b1-dbca-4b1e-b767-eb5d307d30cb",
    ]
    max_session_duration  = 3600
    name                  = "StopStartICDLCRM-role-bki579o2"
    path                  = "/service-role/"
    tags                  = {
        "creator"         = "hamish@cloud-fundis"
        "TerraformedBy"   = "nyasha@cloud-fundis"

    }

    inline_policy {}
}

#iam users

resource "aws_iam_user" "usr-backup" {
    name      = "backup_user"
    path      = "/"
    tags      = {
        "creator"         = "hamish@cloud-fundis"
        "name"            = "backup user"
        "TerraformedBy"   = "nyasha@cloud-fundis"
    }
}

resource "aws_iam_user" "usr-hamish" {
    name      = "hamish"
    path      = "/"
    tags      = {
        "creator"         = "hamish@cloud-fundis"
        "TerraformedBy"   = "nyasha@cloud-fundis"
    }
}
 
resource "aws_iam_user" "usr-nyasha" {
    name      = "nyasha@cloud-fundis.co.za"
    path      = "/"
    tags      = {
        "Creator"         = "hamish@cloud-fundis"
        "Reason"          = "To be able to Terraform the ICDL infrastructure"
        "TerraformedBy"   = "nyasha@cloud-fundis"
    }
}

resource "aws_iam_user" "usr-pre-signed" {
    name      = "pre-signed-user"
    path      = "/"
    tags      = {
        "creator"         = "hamish@cloud-fundis"
        "TerraformedBy"   = "nyasha@cloud-fundis"
    }
}