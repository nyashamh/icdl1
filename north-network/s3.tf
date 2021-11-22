
resource "aws_s3_bucket" "bucket0" {
    bucket                      = "icdl-backups"
    hosted_zone_id              = "Z1BKCTXD74EZPE"
    request_payer               = "BucketOwner"
    tags                        = {
        "Creator"   = "nyasha@cloud-fundis"
        "Name"      = "icdl-backups"
        "CreatedBy" = "terraform"
        "Region"    = "Cape Town"
    }

    versioning {
        enabled    = false
        mfa_delete = false
    }
}

resource "aws_s3_bucket" "bucket1" {
    bucket                      = "icdl-presigned"
    hosted_zone_id              = "Z1BKCTXD74EZPE"
    request_payer               = "BucketOwner"
    tags                        = {
        "Creator"   = "nyasha@cloud-fundis"
        "Name"      = "icdl-presigned"
        "CreatedBy" = "terraform"
        "Region"    = "Cape Town"
    }

    versioning {
        enabled    = false
        mfa_delete = false
    }
}

resource "aws_s3_bucket" "bucket2" {
    bucket                      = "icdl.org.za"  
    hosted_zone_id              = "Z1BKCTXD74EZPE"
    request_payer               = "BucketOwner"
    tags                        = {
        "Creator"   = "nyasha@cloud-fundis"
        "Name"      = "icdl.org.za"
        "CreatedBy" = "terraform"
        "Region"    = "Cape Town"
    }

    versioning {
        enabled    = false
        mfa_delete = false
    }
}

resource "aws_s3_bucket" "bucket3" {
    bucket                      = "icdlafrica.org"
    hosted_zone_id              = "Z1BKCTXD74EZPE"
    request_payer               = "BucketOwner"
    tags                        = {
        "Creator"   = "nyasha@cloud-fundis"
        "Name"      = "icdlafrica.org"
        "CreatedBy" = "terraform"
        "Region"    = "Cape Town"
    }

    versioning {
        enabled    = false
        mfa_delete = false
    }
}